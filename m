Return-Path: <linux-arm-msm+bounces-19892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFE8C6933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 17:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 102E5B21257
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 15:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F0815573D;
	Wed, 15 May 2024 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EgVufc0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C015572C;
	Wed, 15 May 2024 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715785537; cv=none; b=PX5fyfl1CQQPTDFmZE4jdGV6dWnnoVYFl2pfZZ3jVAPOlIVnG5UMpJ+TaC6M1xZSxMDohaUl+yHZynFwSdOuySBIYrdfptwEUoGavwQ7Eikzs2yaouHkkfk+fU3iR36DitnZ4F7LqiGNi8B1xuH0PlwItHGxeAz4FVFLo/HU+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715785537; c=relaxed/simple;
	bh=U7niQY55rvFzkJOC+RqcBOjATswiErUvW4E7z0V9IBg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZQJR2n0TWDvbci8/JoDcDA/zYeT3e2Ap85Mu/biwJ6CZ5VtjBsUfBgCAQHZMmnbAraN2amSE7jGo3054gyQbkqPimBAVLU/UJTX6mxhRPy19+7fBvlyTFReTcWHRQGeuhYxtKfF0XpwnIw92c/3+ow3ASYcxlDWWgYsxrwOBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EgVufc0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90bPA024822;
	Wed, 15 May 2024 15:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=52vDSGdtcjDH8WF65be74
	PgpKPFMf4YRwooDlqrX7dU=; b=EgVufc0XF77ElchlfAVZi4hndGoWs8fZ7VW08
	hrgnrFOR/PQwd85RRnXUjAF5AGhSBD6jTIX1MBABRldJP4vILqGUVJ+CTvjlCOWY
	er0KLIxAgD9v7ohndLm5La+uFP0OLLpjYcosSPQk2Gfj2iF3qnBidWJj6z0jN0Kv
	34sYj7e7L2JP39yaEtNbneBKm0bumYHhY1wVSOHeev7GrT5zl2cBcZgyzfa8a3jv
	1q+kZkqGrSfXyX7e+l6eVhNnA6kXzh5ygLjUIQ5Fz8l8one6RgpYjfMuphMVF9z/
	AwLrq9a38jUWE+iSjN7ajy8MWeUSCDK/w4IGuBgw9gbePeLtw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49gdtqsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 15:05:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FF567h015633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 15:05:06 GMT
Received: from hu-vvalluru-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 08:05:03 -0700
Date: Wed, 15 May 2024 20:34:59 +0530
From: Prahlad Valluru <quic_vvalluru@quicinc.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nankam@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <quic_abhinavk@quicinc.com>, <konrad.dybcio@linaro.org>,
        <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <20240515150459.GA32547@hu-vvalluru-hyd.qualcomm.com>
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com>
 <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <171517823376.1753082.4070659246393696781.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171517823376.1753082.4070659246393696781.robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6P98kOzxC02abmPA6fNy5xaHYv8ulUrU
X-Proofpoint-ORIG-GUID: 6P98kOzxC02abmPA6fNy5xaHYv8ulUrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150106

On Wed, May 08, 2024 at 09:31:24AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 06 May 2024 18:14:10 -0500, Bjorn Andersson wrote:
> > On Fri, Apr 26, 2024 at 07:54:42PM GMT, Prahlad Valluru wrote:
> > > From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> > >
> > 
> > Please don't thread new versions off existing version. b4 helps you with
> > getting these things right, please check go/upstream for more details.
> > 
> > > Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> > >
> > 
> > Even if it's clear what this is, I would prefer if you described the
> > hardware a little bit in your commit message.
> > "Rb3Gen2 has a HDMI connector, connected to DSI via a LT on i2cX.... reset and
> > irq pins comes from x and y. Describe this."
> > 
> > > Signed-off-by: Prahlad Valluru <quic_vvalluru@quicinc.com>
> > > ---
> > > v2: Addressed dtschema errors
> > > 	- Fixed lt9611-irq
> > > 	- vdd-supply error to be ignored, as it is connected to
> > > 	  input supply directly, on rb3gen2
> 
> The choice is either fix the dts or fix the binding. 

vdd-supply is mandatory for lt9611. Only in case of rb3gen2, we are seeing this
error, since it is connected to supply directly. Will add dummy vreg to address this.

> 
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 86 ++++++++++++++++++++
> > >  1 file changed, 86 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > index a085ff5b5fb2..c14d4a4bb3ce 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > @@ -51,6 +51,18 @@
> > >  			};
> > >  		};
> > >  	};
> > > +
> > 
> > There's a stray tab here, please run checkpatch --strict on your
> > patches.
> > 
> > > +	hdmi-connector {
> > > +		compatible = "hdmi-connector";
> > > +		label = "HDMI";
> > > +		type = "a";
> > > +
> > > +		port {
> > > +			hdmi_con: endpoint {
> > > +				remote-endpoint = <&lt9611_out>;
> > > +			};
> > > +		};
> > > +	};
> > >
> > >  	reserved-memory {
> > >  		xbl_mem: xbl@80700000 {
> > > @@ -530,6 +542,45 @@
> > [..]
> > > @@ -602,6 +653,21 @@
> > >  	status = "okay";
> > >  };
> > >
> > > +&mdss_dsi {
> > 
> > We want to keep nodes sorted (by address if applicable, otherwise
> > alphabetically on node names and on labels). "mdss_dsi" < "mdss_edp".
> > 
> > So please move this up where it belongs.
> > 
> > > +        vdda-supply = <&vreg_l6b_1p2>;
> > > +        status = "okay";
> > > +};
> > > +
> > > +&mdss_dsi0_out {
> > > +        remote-endpoint = <&lt9611_a>;
> > > +        data-lanes = <0 1 2 3>;
> > > +};
> > > +
> > > +&mdss_dsi_phy {
> > > +        vdds-supply = <&vreg_l10c_0p88>;
> > > +        status = "okay";
> > > +};
> > > +
> > >  &qupv3_id_0 {
> > >  	status = "okay";
> > >  };
> > > @@ -711,3 +777,23 @@
> > >  	function = "gpio";
> > >  	bias-disable;
> > >  };
> > > +
> > > +&pm7250b_gpios {
> > > +        lt9611_rst_pin: lt9611-rst-state {
> > > +                pins = "gpio2";
> > > +                function = "normal";
> > > +
> > > +                output-high;
> > > +                input-disable;
> > > +                power-source = <0>;
> > > +        };
> > > +};
> > > +
> > > +&tlmm {
> > > +        lt9611_irq_pin: lt9611-irq-state {
> > > +                pins = "gpio24";
> > > +                function = "gpio";
> > > +                drive-strength = <8>;
> > 
> > I'd expect a 2 here, so please document why this is 8.
> > 
> > Regards,
> > Bjorn
> > 
> > > +                bias-disable;
> > > +        };
> > > +};
> > > --
> > > 2.17.1
> > >
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc:
> 
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: hdmi-bridge@2b: 'vdd-supply' is a required property
> 	from schema $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> 
> 
> 
> 
> 

