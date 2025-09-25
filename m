Return-Path: <linux-arm-msm+bounces-75162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98ECBA0CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52EF27BC288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC1030AD00;
	Thu, 25 Sep 2025 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfeR5DJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA9277C8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820279; cv=none; b=Xp29t2OL+iFcY+Jskk3ZkIUEspGE1C7ylW8jGViQnNOxwn5BaWwr42vvvLEar1/7C5tZV6L/ZEIjNvJj0yQ9bpqh8IcECsrZyjWkiJr098Re6Cf1O1hTdF1fXzczltL/Y2e3OAoupJg9ZJulj0nV+O1HpOzotB3rg7xQCOy+Hh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820279; c=relaxed/simple;
	bh=2A2VlsDYMkB/821WPHSmvGeZ4Cdpi/oZMk8ty52o9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=codvU9OGhWtUsfQO/jl6txzLZZ0ykNMGffTeBmSUlJo/+6g8RsET/Cuf9dEz8rdISKoO/9mtHLjWUCHlHUZB+sgq+qAVcIvOY/b03YGHvPqxhAE2B9eWvdHjOfNMMl1evxjEsjeeelm0TrjV9lqHVHMviQGXOV6pmmZjEFyqcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfeR5DJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9fGvl029712
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kXw3CoTNhUiXzTf4M7hCnKv4
	j02uevXwUtdwRCg5VCs=; b=OfeR5DJtoMu1lUxfqiKvEBtUCBTNDrepul4fswiV
	PINrqbXPgAweF6wn3V7+PLPd8/0CYeH/lP5CIz6VeLBXLt0yZeCqGi44+tKplWL4
	qHPhLxGPruC7mB6bNw2cMKG3RKbf5hRZANCML+3ByTr4SXS3pgnmggQCfWHaoS8E
	jLi9s9Mm//2Ssj3GpW91faSS+RZwSG4R0txYD9GQWWx6RloJdGSGRYMSYDQSVD4g
	UYvKm0bSzm896jXI81Y0vJTb0sUfAK9taMUY+ytmjh5CytFsl+i0Xl8ItWR7B9j1
	9GkQWvMSoLu9ju+DXrMmeq2TcZ4qDodZ2UFo4/OQ4EEM3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1frv0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:11:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b793b04fe0so27938941cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758820276; x=1759425076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXw3CoTNhUiXzTf4M7hCnKv4j02uevXwUtdwRCg5VCs=;
        b=cw0zp+X1kpzWMyxIYI4pJ6qjosHAvGa4bW5UojOJDmxEpolD5ZrzuB7XwyS7GpZGKk
         6aR8i5Dw9ID/I41yOgxtqFSjQRUDetxtTky2OTyfcYVREUQkIBBuLZa7AANN9zx5C3D6
         MpkGggQmJXCcJFAyRo24AzYkTENsTMbzNMTpJ/L3MVtSunPzomjT80MbiNEP8cQNXnzX
         BOJF/jjbdZaioep4aLzqgf4nd0xwTWPlP/y+LZvglC1xtGvPftVawcOREufdhEDA926v
         Y5CaDZT7uLSJMg1Bg4Wybig18d0GTkJNG2zCJB8tARum6ZDJodKuwWHSGvfEngz7S2lg
         dsiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeBMwOeKagZn053NNX8GMWQ3A/jNFQx5DJxda/MdaxE95bstN7h0S/qHzMBBtHztBGX6EkbtlcFzd0mjxh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt76KIg20340ZHhvLkzmMi5/3J/zYXcbliWvMeXEk+oRNVVy/H
	WMZXxDs9weQEUzfnRFnkS2L6JJ4pEwuRGwL4RBS6hBF3E4kFqQ/qUQFRyZmT8cMvb3ix8AOisQO
	h0FGBbgIiue7I8MfeCCAWxufIZp9/PNPjSokfaaRccADAQDaQyMl2IVfxDl3YZA+0xj/N
X-Gm-Gg: ASbGnct4X5vLl4hr5uXoxjqlSdOy1NwTLXLSi/fflCdYcUc7FVzT3RrSeeTr1NJ7rdE
	8ifT7aM9KvW4t/GGaAObNavE0//sDWvhpkXE7OvdpIHMsIar7TTdAeeOhdauKozaSiW8BcD0tXq
	1tWb5xnpmMdDlwi4Doi1HLHKM2w1psnmhfTFdW4vsGh9PcFq8bznciYCVRH7MAitMny20RwAPoB
	vPV4wfW1V3N+uKSgLz85e/UEikmRmuKSRgtHfL2loj/RL8TN0D6M9o1G0m9O2R3hZI7p82husGs
	5r1saX8mCjBUMqbkw2vi9TIb6xy7PIEM4XH1fI9PA0W3qBLV54arvCs0MX2cSL2ORVI/VF2j0RL
	BAiWKHsS7QwAdN+O6vEW5PbUyKGdF6tbIV3AeuUcvyKJqpnkmi+QH
