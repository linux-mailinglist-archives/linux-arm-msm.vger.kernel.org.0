Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A771D20E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 23:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgEMVYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 17:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728479AbgEMVYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 17:24:23 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87598C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 14:24:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a5so11638368pjh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 14:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0y63+BIcXWm/pFM2x/q/26SJS4EzIJSmel/WUkEPtnY=;
        b=XU0f9zhxPgE8+WH8E8zjjT74aGEIH/XPStcPVC48hdToQ+UzLnYsfVEbJdrgFi1NKQ
         x/g6hZkgv7fsTGddfUBOfZQtl3Ir/7/MpCLdJBIqdBOWcJidetkPfCFtdTar4UE7aSHV
         lZBlEOjur0bpYOLiA/fhd7YVWV1VbBzcM9S+I9D9vYJSLMbN1QYZBfq2h2YLtW7tyDMZ
         PAg2nY3lbG4PQ3wDuC+CEi2usw7AX9BiodyFTMP2fDLvlxKt43SlVxXCd1hD5XcxCbdt
         y8ebkeW2aYlX7/9Qrmki4tnMQFgTDl8hvQdxWlVf2GzUZeU2sE09HtU8fc1NPYPngRlU
         gOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0y63+BIcXWm/pFM2x/q/26SJS4EzIJSmel/WUkEPtnY=;
        b=eyW3cc8V79iuiiQA9cQ5akZEdZUx3NSju4UVuLEpp5eU/kbiTXjLBLL1hNJceLrB7E
         ELnZloq1ZQgQ2NDUfAdWlBLCvhVw0W0NXqbhcFp5plRYLn8Hm//Pi6Hlm7JQT+wBqxqC
         +emOiQn6HeMz8HWc/5big/bb/dyo7rC1YtldvSOBV+U+irCstTbvR99WiS00bhoKMmVs
         VON3fy2/+L6hyKejdBoYJllDRfR6WjoJU9BlIlLEZ/MZeluEVEDQZxrG2A0llhNZNm7i
         +hQ93RfEeicJQlOdAFLABaNtFklh35Snmbr7+d15Kg3zXvEUEZoAqb0Ut7f07/1oe9z8
         Zc9w==
X-Gm-Message-State: AGi0PubyE14nu1SmmSH0t37p9vc3HS7LlEeqjQPXcdmUU0c5AePWvzyk
        xRPwVQ5iVbnfDuYSPaKmFR4Csp83WeY=
X-Google-Smtp-Source: APiQypJekgHw6Z+eNv7ExobJX63Wsgkrw55YAq+hPJOkw3wibb9U1OSe1mBDNujcnVUKR79oN0HWqA==
X-Received: by 2002:a17:90a:7e4:: with SMTP id m91mr36033720pjm.155.1589405062812;
        Wed, 13 May 2020 14:24:22 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a1sm513522pgi.60.2020.05.13.14.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:24:22 -0700 (PDT)
Date:   Wed, 13 May 2020 14:22:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Disable coresight by default
Message-ID: <20200513212251.GA279327@builder.lan>
References: <20200513184735.30104-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513184735.30104-1-michael.srba@seznam.cz>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 13 May 11:47 PDT 2020, michael.srba@seznam.cz wrote:

> From: Michael Srba <michael.srba@seznam.cz>
> 
> On some msm8916 devices, attempts at initializing coresight cause the boot to
> fail. This was fixed by disabling the coresight-related nodes in the board dts
> files. However, a cleaner approach was chosen for fixing the same issue on
> msm8998: disabling coresight by default, and enabling it in board dts files
> where desired.
> 
> This patch implements the same solution for msm8916, removes now redundant 
> overwrites in board specific dts files and and enables coresight in db410c's
> board dts in order to keep the current behavior.
> 

Applied, with Jeff's r-b.

Thanks,
Bjorn

