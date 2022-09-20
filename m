Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D8E5BE97F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbiITPBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiITPBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:01:09 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF9931ECF
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:01:07 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b35so4349555edf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bgEx5Kq7VOtgOD4buse7/uZ+x/Y62IUaR73vqEIPjzY=;
        b=cTVeOnTCemK2eDtJ48pOWoYFEU595KeXCZLrFWFtGsVITlGRdvZds+c5nNbbI8rj6M
         2u1nbBOGh718+CaQ2CgFoQqVOhezMg2ARLOyfFbUhVnpnSyuz/ToLYbVuaIrkfsClTDb
         IF9bBTAX/ESuuaxx750IS7TnhoSL3/F32uS+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bgEx5Kq7VOtgOD4buse7/uZ+x/Y62IUaR73vqEIPjzY=;
        b=5hvQWzUrlVZ0NyLkQB6PNw4OohbnXFouB0H4S0YP8/+mO9FQDYw79KKerUl1Y6DZLV
         fAduA0TtFdTiVIPF7g2nT413LmDw1AtqAcw/lQ/SWVNv30/J/byO0vbxsH+HRoNuiy7Y
         IzaOCR/VDJHYl495g1wm3e0h6ss59uXorrcTuyo6biH5l+lHwvzLUKsfHaLdg8Atlk2P
         aad4LBOpdnLv/byIM1rMM1l735vx2LSXBDgV0mEN6PM/h61e4TDBE5Wg13d9MeK5j3dn
         IFqg8J2puCUe36j/ogSSFWhbYqye60G0cGW3r150SxPQVFP3jDAVaLc5gVQtu7vVaTrh
         3yRQ==
X-Gm-Message-State: ACrzQf0m/ZnFyIu3SHu6mNDcWTsuN1RdNi0zBuNrLXpNwcian6+VUzjJ
        eK5qJ8vUx2vJ7e5U8JDiPc+s0U9XB6W65czY
X-Google-Smtp-Source: AMsMyM4mqrDVOaRhzvQjKiQ9pK8FhLy0Nn+HaPPFOl8/IgixPf9TSzVLUWDj66bjpBa7LqAzWiV94Q==
X-Received: by 2002:aa7:cdd2:0:b0:44e:be4d:3231 with SMTP id h18-20020aa7cdd2000000b0044ebe4d3231mr20917145edw.296.1663686065637;
        Tue, 20 Sep 2022 08:01:05 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906301b00b0073d9a0d0cbcsm2709ejz.72.2022.09.20.08.01.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:01:03 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id n10so4684786wrw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:01:02 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr15014256wra.617.1663686062063; Tue, 20
 Sep 2022 08:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220916040330.1.Ia3be91283bd937d08e7321140c89e4a0e2b78cf6@changeid>
In-Reply-To: <20220916040330.1.Ia3be91283bd937d08e7321140c89e4a0e2b78cf6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 20 Sep 2022 08:00:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMmF2J-DQwa+o3aMUtajDtPkNfQEeruwL8cO1Nfv=hhA@mail.gmail.com>
Message-ID: <CAD=FV=XMmF2J-DQwa+o3aMUtajDtPkNfQEeruwL8cO1Nfv=hhA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add touchscreen for pazquel360
To:     Yunlong Jia <ecs.beijing2022@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>
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

On Thu, Sep 15, 2022 at 9:04 PM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
>
> The model used is elan ekth3915, compatible with ekth3500.

If I wanted to be very purist about this I'd probably argue that we
should include both compatibles, the true one and the fallback one,
AKA:

compatible = "elan,ekth3915", "elan,ekth3500";

...which would, of course, require a bindings update as well. In
practice everyone that uses the ekth3500 compatible is ignoring this
and it seems unlikely to make a huge difference. As long as the power
sequencing is fine then the elan driver can discover and account for
any differences at runtime. Thus, I won't insist.


> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
>
> ---
>
>  .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 22 +++++++++++++++++++

The file you're modifying doesn't exist yet. Bjorn landed a bunch of
patches recently but he seems to have missed yours, AKA the two
patches that include:

https://lore.kernel.org/r/20220901024827.v3.2.Iea2d2918adfff2825b87d428b5732717425c196f@changeid/

You should have mentioned this dependency "after the cut". Since you
use patman that would involve using "Commit-notes:" to mention the
dependency.

Another (probably better) option would have just been to send a v4 of
your unlanded series and add the touchscreen in there.


>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
> index 5702325d0c7b..14ea94ce90c1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
> @@ -14,6 +14,28 @@
>         realtek,dmic-clk-rate-hz = <2048000>;
>  };
>
> +ap_ts_pen_1v8: &i2c4 {
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       ap_ts: touchscreen@10 {
> +               compatible = "elan,ekth3500";
> +               reg = <0x10>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
> +
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +
> +               hid-descr-addr = <0x0001>;
> +
> +               vcc33-supply = <&pp3300_ts>;
> +               vccio-supply = <&pp1800_l10a>;
> +               reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
> +
>  &keyboard_controller {

nit: Only one blank line between nodes here, not two. Please spin the
patch for this. Once you do then feel free to add my Reviewed-by tag.

So in summary you have two options and I'm OK with either:

1. Spin a v4 of your original "pazquel360" patch series and just
squash this one into it.

2. Leave the original "pazquel360" patch series alone and send a v2 of
this patch series. In your v2 you'd remove the extra blank line and
use "Commit-notes:" to mention your dependency on the other series.

I suspect Bjorn would prefer #1 but he's free to correct me.
