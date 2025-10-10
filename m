Return-Path: <linux-arm-msm+bounces-76765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 26836BCBFA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 09:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 181B74F1A17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 07:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C8627602A;
	Fri, 10 Oct 2025 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtDPJxE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434B275860
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082638; cv=none; b=mlT43+bO4qx9vQgXgr7uPlVBF3BB4DxGFARhnuGHyWB5HNKvnw5VkwBD+gysQW5oefAbb9gbljR3JOI5AHDLjb+GM5ZSs4WQJfkhNfwhst63Dimktfck5crz2vWiion//8vPDMBj4KhNFg2waKZdqh26+3gJzl8elCx/3T2cOiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082638; c=relaxed/simple;
	bh=KkNMjL8I5fdybdUa1NjkYPfijA6UxDkbR3tLV/jCMZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k316Uufu2I04CQf1rFn3OBlKo9FBXieMbHDc9mmAi9ozaWZd9SJHWZBYbbisZk/Tcjk8GxqdatCMoZJs5dgZeEm3T25PGrxPxhOMpEVGdo+gQSbXdRPfH+4afJdzlDYdyIOoZJkWapYNrRDFn39b1b3uqQmDGxuaM1uTlv+7lRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YtDPJxE9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e52279279so11973305e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760082635; x=1760687435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WijTXTd4CTE1aZK8+Efy77AvQqAMXLDdM08ln7br76Y=;
        b=YtDPJxE9w8Zbb9xUo2KupcUHBY2UTvKgECLsZSA9tmz8dlm0Kx78euUnqt92FVxIE2
         G11vKMZQ1+IzuBQ/DUdtwZW+inmi4ZqMj7q3VbJcT89sNFYe0GZJYTCrOHhhNmm15dvr
         N9OQiALIfiOBIqv/bZexK6ZpqSly7ef5hOjOoJ2UiHP5gsA5CgufN7sffUhUhM7rNzcF
         JC8hJkh7+7t/ZG4wngBr14aHepmi+MLk9wAAC/5XK90DUrVJFM2VgLgIRQNcdXQT7xyB
         EorFIpnVuyv8MmE33s6o/qehOrEUu/fxaJeHqNT6vbE+W3W/+ONigZl4ukR54OqidlfR
         UGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760082635; x=1760687435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WijTXTd4CTE1aZK8+Efy77AvQqAMXLDdM08ln7br76Y=;
        b=XcdNXwEuyYzhxCbSnjMNkHmL7jztowoAc4kZiqD+CDDrXLyaYghHYeGbWaReEn13+i
         XY6vvhdwA21DSBkl4i5cgta7T2WV0fzyoA332+eNNFwtmFOWpOylbrVO/OAjiBugWU5Z
         wvHq3TNb20pOvRde87/AMvS82YLyTSrh0tZs/e2GzEtDeMRJT7G7Kruh57VOJ1sXjgpm
         V9sko0HCCAAHAKBChY3KaWekQSGJJfMOQicxlgQjhk1Xo1q6VamHQgzAR0VqLmEKBUB1
         xRwnU2dw0Ir0pZTvNaJlZFW1cHxLi5p9KY7cU39XOhcwj7p8uEKNlqNB8bXac0ptt9Uf
         hPLg==
X-Forwarded-Encrypted: i=1; AJvYcCW13kgulfEmtDAS0ofoxEwKZcOKMBe1EyAzwc0Rd3/rwgwcadnh4OgZmydBrkHPDwgGVjX6v9MCBm4fvUFI@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqS40tTGIu2sb33+879sO+qk/C/rE0cSqYJwPP1n+uuqnwlro
	DaLTV8yspktgb8qKPoOYj5rwhmeLG+mu3TPXLRWsh1GADk325rSg2dkHHVi0ihxqZC4=
X-Gm-Gg: ASbGncsG+QvOyNcL5oGB+u//cFCDWnZTlFsNqjDjzs8MFEPe+EQxKMqh/JXQof8IuCy
	DBJmZ1d46VOqCTewoCKvNVdFPtV2Oh2v1cdTvSscNtUzmrhxG6qCSGpSIf8cvxVnHRvi5MD0c5n
	EX/9I4mve8VIuRGUgQwpZz5Kth6FaGE7/WjeWeHuy6gUzCc+yo3E5aUqzXes0EkA0CbuLFC4Yve
	Xx5l13qCCD1QHXwrRgu5U99FIGUW1yyDYiuZnHNWsPtgeD5Czq4qEon8+AvMIfcP+6HfqIBjHau
	jir/AxWnQWygYhOq0DTl5vmwA+ss3l9hfDSFmS3u1eAtOemtkZZ71qP3VcVO/Agt+IYQvODd5Ho
	TsQ1ivfzdNjuRjQQfKPM7KE8WuwRGvpLiwTGwh1FY5cqKMvNs1Ksq
X-Google-Smtp-Source: AGHT+IFk1hh63uQe7aB2By45OKK1hqXKawuG9jRmJUvZ+AvXgNz3fClrX5KDO3YUiqe4ZY+f2eE9QA==
X-Received: by 2002:a05:6000:4285:b0:3eb:5ff:cb2e with SMTP id ffacd0b85a97d-4266e7dfdd4mr6371755f8f.29.1760082634843;
        Fri, 10 Oct 2025 00:50:34 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d404sm2919503f8f.3.2025.10.10.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:50:32 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:50:30 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] arm64: dts: qcom: Introduce Glymur base dtsi and
 CRD dts
Message-ID: <uqbsxmx5kmbykfjn572nyihzp25e244hijniln4j4745cxgp56@ex7ji7na2icx>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-3-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:11, Pankaj Patil wrote:
> Introduce initial device tree support for Glymur - Qualcomm's
> next-generation compute SoC and it's associated Compute Reference
> Device (CRD) platform.
> 
> The dt describes CPUs, CPU map, GCC and RPMHCC clock controllers,
> geni UART, interrupt controller, TLMM, reserved memory,
> interconnects, SMMU, firmware scm, watchdog, apps rsc, RPMHPD,
> SRAM, PSCI and pmu nodes.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |    1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts |   25 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 1320 +++++++++++++++++++++++++++++++
>  3 files changed, 1346 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26550f75bce65826f234bc24110356..15f31a7d3ac4a60224c43cfa52e9cc17dc28c49f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1714ec8492961b211ec761f16b39245007533b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Glymur CRD";
> +	compatible = "qcom,glymur-crd", "qcom,glymur";
> +
> +	aliases {
> +		serial0 = &uart21;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
> +};
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1c5a0cb483670e9f8044e250950693b4a015479
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -0,0 +1,1320 @@

[...]

> +
> +		aggre1_noc: interconnect@16e0000 {
> +			compatible = "qcom,glymur-aggre1-noc";
> +			reg = <0x0 0x016e0000 0x0 0x14400>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		aggre2_noc: interconnect@1720000 {
> +			compatible = "qcom,glymur-aggre2-noc";
> +			reg = <0x0 0x01720000 0x0 0x14400>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +			clocks = <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
> +		};
> +
> +		aggre3_noc: interconnect@1700000 {
> +			compatible = "qcom,glymur-aggre3-noc";
> +			reg = <0x0 0x01700000 0x0 0x1d400>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};

Nitpick: the sorting needs to be by address based, not label based.

So aggre3_noc needs to go before aggre2_noc.


