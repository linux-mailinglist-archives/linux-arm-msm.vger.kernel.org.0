Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2317549E765
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 17:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237525AbiA0QXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 11:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243629AbiA0QXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 11:23:23 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D359C061747
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 08:23:23 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso2231454wmf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 08:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=dszbD2iJpZiPeHo8KU4CPZgugNBsta//XmHDun3F64c=;
        b=fZcrsbxTVL6oEX16YFICUECpoqbUxOVzhN91OZM/+KQu155OI7WSTG0MiQZJgjExmx
         jp0sIHft9IaJptYG6xxadWut2UoUpBdZjQx5gv7u1MkTlRl1hZUMLS10XNBqLS12Kqc0
         fUGz36q/7SAVtW2er4/vNtRl/IAv5P9dXGTRghcXk838xHFTh0rpWC3QJ1hL6MFMFpmZ
         IOudqk9T82+pKnR3a4nT1d5H50M3AZIqsuTo+VhmilYtZbr/+DsaUTUQrPVXWALYkJoQ
         ua9KX5MavqeNx/aTRA4/yfAgHvPRa2gKr2mV89ocCP23NjXS4WJhAaF53CwKPll5S9QB
         nuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=dszbD2iJpZiPeHo8KU4CPZgugNBsta//XmHDun3F64c=;
        b=t603a//QNRE6silgLs60YV9ZeZlCVC22imWLqdapKhuVrMxSxSN5YLXp/dK/gpYjat
         OrX1zZLX6gGLtFrZVNzo55Kdw4i90u8saIXYIy8azDVI84NR99wtPlUeyEak9/vdGo01
         N8vCdjdWy09dKsnODY7lBOWyapeLsuyShnZF9B62GAHr1Bbhq5hbksWp3x1FSg4dbFi4
         N2CFscVL9H8Xg1A6eroKm8c0KRJfmbtehCrjnv9jcOEUsUnB8VMDdy1Q28GMSMyodPeC
         byhc1uIPlcj63GWfFnoaFAUySn0Bf6nCJS7RpV7knNQXVKRsNs787xBpsue9hG9DTP+x
         48+g==
X-Gm-Message-State: AOAM5325wc3jfKnpWFyiAW1OvLEN2Z7cb1kLi+YdCUjKo7glIMS+u6A3
        0FHcTNBN53rT9NVyn6D2vkaEXA==
X-Google-Smtp-Source: ABdhPJx68OlAQYPxDB8R5MGosp8NvBZZ+3uApWKaznWHP31o8jTnJGFiSqqrgwHrSvAVTiOnIthV0w==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr12306751wmc.89.1643300601853;
        Thu, 27 Jan 2022 08:23:21 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id v124sm6289832wme.30.2022.01.27.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 08:23:21 -0800 (PST)
References: <20220126231427.1638089-1-robh@kernel.org>
 <1jtudp1rc1.fsf@starbuckisacylon.baylibre.com>
 <CAL_JsqL77E+5ftqgHPdWQzfp98Oh3d=QZRQ8Z6v91OfSeprxig@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Date:   Thu, 27 Jan 2022 17:20:49 +0100
In-reply-to: <CAL_JsqL77E+5ftqgHPdWQzfp98Oh3d=QZRQ8Z6v91OfSeprxig@mail.gmail.com>
Message-ID: <1jlez1172f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu 27 Jan 2022 at 08:35, Rob Herring <robh@kernel.org> wrote:

> On Thu, Jan 27, 2022 at 3:05 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Wed 26 Jan 2022 at 17:14, Rob Herring <robh@kernel.org> wrote:
>>
>> > 'sound-dai' is a common property, but has duplicate type definitions.
>> > Create a new common definition to define the type and then update all
>> > the other occurrences to just define how many entries there are just
>> > like other phandle+arg properties.
>> >
>> > The constraints on the number of entries is based on the examples and
>> > could be wrong.
>> >
>> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> > Signed-off-by: Rob Herring <robh@kernel.org>
>> > ---
>> > Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
>> > phandle-array schemas") in my tree.
>> > ---
>> >  .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
>> >  .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
>> >  .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
>> >  .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
>> >  .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
>> >  .../bindings/sound/samsung,midas-audio.yaml   |  2 --
>> >  .../bindings/sound/samsung,odroid.yaml        |  9 +++------
>> >  .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
>> >  8 files changed, 42 insertions(+), 21 deletions(-)
>> >  create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
>> > index 2e35aeaa8781..8b5be4b92f35 100644
>> > --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
>> > +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
>> > @@ -57,7 +57,7 @@ patternProperties:
>> >            rate
>> >
>> >        sound-dai:
>> > -        $ref: /schemas/types.yaml#/definitions/phandle-array
>> > +        maxItems: 1
>> >          description: phandle of the CPU DAI
>> >
>> >      patternProperties:
>> > @@ -71,7 +71,7 @@ patternProperties:
>> >
>> >          properties:
>> >            sound-dai:
>> > -            $ref: /schemas/types.yaml#/definitions/phandle-array
>> > +            maxItems: 1
>>
>> No min or max here. Links may have more than one codec.
>>
>> Ex:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#n158
>
> What do you mean? Every 'sound-dai' there only has 1 phande+args. Each
> codec is a child node.

Yes it is a child - sorry I misunderstood.
I thought the MaxItems: 1 would limit the number of codecs

For the amlogic part:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Rob

