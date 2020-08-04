Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C29023BD68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 17:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHDPnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 11:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgHDPnL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 11:43:11 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEA5C06174A;
        Tue,  4 Aug 2020 08:43:11 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id qc22so28160948ejb.4;
        Tue, 04 Aug 2020 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XvDU7ICblMvlU4iZYYabhFUIQmUPVsxNxDRb1FZXmmQ=;
        b=e+67uSIMTJb41hxcWS6ZQmz0qzGJN+L+0LjLuEvxDP1SR0HK+KVh6uL3ACN479ohD3
         DLaWjsW/mWVnl/3x1ojrBejYHb+DM/wjSxscTaohaLbeuJCKGccPBqiFa8g732pJRXUP
         2KVSV9Z++b3X5HJPoDh6XVcCdEJjVDTWwCrdgDICS8KWTRU7O9tNn+K8roCzsUPmarEI
         oVFQSHvmt4HjwSni/SMqATRSdKoCyXEEu02bXcTrRo5SuSdGil4TT4HjFFoCewftRUi4
         8KUaA8nTjECb2DfjErOR1OjXDtcFEdROjk2TbRGxLEPAR3yWHAvbDbQDlz1dbR2WFUw1
         sEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XvDU7ICblMvlU4iZYYabhFUIQmUPVsxNxDRb1FZXmmQ=;
        b=uk2Ah0uK0DvqfqmDE8/IQb9Lk0xp3te32F6v1/t5EM6GKNBT5EpMDCHr++3WEPo6w+
         5DnZy4ENWGLt+TTAky8L3Xg2oXJAjzSFgdhaDTq61XixtDN3QPSo44hcxKQtG8z7sHwJ
         s0WGufGEa8D9/9aOprId/X8qF2R63IKaNXQTvoQL+DFRTUhHXY4r4CcOhyvY1zQmBVE4
         Thf8kKPXbpoZGlWQ03knr2ZggkuGvov+UjdMw16s684Vwv7NmaQy77PggFBz26+TX89F
         LPJiwys7sQQ6ZM4RNauxBREiZcyITq0aKsReKqUZVAF1FYda/JA/5fyh1pyfM/UaSPN8
         h3tw==
X-Gm-Message-State: AOAM533rhV4nQs/wCpSPqmauW+oWfXuJooPAgOlh7KrrjVJcNoy3bzVn
        Zqwma4rIZa6eVGm9mo8C6ldj6EyvEG/WDWp9358=
X-Google-Smtp-Source: ABdhPJyG/9OaPWsq91DUuGc0ZHEkp1Igwsy4OYzy799p9zWx9XbX3KeVYuueq33MKr+f5VDzCNWkOoFl7hDa0Dk2xRI=
X-Received: by 2002:a17:906:f14f:: with SMTP id gw15mr21260603ejb.245.1596555789850;
 Tue, 04 Aug 2020 08:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org> <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 4 Aug 2020 08:43:54 -0700
Message-ID: <CAF6AEGu8GG4i1inhjQ11PDeUxEq=4E2ggVm6cL=AfNHbvNuh6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for
 sc7180 target
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> From: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Move the bus clock to mdp device node,in order
> to facilitate bus band width scaling on sc7180
> target.
>
> The parent device MDSS will not vote for bus bw,
> instead the vote will be triggered by mdp device
> node. Since a minimum vote is required to turn
> on bus clock, move the clock node to mdp device
> from where the votes are requested.
>
> This patch has dependency on the below series
> https://patchwork.kernel.org/patch/11468783/
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@chromium.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 4f2c0d1..31fed6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1510,10 +1510,9 @@
>                         power-domains = <&dispcc MDSS_GDSC>;
>
>                         clocks = <&gcc GCC_DISP_AHB_CLK>,
> -                                <&gcc GCC_DISP_HF_AXI_CLK>,
>                                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -                       clock-names = "iface", "bus", "ahb", "core";
> +                       clock-names = "iface", "ahb", "core";
>
>                         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>                         assigned-clock-rates = <300000000>;
> @@ -1539,12 +1538,13 @@
>                                       <0 0x0aeb0000 0 0x2008>;
>                                 reg-names = "mdp", "vbif";
>
> -                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                                          <&dispcc DISP_CC_MDSS_ROT_CLK>,
>                                          <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>                                          <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                                          <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                               clock-names = "iface", "rot", "lut", "core",
> +                               clock-names = "bus", "iface", "rot", "lut", "core",
>                                               "vsync";
>                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                                                   <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> --
> 1.9.1
>
