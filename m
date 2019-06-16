Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 837BF47674
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 20:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfFPSkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 14:40:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37245 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfFPSkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 14:40:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id bh12so3143465plb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=btKkF8Mqx8IA5i++C7IxPWIDPO0GeHSWef12pSEOb0Q=;
        b=S1pC/wj1+zqmYBm3MeXf98LuztUeNJukN2stfm0fz+lPUcAFyoMrCqM8L9Cz1icXyM
         wwu2DWcJJ0Jns1MCuFv8F+OBnvecCbkIBnl1d3biaMPSDT1141BqEnKC+62bBAxyDJhj
         IvmsgH2VWZ7XxqdDGlu3pPex0srTtBbO8G+jr0CsNB+PCNS1xTFqIeE7VkkOyJsmKa6i
         7r3zMb883RzTj2rBPfF+A/0CdpWixtmF9t9RRx/bADUBh2HSmueAq28QzWaPXlS24QRy
         LuYAcpIaJ1xAqqNWNJE9QS8tEUULdnRGZavqBv+pnlo/W90Pr09q50r0jb2hRGkDSIxE
         4HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=btKkF8Mqx8IA5i++C7IxPWIDPO0GeHSWef12pSEOb0Q=;
        b=Dnn4kOFFqZC2iFTi0Zt8zXJJI5hGcxxRV9RxcuiaE2FF8tqy3mcJyYaDhUE4SxkIyI
         wkUxvYNfZu5phIGEVh1p5S2qP8mBWMlTXYf2BXphyTmKllV0DHcDjMHl1fzfpetn+Mr8
         M8vdWVtWaZEEXo7H0wqhe2AessivsT2S2NmJVu+wQcKTJRzOqSPgXQ2JvWcka8BLhJmT
         kPanX6UocR1KgvZrWlzskiyoe3krD9WmF3EDSL5oVwC+P8kimi5MaYShwIhoU+Dd7E+t
         9PNgGxa9EqVjqmGKUTdtAV/1VvYDiBAIy5Ip4moMx4qmGVE31ob/j+xwT1br1oB26REZ
         HUwQ==
X-Gm-Message-State: APjAAAVFvdPB03sl9fetJoCMuc/K6ttyAYkSY1kCNw8oA58Gz13K+w7D
        d3uRF/UYd9ZUtwx2lZf+fJlyWA==
X-Google-Smtp-Source: APXvYqzOGRcA+Tq/jrany4OPqM6WGc3SeKBY+5M8G9CwOBF5iVJP761Y0EuPoqMABGSP+jkZQAiohQ==
X-Received: by 2002:a17:902:205:: with SMTP id 5mr97285945plc.165.1560710405032;
        Sun, 16 Jun 2019 11:40:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e6sm8544314pfi.42.2019.06.16.11.40.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:40:04 -0700 (PDT)
Date:   Sun, 16 Jun 2019 11:40:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux@armlinux.org.uk,
        linus.walleij@linaro.org, frank.rowand@sony.com,
        miquel.raynal@bootlin.com, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974-hammerhead: add touchscreen
 support
Message-ID: <20190616184051.GC31088@tuxbook-pro>
References: <20190603010455.17060-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603010455.17060-1-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 02 Jun 18:04 PDT 2019, Brian Masney wrote:

> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add support for the Synaptics RMI4 touchscreen that is found on the
> Nexus 5.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Applied for 5.3

PS. Please use a --cover-letter when sending multiple patches.

Thanks,
Bjorn

> ---
> This is to be applied on top of the display patch series:
> https://lore.kernel.org/lkml/20190531094619.31704-1-masneyb@onstation.org/
> 
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index c92ea01e3918..06c33bd71620 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -280,6 +280,16 @@
>  			};
>  		};
>  
> +		i2c2_pins: i2c2 {
> +			mux {
> +				pins = "gpio6", "gpio7";
> +				function = "blsp_i2c2";
> +
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +		};
> +
>  		i2c3_pins: i2c3 {
>  			mux {
>  				pins = "gpio10", "gpio11";
> @@ -326,6 +336,25 @@
>  				bias-disable;
>  			};
>  		};
> +
> +		touch_pin: touch {
> +			int {
> +				pins = "gpio5";
> +				function = "gpio";
> +
> +				drive-strength = <2>;
> +				bias-disable;
> +				input-enable;
> +			};
> +
> +			reset {
> +				pins = "gpio8";
> +				function = "gpio";
> +
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +		};
>  	};
>  
>  	sdhci@f9824900 {
> @@ -468,6 +497,41 @@
>  		};
>  	};
>  
> +	i2c@f9924000 {
> +		status = "ok";
> +
> +		clock-frequency = <355000>;
> +		qcom,src-freq = <50000000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2c2_pins>;
> +
> +		synaptics@70 {
> +			compatible = "syna,rmi4-i2c";
> +			reg = <0x70>;
> +
> +			interrupts-extended = <&msmgpio 5 IRQ_TYPE_EDGE_FALLING>;
> +			vdd-supply = <&pm8941_l22>;
> +			vio-supply = <&pm8941_lvs3>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&touch_pin>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			rmi4-f01@1 {
> +				reg = <0x1>;
> +				syna,nosleep-mode = <1>;
> +			};
> +
> +			rmi4-f12@12 {
> +				reg = <0x12>;
> +				syna,sensor-type = <1>;
> +			};
> +		};
> +	};
> +
>  	i2c@f9925000 {
>  		status = "ok";
>  		pinctrl-names = "default";
> -- 
> 2.20.1
> 
