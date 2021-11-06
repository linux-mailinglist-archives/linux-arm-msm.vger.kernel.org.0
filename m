Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C56E446BC7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Nov 2021 02:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbhKFBdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 21:33:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231963AbhKFBdO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 21:33:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53C10611CE;
        Sat,  6 Nov 2021 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636162233;
        bh=02topxTHAKThTBTO3zqDJ42JdAkAX0HtqC0Y3dyHDO4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bSUfk72v4gVL76Pufs+Vep/nBUKmVCUx7AEjw4b8a+DvrEpt0bPhp/BiReiKv4E3l
         mYAiv/VypSVL8AmEslrvfQvjoLHycS2WI4SD7RHYIPA3u1ZwOmdOCIuX1HFqBzc25M
         Y4J1viSGnQL+EDyvlB66JRtKPwKvd+2rUwZw8Fe4ONPlghum73i1+l8T7pnJUpeq8e
         mXABvTQuLsy+JI6wdZJ0/wvUt8e6hNHpXlRsTqyDEq9129Zi9IwA+XkkFm66mWWqAd
         tE7f8LFr24Lp2K6E8xFNvVzWwApBVPbxNvtdc1AcV+y3fjgsdHIkusncqVq9d4PPa9
         O2o9jSN5p4dFw==
Received: by mail-ed1-f41.google.com with SMTP id m14so38158526edd.0;
        Fri, 05 Nov 2021 18:30:33 -0700 (PDT)
X-Gm-Message-State: AOAM533Y2KGFVb1Y4DQ3kAzx0BLhH+2hRT0E5OLLlI4poMKfVmx5vBBG
        0DU3KPNrIZq4Sgf2m/J/zO80lsv+oltpYIKaLg==
X-Google-Smtp-Source: ABdhPJxnUmIJLji323JYPjuxpKBPy6Ndvgj+6MG4lN/0vDFEDITAF/DyPe1a/jS0M0oVZrMBXPAX17mREqfK/9RxrPY=
X-Received: by 2002:a17:906:66d2:: with SMTP id k18mr25705246ejp.320.1636162231741;
 Fri, 05 Nov 2021 18:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com> <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
In-Reply-To: <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 5 Nov 2021 20:30:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
Message-ID: <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 5:57 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
>
> On 10/30/2021 12:37 AM, Stephen Boyd wrote:
> Thanks for Your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
> >> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >> new file mode 100644
> >> index 0000000..3a781c8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >> @@ -0,0 +1,170 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Google SC7280-Herobrine ASoC sound card driver
> >> +
> >> +maintainers:
> >> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> +  - Judy Hsiao <judyhsiao@chromium.org>
> >> +
> >> +description:
> >> +  This binding describes the SC7280 sound card which uses LPASS for audio.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - google,sc7280-herobrine
> >> +
> >> +  audio-routing:
> >> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >> +    description:
> >> +      A list of the connections between audio components. Each entry is a
> >> +      pair of strings, the first being the connection's sink, the second
> >> +      being the connection's source.
> >> +
> >> +  model:
> >> +    $ref: /schemas/types.yaml#/definitions/string
> >> +    description: User specified audio sound card name
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 0
> >> +
> >> +patternProperties:
> >> +  "^dai-link@[0-9a-f]$":
> >> +    description:
> >> +      Each subnode represents a dai link. Subnodes of each dai links would be
> >> +      cpu/codec dais.
> >> +
> >> +    type: object
> >> +
> >> +    properties:
> >> +      link-name:
> >> +        description: Indicates dai-link name and PCM stream name.
> >> +        $ref: /schemas/types.yaml#/definitions/string
> >> +        maxItems: 1
> >> +
> >> +      reg:
> >> +        maxItems: 1
> >> +        description: dai link address.
> >> +
> >> +      cpu:
> >> +        description: Holds subnode which indicates cpu dai.
> >> +        type: object
> >> +        properties:
> >> +          sound-dai: true
> > Is sound-dai required? And additionalProperties is false? I think we
> > need that yet again.
> Okay. Will mark additionalPropertiesas true.

'additiionalProperties: true' is almost never right. It's generally
only correct for schemas that are incomplete collections of
properties.

Rob
