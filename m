Return-Path: <linux-arm-msm+bounces-77390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787BBDEA42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36B5B4EA5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E637427B4EB;
	Wed, 15 Oct 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DB6qsVum"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B0131DD86
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533453; cv=none; b=fk0HpDh1bHyeMgsHA3yE8dID7PZ2Pvo2gftRcFMCF1+a5XKqxf0SPs2AQVbgK5Rfgt/pnqzZ1HEWHFLCXWc2H8w7Tn/djYuRdictNzfWWB6gvj+nqgmJ2T5Y3wxEOiLVHPSTDPul37aF7WR259cICulqd2TEvANh9BPS+ACZudM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533453; c=relaxed/simple;
	bh=b4Z+2kCXQ06dTUoVr/Yo2GI1CjYUUAo6eQ+cCxbPpmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CToEw0pEQmVozq0BwYY2wqd1n39IFkgOnOpLULYU1oB5BATuuMPePAsA58TpIxa/cl+4IMFkYTQYbE4YPZiwSropgZiiixisYPBrXUVooNtyaH8i5qq5CQqUphATeu9k/agykH03n6E/0ufrrp4GYLkibXaHIef/sU7tSo/BtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DB6qsVum; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAKd6t003473
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wOxtkt7XNtAF+fNsKokkDiRs
	zjGDLcWBT1cZVg386fg=; b=DB6qsVumdbsoZJi0q4FYx+LYyEM7NjFj/3Mossxk
	+XDF8Hh32g/HQsrqELpb6cE8dXFbgBT7KlYkuf4/5TGwV7Wn2DCoa5QCV8diMgEA
	Oizj3HveJRzx8tthkFrGq1PVUatZ2gN1sD/uOX0P0ow2+62OZB9Tp9MUoE6pfN6E
	DmTgGcUbLU74+/msBRw8DmM8Utpo73PKbU4b1Nm40WV/gFQB1Sid9qRJeLtkt9wp
	1NaPG9JiLrjQEwURlD22mS949TexTs7QmHVLch+lMf+mQqL0gKTcj6wg87ALyJom
	4nPYRWLrtNsW29hGbHtbm8ugaJvAQ081wstY8IokwMlfaQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8k2fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:04:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-63d1ca031beso2582656d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760533450; x=1761138250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOxtkt7XNtAF+fNsKokkDiRszjGDLcWBT1cZVg386fg=;
        b=QUOkSEzalInRNgU2O0d6hoeoftoGw4tRFYYKjo6kur6D0ReKNPhQFblmhNeKeH5a4J
         22Sj8cPS/SV3eSWFrXGbODC/GwdbTl2NQs33DY3YXVIgYTNEo+Ars/bmiDx8JjHpZB1P
         zmVMxg6axaX81Ct+oZYX+VGQc/FVTMoy0HbtkQWJ35T6BSIFLhymtQXBmU66Oklq34wc
         9Rxe6gk/EYbz1/z1VeNLRmbQJRXNkcRNlE6Pwzsvl1oCLFG5SjiZbofVE35QhIochqDc
         nuf8E8s59cWWb41E1kgAWmlgHKrX9sN6FB8H2+WULSS1WDWxtIkO9xP43v1C6b6l8ZTF
         24rw==
X-Forwarded-Encrypted: i=1; AJvYcCXa8rJ+UKuQzZgz64T0naC/87gVXYjX6zZZAMCmWtkI+1hlGFjt05IAvwXbl6Wyb9y9rC3Ru2NCc4Vb4/mn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzj6qtJXIiwUdB6YlbYYm84QzthGl+7cIbFIkMx6KKd9ocvVAT
	u/SZgsmuK88+/o6DCMR071AeY5eT4RLTcbZ5PBspjPtm7/+Q+cdfzbNyuOXigcaUEiaMJ/+YRk0
	Q8PSdtjnchq1xj4DRehS1TLRQRip6CzjD3GmLvfbyglN4fURKRtksePceIaFbABGV5VXQ
X-Gm-Gg: ASbGncuLA5pmEcFtBm36wl9O2sJatv8NtkC5RHjfE2YjTnYyNVX0htosuk3GFlbzTmp
	xhVNPJ5nQigeSzULmhAZkIGU+8/WJbuEvdZ2YjMBNWH+M6BXvV0q32ZopVdPdHU+xRPqajtDxZQ
	KBiE1Ob6cyDSKxvB3oXgsLHmnp6Z1RWdE4cS8gPwsvF3qsYikqf9Wp81dA+Nzh7do0yDyZxgOqR
	g01mPa4dzKeU8fuepz2a+iQ6OxdtLoEX9soY6EHi2Y7gFHgXvJtoC5GZVFpzoxClBydg4fFM7Du
	f5jUJNxpfJvZiSnVmvwqfubTX7k4RKt5fx+XfMClNIGhiwq4PKvySmrmgnmdZ9IgatCgedCv3x8
	ZKKAsrlRf0uDYc/bEqfLwTH8AnyIXkKGtARTzsBI38BSPc0+hMap5
