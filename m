Return-Path: <linux-arm-msm+bounces-82825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD0C78D23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5128728B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E60034B661;
	Fri, 21 Nov 2025 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp0JNg7Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE134B414
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724909; cv=none; b=AmwqpAor5mC0SqsFij7Go9ssZNPM1nGghhltkKeit0NR95Gcl5Dk7FXNhnEY8ihmrz+dBKL+4D80zqpQYupYBhWxFnKh9wAmA/0N3hnmucAZy/nPPUyPE8yXfp83jhzjF3PP50uR6xJm8um68gKVXJkiiCzhuZPiMiIQS/zp9uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724909; c=relaxed/simple;
	bh=/FkxSXRz9LMHnMMNJp+LieZnrRuKbRrFs/7QOECPU9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXmh5zbiEHcD+QHWmmyXe+RThQMPQW93Nd3WkVkyf4c/bvVt8pu8OT3eDYaLT1Skvcxbs+cm2pbm/8r8iWwM47Vpc7QbfN7Ce64Z/gcsjOeLDmOngQDhzT86veSzGvY2TaIOKicpgU1qItwJKCtDwF7TV5QKeV9w9re4we7lrYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp0JNg7Y; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1669877b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724907; x=1764329707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qfo/be4GYxt9btZnUQbCHGlLLclI61+pD2umzl5YLU8=;
        b=Kp0JNg7Y2K6jrnY0Q8Rm++9F4nrLK4hWT0PeJVvRR1UGa5AUAt8rMvj6oliOEwGs3s
         +EXAiQrz6hUy+l5TZW7Twm7HVeZkeeaVTzxIRAr/tOw4c27jLUJdmLID5gieIt2OeMxN
         QpfCb0Wa7mVWz/yuWGaoM6jCaxNK2xyjZj9+CD6mmd7kQiV/SjDBXRws/mAMfv2ccIPo
         2BEJs5dh0+KgHLuyKnS/1KgjS5/Gd1dTfibicRAO5wh0dGlZAiA6ZiafmYW5MycOtSUx
         5F22MKyyiFxgmCdmQ3/76Z/3aO2qs3TKH4l5y+tZDlmlKevSfUtXSHae3p1Qh1lI4RXN
         YwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724907; x=1764329707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfo/be4GYxt9btZnUQbCHGlLLclI61+pD2umzl5YLU8=;
        b=CVC81H6KhY1co8nRMGkpW0yrZEczt1v3K7PdrK2enB16FTe9NejJ7HC2166dhnwVt/
         bh6zganLyDZlRsmtN011TbDEg+eBxSu01A+jzgsKwxKHYVnAalOw4duxMZrq8LJDcFok
         n6spQGE9juyoJ5/X3jOonRwDwOTaPdcXp9V/8Yh0DeOf+2p9ZXln4vz6RXPlrihl78Pg
         C/QAxzmpghnJztlLOWu82uobjl0t3cUPC+rZShqndZ+tTDw4U+A5SHvdNvrki6d6MpXv
         ez++rllJSpMfR9JaU1CS8F+WMZ4FY78Cay0A/DPw2Y11xQWjjOjsYFCHMQhl4fAWdzU8
         HmkA==
X-Gm-Message-State: AOJu0YyVDODZzIIHWFyfMiSEYi+xoUshm2bXD+TUqGwPe8dg2oMSj1uh
	yRFS/+yoU+D/KvrOvOULK7M6cErkUKDlKV+ykYFjqpNDRsphNOPaj/BCKU17a2ygSFw=
X-Gm-Gg: ASbGnct2YYY4sjk3dO1eu7uxZSFdEyBMz7/Um4QRItPg1mXrQBZSNJ1MbMDefjlUXHh
	3ZW/CMQIO1WW8Hj38Uu+sEBb6Gp/NuuWebFdEKQbfcMydRnVWXQ3ZRWwA2U7sKF7AI5ru0Pu3T9
	4tGgaA319HgEgzj4/ltBSg51gHF2Qz7Vlp32lWLunw1RdGoasTd04rdWR/Oiu0f1NOIv6XqSNs+
	x6PodpRzIbfAhpwwuc/xMa3CAWAaUTM7PXdiubK8Uvs+5fuGm9V3gWb0plQHFhVaYFHnw/nLGGQ
	QpqtlnWgGaX+ooqFx/ggUr5HzyAZefsUpI4hrJCClAU97uiZgq9RXaN8LXBf71plR8fouWTyqo7
	pQ3UVhfXBgV6ePr3UJxR3qi0wrlyVs4Ks7gJTXmOLOQX24ZRL5Yd6A8FnN6BbyzgnmDUb3XSeL6
	3WlE7AAjUOcI3kphtavTFIoMOhBjfFb4BLkdqDP6rmaSachj3JcpAc/lGhgdQxtk4v
X-Google-Smtp-Source: AGHT+IFwa9ohIUmcXG9jXkofsOzOfpDOKPDZvgLrJIRHhd7+7MgM4xWll6gheZBw4rWbw0fZpldKmg==
X-Received: by 2002:a05:7022:24a2:b0:11a:23fb:16e2 with SMTP id a92af1059eb24-11c9d613003mr671394c88.9.1763724906696;
        Fri, 21 Nov 2025 03:35:06 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm23498679c88.7.2025.11.21.03.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:35:06 -0800 (PST)
Message-ID: <573b2293-7b39-4c68-a51b-ecd5b62b0ec1@gmail.com>
Date: Fri, 21 Nov 2025 03:35:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-3-636f16f05cf4@gmail.com>
 <161da2d4-3306-4251-addb-cc9822a112c0@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <161da2d4-3306-4251-addb-cc9822a112c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +		iovdd-supply = <&pm8921_lvs4>;
>> +
>> +		// TODO: Figure out Mount Matrix
> pmOS wiki has this:
>
> https://github.com/SiddharthManthan/accelerometer-mount-matrix-generator/blob/master/rotation_matrix.py
>
> but for accelerometers.. shouldn't be too different, I would assume

Unfortunately this seems to generate a broken matrix for me for the 
accelerometer. Downstream is also useless here as I believe Android does 
something slightly different.

I have been trying to upstream the pinephone pro's accelerometer and 
magnetometer as well ( 
https://lore.kernel.org/all/20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com/ 
), but I'm just not sure if what I'm doing is right. I think the easiest 
solution for me right now is to get the screen working and use GUI 
programs to figure out if the mount matrix is right. If you have other 
suggestions, please let me know. I'm all ears.

But since I have your attention for now, I had a couple questions on 
trying to get the screen to work:

- The pipeline is MDP4 <-> DSI <-> Panel, right? Any information you can 
give me so that I can try to get this working faster?

- Is IOMMU broken? It seems like I can use APQ8064's implementation, but 
that's broken since at least 5.10. Should this be reported, and if so where?

- I see Adreno 2xx, but seems like there is not Adreno 225 DTS 
compatible? Any insight here?


Thanks,

Rudraksha


