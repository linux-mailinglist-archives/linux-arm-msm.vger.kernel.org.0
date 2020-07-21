Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834DD227EEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 13:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgGULaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 07:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgGULaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 07:30:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4AAC0619D8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 04:30:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z15so20817823wrl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 04:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDCzyRG0rg1IT+D0XJL6mCguANQqA8rXobavVZvW96Y=;
        b=ZnnrxRa4si/xuCUdSQINme4yglZDejh1OO0DnrcmRn5h18itVyWY4KRvRkI/WNZ/Ll
         E/VPLadw2MbujNKNCVgXWitzmPWRAKdk5XTCel3V5qpcX6FGrqmGTmm4p15DMboso/NS
         FV4C1to8Pfy/qNsRbWTocSYQZzf6KtgCql62o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDCzyRG0rg1IT+D0XJL6mCguANQqA8rXobavVZvW96Y=;
        b=eStwlwoXPYYkUi/+qgl1RtqjFL4QfYpMXn7BZ+uAs6SlQnIjOM/qRLqY0U+GHRqUkj
         XDNhhublOH71HcOFe1JWt8JnnBZgF5qBdvk0oJPFIqqR1BaP4Y2kM++nPJU4mB3b07UK
         nLrhPHzyPxjHa9Mj0kxky9Wqushxq4ywLP5rOTSSxTNT6D8ptfrMqeOgQqZqngl/KueV
         ZI+Vcqy/RdB+lFW6I9KHMoW1w8yF/7MUZ/tgazex3D6939KqGJXCJLu4z08lEQG7o7zt
         /tby3Yp65fYtAntfRDV2xLyJ2T5RDVSt1trpFPv/PAOJAjlrjLIYy88nZLhFd97yo0sN
         00Bw==
X-Gm-Message-State: AOAM533HotQGUkBuUd5/PliRnGBzSH3bYl60XBJrkJDRvY5OBXln2hiv
        GGSSVpDqbUFt8+W6/V1kKk7nMlCSDFRi4+KHXKL9hg==
X-Google-Smtp-Source: ABdhPJwbrVnmzJ0PnXN6sJ8jR7GyGTkbutQcRFVK+AheZaDBzYwZNbSJrjKJ1Gle1sfdgNlgwcpeGqJ0VnvJV9KH3Mw=
X-Received: by 2002:a05:6000:1209:: with SMTP id e9mr12809989wrx.404.1595331021943;
 Tue, 21 Jul 2020 04:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200717120207.3471030-1-cychiang@chromium.org> <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Tue, 21 Jul 2020 19:29:55 +0800
Message-ID: <CAFv8NwLpVCy4CY8_h0qd7aAEPmaKa3gQYmA3sT1b9fs6fxwtLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Doug Anderson <dianders@chromium.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 17, 2020 at 11:03 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>

Thanks for the review!

> On Fri, Jul 17, 2020 at 5:02 AM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
>
> A bit of a mechanical review since my audio knowledge is not strong.
>
>
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..d60d2880d991
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,123 @@
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
> > +description: |
> > +  This binding describes the SC7180 sound card, which uses LPASS for audio.
>
> nit: you don't need the pipe at the end of the "description" line.
> That means that newlines are important and you don't need it.
>
>
Thanks for the explanation. Fixed in v2.
> > +definitions:
>
> I haven't yet seen much yaml using definitions like this.  It feels
> like overkill for some of these properties, especially ones that are
> only ever used once in the "properties:" section and are/or are really
> simple.
>
>
ACK. In v2 I only kept dai definition and removed others.

> > +  link-name:
> > +    description: Indicates dai-link name and PCM stream name.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    maxItems: 1
> > +
> > +  dai:
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        maxItems: 1
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: phandle array of the codec or CPU DAI
> > +
> > +    required:
> > +      - sound-dai
> > +
> > +  unidirectional:
> > +    description: Specify direction of unidirectional dai link.
> > +                 0 for playback only. 1 for capture only.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> So if the property isn't there then it's _not_ unidirectional and if
> it is there then this specifies the direction, right?  I almost wonder
> if this should just be two boolean properties, like:
>
> playback-only;
> capture-only;
>
> ...but I guess I'd leave it to Rob and/or Mark to say what they liked
> better.  In any case if you keep it how you have it then you should
> use yaml to force it to be either 0 or 1 if present.
>
>
ACK
Use playback-only and capture-only in v2 instead.

> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      enum:
> > +        - qcom,sc7180-sndcard
>
> Just:
>
> properties:
>   compatible:
>     const: qcom,sc7180-sndcard
>
>

Fixed in v2.

>
> > +  audio-routing:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |-
> > +      A list of the connections between audio components. Each entry is a
> > +      pair of strings, the first being the connection's sink, the second
> > +      being the connection's source.
>
> You don't need the "|-" after the "description:".  That says newlines
> are important but strip the newline from the end.
>
Fixed in v2.
>
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +patternProperties:
> > +  "^dai-link-[0-9]+$":
> > +    description: |
> > +      Each subnode represents a dai link. Subnodes of each dai links would be
> > +      cpu/codec dais.
>
> From looking at "simple-card.yaml", I'm gonna guess that instead of
> encoding the link number in the name of the node that you should
> actually use a unit address and a reg in the subnodes.

Thanks for the explanation. Fixed in v2.
I think this naming is better, although there is no usage in the
machine driver for the reg.

>
> ...also, again your description doesn't need the "|" at the end.
> Maybe <https://yaml-multiline.info/> will be useful to you?
>
>

Thanks for the explanation and the pointer!

> > +    type: object
> > +
> > +    properties:
> > +      link-name:
> > +        $ref: "#/definitions/link-name"
> > +
> > +      unidirectional:
> > +        $ref: "#/definitions/unidirectional"
> > +
> > +      cpu:
> > +        $ref: "#/definitions/dai"
> > +
> > +      codec:
> > +        $ref: "#/definitions/dai"
> > +
> > +    required:
> > +      - link-name
> > +      - cpu
> > +      - codec
> > +
> > +    additionalProperties: false
> > +
> > +examples:
> > +
> > +  - |
> > +    snd {
>
> Can you use the full node name "sound" here?
>
>
Fixed in v2.
> > +        compatible = "qcom,sc7180-sndcard";
> > +        model = "sc7180-snd-card";
> > +
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&sec_mi2s_active &sec_mi2s_dout_active
> > +                     &sec_mi2s_ws_active &pri_mi2s_active
> > +                     &pri_mi2s_dout_active &pri_mi2s_ws_active
> > +                     &pri_mi2s_din_active &pri_mi2s_mclk_active>;
>
> I think pinctrl is usually not in the dt examples.
>
Fixed in v2.

> ...also, shouldn't the mi2s pinctrl be in the i2s nodes, not in the
> overall sound node?

Yes. Thanks for pointing this out. Fixed in dts file in chromium.

>
>
> > +        audio-routing =
> > +                    "Headphone Jack", "HPOL",
> > +                    "Headphone Jack", "HPOR";
> > +
> > +        dai-link-0 {
> > +            link-name = "MultiMedia0";
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 0>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&alc5682 0>;
> > +            };
> > +        };
> > +
> > +        dai-link-1 {
> > +            link-name = "MultiMedia1";
> > +            unidirectional = <0>;
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 1>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&max98357a>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.28.0.rc0.105.gf9edc3c819-goog
> >
