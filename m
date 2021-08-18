Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C313F0C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 21:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbhHRT6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 15:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhHRT6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 15:58:31 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E02CC0617A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 12:57:56 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so5550333otf.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 12:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hMNsxaIVAKEhwUPAnI8A+Z1CyieSI/+ymj5IsPC0nx0=;
        b=BJ8XxKqZWNK+GA6AyndO/j7cjNxJpKMSCuYSPWjgJb/ckKsC2wqsaTcfweihlV2vWF
         xIWcJl8UHqrQrzoBABxdY/K72PeDLbRARVl/K7T6EH/q9oeNcAAet0rfK95TYcNtRI+e
         pF7Eborol02KyGyWnTPBNZLI+uTm7BaBQnejM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hMNsxaIVAKEhwUPAnI8A+Z1CyieSI/+ymj5IsPC0nx0=;
        b=PwQmkoQRfkAo518SIfxJwexo4/pcltvVLqN14oZNUC32yNEGOE5sa7fEPQzPHZk+Fk
         GlleDZstUKmP4htWc0EHt3n0AZe7Wk+o4G9zeWIynlFlRWJjOA28wqYJkBopDZAclM8r
         vIa7fpgd0sK0Hyr38yPv2S5WnZGkhny/TDaS/NpGLwFNDWjDXSX6zrgDqp7keSYUAoBQ
         md+DhOzzQljJCKAwl+7jgKzAFdXTxhN5cZdJDJI7HH6wXU21b4YZE9VtDDMRm93sJGnM
         s6NX4TmqCgRMjH464hc3ObKuTBxShZtgnGg6BYgUpU6TRPdDMWjaTbKB5WnpHl/rfx6v
         7Zlg==
X-Gm-Message-State: AOAM530PSlmLcy7xD71UFkYqkEcQnYbdDIuMsiZPPgpdZf0gCOR/68G6
        s9axt2cb/n9fUc93d4ewU3ohkEMrCagdsRqBNHOt1w==
X-Google-Smtp-Source: ABdhPJzmXOb8xBARc+WzsJ0z34O3SnwrY4WwT/K/Ap9nVOEzk1VWjsLwQPpXUxpXxSI8WfoySmqZymyZv1fYbWdVLZw=
X-Received: by 2002:a05:6830:2473:: with SMTP id x51mr1762198otr.34.1629316675810;
 Wed, 18 Aug 2021 12:57:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 12:57:55 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org> <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 18 Aug 2021 12:57:55 -0700
Message-ID: <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-08-18 03:27:02)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 53a21d0..fd7ff1c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>   */
>
> +#include <dt-bindings/clock/qcom,dispcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interconnect/qcom,sc7280.h>
> @@ -1424,6 +1425,90 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               mdss: mdss@ae00000 {

subsystem@ae00000

> +                       compatible = "qcom,sc7280-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                               <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "ahb", "core";
> +
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "mdp0-mem";
> +
> +                       iommus = <&apps_smmu 0x900 0x402>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       mdp: mdp@ae01000 {

display-controller@ae01000

> +                               compatible = "qcom,sc7280-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f030>,
> +                                       <0 0x0aeb0000 0 0x2008>;
> +                               reg-names = "mdp", "vbif";
> +
> +                               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                       <&gcc GCC_DISP_SF_AXI_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "bus", "nrt_bus", "iface", "lut", "core",
> +                                             "vsync";

One line per string please.

> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                               <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                               <&dispcc DISP_CC_MDSS_AHB_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                       <19200000>,
> +                                                       <19200000>;
> +                               operating-points-v2 = <&mdp_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0>;
> +
> +                               status = "disabled";
> +
> +                               mdp_opp_table: mdp-opp-table {

mdp_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-200000000 {
> +                                               opp-hz = /bits/ 64 <200000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-300000000 {
> +                                               opp-hz = /bits/ 64 <300000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-380000000 {
> +                                               opp-hz = /bits/ 64 <380000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-506666667 {
> +                                               opp-hz = /bits/ 64 <506666667>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
