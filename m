Return-Path: <linux-arm-msm+bounces-23018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564690CB62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0CA828BC5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F23F13AA53;
	Tue, 18 Jun 2024 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kmWBQGSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291081725;
	Tue, 18 Jun 2024 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712716; cv=none; b=KxM1SoehPoOMRK/xMhCmVwzI2LAAHXbNO2UYBquicL9lrBbR/YM70cq875B89Z4TAxp+KplJYVdBIWX6ElTFzfad1En4xDo2xrY+5fDUouvhwc8tuqD1B+tEUkj9HiVqyEIs4WvivGUW/zrX68cmEU/rx2tRyZnKZYL5fmAmek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712716; c=relaxed/simple;
	bh=tkkmd7e83SLx6wWZRPA2+oL9p5SIi1EfrihV/aj5aNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PLNtv5LUjz/BTViUA7K6g5u3Zh2m20T051WmcP3loo0LLpKDYyK8uhhz5fXTOmkJUzTlMuXTeQc80Notwjdr0gGNCbSsyXtj/tsrZH0kNLaZO0oFwikNcMQre7wetjgSxWiLrmaTY+s7BJXIrVIA8p6yyAQmwytJPF3XJE6cXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kmWBQGSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I3D4L8011398;
	Tue, 18 Jun 2024 12:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8QJeXfloRrBSZk5mn02oFEFrNdkTUucnuv4dy6+P3U=; b=kmWBQGSfh7VSXDtZ
	dk0M+HQerYn4zHGQsssrCP3WrhKcVeUo3zLGO+c2dboW2IfEODo5DLUWSC5Gu7/B
	EDrUL7/CuTFp/N6NItE//9XYgbJigME2buNMCQcNtWU/UuX6ytSw0rYZsZeuONMo
	+YPThcdJvU380XBoTVKY2mY9RlSdxPirUUIuGvRMSlQ+Rri/4WS5HRdUo/ke0Vhg
	y8Q4v95DXND2IVqSixFrxL7DNZolW5idj1JnBRWjK2riruXl0CqfHFIYM8g8V2tL
	/PnropZtbQEw4Af5KLmASp7OVfXT16Qw2jz8sKYJ9hZL8bsoIzk+LI+jCW7x85v/
	geHG+g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu24n15x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:11:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICBmxR015711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:11:48 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:11:45 -0700
Message-ID: <7bcb66c1-39a0-4296-aadf-4889475d6ba6@quicinc.com>
Date: Tue, 18 Jun 2024 17:41:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][RFT] arm64: dts: qcom: sm8550: Change camcc power domain
 from MMCX to MXC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240612214812.1149019-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20240612214812.1149019-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -kwfyTtl-q2s6lBccDq9idjJnM9_tM81
X-Proofpoint-ORIG-GUID: -kwfyTtl-q2s6lBccDq9idjJnM9_tM81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=737 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180090



On 6/13/2024 3:18 AM, Vladimir Zapolskiy wrote:
> Any attempt to enable titan_top_gdsc on SM8550-QRD fails and produces
> an error message that the gdsc is stuck at 'off' state.
> 
> However if MMCX power domain is simply replaced to MXC one, it allows
> to turn titan_top_gdsc on successfully, even if MMCX is remained off
> according to /sys/kernel/debug/pm_genpd/pm_genpd_summary report.
> 
> Note that at the moment qcom,sm8450-camcc.yaml gives a definite comment
> that the supply power domain should be MMCX, and it may be needed in
> some certain cases, but at the moment they are not unveiled on SM8550
> platform.
> 
> Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Thanks Vladimir for reporting this. I will check on this issue 
internally and will get back on this.

Thanks,
Jagadeesh

>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 4234c92aafe3..a429115524a6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2754,7 +2754,7 @@ camcc: clock-controller@ade0000 {
>   				 <&bi_tcxo_div2>,
>   				 <&bi_tcxo_ao_div2>,
>   				 <&sleep_clk>;
> -			power-domains = <&rpmhpd SM8550_MMCX>;
> +			power-domains = <&rpmhpd SM8550_MXC>;
>   			required-opps = <&rpmhpd_opp_low_svs>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;

