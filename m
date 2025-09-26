Return-Path: <linux-arm-msm+bounces-75303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57103BA384C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126CC4A881A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D056E299A94;
	Fri, 26 Sep 2025 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opsE6fbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4391E2773DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758887090; cv=none; b=YuUwXcXlU/f4EW4McBpmanzUicJrEl+PzeN+IvZl9Eka6CTdoGZLkBYrwQ/L4IeOxWaHeRJxJcRBa//T23rwFGnuT3MJ+5skL0iuy5JNmpw2Ksnmp2KS6+OSG6fpok7SjwXdbkRqvsYMlY6fx1gInPh2Cs3IqCayX2lgJvWmZh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758887090; c=relaxed/simple;
	bh=jafD62n3oYEBDKuYo3x5ICEIx1nzpV4cTgn3R7efROY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRoGZb3qmEMrrBJI1k4B3z5wQqIfnkZF3+I/LJQSf55VsOuiO6Urpi2VLlIoO6O5OfCEZcBKlsgakWj20vyDoM76FUv51CE7oT9oWU4BU5ClyvqarDS5xRbyw8fhXunOcob6lsBhJMW6Hk0QW5vaW2hyVKlmIxkCDlsgGkHukIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opsE6fbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8w6UC002161
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oazNeDOXBpNTA9CUERHFDVRMmm0DeM7PNOxF45++cQo=; b=opsE6fbDl/ENPXKt
	eCNa+YeipF2nS9vJmn3AXtZPRjm4GimhVqxxO6Wsw+f3gMIa5ePU1+gTBuwnZ95g
	WYtJdTV3oBtxadZOm/V4gknB+XIp2C+XhhC3dDFzuU+u2Fywvryx9r8lmGXYOEso
	V7aFtgWi4t+naiCCsMehgHb2GAwQx8bES1caEN1fUVhxB5JGUyBGiu76swQGMe8T
	y0Fm0JGFExvF9j38+y38IBpef9F5ONhoOhz67QYC6b7qbleQrf4MNF8E/iuadvuB
	jkRCHlUCwXcrA/Wj+mAM33G1yrUjPm+MJz/IX0WvKIIh+xNR0LeZnN0ivZEhGrP0
	pr7/hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0ttqef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:44:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-853f011da26so73402285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758887087; x=1759491887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oazNeDOXBpNTA9CUERHFDVRMmm0DeM7PNOxF45++cQo=;
        b=oAfKEsHfsMQSUx1p6+5/4tUcRosUh3WEGyd23LnbmfCPB/ZS3vMotjxK3iahY8EbNL
         GKn8fLGNW9kH/3Rw6R2QiNRiMuIYf3lnMeBtsw3hzNvW9Y1TSQKjfkIUeTdQ4T099hBa
         CLN8QqMG26JSo39IUnT5VRySOE6HiJYbEsqTQpvqukijj5uaCE0C73lLROcbVC2unHCE
         WPZydUQxDAYj2HdsV6yuqr2ev6v1bYqcm4j60uOIolahIhNrBoPIjmGzWWueWbXMda6K
         7R99KBETIuF/9P4Gyp6DDunxSaxIom6yYSVRDJG4K+UuzUl3nZK3TQknL1EDmbrzAt5p
         uCfA==
X-Gm-Message-State: AOJu0YxJw9rePEf9eifx0nwydzYvQJV2J9UYflj+LFkQzweJVHAZsjtk
	XkSvSV4PfurvSy8HdGDU+Uo+YJkmNT5DC6KOw08IHzOtcMySBMCdfsHefSvMTBP5IenR5Sd3mdO
	migpaY/i8CY4hqcTJ3leg8v2wQacUvAR+msfGeIXPK/0XhF0RcirNJpMc74Jh1ROPNCKg