X-Received: by 2002:ac8:5852:0:b0:4d9:5ce:3749 with SMTP id d75a77b69052e-4da4cd4791cmr52410541cf.72.1758820275532;
        Thu, 25 Sep 2025 10:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGoHvBOPLPvyJUniaKzaRAGpPOF+o4ZXMRhf7+ISSnlvoSo5lj+B74ghkMrUs0F7vcZagSMQ==
X-Received: by 2002:ac8:5852:0:b0:4d9:5ce:3749 with SMTP id d75a77b69052e-4da4cd4791cmr52409821cf.72.1758820274662;
        Thu, 25 Sep 2025 10:11:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313cde476sm951564e87.48.2025.09.25.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 10:11:13 -0700 (PDT)
Date: Thu, 25 Sep 2025 20:11:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Describe display related
 nodes
Message-ID: <43jgqfcw2nnasdnskfdri5swddr6kunvvp6oxzqibnlvyc4jd2@4y6x7fy5shq2>
References: <20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org>
 <20250925-dts-qcom-glymur-crd-add-edp-v1-1-20233de3c1e2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-dts-qcom-glymur-crd-add-edp-v1-1-20233de3c1e2@linaro.org>
X-Proofpoint-ORIG-GUID: _XPIn_sPBPQvWKcnPbt-xCbb_RuFPCFk
X-Proofpoint-GUID: _XPIn_sPBPQvWKcnPbt-xCbb_RuFPCFk
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d577b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=em26Cy0fR9YT-IQVlA0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+adQrggyns2a
 dlQn/QCF8JlRY8N0STujakzy0iatR5zHdfowNaqqxQ4tz4Nqilwl5FAvB+jv5Ef6ECJSpt1VUsI
 Z/Yy5U341sBoIvrzTyEewXy4okfuZ92t+GCTn5czJ0TLQxknzLvzP58OIBHa3bnXb6HT9TZjiVj
 ZQYMjSurw0M5dNjt1mv0b0lcFdIuZtW5lE4rs4x2A2J2nc9dgK6ZsyAdtHoMt8lCgX5eyAy5jtJ
 gICHSp+GcV/8yWjCnFiCaWOrfvYG/PD6G+S/LmUWlb9on8tsDxkqV2qFyS00xGHESWOAstuRgWO
 i5Mfj7LxrC4dSaqS/fE9CE8vyEFQnD4TSdzjeSUfuGCVTWBXqACzYjZRW0wIDMqt2+1a6z3ciho
 R6alYOgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Thu, Sep 25, 2025 at 06:02:48PM +0300, Abel Vesa wrote:
