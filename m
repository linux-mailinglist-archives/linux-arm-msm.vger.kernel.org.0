Return-Path: <linux-arm-msm+bounces-66611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C1B10FDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 18:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C381E581EED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1800F2EAB66;
	Thu, 24 Jul 2025 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJrqaO4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C608F7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753375536; cv=none; b=kT9IHPKKT8/WGF4ToIMfZ1iAaa+kVzkqfpbtmZGKgKclOsk/LmroQgDkgPyrMbkTJkBk7jfKBLC8cYvqU5Kv5Ke3we1zWGw2Uye6Gv/Tc84+jKhkJbVi9veoOBz2gHNSFm3S1oRRAKbdw3XPliynnYg+65zNFfk/N0z+HBLMrpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753375536; c=relaxed/simple;
	bh=osb7pP1Dxnjt3QVN9AJTn9QJiwHP639Jec032gob5rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRHqOoAeKkaOrmlya5i4RvzWFgI2up3gnHrTvT2e3hdJ7j9fSn8s3KZQUISvK2+mMZDeprv6wBn8Z2tDTAxCfcLq9ODIREID5ubvZUpBoFKHsi00xVrn6JsyeTR/cSxjmUe8GXDz2IEyvTEI70NN3E0WB9UNfgCAAUilE/QHiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJrqaO4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OA0l3C031506
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaRb9zpC453+UAqZ78fHrEC7c8i38sw8zSJ4myj40SY=; b=DJrqaO4N52X51pv3
	sIf/AZ0g8O9a9g3sWh9QteNUucHQYbDp159CRn0BmNmlwIvEO9kVBPhQnrEPEX0A
	rtAxBfKwGPAdzkkk7qqSk7e4qEMVmgWDPMdRdgGvPJ++bgDYktprHKPyk8ONEefg
	gkLXDm9watwyPB+WR86btA9vb6WOPzFXkBhw6Tio3lbZoCCTbOA+BtH2esyD93fw
	VRv9Zs07Imu8ukGf//I8a1h/2S7wJSvlcd/p76mnADzcm17lXnlJg1mXqRfBUY2J
	cfqXsVDRv4now9TNMCzZCNsvoeEA7v7lqKfhM8THFjjicddUxFMyFlPWmTqoaSnt
	+mLydw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vfuf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:45:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d66fa6so12020745ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753375531; x=1753980331;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaRb9zpC453+UAqZ78fHrEC7c8i38sw8zSJ4myj40SY=;
        b=v/s/9Vw1wiiT3iIepIY56BoE4cwhXekOizng6Yrt0MMgLTjGsqiXNjYWJZr1r+f3AB
         7l+cGsjR41+pjhfqxHu2U0DvPyyye4slkEz8Z57QMaH1XtyIT5imAyZfWYy8OxnUAcv/
         heG9zapZu7pax4yjD02rzZdOK19hsZ9PHDudx6RMgNX49Sl8yrhbdiwNkahR174GheAb
         9XHEBuViYrI0Svg4qGLYy8hOZmbJq/qaVMEy4z8qgSiwhO+/pmcT5z68JFv2W1bVfvSg
         YwOTIQKcfa9zjriBIHcLy/2iJrifG83ZNmrmBXd/HnlVFWuM84oCzfL8V5ER/rPqJcVu
         70ZA==
X-Gm-Message-State: AOJu0Yw+G/MzOtNAJ6vaMxlNUMCPQ47CDXwqVi0Rti+r6yZS7NFeeNX0
	zxsX4BRPxPXonR1Qeil8XBU4L6FrcuGqFvgGlZCAS2eGOmWLCDrBqJAdaDk4U7R33Zy82mLDQCB
	8zzSHmMwS9tBl3QJjrkgradf+YvkHlob8ZqWp3RFph1BXX8yCTlSLVDvQ8usHJGkuu5/g
