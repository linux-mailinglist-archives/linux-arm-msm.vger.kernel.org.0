Return-Path: <linux-arm-msm+bounces-19491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00FA8BFAD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 12:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408722862B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351437BAE5;
	Wed,  8 May 2024 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XoFg03tV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0B222089;
	Wed,  8 May 2024 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715163738; cv=none; b=bOUghpcNFDzADOP5SKgXMsBJyohefX9trlL9zD3oD7Klgb56TrNbxAn2EAtya86oZy13QVRL6g0YP/zxO3VWld6jEXnPzzdembDMjBJ/39cLM2PeWXrcnyHtuav2Xj2sQB43VzrF+XNqP/wCmHVOlTSzXUMOx5fANpVSrApJxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715163738; c=relaxed/simple;
	bh=yMqlgDQbR1k9mxd5Ca0Nm091c3ZfKLegfI3Mwv5E8A8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+VuYWcMuM8uCiW3AVb+Ua1V7Dd98IDQJ+c5cQYHb/6YlJsxFGSL9NQcjWi6OLhCF3UmnpzMytf/6Zd2vwu1cDvWxOuNIfEb6wOAivzqLQVj9zg+N1CFViQ2kV19mTZPddwKns1HGEBuUBeezTzdURzLIMySDZo8jGKjakhVGc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XoFg03tV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4489Ii4H011893;
	Wed, 8 May 2024 10:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-type:in-reply-to; s=qcppdkim1; bh=RmchV14l
	TfFXTnLMBQ0+EODlr6sLS8TQYTiV5/lRBUM=; b=XoFg03tVZHWiU1SNWXV/URiV
	79RGhuezjY8/mbgRN1K1fdN4NFj95mtgrFefp7j9jIFRto8SwileEEQL9bXq/aKE
	C/5W4XbHPSBqRBnA3mF1RpRBpbv3e34EccP4hlCGGoXwvrGMR2jgJcWG7X5l0x1/
	67dxxzcW9rxu+EgzkKfftZ8QKUEhPtm//GN3a2Nx/jOiCfbMM4q9yOrp15JQHKcV
	eoe4Ax/O/w+xVux7CIN8AonNzyjBDfOmB1ccuuVGP/Lg1BHX5RlghhBgSSsVfuNK
	4IKjqM1hS+3GscP0ozAJDzxCV0j6DyCF8JqYZ4GCFyCP1bLEzfIgQ7pPwk1eKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg41kqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 10:22:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448AMBXI018531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 10:22:11 GMT
Received: from hu-vvalluru-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 03:22:07 -0700
Date: Wed, 8 May 2024 15:52:02 +0530
From: Prahlad Valluru <quic_vvalluru@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_abhinavk@quicinc.com>, <quic_nankam@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <20240508102202.GA28609@hu-vvalluru-hyd.qualcomm.com>
Reply-To: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc.smtp.subspace.kernel.org>
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com>
 <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IcOT_RXig8e6yFIqWKmU2KYC5JOf3XrR
X-Proofpoint-ORIG-GUID: IcOT_RXig8e6yFIqWKmU2KYC5JOf3XrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_05,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080074

On Mon, May 06, 2024 at 06:14:10PM -0500, Bjorn Andersson wrote:
> On Fri, Apr 26, 2024 at 07:54:42PM GMT, Prahlad Valluru wrote:
> > From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> > 
> 
> Please don't thread new versions off existing version. b4 helps you with
> getting these things right, please check go/upstream for more details.

My internal gitconfig is not configured correctly. Fixed in v3.

> 
> > Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> > 
> 
> Even if it's clear what this is, I would prefer if you described the
> hardware a little bit in your commit message.
> "Rb3Gen2 has a HDMI connector, connected to DSI via a LT on i2cX.... reset and
> irq pins comes from x and y. Describe this."
> 

Agreed. Updated the commit text to include bridge details.

> > Signed-off-by: Prahlad Valluru <quic_vvalluru@quicinc.com>
> > ---
> > v2: Addressed dtschema errors
> > 	- Fixed lt9611-irq
> > 	- vdd-supply error to be ignored, as it is connected to
> > 	  input supply directly, on rb3gen2
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 86 ++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index a085ff5b5fb2..c14d4a4bb3ce 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -51,6 +51,18 @@
> >  			};
> >  		};
> >  	};
> > +	
> 
> There's a stray tab here, please run checkpatch --strict on your
> patches.

Fixed the checkpatch issues.

> 
> > +	hdmi-connector {
> > +		compatible = "hdmi-connector";
> > +		label = "HDMI";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_con: endpoint {
> > +				remote-endpoint = <&lt9611_out>;
> > +			};
> > +		};
> > +	};
> >  
> >  	reserved-memory {
> >  		xbl_mem: xbl@80700000 {
> > @@ -530,6 +542,45 @@
> [..]
> > @@ -602,6 +653,21 @@
> >  	status = "okay";
> >  };
> >  
> > +&mdss_dsi {
> 
> We want to keep nodes sorted (by address if applicable, otherwise
> alphabetically on node names and on labels). "mdss_dsi" < "mdss_edp".
> 
> So please move this up where it belongs.
> 

Moved the dsi nodes on top of edp. Didn't realise this.

> > +        vdda-supply = <&vreg_l6b_1p2>;
> > +        status = "okay";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +        remote-endpoint = <&lt9611_a>;
> > +        data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi_phy {
> > +        vdds-supply = <&vreg_l10c_0p88>;
> > +        status = "okay";
> > +};
> > +
> >  &qupv3_id_0 {
> >  	status = "okay";
> >  };
> > @@ -711,3 +777,23 @@
> >  	function = "gpio";
> >  	bias-disable;
> >  };
> > +
> > +&pm7250b_gpios {
> > +        lt9611_rst_pin: lt9611-rst-state {
> > +                pins = "gpio2";
> > +                function = "normal";
> > +
> > +                output-high;
> > +                input-disable;
> > +                power-source = <0>;
> > +        };
> > +};
> > +
> > +&tlmm {
> > +        lt9611_irq_pin: lt9611-irq-state {
> > +                pins = "gpio24";
> > +                function = "gpio";
> > +                drive-strength = <8>;
> 
> I'd expect a 2 here, so please document why this is 8.

Accepted. I dont see any reason to have drive strength 8. 

> 
> Regards,
> Bjorn
> 
> > +                bias-disable;
> > +        };
> > +};
> > -- 
> > 2.17.1
> > 