> The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
> controllers. Describe them along with display controller and the eDP
> PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
> clock controller and link up the PHYs and DP endpoints in the graph.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 492 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 484 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index a131cd6c3d9e7f14ed1c4aef4b68e1860cc3bca5..41d89998b1fe14a24cd528e73afc37cf2a840bab 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2698,6 +2698,7 @@ port@2 {
>  					reg = <2>;
>  
>  					usb_dp_qmpphy_dp_in: endpoint {
> +						remote-endpoint = <&mdss_dp0_out>;
>  					};
>  				};
>  			};
> @@ -2766,11 +2767,34 @@ port@2 {
>  					reg = <2>;
>  
>  					usb_1_ss1_qmpphy_dp_in: endpoint {
> +						remote-endpoint = <&mdss_dp1_out>;
>  					};
>  				};
>  			};
>  		};
>  
> +		mdss_dp3_phy: phy@faac00 {
> +			compatible = "qcom,glymur-dp-phy";
> +			reg = <0 0x00faac00 0 0x1d0>,
> +			      <0 0x00faa400 0 0x128>,
> +			      <0 0x00faa800 0 0x128>,
> +			      <0 0x00faa000 0 0x358>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&tcsrcc TCSR_EDP_CLKREF_EN>;
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "ref";
> +
> +			power-domains = <&rpmhpd RPMHPD_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		cnoc_main: interconnect@1500000 {
>  			compatible = "qcom,glymur-cnoc-main";
>  			reg = <0x0 0x01500000 0x0 0x17080>;
> @@ -3248,6 +3272,7 @@ port@2 {
>  					reg = <2>;
>  
>  					usb_1_ss2_qmpphy_dp_in: endpoint {
> +						remote-endpoint = <&mdss_dp2_out>;
>  					};
>  				};
>  			};
> @@ -3523,7 +3548,458 @@ usb_mp: usb@a400000 {
>  			dr_mode = "host";
>  
>  			status = "disabled";
> +		};
> +
> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,glymur-mdss";
> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "cpu-cfg";
> +
> +			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
> +
> +			iommus = <&apps_smmu 0x1de0 0x2>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,glymur-dpu";
> +				reg = <0 0x0ae01000 0 0x93000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp",
> +					    "vbif";
> +
> +				interrupts-extended = <&mdss 0>;
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +
> +					port@4 {
> +						reg = <4>;
> +
> +						mdss_intf4_out: endpoint {
> +							remote-endpoint = <&mdss_dp1_in>;
> +						};
> +					};
> +
> +					port@5 {
> +						reg = <5>;
> +
> +						mdss_intf5_out: endpoint {
> +							remote-endpoint = <&mdss_dp3_in>;
> +						};
> +					};
> +
> +					port@6 {
> +						reg = <6>;
> +
> +						mdss_intf6_out: endpoint {
> +							remote-endpoint = <&mdss_dp2_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-205000000 {
> +						opp-hz = /bits/ 64 <205000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-337000000 {
> +						opp-hz = /bits/ 64 <337000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-417000000 {
> +						opp-hz = /bits/ 64 <417000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-532000000 {
> +						opp-hz = /bits/ 64 <532000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <600000000>;
> +						required-opps = <&rpmhpd_opp_nom_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,glymur-dp";
> +				reg = <0x0 0xaf54000 0x0 0x104>,
> +				      <0x0 0xaf54200 0x0 0xc0>,
> +				      <0x0 0xaf55000 0x0 0x770>,
> +				      <0x0 0xaf56000 0x0 0x9c>,
> +				      <0x0 0xaf57000 0x0 0x9c>;
> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;

No pixel1 clock?

> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;

No pixel1 clock?

> +
> +				operating-points-v2 = <&mdss_dp0_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint {
> +							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +						};
> +					};
> +				};
> +
> +				mdss_dp0_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-192000000 {
> +						opp-hz = /bits/ 64 <192000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			mdss_dp1: displayport-controller@af5c000 {
> +				compatible = "qcom,glymur-dp", "qcom,sm8650-dp";

This doesn't match your own bindings. WT?

> +				reg = <0x0 0xaf5c000 0x0 0x104>,
> +				      <0x0 0xaf5c200 0x0 0xc0>,
> +				      <0x0 0xaf5d000 0x0 0x770>,
> +				      <0x0 0xaf5e000 0x0 0x9c>,
> +				      <0x0 0xaf5f000 0x0 0x9c>;
> +
> +				interrupts-extended = <&mdss 13>;
>  
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;

pixel1

> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;

pixel1

> +
> +				operating-points-v2 = <&mdss_dp1_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				phys = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp1_in: endpoint {
> +							remote-endpoint = <&mdss_intf4_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp1_out: endpoint {
> +							remote-endpoint = <&usb_1_ss1_qmpphy_dp_in>;
> +						};
> +					};
> +				};
> +
> +				mdss_dp1_opp_table: opp-table {
> +					compatible = "operating-points-v2";

Is it differnt from dp0 table?

> +
> +					opp-192000000 {
> +						opp-hz = /bits/ 64 <192000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			mdss_dp2: displayport-controller@af64000 {
> +				compatible = "qcom,glymur-dp";
> +				reg = <0x0 0x0af64000 0x0 0x104>,
> +				      <0x0 0x0af64200 0x0 0xc0>,
> +				      <0x0 0x0af65000 0x0 0x770>,
> +				      <0x0 0x0af66000 0x0 0x9c>,
> +				      <0x0 0x0af67000 0x0 0x9c>;
> +
> +				interrupts-extended = <&mdss 14>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;

pixel1 clock

> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;

pixel1

> +
> +				operating-points-v2 = <&mdss_dp2_opp_table>;
> +
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				phys = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp2_in: endpoint {
> +							remote-endpoint = <&mdss_intf6_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp2_out: endpoint {
> +							remote-endpoint = <&usb_1_ss2_qmpphy_dp_in>;
> +						};
> +					};
> +				};
> +
> +				mdss_dp2_opp_table: opp-table {


Different from dp0?

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +

-- 
With best wishes
Dmitry

