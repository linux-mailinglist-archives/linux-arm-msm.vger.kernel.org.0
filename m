Return-Path: <linux-arm-msm+bounces-84272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26DCA21C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 02:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C02A302C4DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 01:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C831D244670;
	Thu,  4 Dec 2025 01:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LriL6Syo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758751E98E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811916; cv=none; b=lwDJ1EElhnC2lDt6I9rD5z7o6IwwEPC2qbi2MkqYZgPZ0PvQ4JkIkp3vMn0dQxgL6nJrZhk9s3LzTipfIxMvj5830Lt4X7dVW5fxlFihoPa0URu+5ZgDJ+ko7MR9NdAzUlsv5fFwGw0VvPpYgh1CnipwvpV8x2waUlNQcn0hNlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811916; c=relaxed/simple;
	bh=yqRq0TAR6wsZWEznBHeDJMwCJbb1TMmKfjuiskaHz6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dyc8qMAP9CsVNn19f4TM/3yc/yfevkQb9KFCyOOd10rmwav52BA7Wk+MGROgEkUIlU2b63p/GNGdWIRpxcbP7XAEr9ZkIzaSU5hzlazl6nLt2AEQ3YFrPaO1MpPLMS4BK3MbgRcam7nYUzfQEgLSCPONtRR+st2NLnwy5xFymxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LriL6Syo; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-597d6828085so29200e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764811912; x=1765416712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO6gdye/RhzRaWkQiwbtb2L+tSAStzv+9WJjZmM1LrY=;
        b=LriL6SyovnSF4euNsHzkv044RwDujCsilF1ynoxmvuVReyGZKwjmvcWq3LL8TmkKu5
         McNBJ1QgKht6E19z0RdnGhLsSzFXzkxtOzgPOjrrj7suWQWeP9lxLbsAMz3Ke2bOiuee
         0C0sNPZ3IJvtXXfQgeov3vfkiH5zdqmgPGVBDaH6sXL2eX+m0VYYZNtzKmd+S0YP12PQ
         1f1JT0H0LYys7oGiiESWbj+KCbfAjS/s/f8g42lsYbE8SICr6GjVBbHWsASsY9CG7fek
         iJBvi8BLMCaRTKimvkGDZlbSvLZGz2aX7/9cjJGHHPZp4Sct4l678jKyssTYCsxt1rLv
         zi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764811912; x=1765416712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO6gdye/RhzRaWkQiwbtb2L+tSAStzv+9WJjZmM1LrY=;
        b=kXw0J7zYdBritVUn+QrFxJacotJab2/tfyMIAsolQ50TSlp6sLWK/lfXjDtr566blI
         tf+X4E2ZSrOXFlIyhsvpV/bBhBfCLzwx/7fLQDkC6rII3/UELbo7nhsHDMRJDwOHX9g3
         oZnHT3aaT5WpcPpABNW2CC78NMbvLH7U5wMIXulTLCrMgf+rAfmIv82HCFLxvtyIdX9m
         F0LIPQchfkePFaNS+R/Tuh6kVWG9Z23W4rnnLJ9v2RkY9+DVmW7h3SYBRH9FSJQg4UAx
         7v3dpMPq/FTy2Sz5ZwwgV6BJuOKCbpKeSlV8XS7U6wL2Iv0elbcSBItNQCmEzdM6YaP6
         elHA==
X-Forwarded-Encrypted: i=1; AJvYcCWx1C5aOmdz+/FrBOaubbzey8A6TRE9PV7MvvGndXCs6Qedl625p1zg4X8yy/xpjDYP96xBtHxrM22XDAp8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7UynT4PAGUgd7AMu9WLk123ZdZKeJl18MXl2pZS1Z3DBvyhe
	6ijYyYb9u/bE7gqO/sIivqBmoGIXl8myxsL9mDRH3302CFXaeFrTdtpg9kqvmTcCVJU=
X-Gm-Gg: ASbGnctxU7wbgHnjVP6WQhtfGJlh9Q8evDGeNJ2kLX8sdE7UxDZ09cYOPIXLrp0F1Np
	gmhabgpzndnXY0RLkPLlDIS9rTazHjqxklpBBPZtVnqpEKaVduyj2h0ZZ/VRbf2QCGteF7ZYY9N
	Oas4MssGpBSGJprkut1898YF5HtvGYg6zxyec6db9mIlebVRVwi7UOhAuB0g6S9zCIYIFkH/ouT
	onkV5k3d+QuTB966cLPDPSLcWJ3lUkiN2Wkz54Qqiu7GLgNgfpr7oNv/HEdU1LQuwRP5Ig2K5G+
	MStbZ4m4hPIs0T2ALt7RN0utlh2yVhI7tHoZWPBicvMglUN+mFcPvE2Qv6NvKdt/7MAhoCRkZzT
	shEoVvZYvPQm3DmOu0GqB/JOBxdVgoWfju943Vd+dhZMzzXBhsso1xQof9vTY9K886x2yFzC/b3
	NkgucJRQm+QLTsjqENd44dqPhbDUKRqmI1RYnkdR2TMwzAxozylNYJaX9xB9/Fz8WMkg==
X-Google-Smtp-Source: AGHT+IHo7YgZeNSkYmmPqS3Gf1PHEGCQcMyGJaPj2KfZGUd/FbgacScdkjipGnwCUE2nldbH/0enXQ==
X-Received: by 2002:a05:6512:b8e:b0:594:253c:20a5 with SMTP id 2adb3069b0e04-597d4b2e1b7mr722453e87.5.1764811911546;
        Wed, 03 Dec 2025 17:31:51 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b0668sm6344758e87.39.2025.12.03.17.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 17:31:51 -0800 (PST)
Message-ID: <d2794210-dfbf-4c73-8158-c28595bd73d5@linaro.org>
Date: Thu, 4 Dec 2025 03:31:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
 <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 10:10, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:35AM -0800, Hangxiang Ma wrote:
>> Add the compatible string "qcom,sm8750-camss" to support the Camera
> 
> s/to support the/for the/
> 
> Bindings do not support hardware.
> 
>> Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>
>> The SM8750 platform provides:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
>> - 2 x ICP
>> - 1 x IPE
>> - 2 x JPEG DMA & Downscaler
>> - 2 x JPEG Encoder
>> - 1 x OFE
>> - 5 x RT CDM
>> - 3 x TPG
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8750-camss.yaml          | 664 +++++++++++++++++++++
>>   1 file changed, 664 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml

<snip>

>> +
>> +  vdd-csiphy0-0p88-supply:
> 
> 88->8, so: vdd-csiphy0-0p8-supply:

I would make a minor correction here, it'd be rather 0p9.

> Same in other places. This is how it is called for every binding.
> 
>> +    description:
>> +      Phandle to a 0.88V regulator supply to CSIPHY0 core block.
>> +
>> +  vdd-csiphy0-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
>> +
>> +  vdd-csiphy1-0p88-supply:
>> +    description:
>> +      Phandle to a 0.88V regulator supply to CSIPHY1 core block.

-- 
Best wishes,
Vladimir

