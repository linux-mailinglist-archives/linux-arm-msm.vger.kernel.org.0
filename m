Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18447103397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 06:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbfKTFPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 00:15:15 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39782 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfKTFPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 00:15:15 -0500
Received: by mail-pg1-f196.google.com with SMTP id b126so1360912pga.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 21:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vRpNrRdFknE1aZGCRl76Xx0MCyN5tdVLbPa1MRzOTso=;
        b=pqBtB9ZMn0EKob1gtm/O2MDtFJiIXiTQ3I/OgAal7JkZHXwF4iLumMcm8MtoTiQXCv
         jPQ3QRnpyQfGMD8W2s1fKGOQd8Dd9Xz/9z78CAkjMoqdGS/8z00kHTeOg6PQfR4jrV6x
         2GnP7yvVCU+BlrUvYH1P2QZupdrJi5SkCzo9Z0r5FYtiBH0cTM4MoyyvbUB3ozmR5WhB
         HfHCmnV6vLDchOqH7ZYVleRMrN8NXdN3LodOrJQu+EYKOZgjG0D4qRAsNfVd1QznyRxW
         XJd08nbBkmPZswj084PB2RL/xwqZO8243rVaX5riwI3h8jD3pe98FrPClkeHjV8BetO4
         DPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vRpNrRdFknE1aZGCRl76Xx0MCyN5tdVLbPa1MRzOTso=;
        b=NuuGG+xOA+I4AK+RQQdP/WIbyGTrfk1aA/YlDNemfZxknOqfeu4s3/CA2ZZ1UeicHP
         eq2rMnXSjPS0ADjsCVheTpYX5Fb9Q0h1UZcn7Sh1xwZkkyiHLox9WQxPvBTpUZJQR1rL
         FTqgtf6e/jS9LW/cV82afXS2KKOyYznRE3fAwhJtDpydjCvRZCi6P/zyAaqhsdyHYS7x
         W1NVFQBt+7dDiolH0OeKW44KCNX1ZwE3a23yesWKPiVREXlaqicSRDA6ZH+TfsKJ2LIn
         +HGBpc6DMPbzyLxrfkDJyqov5DRQwgLwR6FIrODrcfRFV1eR6ZeLjLz23QvL4ohGqGBI
         Unmw==
X-Gm-Message-State: APjAAAXmokgTrBieIriOesm+ZUS+E+AZ0GJ7tgJNE+FAGWFISsDLHkaP
        4pJ+lQWVuM0bcRuBEMaj3wzUEA==
X-Google-Smtp-Source: APXvYqyggG/vyLuBZoghSoeAXc9YLPFm0XcYXUHgWcCqigj+Q3Aa1AK85v+aQmTIZKzBJ/TPFozuCw==
X-Received: by 2002:a65:620d:: with SMTP id d13mr1110529pgv.64.1574226912321;
        Tue, 19 Nov 2019 21:15:12 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y123sm27091431pfg.64.2019.11.19.21.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 21:15:11 -0800 (PST)
Date:   Tue, 19 Nov 2019 21:15:09 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        amit.kucheria@linaro.org, sboyd@kernel.org, vireshk@kernel.org,
        ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: qcs404: Add CPR and populate
 OPP table
Message-ID: <20191120051509.GS18024@yoga>
References: <20191119154621.55341-1-niklas.cassel@linaro.org>
 <20191119154621.55341-4-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119154621.55341-4-niklas.cassel@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Nov 07:46 PST 2019, Niklas Cassel wrote:

