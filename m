Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EB449DB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 08:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237324AbiA0H3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 02:29:10 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41638
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237335AbiA0H3J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 02:29:09 -0500
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F1DF03F324
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643268548;
        bh=T0Cao9EYbGyGDdTGcr1ndXwb9FVrHnyvN3eX07tx2XQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=j+NorQHgGDdx7fQN5JZzZXFsBHo0hYd0l+XI/SEtnrUGRD+G9kGoaplTI3K2oK89G
         dH9KUHDxoo3DGpsgveZRimaoyXTp+8iIoXBFOGc/8zs0wn8I39dFGIUsdfN6jso6ym
         rFgPEwFqXN1r5K9l9+Zcc6Lcy2kYmbhE7rs0LuS7wyRMDDgEf0A9pxBu+XVeihMtNk
         /S1szMD0lkWiZ5zZl5PVxhJ7KHyulEFXfF6+WplRasfb2VivRgy/DCP0b9GsddNphr
         vT9vIVPAiELVD28a4RVSBm8jb7iuMhvlKvieghv/R4Qe/JuIJHG7xpJklSrJ8NCex/
         4laPlwCLSusGA==
Received: by mail-ej1-f72.google.com with SMTP id m21-20020a1709061ed500b006b3003ec50dso899865ejj.17
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 23:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T0Cao9EYbGyGDdTGcr1ndXwb9FVrHnyvN3eX07tx2XQ=;
        b=Qy7krRzBXcbozD4mAih4qN9LRtcUVV0skF4v6g+56kusgBE1qfmRu8kKxTrGOHLiU6
         4wkYOHxisYiAegaT/HAZItr7IuotmifaRy8GvH59Wi1Gw56NbjapDGwbzmjDJVBgCZ8u
         ix+tVUl4DkZBOTV1j3sinQ4yW1rJSbx0rKe0N/O5vu8QsYkEfLdSWkVhiwKvgPjHahNO
         SlAEu8rGEh9wMuh6XBWnzaTcq5QOqku/e+Axe5ZZNAUags5JFESw6sfgQJ+GunkmVbYa
         sgdZRJZrei2/OcisHkH2AoPNmYz+GZGR1yl7gHxTZy9DAOBn7Tz9anqSwz+BZ7uN4NRj
         oGSw==
X-Gm-Message-State: AOAM531U7O64zaRrc39PY9i31vmzgSa3EB5H/YlI1s3zuPHW7O+7iCq9
        iUXFam1cPPlhhGN8TVQZ9DtwJdcJpyFww0xTLOtd2kgepHNdWaeZDJ5Dg8Mi1Ktowa+BoW7hmNR
        z3RyHZ5RXmAHEn52QdAnHTNJPE33Na0WTm1k0ZgriHog=
X-Received: by 2002:a5d:4709:: with SMTP id y9mr1845701wrq.613.1643268537808;
        Wed, 26 Jan 2022 23:28:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqClftY3Y8SR9yE9omjRxWnvEsOEI2w7cS7ER6+j2GDHexFol/gUHicZH4VStQR13iFWf6tg==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr1845674wrq.613.1643268537569;
        Wed, 26 Jan 2022 23:28:57 -0800 (PST)
Received: from [192.168.0.62] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g5sm1740182wri.108.2022.01.26.23.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 23:28:57 -0800 (PST)
Message-ID: <f0bd9681-c87b-a6bf-09af-05e45b0b9707@canonical.com>
Date:   Thu, 27 Jan 2022 08:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20220126231427.1638089-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220126231427.1638089-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/01/2022 00:14, Rob Herring wrote:
> 'sound-dai' is a common property, but has duplicate type definitions.
> Create a new common definition to define the type and then update all
> the other occurrences to just define how many entries there are just
> like other phandle+arg properties.
> 
> The constraints on the number of entries is based on the examples and
> could be wrong.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
> phandle-array schemas") in my tree.
> ---
>  .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
>  .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
>  .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
>  .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
>  .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
>  .../bindings/sound/samsung,midas-audio.yaml   |  2 --
>  .../bindings/sound/samsung,odroid.yaml        |  9 +++------
>  .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
>  8 files changed, 42 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
