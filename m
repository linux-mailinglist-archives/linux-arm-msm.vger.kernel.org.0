Return-Path: <linux-arm-msm+bounces-36789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209C9B972F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 19:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C451C20FBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A071CDA35;
	Fri,  1 Nov 2024 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oK3u5xBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514A13B7A3;
	Fri,  1 Nov 2024 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730484874; cv=none; b=R2U0s+uNmiGz1GBornFcPJRsu7vJe7hbNYELumLvOWoEAsxwU0DMjBhzQbYTi5Ub51C5P7PhTGwjmcakE4nyyiOiON+e4zjFxPKTHUz3B9h4XxkF1LB3KLVaUzoNhN+jFXdje/7aHDfxb8dV4xedKcyUSJ6K2Dek11bQViLGkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730484874; c=relaxed/simple;
	bh=3+93vesMWQyfGnfGk5GJMh6n05pwKrzpr5yD8ZLBTEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a3tU3bJT/ncvzPUMbl/J/miVNgZj5G6teWwEL8RhvvTgdOyhWTDpVDXC3zhwXzNeb/ERSWHkc9sC+YWnIxuAYNGYaekMdit+1SJD9Md72E9xalEWjAcKfBVLdnQnPcJDkeME+wkl7olBXMiMJ4sLRLdgYcu5h1DCGIeO5ILFOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oK3u5xBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1CFnES005716;
	Fri, 1 Nov 2024 18:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1A+76fLJ1cCVwHO1FE3TMyQQvN8+HfYW+6T23oY8E6I=; b=oK3u5xBy9N+SZWCp
	c2oFJeZls3egs0DxOgXSKx2ZkPbE0fLiV7Nmms2ymgkRNgvfQlJ2SQTHb0j/KACg
	65uGSCpntWYNwGgLMAUK2hbVhqBK0vPIjH79Q10KdYoDB33UVV9m/hMlH9A8CREQ
	Wv4NcyhgxQ5Dvf0ryKQu0Hz70Q5+K+dZxjdmgZbZMAYav5C25bcGkmxcX9jp6Bpi
	wGtdasN6hWDppJ6UzcDUCigNuW45iDcDqWnYqc+BfADcFVoHeel2EElmPoZXte3y
	muWeF6I/jqeyJ0PbwRdJp5ylZqLEJUMSESXbMFLl24ePgyVqXMagF3rRmDRtSzIj
	Q11IrQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1xce61b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 18:14:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1IEQA8010349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 18:14:26 GMT
Received: from [10.110.33.199] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 11:14:26 -0700
Message-ID: <0782c956-361b-4109-a8a1-58b8ad396e0b@quicinc.com>
Date: Fri, 1 Nov 2024 11:14:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and
 ADSP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
References: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
 <20241101-sm8750-audio-v1-1-730aec176459@linaro.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20241101-sm8750-audio-v1-1-730aec176459@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xQaPixnRuagtCXyO4xD2_6JS2h7fJyVb
X-Proofpoint-ORIG-GUID: xQaPixnRuagtCXyO4xD2_6JS2h7fJyVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=725 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411010130



On 11/1/2024 10:19 AM, Krzysztof Kozlowski wrote:
> Add nodes for IPCC mailbox, SMP2P for ADSP, AOSS and the ADSP remoteproc
> PAS loader (compatible with SM8550).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 140 +++++++++++++++++++++++++++++++++++
>   1 file changed, 140 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 98ab82caa007ee63c395a3ce0f517e2bbeb0aecb..eb826b154dcb2d8165426ba2225548efd7547da8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
[...]
>   
> @@ -538,6 +566,17 @@ gcc: clock-controller@100000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		ipcc: mailbox@406000 {
> +			compatible = "qcom,sm8750-ipcc", "qcom,ipcc";
> +			reg = <0 0x00406000 0 0x1000>;

nit: unsure, but should thse be 0x0?

> +
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			#mbox-cells = <2>;
> +		};
> +
>   		gpi_dma2: dma-controller@800000 {
>   			compatible = "qcom,sm8750-gpi-dma", "qcom,sm6350-gpi-dma";
>   			reg = <0x0 0x00800000 0x0 0x60000>;
> @@ -1975,6 +2014,19 @@ pdc: interrupt-controller@b220000 {
>   			interrupt-controller;
>   		};
>   
> +		aoss_qmp: power-management@c300000 {
> +			compatible = "qcom,sm8750-aoss-qmp", "qcom,aoss-qmp";
> +			reg = <0 0x0c300000 0 0x400>;

Same as above.

> +
> +			interrupt-parent = <&ipcc>;
> +			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
> +						     IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells = <0>;
> +		};
> +
>   		spmi_bus: spmi@c400000 {
>   			compatible = "qcom,spmi-pmic-arb";
>   			reg = <0x0 0xc400000 0x0 0x3000>,
> @@ -2884,6 +2936,94 @@ gem_noc: interconnect@24100000 {
>   			#interconnect-cells = <2>;
>   		};
>   
> +		remoteproc_adsp: remoteproc@30000000 {
> +			compatible = "qcom,sm8750-adsp-pas", "qcom,sm8550-adsp-pas";
> +			reg = <0 0x30000000 0 0x100>;

Same as above.

> +
> +			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
[...]

Otherwise, LGTM.
Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>

Thanks,
Melody


