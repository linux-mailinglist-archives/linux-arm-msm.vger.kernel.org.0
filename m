Return-Path: <linux-arm-msm+bounces-81370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F15C51890
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18811884209
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A77D3002D4;
	Wed, 12 Nov 2025 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnS32Jw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ka8U+l/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D602FF668
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941602; cv=none; b=IN+BPnNEXS5UYdrT7jjlj4MyGfSZ9uMx3NtRkV1kGxY7cz12szXfXsi2Mx0JMUen0IVNFzpDqnUVj9n1QdICbxCux7AEp3VS/kVKpHhlBOHYkblQcrbFkkEmDJ4F1JDqtVtfWQz8fdfpQTcLnMgV6MUfXBlvRkNhj4Cyiri7jEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941602; c=relaxed/simple;
	bh=vaafyOM4EBmmr8Xr/75zkct+KElawHFwIAMtB5jypSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDNC7gbXPMqaL2jawa/saKNcumTa8KJGy9o4s7V48zPuemf1v0IlE9XeCNPkZ3Pk3BePwma6q56d6JadnI3ezvGcwFxR7tKF7wuYO+dqR0WoLYSMJGL4bWfHz91hW8ZWz/Tl6sHq3JozmwxAJ6OhL9E/A+DmqnV5trSefB/anww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnS32Jw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ka8U+l/t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9X3EX1001830
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c8M8R+TWpXRQ5e1+bQrBnPfd6et7TV4rbqupFG9SIs=; b=AnS32Jw0ui6C8JOY
	hiPKBk1G4+knA0yFTPdpEN1SZwfHaZFz4tFVcbsVQ9IJ5pY7s0a42fBtGJkaNhZn
	dIrOr48Vx48OTdnNHvTLezT+eYp2723P/NsAd9bkiuCdYsUldX2xwlu8KLiAILmt
	zzeKMU2LLcMYA3fzCWYnr3iWf0zNVUKDMrrV4DHhs8bMFEaeX3m8Z9+smhLgubRc
	PeOJ0ydOcuZaeHnNI8dPpGdS9hl0h2r7hYJdIGgoetwxgmlfdSFPnQuHQnODFHmI
	SJ0BlK4q2Equkaba5vjiU0N1ltD3uoe1CxBCAZeNMs0nel/le8dcemsABbpQ161j
	FAB8kw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq205kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:59:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b23452ec2bso21815385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762941599; x=1763546399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/c8M8R+TWpXRQ5e1+bQrBnPfd6et7TV4rbqupFG9SIs=;
        b=ka8U+l/tNcEuKdiP67oc7URggc0551Rel7sn3erK2L0DGabgp3f64HX2/FPOTOSEqZ
         GciIOxjwWsOhZCAV5E7kYN3j8WSVfBy9wekz1iHhH4tMhr018UacO9iMVV6m9aXag00F
         eHeoi8zZeqTMUK6FMXNloSaYvQynAe6exfIxa6V7rzr9pQ3HD8ozOB4HEDmR7zAEF7JV
         GpDKBYJjfDqfZNd+3PBw+VVSTSWb2qwwL5AA4p8qYW5UFucjljmhysoMphHIvXE+w3bI
         dIDKDE5uG4nUtMSt6cg8gqAvOb6DvL5l0OykEdYTr9kWL/j2+n1Dn0P8zJVl9sbFGzbJ
         79aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941599; x=1763546399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c8M8R+TWpXRQ5e1+bQrBnPfd6et7TV4rbqupFG9SIs=;
        b=MlSJPuu7MdgopDdugmAWAXd3Y9wu/SUqs5U57k1hhH7BCpNxNNncwo6hO7aIrx83d3
         RdMS//6wPj41Ie8CcmyE2MTz2L3GL+A0KHP/0Xv4KkA8fWbxnxaIaC6WRH1VI+YBpsYj
         xHyw6QPuoehpfAhpXEsE/iOPaUHU1rCUzeVOlPPM4J3oHrAet5vcisLJKM3281R6AGMF
         3vEyPdSuN2qpPJXonMP7B14SExTQwwfNfOKnkn272i93VKZ/2kBcoQsqVbKwlkfJxU5S
         xj2aBG4s+OXigvQpvPkYhsir/dWxyYE4UYwRPmlSkepwelu1lk3QmHspZSGhwTo3auEF
         RIEg==
