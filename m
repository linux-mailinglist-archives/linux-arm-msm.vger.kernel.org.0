Return-Path: <linux-arm-msm+bounces-82972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D82C7D185
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD1A835345A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 13:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800D91369B4;
	Sat, 22 Nov 2025 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV7g11Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0qgLkng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BE1D6193
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763818012; cv=none; b=hyqp6CQ3mJb8igHvgvjD7Bo6gkQjpfDSAbF9SJiNS0IAoijTneKxsQtegmH6nLLCyPHPTwH9V2KzgbiIbUAF/UNPAfj9br9JiJmiKOJ12Mn9ATUzJc499eOZllNCNWInxcOD0ykr+YLjfB597AnpW10700PpmXPvCL5OPb1e1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763818012; c=relaxed/simple;
	bh=K4Zd1AB+8UvsNFumiuI/Tcr6nR2votM0+BgCZhdlXno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWHpyic1BTX093X2mE4Mvwwbk0ZC+/ocxwWWGqAnDm5lWdFYMOGEIMndrgiKNM/TUESEZyq327OELe4eH4kRSOyykTNr44/horiDyYJD170YpHmCl40Z46Z6xacSr9IcyoOUVqJRV9M+wyMnU4uOyDVYQZ4XQ4wRVPh5cfC578g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZV7g11Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0qgLkng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCblam2444182
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=; b=ZV7g11Gd+9rmY05K
	Su2jZxirLh8vfnW/m3N+LbhJOcNCIFtogtCQ1g3f13VLkv7QpMfJOZN7/f3s88dt
	7TtCDpLP3KgeyiH/+Mf/W7ScefB6Uk7F1a2RRioeUQHh9Jrgf+sTJA6QWJl7amab
	Kw8gFR/7/AO9gIrW0dnehX/FWY0mkKj+vIbFX+NeiTb66LaFNR2dZGpjTdFZgAnW
	gZO0g646BZuHVeVPDh6aWO88NpI9IZn3k0yIAZhO7RjBKV+46nIugWvu6GEVEn0q
	Ptt4ca5egQ2gDx03NTGvs6ET+Lpd+mBwe73inbnn4XGWVQGfOppTs6H9G0KWXAl1
	g2OEMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak694rq4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:26:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso9938661cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763818009; x=1764422809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=;
        b=H0qgLkngJLmPiQetGcszhUfw4gGTXgGlRTjRfWNGas4WpW39L9k02gZammx6sQaeG+
         VKSWvAi+MFoajsJMIQwvXfV9CTyG3mOWX525lZsjz02ZzzFuJjLOwv09Kv6BqRN5aIRE
         NO9O/fQlYqIVZOiI6BAFK5DfxtYpxmjHuhXgupBTv/EydVPh/VEQzZfGlZAqpmyCl6A0
         hip6AsPIFm83HnXTz+cEynrRMHs7tOfFVKP+LFtkpiZxtHUYBsGMRef3ay1RriPHjuyQ
         /x0Vz+hxDHGws+qiDHb1gBcjYHie50s8b01Kv20tUZpT0wLMuCF8ntKNIe3YSzl4XcDP
         9MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763818009; x=1764422809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=;
        b=IdDm6/2w2MVkleKQ4FpVkkKwxAhXRrOy8EJprXuKU9QYYcjjN+dpQv8emZKc2OzS1i
         i2qGr8wcTZXd8iKJ6v3LTnv+50PLIkws4LXJeMNzrMqt8wvOMFulgUF3r73K6pG0c0ZU
         EngrloNavqU1NVQYKWNZIB4u6Ss2bKjLYO/vPW+dY/K2xJv8LG5OvjWJpq4Qxy3fbb0v
         3zFl/QTMkj1VVmyhG1zRCNBEL1/20aTYcj4oxxfVCn2Qfcqzc+adxFSqCTH9T3ms913F
         NexXIKl0fH1IAqCp0TnQ+xCEGY2PPQZD+Z+gmUwRviKEc3RsiVCZixr4LlKAbw5xqXQE
         INXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk2liwP9bGXUI7m8hH4XGIB2n3QYT23NblBFANT17lT3zCMyMD6ydOtl36hmfwDG7OwzIfsDQdv/pz3wDR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz190LTC/KBCvj88CwmJgc9i7eofZEm2mSwb7TuGqgoipAWwFfG
	DT9ecId5UYDogt7s0S0OcOoGsOVWjyprbKNpw1/WljvxUA+GXEAntGvWJdMlMOtckRQauG7CTOL
	0XXr/s7Nviyehv0NJ8TXjBvYbrIs/bvb2T8y20DTlHls3u7sAMZDEKu5kQWI8wlwQGmCr
