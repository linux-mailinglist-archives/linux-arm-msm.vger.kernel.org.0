Return-Path: <linux-arm-msm+bounces-32606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83198780D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 19:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F2F286B57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 17:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A721615B15D;
	Thu, 26 Sep 2024 16:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eC+y/PCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCDB157E61;
	Thu, 26 Sep 2024 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727369994; cv=none; b=iCQBksB/dfALCxMErUdI9n4E9+VOboBq9y1XfvlXPvVVTaJO512fyRU6/7TwbXA1Zc3eDiKnLPpmRgQQVmJNd8yQQH5HiMYWMoQLqEEvYx7MsUdhu7WHbjNvfPxiwndAhC74Rwt1GybXmEU4dpvlalTSOgedhohB2CWAZf9GrFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727369994; c=relaxed/simple;
	bh=vPvgBe3mw7ij6EWPxzCtYi/zm7pChh1S1SaduXREqY0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljRIvpQhdhyrYaERoppJlIj9562thKeLXlIWU1DOQCdTo2V0fIsLv623O3IR5MMOc4bOprmpOdg3FYicduyJ55BgDQRyeWq4H5zPCOWhKmTJLgtjbSTEN9O4jMcmRnWmqfBBN+0GhutFT8jjpgXPGLfSLNOC+DN7V/FTGRQssxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eC+y/PCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QG9mNY002811;
	Thu, 26 Sep 2024 16:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tvzhxFqCJihUkn/P80INKj06
	dHZresCsObz3w7UIExQ=; b=eC+y/PCCfHZamEpPCoKuSQLbWYgJTRaPzqZ+hMPT
	/vnI1pX5c34HhSkPRdZ5CnYJu4ZUP+d7lQSBgUnjMzgZfNOvZ16MbcSSc/Iskcy2
	0kYVh+f1bpyGnROETgsJRL+lVRKelT8wbkDiguhm+2T/dH/PLdhHEeY7dnZWnXII
	lhQzh7csdtMSzVuYyjoeJ7qNRFqkHB6LMDOX9lhaddf1qQ1VmMoKlEbABeBXCvYy
	H7qcwZEAlUq/6BofTRjhR/4QiXLumkuZOaO1mXaB1VED+pzXv2HZeEmzKlhJa2V5
	PlwPuLrRx2SlfV5zaF2iTosDdNIooznnypd55A98w6e2dw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakqunx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 16:59:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QGxjog004981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 16:59:45 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 09:59:45 -0700
Date: Thu, 26 Sep 2024 09:59:44 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: <jens.glathe@oldschoolsolutions.biz>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-wdk2023: dt definition
 for WDK2023
Message-ID: <ZvWTAEwEcmh76Xhe@hu-bjorande-lv.qualcomm.com>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
 <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mafrqRkiVENE7hQsK_qg5LAUqEgzF7iQ
X-Proofpoint-GUID: mafrqRkiVENE7hQsK_qg5LAUqEgzF7iQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260118

On Fri, Sep 20, 2024 at 07:47:24PM +0200, Jens Glathe via B4 Relay wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
[..]
> +/ {
> +	model = "Windows Dev Kit 2023";
> +	compatible = "microsoft,blackrock", "qcom,sc8280xp";
> +
> +	aliases {
> +		i2c4 = &i2c4;
> +		i2c21 = &i2c21;
> +		serial1 = &uart2;
> +	};
> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9380-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;
> +
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-buck-supply = <&vreg_s10b>;
> +		vdd-rxtx-supply = <&vreg_s10b>;
> +		vdd-io-supply = <&vreg_s10b>;
> +		vdd-mic-bias-supply = <&vreg_bob>;
> +
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	firmware {
> +		qseecom {
> +			compatible = "qcom,qseecom-sc8280xp", "qcom,qseecom";
> +			qcom,scm = <&scm>;
> +		};
> +	};
> +
> +	pmic-glink {
[..]
> +	};
> +
> +	dp1-connector@0 {

Please keep nodes sorted by {address, node name, label}, i.e. this
should move 2 steps up.

Also the unit address (i.e. the "@0" part) should be dropped, right?

> +		compatible = "dp-connector";
> +		label = "DP1";
> +		type = "mini";
> +
> +		dp-pwr-supply = <&vreg_misc_3p3>;
> +
> +		//hpd-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dp1_connector_in: endpoint {
> +				remote-endpoint = <&mdss0_dp2_phy_out>;
> +			};
> +		};
> +	};
> +
[..]
> +&mdss0_dp2 {
> +  compatible = "qcom,sc8280xp-dp";
> +
> +  data-lanes = <0 1 2 3>;
> +
> +	status = "okay";

Indentation looks off here.

> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss0_dp2_phy_out: endpoint {
> +				remote-endpoint = <&dp1_connector_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss0_dp2_phy {
> +	compatible = "qcom,sc8280xp-dp-phy";
> +
> +	vdda-phy-supply = <&vreg_l3b>;
> +	phy-supply = <&vreg_l3b>;
> +	vdda-pll-supply = <&vreg_l6b>;
> +	pll-supply = <&vreg_l6b>;
> +
> +	status = "okay";
> +};
> +
> +&pcie2a {
> +	aspm-no-l0s;
> +	max-link-speed = <16>;
> +
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +	pcie-vdda-supply = <&vreg_l7d>;
> +	vdda-supply = <&vreg_l7d>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2a_default>;
> +
> +	status = "okay";
> +};
> +
> +&pcie2a_phy {
> +	vdda-phy-supply = <&vreg_l4d>;
> +	phy-supply = <&vreg_l4d>;
> +	vdda-pll-supply = <&vreg_l6d>;
> +	pll-supply = <&vreg_l6d>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	max-link-speed = <2>;
> +	aspm-no-l0s;

It would be nice if these two followed the same order here and in
pcie2a. (Don't know if we have a preferred order...)

> +
> +	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_wlan>;
> +	pcie-vdda-supply = <&vreg_l7d>;
> +	vdda-supply = <&vreg_l7d>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie4_default>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "volterra";

Can you please confirm that this matches what has landed in
linux-firmware?

> +	};
> +};
> +
[..]
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sc8280xp/MICROSOFT/DEVKIT23/qcadsp8280.mbn";

Perhaps use blackrock here instead?

> +
> +	status = "okay";
> +};

Regards,
Bjorn

