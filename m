Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84FB52F416
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 21:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353363AbiETT6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 15:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353360AbiETT6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 15:58:07 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0151119C39F
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:58:07 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id fd25so12078321edb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=91hRve8uPKHyD7cyqNThpoM05puNaYd3DvR3HzXYuko=;
        b=lpqvBoM6Gr/2Au3IjwUDRf3AW+vRv/AgjUKjUMpr2Tw/h+UWoftPNUSJ2yRY2vUkKR
         yJTMS6AqC12+s4S/tRChmy7WAqYdVjWFuZnKS4oknUkTe1hU6PWku2CFzVRkEtgOLWeo
         /48NID9BaVY3CXLyUDP/zbnXK78bYQY8hNCEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=91hRve8uPKHyD7cyqNThpoM05puNaYd3DvR3HzXYuko=;
        b=PVNr/YPkegVe3waNttgmjkwuJ7eA2Dx7WybkRAM6ic4bADaNpC/nlJpJK9l1MNGNwo
         y2fRtvDb0/1bT1Jzjm+u1SDi/NdlW8OsZbBuiDLSPBYB62XHaGFKSje4q2oLiOrQQgJL
         fzk5SfS13JE0oI0tidvyLwkr1DVjQyofdpFR7y6HWI5JwOfXo/Kholy8VusU5H3rvk15
         dMev9mLFtaP7ocK83oSxdJiLuMuO7xg7ruTAQz7gSWsmDG0U6Ub8xmN4loQXq2XRZHBe
         u/LGTwo0wSku94ySL/EoKdLsehoQ00HPvohlwwj1GJQuJYhq7QkFzX+bnJLXPIyNO6Bj
         L7Iw==
X-Gm-Message-State: AOAM5331oDDLoIIgTUUDs43eonpZF1bobg3EvmP2N0InpIGvl6PcsC4q
        TTgmRB48UwJdCppahoZOZ3cDFnGTZL0JO/FzDpg=
X-Google-Smtp-Source: ABdhPJzZzmyDiRV1xCZ4B7qLZLT1A9RZkI7itb809xJqZRnGNTtORCXszNQimf59QboHtWHv4ppI5g==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id g12-20020a056402090c00b00415d3404ae2mr12656784edz.331.1653076685051;
        Fri, 20 May 2022 12:58:05 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id u15-20020a170906068f00b006febc86b8besm42902ejb.117.2022.05.20.12.58.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 12:58:04 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id k126so5072123wme.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 12:58:03 -0700 (PDT)
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr6514763wmr.15.1653076683048; Fri, 20
 May 2022 12:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220520124834.1.I7c51c6255bb53086a82c5b3f4fafffcc5ccbc4ae@changeid>
In-Reply-To: <20220520124834.1.I7c51c6255bb53086a82c5b3f4fafffcc5ccbc4ae@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 12:57:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4GBLoTuOcHetAFXWLQKFF0yn=E5yv0ExTg8Mwrw1iUw@mail.gmail.com>
Message-ID: <CAD=FV=X4GBLoTuOcHetAFXWLQKFF0yn=E5yv0ExTg8Mwrw1iUw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Enable keyboard backlight for villager
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 12:48 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Villager has a backlit keyboard, enable support for the backlight.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi            | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> index d3d6ffad4eff..b6a6a1454883 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> @@ -58,6 +58,10 @@ &ap_sar_sensor1 {
>         status = "okay";
>  };
>
> +&keyboard_backlight {
> +       status = "okay";
> +};

Instead of doing this, can you just get rid of the status = "disabled"
in herobrine.dtsi? I don't think there's any benefit to having two
levels of "disabled" in the herobrine device tree.
