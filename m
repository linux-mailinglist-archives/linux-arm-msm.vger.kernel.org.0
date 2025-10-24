Return-Path: <linux-arm-msm+bounces-78693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F288C04DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7FEE43588AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE372F60A3;
	Fri, 24 Oct 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFraqqxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED472F1FC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292538; cv=none; b=KBMDBWNeE9zaKhhaBmtz6hoJBhrYfmZqwPeqb7TNo6xiZofqRoIbaFRlTbxr6Qh06Vj9t+MAeh6UWzhpy1A8f8wUuJZXHbrMv1POLLg89p2AkmXfAOLOcNvvMtaAsa6gMRKgedt3JHhbXwbA/+3cs3AAkFvG9P1C12fPEmH11Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292538; c=relaxed/simple;
	bh=UFp0rwfJ7OinZOtB8woT8V69BxcYe8f2uGbPThsPnAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jnur+VLpglixrYtATfTK7AXq3hBJ2ChYOGmv91Esz+Ca0KHIuQiFtUqwW3grI1U69T1PbqWEHB5htJhV98XUFXjave+yVbByjCfMr2CcUbI8yTfhffPQ3b0TR0KB+yI449ZQWpuK17tqxSf8xvhe1I5PzVKT6pKOAatxIBRwM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFraqqxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FgXq021117
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXG68zxkoFTr/T5HZB5JaHrMfcPhG5bgKEnx+70f134=; b=QFraqqxmnmEMEzCA
	eme0XSu5wVdiHBKlLLZ2ojmPaPvd3jt1tj/r58Vyjf5EUGOcXAPiQUiulVJ5AARM
	GbdSOvhdAiF4nIV39yBQCPLgq/CDzM4vSe1/xTEgnf5oXlrC+x/INO/HknZyOgD0
	IxYkgsRvjbGD5LuVg6WYn3HY7Jh6eIETefFtblINWHxQDDAVpBhDH3mTi/+5ZvR4
	8k0W/ZTh0qoiL0O4acrT5XB50JVoKswnrWx40k4DN1yX4D7FQujmVU6Ye0dkYh0C
	yQ1C74mGKBtoS1DLuDBiaqYtVXFrhoVmT42GE3/pOcjRZ4yPXPf+XJ8Obu3LayBN
	BnFKnA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0s7tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:55:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87dfd456d01so5228796d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292534; x=1761897334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXG68zxkoFTr/T5HZB5JaHrMfcPhG5bgKEnx+70f134=;
        b=lnu6kP0+pmOE/BFI0wXPrxhgjToMEGoc5/iLTIMUNyCA/wqSGIA8qQ6E7Z5/DzAe9l
         vhJ2i+Y0k7gOoAY42Kqdwrc55yj4Qmgu+aYx1PoaO26pVEkNOJIFnu6REXWyGgz7L9K9
         T2Uq1Z9wxtOjciKwMI1NS0BXaF97j7rCFHI4hYKktw0lWul4iTPAj2XDzRJERuLbLWCs
         heneK5alc61/AQ6vi5R4wYKona5jWAQxHBTye0NHZFk6ZALdbuoiVh7f+mBUSh0u0/rD
         SP9mFihgCImKTdD8UIjRtbXf/JQHIbaAw932IYNV/oqWzaWQnXs/dxWrlHkaEb6KBP5b
         /FCg==
X-Gm-Message-State: AOJu0YxaiuRZTA91fPZ7+ytOKSkzr0cTswS9cSqMajgWnBaNWLEE5PLJ
	fgtpqTxKIXlWeSaDwsUjDcGsJBQMWvROgjPXjVQ+WAoYwVJtCnApL2q8X7sNKpIQthALF/NEJeJ
	Rjf4sGJSlOAmwlVz/E1yufpkhu7nPOIzl5lgRWcIJtna9PPAJC3XnZE9R1isfbbq3RYLa
