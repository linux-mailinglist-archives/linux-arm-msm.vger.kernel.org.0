Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ACF4402DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhJ2TJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhJ2TJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:09:30 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9B5C061570
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:07:01 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id g125so14723799oif.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=JIoJB0nrnD/FFJ0kl/mJlxgFsqLGnc24ub0V7Q5LiC0=;
        b=bJM3Q7f+i/afuWWCMK9Zl6Ay4ZGeoSmIMwgY9LnPih51xxl3kIoujkSsqObWesITLf
         6UujLqHi2tSvD7sUnjd6EaTZDSz3nEgQYkppvar8Qjp1Xv6DYm169z1MzVoio623ojKw
         SaXvZd35gNBBe55rjV6qIHWDfnQzq6Z8I73Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=JIoJB0nrnD/FFJ0kl/mJlxgFsqLGnc24ub0V7Q5LiC0=;
        b=HuWfSnJSLKjQCKAOpc6ih8XeqWZiMIRS2YSK0e3ITBn3j+Z3eB8YjbDxZyJUU9XvKW
         +QOdPZ0xUiG7hjRvDCyhNzeKGmTNhCYsTk+l8V++N2DuQFb8YPK3pXJT9feqSXUKwBp0
         HsDMWF5mLyrHMeqyXGOVEUNf5i8UsRwWdBWXsJkjBHAI/ioaqrvNoxYvfXRPQlkbsw+5
         KSlWJnVdj6zTNVwFDMt4PWtUW3zTaE6V/LAP84pNXNt9vEq/6xepXUv2o3ivEqUTXcdh
         Yhoj2QQZbZ0QvL+aqUmY4JY/4lNow/PYqcqk7Eb0F/mPT/L3ksfSM4u/M7x0l67t5BiE
         j4Bw==
X-Gm-Message-State: AOAM533JBdjvzfahJelZMEStrZ5Oudgy7lzXyNkO+hyh/jJwWa6+zJ/U
        OX4+eZsJLe9pLni/9x8Uti0sDhuOsCJZysC6t3F0Ww==
X-Google-Smtp-Source: ABdhPJx9DGm5zi/J5DHIHPM2ULFvb0dn5vpJfei1NgjU04Cz6QeqMDgJeGhpiv+KN0Wgad1XtCZqRxBYp0XeOm27aYk=
X-Received: by 2002:a05:6808:2124:: with SMTP id r36mr9693318oiw.64.1635534421166;
 Fri, 29 Oct 2021 12:07:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:07:00 -0500
MIME-Version: 1.0
In-Reply-To: <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org> <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:07:00 -0500
Message-ID: <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> new file mode 100644
> index 0000000..3a781c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google SC7280-Herobrine ASoC sound card driver
> +
> +maintainers:
> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> +  - Judy Hsiao <judyhsiao@chromium.org>
> +
> +description:
> +  This binding describes the SC7280 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - google,sc7280-herobrine
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^dai-link@[0-9a-f]$":
> +    description:
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.
> +
> +    type: object
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
> +      reg:
> +        maxItems: 1
> +        description: dai link address.
> +
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true

Is sound-dai required? And additionalProperties is false? I think we
need that yet again.

> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +

Same here.

> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +      - reg
> +
> +    additionalProperties: false
> +
