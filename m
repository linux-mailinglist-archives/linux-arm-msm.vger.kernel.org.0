Return-Path: <linux-arm-msm+bounces-85844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A082CCF902
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE6583025F9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA5131196F;
	Fri, 19 Dec 2025 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTkwvsp9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihQ9Qgmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01215310779
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143470; cv=none; b=jl85xkKGkZVJmfKTHfC7RSxVw0f5Yu8fDUqaQjLl/Bk6XfnzggUeDBgbE6CrW98AhCkfIcr6U8zj5yyHJ3/p5T5X35+yZCTW0Z1FVdMuT0LcBcclvYA70GYc33nBaVPTyio6UjnOq6bH46lUTjosAwQ2DbQRtx1ebP5BDyGBp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143470; c=relaxed/simple;
	bh=fhsV7vu0PU2scfzabhTofChD1nvVm5E2qqZ8FGSJqaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cko9vmnPN/TkKC0LPXQ3f+62kd4Vxb9MMs0vdURi5tGUx572eulFMEoZDQHx8E5KTU+xmr6gnTE+vi2ugQ7vc7fSshManCxZaH+gvkfgtoSONKXy9AvScHWhWdfgIQ1d7JmpiIeOXZE7Zy+fbsbZq7TcyeokegngxPQznSAib/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTkwvsp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihQ9Qgmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4ciKH3976825
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVw/NAs4x3h51ajGJPqNu+q1
	mOPZkJ5sCfqcf1RuwrE=; b=PTkwvsp9KIQ2XhCczWiEumv0F3cBpFnOoEXv9eLD
	ZTUIO+PLMR1i16qBWcMazaJpk733zvcs/P/o4X/9FTmtjmpo2oNXrYFSR+raqRZu
	mQlknwCAEjYGJJ+DOh0zg79NC6jsHJt/94RkjpevPNv/ts3oTPi2UKPFcxlW2U6Q
	3y9s6o8v48hAKS4GhyYPtKsRTF1sSjsz4eZDWRAFAzciC8UaSGIaCx25HGRjxuRM
	eugYioOua3YNr5fPIklRAR2mCcAc8fssuJQ2JA0yor5hWahGu9S2gmK/Zn7Wc41Z
	UA7iI5gj8fcUo+6foyz6o3T0ECc7+0eFAtELgg3PCMjEVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjd0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:24:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abd9e8a63so378664a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766143467; x=1766748267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVw/NAs4x3h51ajGJPqNu+q1mOPZkJ5sCfqcf1RuwrE=;
        b=ihQ9Qgmx4GUPiilVySmL7hKbQWunX1laodv0WpzzcyI3a7OvZJ77Y/NKmFXvxlVHlg
         D3m6Z7OjPSS4McraLO8U9wq7LlXlmoyY69EgWjNnmuMVj/fI8pqxt75Wp7ohXPzrKV2x
         7crieB6iTK5yCBrvbQyp1WnThfGRTaixMrRoSUfFEt9cdRSBNmD7SrMB7pJ87bfT/TGD
         9C9GLlNGdrZqkIiFPVCVBgukZJ8SuOxxrVLo3kO61tijoZ7oOyahmWRAghI0wQT6mPaC
         5K/snbGfAxMNIdstHv+9K3IKnyuheTMusbTRxHGKAQc1GHB9sE7Qh8DTwXnO9L7237GT
         ytvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766143467; x=1766748267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVw/NAs4x3h51ajGJPqNu+q1mOPZkJ5sCfqcf1RuwrE=;
        b=H/HCt+E1YgixuAjnlb6ZGA2mfV3NvdxdiYxKb2gvxfY4q9TP7eYyy0EaGo/J8Sosyo
         cGw73PCbdjUl/fZmkDp/KTb+sp84kW3bjeaJCLQh4O03plhRDL2jY2c4FFXHaS8pNsAM
         uXyE5Mqmw3KGiPRL/Jdfmc3nEUFp10m9tyyJlC2pLtpaF0q6DAzSdaRMRNUpz/COWHrh
         etlFoQMnMuYlF2zzLrR4WhjSdQGpr/rfKUmcU4pZG9LUOGPjvil5gnWFyH9wCp1MNuLB
         T5NWjDVBT0ooLVRWzsmHI7iHZ0464ZNccQ+AAbg0lliIBa48zWM72ZnqTKFYPoMh+vRm
         fB8A==
