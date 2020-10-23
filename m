Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6B1296AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 09:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S376025AbgJWH4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 03:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S376021AbgJWH4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 03:56:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F77C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 00:56:03 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g12so692207wrp.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/SNcQNTo06eYbWggxW6UOAFjPQ1H0tu2qDw1XijNeRw=;
        b=CVl+ZUvJNSTelmJgD2DdCIA/kwY4nJMHESm/5iLIkcQJXVj2rijeq3MuB8Zsz5zx/T
         VahW0LE5kLAYZmr0iD9M7kSzSNf/C93dJqTZt/+xXU4TukOpH/8L/GuA/HXY6OnHfGZh
         m3QSbS6iZXqxC4LY9xvfNEs5aWu6Bio7vR7eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/SNcQNTo06eYbWggxW6UOAFjPQ1H0tu2qDw1XijNeRw=;
        b=ZzAwBGSwgbZP0OIkxbccrS/lYQw9X1s5MJW+PeGJQyATOtr+r8wxCw4wPERbPKZ+Oo
         nyt+lZjhA7lQZYLtepH2CZ+ti5Y/3q0QhBPDwYOXVhkKwtxX/osXsUr4DaplT6NqErBc
         ts5LfNgxPT5u62XMEoGBkApXzLqo4PeUR1ZF3Brz92x8b1n5AkJgtHxwjjtHHNCOCUZ2
         tqEys12gkSxTfX3saMIpwi7rxNYfTOz1VBBZZjWZSV0O5l0rRfT/yHepL40kzXvnbumw
         WTEAM1l3/4s5u2qut3Mxtzo4I0CL/F1M675fIaCZ0uNQWs10AhuCQTpM0e1fHtrK5Vk0
         +VHw==
X-Gm-Message-State: AOAM530/ZorYmLOreIXn97BBUxRn3Ln+TdmbsAZwkFJjstuRsja9LcSU
        5r3fynBmbFRe0cnR0/e/I5FDSF90szAo/lU02cIm1w==
X-Google-Smtp-Source: ABdhPJxZFORJ4Tr+SkfBVztLuJ/zgKr93fxZsXD5FewSFQ1f0hvr0ngms9GSLXN0Q5h10kUYApcqSbjs7tAIZIGMzGg=
X-Received: by 2002:adf:f78d:: with SMTP id q13mr1183396wrp.258.1603439761801;
 Fri, 23 Oct 2020 00:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org> <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk> <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk> <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org> <20201021123913.GD4497@sirena.org.uk>
 <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com> <14e7db29-4825-6e9d-22a0-5121bb7006e2@linaro.org>
In-Reply-To: <14e7db29-4825-6e9d-22a0-5121bb7006e2@linaro.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Fri, 23 Oct 2020 15:55:35 +0800
Message-ID: <CAFv8Nw+zigiF0cbuk8t+4inf_X6twh+2zyyXchRTXASM4V_xBQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        Mark Brown <broonie@kernel.org>,
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
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        xuyuqing@huaqin.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for resending this mail.
I forgot to use plain text mode in the previous mail.
On Thu, Oct 22, 2020 at 6:12 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 22/10/2020 04:29, Tzung-Bi Shih wrote:
> > Hi, sorry for jumping into your discussion but I am trying to
> > summarize them to make sure we are on the same page.  Pardon me to
> > manually copy-and-paste partial sentences to quote.
> >
> > ACK:
> > - Don't expose DAI connections in compatible strings.
> > - Use "model" DT property to make the card more UCM2-friendly.
> > - Expose new DT properties to distinguish different DMIC models.
> >
> > NACK:
> > - All the board variations using exactly the same compatible string.
> > => This is less realistic.  Although the CODECS information can be
> > retrieved from DT, it is inevitable to have some custom code for each
> > CODEC.
> >
> > Per Mark's words:
> >> a different CODEC is something that often justifies a separate compatible
> > I think we should use different compatible strings for new CODECS
> > combinations.  And we should try to reuse the machine driver if they
> > share the most code.  In the worst case, introduce a new machine
> > driver for the new CODECS combinations.
> >
> > - Srinivas's suggestion to set driver_name.
> > e.g. card->driver_name = "SM8250";
> > => This sounds like a new DT property should be parsed in
> > sound/soc/qcom/common.c.  For example: "qcom,family"?  But as we do
> > less care about UCM2 for now, I would prefer to just leave it as is.
> >
> No, you can just hardcode this driver_name in your machine driver rather
> than getting it from DT, this is how everyone does!.
> So need of adding anything to common.c
>
ACK
> The thing that I suggested to add to common.c is setting card->long_name
> from "model" property.
>

NACK
I found that I don't need to set card->long_name in common.c because
soc-core.c already sets longname using card->name if
card->long_name is NULL.

        soc_setup_card_name(card->snd_card->longname,
                            card->long_name, card->name, 0);

So we can leave common.c as it is and still get long name.

> >
> > I would expect the following variants in DTS (just for example):
> >
> > sound {
> >    compatible = "qcom,sc7180-trogdor";
> Make sure that vendor name is correct here, am not sure if trogdor is
> qcom board or Google own board!
ACK
I should use "google,sc7180-trogdor" because google is the vendor.
>
> >    model = "sc7180-rt5682-max98357a-1mic";
> > }
> >
> > sound {
> >    compatible = "qcom,sc7180-trogdor";
> >    model = "sc7180-rt5682-max98357a-2mic";
> >    dmic-gpio = ...
> > }
> >
> > sound {
> >    compatible = "qcom,sc7180-pompom";
> >    model = "sc7180-adau7002-max98357a";
> > }
> >
> >
> > Please correct me if there is any misunderstanding.
>
> Looks good to me!
> thanks for doing this!
Thank you. I will collect the discussion result to send a v12, and
sync with variant board partners to submit following machine driver
changes.
We will make sure future projects follow this approach
>
> --srini
> >
