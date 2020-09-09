Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94240262BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 11:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgIIJYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 05:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIIJYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 05:24:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B442C061755
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 02:24:11 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so1569343wmi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmAjr6xvyauDkIBPHoJreMuavbYPMqoWr9WPQMiNPkg=;
        b=lgk3l2QheCZRIdB/DXYePwXEoUJvYOIpV83Gh1pRZ2BYhkcAj5c3ogzbaLtFuFI9ts
         jpGHnH6HqqegvOnM9Uqug7F1IJiuwk+eek3yWSn2ufF9Y+cYzVYdiFc0zs3ZtTMRf5cM
         XT5LclUiUzG/7eZUxr9lBGgyThOWt8HJEhlvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmAjr6xvyauDkIBPHoJreMuavbYPMqoWr9WPQMiNPkg=;
        b=s1wMXrVfZOmnYBOrBldj3I9eT7cNU1cFMwzzQaqHTVCd+xY0niI9uNGXKmlPgJCAde
         I3mVZwVTBVesDYXJ5eOb3ffBKrl/y6arM035v7SsqInR5JMcu3AYl0iBZqVZJR5PBnhV
         P/IS4L2MsJJPgZt6H6EUQc/WbwXenhVTXIENycMtapHyxv9n95zFK/85em5uoRHMgMZP
         oBTY0xwdHbNmHqAljOMGj42ZYJK6rqDk5VR5C74Ax7GBMw3dmsEAH5CFhUhxHVWXD/Ax
         9Zpx0xsg7Xr+pScTi1jpOTgpDjhxElwxXSM08cggsKF2maskIq7FuqiGS/aBWFMko65C
         j4FQ==
X-Gm-Message-State: AOAM533ptnldx5iu2wo84wsqmDhGs1v6vgCrE/ltXD57Y/8paoiE5hgF
        NQXam6Ay7HMk7nayR2p0lCXRxcKgl0/q0SP40keVyA==
X-Google-Smtp-Source: ABdhPJyCFk+9azkQozj50ygO4Fld+/Ww0XhKIzoSM/wUVfsy/tdWyDVDQ6WSJk0DhWTK8YoZzQXF1zAmuO+KS+gPPFU=
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr2599038wmj.101.1599643450162;
 Wed, 09 Sep 2020 02:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org> <20200908203357.GA861143@bogus>
In-Reply-To: <20200908203357.GA861143@bogus>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Wed, 9 Sep 2020 17:23:43 +0800
Message-ID: <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 9, 2020 at 4:34 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..ae809346ca80
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,143 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > +
> > +maintainers:
> > +  - Rohit kumar <rohitkr@codeaurora.org>
> > +  - Cheng-Yi Chiang <cychiang@chromium.org>
> > +
> > +description:
> > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sc7180-sndcard
> > +
> > +  audio-routing:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      A list of the connections between audio components. Each entry is a
> > +      pair of strings, the first being the connection's sink, the second
> > +      being the connection's source.
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  headset-jack:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the codec for headset detection
> > +
> > +  hdmi-jack:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the codec for hdmi jack detection
>
> You already have links to these devices. Why duplicate it here?
>
> What if you had 2 headsets? This doesn't scale.
>
Hi Rob, thanks for reviewing.
There was some discussion in
https://patchwork.kernel.org/patch/11737905/#23571643 about how to
specify the dailink that has a headset jack.
I would like to pass the information of headset jack and hdmi jack to
the machine driver so the machine driver can call
snd_soc_component_set_jack to set jack when init the corresponding link.
Headset jack and hdmi jack will be treated differently for button and
event type.
Because of this, we can not just set a property "jack" in the link.

As for the 2 headsets case (I guess you mean hp jack and mic jack), on
this board we will not have this use case.
If someone really wants to build hp jack and mic jack on the board
based on this machine driver, we can add two more property hp-jack and
mic-jack to specify that,
as the machine driver will need to know the different jack types
anyway. What do you think ?

Or could you please suggest a proper way to pass such information ?

Thanks!
>
> Rob
