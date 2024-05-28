Return-Path: <linux-arm-msm+bounces-20789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC48D2196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 18:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041201F228A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C10172BA6;
	Tue, 28 May 2024 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mOK84xSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CE16F902;
	Tue, 28 May 2024 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913498; cv=none; b=jyG8GeAcJ63MPjAvxeqkQYb4ExqzXgFDIIPfjpEM4IPpppCe41S8q0zypVeMyvgxVAYkeJZrqGiMX/TvSMqmob2CHEwn2ihJRjIGXwR3+THxbVfRLpG3mpruH1wK3nG+UDGc6ty9UqTauFxtO5ILfAoIbGKQiA3IR+P4v1z3C8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913498; c=relaxed/simple;
	bh=zXIvtpoMzYe+OwJebxeOfggYdaC4nvGWHddDwmNd2Cs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjUUHQJVifwN0kODdvdDXKoa8WvCs+iy3du/CGa3PMU3QkDe9FmzTIK1BNCyO23CKgQ1GO5YN2FPI+vvNJRtdeA7dnNi0o9xRCxUbxLoNsDiEFINlVEIHoTK47zp+pgKu86owz5OVNUhOlxQnzmak6dvMxCU5dRSfHT7F95wN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mOK84xSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SAPNfp024469;
	Tue, 28 May 2024 16:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mAj92Tb5M31u19yIo89F0Gl8
	cqfVyas0E1/0qeucGg8=; b=mOK84xShgaSvWHyHMRJRtRBe+vLMj1ZLyoIZ9pok
	GvyvuP+46g/SriIKRsBS3G2OZT9KWA9MrndkHHA9vvbJ2O3EdvMzvWKxXNsluptG
	GSPiMce1Lzv/lP087woDOffiO3qud4GBMbJcPOCwUj2+vpKPZ6WfgSpfaG9zd+tJ
	cI2nTx0QhbEzHLQQhGWICpoX1D0kpStJt2jwxVT4q8iG+fSfeS/f6j/517JLGtZC
	R8btr3HBh+gzSuzMgNO1C7bh9mLqEPCHPgmhGq7wl0hcYJbSLTrLQXG856qkfMd4
	A3V8VsL2kvO+lvyfCrU15jV8WD8zyKLjgE/w5ZrUFSPUpA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2nep8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:24:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SGOg6d018169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:24:42 GMT
Received: from hu-vvalluru-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 09:24:38 -0700
Date: Tue, 28 May 2024 21:54:34 +0530
From: Prahlad Valluru <quic_vvalluru@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_abhinavk@quicinc.com>,
        <quic_nankam@quicinc.com>, <robh@kernel.org>
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <20240528162434.GA4578@hu-vvalluru-hyd.qualcomm.com>
References: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
 <20240528141954.7567-1-quic_vvalluru@quicinc.com>
 <rs7m73yzuvm5rf52tyax57r33iigalplr2z7rrxm7mktdqa3bf@ecapopn7ufho>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rs7m73yzuvm5rf52tyax57r33iigalplr2z7rrxm7mktdqa3bf@ecapopn7ufho>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 13d7QmU052fr3Uh2g0evy_XB-kiYnmks
X-Proofpoint-GUID: 13d7QmU052fr3Uh2g0evy_XB-kiYnmks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405280123

On Tue, May 28, 2024 at 06:00:26PM +0300, Dmitry Baryshkov wrote:
> On Tue, May 28, 2024 at 07:49:54PM +0530, Venkata Prahlad Valluru wrote:
> > Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> > reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> > Bridge supplies are Vdd connected to input supply directly
> > and vcc to L11c. Enable HDMI output, bridge and corresponding
> > DSI output.
> > 
> > Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> > ---
> > v4: added fixed regulator for vdd
> 
> Please don't send new iterations as replies to the previous iteration.
> It might be ignored or mishandled by the tools.
Was trying to have the context of discussion captured. Will add links
to the patchsets in the history, going forward.
> 
> > 
> > v3: - Updated commit text
> >     - Arranged nodes in alphabetical order
> >     - Fixed signoff
> >     - Fixed drive strength for lt9611_irq_pin
> >     - Removed 'label' from hdmi-connector, which is optional
> > 
> > v2: Addressed dtschema errors
> > 	- Fixed lt9611-irq
> > 	- vdd-supply error to be ignored, as it is connected to
> > 	  input supply directly, on rb3gen2
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 94 ++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index a085ff5b5fb2..7f00fca131a2 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -52,6 +52,25 @@
> >  		};
> >  	};
> >  
> > +	hdmi-connector {
> > +		compatible = "hdmi-connector";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_con: endpoint {
> > +				remote-endpoint = <&lt9611_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	lt9611_1v2: lt9611-vdd12-regulator {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "LT9611_1V2";
> 
> Is it the regulator / net name in schematics? Or is it also used by any
> other consumers?
>
VREG_HDMI_OUT_1P2 is the naming in schematic, but i see this naming convention for rb5 based boards.
No other consumers for this.
> > +
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +	};
> > +
> >  	reserved-memory {
> >  		xbl_mem: xbl@80700000 {
> >  			reg = <0x0 0x80700000 0x0 0x100000>;
> > @@ -530,6 +549,46 @@
> >  			   <GCC_WPSS_RSCP_CLK>;
> >  };
> >  
> > +&i2c0 {
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +
> > +	lt9611_codec: hdmi-bridge@2b {
> > +		compatible = "lontium,lt9611uxc";
> > +		reg = <0x2b>;
> > +
> > +		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> > +
> > +		vdd-supply = <&lt9611_1v2>;
> > +		vcc-supply = <&vreg_l11c_2p8>;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				lt9611_a: endpoint {
> > +					remote-endpoint = <&mdss_dsi0_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				lt9611_out: endpoint {
> > +					remote-endpoint = <&hdmi_con>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> >  &i2c1 {
> >  	status = "okay";
> >  
> > @@ -587,6 +646,21 @@
> >  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> >  };
> >  
> > +&mdss_dsi {
> > +	vdda-supply = <&vreg_l6b_1p2>;
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&lt9611_a>;
> > +	data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi_phy {
> > +	vdds-supply = <&vreg_l10c_0p88>;
> > +	status = "okay";
> > +};
> > +
> >  &mdss_edp {
> >  	status = "okay";
> >  };
> > @@ -711,3 +785,23 @@
> >  	function = "gpio";
> >  	bias-disable;
> >  };
> > +
> > +&pm7250b_gpios {
> > +	lt9611_rst_pin: lt9611-rst-state {
> > +		pins = "gpio2";
> > +		function = "normal";
> > +
> > +		output-high;
> > +		input-disable;
> > +		power-source = <0>;
> > +	};
> > +};
> > +
> > +&tlmm {
> > +	lt9611_irq_pin: lt9611-irq-state {
> > +		pins = "gpio24";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +};
> > -- 
> > 2.17.1
> > 
> 
> -- 
> With best wishes
> Dmitry

