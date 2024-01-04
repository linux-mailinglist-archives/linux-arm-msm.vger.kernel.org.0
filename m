Return-Path: <linux-arm-msm+bounces-6424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93005823DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 09:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400C1283428
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 08:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EA11DFC3;
	Thu,  4 Jan 2024 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dFtw7PN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F921E500;
	Thu,  4 Jan 2024 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4045WVvh021000;
	Thu, 4 Jan 2024 08:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WAfyDOUyqKr3QCBDBhjMPVpOixaOa1ujfCT95vQVn/w=; b=dF
	tw7PN6fHdTdZzIGsrsel/v1zTpdhrCTDbgqHKYRrg14b0UIKzpCUPRZnTxfkTPIW
	Bcgk1b9BdnP5tvDXWwle11w5M0iHPgJu6oQOeh2emwvhdjy1GBDKE5vqr1kgX5XB
	vKdUl5e4B0f4z4MWziGoiQ7bjlVLJRZZz5Sg9Q39sl2eT9gOmgoAb0I01MeZ+Z1y
	qmltL4xu1asFAfE8m4UTJ8BYXKp4FxRp+7OX9KnXryenBoaO9zGCbeB8r8MmiCp5
	zWZCc/Ldh6wKR3f9vWey8P54cnsmhvX5ScVQT9axvN71C5miDF3k9oChfkYk01TF
	00RJ4uCpOrpz/iZWTQiQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdm07guw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 08:45:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4048j8vT014311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jan 2024 08:45:08 GMT
Received: from [10.216.4.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 4 Jan
 2024 00:45:02 -0800
Message-ID: <07b35821-3b95-ce9b-8a62-7eb8cb7a8ddf@quicinc.com>
Date: Thu, 4 Jan 2024 14:14:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add additional MSI interrupts
Content-Language: en-US
To: <cros-qcom-dts-watchers@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_parass@quicinc.com>,
        <stable@vger.kernel.org>
References: <20231218-additional_msi-v1-1-c872ce861a97@quicinc.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20231218-additional_msi-v1-1-c872ce861a97@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rRPZPJ2l6nCZm8IuAyGMM1cyY2WwboCP
X-Proofpoint-ORIG-GUID: rRPZPJ2l6nCZm8IuAyGMM1cyY2WwboCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401040064

Hi All,

Can you please review this.

Thanks & Regards,

Krishna Chaitanya.

On 12/18/2023 12:01 PM, Krishna chaitanya chundru wrote:
> Current MSI's mapping was incorrect. This platform supports
> 8 vectors each vector supports 32 MSI's, so total MSI's
> supported is 256.
>
> Add all the MSI groups supported for this PCIe instance in this platform.
>
> Fixes: 92e0ee9f83b3 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes")
> cc: stable@vger.kernel.org
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 66f1eb83cca7..e1dc41705f61 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2146,8 +2146,16 @@ pcie1: pci@1c08000 {
>   			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>   				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
>   
> -			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "msi";
> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +					  "msi4", "msi5", "msi6", "msi7";
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 0x7>;
>   			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
>
> ---
> base-commit: 5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
> change-id: 20231218-additional_msi-6062dc812c29
>
> Best regards,

