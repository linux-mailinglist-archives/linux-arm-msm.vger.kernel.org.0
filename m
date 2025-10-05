Return-Path: <linux-arm-msm+bounces-75986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61ADBBCCDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 00:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C5653B608B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 22:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0447623A99E;
	Sun,  5 Oct 2025 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsF5nFrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A035963
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759701804; cv=none; b=JRM8/yMoazNTSDd76grJNW/rCAhMtx37kC4CRVnK8EAcztkeocwZXvZ7LwgxMmbyL52MJm7RvCkUC6cpybGO2w682/fI3VbnbC6YNfQEzyKn0ZJBgfVf7lLEXOVwIe3NlqZKFltvkhgTtCa0I6KNRQknE8tvVRsAt6wH0CZYiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759701804; c=relaxed/simple;
	bh=UemTxZSHmDkq5MxMmWcXmWUSBvSraZvY2UlDpwQp2Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVssF7lJ/ymp2Fn+KlBoHERa+OlpyO2Uss92zdnnMSm83b/yfEG/3HSkeLFUUYFbLb/YQhmLgrGjVquhxcBQmI74ekYzDQv2SteIgDxdDu/YS9zCBjNKHJ0W8F1TUGjz1tZ/E3SMEhZZn17gRfvXtScCy0kuTMFKtsA2JP5Blf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsF5nFrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LZUQ1002014
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 22:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMdR/HyMobo9FEXeKVK1JCM36nyqq6wn+ZX2/Ejl1/I=; b=KsF5nFrz7k0HRvsn
	x2zAZPAms8ErFXQd6lODI0y0jTuiEJW4uGpKTJlUAUcYgoQjn2h1fuVqbg9WotVz
	BUXD/g07EDbYR1cKpYJmlKwde8MZHSO4PfdqjgL9rcvtCFDO94ZiBM9KPs6W7Wbr
	pckf0gp/wng9Wj9qwMbD5NP6ISJGgoxpHn4kE9xerdy3VHjxLqOUW2TizYly/Sjn
	6ApapGp3Lo+KURFpqMR7s7j/GRMvvlBOOcVECuoUZB1GZ+q6OjAoEYoM851xQgDg
	hUsQQwxpDjLkxCSg5U4ajRwjhJoq9cE5zz9I7Pc7wObTGbHUYEWmIPj8APz1OC3F
	8SBuVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1jfv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 22:03:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4df7cdf22cbso134215831cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759701801; x=1760306601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMdR/HyMobo9FEXeKVK1JCM36nyqq6wn+ZX2/Ejl1/I=;
        b=wfb0BxfbJdfzvh5t/eK8+bD91NhJKVHuJ0uIgvgan5Un2V952VIINeGDHqIZR0buZ5
         9tY9bLQOYKb3LFke92Hvps6+PiepTU95Nt+Umz5L8W10OKA9dVWYsVtCGbJlvhv08XPY
         hFWQKKdYH0NbcTezDLZ/QdRuSmI7rF/4C9r8yvQfGX1lRSyl7L0nFhP+0hfZrWgMzgOq
         vcy3TdiNrIhb6z96tG2/uxvsoan1Zw/d/njs+Ywvw6u7PeOXOvHrHqWLL5O+/AFBQHkY
         YmOntAnk4xyAo3hKx3rPuOCIOot2EUE02f81jo819d9JpqSdBZAos/4cWav11olfhR+N
         IVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQCnTK7x1bIV1eVqZm6BUQ8lKGnGHUagiBikrsS09KWsNdRJo2yM+OkbaeyqLIjl/2y0EIUI5EVVOHJu6P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OynAjC9knk3sO29oqgp71zSfm04JTB4QUw0Lbi2sBZTnNKR9
	KcgAKShD0GTZGICKgsvLRn9QeKQYbEr9jIILz0qAA5wufI8A2wAh0fHrpujELuvqew4y9szk1xN
	/lvBdbllf6xwMeYdz5x4gSA/DtythkZsFhEcvR1AnCzyK2vVM2KX89LTZy+M0AuVaWv+5
