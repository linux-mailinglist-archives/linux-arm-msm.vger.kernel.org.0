Return-Path: <linux-arm-msm+bounces-88211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B121DD07CD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFBE5300EDBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688F33F397;
	Fri,  9 Jan 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsUc64M7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guJl6lkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA533CEAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947211; cv=none; b=s8MLbXB9gP0b/oBWVOVGSLkg+YCzrvem8/9NGDo7GdEX0Hyi4Sycf9fvwqoEike0izyS0B7sNlrj6v1xWgNLzlSubP2KoF9GFuiuQ7bAO/7s5eEdHOEKo9l0W0tMZabYZUeQB5BeCHQgmlcP8lxJVLNj3OlOWJdiLPHJIkWAsFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947211; c=relaxed/simple;
	bh=on4OmGH3PKCyj+ClgdPhhA1Urv+hW5rR/gaog6uxbxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQMEnANpYvqF0zPckV4aqmy9bAUyYHfm+kEGBxhT07CTU1pvfC2IXCYaSyhwIEoyk9E5Tlo9+ROcaFQtHHdXIbwcg/MLyDbc/X/mqLvuKgwDDi/CuAUH8+DS5IPHJES92hVjixmWsf8i9M/1UwlL8nC9Ti3Lx9s7Xml3El6htJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsUc64M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guJl6lkM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60952l383542271
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwboY02luXfEPuE384LvN86v+nnVRmDbdQzXlDvwtOk=; b=gsUc64M7iOVTvBbA
	1eCGsYzFGIJIkNKT1O3TrqPStsmHaB7RsvxlBNV67ymFw5lZIbx4VANjN9gk6R/n
	8tLhDINhiNXPRicmvJzBKqsbBjQdI0AuudT7X4msN3wZfYANP5onj0CEw0ZsYySd
	+jRA8uxX7XCaZcvqOac2tofreYbLLenfx0UaQn3fRwcfyBNm/G78/UHTUIUC/NR3
	zsGo6Xa+/UfzpD3e0CcKZLHlmG1KVKMiMNnoFvu118+sIzDdG3EMSzoq5noVX0Zl
	2BRcJW3UiOYchRLyfX28oCi1R7cvUF7ub0u9/vmETFaQ/WLjTEY6B4noQ74IARqp
	DvKl8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b0hkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:26:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso44251505ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767947205; x=1768552005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwboY02luXfEPuE384LvN86v+nnVRmDbdQzXlDvwtOk=;
        b=guJl6lkMnCUj0GcTWDRu0V5zTVlRPVDTV55UIxAPfd44Q0B/FTZ/huDESczK68Ae4f
         3nZr7XVu7hx+AhkOz2vbksMJcKjgBcvHQM3OegyAcTXPXadtNHKP3HqQkvGwI7D2u/yo
         n+jGK5WO9A88SEYzlEyzH17kXOPldnkQwOdokqSxRMzrPE3T3qXoA48dnf4ozIcpoVLY
         KYvw173O/nbicB+sX8dyjbCPo5qOS0qizZiYM72DBRAvtjt3Yn+HS3e+4vKr3AofoBgz
         2tR2alrVNIMt9WiGLpbWGocou0sXfUbwH4nYcBUQPZVvTPcvXFW5TslJr0+/jIdEnnlj
         y42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947205; x=1768552005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwboY02luXfEPuE384LvN86v+nnVRmDbdQzXlDvwtOk=;
        b=VTKIUk46ga0fQAsT+jV0r+VyIwaR5m4ZZoqGvK3C/3VJBj2SBuedq7PiWvJvzQvykz
         hLwz0RH6XfECweGawJMwA6xZeoj5NaQgBgsapg/88PSxNGVJNTXW3L+Un7OfaZ6rEXJM
         NG+kD/UF0ERTygRWyiK3I3Vtd9DeyZY0u5R6Y+AKYGuqPPHJ29WIf6Hjh+m/L4MPigqH
         V7pOkyBWUg14AIcHdYcuGA2uyeAt7EBnPfAQgRa80lqEbnonZceo00vjzbfSUgXiS31z
         zcPGxo04vbxGuFKlml+LCQ8shDnV+7HjXFzWe7rA5Vttrc1LFrvT4xbR9hLIRx+rVjfI
         w0Tw==
X-Gm-Message-State: AOJu0YxiWL9jIJ8FGIJoBvbWbEESaEuWtg9PaDGz4nUKSnDUdzvEa93q
	uv0aIyW01TGfOolJByunstl/tKzNl3kWbg2ozwNYRyq5Blg2McH8J+6dIsHk1HBPP1CbPUqkaf7
	kUJP9Xr8Xjew0QVikGRBz3hhrvaV67Tjb7zeDwG0vEGrxYRXLOEQL1mvi9CtQYzA7eJok
