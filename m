Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB4B46DDF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 23:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbhLHWFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 17:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhLHWFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 17:05:00 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A60C061746;
        Wed,  8 Dec 2021 14:01:28 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso5230346wml.1;
        Wed, 08 Dec 2021 14:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78Ifs23TtoxatfN7VFvq9AEVPiNcwkeZ+FD9JLKmw8c=;
        b=eoOfS+6CmChrGqIET8UbG2Mcyt7PpnxNsqQBcTKKvvFva2oPLikaLax+o6UFRiitOo
         F75w0TsDGEYb+iHtNj/MgluUFT8K+9sdMVBYHdnKn5GGTM4IuGFSYqfLbj6lKsZVw3cG
         jkY6YDhnrUB/XZ8F7VksJaZbQUZWqAPSCh/CTY1a+j5/SNACoVhI16F5r8rjuQ+8b68t
         RlDrDjlTixZBpkLzx/KRMVrwiNoSvRbJdoOr7k33A/FURILhHfRcEoENHTDBQoChozph
         8NGQBK13gFNv9z3teV47WwN0Voj2yeN7eK9RoFG8b2QlNdIn6hIX4dOGfm0uf5tiwJKZ
         w2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78Ifs23TtoxatfN7VFvq9AEVPiNcwkeZ+FD9JLKmw8c=;
        b=Y6WU6el+J/Vrq+CMe9Z7DA8dXzOZiaTc9gHm885EXex5K0hl3qQxZ/XpNpkKafdoQB
         mwXF4eO81/uqCLa/tAHJ9ACJLvDLRFfl3Qh5XV2ZrO+ghjqkJ4Ez6DWIkVhA/2ZH0l0l
         iCwghNp/hARpQZDk3EavLf3xvdXyTKvkcl8AO4xFY24hVK2fya6w7HprRNB6Gm9o+TYz
         JIRhf8jxsHts2QqCKEIQrWqxxrxKeg5y/GJlc0aTbCiSjKr/91tuBmNF3kZMEjyAgwQV
         RUm7JPpfTu2KWL/FxSpLZccVP/PCQLeqScN31aA49d/suP20V/1LkTBVWGlgNBvI1yrI
         kKpQ==
X-Gm-Message-State: AOAM532ky9U06wFoj597pDX6HdlMwPGrw2CsIa77WT4BBTAmjKoKOTUt
        I2U6lqFadCJuSdM1LmQ5f9LDlMM14pON2tGSp9c=
X-Google-Smtp-Source: ABdhPJx4+51IKWNFMWdRf7kFk0fQGiVNH4ObQU0Pt5G58JOq7C+3hI5cdOhoebAHEgcFR4QJtJpoZ99D+N6A9Eu9azc=
X-Received: by 2002:a05:600c:4f4b:: with SMTP id m11mr1665243wmq.151.1639000886773;
 Wed, 08 Dec 2021 14:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20211105030434.2828845-1-sean@poorly.run> <20211105030434.2828845-14-sean@poorly.run>
In-Reply-To: <20211105030434.2828845-14-sean@poorly.run>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 Dec 2021 14:06:43 -0800
Message-ID: <CAF6AEGv9ghHcd1zhWiBQ40pwx1uMeJ=Y_T5EVo2EV5gTRTtAew@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 13/14] arm64: dts: qcom: sc7180: Add
 support for HDCP in dp-controller
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 4, 2021 at 8:05 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller. Now that these are supported, change the
> compatible string to "dp-hdcp".
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
>
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c8921e2d6480..838270f70b62 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3088,7 +3088,13 @@ mdss_dp: displayport-controller@ae90000 {
>                                 compatible = "qcom,sc7180-dp";
>                                 status = "disabled";
>
> -                               reg = <0 0x0ae90000 0 0x1400>;
> +                               reg = <0 0x0ae90000 0 0x200>,
> +                                     <0 0x0ae90200 0 0x200>,
> +                                     <0 0x0ae90400 0 0xc00>,
> +                                     <0 0x0ae91000 0 0x400>,
> +                                     <0 0x0ae91400 0 0x400>,
> +                                     <0 0x0aed1000 0 0x175>,
> +                                     <0 0x0aee1000 0 0x2c>;

So one small issue, if someone tries to get linux running on a sc7180
windows laptop (which uses qcom's tz instead of the CrOS tz), things
will go BOOM!

We might want instead to move this somewhere chromebook specific,
maybe sc7180-trogdor.dtsi?

BR,
-R

>
>                                 interrupt-parent = <&mdss>;
>                                 interrupts = <12>;
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