> Add CPR and populate OPP table.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 132 +++++++++++++++++++++++++--
>  1 file changed, 124 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index d03782e7bc11..30b9c7f8f200 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -44,7 +44,8 @@
>  			#cooling-cells = <2>;
>  			clocks = <&apcs_glb>;
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&pms405_s3>;
> +			power-domains = <&cpr>;
> +			power-domain-names = "cpr";
>  		};
>  
>  		CPU1: cpu@101 {
> @@ -57,7 +58,8 @@
>  			#cooling-cells = <2>;
>  			clocks = <&apcs_glb>;
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&pms405_s3>;
> +			power-domains = <&cpr>;
> +			power-domain-names = "cpr";
>  		};
>  
>  		CPU2: cpu@102 {
> @@ -70,7 +72,8 @@
>  			#cooling-cells = <2>;
>  			clocks = <&apcs_glb>;
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&pms405_s3>;
> +			power-domains = <&cpr>;
> +			power-domain-names = "cpr";
>  		};
>  
>  		CPU3: cpu@103 {
> @@ -83,7 +86,8 @@
>  			#cooling-cells = <2>;
>  			clocks = <&apcs_glb>;
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&pms405_s3>;
> +			power-domains = <&cpr>;
> +			power-domain-names = "cpr";
>  		};
>  
>  		L2_0: l2-cache {
> @@ -107,20 +111,37 @@
>  	};
>  
>  	cpu_opp_table: cpu-opp-table {
> -		compatible = "operating-points-v2";
> +		compatible = "operating-points-v2-kryo-cpu";
>  		opp-shared;
>  
>  		opp-1094400000 {
>  			opp-hz = /bits/ 64 <1094400000>;
> -			opp-microvolt = <1224000 1224000 1224000>;
> +			required-opps = <&cpr_opp1>;
>  		};
>  		opp-1248000000 {
>  			opp-hz = /bits/ 64 <1248000000>;
> -			opp-microvolt = <1288000 1288000 1288000>;
> +			required-opps = <&cpr_opp2>;
>  		};
>  		opp-1401600000 {
>  			opp-hz = /bits/ 64 <1401600000>;
> -			opp-microvolt = <1384000 1384000 1384000>;
> +			required-opps = <&cpr_opp3>;
> +		};
> +	};
> +
> +	cpr_opp_table: cpr-opp-table {
> +		compatible = "operating-points-v2-qcom-level";
> +
> +		cpr_opp1: opp1 {
> +			opp-level = <1>;
> +			qcom,opp-fuse-level = <1>;
> +		};
> +		cpr_opp2: opp2 {
> +			opp-level = <2>;
> +			qcom,opp-fuse-level = <2>;
> +		};
> +		cpr_opp3: opp3 {
> +			opp-level = <3>;
> +			qcom,opp-fuse-level = <3>;
>  		};
>  	};
>  
> @@ -310,6 +331,62 @@
>  			tsens_caldata: caldata@d0 {
>  				reg = <0x1f8 0x14>;
>  			};
> +			cpr_efuse_speedbin: speedbin@13c {
> +				reg = <0x13c 0x4>;
> +				bits = <2 3>;
> +			};
> +			cpr_efuse_quot_offset1: qoffset1@231 {
> +				reg = <0x231 0x4>;
> +				bits = <4 7>;
> +			};
> +			cpr_efuse_quot_offset2: qoffset2@232 {
> +				reg = <0x232 0x4>;
> +				bits = <3 7>;
> +			};
> +			cpr_efuse_quot_offset3: qoffset3@233 {
> +				reg = <0x233 0x4>;
> +				bits = <2 7>;
> +			};
> +			cpr_efuse_init_voltage1: ivoltage1@229 {
> +				reg = <0x229 0x4>;
> +				bits = <4 6>;
> +			};
> +			cpr_efuse_init_voltage2: ivoltage2@22a {
> +				reg = <0x22a 0x4>;
> +				bits = <2 6>;
> +			};
> +			cpr_efuse_init_voltage3: ivoltage3@22b {
> +				reg = <0x22b 0x4>;
> +				bits = <0 6>;
> +			};
> +			cpr_efuse_quot1: quot1@22b {
> +				reg = <0x22b 0x4>;
> +				bits = <6 12>;
> +			};
> +			cpr_efuse_quot2: quot2@22d {
> +				reg = <0x22d 0x4>;
> +				bits = <2 12>;
> +			};
> +			cpr_efuse_quot3: quot3@230 {
> +				reg = <0x230 0x4>;
> +				bits = <0 12>;
> +			};
> +			cpr_efuse_ring1: ring1@228 {
> +				reg = <0x228 0x4>;
> +				bits = <0 3>;
> +			};
> +			cpr_efuse_ring2: ring2@228 {
> +				reg = <0x228 0x4>;
> +				bits = <4 3>;
> +			};
> +			cpr_efuse_ring3: ring3@229 {
> +				reg = <0x229 0x4>;
> +				bits = <0 3>;
> +			};
> +			cpr_efuse_revision: revision@218 {
> +				reg = <0x218 0x4>;
> +				bits = <3 3>;
> +			};
>  		};
>  
>  		rng: rng@e3000 {
> @@ -952,6 +1029,45 @@
>  			clocks = <&sleep_clk>;
>  		};
>  
> +		cpr: power-controller@b018000 {
> +			compatible = "qcom,qcs404-cpr", "qcom,cpr";
> +			reg = <0x0b018000 0x1000>;
> +			interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&xo_board>;
> +			clock-names = "ref";
> +			vdd-apc-supply = <&pms405_s3>;
> +			#power-domain-cells = <0>;
> +			operating-points-v2 = <&cpr_opp_table>;
> +			acc-syscon = <&tcsr>;
> +
> +			nvmem-cells = <&cpr_efuse_quot_offset1>,
> +				<&cpr_efuse_quot_offset2>,
> +				<&cpr_efuse_quot_offset3>,
> +				<&cpr_efuse_init_voltage1>,
> +				<&cpr_efuse_init_voltage2>,
> +				<&cpr_efuse_init_voltage3>,
> +				<&cpr_efuse_quot1>,
> +				<&cpr_efuse_quot2>,
> +				<&cpr_efuse_quot3>,
> +				<&cpr_efuse_ring1>,
> +				<&cpr_efuse_ring2>,
> +				<&cpr_efuse_ring3>,
> +				<&cpr_efuse_revision>;
> +			nvmem-cell-names = "cpr_quotient_offset1",
> +				"cpr_quotient_offset2",
> +				"cpr_quotient_offset3",
> +				"cpr_init_voltage1",
> +				"cpr_init_voltage2",
> +				"cpr_init_voltage3",
> +				"cpr_quotient1",
> +				"cpr_quotient2",
> +				"cpr_quotient3",
> +				"cpr_ring_osc1",
> +				"cpr_ring_osc2",
> +				"cpr_ring_osc3",
> +				"cpr_fuse_revision";
> +		};
> +
>  		timer@b120000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -- 
> 2.23.0
> 
