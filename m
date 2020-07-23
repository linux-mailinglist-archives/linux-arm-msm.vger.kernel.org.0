Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6970722B434
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 19:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgGWRK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 13:10:57 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38612 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgGWRK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 13:10:56 -0400
Received: by mail-io1-f68.google.com with SMTP id l1so7000520ioh.5;
        Thu, 23 Jul 2020 10:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CFQA7x0bDHTcOu8RlJmkDybvEkhTzOMXAr85IhgE6JY=;
        b=WcyjkMmRLoc1Fc3HxTC0qtLs//P67zrSfKIljeOmfkDdULPiM8kr+dXCXStFjijpwx
         w5pyh6B5YRY/DPA/W+IsiUYzinH/zBG6wivSDCArXboswgz41WNmsMhiRtQ/yPA2+q/S
         OvMkQTS0kimVXEirxhVOoUWztm67/57/QMnMl6XGAWZQGMZ24XaCTdnKzluW+vn+QW3o
         rEy2FXHgWZWRJUv5RZ9IJE2sXj6XtWZcGAXN4+OXuGIB+7MmCyx/PnXevLgWilJuze0E
         lWz3MNDWfaoNHGEPRNTKN/bP4mJNxxibQvG8ZrebNeLLw9FfDWSsifqmpsVoKKEuVD/8
         F3gA==
X-Gm-Message-State: AOAM533NfvN+KAsx0pzdt1w9VmwLqNk5J9yl6C+Oo0UJcSZaUI3j0LxV
        qEJ+knRHI8Rd8gjkMqcTlw==
X-Google-Smtp-Source: ABdhPJyxpyI1N+AvgADJ1IcQCxekVn4/AHZTGDaGy92skQR/1/y1qtBhzZcAxyirTjh4HWPn7k/e1g==
X-Received: by 2002:a02:2401:: with SMTP id f1mr5923789jaa.66.1595524255623;
        Thu, 23 Jul 2020 10:10:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l17sm1708226ilm.70.2020.07.23.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 10:10:55 -0700 (PDT)
Received: (nullmailer pid 546734 invoked by uid 1000);
        Thu, 23 Jul 2020 17:10:53 -0000
Date:   Thu, 23 Jul 2020 11:10:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200723171053.GA544557@bogus>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-8-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595413915-17867-8-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 04:01:50PM +0530, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 55 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 32c2cdb..c21392e 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>  
>  Required properties:
>  
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
> +- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> +			  "qcom,lpass-cpu-sc7180"

qcom,sc7180-lpass-cpu

>  - clocks		: Must contain an entry for each entry in clock-names.
>  - clock-names		: A list which must include the following entries:
>  				* "ahbix-clk"
> @@ -18,6 +19,13 @@ Required properties:
>  				* "mi2s-bit-clk3"
>  				* "pcnoc-mport-clk"
>  				* "pcnoc-sway-clk"
> +			: required clocks for "qcom,lpass-cpu-sc7180"
> +				* "audio-core"
> +				* "mclk0"
> +				* "mi2s-bit-clk0"
> +				* "mi2s-bit-clk1"
> +				* "pcnoc-sway-clk"
> +				* "pcnoc-mport-clk"
>  
>  - interrupts		: Must contain an entry for each entry in
>  			  interrupt-names.
> @@ -53,7 +61,8 @@ Required properties for each DAI (represented by a subnode):
>  Note that adding a subnode changes the default to "no lines configured",
>  so both playback and capture lines should be configured when a subnode is added.
>  
> -Example:
> +Examples:
> +1)
>  
>  lpass@28100000 {
>  	compatible = "qcom,lpass-cpu";
> @@ -77,3 +86,45 @@ lpass@28100000 {
>  		qcom,playback-sd-lines = <0 1>;
>  	};
>  };
> +
> +2)
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +
> +lpass_cpu: lpass {
> +	compatible = "qcom,lpass-cpu-sc7180";
> +
> +	reg = <0 0x62F00000 0 0x29000>;
> +
> +	iommus = <&apps_smmu 0x1020 0>;
> +
> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> +	clock-names = "pcnoc-sway-clk", "audio-core",
> +			"mclk0", "pcnoc-mport-clk",
> +			"mi2s-bit-clk0", "mi2s-bit-clk1";
> +	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names = "lpass-irq-lpaif";
> +
> +
> +	#sound-dai-cells = <1>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	mi2s-primary@0 {
> +		reg = <MI2S_PRIMARY>;
> +		qcom,playback-sd-lines = <1>;
> +		qcom,capture-sd-lines = <0>;
> +	};
> +
> +	mi2s-secondary@1 {
> +		reg = <MI2S_SECONDARY>;
> +		qcom,playback-sd-lines = <0>;
> +	};
> +};
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