X-Gm-Gg: ASbGncvJW6XVVkrvj2y5eMK0TlT1DRsKbB/TsU39Sz2qigMfMcBdtmOzVrzyL2e6+AN
	S4LQFxLdmrYYJOz/Y83zUSWg7Yd/2W2utep14qg3JLy+sWVT1DVf0pJQre034QfWNIj2m8U63Hy
	FldhxtuJLu3bOXOdDJtnJMdmWiVzYPDXslLcZEKw1hxNVIvU8CdDp/CI0QmdnlAskTZuCq7c5+5
	1HbcpfmMWoCpz6XnVCybx4VFDV2DTuqfFvT6doDhgr7Aq+jezaZVjpBdSInU0kj1L3ql/jBQfJ6
	tMdfM3fwRkmYrvkE48HmYnV96GJ+1KnH/VRInCOo/XJnRnmYQhl7XL/3e4/iSR4bbmAgCOaGhho
	6SSZ6xTHJROy6wocuErXq3g==
X-Received: by 2002:ac8:57c9:0:b0:4d8:85db:314 with SMTP id d75a77b69052e-4da4bfc05b4mr56721151cf.11.1758887087228;
        Fri, 26 Sep 2025 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUJgskH5/9pO1Sz5CQgZsxdYJG0av5mRyh8GQfkS2NLlVmdflNR0Y7Vg+ttb4L9svIeMZhPg==
X-Received: by 2002:ac8:57c9:0:b0:4d8:85db:314 with SMTP id d75a77b69052e-4da4bfc05b4mr56720871cf.11.1758887086719;
        Fri, 26 Sep 2025 04:44:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f86f974sm353684466b.40.2025.09.26.04.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:44:46 -0700 (PDT)
Message-ID: <ccb57be5-7f8a-4008-a650-4683d34bfeff@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
 <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
 <94f6754f-cc56-09c5-3730-3f36c22e4786@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <94f6754f-cc56-09c5-3730-3f36c22e4786@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d67cb0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-AzuYhFZr7sfLd3NIz8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -pq2-E4LGT05woaodO11MfaScwdgjVlw
X-Proofpoint-ORIG-GUID: -pq2-E4LGT05woaodO11MfaScwdgjVlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3DRo/ivRVYoR
 EnwAcgEQ77fp/E3Nwdh7VpQGL1IHD8J2Gz5CQQGl44ZysmqZ0MG+XeBrCVOw1F0uVqjECaFT1VC
 s1C4/clw6zbcx5fNfORMXeeZKRxztdo9xM5swhsVIju7KdzboZ/HI48KJdRzt4HyJTOxFwAkDA0
 lzYy0VKH0+gPTyvL6+joMVhh6Lylxy5gX3xR6f8vra39aWTHraw7ItM5w8QuEHWr+b+TloaGjMO
 M4X7sqfNuAUSauVyXQCuQZVAfTj7PO5+ZamsXM9YEX2Hht/U0yYX/ONIJnpuTx8TAY/bgf/LDYu
 jjDfyRY+sS27nvIjPD5CXPxH3a3wAZEYw+F+zOJ6XTzmRXs7PzXiLPc6ZawBvzsFQR+BHFmkNK5
 c6HNCk5CMaZvYIm9sbOpJxzXQZiYBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/25/25 9:27 PM, Vikash Garodia wrote:
> 
> On 9/25/2025 2:31 PM, Konrad Dybcio wrote:
>> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>>> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
>>> configuration as array such that the multiple configuration can be
>>> managed per platform.
>>>
>>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>>> -					     cp_config->cp_size,
>>> -					     cp_config->cp_nonpixel_start,
>>> -					     cp_config->cp_nonpixel_size);
>>> -	if (ret) {
>>> -		dev_err(core->dev, "protect memory failed\n");
>>> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>>> -		return ret;
>>> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>>> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
>>> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>>> +						     cp_config->cp_size,
>>> +						     cp_config->cp_nonpixel_start,
>>> +						     cp_config->cp_nonpixel_size);
>>> +		if (ret) {
>>> +			dev_err(core->dev, "protect memory failed\n");
>>> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>>> +			return ret;
>>> +		}
>>>  	}
>>
>> Do we need to do any "un-protecting" when unrolling from an error?
> 
> Not needed for unwinding part.

Thanks for confirming

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

