Return-Path: <linux-arm-msm+bounces-23607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D819128E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C63721C264A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5144084D;
	Fri, 21 Jun 2024 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzWVJbG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB5745CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982344; cv=none; b=ec8m2ZfjNKZttv5gp50ZsRTPF7gi8VR+700nVF9Um9HFoZyHPC8pQbxz8Fk/js2EhTTvG3bNGJ06VNqnAdpQKMqaRYQf4NN398DVZ+fhSg4DH5bL1jrrehIO+gAAqEqFABYX903OHxFlIzFHXXIz7gYNfSMnKE0Km88KwknMK/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982344; c=relaxed/simple;
	bh=oROB6zkcPhJijM51Kx/Lm2MCDheAQ/kBtiXmUMODOno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpjxsFuqqTyjkG/UbkuiUajvV/wQmhLwVd3bNOWRYVpWIfob+tbYuLA4Gw4Y3AqTqXffKgnqFXMyrGOGj65IqaMiRHjUd049QrywfOZH0w8xZlBrXwmW9DRUDcd0SB5heBvS7oHrA/+0wVBydWw/f9luzobjV5T30+xdhb709Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzWVJbG2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso18438665e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982341; x=1719587141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6wyzpDaEYz1jZ7XZEHNfhUtT2QhwGAX+r5GgVFHn58=;
        b=hzWVJbG2tKxiXISPlH63UmqKhG3dqUo4igOnUkX6BPCm3kRCS425pozD5mnj4wuKdy
         3qb8M/3zRiR3ssUSLMN0tHkOLjiHVdrqyrUS8zYVDEx/ZeePfH/lpBivjq3PG9aWItaw
         x6l7kfhih0Gxd5rEykW0aPUT8/p/9YmR3Jp23Nh4nW+jnkIBToHU8FmszqL4FEbTHsLp
         CxOpU9LiH+29us0BwzC/ih6YjoES1hHA4yyCkqcwTskra7P4KI84s+VKDCcqSEyvdWdB
         kEakP1heNRauRlvZ2oSruOsyXCgtBk4zfWl/ZSEbUebm9T1iCDnnDQRELjs0c0XqJhQl
         2+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982341; x=1719587141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6wyzpDaEYz1jZ7XZEHNfhUtT2QhwGAX+r5GgVFHn58=;
        b=PG6VQN254z7d4MBVoVmmiR+bvKuvgzOfg7FqsLZX2ROhOH6gPHV9Qbz5nXRdgFWSEK
         j0asXJ9jRUPzHIC3IU8CdK7hxHj6cIWqcOAJURFCyDMQed21NgLK6m7HFUgXfYLhwnTH
         4qWd7049gCQwuXWAoV/DI529Arf4UqEDWg/Hy7gb1e0fdWP96oLj6rhOKmYQlUhrQY3l
         9KsG/xyHiPzpDMu8jiEMiF5w98AnO2SQT/6Bq59Lim5Koq11qYkrTFJoyRuy1SXqtrt0
         nzx4VcMj/ixBOWLfgUPlxaE6aR6qpBQ5/9efhd7cgumBPHuFaltzss5ZH/GliLqYravN
         kppA==
X-Forwarded-Encrypted: i=1; AJvYcCWuwKk5pbbNHkN9sHC+Fnn+z87MyJQD2Pu5IxYE4fKAKPHeko/I5rmmP8d8XbeuFHMmLzGsLeQMpLb6qN93B0cQ+b9Ip/nB7DL8kS5q9g==
X-Gm-Message-State: AOJu0YyHBjrtWhXCgXrQldTEAAt38QRo0tvz536v4mjjjP4Ca9PBcMXk
	YYhXOFws9XBHIQXfvHaDlDuZZaS+lOtGL5pZCgdu0UC1TTrT6O/sn1+MwdExyGI=
X-Google-Smtp-Source: AGHT+IG/1Gew9+9g1SLRIZ/dhTycYZR03ouif9cQRx4UB9lHaJnlqUWPqL1xFvvDVGblIQTz5IpmXw==
X-Received: by 2002:a05:600c:2299:b0:424:78dd:60a2 with SMTP id 5b1f17b1804b1-42478dd621fmr61592865e9.0.1718982341404;
        Fri, 21 Jun 2024 08:05:41 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea05sm68063735e9.18.2024.06.21.08.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:05:40 -0700 (PDT)
Message-ID: <b487dc35-ab43-406d-9026-639b2b92aa5b@linaro.org>
Date: Fri, 21 Jun 2024 16:05:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-7-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-7-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Split the RAW interface (RDI), the CSID receiver (RX)
> and test pattern generator (testgen), configurations
> for CSID on Titan 170
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


