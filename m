Return-Path: <linux-arm-msm+bounces-44872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46896A0B495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 11:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1275318801F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035261FDA65;
	Mon, 13 Jan 2025 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mPXAuFse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8AC3C1F;
	Mon, 13 Jan 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736764122; cv=none; b=Tq/0Xzy7IBev/pReqvFi/Sxd28bLA8kjzXO1zqGKQ42EoTiiiJLSlG1NflyQYgbNHsQyEfYreCxk2/mN0z55rAzj7vcMi+oTZKh2rEEOWdmRbfi4MjKVYImaOByz0AGlrLKdxB2+YWf+Sz4gIM+cCLreEN6VAHYEOsRni2mMlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736764122; c=relaxed/simple;
	bh=64OTuPHyAfcyrygu3ynK18oA30+pUICc3tcAupWdaiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y3GRzwN/pTaglSXaZvubl4p2c3ijvYsnUwAGM9JNpRw3eX440c6EHaiIbca9HqrLNAbmlInUajs3+/TFHRO7+22VYB78kIQnadiRyLkphPOCxFu0cQa4P0Ypl7vJidX5a0qkQWqQ9wTom0kuBDkEkzPnWgdf5z+W68K1yUInD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mPXAuFse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D6h3nJ025324;
	Mon, 13 Jan 2025 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9q+Ajub5+A/pmgcCleGRfJXPovg725r7N628f+lUwU=; b=mPXAuFsesaSJ/dZg
	TjNX4L4h943kPbDADboactXH0ntF+makvyjlB9WmYRwGbzby3XwZXP7ejxemD54+
	4AqXV3/iR1AFS9GwFNdFAxoEvq8r72aMUAN6ehsfj0rh5ER/pn9xT6YyD7UkCQVg
	j7U5gDqNTvelYf476upvXVIf1YDUjoTwSFRed2L6a2Ne569kbkGirwR92aTnmOEe
	FOdtdQHFTvTfQYHhj+PsmmqgQWbrKf+kMVeu3Jrvi125ykXp0CcTdf4xM53wJXKj
	OevSBrMyOCsWwRVKOrL++dAcPM/uO0Dlg6RoSxxmBfKwilSZuCUTDc4dgNuZ+Tav
	QxFemA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444wt4rjap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:28:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DASa7I007695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:28:36 GMT
Received: from [10.216.0.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 02:28:32 -0800
Message-ID: <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
Date: Mon, 13 Jan 2025 15:58:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
 <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UgVIlJ-PSrSrofZ2XqOpAGLhuHkBgS35
X-Proofpoint-GUID: UgVIlJ-PSrSrofZ2XqOpAGLhuHkBgS35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130088

On 1/10/2025 4:06 PM, Neil Armstrong wrote:
> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
> is done in an hardware controlled loop by the GPU Management Unit (GMU).
> 
> Since the GMU does a better job at maintaining the GPUs temperature in an
> acceptable range by taking in account more parameters like the die
> characteristics or other internal sensors, it makes no sense to try
> and reproduce a similar set of constraints with the Linux devfreq thermal
> core.

Just FYI, this description is incorrect. SM8650's GMU doesn't do any
sort of thermal management.

-Akhil.

> 
> Instead, set higher temperatures in the GPU trip points corresponding to
> the temperatures provided by Qualcomm in the dowstream source, which will
> trigger the devfreq thermal core if the GMU cannot handle the temperature
> surge, and try our best to avoid reaching the critical temperature trip
> point which should trigger an inevitable thermal shutdown.
> 
> Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 ++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 95509ce2713d4fcc3dbe0c5cd5827312d5681af4..e9fcf05cb084b7979ecf0f4712fed332e9f4b07a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -6173,19 +6173,19 @@ map0 {
>  
>  			trips {
>  				gpu0_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6206,19 +6206,19 @@ map0 {
>  
>  			trips {
>  				gpu1_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6239,19 +6239,19 @@ map0 {
>  
>  			trips {
>  				gpu2_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6272,19 +6272,19 @@ map0 {
>  
>  			trips {
>  				gpu3_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6305,19 +6305,19 @@ map0 {
>  
>  			trips {
>  				gpu4_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6338,19 +6338,19 @@ map0 {
>  
>  			trips {
>  				gpu5_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6371,19 +6371,19 @@ map0 {
>  
>  			trips {
>  				gpu6_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> @@ -6404,19 +6404,19 @@ map0 {
>  
>  			trips {
>  				gpu7_alert0: trip-point0 {
> -					temperature = <85000>;
> +					temperature = <95000>;
>  					hysteresis = <1000>;
>  					type = "passive";
>  				};
>  
>  				trip-point1 {
> -					temperature = <90000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "hot";
>  				};
>  
>  				trip-point2 {
> -					temperature = <110000>;
> +					temperature = <125000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
> 


