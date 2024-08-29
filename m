Return-Path: <linux-arm-msm+bounces-29951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCD9640AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56DC61F21935
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0111662E8;
	Thu, 29 Aug 2024 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOTOS+/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A118C02F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925389; cv=none; b=DmVyavEMbA02Wv06F3/ac6iB7NJ1dquTsEQhr2P3wX6c208gDamUYjUc0XDryVsG7/ONoA6ELAD7nZEBVuAblx+RTiubMFp7rx0l7CVfW44kY451EH3b2DReiRRoWaJ6wadfpo9MXkjkLRx/mDEzvdWQEKlwEHzz7ApCfBjRJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925389; c=relaxed/simple;
	bh=z/jroExPu4YiG7hYt2JF3nZu8rG4QlkWnpSlweE7RM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIY6W+uUR6suGUoWyyoMIiHkSfnRZJHCDOp3SAUKV04euYN7b8OHWiUU1Bq+1LpgwsfCJqwHXXsWIXXX+v5gBtBio1TcqnwJl1b7cxFnux8IB9KJS3EbNwt9lsy53vcNzo20VvH5Hw9ACxgkMHpQsAJ9mbAQqWazxnZWe5tuDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOTOS+/L; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a843bef98so37770666b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925386; x=1725530186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPwwTaDN9yKO85WUsV52EH69A6ZWar7hV1r+9P2rJyw=;
        b=GOTOS+/Ljok9CZ6LFWNbEH4QxDpf9oYkkbonGFy7WXqSQ6C9O1UQlZ35q00OqqOKFL
         Fo/5bj5LUUlMbCCtjH/TuXpxFBPNsqyZ47xB40tzoeKeQkbwvCxBtgQM+j7ZrZrdTcp7
         ZYkR1XnVY3PhGlJbPixsWV5kbSxV9PnR+uNUTrhrFdM249I0TWywr0ezEo3QjbchzipU
         y44Gp1eHsk2no1so/6YFwvmoOvF5HGTBI0s4C2n65SUVTZoBLu3pSyfJ9FnjEGS29McM
         a/LqXvNpmmpXV3EKcwT8uKTQAPOswUAbHHJt0qJrwdOm6aRg8ArODVk+Vd+8H/wo9MGB
         +Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925386; x=1725530186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPwwTaDN9yKO85WUsV52EH69A6ZWar7hV1r+9P2rJyw=;
        b=uG+2f2hXUBiggjwAAiytZTvDTnDHk94ClYQgfLMQMs2vzMLdz5w9fteojyZTRFMLmX
         ta14YNTnohbiQ+JmHK6NJjSu4jVZQdEVISF4U6lpNiBGLO041EbvLz/150H9jUFBwpjp
         g4aQVxPXfACwX3ibr3YfBsMCzsIyfgywItMzsCOUM+4I5gfu63oMMuDNxkJ1sEC6y3Cq
         zP2Vp2AVvfEW8Ft622c4vYy7J3nQ018r/ACHcNcB92KYoHjLXhX3JgtayKwxws2SxnDk
         FKvdxXig6r0y9RqCpOX7Vy60yN3t9iSVZ+CEZIlqjZYEAxrE3zLtxWExnthcp0+YqP8R
         CKOw==
X-Forwarded-Encrypted: i=1; AJvYcCXB8vmG1HL5fkbZJCigNwVTrgT8aCqCZfTiTOKX+I3kTCS35VUCGtqRzKRad3rDz75b9IpXKuqZTTsUG6CR@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNDqq/ZhA8dnnCvg7PPDqSu4O5lu+MDFObAhukztPRyL/rCyq
	PiVMovIgGsGkYSfz2p4XPHLw4ZREOWLJtRPuweEOMRF1EX2NFsq410yC4VGeteY=
X-Google-Smtp-Source: AGHT+IGr0oeGiZdteJWxwu1jGClZTGeR0UcOOGLomISMDiee6bl0lKq9+ap6M1FyMmpePXIzgF709w==
X-Received: by 2002:a17:907:2cc3:b0:a77:dde0:d669 with SMTP id a640c23a62f3a-a897fa6bb24mr167808066b.45.1724925386185;
        Thu, 29 Aug 2024 02:56:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d698bsm58087766b.145.2024.08.29.02.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 02:56:25 -0700 (PDT)
Message-ID: <9eed39f3-baf3-41cb-bd19-361d76207b09@linaro.org>
Date: Thu, 29 Aug 2024 10:56:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> This Series adds support to share QUP based I2C SE between subsystems.
> Each subsystem should have its own GPII which interacts between SE and
> GSI DMA HW engine.

What is SE ?

GPII - general purpose interrupt ... ?

You have too many acronyms here, which makes reading and understanding 
your cover letter a bit hard.

Please define at least the term SE in your cover letter and in your patch.

In the patch you use the term TRE which without diving into the code I 
vaguely remember is a register..

- GPII
- GSI
- SE
- TRE

Need to be defined to make what's going on in this series more "grokable".

A cover letter should assume a reviewer is familiar with the basics of a 
system - no need to define what I2C is but, similarly shouldn't assume a 
reviewer is numerate in the taxonomy of vendor specific architecture 
e.g. whats SE ?

---
bod