X-Received: by 2002:a05:690e:1557:20b0:63c:efd6:c607 with SMTP id 956f58d0204a3-63cefd6ca19mr13123300d50.3.1760533449794;
        Wed, 15 Oct 2025 06:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Az03cIeX6jAKim1Y6OpSzpqgIz3WsG/1vJDxt9LC2vpCqHgl2aTiXSs/Zi9aDo/PKtvh3Q==
X-Received: by 2002:a05:690e:1557:20b0:63c:efd6:c607 with SMTP id 956f58d0204a3-63cefd6ca19mr13123235d50.3.1760533449058;
        Wed, 15 Oct 2025 06:04:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563d19sm6208728e87.63.2025.10.15.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:04:08 -0700 (PDT)
Date: Wed, 15 Oct 2025 16:04:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: talos-evk: Add ADV7535 DSI-to-HDMI
 bridge
Message-ID: <53ef53b423uespn7xspqfxnnvqvhzb5b22a4oaimf6g2qy7ruo@273oegazxbaz>
References: <20251015122808.1986627-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015122808.1986627-1-tessolveupstream@gmail.com>
X-Proofpoint-GUID: cWvTjBdJ4LL1nbeNatGEDlzDnYEkD_iT
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef9bca cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=Mdf5GqcyFXJwrPG7iDEA:9 a=CjuIK1q_8ugA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXzze7BSwsPEkp
 hSXvSIqBVhk02+a1j6paWGGH7xoNftjoLJdGiaHgGahh+HITJw1slJ2VvJrAt8+5CcWzrQof4SI
 JlRWqWhCQUuodwqqKSxebo1nC49uxgEFpPd4cgfpvl17qBVjr/PO0jFO8EgAP9tkgMrM4aYi7mF
 52Xl+/gdSUfEvuvdQoartsq45/9b/g1xICoNLp12Ceyetq+FwvIVywXG5267hAcuhabwJu9PxfS
 NYZ+dyFKnAZWgKnm1UJ80Mf0d3lxm4cg+M9z6YqErjuAqXUbxRRpwcXm00R0Jm7WEanAnqt28TS
 z4lgQvtj0/ZX10VR+VREVFk3xbJfqA/rd45oEKf+81RrtFhJnOCX+/z2K3WKR32IpYsYfyLYW/h
 +6sbFAnhS6VPW9HwhRF3r2Zi/Nce/Q==
X-Proofpoint-ORIG-GUID: cWvTjBdJ4LL1nbeNatGEDlzDnYEkD_iT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

On Wed, Oct 15, 2025 at 05:58:08PM +0530, Sudarshan Shetty wrote:
> Hook up the ADV7535 DSI-to-HDMI bridge on the QCS615 Talos EVK board.
> This provides HDMI output through the external DSI-to-HDMI converter.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 21 ++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts      | 76 +++++++++++++++++++++
>  2 files changed, 97 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> index 55ec8034103d..b58cae02c9cb 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -244,6 +244,27 @@ eeprom@5f {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&adv7535_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
>  &pcie {
>  	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> index 25057f4f6a91..f7e8be3667d1 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -14,6 +14,82 @@ / {
>  	aliases {
>  		mmc1 = &sdhc_2;
>  	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "d";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint = <&adv7535_out>;
> +			};
> +		};
> +	};
> +
> +	vreg_v1p2_out: regulator-v1p2-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v1p2-out";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v1p8_out: regulator-v1p8-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v1p8-out";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v3p3_out: regulator-v3p3-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-out";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

Please describe the power grid. Are these regulators being fed by
nothing and generating energy from the thin air?

> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	adv7535: adv7535@3d {
> +		compatible = "adi,adv7535";
> +		reg = <0x3d>;
> +		avdd-supply = <&vreg_v1p8_out>;
> +		dvdd-supply = <&vreg_v1p8_out>;
> +		pvdd-supply = <&vreg_v1p8_out>;
> +		a2vdd-supply = <&vreg_v1p8_out>;
> +		v3p3-supply = <&vreg_v3p3_out>;
> +		v1p2-supply = <&vreg_v1p2_out>;

I think this is not correct. Please consult your schematics isntead of
adding dummy regulators.


-- 
With best wishes
Dmitry

