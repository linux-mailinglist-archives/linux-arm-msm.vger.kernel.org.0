Return-Path: <linux-arm-msm+bounces-53311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A510EA7D01D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47AC73ACAA2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F085215B0EC;
	Sun,  6 Apr 2025 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2c5c0C+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3317BB21
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970379; cv=none; b=VZlAF7mR457ioiTTkPuPBid1hgcl4eUDlwGmhKHuNZ+Mxise5JxBW4ArZhcw6Bod9nyECVPfdJVF2UGGmolrzGFG5N0Y6jMjGWPmMXlW6gZJV3iBlyK3EJlHmm16XhOCG/N4qEIYksW0nFU1mqn7EVOlJcLjjWkDSpsvzQo7lDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970379; c=relaxed/simple;
	bh=fn3XIv374GafpmFsN99R+3aPdYkl1Tqj8epH+8kLyrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSW636oZ1EO80ANYc0glgOz0Q56JtU27+NMUiiTN93oTMQ3+KULSpcV9XHMyL3pKHVBYQ5ji6ptYmtqljJGXv8PM/MsvWdBVRHxlieiDRXJOu5B7668hY6a6ArleoU+xU71RN+1Zw2NwV0AJEl+Aj+S2G5YYDHfjdecMsscpCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2c5c0C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536IuBxk002074
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Apr 2025 20:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CF/FhaEsCR/+W8yHZpCK1Z4y
	/u8MKd7X9wwGafUA/ZE=; b=e2c5c0C+A1QJkl1S8mBqKwwsXeYpNYXuiqKDhhRp
	YucyENyy7sfSIHbVDqqSSOqMQ3NOs2VZ2QKzrLQchP6LSuSd2aHFSSZqMBaF2wpH
	Ugk3adWn+40XqIoQ5nRb9MDAyk2z/r5T8dOOdGlELdZpJftxVqyj0Dr1+t7YlvTh
	xnM0n25HBfHsxElkhYaDHqcPv1vMupQtsiT47m2pnSuAHdIJ0C06lqrlr1zKzyrn
	3IeIi7ZwkY3mdMZSFgP1x4YPfOn6pHX5bdOQk1+PpLrRQ+JgFuRhA+hYwnCTSyWF
	hyfeJbKFS6KOZ3I0PubyMy/nTqcKq7q8pWDTBKynleZOvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm28hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 20:12:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c5e92d41so616573785a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970376; x=1744575176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF/FhaEsCR/+W8yHZpCK1Z4y/u8MKd7X9wwGafUA/ZE=;
        b=u4IhZZ0SLg6Jbt/aFeqchovgY7fvuzal8+a7gnEbWpbmp3yxrqyGxcmBe6eLygC2zz
         nhrsGbivwzO6KB0zfBZCUUHO/ONYIJxQvamLoPrrE2RuIpPqW6rw+4wkUdAbg3Wk1bOd
         K82yASgOUeXnc6tTTcHwqSZnj74OGbHEr/hl0smAEP+4b0NVIx9zRrZZNH8n28fyIIvb
         XEFQdZ9AkqD0yL0Ybn6ui8ZkFisY65m8xQq4JCiDuBfvpNJawxddajA9VkC9ZJ3sj6Rr
         6GUkv3t4ObccfWsSx+UCNYdiGk7T3XHCiaczEGnCFKTZ8JFrbH2xUP6mAoQ/2Pim1UsZ
         idQw==
X-Gm-Message-State: AOJu0Yz8ih/Qhhi+b9VZhdUSvdpji0TOjUHHRyeHwVwp1DUNogbvHC7j
	1d5xjZIB++OELrz4hxd0prplLFRqXwbWY/s75sm+3eC+543el31nrZVVLUm5b21S1QLlptKqtiA
	4ijSFpaiJYJxqQ6LvdZAnQteETEwYWsuCHDrjxWlU8FSmD79uLZC/rUdqAHzS+B1H
