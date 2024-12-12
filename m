Return-Path: <linux-arm-msm+bounces-41632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41B9EDD19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85ABA18885C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3397CF16;
	Thu, 12 Dec 2024 01:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HRI3Lp0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812DD1EB39
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733967160; cv=none; b=co4wigmvBtTNK0qGaiKNWRBpwVsNW9vwbmsMg4VwrVTW1Q17TTt8TecDuZHf1BNxOiiylUpob/GrVprBH603aSQudPlb40tkQZ2qanNMMiMpFQCeQBLbCHQabkGlrJlrnRndsxkSf5URyC0L5lpJae3fyaB20Fe48tALb5SiIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733967160; c=relaxed/simple;
	bh=HNsMTxzSM4Os/Bbn1icb0Zpox/VU8oHA6Z7aOqs54no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLgbmjVV+gxdvF1l6bhh59AjRlWkCnp8rP9JtoYuguNsCrgIO2G4IhFDR2uq1wyagW09z03q3hGHkfByhvQ9HkJXnyNLvy15dECQbWuX2nLnkPG+tiIaOnhQTYAueilMqquTrAik6ibrDmrk/TuXlsG6tqqphaNl/prhKan5NrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HRI3Lp0h; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so65893a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 17:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733967156; x=1734571956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYW6QD8x26BPCi6ZwMNcJa7MxOLVr8kbm9ZapF+r2Wo=;
        b=HRI3Lp0hPsAnEc/4OBPgDu8MBUHKiX6uEMt6q5Qby8B+AJ3mFw9/dKUwc1NIictyIT
         4ZJFIkSJA8O5upx32vnUPYFywRrLKkU1YgYAClTUPzmfIBfW3WZPZ1Kj81zoCqde6YaW
         P6TnxJLrZuQ9KSwhfbsXjSvatDhTMfoy/T59z126ufY046jKwYSoQXIkdbePs32+enbW
         JdwroaLiRtMV0Zn5ZCYLNkT/X98osNXGAiXnLgNNcqD/PhoZ/4DMTTpLmNA5QheUrgH2
         1LtRBQPb/xDLS5kqYESgJS/YX12r3vgSSQ778a54FBaOJdDce14+QkP6sCR407A2rNww
         TjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733967156; x=1734571956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYW6QD8x26BPCi6ZwMNcJa7MxOLVr8kbm9ZapF+r2Wo=;
        b=gq7hyvQJlkvbUP5zrxp/IQe+PSR+/HFKAIWYek2stNRO4i2obQDTrvRQyDhKqq8161
         lQ4mBdYzmw603G6prwd8IqWcDLCriYvb5W5kTx/cvWzsBODYJZ5QrKDTHPwWL8RC+2Hp
         RvX+Ln5JthMvaR0vFMiqquWtjJv1heSw3C6hZ3gxS6OopAf3vDG7HsDhI99DBiqLbelT
         mz6hJggNlOjjPzA5c5klAwdZ7OS4LzgZzL7DtPnjUY0Gsz1f43jJhMKsckVQwbHt53u+
         ruBWMMDg41yVX4ULydbt7c8jHzd1nXzEeh3MMAdgoD4KWfeqnzq/sA4XhtD9ca2S6gPd
         JNnA==
X-Forwarded-Encrypted: i=1; AJvYcCXT0aRPXPuu2lL3o5Wg+2DAsAbE0QjSPt5spmpMnmgoqdauD6X3Io5F63WtOuNKCX0ytlikvlpvPtaBaErL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn7dXj9jvFbwIJ8JgTyNWnni3PMt+pP+uV9tD5CI7kA4kZjPek
	yO8g8z4darzuWY7CxOUzVMM4kCIy/vli53N8/kWSJacSurN25n0ivtCO88Apv9c=
X-Gm-Gg: ASbGncsmKt/esqYFh5yDcZ+ufW2nKkolVMhf5AijE1aIZrS/q1wqYn+KejJK5cqpS4Z
	gi35Us5Tfrm+iKupTDdwCoeQ+zrovSUWHL689zoe+DFgwQ/y4Qlh0KPWbxlPsy1bBzTp3rG3Gov
	vsao/X64S+/3Vf/PlwlPg49v23QaU+XZjmtJhN9iMLUR0faDEDT6Vmksb9P1KXN8BRPo42NcKTj
	+pekXvhnZNwjkhuaj3SAHx6eE0I697qIyBbYLnS35cYdY+poSxXenD6Y4HtVsusAzPy1Q==
X-Google-Smtp-Source: AGHT+IFJm5iLCRBwQBVqR2Yt58rdNbOiyVcfcJ7aOqvYUnTj2HXgTRYd9DKsSYmetmJtlgYL0Grpfw==
X-Received: by 2002:a05:6402:40c3:b0:5d3:baa3:29f with SMTP id 4fb4d7f45d1cf-5d4330a3832mr4211933a12.9.1733967155853;
        Wed, 11 Dec 2024 17:32:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm9676811a12.30.2024.12.11.17.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:32:35 -0800 (PST)
Message-ID: <dcfaf9ef-87bf-4ec5-bf86-5c432380ae9a@linaro.org>
Date: Thu, 12 Dec 2024 01:32:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update
 and buf done
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-10-quic_depengs@quicinc.com>
 <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 01:09, Vladimir Zapolskiy wrote:
>>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> It's unexpected to see two your Signed-off-by: tags, either one is invalid
> or the authorship of the change shall be changed appropriately.

TBH I thought nothing of this at all.

@Depeng for the record you can add Co-developed-by with my SOB.

---
bod

