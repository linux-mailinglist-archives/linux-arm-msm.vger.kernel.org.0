Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839986205BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbiKHBXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbiKHBXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:23:09 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A971B1CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 17:23:06 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id q9so34890712ejd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 17:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o0A0yw55ZieBl6SrkekIUPpMrnlgooteEELcL9ZP3Ec=;
        b=DK54vb1qCybXBrtEEyTCQW0ellpWxVvHx4N75ZCqL1P4rDLkJG0CiGEVVH3XeWq8xh
         8+1IjIRIPFAGUQTO7Sg3OvRkap8WxD6/LXF1uT2MaR2yNYLzsHlI24+cioPAtbMyHm9s
         a0wRssFzUFGXrvEcesGMmXNcOXvAfnaUFFqHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0A0yw55ZieBl6SrkekIUPpMrnlgooteEELcL9ZP3Ec=;
        b=7uMhwxtj4rDpM/mlyZ9SRP7uAuF1+L86DbjSfkdnfJgo+8Lx/3RoJ0aGTi/Bj2iBWX
         /IYN00ZIQgbQatg83GbgF0d9pgdc5ibSFQAPhonk0QlKdn9YhSRsAekK46ffyspm01Y7
         VsW3zICHjumJIoCeFs1nN4nzvvwPkGYQbHKnFRgAcRv8Yvn0Idh2d6IJxDX++zdNURUD
         wNiYQbDemFleqAt0O4HgG8UC3n6lRErHXlyntLCmzzv4zbn9h0JAhMvtKWjPtfrjxC/0
         1Llw3oOQJuXGX+XAtWNjkNMw1X+B7wQwcE+a5PHrBd6Si10+5w+GVABYwURZsljZDnG9
         WtyA==
X-Gm-Message-State: ACrzQf0WAkx03hJ12mhsIMudDwOrykkZHlodu/tfDalUHhY05oINHDfv
        9l4HVnimbB5l6hLIE+al77y6hkaLJlHcyAaN
X-Google-Smtp-Source: AMsMyM5SsmT4fRiJ2eWw4TiUmNFnj9FRsDtzEXkkfLRH0shpFzOciipguA88HT5yu8w4yRm5x5WEgg==
X-Received: by 2002:a17:907:75c1:b0:79b:f804:c081 with SMTP id jl1-20020a17090775c100b0079bf804c081mr50826084ejc.381.1667870584442;
        Mon, 07 Nov 2022 17:23:04 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id m17-20020a170906581100b007933047f923sm4022251ejq.118.2022.11.07.17.23.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 17:23:03 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id z14so18706254wrn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 17:23:03 -0800 (PST)
X-Received: by 2002:adf:d1ec:0:b0:236:880f:2adf with SMTP id
 g12-20020adfd1ec000000b00236880f2adfmr33984142wrd.617.1667870583522; Mon, 07
 Nov 2022 17:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20221107191535.624371-1-swboyd@chromium.org> <20221107191535.624371-3-swboyd@chromium.org>
In-Reply-To: <20221107191535.624371-3-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Nov 2022 17:22:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XKHftMn4Ja40fdDggwi78F2pB0A+prs94+fFBhbSvNYw@mail.gmail.com>
Message-ID: <CAD=FV=XKHftMn4Ja40fdDggwi78F2pB0A+prs94+fFBhbSvNYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Fully describe fingerprint node
 on Trogdor
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 7, 2022 at 11:15 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Update the fingerprint node on Trogdor to match the fingerprint DT
> binding. This will allow us to drive the reset and boot gpios from the
> driver when it is re-attached after flashing. We'll also be able to boot
> the fingerprint processor if the BIOS isn't doing it for us.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 4a5ea17a15ba..65601bea0797 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -894,13 +894,16 @@ ap_spi_fp: &spi10 {
>         cs-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
>
>         cros_ec_fp: ec@0 {
> -               compatible = "google,cros-ec-spi";
> +               compatible = "google,cros-ec-fp", "google,cros-ec-spi";
>                 reg = <0>;
>                 interrupt-parent = <&tlmm>;
>                 interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-names = "default";
> -               pinctrl-0 = <&fp_to_ap_irq_l>;
> +               pinctrl-0 = <&fp_to_ap_irq_l>, <&fp_rst_l>, <&fpmcu_boot0>;
> +               boot0-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;

This isn't totally a no-op change since the pinctrl entries for
fp_rst_l and fpmcu_boot0 will now be applied. I assume you've
confirmed that it works as expected?

...other than the subject (same as patch #1), this LGTM.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