X-Gm-Gg: ASbGncsDScUCqZH+g9u0phZvDr2ns+lZFNkne+ytJZ8B0IoJ1ksN0c8xgg+tIpQvPC+
	EMr3ZkRzgn8GSZ5Vu3gFaVp6YkUetRbfBfkAvcSzB8C6b5r1n04uwHS5DpZPuwT0qN+XyH94azP
	3Ry7sBcoAuv54MGGX0hGL1LUKgUs9rHR+DMML/95XuyNhnXTZfVkPzCACL7tQMLgzBb2LRa2kkO
	N1GaPnHajqv7Eiq6cYaqnUfzESKq+YvQQwzqRZa1h4OazodiSWHpZIS2tTV3TAhv3iNMVaqjDZ9
	AAxJp/DEgJdonvQHe1jkzsDVUPRzQCbwx0rZRTuTvtxQGwDRH/Bpx4XgoD3InTw2qgo4ANUAESq
	yZkVR7tHkN7MPCpoIEv9Cn49CWwk0F8yZrShI5qh8gHN48coJfnR5XgPcLw==
X-Received: by 2002:a05:622a:54:b0:4b6:3d70:8810 with SMTP id d75a77b69052e-4e563187075mr170604791cf.22.1759701800745;
        Sun, 05 Oct 2025 15:03:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs9P8bw0ZbEnznRF0oKbCi7yI/oQBDqY5h6QbzxJhCrXe5+PNfq8RTiBwdiIEL4EPncYzqRg==
X-Received: by 2002:a05:622a:54:b0:4b6:3d70:8810 with SMTP id d75a77b69052e-4e563187075mr170604271cf.22.1759701800130;
        Sun, 05 Oct 2025 15:03:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124b4dsm4357261e87.13.2025.10.05.15.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:03:19 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:03:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
Message-ID: <n4xims4y5sssqxkchg2tikc7idkzds5ru7ayidcgxdfx77je2d@qo34qucbebnn>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
X-Proofpoint-GUID: -Sb1b-QlgKTRHTJERYYR7lOiqG13zjGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX3PLLrsQRaJ2W
 TZfTOqI+yRQIhsCvTIkJoDrPpgffoVHS50Lr09XoH+sLnMrSfY+OuKyn7fbexEFOuSN2tenl11K
 7vOI3IGUKwkN5l+LjNsE1TQuO6kHsrJmBQiQcrsFMoycrmJw8JDpz0CwEnFeagpQtKUBvnkd15U
 NxXi6MDEdbcHS1n3F+oqyyu+2XTVeS82V8Xx195BXDKF8Wpb095bW64VtAvxi3T5ssfHeCEFL6l
 99CYt4rNn7bYQXxMFV+sGhmHgedNQSWZiZwd7sTcMmpNoVZiqIhHm1Lyyr1nMcs9qmIp5Ym9vYY
 N46mzVsnuh2U5Ll5oSJnBxBlruLZv0N6fxIFxMYPwkQN6ratMd9NIiZF4HPqDFktT6lndFXFQkU
 4awI4VTz9dw+Frq98iDZqHjrXTOW8w==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e2eb2a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=WFa1dZBpAAAA:8
 a=VwQbUJbxAAAA:8 a=aS6tGfMv4a9zPy4yCXEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-ORIG-GUID: -Sb1b-QlgKTRHTJERYYR7lOiqG13zjGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Sun, Oct 05, 2025 at 03:16:29PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)

Great to finally see it being submitted!

> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> Supported functionality includes:
>  - Debug UART
>  - UFS
>  - Charger
>  - USB-C (peripheral mode)
>  - Display (Pixel 3 only)

No remoteprocs / IPA / GPU / Venus / WiFi / BT? The firmware is
accessible to download from Google and it can be further repackaged (but
not redistributed). See [1], [2].

The phones share all firmware except for the bdwlan, so hopefully you
can add 'Google/blueline/foo.mbn' to the common file.

[1] https://github.com/linux-msm/meta-qcom-extras/blob/master/recipes-bsp/firmware-nexus/firmware-qcom-pixel3.bb
[2] https://github.com/linux-msm/meta-qcom-extras/blob/master/recipes-bsp/firmware-nexus/firmware-qcom-pixel.inc

