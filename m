Return-Path: <linux-arm-msm+bounces-71853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ABB41EB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36BA3AFF68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF432E7F2E;
	Wed,  3 Sep 2025 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeKZUD+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46012E7BBA
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901897; cv=none; b=iXVZjTPG+IqOkMkapznU3CezO/mNbqFrlSrGFiD5bUDmitVGZ/WQsROu78uV5dwbVYfEb4BYnSt8WqmeWxkZMAU5p9XzcMbM8RYvuiMBsqDoNnQeeB4WLjuAXIuYPwOD434rgb9ZnGjnqLLv5kxwzsWlbsJck2KJksxPcXJBaDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901897; c=relaxed/simple;
	bh=h5MwF6L1pjz2m1cXTQs903RhWTNIphI7ZF58yr9PH6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQe6WvvIAtFIFEjD4URJ2Tg7lhYuPV28UYh8VSXx8eYlxC4BuJWiTLp4Egd6d8ehlheHQrqGdozK6CRLKGpCbHBiTqi4p3a1MtoJDcJbGUQIx8fCD6/ZW1jm04ThMmoL/ixTCIwlGc1KIdPPI6X6zCahaq+OVickLlBga6z11Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeKZUD+t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEukF022405
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 12:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AutDsvD16EOr0OTgbsZtdjV+hXDkbazkLSfLhhee5as=; b=WeKZUD+tSWL6z40p
	46t9ccDzdqNz9IhWmGqyqH5aDLYGYQJK+DPJ48xUKg32UdsD2jGpejoet7Uk2+gO
	ETQXNDwF2wohwDfUVpr8bqrlIga0Mzi9jSsdrVd5+w0jELoajzvf+WBwH5ryFxVT
	ZAulzIWcPAtqxA04EEEEavRIfla0Dc6VWQRH/iS3lLKm0McyXimvMwNvxH5YcSiW
	4kfq0vPZA3oT2AQA5BoqPbznZm0EC+QHym7j9Z6BxPlh6fJ02Jv3OdedoZPdp9es
	PKpP30WUABusKrKe9ilMVbWz9sixNw9MGVLNkikYqE6ZAPsvd7tPdoVQzp2NcGs5
	PSA+6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkfve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 12:18:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2967fd196so19447371cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901894; x=1757506694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AutDsvD16EOr0OTgbsZtdjV+hXDkbazkLSfLhhee5as=;
        b=okbToRINtifnk5FALbUlPd1MwEsXAd8B8iyzaDXJ3+6mw8vOmauewECwM0RKYpzR39
         4Bo50GUWx6OvbhI7Zff3dvdbizk3sIhwfn9EsSVFlRPJJUf02nzeuUnccTlFC061WJvj
         Crc5RHTw3zJI+pDPvRgbz38lpScyOdSgd9f28rhVEkZrHTUrl7haH4/GScldrY5AAeIn
         AqVCg3u7Dra82bVr8goaUso0JCtvZylimkPbmRpGwZsuF2ex5N6RxSlt8DAw7dYS7OBM
         LDg6Urr9+HjDJFl3ECY0xaOsJF4vcnY3umxV5oftUP2bfQSc67V6sOL1ofJaAwzCsjda
         RJXg==
X-Forwarded-Encrypted: i=1; AJvYcCWMLQTCO0EkR3fHevP2pXqMTy+BOND6yNhojFUNptnGEALs/h+UyMP01ZBJS3vrN3Is+beTkfCl2YdSZCU8@vger.kernel.org
X-Gm-Message-State: AOJu0YwLVOgLtZ5C44ZQCkSy4PEnBNVC3X/GviYEm9aANbcWx5zwQBQ1
	eSFDC/G08WxCEDImph5WMNLMfZL2XDp51hrDLSuzrby42UhIYz/9ANjjq6F9eNozhRKNz2M6fEh
	1nofoAl30eSgYWDclAYbTV2w4BTWagKFVbaQu3V7nNRdlrrcbmf4caP7Xz7CvwEZSivOK
X-Gm-Gg: ASbGncuHfqKFSgpg0bKuLR9LqRP1Iso5Qnx61SySk7oOo+lqIuzHoaCR9+HD0haokUS
	p2cHmRWN68VCTD8ujLKboqViRhLw2MG8X7PO4p1LjNwj4meLzJifMPsaiKeZtkWh0zrncoYOydg
	A/t/duxje9L7wpMFs+A63vibR7svnhvEIv/rKpRGHdbcvucCN1/y/qlvjdtxDbu41wydrYYbT28
	2huGLThLeOrAIwTuI8OFr+CF9xc0ut7Zl8m3eOpoUVbvAe8QrRAM+lnO+ngPmPPTO5HlH7xCINv
	gl1iYmDElvFNh6xJ6UDN2a4jLBnjn7eLVRcnx5MiVQuGamCqgo9A5sdAs9i1TZ2Bq56yrxqfBFc
	MJmjUeZmp3rqYrqQ/eIySqA==
X-Received: by 2002:a05:622a:1789:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b313e65205mr133752551cf.6.1756901893556;
        Wed, 03 Sep 2025 05:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRf8S2c7HLcbCmImimNW5RYrayUocv/8HOkBFVTA7YGJOz+PpskH2Zk0DqGoAc387ucyJKuA==
X-Received: by 2002:a05:622a:1789:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b313e65205mr133752031cf.6.1756901892843;
        Wed, 03 Sep 2025 05:18:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f6fb232sm882398566b.87.2025.09.03.05.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 05:18:12 -0700 (PDT)
Message-ID: <4ac0ff3d-38db-44cc-9e36-44f9e819e96d@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:18:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX/ZV2MhY1n8cK
 Vo6Bw3o8Ql1Zob6mVRv6PS40gw6nSWoDpJnJ8zlihM9aDD9WoM8e7Nsnmrjq1qV9dQfF+M32wZO
 jwe8TgEfnyCKWeQr7CQO+fVGHUxU5EWEoAVMHQ5f/SUwjjVwJSqr73YLNH/Dqsy+3wmAPdzm/mc
 zZRULmxg+6DsfR/Eqobzv2P9jA73lnM5xSLpyIcjSpa9t+TB1GKy7R8j2ADmHEwAkHwaouDMF4I
 6jVa3nnexk0tjpMZh0hPP7iXl5DQuaslqARM7ysJyFKLkBxKoWy/xsZl7eYLj8cX7XBQST3fZvA
 e0t7mMdxlHyHuzq7oTL97EDoBosGjg4lGuXmKcSsE7+gEVD27pGr/T2GLgpp3ze2zO/SrJw1IBE
 /B/RoCmV
X-Proofpoint-ORIG-GUID: DfFX_OLbVlg8jDesW26VSzn3_KMafQJk
X-Proofpoint-GUID: DfFX_OLbVlg8jDesW26VSzn3_KMafQJk
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b83207 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R3Qjy7WId1ItUu-RO-4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 67 +++++++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 8eac8d4719db9230105ad93ac22287850b6b007c..b5d4d07b2fd9c14a6f1cc462c695e864394cade2 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -6816,13 +6817,20 @@ trip-point1 {
>  			};
>  		};
>  
> -		gpuss-0-thermal {
> +		gpuss0_thermal: gpuss-0-thermal {

You don't need labels for the thermal zones, just the trip points below

Konrad


