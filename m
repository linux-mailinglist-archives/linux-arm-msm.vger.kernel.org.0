Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078B74E6A9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 23:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355345AbiCXWZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 18:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355333AbiCXWZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 18:25:29 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056AE2AE30
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:23:57 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bg10so11968926ejb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a6MBbcTTX+22LzDQ6ECr2bIqiwia88/SS+r4U6tgNmU=;
        b=CvOL71164K8S1OKOR/5ZUvKVejQ6sOY5QjWJX0UL0Zhx3WKZh2jNAzhPX6Z3RbeiCK
         1CtOryJHYEtEZFtFzE7ANmMwsbBx35uLSeqzmt/+/QfSGiwGCvj/y7z8eTzi3tIooWQN
         IZI/EFul54Q9URG80JKdNUuBowY2MUYYRAkrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a6MBbcTTX+22LzDQ6ECr2bIqiwia88/SS+r4U6tgNmU=;
        b=w3oJCOMcl7ggl2uLc+EODy8kmpKYcaR78ubGLrpTvrkweqk9a3UxPNQsJoeJPLuhra
         h6cztYobkOtaXKzenOzu1ZsFYdkBKsgpHyLIZE1ZocPN0dYjukkPJijum+Kbh2C+71Q7
         /nS1O4xZfvqbw0f2fhuSpkZ103D3HQ9cT9s/S/jrJmKHH8/FqVpZR3QbYFWc3dfKWxqK
         PFTtDttP5zpJTGXWcWathsw58slNSj/LGnTfG5lwJxaou5A4eUTdV3vN5OGmcGbGsbF+
         eyHuaQj5rw5R0CJWOyBjVcJVpeQpXMrtcJx+6nCdluy2ZFvdwgUGPOSSL+xJ9UOBZFAA
         gFZw==
X-Gm-Message-State: AOAM532WlfBUpWsIqkPCtyi/uoJwDIDoSCKGfVSvPdQSZsr/SbPLoCz1
        t/KwqzqOFX1nnJieu7o50a+g28KWSZQImb/x
X-Google-Smtp-Source: ABdhPJyEIOuelgWqiwImxAfKo1wcR57SCIsXHZfa4wEJFH/iTpK5CZozDXZzdgs1NRbfEazSIpsVeQ==
X-Received: by 2002:a17:907:d04:b0:6db:56be:ef8 with SMTP id gn4-20020a1709070d0400b006db56be0ef8mr8667653ejc.188.1648160634762;
        Thu, 24 Mar 2022 15:23:54 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090657c300b006d01de78926sm1650421ejr.22.2022.03.24.15.23.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 15:23:53 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id w4so8484724wrg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:23:53 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr6363442wrq.342.1648160632993; Thu, 24
 Mar 2022 15:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220324101242.v1.1.Iebdb5af0db7d3d6364cb229a27cd7c668f1063ae@changeid>
 <CAD=FV=XchtJx3ZsL4Bxj29b_-43E8p2fiJ5SBQSzbW8wp+gNfg@mail.gmail.com> <YjzsqyEhxOLwJzUL@google.com>
In-Reply-To: <YjzsqyEhxOLwJzUL@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Mar 2022 15:23:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W45wydNfUc1vAx228_yQrE6uzyucBhT6sc5_iqktva=A@mail.gmail.com>
Message-ID: <CAD=FV=W45wydNfUc1vAx228_yQrE6uzyucBhT6sc5_iqktva=A@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add device tree for
 herobrine villager
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Thu, Mar 24, 2022 at 3:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Mar 24, 2022 at 12:59:51PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Mar 24, 2022 at 10:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > Add a basic device tree for the herobrine villager board.
> > >
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > >
> > >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >  .../dts/qcom/sc7280-herobrine-villager-r0.dts | 274 ++++++++++++++++++
> > >  2 files changed, 275 insertions(+)
> >
> > Question: how does this interact with the patch:
> >
> > https://lore.kernel.org/r/20220316172814.v1.3.Iad21bd53f3ac14956b8dbbf3825fc7ab29abdf97@changeid/
> >
> > Specifically, if that patch lands first don't you need to add a patch
> > to turn on "pp3300_codec" ?
>
> Right, I missed that. I'll add it in the next version, thanks!

Great! Make sure to list that other patch as a dependency somewhere
too to help Bjorn when he's able to apply. ;-)


> > I was also looking at whether we should be enabling the wf_cam
> > regulators for villager. I believe that answer is "no",
>
> I agree to keep them disabled.
>
> > but _also_ I believe that we should be _disabling_ the uf_cam
> > regulators for villager, right?
>
> it is not clear yo me which regulator you have in mind for the UF cam,
> could you clarify?

I was thinking of the ones next to the rainbows and unicorns in the
device tree. Oh wait, those were just in my imagination. Please
disregard.

-Doug