> 
> GPIOs 0–3 and 81–84 are not accessible from the application CPUs,
> so they are marked as reserved to allow the Pixel 3 to boot.
> 
> The rmtfs region is allocated using UIO, making it technically "dynamic."
> 
> Its address and size can be read from sysfs:
> 
> $ cat /sys/class/uio/uio0/name
> /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> 
> $ cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
> side of the rmtfs region to work around an XPU bug that would otherwise
> cause erroneous violations when accessing the rmtfs_mem region.
> 
> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  .../arm64/boot/dts/qcom/sdm845-google-blueline.dts | 128 ++++++
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 467 +++++++++++++++++++++
>  .../boot/dts/qcom/sdm845-google-crosshatch.dts     | 137 ++++++
>  4 files changed, 734 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a085..ba05dc935dc7c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -239,6 +239,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> new file mode 100644
> index 0000000000000..df88982018b9e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "sdm845-google-common.dtsi"
> +
> +/ {
> +	model = "Google Pixel 3";
> +	compatible = "google,blueline", "qcom,sdm845";
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <2970000>;
> +		voltage-min-design-microvolt = <3600000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* for u-boot */
> +		framebuffer: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (2160 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <2160>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		framebuffer_region@9d400000 {

Can't we use cont_splash_mem and let bootloader set it?

> +			no-map;
> +			reg = <0 0x9d400000 0 0x02400000>; // FIXME
> +		};
> +	};
> +};
> +
> +&gmu {
> +	status = "okay";
> +};

No need to, it's enabled by default.

> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel_in>;
> +				data-lanes = <0 1 2 3>;
> +				qcom,te-source = "mdp_vsync_e";

&mdss_dsi1_out {
	remote-endpoint = <&panel_in>;
	.....
};


> +			};
> +		};
> +	};
> +
> +	panel@0 {
> +		compatible = "lg,sw43408";
> +		reg = <0>;
> +
> +		vddi-supply = <&vreg_l14a_1p88>;
> +		vpnl-supply = <&vreg_l28a_3p0>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_pmgpio_pins>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +
> +	status = "okay";
> +};
> +
> +&pm8998_gpios {
> +	panel_pmgpio_pins: panel-pmgpio-active-state {

Are these two actually used by the panel? I think they were only used
for sw43402, but not for sw43408.

> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +
> +	volume-keys {

gpio-keys ?

> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_up_gpio>;
> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {

Nit: BCP is regulator-foo-bar

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_s4a_1p8: vreg-s4a-1p8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
> new file mode 100644
> index 0000000000000..dc9938ffc0ab8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "sdm845-google-common.dtsi"
> +
> +/ {
> +	model = "Google Pixel 3 XL";
> +	compatible = "google,crosshatch", "qcom,sdm845";
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <3480000>;
> +		voltage-min-design-microvolt = <3600000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;

These are all the same as the -blueline. Please move common options to
the -common.dtsi

> +
> +		/* for u-boot */
> +		framebuffer: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;
> +			width = <1440>;
> +			height = <2960>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		framebuffer_region@9d400000 {
> +			no-map;
> +			reg = <0 0x9d400000 0 0x02400000>;
> +		};
> +	};
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&mdss {

More and more common properties. Please move them to the common file.

> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel_in>;
> +				data-lanes = <0 1 2 3>;
> +				qcom,te-source = "mdp_vsync_e";
> +			};
> +		};
> +	};
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3ha8";
> +		reg = <0>;
> +
> +		vci-supply = <&vreg_l28a_3p0>; // downstream
> +		vdd3-supply = <&vreg_l28a_3p0>;
> +		vddr-supply = <&vreg_l14a_1p88>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &se8_spiflash &panel_pmgpio_pins>;

- Why do you need spiflash here?
- I don't think this uses pmgpios too.

> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +
> +	status = "okay";
> +};
> +
> +&pm8998_gpios {
> +	panel_pmgpio_pins: panel-pmgpio-active-state {
> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&tlmm {
> +	se8_spiflash: se8-spiflash-state {
> +		pins = "gpio65", "gpio66", "gpio67", "gpio68";
> +		function = "gpio";
> +		input-enable;
> +		bias-disable;
> +	};
> +
> +	panel_te_pin: panel-te-state {
> +		pins = "gpio12";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_reset_pins: panel-active-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_suspend: panel-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +};
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

