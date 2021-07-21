Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A7C3D0881
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhGUFHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233213AbhGUFHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:07:05 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A628BC061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:47:41 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id w194so1749277oie.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WFFZpveA2N/n3D8dsdh+7arE9KhS9kDixvpDhxkwqhU=;
        b=I56mKdaNDgA36vKgzORsD//DDSgTgXZWRedVxroLfp32Vo0tAR/B0hX8Jiwm1UCGKz
         Qz3RuZdnjgDv8z3AEjK9tbWFr2tFE44KD9G1rUJVxDDBuCXNgXaVEr9dGiCAKXXZGd05
         bfJtgHjEwBJn8T2ihcG9A4Jq/dWNkWaspJCIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WFFZpveA2N/n3D8dsdh+7arE9KhS9kDixvpDhxkwqhU=;
        b=Mv9YdMv3aobdRgHoSutCtySYw7nZqHM0z2J6woT6CQBGaXG9lLKC5WYO0VGNg7JO8F
         p48ZA26EjfcqGexqwW4NelbXRg/dnq1pvshVqX9YeppRLfSEiAVO64JEi9ejYJVJjJys
         IUlmGwAot43DMGx/XmhIcKHthNzMAsPCz+LMRT5hqA5emJyDkotFs65jk+V0Lr9H3zfV
         LqzQXMGtbHk/27kOiR7qlHGcyt6JE6DsTHQOSjqSDSoo5Qkv2XLRdtEmziPH5CnxlmUZ
         kNU2xInR+QYHQcQZVV4EE9xco6B8xTB1fxhGm1hZrs62BiOsP7ze/NnpVIvE3ZCh2b2E
         rbnQ==
X-Gm-Message-State: AOAM533RPNwuofu9yWf7KXEbUiJEGlJxlff84w9aZSWC1tqezgg0D5Wt
        HEvYgwm6EOiIgW4OLjuHl5CHrjc3USD97Bny9QWrMQ==
X-Google-Smtp-Source: ABdhPJxtigzxgBnXGs4kYZRz9XxaMw8rBeAllWe8ZG8TADgvtH6CIpfiJ8mCXD4jgyz9CX+JKr7M2YxMGaK8CEbUc90=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1533311oib.166.1626846461124;
 Tue, 20 Jul 2021 22:47:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:47:40 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-11-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-11-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:47:40 +0000
Message-ID: <CAE-0n53bRGouiycpcukPYB_+Gyz_Dr=rCAnb2MH64=+Q899aOA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:13:00)
> Update MSS node to support MSA based modem boot on SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  7 +++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 19 ++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 191e8a92d153..d66e3ca42ad5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -343,3 +343,10 @@
>                 bias-pull-up;
>         };
>  };
> +
> +&remoteproc_mpss {
> +       status = "okay";
> +       compatible = "qcom,sc7280-mss-pil";
> +       iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
> +       memory-region = <&mba_mem &mpss_mem>;
> +};

Can this go above the pinctrl zone in this file? Preferably sorted
alphabetically by phandle.

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 56ea172f641f..6d3687744440 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -586,7 +586,8 @@
>
>                 remoteproc_mpss: remoteproc@4080000 {
>                         compatible = "qcom,sc7280-mpss-pas";
> -                       reg = <0 0x04080000 0 0x10000>;
> +                       reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
> +                       reg-names = "qdsp6", "rmb";
>
>                         interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
>                                               <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> @@ -597,8 +598,11 @@
>                         interrupt-names = "wdog", "fatal", "ready", "handover",
>                                           "stop-ack", "shutdown-ack";
>
> -                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> -                       clock-names = "xo";
> +                       clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +                                <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface", "offline", "snoc_axi", "xo";
>
>                         power-domains = <&rpmhpd SC7280_CX>,
>                                         <&rpmhpd SC7280_MSS>;
> @@ -611,6 +615,15 @@
>                         qcom,smem-states = <&modem_smp2p_out 0>;
>                         qcom,smem-state-names = "stop";
>
> +                       resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> +                                <&pdc_reset PDC_MODEM_SYNC_RESET>;
> +                       reset-names = "mss_restart", "pdc_reset";
> +
> +                       qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000 0x28000 0x33000>;
> +                       qcom,ext-regs = <&tcsr_regs 0x10000 0x10004
> +                                        &tcsr_mutex 0x26004 0x26008>;
> +                       qcom,qaccept-regs = <&tcsr_mutex 0x23030 0x23040 0x23020>;
> +
>                         status = "disabled";
>
>                         glink-edge {

Any reason to not combine this stuff with the previous patch?
