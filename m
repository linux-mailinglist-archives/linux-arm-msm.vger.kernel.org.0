Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE23511E56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 20:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbiD0PN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 11:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiD0PN2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 11:13:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025F02D4203
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 08:10:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id k23so4048468ejd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bcBCHuka1c7eUCHaJJ1Tf0YnngjHSBeBCkk7aucJRc=;
        b=Bha64TEobiweIEID7s+302mbO83FZsNFeG4G9pC1hn4DLldhg2boTtAWRnZIW4hMUF
         tEcxiUcYoQYdX1hA3zzB/izxzVa9EYpvkdFybz8Yc5m2SSrZZfsI3qdXkKCDux6UJORd
         nTkuWxGNRe424v5bdabJpziKRa/X0pZvUGGqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bcBCHuka1c7eUCHaJJ1Tf0YnngjHSBeBCkk7aucJRc=;
        b=6uEGufVzHp7eyDafnBeOq/AO3m6KKrmEhv7vR7NxHvzvdNovFbzKnxwDfM+RW5G3FU
         AW4PXKBfgIxlT4MVSA5fimHnSyQmBQsqXYJqAktv0QOZBzO2sI8c4b24pBR3mEtUt60p
         OBu8MWjd6alNT8AnOzpfWh+Y3GlpcxBeXWq7RaqFBSdRKhdByujl04Mvrx6cWFId6Ar3
         MYY7xduSrH5GgktUI6EQ5harvOaeecnjVsa5C12ZymmdggcPshOc4/faxhzAzgEsNPyI
         N7IjMQLEQWq7pZfNs+Jwqf3eW/LzuupwrAYwXPfTEG93zGvUUyQ9L+4NldS/cioPxxNn
         zAaQ==
X-Gm-Message-State: AOAM530I58OF2FG+LNFk3xFaePUOxoCDSQZawwSyLsW5vavexGPM7r05
        WA4hbiLp0IOKQ7ZsYwvy40IsFoUN1v+QZXv1YWc=
X-Google-Smtp-Source: ABdhPJxpUddVSPg6lFPSdA2oYcuK5NoEzAoQ57XX9cuMTlgQ4SOnh+zYPYW6PIBeXMY98eoIuiCTYw==
X-Received: by 2002:a17:907:72c4:b0:6f3:6b11:3190 with SMTP id du4-20020a17090772c400b006f36b113190mr22234053ejc.369.1651072215272;
        Wed, 27 Apr 2022 08:10:15 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id 22-20020a508e16000000b00425c9d1704bsm7482896edw.4.2022.04.27.08.10.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 08:10:12 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id u9-20020a05600c00c900b00393e729e655so1424984wmm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 08:10:12 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr26785973wmr.15.1651072211589; Wed, 27
 Apr 2022 08:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220426225748.324759-1-swboyd@chromium.org> <CAD=FV=WMf0Jc9oD7CGoLthguzt2aV31sZmFoenbjn72MfwFYEA@mail.gmail.com>
In-Reply-To: <CAD=FV=WMf0Jc9oD7CGoLthguzt2aV31sZmFoenbjn72MfwFYEA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Apr 2022 08:09:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wey2P_=3Lp6M8GEaoyCn1XcYFhfJwfx43a5f_8H0obwg@mail.gmail.com>
Message-ID: <CAD=FV=Wey2P_=3Lp6M8GEaoyCn1XcYFhfJwfx43a5f_8H0obwg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Remove cros-ec keyboard
 from detachables
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 26, 2022 at 5:17 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Apr 26, 2022 at 3:57 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Trogdor devices that have a detachable keyboard still have a
> > non-detachable keyboard input device present because we include the
> > cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
> > that every variant board includes. We do this because the
> > keyboard-controller node also provides some buttons like the power
> > button and volume buttons. Unfortunately, this means we register a
> > keyboard input device that doesn't do anything on boards with a
> > detachable keyboard. Let's delete the rows/columns properties of the
> > device node to indicate that there isn't a matrix keyboard on these
> > boards.
> >
> > Cc: Benson Leung <bleung@chromium.org>
> > Cc: Guenter Roeck <groeck@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 5 +++++
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 5 +++++
> >  2 files changed, 10 insertions(+)
>
> Presumably we need to do this same thing for wormdingler [1]
>
> [1] https://lore.kernel.org/r/20220426151204.1.Id2821de5fde55ebe928e8fc87a71c8d535edb383@changeid
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Do we need to delay landing this patch for a release? I haven't tested
myself, but from re-reading through the code it looks as if
cros_ec_keyb_register_matrix() will return an error code if we have
the device tree patch _without_ commit 4352e23a7ff2 ("Input:
cros-ec-keyb - only register keyboard if rows/columns exist"). That
will cause it to skip registering the buttons/switches, right?

-Doug