X-Gm-Gg: ASbGncs4uF8NNeBocIHWwjj6DBLWg49jJjQDN/3GigemB01gKiwDZrJsrB4eUk9sXOH
	mhvMRXk36ML5xCaD4uZa+XAskgnylTxFEbLSl6KAoxJLv3/BWVVbqTcCShqoKJn2HQ0Z5skE0Es
	Cw8eXFbfI9BJsfaJ2HpReDfVZy6QroGYlRWaaYIfVijXvfsDDB1ZxNyxjA19J0YBrsyKnFFndGl
	mCESn3PMEc83WUcXrUyfShvK627QmyF8plKzIvbHCpDXJn50CRGSbFKwIEbTWBxT6QwrMCkbHoe
	ed25l8YK3MCBtiEzm5oPHxCAH7sGuywBtMCYzmlQ+mEyyWHHl+DyynAK2ldIuC10ApNxbqZNanr
	FtX5UHaqwBCi9rwPQtcDwfogFGlQfjmLhsvDLyTZHEDawABr7ad3W1b2m
X-Received: by 2002:ad4:50ac:0:b0:87f:b0f2:91f3 with SMTP id 6a1803df08f44-87fb0f29208mr17301236d6.8.1761292533821;
        Fri, 24 Oct 2025 00:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCB0bSo2J/IJ0DIn47T5u6kinAgTO16yEd6Im0+tOd+RYrXLjQsLNxZVU3R7LS4PIuS4fb/g==
X-Received: by 2002:ad4:50ac:0:b0:87f:b0f2:91f3 with SMTP id 6a1803df08f44-87fb0f29208mr17301106d6.8.1761292533307;
        Fri, 24 Oct 2025 00:55:33 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f32423esm3747494a12.32.2025.10.24.00.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:55:32 -0700 (PDT)
Message-ID: <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:55:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
 <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXzyR0pTD/OG74
 nNJjhPd6knhYywLaTnC9Z8ppDwWiMLABSA0G0E4aiyNAatDyraczjAsiQnnyAqC4jTdtWn1Ai8r
 wmlzObb6De39/aUO/WeVV5ZIElz6g1wM4oRcwYbe5fm9REtCDlHo7j9mgnYjX/hyZL7DeeBFGLL
 JUZT+rBAaBQE/WPrSdZ1WrkcaGaKpDDKcN8Q5HbBCgSiJqQcz3MXwuZQBT0A/PkplmUdlVkbpkK
 4gxLnjd11ymS5QFF/Cw6IPD0evOPtVmwSZiTYshcfeHf8Vo4a74JJVO1pfnjQU5zJuy0AchYwYt
 8VdDeCjCqgpCEwnBrM1uvcwnKZMXCkqwoh0uuW05taz+s8kzvFHA9ips38tcFLb9Iz34fB4C7iF
 CtsbI08AwAVS20ou9Z/FNxIRW5DvVQ==
X-Proofpoint-ORIG-GUID: bqrRGT9Vur058Hy5vAJ8i7BDSV3E0FNs
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fb30f6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ik8sJufeG61Tn7V1IDgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bqrRGT9Vur058Hy5vAJ8i7BDSV3E0FNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/24/25 12:57 AM, Akhil P Oommen wrote:
> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
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
>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>  {
>>> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>  	int ret;
>>>  	u32 val;
>>>  	int request, ack;
>>>  
>>>  	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>  
>>> +	/* Skip OOB calls since RGMU is not enabled */
>>
>> "RGMU doesn't handle OOB calls"
> 
> Technically RGMU can handle OOB calls. But we are not initializing rgmu.

Oh, I glossed over that..

IIRC the reason we delayed 612 support in the past was to make sure
that the RGMU FW is consumed, so that runtime requirements don't
suddenly change one day.

If you have no interest/way in getting it wholly supported right now,
can you at least make sure that the driver requests the firmware and
exits if it's absent?

Konrad

