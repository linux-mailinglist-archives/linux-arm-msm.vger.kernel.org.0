Return-Path: <linux-arm-msm+bounces-74510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6479B950BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 10:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 798283A4EEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 08:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3143D2FD7BC;
	Tue, 23 Sep 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8dyy5sg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98BE1DFF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616967; cv=none; b=eZzzpbqm8gtc/gLuFX3wqnYyENHN7EpO75Qi2raFB6/SI+4FxTSpx7DIzsT1zfRzVn6SyL+HbxcmuAAuNw2sWc0mk7rLMDeK7NNGTKUKZv0i3kNI+3tiCnmC5mcwJM+bSWPyQ3Vsy9OOs5qlr90pHcCr+B6zmjDs/V43DHmCdBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616967; c=relaxed/simple;
	bh=4EjjF6hmY14ta+6hsvPzfJmsw34O8kpNuXLI/HJaTp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB3D1hPJvt2OglGTTZem2Uvwe4p3OKnOiUTykD0yxdkO/hjp1qHaPmqALONP0Bg0A5g/QUqGLNFszyLterxKdVWcErcX6Dc529khEcMrvvMWcDc3ICuL2o9z35ah5QAUhOD/FSYpXYxF/brPxZ5HIlKG2onFbv+Lnr+htTlEhrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8dyy5sg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HUl8007793
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z2fA9DJ8YNV54z8mQhEVP7iP
	Bg6WTKBukptObC7hMNM=; b=C8dyy5sgyphJfrqwzHzL65oFSLvAQmgRc25mYaXB
	53tmNDrCtj8Q0B1J3WwwlioVANimzEjLJVvgxV3XXoeMCUgPzfz6no1Z34FDG6AS
	XbtdZxMkxsFeIaamiowU7zXKCxMJMzInAzPDHSv+p9rxL1KMpOBN2ssChGUy5fSz
	ZgizavAaWn+vJJcgiU/VRo9oKcKYSOHtBDylTSKogyO4evQfYQ6H+7oKZXsbO8xV
	OvDhU6EDaN7w8IBGKeQmJNPOXErMcuBvN67WzgmSQJ22LMQBn30Ec0xH5/wpGNWb
	5t8sZw+SF4t2RQIg5hEAaz6cUCAG7Nmzs1I3/X1UoxHmvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98fucd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:42:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d2a73f02c3so14197341cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758616962; x=1759221762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2fA9DJ8YNV54z8mQhEVP7iPBg6WTKBukptObC7hMNM=;
        b=HaMyx9v6AYQ3w8XYcWh6jt5Y8qHYqCkQDE4o5F2RFISbdYndHQTseYPx14FRj+LpSK
         c8pSFYra6UjNX3zefDZ5aUeSniO2QC/PQ0vJc9oclSm0JjzDJv1V+eLd6rRDflavjt1A
         iBGhwJW5Zgo0Gq2/upNrwxyVjmyGx8f2jZPAfaeWANNttbr+PcnBG/0Ti95jcvaJIbx6
         pAIDlQ02lmhK5Cr/jOnx5sgnNEBE5+6BGBqdmd3Uh4ylxs4ZLyQMBhUzU0BcwHxq2MLo
         +/TmU0IiHKveDw/Yk9qpTbeCAK5u20rj471GDyPY6XcGtPl/8Ru4DNjvxLI50SO+t1x+
         1lQQ==
X-Gm-Message-State: AOJu0Yziwwvvpl/aVCghO6OQGMPXstDPsEhHeC+QKYLEMdtjShrsKZro
	GMr6BgF/dApgxogi8AMeYcy9GhpwPl81maNNGeZPWgwQL33WjPQ/yewIcedE2y4WFv2E+3EOcS8
	W+3opp0D1wvHYrE+fvxWGi2b2RSsmdNWORCl7kDlEjztCTwkKhs3nfSwXSyeV9ZX3mz1W
