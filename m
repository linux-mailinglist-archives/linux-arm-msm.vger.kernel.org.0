Return-Path: <linux-arm-msm+bounces-82263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B9385C68FDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29E6535F4DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081773321B8;
	Tue, 18 Nov 2025 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBJLxkuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B932573B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464086; cv=none; b=m8dMHntxh3GimX6mXt4gTHr6PjRnbscOJwmpnxDfr/0mY0elL3IthP9vnEo1QQmvf3UZlNrPmz591WseECLhJLtn7+hd5x41Omdigd7CzWpG6ZmfzvOr4m5RosfeU2pB6Yi/Eg+4T8KmIaKw+HGOQnPGHFJrIG21qU1hUcdkGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464086; c=relaxed/simple;
	bh=OQF0sk46s2hLmjrUOiUzHeID2ZztqA4oI0bB6vj5ooQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSFRLdrDUIFD+WMsR+ETv4OvA5kQZuyvd7tQjoxiU2o1OCRnn52SrYXA2Mi5kpw3oSqy67lI+gAKi/fTBkoF4o2CBCFj5ns5nuaYkEM2KFTzL7NDWwSX2E0kHu2Z60D8R+9waetQjCSz3oixtbOVaUEOVraWFP/+WXxuPGgkA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBJLxkuJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477563e28a3so36640185e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763464083; x=1764068883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoB6bHmy3Gr2c9dl9LxyC0mWmZ5xq1v+qI2e+g/jvls=;
        b=zBJLxkuJLSYviU4ISl3zDgXfKnxH6/z2ryxkLAWaBI067G7ryVkL62V2vinvocVscv
         W3bsMtUOmcDBzSDSeb+HB7bDPVRVbF6POYgOFGOEBPVi8mk5oj8rXjxl1Py14U+u8oF0
         bSfJi2V2NSXk1+DQSo2JQO29iR/AxVCEyoRTV+sjxzICIjyDlTsncHomUy4Qm55m75zP
         xq2ytQkpxea7WClkvYeoY+1/fbjbdzN51oQK4u7a3LcaoY8xnL/gt2Pk+6Q57nH+JRLu
         Wnmx5O1iz98fW/Uk1KFAoUvOmUH8vq0tJG6bBLEQLl/+W1SzSdk399P/XY427/SanQs6
         Rjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464083; x=1764068883;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoB6bHmy3Gr2c9dl9LxyC0mWmZ5xq1v+qI2e+g/jvls=;
        b=AWRkU49FtRxYyKbQoQk9FhmXltm1pLJz+VEDpmM8a0Qbz7XCbprobIYawzMtiiTY7R
         opcStFnzh8y8czBBYeCaeqGjsXd+J/t2+uAbgfny3b99XefNMfR/Yy1OpvkjGAWwaAVn
         sr4jXVevyMz3ZgOxetF/a0FGor0hT2PfVlir9vEFVy3flWXKolfyemueA95cY9l/xDhS
         dmKlqPmBe2yhgMIayepfPzfZPrhy2tml2h2GBxhYk0VWcSPe2dBPc1OBvM8arj9FSkpk
         73bYLsXasP5LQxdMm0mMxPnFNko1msg+9UGl35gwUKu0nEIaYFNXA2ySdK2bIjK48Paj
         m33w==
X-Forwarded-Encrypted: i=1; AJvYcCXKPEvoyfI8TZgq4e3qCiynzHBl/aqkBH3Bcm0GVl+3YDTQnZc4JYlnN5TvI00I94gIaD+IDzfVxWULiMvs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4puHEBJ/U/FojhAhx4morBkz9QCClweUqYMvG3S7JXehrftBU
	7v3q8lmtqFCFQ9rxYHDsajv2dNHoi0fFMteZIWjch7x8b9/q4wMCJDcyt6Ir8QTKarc=
X-Gm-Gg: ASbGncuQBO8AuFUO/pu3Vnk22wbIcOjI2Fc6nzT1gL8PAW7XusIzBPU95IV15lncNrf
	/y0oBSUE6ZucuR2+cwZkXdNpMjnzr8PYzAyfIsIPshaYnRXcNUp+7cYEHPxZoU1JD8NR9IK/Q1t
	7PzYQRaFzYLhuArkqsuqJWtxMjuCSvw1+3Uane09RaL5TNpYAGCPgAUiR/WJUe3WogVX61WuD1U
	V/gXiZdMWoxANtKAPVoBGeSPN/rzR2jJ6SIvgCDbt9BgAAqTY8fj5GAD7mH+OxyWGx9ek/8stRT
	EIn9JsRa1NxaWIuu+i94nV1SdpijnUQlvkOuzDE4wJYC9Gb33/k84taRm85p+bD0w/lCcm+n3p4
	SVJCSJuZMFkcg7R4jkiCkYo6QuXLfzZStQel4NzL+KJ7vctwCeIKJ84jw8wVdLPvpH93r1uYJJu
	tvdRJu2M1IxMCX4ypRM6SXvRi80RwgDfAA9pAXxH5FOQ==
X-Google-Smtp-Source: AGHT+IFwBfUbutDFVGFhG/tpcbmLbS1ovbAuX60wD/D/mUkwyiz6bbGTHlNaOEa8ByNTSBTIa85fWA==
X-Received: by 2002:a05:600c:524e:b0:475:dadd:c474 with SMTP id 5b1f17b1804b1-477a94e88bcmr26303945e9.10.1763464083352;
        Tue, 18 Nov 2025 03:08:03 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a684202sm180035855e9.10.2025.11.18.03.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:08:02 -0800 (PST)
Message-ID: <0a114896-ffca-427a-8761-977dafa73ea5@linaro.org>
Date: Tue, 18 Nov 2025 11:08:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid>
 <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
 <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
 <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org>
 <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com>
 <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
 <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2025 10:06, Konrad Dybcio wrote:
>>> Konrad
>> vfe170 is what we have on sdm845
>>
>> So I'm just asking Luca to try the sdm845 method of waggling this clock since what we have doesn't work.
> It's of course going to work because this way you're not calling the
> code that throws this error
> 
> I was curious whether you know the actual reason why this is being
> done in some other GCC drivers
> 
> Konrad

No notion at all, perhaps as a workaround to this very problem.

---
bod

