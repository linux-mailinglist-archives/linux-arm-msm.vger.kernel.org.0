Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317F54212D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 17:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235685AbhJDPlT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 11:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbhJDPlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 11:41:18 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CD9C061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 08:39:29 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id y16-20020a4ade10000000b002b5dd6f4c8dso5465947oot.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Us2MiqnVBXpIAHNmjS+4Uro6qLPvm37AM9FJM95DVqk=;
        b=UvTBpMnnuGZzjffPYb1u5v3vOYcVC2caWUQcqnkd1SLnhHYh9HoUpsXWXuHV6CtF5c
         qMZKrO/WVTD50NObgICfr6AIx2m7OqeFLWq38/Bojj2dfTst72YaiVDbAP4LRm84siko
         W0POz+WpjQ8TkFq/mdfHoftPovhR7ea0POI0/jkT0FchYIXofqPaFVabSVDjA5naW9fH
         LIoKCl5sVg/m3yswO6YL8mr13fQV3LxifZ6QaM3DnXbxNn69JDOXnrCy7PzY8roN46Hb
         pCVL3TwbByCMm2KZ0bT/eSw3E/gI0K15dpImi2Cc9n2eyL1p0LiiYc+iuhX5Zq+vGJ5j
         4IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Us2MiqnVBXpIAHNmjS+4Uro6qLPvm37AM9FJM95DVqk=;
        b=4I+lD8SfQ72UvTJU536Z8TFUWz1uky4sn21klobW5oPomKzU7yYpU6rtk31XxpVhmD
         wgTuUVxVDK5YHvhPGXwE35XoFC2S9wogkPYf4lp0RD+n/6KBtqj0ppo/A+oPoSZNBssg
         hH6d93ahxR4sY7rlBQJ8HctR1UQo7ZZq/yD1KCAtz8xRL3F0a86fKvy0t2n9zbh9bYTK
         l6CqYwUbuAVYK2N4IqVqFKPopakMmML/SzsyRPMoWVkJwsUlvswkK8irBSdMbmNoEL1+
         3RHMsNXE/cca/ejooKyAnuOPT0trEvCl9cQVNmjiC0+qtFqT6QsSV2eyzq8n13Swuw9h
         JXlA==
X-Gm-Message-State: AOAM531aecqHLchJO2T5yfPkWnd82prZMyR9esMDmFFREvPPYjeuYbxt
        yo2tSoQu0xwoRqcP1Gc6Ze8DQw==
X-Google-Smtp-Source: ABdhPJxxvMe3/BhpD1hlLw/7JNd8iujE5rqTGt73ELHYeygX/swn9CKzIPC4Wb4jnT2LvEpikdkp2w==
X-Received: by 2002:a4a:dc1a:: with SMTP id p26mr9580113oov.6.1633361968417;
        Mon, 04 Oct 2021 08:39:28 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id x28sm3127570ote.24.2021.10.04.08.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 08:39:28 -0700 (PDT)
Date:   Mon, 4 Oct 2021 08:41:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Message-ID: <YVsgl+EQr4aByTW5@ripper>
References: <1633339945-1568-1-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633339945-1568-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Oct 02:32 PDT 2021, Rakesh Pillai wrote:

> Add the WPSS remoteproc node in dts for
> PIL loading.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

qcom,sc7280-wpss-pil isn't a compatible that's documented or implemented
upstream, so I can't do anything with this patch.

I did go back an looked for the binding and driver and made a comment
regarding auto_boot. My comment/question still stands, but I see I made
that comment on v1, which is the last version you sent to the
linux-remoteproc@ mailing list.

Unfortunately the dt binding in v6 seem to have some issues still.


So based on that, I will have to ignore this patch until the binding has
landed - please help me remember this forward dependency when that day
comes.

And please include linux-remoteproc@ if you want the binding & driver
merged.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 58 +++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 64fc22a..2b8bbcd 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -68,3 +68,7 @@
>  		qcom,pre-scaling = <1 1>;
>  	};
>  };
> +
> +&remoteproc_wpss {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 39635da..edc7951 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -134,6 +134,11 @@
>  			no-map;
>  		};
>  
> +		wpss_mem: memory@9ae00000 {
> +			no-map;
> +			reg = <0x0 0x9ae00000 0x0 0x1900000>;
> +		};
> +
>  		rmtfs_mem: memory@9c900000 {
>  			compatible = "qcom,rmtfs-mem";
>  			reg = <0x0 0x9c900000 0x0 0x280000>;
> @@ -2588,6 +2593,59 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		remoteproc_wpss: remoteproc@8a00000 {
> +			compatible = "qcom,sc7280-wpss-pil";
> +			reg = <0 0x08a00000 0 0x10000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
> +					      <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover",
> +					  "stop-ack", "shutdown-ack";
> +
> +			clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
> +				 <&gcc GCC_WPSS_AHB_CLK>,
> +				 <&gcc GCC_WPSS_RSCP_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "gcc_wpss_ahb_bdg_mst_clk",
> +				      "gcc_wpss_ahb_clk",
> +				      "gcc_wpss_rscp_clk",
> +				      "xo";
> +
> +			power-domains = <&rpmhpd SC7280_CX>,
> +					<&rpmhpd SC7280_MX>;
> +			power-domain-names = "cx", "mx";
> +
> +			memory-region = <&wpss_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&wpss_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
> +				 <&pdc_reset PDC_WPSS_SYNC_RESET>;
> +			reset-names = "restart", "pdc_sync";
> +
> +			qcom,halt-regs = <&tcsr_mutex 0x37000>;
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_WPSS
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "wpss";
> +				qcom,remote-pid = <13>;
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7280-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> -- 
> 2.7.4
> 
