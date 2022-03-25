Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3E64E785C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 16:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355550AbiCYPtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 11:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349728AbiCYPtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 11:49:15 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4480938BEB
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:47:41 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g20so9721717edw.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M9xTOiZ1HHyi6ea05f9muJ3Y6FyGXCVSzZtrTzJPLFI=;
        b=R/NO5qOrgPCusNY+qv+RI2+5rDShkjR7mbu+ICcrTwWiFBsMIselehECZpB/ZpMRsm
         GtOQHCwiQGh5CFdDo0ZZ8DPIfKWOnfIVKz+/HaZRFiKo54WIi1C0fDMkTabWswsZfTzl
         HneqgzxVUQW5CFdgSJlXL+KRqfEyVmDlkL7Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M9xTOiZ1HHyi6ea05f9muJ3Y6FyGXCVSzZtrTzJPLFI=;
        b=q+SaotNFCvf8sWMIil9gC7/D/E0eX1KCG224iEJg+inlnj8b7C1Ed2OnViEuxkWXCA
         8+Dq9McZ6rOhj7oODjdN37jx9mTO9l+3TB110fexNiCPLSZFS08AY99apGwiyrV8M1qH
         xLTfcuaTxGZ+TLGtczJCO1aRTsh29G6IGYO7jHap/ge3a2n664wf0jWl6ul13OfiJc9z
         DfX/s+izc+mqv2L9KOP/HMN4KDrob6KdUvAFNfqQ94Nat+KCs9e34DVjSb5Sssro5xTj
         3FiypchDpeGJ9vmuBXHapoGFmiJI+yFP4QQxIm6E+DwmLgH/4JRRr7ccY7IYMeNnoxO7
         f2TA==
X-Gm-Message-State: AOAM530OlBuXJjrJ/5chOTqi66rwUcW+XWMAnBbWFtrtje3MKYO8dPwo
        bjCxEWKNn9Z4+jA1rFSS8JwZ+pMj+rxMFy3ULQM=
X-Google-Smtp-Source: ABdhPJy2oLb8EFXThxAFOtz218GtUjMSwJXQxTsnmwPlaDrFO4uL5T442tduHTXTTiVgmYtA9MmR8w==
X-Received: by 2002:a05:6402:35d1:b0:419:7f2e:cdb7 with SMTP id z17-20020a05640235d100b004197f2ecdb7mr13951295edc.152.1648223258743;
        Fri, 25 Mar 2022 08:47:38 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id hu8-20020a170907a08800b006dfd2056ab2sm2512472ejc.97.2022.03.25.08.47.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 08:47:38 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id w21so6870478wra.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:47:38 -0700 (PDT)
X-Received: by 2002:a5d:5551:0:b0:203:f916:e319 with SMTP id
 g17-20020a5d5551000000b00203f916e319mr9840158wrw.422.1648223257583; Fri, 25
 Mar 2022 08:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220325081100.1.I9f06fec63b978699fe62591fec9e5ac31bb3a69d@changeid>
 <CAE-0n50hUGbH7_khhbsg3fbX_MCK0gEoStk-3xoUzje_a1=KQQ@mail.gmail.com>
In-Reply-To: <CAE-0n50hUGbH7_khhbsg3fbX_MCK0gEoStk-3xoUzje_a1=KQQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Mar 2022 08:47:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhhVBys4k7nZJ-SHB4y2Jf7JL9eeGUdBTqYG+c3m8-kA@mail.gmail.com>
Message-ID: <CAD=FV=WhhVBys4k7nZJ-SHB4y2Jf7JL9eeGUdBTqYG+c3m8-kA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-herobrine: Audio codec wants
 1.8V, not 1.62V
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 25, 2022 at 8:42 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-03-25 08:11:05)
> > The L2C rail on herobrine boards is intended to go to the audio
> > codec. Let's override the 1.62V specified in the qcard.dtsi file to be
> > 1.8V.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> >
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > index dc17f2079695..c2075f3e7c4b 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > @@ -339,6 +339,16 @@ keyboard_backlight: keyboard-backlight {
> >  ts_avdd:      &pp3300_left_in_mlb {};
> >  vreg_edp_3p3: &pp3300_left_in_mlb {};
> >
> > +/* Regulator overrides from Qcard */
>
> This one isn't in ALL CAPS? :)

Yeah, I guess it sorta felt like it was a sub-part of the previous
section since it was also adjusting Qcard regulators, but you're right
that it's not actually a board-local name. What about if I change the
section heading for "BOARD-LOCAL NAMES FOR REGULATORS THAT CONNECT TO
QCARD" to:

/*
 * ADJUSTMENTS TO QCARD REGULATORS
 *
 * Mostly this is just board-local names for regulators that come from
 * Qcard, but this also has some minor regulator overrides.
 *
 * Names are only listed here if regulators go somewhere other than a
 * testpoint.
 */

I'll wait a few days and then send a v2 if that sounds OK.

-Doug
