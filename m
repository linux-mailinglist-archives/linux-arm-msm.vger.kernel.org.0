Return-Path: <linux-arm-msm+bounces-58261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E3ABAB3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 18:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A1879E5732
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 16:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F9620A5EB;
	Sat, 17 May 2025 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfJR1aAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF7B2036FE
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747501166; cv=none; b=dqextN37ONHE1n/AHFiAztasP9WwqXlXnT9f8V2cUSI9O8Ve6G6rx1zZ1DmToKwGF5ly3qGUvNU5DZXW6rQELkE5tNPA713uQBEeZtw7TyIS/QcCuhBV9WLR3A1JOBbyGJPOAlYfFuCX7ZNkT2sgODQxACiMluGLUD+EEQKiASk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747501166; c=relaxed/simple;
	bh=Y+98pIFoWWHfZVf0d45cDKgsJGJTFlxxmrg3hMKxyZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmRcZPhA1kKsW4LGA9LmDZRHKQdXloowqe4iOMMXgUcU02aWO+QI0rGpW6b3F129eXAQpbxT7rFcupI0npTdoWqfQSys16JNbGxTET/8r6Uz5uCIQm0Tjenhgb70UFwKenuz2F7ro70SM5R3jRg3VH1G5vDbjeAM6T0ped99ptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfJR1aAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HEQD46005925
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 16:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VduflDMyjCo/QhGhOWqCOg92D4iNKsmXtMKiBxwuk+4=; b=lfJR1aAV1p1ip7Cb
	3TV0zaa2OkhlifkTqk1SlY1KOpl9KwREiBO88OfXhy/cmjdabuEzbV1+BDcVGK0e
	VrlRdE//2rnj2G9f917h5EKGNJ4jhNHNqXhDV1vbRDnweeCLHXEueCxzi9OIzZbb
	x4QLPVbY+JAasWAbfydKetxNzHdjZGGuroEnDj8aZ6kRIn9bWjD/B6w9OxD7tN2i
	JTJ8sd7J6jUKPJYLmekIPemQy8WkKNJBfzmb9ayHIhMOqw8p+fZnV50tM9iSP7cr
	lW99ED/1odFosIx9KJDfA7qgg/XpTKNW3e/S8r/8bqIbKTeEUXPLCQN63IECA1+B
	JilCIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcrw5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 16:59:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0c76e490cso8335336d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747501162; x=1748105962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VduflDMyjCo/QhGhOWqCOg92D4iNKsmXtMKiBxwuk+4=;
        b=gUK/9awrjV4U4xwNW2CTREcd4kFiY7leM/+hzH4dvz0Acrgnlq0LHx0jiTFKuM5DkW
         YU0noCP947MnLiTPqNhvqJWMOwp+skzVPvvbOgj/SZfghq867GmokDilVNYZ0qs0jFLg
         UliOH30odl9ImTozQaY6sIt9ipbMunx7iyOmcu584f81txb08zquyEBAQpfYyt1JT4db
         X8Stt0o1LXvRdpFFXOekC5aT3X04ZY8hDWMdJ9HzceFF+OkyqrBwG0CgXhK7DFrbSutX
         e/Abxe85R59GUMsGqnyUaImCC8rl09Q5G87Q1BwKsz6g1Z7NeFgf7JaeYCAcYpTyRHh/
         C/OA==
X-Forwarded-Encrypted: i=1; AJvYcCWayFXXFU8RDHkGZYbX6N5ANVzb7nYRbHjk3GhYbhkPSGF6h3B0gAUGSDTxFuNr6C7pJOzpRFOfddd7sPq1@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCcOcVgtkVUw7GRRtY3WjeENvdemspNQGH40hzyHGGy90mhS2
	Qu7lsa+ufCG9bTCopHpxhvMDErAG7RkAVc3p8ZxA6j+EDktYSlNV45ljj7+bRiEz1ShfUIMDAPq
	XLLYb/y6wnO+82zBAllxlinCRe3pb81QHuoQ4VKOCcAg9McCztA/YCwbecPPNDo/njONw
X-Gm-Gg: ASbGncunYd0oNUTmt0Z94MECvr1bTQSQbK89iCPf1OSiL14aN/oCGijh+BlKAV1lP0X
	lHMrW+B8Vthpad1ZY3W0wRqo1xxqMcPFsYEYTlz9wBb8r2jCsYMrZ7z5TLfJ8Q6bV/0BVubyOQU
	2qVkxwQi98gvX6PS6SI/lIDJ6IRVCLPaQ9SJq5dPKRpi7ju/f0+rLVxKfncn8gyd6OGbnsX9nqa
	ZgAL6FptTKR0vdJhdwnOc0gIB6ne6SkAhXxyvLhQDKjD+fYDayMP3wYR7FmA0XKL53U2cywlnCB
	1s8x7+eKJdkTrZ+pQP4cyA5SVv5lUscQ5JeK7v5KXfFig8WaepGCgrSfsnBCDy1UWA==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr24099781cf.12.1747501161659;
        Sat, 17 May 2025 09:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcjyJ4llDUii39E2slq+4BGvQ/rSC1M/Cdxte2Ejxnl9qc2kSJxoEbQNaWLKhx22SyiFqVfg==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr24099611cf.12.1747501161253;
        Sat, 17 May 2025 09:59:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm321997666b.69.2025.05.17.09.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 09:59:20 -0700 (PDT)
Message-ID: <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
Date: Sat, 17 May 2025 18:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aPTIH6uKm0krhb6aFv5BjfGGUoTt1zmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE2NyBTYWx0ZWRfX+k5CCAETKWb5
 kewqN4aUkVnSrr+a/fw+F7nefs9sMKZAqo67z9xjHEWeIkatLno9aAntkEjiVuzpQpW0Yw1mMfs
 N+GPTBNm3i+HijlKYUP0fFeymFg6V4OoG7kHtLtV4NvtgZ0Udyv2pRHXO03jgt5Ow+x8ah8p8VU
 FYMTwr32dXb/83qE6xLzKKjMa74O4iG/ciRltR9edSvJdgSLBPkg3WIfhD1JiXlvrC6agWVuQ78
 A3GsLHWVCxP7Xc19BONDgWuKgLwlCxoD8PnMc19wNtJCXih63WDw0uDAPdOXu1j/NXV5VlA3Mp+
 tuAqeZUfK9hl240zxiRvXHCrGHH1pNzsSx7fu0iCPSaZGSTznQs5J2kTCyqaXza/ofbkcoxhL/2
 WAcu+hPf6aNhjr2N7RdV3G0lLVGEpIrz8nPvxnDsqB6l7jKOI3F5TMSrrs6FcZTF9GFXELDV
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6828c06a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ikgdCv_TlNYNit3QsnwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aPTIH6uKm0krhb6aFv5BjfGGUoTt1zmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=751 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170167

On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
> On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>> remoteproc functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
> 
> Is the MPSS not present on the QCS615? It was a part of the SM6150
> design.

Hmm.. good point..

It's surely not there on QC*S*

it is there on SM6150 though, quite obviously

downstream ref:

https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi

Konrad

