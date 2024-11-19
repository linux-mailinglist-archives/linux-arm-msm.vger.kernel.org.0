Return-Path: <linux-arm-msm+bounces-38294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EE9D2267
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 654B4B2213B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1011C07C2;
	Tue, 19 Nov 2024 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nYatqqQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2241C07D7;
	Tue, 19 Nov 2024 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008147; cv=none; b=U6NYa2+k8eIAMo1F1PFgdTUnVNXxrV3FzRntjFT1JgXThBExKpciDcfyeqkXKxUgRdVvtSClM8/qR1OaIwe9gH/K34bC5OtcmHPr8d3PT8SHgfEKYCJp4QV+QgkihJvXW2QrdQBrg/WKNj4kFk3cXVGSjTLjKlhRi8ZVNBeJSw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008147; c=relaxed/simple;
	bh=W0kylkLy4P3MU5Xwb1kcvgvN2vy0PWZo5uTSAP8A9xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DSi8VyLpG4pZmSI5QuqGg2qi/ChWAqugdYFY5BTOWxFQdS1xkXQK1oCSiPoZyef/UBZlXufyCszfWxO1p7eCVHOmY6O8pEZXlcxhr0iA4+hJmcg9RB2+7Q3Rb7iFb0TLrC7HLbYelF5RUT8g3QajP5SKAvNaNG9lFipvwCD6tyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nYatqqQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7h2X0031218;
	Tue, 19 Nov 2024 09:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8frZC1PrgVzVzBzyMrewfX5KrEeP0IsVOp9VgM6LpQg=; b=nYatqqQkWeU1n6kV
	xnTRGCCxgT+EEYri1y7D0HsEgVyyx0nVLoUMPtmizUdY/nstFWGo2cIfFebi6eNZ
	uUTF24pH/IGiqqTJg8E5zq0j7WG4dZz1iGiy3+6hF+LUNHgBfLGGfWU7nd87C7Gz
	axYicpHIzPQOfeRE41IFuP9rdkdkk9/BevbuqewpKwSVBDOV4nYXCZ5j/2NYG5Mf
	Z2xB6ZSdF50LIIFv/ZLPZlu+NHHFZSEgPixQt8vZoEAjsGmwklbuHwB0wVOMwGXQ
	PxoLVov2KHgWcCOwoRR0/FL5ezqkrRUyURoanNnXqezdOfRyi3Z4/sWPzTOYoRvi
	LnBSNA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y9223g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:22:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ9Ltqb029249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:55 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 01:21:52 -0800
Message-ID: <cc57833c-13ca-48ae-a6d9-c7fdc545743f@quicinc.com>
Date: Tue, 19 Nov 2024 17:21:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable Primary USB controller on
 QCS615 Ride
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20241119052854.995691-1-quic_kriskura@quicinc.com>
 <20241119052854.995691-3-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <20241119052854.995691-3-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EMgZiG0_qsKh0zFk_r-PedGpzpxFFP1T
X-Proofpoint-ORIG-GUID: EMgZiG0_qsKh0zFk_r-PedGpzpxFFP1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=917 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190067



On 11/19/2024 1:28 PM, Krishna Kurapati wrote:
> Enable primary USB controller on QCS615 Ride platform. The primary USB
> controller is made "peripheral", as this is intended to be connected to
> a host for debugging use cases.
> 
> For using the controller in host mode, changing the dr_mode and adding
> appropriate pinctrl nodes to provide vbus would be sufficient.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6..b647c87b030b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -214,6 +214,29 @@ &uart0 {
>   	status = "okay";
>   };
>   
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l2a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
 From schematic, we need use the "vreg_l12a" for vdda-pll-supply.

 From bindings, we also can see need 1.8V(VREG_L12A_1P8) not 
2.9V(VREG_L2A_2P96):

62vdda-pll-supply:
63     description:
64       Phandle to 1.8V regulator supply to PHY refclk pll block.

> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
>   &watchdog {
>   	clocks = <&sleep_clk>;
>   };
Thanks,
Song