X-Gm-Gg: ASbGnctGJ/T/wjxmCxBEC6auERW4Tnh6sJ1CxWVAoupSy7+mQEeKJ6XLaNdR4LduEg7
	xb/eIoQGEC0XCogmYOvq/5Fv73baPXfP4m8EGXHKgbNFdcagMp/cCb65E03ePz6sCnVxXJHte9T
	SSGM5tveRjhTEzxePuN/bywoukrfh+v6SLGh6slWNbXHbZ69RqkCyGW7bboUo1B+ppDVkThMnem
	56uagYmPx6sEVo4xl1HR4sz8UmIeTZdj+97rYRTo07jZqWhVU2v8qhICz2S4KZmrIHpCkfiZa5V
	mcqNne/mH1HHxjJADrYXQN/flQEVuFGmx5+QUAuykA4S8+CPRoUh+rFEIrY6pVlvS7EQoRp3NR7
	+l+ouV/JpqTUndPWu6sSPd2E/U6Jc8Gu086+yEPydphkl6RVGOwVE
X-Received: by 2002:a05:622a:1442:b0:4d3:55f7:ddcd with SMTP id d75a77b69052e-4d36fdef829mr21097591cf.59.1758616962185;
        Tue, 23 Sep 2025 01:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfBM31sqOXyWY0RAEy5HEyWz3F55A8WuHffz3LWAvXYGBtE9Y7zjmLrqiag87MC5gxexqWuQ==
X-Received: by 2002:a05:622a:1442:b0:4d3:55f7:ddcd with SMTP id d75a77b69052e-4d36fdef829mr21097341cf.59.1758616961639;
        Tue, 23 Sep 2025 01:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57917119ba9sm3742505e87.121.2025.09.23.01.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:42:39 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:42:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-arm-msm@vger.kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, loic.minier@oss.qualcomm.com,
        andersson@kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board
 dts
Message-ID: <j2hpzksc3ldh2beraemnqlg7fppbg6pqht5f2lkqah777o3q7o@xzdkammzc5db>
References: <20250923064330.518784-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923064330.518784-1-hongyang.zhao@thundersoft.com>
X-Proofpoint-GUID: NfKnYDt3QF8ATgwK-97Pejj9NW9gYVbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXxqxJv8sISnOx
 gtZUva58jlW5lvXWTJCl2WGFnNr7cT9YrKU6B8a5Ur4YuPxk2mot3CN9FzPteLR6kpG6WvQ1xyh
 8Zq/mi8iwmtbMu3aUmMXNsyBS7nSv6QDjvqGT3/TM7agdheh7UQAV6+Bix/LSrP8+oS8V6ynXYQ
 GD2xmnPHm1ObBofzbbgQhyV7M08L2WQ/zgWpVyX/DHYVJoVpb2k/H8LClakaQm31W9Rs6HDurnC
 Wgqke5niQLbkepPEIbY8WIx/fKchekq/3NWU7r9KPW1mO1/cy3Ive3+1jTvxbuoYU18qDcca3VE
 EjmxVx3L1i0iqXPEvcoggDCznyIsPXIgxt/VnLzkfoucswnpzXX739BvOikrqj9pmWJjUMp0GA/
 AeBAlo0D
X-Proofpoint-ORIG-GUID: NfKnYDt3QF8ATgwK-97Pejj9NW9gYVbY
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d25d83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AynC_LEm352EljGV3FcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Tue, Sep 23, 2025 at 02:43:30PM +0800, Hongyang Zhao wrote:
> From: hongyang-rp <hongyang.zhao@thundersoft.com>
> 
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> This will add support for debug uart, usb-typec, wifi,
> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> and some voltage regulators to the board.
> 
> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1299 +++++++++++++++++
>  2 files changed, 1300 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> 
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";

