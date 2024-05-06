Return-Path: <linux-arm-msm+bounces-19279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C58BD5E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 21:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 393DE1C21104
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 19:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDFD15ADAE;
	Mon,  6 May 2024 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ejGK6bc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A329DDC7;
	Mon,  6 May 2024 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025291; cv=none; b=CiIIf3xd5chy+mrWZvIwMzRhkk1t76gckmejNq1xZ5zvOuhBRyJ+6+VNqayK7lkZ/6C8UVLaiVb7wPMVXuev3csmAcRJY21QO5AMN9pGTJibmqB1Z4ZZNpss3RdPKgh+r0Q80vPy/PRJUIqZq+hjfdVSypkTCyX3CK2TE0N8gXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025291; c=relaxed/simple;
	bh=1SofMlPLugistZwY8l/SGHCqle5+F8AVcDMwZvAKD4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aNEBZ4Hf2MARG2HoBA9GQgf8us7mWQgCfM10c8MomPa0KGoRG+mmVn1XWvugCW6sEsHlGbMHAeD1oq+7Bsq1WoAC0rqLf+cxFwGCZ4OUymO/6RspXe+SMjLBW+afeK9Q5SM4Cebqo9IeN3XT/u8Gy/EvJerOjZD+KnZVoNXLyIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ejGK6bc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446Ifeve026215;
	Mon, 6 May 2024 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sC84BFtLU9L/vFaY+S8V8yTDY2IAdPN3Z4iW1X9my/E=; b=ej
	GK6bc7/RcBZ0DT5py9PekjmzxTcWTfi9YXcc3dzQKYp50pSqk/5QPQGzOoW7ZQLL
	prR896+dUr+B+dtcfoJY9PYOlZDZPnhtCmJGMeZDXwQ/IBeUK2lS0E1vnnulRSZV
	8uRF13MKe4GiNaHm8olecDqgskpHQfLTdJ9eGdKehzSn5MjHpuHiQNSoVns0XlwS
	Q9Sx0/8WfGB+5o66QbvtmJP8yHGszda0ePgH/khuQb/sxIHJJWbRQJf5dKeIKkCk
	diNJgSjLUm5ryn3T5ZIlO+DFDz9joE+cbnY0ToXGuZ6gsjYcnob4SYk6GVvYdHaJ
	jLrV8RngzlEsdPwNno2w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxyc2rveu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 19:54:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446JsVao015583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 19:54:31 GMT
Received: from [10.110.125.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 12:54:30 -0700
Message-ID: <55ee8e86-e2eb-4c69-9692-df790454b8d6@quicinc.com>
Date: Mon, 6 May 2024 12:54:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Content-Language: en-US
To: Prahlad Valluru <quic_vvalluru@quicinc.com>, <robh@kernel.org>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nankam@quicinc.com>
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240426142442.7769-1-quic_vvalluru@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RcetPsM2xG4SYpl9QMUckgmROlZI_par
X-Proofpoint-ORIG-GUID: RcetPsM2xG4SYpl9QMUckgmROlZI_par
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_14,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060141



On 4/26/2024 7:24 AM, Prahlad Valluru wrote:
> From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> 
> Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> 
> Signed-off-by: Prahlad Valluru <quic_vvalluru@quicinc.com>
> ---

Why is there a mismatch between your author name and signed off name?

> v2: Addressed dtschema errors
> 	- Fixed lt9611-irq
> 	- vdd-supply error to be ignored, as it is connected to
> 	  input supply directly, on rb3gen2
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 86 ++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a085ff5b5fb2..c14d4a4bb3ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -51,6 +51,18 @@
>   			};
>   		};
>   	};
> +	
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "HDMI";

Is label mandatory? Doesn't seem so?

Rest LGTM.

> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
>   
>   	reserved-memory {
>   		xbl_mem: xbl@80700000 {
> @@ -530,6 +542,45 @@
>   			   <GCC_WPSS_RSCP_CLK>;
>   };
>   
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> +
> +		vcc-supply = <&vreg_l11c_2p8>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>   &i2c1 {
>   	status = "okay";
>   
> @@ -602,6 +653,21 @@
>   	status = "okay";
>   };
>   
> +&mdss_dsi {
> +        vdda-supply = <&vreg_l6b_1p2>;
> +        status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +        remote-endpoint = <&lt9611_a>;
> +        data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +        vdds-supply = <&vreg_l10c_0p88>;
> +        status = "okay";
> +};
> +
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> @@ -711,3 +777,23 @@
>   	function = "gpio";
>   	bias-disable;
>   };
> +
> +&pm7250b_gpios {
> +        lt9611_rst_pin: lt9611-rst-state {
> +                pins = "gpio2";
> +                function = "normal";
> +
> +                output-high;
> +                input-disable;
> +                power-source = <0>;
> +        };
> +};
> +
> +&tlmm {
> +        lt9611_irq_pin: lt9611-irq-state {
> +                pins = "gpio24";
> +                function = "gpio";
> +                drive-strength = <8>;
> +                bias-disable;
> +        };
> +};

