Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7168223F27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 17:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgGQPJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 11:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgGQPJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 11:09:41 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E541EC0619D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 08:09:40 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id q198so9035755qka.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Aj8c3ItAShnnsLNIQ3E8MXZ0tu8sMgycVZ8H2IhzgY=;
        b=YooeeixG0/jkhNIRHh3/Ok41dsT/OX3z2lbp1dsvYYWgOvjgGAeQzWt4/nwPKnz3Mv
         uXq028FmcWMT8/xVvpnT5J5b/dVVSVDK5eofaCaIcodv7fnB3wrg/uKVe0+25lcrLv/3
         WamTri+dPxncC4RrX/4vmXrs97xe8dnN1V6/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Aj8c3ItAShnnsLNIQ3E8MXZ0tu8sMgycVZ8H2IhzgY=;
        b=tq8CRODehpEFRxIGaH2WRMlzNbsH4H7eytkSRvxsjoklG80IMMtBFbfBNq+rJSumws
         oQv8gkSZlrvblqHPKPCRCS4AymTJmgc001vuSbxrUQwcT7G0f4pAO24bAe7tYvzZS3ob
         l2nDt87/RR8tnV0Q0BGaNZ4eulxqy4e5Slo9vGMdJVYJKkG1vVjSyYm594c7bFCtOBfb
         wCJcYB92lX6HJaBSoqrAYfgU33XOLSkxJgY1qfokDoc0CmvJ66pIp+2/UZonbuZMKzWo
         X0XAgut8r4LzM4WuGc1TM7rDz0fsxZYSVwggzbNHs50D74yiwCgPIlSxzAqylkT8ZCpi
         bMig==
X-Gm-Message-State: AOAM531HUF7nfsxULyGWrGgt/yZHi4MeuQdsy6NNyKPWCUttNU0E0p+n
        6OFKkRbSfBZJkNOZFw2q+bwZr1GB2LY=
X-Google-Smtp-Source: ABdhPJwqNFh9IxKZYKIx+DObBCyZ9Mr0txYEe+QZbPwzuwDOsPgLwxpk+FbK1LLlcz78uM+pt8vFBQ==
X-Received: by 2002:a05:620a:20d1:: with SMTP id f17mr1255114qka.428.1594998579913;
        Fri, 17 Jul 2020 08:09:39 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id f203sm10994653qke.135.2020.07.17.08.09.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 08:09:39 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id m8so4363395qvk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 08:09:39 -0700 (PDT)
X-Received: by 2002:a1f:3d4a:: with SMTP id k71mr7624402vka.65.1594998119832;
 Fri, 17 Jul 2020 08:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200717120207.3471030-1-cychiang@chromium.org>
In-Reply-To: <20200717120207.3471030-1-cychiang@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jul 2020 08:01:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
Message-ID: <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
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
        Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 17, 2020 at 5:02 AM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> Add devicetree bindings documentation file for sc7180 sound card.
>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)

A bit of a mechanical review since my audio knowledge is not strong.


>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> new file mode 100644
> index 000000000000..d60d2880d991
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang <cychiang@chromium.org>
> +
> +description: |
> +  This binding describes the SC7180 sound card, which uses LPASS for audio.

nit: you don't need the pipe at the end of the "description" line.
That means that newlines are important and you don't need it.


> +definitions:

I haven't yet seen much yaml using definitions like this.  It feels
like overkill for some of these properties, especially ones that are
only ever used once in the "properties:" section and are/or are really
simple.


> +  link-name:
> +    description: Indicates dai-link name and PCM stream name.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
> +
> +  dai:
> +    type: object
> +    properties:
> +      sound-dai:
> +        maxItems: 1
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: phandle array of the codec or CPU DAI
> +
> +    required:
> +      - sound-dai
> +
> +  unidirectional:
> +    description: Specify direction of unidirectional dai link.
> +                 0 for playback only. 1 for capture only.
> +    $ref: /schemas/types.yaml#/definitions/uint32

So if the property isn't there then it's _not_ unidirectional and if
it is there then this specifies the direction, right?  I almost wonder
if this should just be two boolean properties, like:

playback-only;
capture-only;

...but I guess I'd leave it to Rob and/or Mark to say what they liked
better.  In any case if you keep it how you have it then you should
use yaml to force it to be either 0 or 1 if present.


> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - qcom,sc7180-sndcard

Just:

properties:
  compatible:
    const: qcom,sc7180-sndcard



> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |-
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.

You don't need the "|-" after the "description:".  That says newlines
are important but strip the newline from the end.


> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    description: |
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.

From looking at "simple-card.yaml", I'm gonna guess that instead of
encoding the link number in the name of the node that you should
actually use a unit address and a reg in the subnodes.

...also, again your description doesn't need the "|" at the end.
Maybe <https://yaml-multiline.info/> will be useful to you?


> +    type: object
> +
> +    properties:
> +      link-name:
> +        $ref: "#/definitions/link-name"
> +
> +      unidirectional:
> +        $ref: "#/definitions/unidirectional"
> +
> +      cpu:
> +        $ref: "#/definitions/dai"
> +
> +      codec:
> +        $ref: "#/definitions/dai"
> +
> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +
> +    additionalProperties: false
> +
> +examples:
> +
> +  - |
> +    snd {

Can you use the full node name "sound" here?


> +        compatible = "qcom,sc7180-sndcard";
> +        model = "sc7180-snd-card";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&sec_mi2s_active &sec_mi2s_dout_active
> +                     &sec_mi2s_ws_active &pri_mi2s_active
> +                     &pri_mi2s_dout_active &pri_mi2s_ws_active
> +                     &pri_mi2s_din_active &pri_mi2s_mclk_active>;

I think pinctrl is usually not in the dt examples.

...also, shouldn't the mi2s pinctrl be in the i2s nodes, not in the
overall sound node?


> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        dai-link-0 {
> +            link-name = "MultiMedia0";
> +            cpu {
> +                sound-dai = <&lpass_cpu 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&alc5682 0>;
> +            };
> +        };
> +
> +        dai-link-1 {
> +            link-name = "MultiMedia1";
> +            unidirectional = <0>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 1>;
> +            };
> +
> +            codec {
> +                sound-dai = <&max98357a>;
> +            };
> +        };
> +    };
> --
> 2.28.0.rc0.105.gf9edc3c819-goog
>