X-Forwarded-Encrypted: i=1; AJvYcCVKEg4IOjyJBTDSbeNyU9fCgnG9J5ZVfaLE83Tzvf+tJlhjNRtxbzT9M82lWZpJV77kbiYAIBJxYge7+I3i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+fG3oLvGkMChJyZcmP/Ntv2Uj/uLbVZGD9GKWOgmSYYA/uHx
	X8Vc6B0Pn+QrK3NXIF7jLisqRYTPHsLWpHon/3xGfrTiCpC/vy73UCs+Rue1ygNp+v9wt1qBIIR
	SaQMQEHV9T0zHvzEsysY25ZG0UorRHYZIWSmDM2UgTO0khUm0Z77zcuJDVoALPKcg9PU3
X-Gm-Gg: AY/fxX4dOi51z2N1cEgZlUDJyZt149HsslfUDeI1+c7JRz/LPZoScaDZCucS6YUzJlX
	3vNbqgp+8aIXOK4a+ctPJZ8nOuXZAn3yi6/v6ALhe8Ck51aSzmkwJJDwx8NcMZbbu166OAmaax7
	itogtvzy01+2Q3EpMMBmR+PBaGxtTtUT+Oe1iuqIssLCGTtV8agdIpD6f49emRKFhMweopzWLTv
	ZPd7t5zYIE407GaGxiExwtYwCjy3EaQedWLpEPPXpZVLXxOyj+lER8oK27gxJbxqHdMOdvwBM3l
	tQzpHAWplMcZR5qJKJCJM8iMWvO8D8lhzuKWjz/0ktvk/+4Sq6IRlB0TnyiMP6fWrcI0OyyWpEI
	HnvjNeygzZk3L2dfvLiNJsKSZDKu9k8cGjTsf56EaXTe6Ek17hK1ejybAXUiOlFnb7VLtXiXefr
	Cnk/ZD+1zBcQ3Sxi+FxzC/KeUzOTnWug==
X-Received: by 2002:a17:90a:c888:b0:340:b8f2:24f6 with SMTP id 98e67ed59e1d1-34e92145883mr1528377a91.2.1766143466658;
        Fri, 19 Dec 2025 03:24:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHs9dO7EUd8ohKIjuNW8L9XZlNJvDSBWnpuo3NnLVWGSqQPllBxYlihTwkFjbx2Poa3FB46uw==
X-Received: by 2002:a17:90a:c888:b0:340:b8f2:24f6 with SMTP id 98e67ed59e1d1-34e92145883mr1528359a91.2.1766143466100;
        Fri, 19 Dec 2025 03:24:26 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm20066665ad.76.2025.12.19.03.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:24:25 -0800 (PST)
Date: Fri, 19 Dec 2025 16:54:20 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <aUU15DTAmlrEYIVc@hu-vishsain-blr.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
 <cjz47arpfbangtrzx6kw4ommph3zhn6xnroz34oqskafvmpnmi@xduotm2houzg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cjz47arpfbangtrzx6kw4ommph3zhn6xnroz34oqskafvmpnmi@xduotm2houzg>
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694535eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Io-tbfeKOdgYRMOeLDQA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LUv8HHh6zNkJc-TIjo8aZCJeWWwOZzPU
X-Proofpoint-GUID: LUv8HHh6zNkJc-TIjo8aZCJeWWwOZzPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NCBTYWx0ZWRfXwjkqN56oELRr
 gKM1Z+TY+JpS/fbDF1QqB+1u6t0yzjx/DINI8n/+4BlWeiPPuVILJzxngMd+vbH/9WEn9LNiOcE
 GC/Lm6O+PaJnDTKW6t+LGQvFez0EVMK0M+75k6I2AYVbyV9xDYMw8tvmIA20lofo+ddkDlKcmHr
 RPKtO1bsUA0P/nWP8TxnIpbq5oXfnwp3a4cxWC/nWGtx9Np6c/Xv724Qw6C9UIzsNtmHfZ4bnqn
 0AmDmFetldE/piVzk7ZL6WtL7qICRcCXLydRimNmhkTZb7fFCWzrG73pEMuUSZGKOqPYPD8t+RF
 wOI4ApSybkIAzdm2A8SzcbFvkvlJbkg82lYlHsCPOjqCKmf1P1HuUfcZ+lwCKivCyFn4OhHi0Vf
 Df1MKrM5lrahedNc65MGXRqzdqnStoY2yq0JS8Qlvilkb5ex5t+WPaYhZnx+sgp8GlpnXFi9s31
 6atAY1m8F2/3IGHDDeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190094

