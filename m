Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698434480B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 15:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235988AbhKHODa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 09:03:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:55560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235902AbhKHOD3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 09:03:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3752A61361;
        Mon,  8 Nov 2021 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636380045;
        bh=izUyU11zdeMT/aRwDCiBBWYzJdGvltLhmfBSK2Tce+0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mEWEk1uA14JZDV8wdYpw/taS+kSP+ss3RukHOzmvdL3U3cnmDlLnR0NUm7oPUYrvv
         QQMvYEAGyrJuqUW62s8r27UJBSVIuOtj22tcDqtNHvY7WqoLuyqY3x1i+0SoIYRAdo
         VTNKNq5L+s/mK6mlNDX+0XOUcUkdPglUAwrbusN8bCZbCeGE3U9ZA97LMo1zy5LIe8
         rt9zE6z8rm2CqSbe3iA4gqO64gyqdmFch1czd1RCJAtKdfMVp87gn0iFt8BpRLJJj8
         YR9D3xq06mXyKN3qSFiyEM1g1hehhfjlcvIcMgjCxprX4Kt8wENKjZmfqTVa56tGnp
         29EdGu0AqyVew==
Received: by mail-ed1-f54.google.com with SMTP id o8so62775226edc.3;
        Mon, 08 Nov 2021 06:00:45 -0800 (PST)
X-Gm-Message-State: AOAM530k1bFzBSu9ogLVwBD7UJGOHpo7TQyP5jM9N4aAORvkat+tQBf7
        nEjxZ59WwTI3xOiPDZagvuMkLSmGKYG31HHSHg==
X-Google-Smtp-Source: ABdhPJz1YCKek/SoIOKWCmTzcAVXHyiGtNhZcHIUPo0/ukWjKFdSzT5KKPUakqks2jia4+yz0wIt1WJJDG5tCLUAVtA=
X-Received: by 2002:a05:6402:350e:: with SMTP id b14mr55082191edd.271.1636380042836;
 Mon, 08 Nov 2021 06:00:42 -0800 (PST)
MIME-Version: 1.0
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
 <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org> <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
 <b1f2280a-b349-6862-c6e1-f74a5584c9bc@codeaurora.org>
In-Reply-To: <b1f2280a-b349-6862-c6e1-f74a5584c9bc@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Nov 2021 08:00:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL--zFvm=TWN2b2f4XJC3VigNwRq9gyf2PcAAVoiM8A4A@mail.gmail.com>
Message-ID: <CAL_JsqL--zFvm=TWN2b2f4XJC3VigNwRq9gyf2PcAAVoiM8A4A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        "Gross, Andy" <agross@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Patrick Lai <plai@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 8, 2021 at 1:35 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
>
> On 11/6/2021 7:00 AM, Rob Herring wrote:
> Thanks for Your time Rob!!!
> > On Tue, Nov 2, 2021 at 5:57 AM Srinivasa Rao Mandadapu
> > <srivasam@codeaurora.org> wrote:
> >>
> >> On 10/30/2021 12:37 AM, Stephen Boyd wrote:
> >> Thanks for Your time Stephen!!!
> >>> Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
> >>>> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >>>> new file mode 100644
> >>>> index 0000000..3a781c8
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >>>> @@ -0,0 +1,170 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Google SC7280-Herobrine ASoC sound card driver
> >>>> +
> >>>> +maintainers:
> >>>> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >>>> +  - Judy Hsiao <judyhsiao@chromium.org>
> >>>> +
> >>>> +description:
> >>>> +  This binding describes the SC7280 sound card which uses LPASS for audio.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - google,sc7280-herobrine
> >>>> +
> >>>> +  audio-routing:
> >>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >>>> +    description:
> >>>> +      A list of the connections between audio components. Each entry is a
> >>>> +      pair of strings, the first being the connection's sink, the second
> >>>> +      being the connection's source.
> >>>> +
> >>>> +  model:
> >>>> +    $ref: /schemas/types.yaml#/definitions/string
> >>>> +    description: User specified audio sound card name
> >>>> +
> >>>> +  "#address-cells":
> >>>> +    const: 1
> >>>> +
> >>>> +  "#size-cells":
> >>>> +    const: 0
> >>>> +
> >>>> +patternProperties:
> >>>> +  "^dai-link@[0-9a-f]$":
> >>>> +    description:
> >>>> +      Each subnode represents a dai link. Subnodes of each dai links would be
> >>>> +      cpu/codec dais.
> >>>> +
> >>>> +    type: object
> >>>> +
> >>>> +    properties:
> >>>> +      link-name:
> >>>> +        description: Indicates dai-link name and PCM stream name.
> >>>> +        $ref: /schemas/types.yaml#/definitions/string
> >>>> +        maxItems: 1
> >>>> +
> >>>> +      reg:
> >>>> +        maxItems: 1
> >>>> +        description: dai link address.
> >>>> +
> >>>> +      cpu:
> >>>> +        description: Holds subnode which indicates cpu dai.
> >>>> +        type: object
> >>>> +        properties:
> >>>> +          sound-dai: true
> >>> Is sound-dai required? And additionalProperties is false? I think we
> >>> need that yet again.
> >> Okay. Will mark additionalPropertiesas true.
> > 'additiionalProperties: true' is almost never right. It's generally
> > only correct for schemas that are incomplete collections of
> > properties.
> >
> > Rob
>
> As per Stephen Suggestion. thought it's a solution.
>
> The sound-dai required here, and same is fallowed in SC7180 machine
> driver bindings.
>
> Could You please suggest better approach on this?

Exactly what Stephen said, add:

required:
  - sound-dai

additionalProperties: false