X-Gm-Gg: ASbGncuNdoBAV+br+HgsyhNC+6ntEtgctu04kwGcgzUJvwHe3xcZEvUg12ebWLfobEB
	vKC9RJp+87rTJAiwCOVfNS7HwK75UaPqIeWaHdQqsLEpWS0cNI0THnh42KwssWD4leenn8fQw/o
	2RvdKEg89/BXXAhm4JBIgMoSl24KRg9GSxMadp8+i4LJ/6Ml1njW/PWpKU1BMl1XHvoCzXGYNiM
	TDGWvGJB/G9c7K981Swvwj1p12xXmtqw3M/Is46qawvaL1pD+bHh2xgiCxCD62+WJrXSMju4cAx
	eXeeCNSFHZBMopVztSEN2bAawMFZvIhCv5UEqvHO2X2UfT2kz82GVSUCGliAVg==
X-Received: by 2002:a17:902:db06:b0:231:e331:b7df with SMTP id d9443c01a7336-23f98204677mr132438695ad.29.1753375530639;
        Thu, 24 Jul 2025 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpvYX2jYW1U/FwxOyFgTM+kx5Cd2w9I9tAzBvo64AFEnqPhhsH7VtWSVH5081qu+meM2GojA==
X-Received: by 2002:a17:902:db06:b0:231:e331:b7df with SMTP id d9443c01a7336-23f98204677mr132438245ad.29.1753375530206;
        Thu, 24 Jul 2025 09:45:30 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f3bcsm19431635ad.10.2025.07.24.09.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 09:45:29 -0700 (PDT)
Message-ID: <2820a69c-6ea2-4740-9264-7413ae5be70d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 22:15:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
 <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
 <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gpvLsk9pwHKzVzl6i2GhJmxSun1SCTa9
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6882632d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=bFu9_hsFAaDUiof9l7EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyNyBTYWx0ZWRfX+6UKjwZCH2TV
 cZ+w+/GxJvRicuqbFTqD/OUgt3PhNtwafwrnrqfLFzgSCzw6NrwzZBKXMB5engW7XWGGtaJTn/e
 /xrRevDx5ePLdNicHl1VB0XoTpXnouxnuzDpzIP1uWupjgnWBkgXol1hi2KVHB9qBsqfPMOKnt7
 2KeF50CQEczfoBSp5UYSZU0x63HAun6YUe1JcFsTTyqNuvu6teT0fIy1fIFRSvt1ZJ7yecW+UB1
 eXvMK9aVf+NXIhK9007loKKcR6eYUinLkSs7CK6y4qwyL5/RVhu343PO27pS6/7fm0wDzWeZ53W
 DEjFSRIHf88p0hC+BvYJydsstp5yCrpdVjTih3tOPdAYlGd5c5RCMsm2x/KK4SvJlkIwNrmtQFz
 vV8hJ8uW8DIUOn19IRS7QLnNQfn+0sCUrj/nuUvFyIcpLXH8Q5VQaUfR7wvf6c6ZWyFaJf82
X-Proofpoint-ORIG-GUID: gpvLsk9pwHKzVzl6i2GhJmxSun1SCTa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240127

On 7/24/2025 8:14 PM, Neil Armstrong wrote:
> On 24/07/2025 16:35, Akhil P Oommen wrote:
>> On 7/21/2025 6:05 PM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>> the Frequency and Power Domain level, but by default we leave the
>>> OPP core scale the interconnect ddr path.
>>>
>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>>> drm/msm/adreno/a6xx_catalog.c
>>> index
>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>               .gmu_chipid = 0x7050001,
>>>               .gmu_cgc_mode = 0x00020202,
>>> +            .bcms = (const struct a6xx_bcm[]) {
>>> +                { .name = "SH0", .buswidth = 16 },
>>> +                { .name = "MC0", .buswidth = 4 },
>>> +                {
>>> +                    .name = "ACV",
>>> +                    .fixed = true,
>>> +                    .perfmode = BIT(2),
>>> +                    .perfmode_bw = 10687500,
>>
>> This configurations should be similar to X1-45.
> 
> Including the perfmode bit ?
> 
> +                    .perfmode = BIT(3),
> +                    .perfmode_bw = 16500000,
> 

Yes, both.

-Akhil

> 
> Neil
> 
>>
>> -Akhil
>>
>>> +                },
>>> +                { /* sentinel */ },
>>> +            },
>>>           },
>>>           .preempt_record_size = 4192 * SZ_1K,
>>>           .speedbins = ADRENO_SPEEDBINS(
>>>
>>> ---
>>> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
>>> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
>>>
>>> Best regards,
>>
> 


