Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2516423419A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731996AbgGaIzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731990AbgGaIze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:55:34 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC19C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:55:34 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f7so27296794wrw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyioNdq8CYBvYgbkg8UuSG7Wqo4MUTr2xfEMOw9a9rE=;
        b=gJ1DQMppeYGWIl/xt4mhVBRMBU0vPPeIW+lpH27Uv8zpU3m+ggx5euP9ZtcQhQF/OX
         E64+yzIOVHvWUNyqhXWsVm5YOOfibgDqUixJyt6FHUGiARBRyr4pilLoh8vKs2cWjOsS
         w2zgqojCdQtg0rcRAYhI3V6W7ePsunHAc0g9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyioNdq8CYBvYgbkg8UuSG7Wqo4MUTr2xfEMOw9a9rE=;
        b=ODzk1gSJcRbqQlH4vksxUl+ssSC/L17Q95DROY/TiXzLP1qH8eV3CR8y51qlm8cpBA
         GI/nQRrTJd+6OB47r9xLVz8ycMXmLDtGQyB5fELUgOwVJOw1qq0qOGiRaeNorf4ByQ3s
         U+uSjQa4Iv13v4tTTu/WsJkSxKxSSRQ41VZhzYP/kU5YboHyD/aoaMsTT2g51Mn4UTYU
         aYDa7X9ry8u9JRvZ8TI/a70wUUnwCvLxQRoqW3E9w4V+RM+uNWD7cLWWg8XZNwJtdmUo
         eDCLjJckQs3q0dxHSa6tnG0UVTYb/GD/EV9Qw6tNYY88i/fla284Rh/FEruCGxwomShf
         cdMQ==
X-Gm-Message-State: AOAM532Qemj8yTCoPPrBMiVZFHeiP/9vqaJQCjmXGVngeOTWw0+lLizj
        knHiI0LKIiFhbgRTezkGMN+HIFhwZ5HIlzV5AzJaDA==
X-Google-Smtp-Source: ABdhPJyRhrXp3l6RU/5xr+rqhFrRNMWDU/mr680vSH+27w5AXxfytNKMGTBpF7RmL2K+p94pKbqb9iePJ20hmgfEMro=
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr2466765wrt.159.1596185732557;
 Fri, 31 Jul 2020 01:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-2-cychiang@chromium.org> <c270a068-c96b-63ae-a5ca-ec2081924dac@linaro.org>
In-Reply-To: <c270a068-c96b-63ae-a5ca-ec2081924dac@linaro.org>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Fri, 31 Jul 2020 16:55:04 +0800
Message-ID: <CAFv8NwJBqndBozdc9DOr2T67VTnJ1LLEwvze2nJD6xNXh1a+gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
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
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 5:25 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 21/07/2020 11:44, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >   .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> >   1 file changed, 130 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..82f9483276eb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,130 @@
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
> > +definitions:
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
> > +properties:
> > +  compatible:
> > +    contains:
> > +      const: qcom,sc7180-sndcard
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
> > +  aux-dev:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the codec for headset detection
>
>
> Why do we need this? You should be able to set the jack for codec
> snd_soc_component_set_jack()?
>
>
I put my explanation in the machine driver patch since there is more
context there.

> > +
> > +patternProperties:
> > +  "^dai-link(@[0-9]+)?$":
> > +    description:
> > +      Each subnode represents a dai link. Subnodes of each dai links would be
> > +      cpu/codec dais.
> > +
> > +    type: object
> > +
> > +    properties:
> > +      link-name:
> > +        description: Indicates dai-link name and PCM stream name.
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        maxItems: 1
> > +
> > +      reg:
> > +        description: dai link address.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        maxItems: 1
>
> Why do we need this?? I have not seen the parsing code using this.
>
>
When checking the yaml file using dt_binding_check, I got this warnings:

$  make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
  CHKDT   Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/sound/qcom,sc7180.example.dt.yaml
Documentation/devicetree/bindings/sound/qcom,sc7180.example.dts:32.24-41.15:
Warning (unit_address_vs_reg): /example-0/sound/dai-link@0: node has a
unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/qcom,sc7180.example.dts:43.24-52.15:
Warning (unit_address_vs_reg): /example-0/sound/dai-link@1: node has a
unit name, but no reg or ranges property
  CHECK   Documentation/devicetree/bindings/sound/qcom,sc7180.example.dt.yaml

Should I ignore these warnings because reg is not used in the driver ?

> > +
> > +      playback-only:
> > +        description: Specify that the dai link is only for playback.
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +      capture-only:
> > +        description: Specify that the dai link is only for capture.
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
>
> Are these because the cpu/codec dais are single directional?
>
> If so you can extend snd_soc_dai_link_set_capabilities() and use this
> function.

I found that this is not needed since soc_new_pcm already takes care
of checking capture/playback capability in non-dpcm cases.

>
>
> --srini
>

Thanks for reviewing the patch!



> > +      cpu:
> > +        $ref: "#/definitions/dai"
> > +
> > +      codec:
> > +        $ref: "#/definitions/dai"
> > +
> > +    required:
> > +      - link-name
> > +      - reg
> > +      - cpu
> > +      - codec
> > +
> > +    additionalProperties: false
> > +
> > +examples:
> > +
> > +  - |
> > +    sound {
> > +        compatible = "qcom,sc7180-sndcard";
> > +        model = "sc7180-snd-card";
> > +
> > +        audio-routing =
> > +                    "Headphone Jack", "HPOL",
> > +                    "Headphone Jack", "HPOR";
> > +
> > +        aux-dev = <&alc5682>;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        dai-link@0 {
> > +            reg = <0>;
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
> > +        dai-link@1 {
> > +            reg = <1>;
> > +            link-name = "MultiMedia1";
> > +            playback-only;
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 1>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&max98357a>;
> > +            };
> > +        };
> > +    };
> >