On Thu, Nov 20, 2025 at 08:26:40AM -0600, Bjorn Andersson wrote:
> On Thu, Nov 20, 2025 at 04:28:05PM +0530, Vishnu Saini wrote:
> > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > converter. Edp PHY from monaco soc is connected to lt8713sx
> > as input and output of lt8713sx is connected to 3 mini DP ports.
> > Two of these ports are available in mainboard and one port
> > is available on Mezz board. lt8713sx is connected to soc over
> > i2c0 and with reset gpio connected to pin6 or ioexpander5.
> > 
> 
> This is good, you're describing the role of LT8713sx and how it's
> connected on the board. Thank you for taking the time to do so!
> 
> I think one aspect that's worth pointing out on its own is the
> placement of the mini DP ports. You do capture it, but the fact that
> we have two on the EVK and one on the expansion board is "hidden" there
> in the middle of the paragraph.
> I think extracting this part of the message into its own paragraph would
> improve the commit message further.
>
Yes, Updated in V2.
 
> > Enable the edp nodes from monaco and enable lontium lt8713sx
> > bridge node.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > index bb35893da73d..947807f8a9cb 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > @@ -317,6 +317,20 @@ &gpu_zap_shader {
> >  	firmware-name = "qcom/qcs8300/a623_zap.mbn";
> >  };
> >  
> 
> Would it be possible to add dp-connector nodes and wire them up to the
> &lt8713sx, like I did in sa8295-adp.dts?
>
Yes, added dp-connectors in V2.
 
> > +&i2c0 {
> > +	pinctrl-0 = <&qup_i2c0_default>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> > +
> > +	lt8713sx: lt8713sx@4f {
> 
> This should be bridge@4f.
> 
> Also, unless we need to reference this from a overlay there's no need to
> give it a label.
Yes, done.

> 
> > +		/*Display bridge chip, DP1.4/HDMI2.0/DP++ hub*/
> 
> This comment explains what "lontium,lt8713sx" is. The binding call tell
> me that, so the value of this comment would be for you to tell us what
> it is used for on this particular board - and if that's obvious you can
> omit the comment.

Yes, removed it.

> > +		compatible = "lontium,lt8713sx";
> > +		reg = <0x4f>;
> > +		reset-gpios = <&expander5 6 GPIO_ACTIVE_HIGH>;
> 
> In addition to using an of_graph to describe the connectors that this is
> wired to, it would be nice to have a port describing the relationship to
> the DP controller here as well - so we know where the signal is coming
> from.
> 
> Would that be possible to add?
Yes, added ports and connectors in v2.

> Regards,
> Bjorn
> 
> > +	};
> > +};
> > +
> >  &i2c1 {
> >  	pinctrl-0 = <&qup_i2c1_default>;
> >  	pinctrl-names = "default";
> > @@ -396,6 +410,23 @@ expander6: gpio@3e {
> >  	};
> >  };
> >  
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp0 {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +};
> > +
> > +&mdss_dp0_phy {
> > +	status = "okay";
> > +};
> > +
> >  &iris {
> >  	status = "okay";
> >  };
> > @@ -435,6 +466,12 @@ &serdes0 {
> >  };
> >  
> >  &tlmm {
> > +	dp_hot_plug_det: dp-hot-plug-det-state {
> > +		pins = "gpio94";
> > +		function = "edp0_hot";
> > +		bias-disable;
> > +	};
> > +
> >  	ethernet0_default: ethernet0-default-state {
> >  		ethernet0_mdc: ethernet0-mdc-pins {
> >  			pins = "gpio5";
> > @@ -451,6 +488,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
> >  		};
> >  	};
> >  
> > +	qup_i2c0_default: qup-i2c0-state {
> > +		pins = "gpio17", "gpio18";
> > +		function = "qup0_se0";
> > +		drive-strength = <2>;
> > +		bias-pull-up;
> > +	};
> > +
> >  	qup_i2c1_default: qup-i2c1-state {
> >  		pins = "gpio19", "gpio20";
> >  		function = "qup0_se1";
> > 
> > -- 
> > 2.34.1
> > 