X-Gm-Gg: AY/fxX5rGNDZ5bYdxwzG7rVwuD1jVgCJNLzjfyReT3pvEUmiI+GkxsVJJO5AXhcDGv+
	oqexbZ4Z32YEXoObS2U5NsuavoZtnyOGO7ObUYVwbjBfMNkzCuotiOzNuEYJRwBrPQbdemop6Z5
	+BF6lAXrNG8POyDwU6Jr4rHiGNXs3sGj2gCfsqul8Fz2+DiJoP/k3npy6D3ubjbPTITTFfvpfDz
	kqxxHUYdmZUQqVCLOvkzMc6kj7Gq6NE9xMZPkAkX7CPAuv0Wlvol5BVJnpifkYWfsLUndOWg/Jp
	wqCBwhbGcY5vcmZB9LBh1366hLNKqVwpQJnoE7jzFpWaNHQsWNKH5qJshLXYawUQTOb6pU0yf3S
	VgJxe7oarEKtnjlAm/NnD9dWF5v6RWoor/HEr1wkoPwLzikFpwKN0ILspcajFXVpIrVZ9mHJMP5
	kLuGg=
X-Received: by 2002:a17:902:bb89:b0:295:28a4:f0be with SMTP id d9443c01a7336-2a3ee4389d2mr57089255ad.10.1767947204964;
        Fri, 09 Jan 2026 00:26:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvdDqfUfu6n1TUqPLFYOvkLv/CVJBf3I+3W4jVIZf40cQu4mPCgWacYCS9Ja+B0r2PNou3aw==
X-Received: by 2002:a17:902:bb89:b0:295:28a4:f0be with SMTP id d9443c01a7336-2a3ee4389d2mr57089095ad.10.1767947204438;
        Fri, 09 Jan 2026 00:26:44 -0800 (PST)
Received: from [10.133.33.253] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e01sm97316175ad.46.2026.01.09.00.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:26:44 -0800 (PST)
Message-ID: <1af7d2fd-02fa-46a4-a7c5-0a08b1e1a596@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:26:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Initial patch set for PURWA-IOT-EVK
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <2e8e6436-96a3-40d2-86ce-a716326f79bf@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <2e8e6436-96a3-40d2-86ce-a716326f79bf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1OSBTYWx0ZWRfXzqpc9Z/aEx/a
 MIdVDYEuRXBfrr4gGsgJY7Kg6YKF8Zp30pABVI0pglCGeuNYntZD54CPX4fVrB67X4jSqlDRTe+
 dBHSUBtRSO1hJXCCZFzRB6MJiAB1abB2qbmLBtb81mHoWUj1m3jXhYWIZH3fEk/8tXLGXWXpwwQ
 u1ePET8B1RhINkTi8U9A6kXCmPyLrprn1e/YlH+PBMhM45kazYgCjDPohrBDhqsTS7OcMtondMx
 XTOFv0kEN2x+mIa10vZdV4aLAn4xv/VCqBGw5tq8qlkdIQQrbIytk18dspY7lGPiX2jvjlisYOV
 NrBsmGDsQea9o7weTQxijxiESGoup/BIlBEeEgunsjZ8kQ6iKYGmkIJDr9uD2dfzJQk5ZW2YsZe
 EL5clCyFePhuRSsMGe9b4IOoQW68bEInoiWxeGTHfSi4u+ZVeUnzcTmHH9ncWMfY1GnlJT5ARwU
 mBpo7Q0sCPcErmmSCbg==
X-Proofpoint-ORIG-GUID: 3JvO74BDpC-FhiWfnvvIHjWmZseR2Clq
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960bbc5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kKEK621wyExbtbTYRBQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3JvO74BDpC-FhiWfnvvIHjWmZseR2Clq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090059



On 1/9/2026 4:06 PM, Krzysztof Kozlowski wrote:
> On 09/01/2026 08:59, YijieYang wrote:
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>> Changes since V1:
>> - Update the GPU firmware path.
>> - Update the description in the cover letter.
>> - Reorder the patches.
>> - Use separate DTS files for Purwa and Hamoa.
>> - Update base commit.
> 
> That's a b4 patchset, so where are the links?

Sorry about that. I generated the patch set using git format-patch with 
format control options for easier review, while creating the cover 
letter with b4. Since the version number does not increase 
automatically, the change list was written manually, and I missed adding 
the link to v1. I will include it in the following versions.

- Link to v1: 
https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
> 
>>
>> ---
>> Yijie Yang (4):
>>        dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>>        firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>>        arm64: dts: qcom: Add PURWA-IOT-SOM platform
>>        arm64: dts: qcom: Add base PURWA-IOT-EVK board
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>>   arch/arm64/boot/dts/qcom/Makefile               |    1 +
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1313 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  614 +++++++++++
>>   drivers/firmware/qcom/qcom_scm.c                |    1 +
>>   5 files changed, 1935 insertions(+)
>> ---
>> base-commit: beff4beeeb2760405ad49de2a6a1bdab8fb1aec3
>> change-id: 20251113-purwa-907ec75b4959
>>
> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


