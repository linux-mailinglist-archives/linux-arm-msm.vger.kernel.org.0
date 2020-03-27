Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B731960E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 23:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgC0WMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 18:12:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36865 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727639AbgC0WMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 18:12:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id h72so5161422pfe.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ylg+I2PJ+Ex0HEM0zNvZJ49nvDnayE5IfhwAN+kLBf0=;
        b=rlD1LoW0JS0gLrGQfYHwEyNO+xNbts4qzTjK5wKo2jcHaeXVrg0Wv5WaGRfbwPiPt/
         YOlyXApfnTKoKBz/XVHgeZXl/W6PdhbVYTLfFxYFnvPi2LjXWEjD0UK1hcxEFgHo61fp
         NcJudbzAODjLSXd3WYXUrQICnOurItCRG9qRlb6pECT84Su1k/FE9TwH31kYWCaLgGO4
         J0/ui/Mjbm96P+CVk0hsknsAmQ21n06lurKH6TWYnkB1jdSKQcKix0drPad5GfjEypOP
         R+Zx/H7g+xvUl7RNq+LDNci7kGTv/mm7Q+Xq/bDz8VuisHVzxkd0hLyaPxnPJBJ0F6yK
         CMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ylg+I2PJ+Ex0HEM0zNvZJ49nvDnayE5IfhwAN+kLBf0=;
        b=HWlI3wzKUv9Vk16iUkRsJ80EHEw4q3zZ0us+i+lDcRmzASuZddfhZTZQmeoQA3MFvo
         lDaicloqEp89FzwYnsAX8X4WF2TUblxb/ZIhx97AjCHXITZp2LcgH1u0DErj67y1C1DS
         /osnmZ24KXtqMRaugrtaWSxVGmkRs80FwnosBrwVoLHmlXD0kx6hprbaDLVB4wjnUyN6
         EbikYpIHTlSnikLD/lHfPqG1U8NsRzm3YquFxCvMWc07i9LUU7BBm1FT2dMZ//KblgLi
         wUik2zui3fSZBmqf8jYJmTezzFNtYybyWgVnc8TBrXifj0V5n0fOU5q1x5msLlTGgcS6
         tVag==
X-Gm-Message-State: ANhLgQ1JAE/jADcLKJirwdIFa99hkPICoai6D7ZswbM2VWvu3OxUMfvu
        dtJPsziTVCwd5Bv2Uiy+HWUe6pDXB5s=
X-Google-Smtp-Source: ADFU+vsGI0jjUfPCPbMuKRo/fZQBMJtcKGDJz33Y8NT3fNNWkv1XQLOUbvWY8LF2/Z50Z7G43N96TQ==
X-Received: by 2002:a63:1158:: with SMTP id 24mr1539635pgr.88.1585347136219;
        Fri, 27 Mar 2020 15:12:16 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y131sm4847614pfg.25.2020.03.27.15.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:12:15 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:12:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v3 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Message-ID: <20200327221213.GD5063@builder>
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
 <20200127212319.1544222-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127212319.1544222-3-robert.marko@sartura.hr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 27 Jan 13:23 PST 2020, Robert Marko wrote:

> From: John Crispin <john@phrozen.org>
> 
> Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Tested-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>

Robert, I'm missing your Signed-off-by here (and I would like Kishon to
take the PHY before merging this).

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 20 +++++
>  arch/arm/boot/dts/qcom-ipq4019.dtsi           | 74 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> index 418f9a022336..2ee5f05d5a43 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> @@ -109,5 +109,25 @@
>  		wifi@a800000 {
>  			status = "ok";
>  		};
> +
> +		usb3_ss_phy: ssphy@9a000 {
> +			status = "ok";
> +		};
> +
> +		usb3_hs_phy: hsphy@a6000 {
> +			status = "ok";
> +		};
> +
> +		usb3: usb3@8af8800 {
> +			status = "ok";
> +		};
> +
> +		usb2_hs_phy: hsphy@a8000 {
> +			status = "ok";
> +		};
> +
> +		usb2: usb2@60f8800 {
> +			status = "ok";
> +		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index b6e5203a210b..18e9c639514c 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -564,5 +564,79 @@
>  					  "legacy";
>  			status = "disabled";
>  		};
> +
> +		usb3_ss_phy: ssphy@9a000 {
> +			compatible = "qcom,usb-ss-ipq4019-phy";
> +			#phy-cells = <0>;
> +			reg = <0x9a000 0x800>;
> +			reg-names = "phy_base";
> +			resets = <&gcc USB3_UNIPHY_PHY_ARES>;
> +			reset-names = "por_rst";
> +			status = "disabled";
> +		};
> +
> +		usb3_hs_phy: hsphy@a6000 {
> +			compatible = "qcom,usb-hs-ipq4019-phy";
> +			#phy-cells = <0>;
> +			reg = <0xa6000 0x40>;
> +			reg-names = "phy_base";
> +			resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
> +			reset-names = "por_rst", "srif_rst";
> +			status = "disabled";
> +		};
> +
> +		usb3@8af8800 {
> +			compatible = "qcom,dwc3";
> +			reg = <0x8af8800 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&gcc GCC_USB3_MASTER_CLK>,
> +				 <&gcc GCC_USB3_SLEEP_CLK>,
> +				 <&gcc GCC_USB3_MOCK_UTMI_CLK>;
> +			clock-names = "master", "sleep", "mock_utmi";
> +			ranges;
> +			status = "disabled";
> +
> +			dwc3@8a00000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x8a00000 0xf8000>;
> +				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				dr_mode = "host";
> +			};
> +		};
> +
> +		usb2_hs_phy: hsphy@a8000 {
> +			compatible = "qcom,usb-hs-ipq4019-phy";
> +			#phy-cells = <0>;
> +			reg = <0xa8000 0x40>;
> +			reg-names = "phy_base";
> +			resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
> +			reset-names = "por_rst", "srif_rst";
> +			status = "disabled";
> +		};
> +
> +		usb2@60f8800 {
> +			compatible = "qcom,dwc3";
> +			reg = <0x60f8800 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&gcc GCC_USB2_MASTER_CLK>,
> +				 <&gcc GCC_USB2_SLEEP_CLK>,
> +				 <&gcc GCC_USB2_MOCK_UTMI_CLK>;
> +			clock-names = "master", "sleep", "mock_utmi";
> +			ranges;
> +			status = "disabled";
> +
> +			dwc3@6000000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x6000000 0xf8000>;
> +				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_hs_phy>;
> +				phy-names = "usb2-phy";
> +				dr_mode = "host";
> +			};
> +		};
>  	};
>  };
> -- 
> 2.24.1
> 