> Fixes: b1fcc5702a41 ("arm64: dts: qcom: msm8916: Add CTI options")
> Signed-off-by: Michael Srba <michael.srba@seznam.cz>
> 
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 21 +++++++++++
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 23 ------------
>  .../qcom/msm8916-samsung-a2015-common.dtsi    | 23 ------------
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         | 35 +++++++++++++++++++
>  4 files changed, 56 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 14982762088d..07c150b0ed54 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -519,6 +519,27 @@ mpps@a000 {
>  		wcnss@a21b000 {
>  			status = "okay";
>  		};
> +
> +		tpiu@820000 { status = "okay"; };
> +		funnel@821000 { status = "okay"; };
> +		replicator@824000 { status = "okay"; };
> +		etf@825000 { status = "okay"; };
> +		etr@826000 { status = "okay"; };
> +		funnel@841000 { status = "okay"; };
> +		debug@850000 { status = "okay"; };
> +		debug@852000 { status = "okay"; };
> +		debug@854000 { status = "okay"; };
> +		debug@856000 { status = "okay"; };
> +		etm@85c000 { status = "okay"; };
> +		etm@85d000 { status = "okay"; };
> +		etm@85e000 { status = "okay"; };
> +		etm@85f000 { status = "okay"; };
> +		cti@810000 { status = "okay"; };
> +		cti@811000 { status = "okay"; };
> +		cti@858000 { status = "okay"; };
> +		cti@859000 { status = "okay"; };
> +		cti@85a000 { status = "okay"; };
> +		cti@85b000 { status = "okay"; };
>  	};
>  
>  	usb2513 {
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> index d1ccb9472c8b..691eb1a87bc9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> @@ -82,29 +82,6 @@ phy {
>  		wcnss@a21b000 {
>  			status = "okay";
>  		};
> -
> -		/*
> -		 * Attempting to enable these devices causes a "synchronous
> -		 * external abort". Suspected cause is that the debug power
> -		 * domain is not enabled by default on this device.
> -		 * Disable these devices for now to avoid the crash.
> -		 *
> -		 * See: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/
> -		 */
> -		tpiu@820000 { status = "disabled"; };
> -		funnel@821000 { status = "disabled"; };
> -		replicator@824000 { status = "disabled"; };
> -		etf@825000 { status = "disabled"; };
> -		etr@826000 { status = "disabled"; };
> -		funnel@841000 { status = "disabled"; };
> -		debug@850000 { status = "disabled"; };
> -		debug@852000 { status = "disabled"; };
> -		debug@854000 { status = "disabled"; };
> -		debug@856000 { status = "disabled"; };
> -		etm@85c000 { status = "disabled"; };
> -		etm@85d000 { status = "disabled"; };
> -		etm@85e000 { status = "disabled"; };
> -		etm@85f000 { status = "disabled"; };
>  	};
>  
>  	// FIXME: Use extcon device provided by charger driver when available
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> index 43c5e0f882f1..af812f76e8be 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> @@ -75,29 +75,6 @@ phy {
>  		wcnss@a21b000 {
>  			status = "okay";
>  		};
> -
> -		/*
> -		 * Attempting to enable these devices causes a "synchronous
> -		 * external abort". Suspected cause is that the debug power
> -		 * domain is not enabled by default on this device.
> -		 * Disable these devices for now to avoid the crash.
> -		 *
> -		 * See: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/
> -		 */
> -		tpiu@820000 { status = "disabled"; };
> -		funnel@821000 { status = "disabled"; };
> -		replicator@824000 { status = "disabled"; };
> -		etf@825000 { status = "disabled"; };
> -		etr@826000 { status = "disabled"; };
> -		funnel@841000 { status = "disabled"; };
> -		debug@850000 { status = "disabled"; };
> -		debug@852000 { status = "disabled"; };
> -		debug@854000 { status = "disabled"; };
> -		debug@856000 { status = "disabled"; };
> -		etm@85c000 { status = "disabled"; };
> -		etm@85d000 { status = "disabled"; };
> -		etm@85e000 { status = "disabled"; };
> -		etm@85f000 { status = "disabled"; };
>  	};
>  
>  	gpio-keys {
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8b429954ea29..5cf117e247df 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1228,6 +1228,8 @@ tpiu@820000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> +			status = "disabled";
> +
>  			in-ports {
>  				port {
>  					tpiu_in: endpoint {
> @@ -1244,6 +1246,8 @@ funnel@821000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> +			status = "disabled";
> +
>  			in-ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -1283,6 +1287,8 @@ replicator@824000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> +			status = "disabled";
> +
>  			out-ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -1317,6 +1323,8 @@ etf@825000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> +			status = "disabled";
> +
>  			in-ports {
>  				port {
>  					etf_in: endpoint {
> @@ -1341,6 +1349,8 @@ etr@826000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> +			status = "disabled";
> +
>  			in-ports {
>  				port {
>  					etr_in: endpoint {
> @@ -1357,6 +1367,8 @@ funnel@841000 {	/* APSS funnel only 4 inputs are used */
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> +			status = "disabled";
> +
>  			in-ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -1402,6 +1414,7 @@ debug@850000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&CPU0>;
> +			status = "disabled";
>  		};
>  
>  		debug@852000 {
> @@ -1410,6 +1423,7 @@ debug@852000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&CPU1>;
> +			status = "disabled";
>  		};
>  
>  		debug@854000 {
> @@ -1418,6 +1432,7 @@ debug@854000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&CPU2>;
> +			status = "disabled";
>  		};
>  
>  		debug@856000 {
> @@ -1426,6 +1441,7 @@ debug@856000 {
>  			clocks = <&rpmcc RPM_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&CPU3>;
> +			status = "disabled";
>  		};
>  
>  		etm0: etm@85c000 {
> @@ -1438,6 +1454,8 @@ etm0: etm@85c000 {
>  
>  			cpu = <&CPU0>;
>  
> +			status = "disabled";
> +
>  			out-ports {
>  				port {
>  					etm0_out: endpoint {
> @@ -1457,6 +1475,8 @@ etm1: etm@85d000 {
>  
>  			cpu = <&CPU1>;
>  
> +			status = "disabled";
> +
>  			out-ports {
>  				port {
>  					etm1_out: endpoint {
> @@ -1476,6 +1496,8 @@ etm2: etm@85e000 {
>  
>  			cpu = <&CPU2>;
>  
> +			status = "disabled";
> +
>  			out-ports {
>  				port {
>  					etm2_out: endpoint {
> @@ -1495,6 +1517,8 @@ etm3: etm@85f000 {
>  
>  			cpu = <&CPU3>;
>  
> +			status = "disabled";
> +
>  			out-ports {
>  				port {
>  					etm3_out: endpoint {
> @@ -1512,6 +1536,8 @@ cti@810000 {
>  
>  			clocks = <&rpmcc RPM_QDSS_CLK>;
>  			clock-names = "apb_pclk";
> +
> +			status = "disabled";
>  		};
>  
>  		/* CTI 1 - TPIU connections */
> @@ -1521,6 +1547,8 @@ cti@811000 {
>  
>  			clocks = <&rpmcc RPM_QDSS_CLK>;
>  			clock-names = "apb_pclk";
> +
> +			status = "disabled";
>  		};
>  
>  		/* CTIs 2-11 - no information - not instantiated */
> @@ -1538,6 +1566,7 @@ cti@858000 {
>  			cpu = <&CPU0>;
>  			arm,cs-dev-assoc = <&etm0>;
>  
> +			status = "disabled";
>  		};
>  
>  		/* CTI - CPU-1 */
> @@ -1551,6 +1580,8 @@ cti@859000 {
>  
>  			cpu = <&CPU1>;
>  			arm,cs-dev-assoc = <&etm1>;
> +
> +			status = "disabled";
>  		};
>  
>  		/* CTI - CPU-2 */
> @@ -1564,6 +1595,8 @@ cti@85a000 {
>  
>  			cpu = <&CPU2>;
>  			arm,cs-dev-assoc = <&etm2>;
> +
> +			status = "disabled";
>  		};
>  
>  		/* CTI - CPU-3 */
> @@ -1577,6 +1610,8 @@ cti@85b000 {
>  
>  			cpu = <&CPU3>;
>  			arm,cs-dev-assoc = <&etm3>;
> +
> +			status = "disabled";
>  		};
>  
>  
> -- 
> 2.24.0
> 
