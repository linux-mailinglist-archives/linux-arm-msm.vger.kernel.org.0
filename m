Return-Path: <linux-arm-msm+bounces-74287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E770B8CC18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6EC464B52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15761FE451;
	Sat, 20 Sep 2025 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nm9siE/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F431DA0E1
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758383216; cv=none; b=ndkQXaV2O23TL0/2q2BjMFlQaxGVkyRiOqxnYXe02YKUF1RJKYQqHMu+xiINvlkBt6nDHbbGVUiX0QA3J1pizOAqaIsQ/8BOwtLc2cmj7CPmhT3ws26KEwlRkpBWUgSlt6F+DmYxDjS0rMp6TtAfnqdPG6yKcm/upiHhF3l0V98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758383216; c=relaxed/simple;
	bh=jOmWz03Ia8/ArDone93w5+2EdXOcDXmwCrpQnZgR/bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfS92E2//efmIh15ptBNLEHL4uGe1BBtW8iuf1LI+3hAtIbgm6yCcqxMxEIPbQ06oLD2kvngTVORfGabPAIrbMpITSuXihUyH5LWTJTvWC0bCk+0k/WlEULaYHU7huN3bajd/AGKJSU7SRukoUinECGJXkYNQiirq6qPzicA0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nm9siE/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KCI8Xl028908
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Mvv9Y6aHZOLeHDqC9HwSVvWqQJx4/TBvwZeSqiwehY=; b=nm9siE/hmLNWWPJi
	u3l/re+PRSexcoJrs7vJQ1zZTnOj3udNmC4rSN1UZ8bPBLaNVox/poUgHhioZc18
	8veX3Hvccmn2aAJ/Kmrli5qnIyW2bb840v41WZRbaxXPIzeXXl536imfk5rNxbEZ
	BBSrt89k5x2RBEGcFubBTJVqWxzRWS9UdftwyvBrlA9FzdPN+UUvZ45zFICeGgA6
	HtTG3Y01JR6F+yA4byN6P9m3JkuypLd2bpm5O2EBUekXr1kooR0jFqX2Xa0Fd2dL
	nncpWnflKHsJ6jarjJDr11SjUIemTvfD838mEFlDCx4guKwrmxO28cNyTLHcKp9v
	vc9UcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mbv0wp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:46:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78de70c9145so49121956d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 08:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758383213; x=1758988013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mvv9Y6aHZOLeHDqC9HwSVvWqQJx4/TBvwZeSqiwehY=;
        b=Vi6hXwab+dr+fcg8iuAHgssbRTq1QbsPdvUP39n0je8vu03KfhIr9ay+m4le0IjPrX
         gY2vO2UhJnejyQwgzkr+b5WwZoUgREwCmaUaga6iMiWtRkYOdiY3aBZ9Ds2ka51de0wc
         JeKLFoo+w9W5WLi4s8998aaBAibBRP4PGLjiYuKRL0N716fz8mjZY16btnqmIvE4Gbst
         xh67bxwv3Q54weyINc2ljQABj9u0SR4NWkkvKMDnJ6VXgVh1SeL3r6UXp0uSHWxmkahn
         x8ZZcnCY1bccjvcBEIUsEV6KNj1cQHGARzpLJdPphApX6vN/8kJP8Yu4MaT32yYxckwc
         r8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3F9j3+5ynHTQAhCEwuZeCqL0XDPPNWtyNUIlB4iheDgoVZtpLutdHWS8+MiDVkSz20ST4JbqZHscQXpxX@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUPePpQdacVHUSwFd8PICRMTbPOu5I8t7JnTrS2y3Ss5bFCVa
	D+pSXFgEf3FSsWENf9AYbdQej5bW1E4znnHF3JkSjUFqqFfwRhmM8R+pJ+YROa7p9HGUxK5fORf
	QnPr6+RNoD7OPY+C9GukkttAZ7Ajm3vfZnDwSiGrebe7NGxU0EF5mFvAOd5qm6R07bTWv
X-Gm-Gg: ASbGncuauH6vGYc5k+U1oNT+crpeBKYUrY9FrybTg2X+RMC0kdYN64F1Zd72COD5rSq
	SoVU4VSKbjOnW3b7CHFbMYSaLgNoRAJ2hpueUp8BwZreuF8CEf14wc0eNP6rlW0+R/meVxN3cg8
	L4mKbvLz6EXIK4NLTIfr/tnATqsAlF+wXBjDu99Mdd3sSkbO7W+KAsw2DYmRNG5G3sey2JXt7+l
	LRtMH27GAy6M4dGJALGFu+h/xPu/qYgtHVIRWJsyq2lJPovfIc3HbEPeEN/kNt57ySKCCV628Cg
	UajK04eROYXdwByzGAPCFrnttB0xZozHCm8PKMU14pJT19vzRw/uwg0Cm/bNaVcFPcasJr3o5Rf
	7mFxKGI6QkLyxX23RKWYs5rvqKAvtg27I8hwGcMyynbouUfPGGatk
X-Received: by 2002:a05:6214:1251:b0:794:309a:870e with SMTP id 6a1803df08f44-79913ac45f3mr87943336d6.27.1758383213092;
        Sat, 20 Sep 2025 08:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11NkG2032TqJYvincR5awC9HUiRYgdpWgMYOGfHLJnwudA7QnMgQPw+ExDR1SJxBwoGOrJA==