X-Gm-Gg: ASbGncuVbZ2wp/cgPBBkePEVky7DIsyNwsSnu+CtyimnxpA0bZY37/iBN8wLaRnNhiT
	/lV53iz+XNX9utdtRThOXPUdprAA/F9TVP/vwismyUyddcuktnidkHup+/swyQtEfGhs8mAxf5v
	onYJaHl6Un88yI25Oqs3KMiN0va139d5xQfK3uUWD/wyRQINXYoT01rpx7RVf8u522sC0r8xevS
	mzIfYuLK+eSSJeEEYkN5b79xGGgIFMHPpUCKO6Rxs1/UoP6Q7lJkbf0s36A2aArzjX4LY23cIb8
	ijeoOdf2J2al7u7UBmmBaEa2YSfbthPS3onGfe0JW3J5cDiwBFBWP2CnD7RvYll/Nb9rEQNBKbw
	Jo6MQNKFhoNl8PcnK1shx5Cc1XI72ZCJcDogEcWMdSsW9VASVTmzTZb/BQeii24XLT+Q=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr57036091cf.10.1763818009078;
        Sat, 22 Nov 2025 05:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzKrHFfiXLL3t7qcXOYH/9ZjJQXSKkuyZ5Ow/HDShaOvGBaRejHnuNettlr7Wma7Iu0SLb6g==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr57035771cf.10.1763818008664;
        Sat, 22 Nov 2025 05:26:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d7cbebsm733074966b.29.2025.11.22.05.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:26:47 -0800 (PST)
Message-ID: <a4a487e8-4dd3-4187-980e-f77e97d0e85a@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:26:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
 <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEwOSBTYWx0ZWRfXwyykcivJmAbf
 nlm0+/YgYqZuS9zIHNcMCpKD436jD8Rl24I9SdZZ2bpG+KKg2I8f6gML74bUjEVN61aNcZ7izN7
 zkfP8jxIG7d0qnWrILXNzbhgU8ltMP1ff33sCqJvmotpVP91akQqurLvPErC/2Yxy4nZ8IkQpMN
 /WwnEG4SAI3wvJqmUYG+CfvZt5BWwilA9RvkS+f1r5q6pPu0IlGRkzKWXyd5n3ePByDFiPHHBzz
 /VdpN3dX2VliDaIAeG6rBlbJ4CPKaiHCwp7kbzyyS2Q692e26mauI6+nCDC/xv20GV0QNSnbV6C
 GxHaGjLCrk7/h9dcctXfaEKaseFy+lunmGqYHz88SO49G9gE+RncKkeuRI78msyeDRdA+GGohBE
 /vfx7OSGNAbpw23OcSEasorV7aflsg==
X-Authority-Analysis: v=2.4 cv=YJqSCBGx c=1 sm=1 tr=0 ts=6921ba1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8
 a=75Q4ZoG0bmdH4YrKQGkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 4BqDBPh2albapawrI5le4ZqjI9mqk82F
X-Proofpoint-ORIG-GUID: 4BqDBPh2albapawrI5le4ZqjI9mqk82F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220109

On 11/21/25 9:38 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 08:36:08PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
>>> Add two remaining bits necessary to enable Adreno A225 support.
>>> Note, this wasn't tested on the actual hardware and is purely based on
>>> the old KGSL driver from msm-3.0. For example, running on MSM8960 might
>>> require adjusting PM_OVERRIDE[12] registers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Dmitry Baryshkov (2):
>>>       drm/msm/a2xx: fix pixel shader start on A225
>>>       drm/msm/a2xx: add A225 entry to catalog
>>
>> Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary
>>
>> https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c
> 
> Yep. msm-3.0 does some other things for a200 / a220, which we don't
> perform. I don't know which parts actually apply to our stack and which
> don't.

Right, this patchset at least fixes up the obvious errors and those
interested can poke at it more

Konrad

