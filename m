Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7116B647C3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 03:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiLICYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 21:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiLICYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 21:24:52 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9DD24095
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 18:24:50 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id b2so8343286eja.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 18:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4qFK1QDJPkTIwpWZG6Rx/ljfUqchSwsNBXmGwOGqlPM=;
        b=ocYuarVxCAXTUNt6oWZOVE+6Q7OU9LrWzOKIzVDQU5Pl4NBt3Ye0/9t5n5vcaCKPcm
         P4pXeCeaIMztFmrbnBBoP+KUegUYhdpGq/QXB3Ay6GqppsU9QboHJCeOhfoMTmofc6GR
         JwUteNRP6zVHTP1Dz8TN03VwBrEPzfrwErXEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qFK1QDJPkTIwpWZG6Rx/ljfUqchSwsNBXmGwOGqlPM=;
        b=thqa/wtAa1QxjgCtPGjLyk1JcyJSE42Oz4fjQu0GK2S8GdazpTuORs5ZHICZKGrDGW
         FLApcARYR8eMB4BWi0S2Y+afdRLUhzK87fvVRNlrgBnQVsjCidoi9REXbYvLRa0e7SPE
         5N6nkAqtnLuH2//lx2yKU7sVRftD/7OES0H1+qUQ0lytVFSLbRCwVGf0MCm4d5Iqo3LY
         WqcNyRC8qz9KtAxR6QnkiBtTnTHRZr4Y5WAn75hujSh36NI1dYNZxP1+Mn+1wOtRcgEY
         A/d7OJJjawoHzgwt/oI/DlBsDxfCHEkkUY7WTWgzU2L95OsNcsLo15L7uih9GNuSIr1e
         QbQg==
X-Gm-Message-State: ANoB5pnsgUQqIqxt4vVbR6CNInrCNE1h1bqkrfeUQgGm0W8sxEPCuB9e
        eII+ZVy98O8Nzh6So3If2XI0JUihxTGEdEOVbR4=
X-Google-Smtp-Source: AA0mqf7SiGKE6sEHj5CBYmNfxMJyCo+Mz5yrfxgPvoeoAocZwztOeMPmhla7+CQ85d/m5OP132jalA==
X-Received: by 2002:a17:907:961c:b0:7ab:986b:37b3 with SMTP id gb28-20020a170907961c00b007ab986b37b3mr5437412ejc.13.1670552688904;
        Thu, 08 Dec 2022 18:24:48 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id oz18-20020a170906cd1200b007c11f2a3b3dsm34010ejb.107.2022.12.08.18.24.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 18:24:48 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id w15so3812167wrl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 18:24:48 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr26209589wrr.617.1670552688121; Thu, 08
 Dec 2022 18:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20221209020612.1303267-1-dianders@chromium.org>
 <20221208180603.v2.5.I6edfb3f459662c041563a54e5b7df727c27caaba@changeid> <Y5Kbiy4r1wyN5PBD@google.com>
In-Reply-To: <Y5Kbiy4r1wyN5PBD@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Dec 2022 18:24:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V-3js3TfbymYAmZ-ruubv8X74-LsJ0-p8GZp3w3_fK8A@mail.gmail.com>
Message-ID: <CAD=FV=V-3js3TfbymYAmZ-ruubv8X74-LsJ0-p8GZp3w3_fK8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] Input: elants_i2c: Delay longer with reset asserted
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, mka@chromium.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-kernel@vger.kernel.org
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

On Thu, Dec 8, 2022 at 6:21 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Dec 08, 2022 at 06:06:12PM -0800, Douglas Anderson wrote:
> > The elan touchscreen datasheet says that the reset GPIO only needs to
> > be asserted for 500us in order to reset the regulator. The problem is
> > that some boards need a level shifter between the signals on the GPIO
> > controller and the signals on the touchscreen. All of these extra
> > components on the line can slow the transition of the signals. On one
> > board, we measured the reset line and saw that it took almost 1.8ms to
> > go low. Even after we bumped up the "drive strength" of the signal
> > from the default 2mA to 8mA we still saw it take 421us for the signal
> > to go low.
> >
> > In order to account for this let's lengthen the amount of time that we
> > keep the reset asserted. Let's bump it up from 500us to 5000us.
> > That's still a relatively short amount of time and is much safer.
> >
> > It should be noted that this fixes real problems. Case in point:
> > 1. The touchscreen power rail may be shared with another device (like
> >    an eDP panel). That means that at probe time power might already be
> >    on.
> > 2. In probe we grab the reset GPIO and assert it (make it low).
> > 3. We turn on power (a noop since it was already on).
> > 4. We wait 500us.
> > 5. We deassert the reset GPIO.
> >
> > With the above case and only a 500us delay we saw only a partial reset
> > asserted, which is bad. Giving it 5ms is overkill but feels safer in
> > case someone else has a different level shifter setup.
> >
> > Note that bumping up the delay to 5000 means that some configs yell
> > about using udelay(). We'll change to using usleep_range(). We give a
> > small range here because:
> > - This isn't a delay that happens very often so we don't need to worry
> >   about giving a big range to allow for power efficiency.
> > - usleep_range() is known to almost always pick the upper bound and
> >   delay that long and we really don't want to slow down the power on
> >   of the touchscreen that much.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Fix typo in commit message (Matthias)
> > - udelay -> usleep_range (Patches Robot, Dmitry)
> >
> >  drivers/input/touchscreen/elants_i2c.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)

Ah, right. I posted it against the Qualcomm tree which, of course,
doesn't have the previous patch I posted to this driver. Thanks for
fixing it up. :-)
