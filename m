Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECF922427C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 19:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgGQRrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 13:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQRrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 13:47:19 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70906C0619D2;
        Fri, 17 Jul 2020 10:47:19 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lx13so11765699ejb.4;
        Fri, 17 Jul 2020 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCHMQCyaGiFmiAEOZCGJJ9+ZHHBfKYMD4ndLx0utt+k=;
        b=kL6cSQaA7ZAVb822SFcAn7jM2Z6R7qPL+QjfpbvzDVzuf+tomRxqOFWAJ20xTDf1tY
         2rbaQqrOLOC/Bo8gmXu2gTHqxX6Qo4NB57ye5M0qR6u6UtQM5s8N+0UVlh9tLUyFdjL/
         Eyj8QpTzQ9BBM2QPHD6E8YuSF8JTRCENbiVEYnryF8HkLcdFxrbD313fC06dlQ2mRqAv
         YMyf04NxtyDacYtALlkVvz5xR1aGACID1vGMZI0WQsm1aXahrqOuctfNzpptlK/1atPw
         h5zCqVW2HBLNE64+8ZJPcJqL5mjo3EtLkUTKyOAKfciGLTj114RioK73jR5iAjg69Lsb
         XMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCHMQCyaGiFmiAEOZCGJJ9+ZHHBfKYMD4ndLx0utt+k=;
        b=hWeNo40xfimkQScjsbQcKWfOJWmCiFY3qqPMWI2yWQo4qkl8u30Xp9hpBlg1hc4Pv6
         bhbph/AobDa3CmSDZMK1njoeI2SYOhHca9/Ur/SfBdARwUqdworZ0OqzscWyxgalyHp9
         v69c4DaP5nFUzWTQoVw3c3iy9dx39p3rsqnze+vxwVD9oy3GMgkOYmd9NjI6k70yP+SD
         9Pq8tz8TUJHszKj8PzsqJuBePvH5fOqlJyTtk+RWBBErjsQBys8rCQa09lKE2kI76qvX
         NCoAYiPQ3WUwtEUwcXI/3DqZS2I3fweHYZ3plbcWiXv/HZO1nGaMjdf6Bn8RjIbWsxJ1
         ppig==
X-Gm-Message-State: AOAM531/s+tADcbPsPMX4w7CBL9y7AmDX3NmLjvBtv69e0RfqxWQiwMq
        TdtOZ+Z8ZH1aXFeyeYTVikDqozaU/1+w1mw1MJI=
X-Google-Smtp-Source: ABdhPJwtmM5I9XsUxydmrAjDhrNrNvfs/8okO6i9fpHQnBYs8v9G4H73wAYeFtCw/gPwg6HQpmgc6UytC/0WnR2RsRo=
X-Received: by 2002:a17:906:7c54:: with SMTP id g20mr9931963ejp.460.1595008037981;
 Fri, 17 Jul 2020 10:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org> <1594292674-15632-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1594292674-15632-4-git-send-email-rnayak@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 17 Jul 2020 10:47:51 -0700
Message-ID: <CAF6AEGvioVKKSN-UP35OfJcfUXeHy34Y6w2eM_FZU+zpTaRE7A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: sdm845: Add DSI and MDP OPP tables and power-domains
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 9, 2020 at 4:05 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Tested-by: Rob Clark <robdclark@gmail.com>

Bjorn, the two driver patches are queued up in msm-next, I assume
you'll pickup the two dt patches?

BR,
-R

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fee50d9..3efdd70 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3296,6 +3296,35 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               dsi_opp_table: dsi-opp-table {
> +                       compatible = "operating-points-v2";
> +
> +                       opp-19200000 {
> +                               opp-hz = /bits/ 64 <19200000>;
> +                               required-opps = <&rpmhpd_opp_min_svs>;
> +                       };
> +
> +                       opp-180000000 {
> +                               opp-hz = /bits/ 64 <180000000>;
> +                               required-opps = <&rpmhpd_opp_low_svs>;
> +                       };
> +
> +                       opp-275000000 {
> +                               opp-hz = /bits/ 64 <275000000>;
> +                               required-opps = <&rpmhpd_opp_svs>;
> +                       };
> +
> +                       opp-328580000 {
> +                               opp-hz = /bits/ 64 <328580000>;
> +                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                       };
> +
> +                       opp-358000000 {
> +                               opp-hz = /bits/ 64 <358000000>;
> +                               required-opps = <&rpmhpd_opp_nom>;
> +                       };
> +               };
> +
>                 mdss: mdss@ae00000 {
>                         compatible = "qcom,sdm845-mdss";
>                         reg = <0 0x0ae00000 0 0x1000>;
> @@ -3340,6 +3369,8 @@
>                                                   <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>                                 assigned-clock-rates = <300000000>,
>                                                        <19200000>;
> +                               operating-points-v2 = <&mdp_opp_table>;
> +                               power-domains = <&rpmhpd SDM845_CX>;
>
>                                 interrupt-parent = <&mdss>;
>                                 interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3364,6 +3395,30 @@
>                                                 };
>                                         };
>                                 };
> +
> +                               mdp_opp_table: mdp-opp-table {
> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-19200000 {
> +                                               opp-hz = /bits/ 64 <19200000>;
> +                                               required-opps = <&rpmhpd_opp_min_svs>;
> +                                       };
> +
> +                                       opp-171428571 {
> +                                               opp-hz = /bits/ 64 <171428571>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-344000000 {
> +                                               opp-hz = /bits/ 64 <344000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-430000000 {
> +                                               opp-hz = /bits/ 64 <430000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
>                         };
>
>                         dsi0: dsi@ae94000 {
> @@ -3386,6 +3441,8 @@
>                                               "core",
>                                               "iface",
>                                               "bus";
> +                               operating-points-v2 = <&dsi_opp_table>;
> +                               power-domains = <&rpmhpd SDM845_CX>;
>
>                                 phys = <&dsi0_phy>;
>                                 phy-names = "dsi";
> @@ -3450,6 +3507,8 @@
>                                               "core",
>                                               "iface",
>                                               "bus";
> +                               operating-points-v2 = <&dsi_opp_table>;
> +                               power-domains = <&rpmhpd SDM845_CX>;
>
>                                 phys = <&dsi1_phy>;
>                                 phy-names = "dsi";
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