X-Received: by 2002:a05:6214:1251:b0:794:309a:870e with SMTP id 6a1803df08f44-79913ac45f3mr87943036d6.27.1758383212488;
        Sat, 20 Sep 2025 08:46:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5793b1a828esm1637626e87.115.2025.09.20.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:46:51 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:46:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: r0q: add touchscreen support
Message-ID: <qdfm5e2uaqplzu3y4gajjhhe6khruxyelwuqn425jvcfrrxlb2@bqrkmzofte4r>
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-3-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250920014637.38175-3-ghatto404@gmail.com>
X-Authority-Analysis: v=2.4 cv=ZcAdNtVA c=1 sm=1 tr=0 ts=68cecc6e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=BGGuTFjUeKT21jY7AO8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: roe9YHxeQ95dBpuEoUF9C3wPL145XJZo
X-Proofpoint-GUID: roe9YHxeQ95dBpuEoUF9C3wPL145XJZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMSBTYWx0ZWRfX+uYtiVvnY85h
 h+XCSoVS1Objjpw/iyqQ3JVapRCHYSGx7yXNSxUCh497YHNqWGenlc2b9kKoIPKbQPy3djqNEIg
 OUCjKE1J9W8k81QkfYMzzL0SQU3u4YK5W2c7LMvdue24SgjWwBALd76XCn24xTYsMrC6233Uzf+
 RsK9P1DAB74TJRztQfeICdZ/Y6r7+6lLfndXhCLtKUZmFVQuTauuuomDOGADziSg9OYAtPjKa03
 zcSCdpFgYR6yksghxYXAmG4cxdW7Qq2n+ZCGm2wAR6/sUAP67PR+kaX9WvBFsQAhvOpJG/PI5VI
 zJHhk2JNcpdCNXzbWtoN5K+s3hOiWDs7o+cmzO79PaSSZ6+ViDrQAGI2p5/6ghnTTTeqL2cVRTp
 6KAQT+Tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200031

On Sat, Sep 20, 2025 at 01:46:34AM +0000, Eric Gonçalves wrote:
> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
> depends on "Input: add support for the STM FTS2BA61Y touchscreen".
> 
> The device has an issue where SPI 8 (the bus which the touchscreen is
> connected to) is not working properly right now, so
> spi-gpio is used instead.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> index 70e953824996..7bf56564dfc6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> @@ -55,6 +55,45 @@ splash-region@b8000000 {
>  		};
>  	};
>  

Please add a comment that you have to use spi-gpio and ideally a brief
description of the issue.

With that fixed:


> +	spi_gpio: spi-gpio@0 {
> +		compatible = "spi-gpio";
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&spi_clk_tsp_active &spi_mosi_tsp_active &spi_miso_tsp_active>;
> +		pinctrl-1 = <&spi_clk_tsp_sleep &spi_mosi_tsp_sleep &spi_miso_tsp_sleep>;
> +
> +		status = "okay";

status isn't necessary for new devices. It's a default value.

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sck-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;
> +		mosi-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
> +		miso-gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
> +		cs-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> +
> +		num-chipselects = <1>;
> +
> +		spi-max-frequency = <5000000>;
> +
> +		touchscreen@0 {
> +			compatible = "st,fts2ba61y";
> +			reg = <0>;
> +			spi-max-frequency = <5000000>;
> +
> +			vdd-supply = <&vreg_l8c_1p8>;
> +			avdd-supply = <&vreg_l11c_3p0>;
> +
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <46 IRQ_TYPE_LEVEL_LOW>;
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&tsp_int_active>;
> +			pinctrl-1 = <&tsp_int_sleep>;
> +
> +			status = "okay";
> +		};
> +	};
> +
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -132,6 +171,18 @@ vreg_l1c_1p8: ldo1 {
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
> +
> +		vreg_l8c_1p8: ldo8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_3p0: ldo11 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
>  	};
>  };
>  
> @@ -156,6 +207,122 @@ &pon_resin {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
> +
> +	spi_clk_tsp_active: spi_clk_tsp_active {
> +		mux {
> +			pins = "gpio30";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio30";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};
> +	};
> +
> +	spi_clk_tsp_sleep: spi_clk_tsp_sleep {
> +		mux {
> +			pins = "gpio30";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio30";
> +			drive-strength = <6>;
> +			input-enable;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	spi_cs_tsp_active: spi_cs_tsp_active {
> +		mux {
> +			pins = "gpio31";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio31";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};
> +	};
> +
> +	spi_cs_tsp_sleep: spi_cs_tsp_sleep {
> +		mux {
> +			pins = "gpio31";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio31";
> +			drive-strength = <6>;
> +			input-enable;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	spi_miso_tsp_active: spi_miso_tsp_active {
> +		mux {
> +			pins = "gpio28";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio28";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};
> +	};
> +
> +	spi_miso_tsp_sleep: spi_miso_tsp_sleep {
> +		mux {
> +			pins = "gpio28";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio28";
> +			drive-strength = <6>;
> +			input-enable;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	spi_mosi_tsp_active: spi_mosi_tsp_active {
> +		mux {
> +			pins = "gpio29";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio29";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};
> +	};
> +
> +	spi_mosi_tsp_sleep: spi_mosi_tsp_sleep {
> +		mux {
> +			pins = "gpio29";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio29";
> +			drive-strength = <6>;
> +			input-enable;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	tsp_int_active: tsp_int_active {
> +		pins = "gpio46";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		input-enable;
> +		bias-disable;
> +	};
> +
> +	tsp_int_sleep: tsp_int_sleep_state {
> +		pins = "gpio46";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		input-enable;
> +		bias-disable;
> +	};
>  };
>  
>  &usb_1 {
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

