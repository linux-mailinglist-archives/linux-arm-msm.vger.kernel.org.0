Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77892647B99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 02:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiLIBtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 20:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbiLIBtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 20:49:42 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8197C93A53
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 17:49:41 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id m18so8228219eji.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 17:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RcPX19iE4ZPsiS8IQ6h41NUvkyatGMpNna0NP2xQakM=;
        b=i9bX128UhVLTaG/dxgJBSM/szOgTYQe2JbJxN3Za4RwvEFB9KoCXNLYR9RowE1l4+8
         Sksm+2iQ/JPHcOW/XGMYUG277AIyVztwycchl0XFSUj/uZOcPqFfpgfPHS1YgSy4sjqI
         vbrBrqRPrbO+qk02AlBQBiG6GnMRbhU9SowvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcPX19iE4ZPsiS8IQ6h41NUvkyatGMpNna0NP2xQakM=;
        b=UXN+uKctf3ctcTrVMihz5DD+XKmE4nXEid9dG5gGpFMADlP5TNJwMBUr9qgGXRnMG6
         /YawQMX4eqn2+4tRwvQzwo0opOvOVO3vGkjJDRoInxDrLYM4kR1YLXq/uwJVbvaUO/qy
         0kaqjVISCsFQv62aWK3YEWTPOqsvDy8czUDkzk92mDSU6Js0JMFFLRMuhEL5lyNaIpWs
         Je3eUp4oqvvgSp1mAb0kZaw/9yOgVtjJgFsLzUkUHLSzOfneixbH+Z09Uym7Ub7Az5gx
         MAwE8Tndmghn+1dAhl0/il5hocAIeAFH3eRk6uDOvNKjh1Q7GL0U7RAEFZ5zXO+zjon6
         HRDQ==
X-Gm-Message-State: ANoB5pmbT1qmousEl5LECXisJMpgldMA7aYv18vRWhpuFUZpsG4Kh+ua
        IFRCtfM8HjUb35FZTIm530kjWBzQ1tArvJnPjTo=
X-Google-Smtp-Source: AA0mqf5zKrp8dONyAfIm3vH4yxYoL88/nd7SNksHvleIPgAUhOls9bo0kzekx9fMv9k/848p0B0KAA==
X-Received: by 2002:a17:906:6a18:b0:7b2:a54b:53fe with SMTP id qw24-20020a1709066a1800b007b2a54b53femr5802518ejc.65.1670550579923;
        Thu, 08 Dec 2022 17:49:39 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906824a00b007af0f0d2249sm21200ejx.52.2022.12.08.17.49.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 17:49:38 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id q7so3765002wrr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 17:49:38 -0800 (PST)
X-Received: by 2002:a5d:6409:0:b0:241:f7ae:b1dd with SMTP id
 z9-20020a5d6409000000b00241f7aeb1ddmr41090792wru.138.1670550578308; Thu, 08
 Dec 2022 17:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20221208192006.1070898-1-dianders@chromium.org>
 <20221208111910.5.I6edfb3f459662c041563a54e5b7df727c27caaba@changeid>
 <Y5KRlNvoVo6ZWV24@google.com> <Y5KT8EXRC/i+lBRe@google.com>
In-Reply-To: <Y5KT8EXRC/i+lBRe@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Dec 2022 17:49:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vtar2gGyeKdzttGZyUCMJOFd70EWqkbx3iL2rMTHN1ig@mail.gmail.com>
Message-ID: <CAD=FV=Vtar2gGyeKdzttGZyUCMJOFd70EWqkbx3iL2rMTHN1ig@mail.gmail.com>
Subject: Re: [PATCH 5/5] Input: elants_i2c: Delay longer with reset asserted
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>, mka@chromium.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 8, 2022 at 5:48 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Dec 08, 2022 at 05:38:28PM -0800, Dmitry Torokhov wrote:
> > On Thu, Dec 08, 2022 at 11:20:06AM -0800, Douglas Anderson wrote:
> > > The elan touchscreen datasheet says that the reset GPIO only needs to
> > > be asserted for 500us in order to reset the regulator. The problem is
> > > that some boards need a level shifter between the signals on the GPIO
> > > controller and the signals on the touchscreen. All of these extra
> > > components on the line can slow the transition of the signals. On one
> > > board, we measured the reset line and saw that it took almost 1.8ms to
> > > go low. Even after we bumped up the "drive strength" of the signal
> > > from the default 2mA to 8mA we still saw it take 421us for the signal
> > > to go low.
> > >
> > > In order to account for this we let's lengthen the amount of time that
> > > we keep the reset asserted. Let's bump it up from 500us to 5000us.
> > > That's still a relatively short amount of time and is much safer.
> > >
> > > It should be noted that this fixes real problems. Case in point:
> > > 1. The touchscreen power rail may be shared with another device (like
> > >    an eDP panel). That means that at probe time power might already be
> > >    on.
> > > 2. In probe we grab the reset GPIO and assert it (make it low).
> > > 3. We turn on power (a noop since it was already on).
> > > 4. We wait 500us.
> > > 5. We deassert the reset GPIO.
> > >
> > > With the above case and only a 500us delay we saw only a partial reset
> > > asserted, which is bad. Giving it 5ms is overkill but feels safer in
> > > case someone else has a different level shifter setup.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Applied, thank you.
>
> Unapplied ;) I guess we should follow kernel test robot's advise and
> switch to using usleep_range().

Crud. I'll send a v2 right away.

-Doug