X-Forwarded-Encrypted: i=1; AJvYcCVhPq8/ykhH4EjkosF2hGKnEPEkbDw7fC9JdV3+TZDnOqtb8mtcKAn3BKtJaNGY8F6I27uZqmAX3oPSOapJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJilBSNBWoa1SNc8xzxOu6X6D9O+aEPRer9Sv/qa4AU3UbEVib
	YGabFpPrTgyR/u4QyA89sUFSZaRY+rMWeXAFnjf++ytUgEm4bs3Dv3o9ABLvCGrM4zkGzsq3ExB
	5DidvNx1MGJnwK6sRyDI6bY680H0xsl3gBFnFuU3G2rivDCNXxFNh7SCocikyFMfNKPhC
X-Gm-Gg: ASbGnctXKWtfJtBf1rcyeIocSBAbvdHJ7G4xNRbPl0j8tzxrWCxFpIAtRYTTW7DaU0H
	cSS5CIf+8E+AZFbGXsug22YcUKYtLE80Kbyq1QRQIMt9DMbZaa0jckGADg7uE1bf4FVYxScuqpQ
	Bgxn7Ej9e3HLW0ZR/BjAXQLNNTWJMsr2TeAvY/h85eCAnSduUWQCwo7d3BMGwvkRujB9p8OhqTC
	YgS2Yd0bsmIRpF/ZocHKm+sBjlAx/HkgpVjEOFTeCEeiODE/9Z31s5Luc20NliI0l1V+pmfEAkj
	PdZk2dP66pJMms1iCAhmz4BN7J2hEYoBwNVlYZs72KdeWIN6SzS0e6T0Qo5xtqWPKNO8Gj3Xy8M
	h47svSVPv/pZcejJm3AX6b56fa5ioAkFGfIo7kypJIKQvMrCYP6Utuai1
X-Received: by 2002:a05:620a:4047:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b29b7c1df7mr186053185a.9.1762941599129;
        Wed, 12 Nov 2025 01:59:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeACvtEsXBDBf86oFt1CCQ2CtTgxFZLUvN151CpNKDu+hMJHO80+bcfR0KyKS8bfTOd2+bww==
X-Received: by 2002:a05:620a:4047:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b29b7c1df7mr186050985a.9.1762941598464;
        Wed, 12 Nov 2025 01:59:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa0f37csm1552008366b.64.2025.11.12.01.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:59:58 -0800 (PST)
Message-ID: <2b10f34e-ab3c-4329-9034-8666b252ac49@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:59:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
 <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
 <65714302-3b71-4a15-8647-ad707e056302@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <65714302-3b71-4a15-8647-ad707e056302@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=69145a9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=yXIK2swZwOVbrSwllKgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mbllWFRrFie9Cbxw7qxPkvrUoeYp1b5u
X-Proofpoint-GUID: mbllWFRrFie9Cbxw7qxPkvrUoeYp1b5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3OSBTYWx0ZWRfX88WVg0099+KW
 1Xo6KS5dFsDV+G28kdmxdp8H8cM35onh1Ze21qgNJSlrhoOFmZ48bMfv3A7GkjDySfzWK5ElPsm
 8wtAq+QpSrUalEAi1Mw3GE/8dsmw/W3pYnOd+lmI1WIvFjoPFP4BI1FxJ64HeXV17lmxTz/FRoa
 oXKMQ+XPZfll1fTg3zPk3J9raZmLu1QbVDsKjHWlygZuzVN6/UZtik1DCeppARou26vnl6MfWF/
 RjJKYhmfmhBtFmpzjF+X1PWsnMUezv24w6ZI55sHkDfK74jN37spanQB6QKIaB8nA1kEBaeQCrs
 KRPdtztUnFskxmv2O9VxyTiG0tzFhCsIZN8vJV+FurH8b4VF9emzNJno8pzQCMBO8mezWPQ0Vpg
 o2gcj0BEjOGfoe93WTVWubQt1p6Xeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120079

On 11/11/25 4:10 PM, Akhil P Oommen wrote:
> On 11/7/2025 2:28 PM, Konrad Dybcio wrote:
>> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>> of A615 GPU.
>>>
>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>> which is a small state machine which helps to toggle GX GDSC
>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>> any other features of a full fledged GMU like clock control, resource
>>> voting to rpmh etc. So we need linux clock driver support like other
>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>> This patch skips RGMU core initialization and act more like a
>>> gmu-wrapper case.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  	/* Enable fault detection */
>>> -	if (adreno_is_a730(adreno_gpu) ||
>>> +	if (adreno_is_a612(adreno_gpu) ||
>>> +	    adreno_is_a730(adreno_gpu) ||
>>>  	    adreno_is_a740_family(adreno_gpu))
>>>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
>>
>> Downstream sets this to 0x3fffff, but IDK if having a timeout too
>> large is an issue
> 
> I reviewed this. It should be 0xcfffff. It looks like the latest tip of
> kgsl has an incorrect value for a612 gpu.

Thanks for confirming. This patch looks good to me then!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