X-Gm-Gg: ASbGncvtFjucobzZAwqgYOS2ox4ppfWHjKDxAe1g/vFg8+K7V26HcV60TWwF5WSL1bM
	jTD/X/x0zq2wdG6FKYbUX4ehF4WN6k4jqljCL2MyePfZjVK1QilUA/K3bFF0ZB6/EtKVJbez/a4
	4XujKyWLO+fk3fI4kGzR+boNn8xAtgaUiWWQ30gHn5EopvvhDb8g7a3GMoPNXHopnzmvXi9uGUq
	1BolW/9HpTveUIVSZRBbEB0f9hkD6S10bgaJBFqDTKl43xX6+d4uGhTGsrNU6MCz+IMwbN0zGOz
	0MHbyERndNwwuAtveJw7V3KatMAWt4GQLupkM9Tn9Fdr9PSajzxBGBLPovgkSjqfdeIiVhgwSFa
	ekFw=
X-Received: by 2002:a05:620a:c4d:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c77dddd504mr1034346085a.48.1743970375714;
        Sun, 06 Apr 2025 13:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8HcuVy420ofuMxKjaap5079mCf5g49f9eFhqlYXviEaGsK9bqA0z16b86EzmKh4ysjdA81w==
X-Received: by 2002:a05:620a:c4d:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c77dddd504mr1034343085a.48.1743970375372;
        Sun, 06 Apr 2025 13:12:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03124530sm13925971fa.9.2025.04.06.13.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:12:54 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:12:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-8-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: mq0AYde9vjF3NN3IcFadoLBMZDS-aC7V
X-Proofpoint-ORIG-GUID: mq0AYde9vjF3NN3IcFadoLBMZDS-aC7V
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f2e049 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DHtXK5enkGFnJ6Jc3mUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=911 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060147

On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..8e784ccf4138 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	vreg_conn_1p8: vreg_conn_1p8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_conn_1p8";
> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge0_out>;
> +			};
> +		};
> +	};
> +
> +	dp-dsi1-connector {
> +		compatible = "dp-connector";
> +		label = "DSI1";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi1_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge1_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -517,9 +548,135 @@ &i2c11 {
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +		    <&io_expander_intr_active>,
> +		    <&io_expander_reset_active>;

These pinctrl entries should go to the IO expander itself.

>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		gpio2-hog {

This needs a huuge explanation in the commit message. Otherwise I'd say
these pins should likely be used by the corresponding anx bridges.

> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi0_int_pin";
> +		};
> +
> +		gpio3-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "dsi0_cbl_det_pin";
> +		};
> +
> +		gpio10-hog {
> +			gpio-hog;
> +			gpios = <10 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi1_int_pin";
> +		};
> +
> +		gpio11-hog {
> +			gpio-hog;
> +			gpios = <11 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "dsi1_cbl_det_pin";
> +		};
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9543";
> +		#address-cells = <1>;
> +
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge0_in: endpoint {
> +							remote-endpoint = <&mdss0_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge0_out: endpoint {
> +							remote-endpoint = <&dp_dsi0_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 10 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 9 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge1_in: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge1_out: endpoint {
> +							remote-endpoint = <&dp_dsi1_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  };
>  
>  &mdss0 {
> @@ -566,6 +723,40 @@ &mdss0_dp1_phy {
>  	status = "okay";
>  };
>  
> +&mdss0_dsi0 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&dsi2dp_bridge0_in>;
> +};
> +
> +&mdss0_dsi0_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi1 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi1_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&dsi2dp_bridge1_in>;
> +};
> +
> +&mdss0_dsi1_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
>  &pmm8654au_0_gpios {
>  	gpio-line-names = "DS_EN",
>  			  "POFF_COMPLETE",
> @@ -714,6 +905,21 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> +	io_expander_intr_active: io-expander-intr-active-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	io_expander_reset_active: io-expander-reset-active-state {
> +		pins = "gpio97";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
>  	qup_uart10_default: qup-uart10-state {
>  		pins = "gpio46", "gpio47";
>  		function = "qup1_se3";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