It's not SM8350.

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu_in: endpoint {
> +						remote-endpoint = <&usb1_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	thermal-zones {
> +		sdm-skin-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 3>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		quiet-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		xo-thermal {
> +			thermal-sensors = <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	fan0: pwm-fan {

Please keep the nodes sorted.

> +		compatible = "pwm-fan";
> +		pwms = <&pm8350c_pwm 3 1000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwm_out_default>;
> +	};
> +
> +	vreg_m2_1p8: vreg_m2_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_m2_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <50000>;
> +		enable-active-high;
> +		gpio = <&tlmm 56 0>;
> +	};
> +
> +	vreg_sdio_wifi_1p8: vreg_sdio_wifi_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_sdio_wifi_1p8";
> +		regulator-enable-ramp-delay = <50000>;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpio = <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wifi_reset_active>, <&wifi_host_wake>, <&wifi_power_on>;

One entry per line, align on '<'.

> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm7325-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p972>;
> +		vdd-l2-l7-supply = <&vreg_bob_3p296>;
> +		vdd-l3-supply = <&vreg_s2b_0p876>;
> +		vdd-l5-supply = <&vreg_s2b_0p876>;
> +		vdd-l6-l9-l10-supply = <&vreg_s8b_1p272>;
> +		vdd-l8-supply = <&vreg_s7b_0p972>;
> +		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p872>;
> +		vdd-l13-supply = <&vreg_s7b_0p972>;
> +		vdd-l14-l16-supply = <&vreg_s8b_1p272>;
> +
> +		vreg_s1b_1p872: smps1 {
> +			regulator-name = "vreg_s1b_1p872";
> +			regulator-min-microvolt = <1840000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_s2b_0p876: smps2 {
> +			regulator-name = "vreg_s2b_0p876";
> +			regulator-min-microvolt = <570070>;
> +			regulator-max-microvolt = <1050000>;
> +		};
> +
> +		vreg_s7b_0p972: smps7 {
> +			regulator-name = "vreg_s7b_0p972";
> +			regulator-min-microvolt = <535000>;
> +			regulator-max-microvolt = <1120000>;
> +		};
> +
> +		vreg_s8b_1p272: smps8 {
> +			regulator-name = "vreg_s8b_1p272";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1500000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
> +		};
> +
> +		vreg_l1b_0p912: ldo1 {
> +			regulator-name = "vreg_l1b_0p912";
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <925000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p072: ldo2 {
> +			regulator-name = "vreg_l2b_3p072";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3b_0p504: ldo3 {
> +			regulator-name = "vreg_l3b_0p504";
> +			regulator-min-microvolt = <312000>;
> +			regulator-max-microvolt = <910000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4b_0p752: ldo4 {
> +			regulator-name = "vreg_l4b_0p752";
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <820000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		reg_l5b_0p752: ldo5 {
> +			regulator-name = "reg_l5b_0p752";
> +			regulator-min-microvolt = <552000>;
> +			regulator-max-microvolt = <832000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-name = "vreg_l6b_1p2";
> +			regulator-min-microvolt = <1140000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p952: ldo7 {
> +			regulator-name = "vreg_l7b_2p952";
> +			regulator-min-microvolt = <2952000>;
> +			regulator-max-microvolt = <2952000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_0p904: ldo8 {
> +			regulator-name = "vreg_l8b_0p904";
> +			regulator-min-microvolt = <870000>;
> +			regulator-max-microvolt = <970000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-name = "vreg_l9b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_1p504: ldo11 {
> +			regulator-name = "vreg_l11b_1p504";
> +			regulator-min-microvolt = <1504000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_0p751: ldo12 {
> +			regulator-name = "vreg_l12b_0p751";
> +			regulator-min-microvolt = <751000>;
> +			regulator-max-microvolt = <824000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b_0p53: ldo13 {
> +			regulator-name = "vreg_l13b_0p53";
> +			regulator-min-microvolt = <530000>;
> +			regulator-max-microvolt = <824000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_1p08: ldo14 {
> +			regulator-name = "vreg_l14b_1p08";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_0p765: ldo15 {
> +			regulator-name = "vreg_l15b_0p765";
> +			regulator-min-microvolt = <765000>;
> +			regulator-max-microvolt = <1020000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b_1p1: ldo16 {
> +			regulator-name = "vreg_l16b_1p1";
> +			regulator-min-microvolt = <1100000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_1p7: ldo17 {
> +			regulator-name = "vreg_l17b_1p7";
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_1p8: ldo18 {
> +			regulator-name = "vreg_l18b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19b_1p8: ldo19 {
> +			regulator-name = "vreg_l19b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pm8350c-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +		vdd-l1-l12-supply = <&vreg_s1b_1p872>;
> +		vdd-l2-l8-supply = <&vreg_s1b_1p872>;
> +		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob_3p296>;
> +		vdd-l6-l9-l11-supply = <&vreg_bob_3p296>;
> +		vdd-l10-supply = <&vreg_s7b_0p972>;
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_s1c_2p19: smps1 {
> +			regulator-name = "vreg_s1c_2p19";
> +			regulator-min-microvolt = <2190000>;
> +			regulator-max-microvolt = <2210000>;
> +		};
> +
> +		vreg_s2c_0p752: smps2 {
> +			regulator-name = "vreg_s2c_0p752";
> +			regulator-min-microvolt = <750000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +
> +		vreg_s5c_0p752: smps5 {
> +			regulator-name = "vreg_s5c_0p752";
> +			regulator-min-microvolt = <465000>;
> +			regulator-max-microvolt = <1050000>;
> +		};
> +
> +		vreg_s7c_0p752: smps7 {
> +			regulator-name = "vreg_s7c_0p752";
> +			regulator-min-microvolt = <465000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +
> +		vreg_s9c_1p084: smps9 {
> +			regulator-name = "vreg_s9c_1p084";
> +			regulator-min-microvolt = <1010000>;
> +			regulator-max-microvolt = <1170000>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-name = "vreg_l1c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_1p62: ldo2 {
> +			regulator-name = "vreg_l2c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <1980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_2p8: ldo3 {
> +			regulator-name = "vreg_l3c_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3540000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_1p62: ldo4 {
> +			regulator-name = "vreg_l4c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5c_1p62: ldo5 {
> +			regulator-name = "vreg_l5c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c_2p96: ldo6 {
> +			regulator-name = "vreg_l6c_2p96";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-name = "vreg_l7c_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p62: ldo8 {
> +			regulator-name = "vreg_l8c_1p62";
> +			regulator-min-microvolt = <1620000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p96: ldo9 {
> +			regulator-name = "vreg_l9c_2p96";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_0p88: ldo10 {
> +			regulator-name = "vreg_l10c_0p88";
> +			regulator-min-microvolt = <720000>;
> +			regulator-max-microvolt = <1050000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_2p8: ldo11 {
> +			regulator-name = "vreg_l11c_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12c_1p65: ldo12 {
> +			regulator-name = "vreg_l12c_1p65";
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13c_2p7: ldo13 {
> +			regulator-name = "vreg_l13c_2p7";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob_3p296: bob {
> +			regulator-name = "vreg_bob_3p296";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
> +			   <GCC_MSS_CFG_AHB_CLK>,
> +			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
> +			   <GCC_MSS_OFFLINE_AXI_CLK>,
> +			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +			   <GCC_MSS_SNOC_AXI_CLK>,
> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +			   <GCC_QSPI_CORE_CLK>,
> +			   <GCC_QSPI_CORE_CLK_SRC>,
> +			   <GCC_SEC_CTRL_CLK_SRC>,
> +			   <GCC_WPSS_AHB_BDG_MST_CLK>,
> +			   <GCC_WPSS_AHB_CLK>,
> +			   <GCC_WPSS_RSCP_CLK>;
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcs6490/a660_zap.mbn";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@39 {
> +		compatible = "lontium,lt9611";

Interesting.

> +		reg = <0x39>;
> +
> +		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin>,
> +			    <&lt9611_rst_pin>,
> +			    <&lt9611_enable_pin>;

-names after -0

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
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;

Without link-frequencies it's limited to HBR2, is this expected?

> +	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +};
> +
> +&mdss_dsi {
> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";

Here and below: empty line before status, please.

> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +	vdds-supply = <&vreg_l10c_0p88>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;

No wake-gpios?

> +
> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
> +	pinctrl-names = "default";
> +
> +	vdda-supply = <&vreg_m2_1p8>;
> +
> +	status = "okay";
> +};
> +

[...]

> +
> +&pm8350c_gpios {
> +	fan_pwm_out_default: fan_pwm_out_default {

You should have gotten a warning here.

> +		pins = "gpio8";
> +		function = "func1";
> +		power-source = <1>;
> +		drive-push-pull;
> +		output-high;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +	};
> +};
> +
> +&pmk8350_rtc {
> +	status = "okay";
> +	allow-set-time;

status should be the last property.

> +};
> +
> +&pmk8350_vadc {
> +	channel@3 {
> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> +		label = "pmk8350_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@44 {
> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label = "xo_therm";
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@103 {
> +		reg = <PM7325_ADC7_DIE_TEMP>;
> +		label = "pm7325_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@144 {
> +		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pm7325_quiet_therm";
> +	};
> +
> +	channel@146 {
> +		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pm7325_sdm_skin_therm";
> +	};
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&qup_uart7_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	bias-bus-hold;
> +};
> +
> +&qup_uart7_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&qup_uart7_rx {
> +	/*
> +	 * Configure a pull-up on RX. This is needed to avoid
> +	 * garbage data when the TX pin of the Bluetooth module is
> +	 * in tri-state (module powered off or not driving the
> +	 * signal yet).
> +	 */
> +	bias-pull-up;
> +};
> +
> +&qup_uart7_tx {
> +	/* We'll drive TX, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs6490/adsp.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs6490/cdsp.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/qcs6490/modem.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_wpss {
> +	firmware-name = "qcom/qcs6490/wpss.mbn";
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;

What's the difference from the defaults here?

> +
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	non-removable;
> +	keep-power-in-suspend;
> +	/delete-property/ cd-gpios;
> +
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	bt_device_wake: bt_device_wake {

Please check your DT for schema compliance. Read the documentation for
DT writing. There are two mistakes here.

> +		pins = "gpio39";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	bt_host_wake: bt_host_wake {
> +		pins = "gpio137";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	bt_reset: bt_reset {
> +		pins = "gpio17";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> +		pins = "gpio28";
> +		function = "gpio";
> +		/*
> +		 * Configure a bias-bus-hold on CTS to lower power
> +		 * usage when Bluetooth is turned off. Bus hold will
> +		 * maintain a low power state regardless of whether
> +		 * the Bluetooth module drives the pin in either
> +		 * direction or leaves the pin fully unpowered.
> +		 */
> +		bias-bus-hold;
> +	};
> +
> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> +		pins = "gpio29";
> +		function = "gpio";
> +		/*
> +		 * Configure pull-down on RTS. As RTS is active low
> +		 * signal, pull it low to indicate the BT SoC that it
> +		 * can wakeup the system anytime from suspend state by
> +		 * pulling RX low (by sending wakeup bytes).
> +		 */
> +		bias-pull-down;
> +	};
> +
> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		/*
> +		 * Configure a pull-up on RX. This is needed to avoid
> +		 * garbage data when the TX pin of the Bluetooth module
> +		 * is floating which may cause spurious wakeups.
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> +		pins = "gpio30";
> +		function = "gpio";
> +		/*
> +		 * Configure pull-up on TX when it isn't actively driven
> +		 * to prevent BT SoC from receiving garbage during sleep.
> +		 */
> +		bias-pull-up;
> +	};
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-1 = <&qup_uart7_sleep_cts>,
> +		    <&qup_uart7_sleep_rts>,
> +		    <&qup_uart7_sleep_tx>,
> +		    <&qup_uart7_sleep_rx>;
> +	pinctrl-names = "default",
> +			"sleep";
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4345c5";
> +		clocks = <&sleep_clk>;
> +		clock-names = "lpo";
> +		device-wakeup-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&tlmm 137 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&bt_device_wake>, <&bt_host_wake>, <&bt_reset>;

one per line

> +		pinctrl-names = "default";
> +		vbat-supply = <&vreg_sdio_wifi_1p8>;
> +		vddio-supply = <&vreg_sdio_wifi_1p8>;
> +		max-speed = <3000000>;
> +	};
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {

Please rebase on top of a resent linux-next.

> +	dr_mode = "otg";

This is the default

> +	usb-role-switch;

This should be a part of sc7280.dtsi

> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l10c_0p88>;
> +	vdda33-supply = <&vreg_l2b_3p072>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-supply = <&vreg_l1b_0p912>;
> +
> +	orientation-switch;

Is it not?

> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_dp_qmpphy_usb_ss_in {
> +	remote-endpoint = <&usb_1_dwc3_ss>;

Is it not?

> +};
> +
> +&usb_dp_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;

Is it not?

> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p952>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <900000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&venus {
> +	status = "okay";
> +};
> +
> +&thermal_zones {
> +	cpu0-thermal {
> +		trips {
> +			cpu_tepid: cpu-tepid {
> +				temperature = <65000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +
> +			cpu_warm: cpu-warm {
> +				temperature = <80000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +
> +			cpu_hot: cpu-hot {
> +				temperature = <90000>;
> +				hysteresis = <5000>;
> +				type = "active";
> +			};
> +		};
> +	};
> +
> +	gpuss0-thermal {
> +		trips {
> +			gpuss0_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +		};
> +	};
> +
> +	gpuss1-thermal {
> +		trips {
> +			gpuss1_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "passive";
> +			};
> +		};
> +	};
> +
> +	nspss0-thermal {
> +		trips {
> +			nspss0_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	nspss1-thermal {
> +		trips {
> +			nspss1_alert0: trip-point0 {
> +				temperature = <95000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +};
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */

If you have a separate section for pinctrl, why did you have pinctrl
entries for qup_uart7_* earlier?

> +
> +&sdc2_clk {
> +	bias-disable;
> +	drive-strength = <16>;
> +};
> +
> +&sdc2_cmd {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&sdc2_data {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&tlmm {
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio20";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio21";
> +		function = "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	lt9611_enable_pin: lt9611-enable-pin {

Again, wasn't validated.

> +		pins = "gpio83";
> +		function = "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	pcie1_reset_n: pcie1-reset-n-state {
> +		pins = "gpio2";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-disable;
> +	};
> +
> +	pcie1_wake_n: pcie1-wake-n-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	wifi_reset_active: wifi_reset_active {
> +		pins = "gpio16";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		output-high;
> +		bias-disable;
> +	};
> +
> +	wifi_host_wake: wifi_host_wake {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wifi_power_on: wifi_power_on {
> +		pins = "gpio125";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb1_sbu_default: usb1-sbu-state {
> +		oe-n-pins {
> +			pins = "gpio53";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;
> +		};
> +		sel-pins {
> +			pins = "gpio52";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};
> +	};
> +};
> +
> +/*
> + * Update the lpassaudio node to support the new compatible as the
> + * lpassaudio needs to support the reset functionality on the
> + * QCS6490 RUBIK Pi 3 board and the rest of the Audio functionality would be
> + * provided from the LPASS firmware.
> + */
> +&lpass_audiocc {
> +	compatible = "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;
> +};
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

