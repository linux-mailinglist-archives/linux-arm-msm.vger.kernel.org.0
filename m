Return-Path: <linux-arm-msm+bounces-55577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B52A9C2D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 437DE3B0948
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE47A236451;
	Fri, 25 Apr 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK31//24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522AC4C6E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571922; cv=none; b=RiV+fQMXHafHI7ibMjRaKWbkPp4x+Tg2b8HxL3Cn8y7zqQjyFafa2v8P+1eqLSuoLL512EImeeTC6z7Qbm2qB2VblxUuXiUDm1Pil1ImEG43/IxOu8jNuSkZDhp12xQBQ9KLQgsdt5DiRZXkKD2jA0wsmON2olLtJ5C2p5chPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571922; c=relaxed/simple;
	bh=sAcjzAuxsKz14wOdwYeN2vtA1y93MRiKA2xTQ7YT1Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkVL0spnGhD+PTxVJNZhpUXRprLj7jnI5l2rUd2c0sOI9/zRsiqaDzW9JoACNZvT+/Zvbtla0WdI1d7mu/QuYr255a/0oeSwXOLsO23zy/eeUuBnGfOhismFEM7lafcuiH3NEpwv77b64a3HcvfKY2YAmGPb5BG39MQpvsQb0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK31//24; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T9qZ015728
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBp/Sktf2CJhOpU3vnuL93wkEwguX+kdhkqReJ8UHEc=; b=VK31//24CTcu+YHy
	G2FqZiJIRqkAdrUZPK5ArXf1xd7AQWXw9b01MdWhNno4vzJf4o8zgARCjj1is6YN
	E0yQGAqF8VgD3E6Ejpb9Gg8Yi/96NdN2VSSGwBnxnFb01+3we8eIXzP5iftLyCXZ
	jVB9nRrgBuxQAIQ9qXrV2ZXbRhsBmt0hdL5pe/Zvi9FYITOoddNU2gQjJ6pUFdu0
	gJxYi8hZg0JiIwJma4DSo7opZPvLDDgG6PzFxmx5c61pw7xDh1lvivniIxRgVHEN
	JyLRIkbp4PdxYRq0REb/w8XJ52nFHvNBDp4C13kHg8XtUXbJcmySDiovK+lMdIIq
	mtHkQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gdtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:05:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae9ed8511so3598941cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571919; x=1746176719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBp/Sktf2CJhOpU3vnuL93wkEwguX+kdhkqReJ8UHEc=;
        b=XGqpKhKFnBf8SDSOqxVV4hqGr0PeLV4jov7WEDB14KpkgM+8lTEBg6p57YKayr+h5t
         zenoBNnjix61dDfx9dN7TKmzJDi2TWI2TrXgi5UB7+srvEGzsG/wHEJasEXUer3LEWGW
         08poN0zVuwffWSm80l6rJpnOoBDZdJS75YIajIMDdbDr5F4ZykqXb3pfWZ0gsQpYqm3U
         E8IBkOM7fvOaycOEsdMWimw7asjqNCxZcyPlhhSnV02B3/4/Qaz2Z88HalrzVesc0Hl6
         qi+ofkEtn+qvrvC3asTwHYbWKJV/NCNJY1v8PC45stNIHhWzHFo/vBmqF18MFIK0o02Z
         IkFA==
X-Forwarded-Encrypted: i=1; AJvYcCXVF5b9XZ6uApcpXdcyhMCq5Jp+dL627/fiB0nA9+OMeigiljx3Z3IRvVeX3Fq5zUNxwfTfxFjKULV5kN8N@vger.kernel.org
X-Gm-Message-State: AOJu0YybIheSFPhubGqf222GwB6/ympDIU/zqZUB7NUOwp36KfT3mRes
	aYAa8mOxPaO6j54LppM0ZuN66RpqyrpANdmQ2VUJSfhDhzadBI4hbnoNOuyd06sT+6kOmnHP7SG
	2wx8TEPNMn8hgyMPXg9Kag6EVHy1GFMpfDr6HGxc+kY3i6U8fyCEaqvbYsbWZ23GM
