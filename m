Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C2B29428B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 20:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437864AbgJTSzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 14:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437854AbgJTSzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 14:55:15 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0708BC0613CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:55:14 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n18so3529310wrs.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mScZ8ah2UgtXD/hHaoKN6/WZjy3yp0sHiaOHV6wLFW8=;
        b=kC1bm7nzh6+1h/Q0nN45KdnVbW/OI5uUooOLQ2Vs/LpFzRvJnYRUV+JwP0kcW7T4QR
         41jNfWJ2Z9lO48O89PVVflQTzDH60CTncg14/nyfU9FIEeibQS8Vrf68eqVidtcHz3vp
         3lByNPbOMsEb9+VEVy4e6EqFieABTbe7vnr3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mScZ8ah2UgtXD/hHaoKN6/WZjy3yp0sHiaOHV6wLFW8=;
        b=qnppVkYf0wKEnTwUEthR32oYrxnlSb/m7j+gn7qslT124UUv9JO9qwe+uQkLfIq7Od
         Pvd5zcLYO2lEv0A6In87CCSj/nN4vAw2GqTyjz/QW+FPB1EV5H3oyhVIyVV7RT0LAwX7
         kxNpAk6aQXpUV7FJJh3wrnouLwXFHzh8IAmZiqqKSK0iOUvaW/Fgncz9IJhm+Jr/zrJ5
         QXKHA+m5WIYgGyUWVBpHQjNFEy14OPwhMVypeQ+36Av/FxHVHWfRPsN2Bxcv2dYX+NCG
         9XJzeDXhvCbEd2IXxfVOYGYhZTssnZW7KppqDmz5TeMK7bTA52njuLkDUj0YVU5fsinY
         5PRQ==
X-Gm-Message-State: AOAM532CFAwHMOFocuMVQ2OA0AIFNY+xBg705CCdoxsDNRSoG2k84Bxa
        JZ95ZdbS7HmWbYmdthDT55mYmxTZbC5NeMNG15uAwg==
X-Google-Smtp-Source: ABdhPJxsMtKaYZKishW1LFkqqTjFYaAFJFl/nN/EX/ADY7U9joK0FSO7QV5LU0tzsLkN7u78bKqbrTQK/Z5k/u4nUP8=
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr5023373wrs.404.1603220112425;
 Tue, 20 Oct 2020 11:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org> <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk> <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk> <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
In-Reply-To: <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Wed, 21 Oct 2020 02:54:43 +0800
Message-ID: <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 10:55 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/10/2020 15:37, Mark Brown wrote:
> > I don't understand what "logic scattered in various dtsi files" means,
> > sorry.
> >
> >> Yes, that should work to describe the dailink we are using.
> >> But a more tricky issue is how to do calls like setting PLL in dai startup ops.
> > ...
> >
> >> I think that asking a generic machine driver to do configuration like
> >> this with only a limited interface of device property
> >> might be too much of an ask for the machine driver.
> > Richard was looking at some basic configuration for PLLs.
> >
> >> Would you mind if I simplify the compatible string like Srinivas
> >> suggested, and send a v12?
> >> As for other two kinds of variations that I am aware of:
> >> 1. front mic / rear mic
> >> 2. replace alc5682 with adau7002
> > The CODEC change is going to be described in the DT no matter what -
> > you'll have a reference to the CODEC node but it may make sense if
> > there's enough custom code around it.  For front vs rear mic the
> > simplest thing would just be to not mention which if this is a hardware
> > fixed thing, otherwise a control.
> >
> >> We can set different board names and different compatible strings to
> >> achieve such variation.
> >> So that it would make sense to describe configuration in compatible
> >> strings like you suggested, and also provides UCM a way to distinguish
> >> different boards.
> > I don't recall having suggested distinguishing these things with a
> > compatible string, especially not the microphones.  UCM can already use
> > the display names for the boards to distinguish things.
>
>
> Not with the compatible string!
>
> Currently card name, and long name are exactly same in all Qualcomm
> soundcards, which makes it very difficult to identify how those boards
> re wired up at UCM2 level. So the plan is to properly populate card long
> name with "model" property which can include details on how things are
> wiredup on that board.
>
> --srini

Hi Srini,
Thanks for taking a look.
Let me try to clarify your comments in case there is any misunderstanding.

I understand your request on having different board variations using
different sound card names through model property, and I totally agree
with that.
As for compatible strings, do you insist on having all the board
variations using exactly the same compatible string ?

Thanks!
