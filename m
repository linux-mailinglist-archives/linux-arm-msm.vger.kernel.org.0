Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9CC28EE0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 09:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgJOH7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 03:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730071AbgJOH7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 03:59:55 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22F9C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 00:59:53 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r4so3228049ioh.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3iwCAX5npGCg/zxSeU8NRUPXRIk3oCwTQT9lW7fSAek=;
        b=fZ9DK/wR5Q8YUrG20w9OUQzsdTlEfyeuToJdEqyFacXEV+lBftlXXjjyjCS6wZQwgc
         /01SjIDNc3HRCZR4tg5qJk4JRwXrj1G9lNss5cENSApQhRF3wC4xi0uYfZf1fudpG1AO
         oPJ1f/J6kf3roUEQk65x9Y1TpOfzGc5A1/1OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3iwCAX5npGCg/zxSeU8NRUPXRIk3oCwTQT9lW7fSAek=;
        b=h8uZpYyTnm+BN19ZZZqvPN2/1uXQluxMoulmY5cE/3TZ+Ato1tp6KS+/e/qL3pW1P6
         LMfx/VAP1i9HAp8UTJhdhABMTEPPofV4ZN7yD+BauHsawG7qDpBtI7iu2Ej4mLZ5qlz6
         jI33RXLBJ+zlMpJwDZdqGzkVxlU7JJeWNOjY1kODXTRGAk2ngAVUl2XGCdD0d7z/jUyc
         FEmwDvfWCdlsuNSPzul5hDAVo3/E4KLkb/1UUrvHiB/p6mc95vE22El96b+ihpClEHQS
         R89IDdLhSQ+azryazPWeyve3rhkKCwtBtvbMdCxsKzLT7nAdqTjJpPw5b3sU9HesS4rG
         6WyQ==
X-Gm-Message-State: AOAM531VDOET699fQYExNdko+apAs4eDSQOUHRD8l/XdLFRUpeD/wX2i
        owYxyo6a1HaDxOoGfDCT0Bk+rEjP90ojXPEl4nSUqg==
X-Google-Smtp-Source: ABdhPJxlbvqYnJWRiXtnH0q6kkDHMhsE5tUaF2RfBz9uwNRW1GQ7jLgiIgRHtQF+Fj5YaIUFSB0mJZezBcOKtKdorcI=
X-Received: by 2002:a02:b617:: with SMTP id h23mr2508854jam.71.1602748792641;
 Thu, 15 Oct 2020 00:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org> <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
In-Reply-To: <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Thu, 15 Oct 2020 15:59:26 +0800
Message-ID: <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
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
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Hi Cheng,
>
> Sorry for such late review w.r.t compatibles,
>
Hi Srini,
Thank you for taking another look!

> On 14/09/2020 09:06, Cheng-Yi Chiang wrote:
> > +---
> > +$id:http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > +$schema:http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > +
> > +maintainers:
> > +  - Rohit kumar<rohitkr@codeaurora.org>
> > +  - Cheng-Yi Chiang<cychiang@chromium.org>
> > +
> > +description:
> > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
>
> This information can come from the dai link description itself, why
> should compatible string have this information?


I think dailink description is not enough to specify everything
machine driver needs to know.
E.g. there is a variation where there are front mic and rear mic. We
need to tell the machine driver about it so
it can create proper widget, route, and controls.
The codec combination also matters. There will be a variation where
rt5682 is replaced with adau7002 for dmic.
Although machine driver can derive some information by looking at dailink,
I think specifying it explicitly in the compatible string is easier to
tell what machine driver should do, e.g.
setting PLL related to rt5682 or not.

>
> Can't we have better compatible string with actual board name or use the
> same compatible name as used by other boards?
>
>
> Can you give us some details on the advantages of doing this way?


Machine driver can easily tell what is expected when it sees the
compatible string (or model property, as you suggested below).
E.g. in 1-mic v.s. 2-mic case, the patch by Ajye Huang:

"[v1,2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic"

You can see widget, route, controls are used according to the configuration.
The alternative approach is to check whether "dmic-gpio" property
exists to decide adding these stuff or not.
But it makes the intent less easier to understand.


>
> Or am I missing something?
>
> AFAIU, you should add proper board name / model name to the compatible
> string rather than describe how its connected. Connection is already
> part of dai link definition.
>
> On the other hand model property can include variant information.
> This can also be used to set card long name which will help in UCM2.
>
>
> The reason I had to bring this up is because the use-space (ucm in this
> case) will not be in a position to differentiate between different board
> variants to select correct mixer controls, so its going to be a pain!


I think your suggestions makes sense since we need to consider UCM.
Having the card with the same name doing different things will be
confusing to user (and to UCM).
I'll follow your suggestion to use the same compatible string, and put
the board variation information in card name using model property.
Thanks a lot for the great help!


>
>
>
> Thanks,
> srini