X-Gm-Gg: ASbGncsONDn2/AdE50AtzGMAaZ9kpbZ6UyFCDWqBhTyd3Ke1jdNWaiz4rAseBIIPcf+
	zJVY7Tf7VNbi7l4tzqNTvNZEmKy4e9IHTcYAAZoJbyVDC81ufJuciOhuy6Rh7yQvbwRJiyvEfAE
	SQM+bowVgOzhZgJpMOVDHRLU6rEw9QYdcPe5CaaRNG3B+v7bU0vlIxBDfeCqL81kBbbzv/qZLKU
	QydkAcQfqb5lz6936y3VvhDXok3pzCnHzGsSU3rOCawLgtc24+4qRFefT+CvnJinuZWvdY/sHuM
	6XCaLh6lMwTaH3cW9c6na2p8OpXn78PwQlwt0JfrTeRIVrvRXJ60ib6Nfr7Ge0Cb
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr84154985a.4.1745571918871;
        Fri, 25 Apr 2025 02:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ4HrzculVF+OYsrWB/QeY6ey0mgBw9+RURDMEsUzYNwrj4ge+kGalkHQyVtPOx4qELkRAtg==
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr84152185a.4.1745571918443;
        Fri, 25 Apr 2025 02:05:18 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc41sm104938866b.24.2025.04.25.02.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:05:17 -0700 (PDT)
Message-ID: <c6cff2a7-4497-44b3-a019-60e3c6034d4f@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:05:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NSBTYWx0ZWRfX6OuSC/G3I7va 8bsWgn0lW/MhhQqNNHic+lgU3k984sAqbhkVKK6m0oX1cbKZ8ZKDGXtsKDoZyZybVUewibu2Str gFPE2bNTrws622ppt6VOAKjm6HnIYNdQw1JWTSky/BzRq0PN+K6gR5ojQcGRZP/aq7L2ZkMpvaE
 KNb+R7Z+O5mP9wMEDyevg1mdshfmLTyETz6WPz4HRVACJUcNGu8t5oQ0yTlRxnVAGOXrAA3CkR2 v54WILRxv6wySN/WrYSVsMNn66M1G3bEPvV+YFqs8Uzxrn+FyHBsmbO5fHwyYV9bK6/ruF3l00G uj7FlPFCO3auVfBSR/xjnisNKyXJj5J+nvQqjrZcVBkehRpxbB1vK0F6A6nDokUyYGPBmzUo4dW
 kmpSXjFKVFprFZl1RXhJOHoMlL3xkcwwUIhja6HlKQKjEGrbTF/mdoh3Qcg40DQszp8cXODW
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b5050 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=RALOh4QmxscuBpg08HYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pK69ZLG9W2t_SF3LZJs4pRa5VlXEfm_u
X-Proofpoint-GUID: pK69ZLG9W2t_SF3LZJs4pRa5VlXEfm_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=871 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250065

On 7/15/24 10:04 PM, Akhil P Oommen wrote:
> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>>  
>>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>> @@ -1102,9 +1136,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>  			devm_pm_opp_set_clkname(dev, "core");
>>  	}
>>  
>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>  		speedbin = 0xffff;
>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>> +	adreno_gpu->speedbin = speedbin;
> 
> There are some chipsets which uses both Speedbin and Socinfo data for
> SKU detection [1]. We don't need to worry about that logic for now. But
> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
> It will be difficult when we have to expose both to userspace.
> 
> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
> so I think we can use the rest of the 16 bits for SKU_ID. And within that
> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
> reserved for future PCODE.

So I revisited this patchset and had another thought - maybe we could just
extend the speedbin bitfield to cover [63:32] and worry about filling these
higher bits in the future, when adding the platforms you mentioned?

Do we still have plans to use *both* SMEM and fuse encoding on them?

Konrad

