Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E200D12C03B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2019 04:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfL2DOU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 22:14:20 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37513 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfL2DOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 22:14:19 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so16696272pfn.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2019 19:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wEeDhGD9qE9h8SuRwaZIe778VYxrlh346WtNbjw3o7A=;
        b=Sz58O9O3SoPFrI0m7TZzPfCRrFbgwtxnWiGZUQsm/CZShNJZp6hTSgkLqGqaVN3xgS
         w3tBxNoFyC45eJIAYWfbcD2L6ak6bsk4irQUlRCxYimBY8bZLXOknH1mZzQBTe+BROWd
         FzD0BlmpOerV2U0OjKq4FOVEuXCQVDOkmIrm5FaLfRsNXJH/kkuGdxMDmHMEaw+bL65M
         As3plY4XmTjYCoRKPAQKOJpQgb3UBgfQ5eCFfFnJyZxYc/UhxznLXJNpiHpRpPHxTuHh
         +/I5pxb3lkXvVhOs890TiE2C2DSPsYTYP3xljeb+BUvnWYecPftzmPMnenFfA0zMOEaZ
         ImZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wEeDhGD9qE9h8SuRwaZIe778VYxrlh346WtNbjw3o7A=;
        b=gPI4pV2WQ1sr9MjF+gYK4EtOaR6l7MwWQ2erX1oF/wI4+bm+VLpvnPx4r5bnjv6m2H
         Zuq4DyIcn8CjYcC31pH5pKMznViPSa0iLbVsCJWC/G4vo4x6MnwY9Z1sygVIevspo/j2
         0jWT+SfxtzFQ0mwXSlAieYTIHb5DwBiNZiD5GdmviiROKAKELNSp/XB461ga711B+sv6
         RVBFYh+Iu9FIJhJm+1784Lx4sWaYQ0TL02jENiMhYXa1yCPPGavmhS/zm20r474jRdKD
         XWFJK+KkwxDZMLmhsb8nhvN9yVEu7f4nlE8U3qPherzOuclZQAhAE8tRsE7u13b7eIs3
         YPUA==
X-Gm-Message-State: APjAAAUGVqcoklwmW+YuTd40F2Jh4uqjOBmYIkZxfArkexzy6Rljzq/n
        PFooFGaSAVB30ps412HnIHI8SW6sZbU=
X-Google-Smtp-Source: APXvYqyrN5Vts6qPQ1tr8xyRCTf/z7TJ6Nu77KyEYF2HVSsX4g9swQo843iIk+bkqCPSyLGa+Ii0wA==
X-Received: by 2002:a63:2808:: with SMTP id o8mr62765812pgo.39.1577589258899;
        Sat, 28 Dec 2019 19:14:18 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 18sm38826148pfj.3.2019.12.28.19.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 19:14:18 -0800 (PST)
Date:   Sat, 28 Dec 2019 19:14:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20191229031416.GK3755841@builder>
References: <1577181575-25788-1-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577181575-25788-1-git-send-email-pillair@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Dec 01:59 PST 2019, Rakesh Pillai wrote:

> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This change is dependent on the below set of changes
> arm64: dts: sc7180: Add qupv3_0 and qupv3_1 (https://lore.kernel.org/patchwork/patch/1150367/)

It would be clearer if you linked to the series instead, but it doesn't
matter at this point, this is merged already.

What doesn't seem to be merged is the addition of the
qcom,msa_fixed_perm property, so I presume I need to hold off on merging
this?

> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f..b2ca143f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -248,6 +248,11 @@
>  	status = "okay";
>  };
>  
> +&wifi {
> +	status = "okay";
> +	qcom,msa_fixed_perm;

As remarked by Rob, properties should be using - instead of _.

> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qup_i2c2_default {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..7efb97f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -42,6 +42,12 @@
>  			compatible = "qcom,cmd-db";
>  			no-map;
>  		};
> +
> +		wlan_fw_mem: memory@93900000 {
> +			compatible = "removed-dma-pool";
> +			no-map;
> +			reg = <0 0x93900000 0 0x200000>;
> +		};
>  	};
>  
>  	cpus {
> @@ -1119,6 +1125,28 @@
>  				#clock-cells = <1>;
>  			};
>  		};
> +
> +		wifi: wifi@18800000 {
> +			compatible = "qcom,wcn3990-wifi";
> +			reg = <0 0x18800000 0 0x800000>;
> +			reg-names = "membase";
> +			iommus = <&apps_smmu 0xC0 0x1>;

Lowercase 'c' please.

Regards,
Bjorn

> +			interrupts =
> +				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
> +				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
> +				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
> +				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
> +				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
> +				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
> +				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
> +				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
> +				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
> +				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
> +				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
> +				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
> +			memory-region = <&wlan_fw_mem>;
> +			status = "disabled";
> +		};
>  	};
>  
>  	timer {
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
