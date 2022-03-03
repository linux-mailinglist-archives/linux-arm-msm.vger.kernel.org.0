Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A364CCA4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 00:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbiCCXvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 18:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbiCCXvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 18:51:49 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A9A166A7F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 15:51:02 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id v5so5269065qkj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EEUDph6pdILfOjFK/V90NsjsmH/ILVmOF+Vdrb+tua8=;
        b=DFpGnpSMnFmOUvMJOYbl261thgAry2SYgtDsyMBZuLiJDYxlUr+vXHe5DRn1OOPG55
         lbAU5uyEJ6BCRngz3QV/NzOlgo9IdG/lUiQi7nmDxqL9XgwJIVmhdSPBnyODd43C5Hq8
         ztcOXHnG5slmbzAFJ9tFDftjvWJnxU4V/Tvk9whBObB1E75KVBul2XY8XdWshFO4Lp7j
         yDZub7Qd094o4eV03t3BQzIwoffa9QfyD1XaIeHpqqnEeqcp15O3d+fZlyCrSYlD8iI5
         l/lRSc3ayN3yttX+4Ndi7Aw6gvAahTmo0Jbul3oLc+yzqhYgXJWoyjtrumJMmlOeVkhY
         LkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EEUDph6pdILfOjFK/V90NsjsmH/ILVmOF+Vdrb+tua8=;
        b=Rm9JhI0HVAe8vVZMi/W/xoGAmbuv6qqVkXikaIxWQb0XxXvfmQI/dbOk8Hkg5bHSJ0
         J/EjI4r5Tkfh2agj3KGzvXPFZV42eMv8taZ4omD1h7Gymh/LDnurx4/m6udVIHMbloiw
         CSSAyay9r19nHKGqJ8pjqARRSXen5U2ei3YcpnYujWaDzOlDB4V5P2V+nRLddls4UIjq
         8Oa+k4dyGLKeO8ci9ptkSpQiAbzFdZMdx6nSsN8L7DZr0iXIaiqlacrEBQBNu5bd4NAc
         XEZsS5l1K3UNp772z1furptCEG5amVlB6QZeSW++jG9DbrJIsF3a/Y5jkEu5iyJpE0/u
         PK1A==
X-Gm-Message-State: AOAM5311j1tAhVFqsZapvdXs+rlgr/c18m8P6oW+pmaZc7hbRJ09uL73
        9+UXO65YRdkgeWPM1+EJqI79+55a41qZqOiJIwCw1g==
X-Google-Smtp-Source: ABdhPJxO/chGuWgVCSeW611qh1w44gEqrV7Xsc4Oh8x15acfkpz3bzzXTGhRfR1YREAZMdmJovlbjCD2iHuTu/of2xE=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1036802qki.59.1646351461812; Thu, 03
 Mar 2022 15:51:01 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com> <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Mar 2022 02:50:50 +0300
Message-ID: <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")

Please remove the Fixes tags from all commits. Otherwise the patches
might be picked up into earlier kernels, which do not have a patch
adding a vote on the MDP clock.

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index fdaf303..2105eb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3164,9 +3164,6 @@
>                                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
>                         clock-names = "iface", "bus", "nrt_bus", "core";
>
> -                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -                       assigned-clock-rates = <460000000>;
> -
>                         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
> @@ -3191,10 +3188,8 @@
>                                          <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>                                 clock-names = "iface", "bus", "core", "vsync";
>
> -                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                               assigned-clock-rates = <460000000>,
> -                                                      <19200000>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <19200000>;
>
>                                 operating-points-v2 = <&mdp_opp_table>;
>                                 power-domains = <&rpmhpd SM8250_MMCX>;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
