Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAB1262131
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgIHUeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:34:06 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46962 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgIHUeD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 16:34:03 -0400
Received: by mail-il1-f195.google.com with SMTP id t16so165500ilf.13;
        Tue, 08 Sep 2020 13:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gleTakc4Nn6mTISuQkejPMu6ISZTqy+j8/Bxw7G61oU=;
        b=GjlejI12ZPAigfezzb+Ei1pn2BgFccfWpBoB+G/F2P/3V3Xnh+pfH6y31JlvkUvrms
         /3UEY3HQss/X3CpZdcaR9nzHzu7aOtmFMxsbcPOKDV9VxuM22L4uevkF9xooqPTrSCCD
         uTAgk1H+1BLGAEdYgyNWxnbMm/yKfX2S4jWRERzWIxg/dURoKd6V5z2Ta4ZIBJpJrZ5z
         j6RV9WHQao05fXOTnm7Df6tT87/xFJWYcgSdHC1t6w3RcT+w1G3Hgn6QLlkRNu/sV75f
         yBJs5iri7/gNl2cT39YspXde+0BaHmLNAjGjQ+9/Zks0G0RdC//ZEo3scxfP2rInuQ7Y
         n9sA==
X-Gm-Message-State: AOAM533o3cVa8Wx3g7TY9JVV6lGiuLY4cvNN/Q5Ov5GXMPami+axClYd
        fJU0yO1aV45DozlagpmSEQ==
X-Google-Smtp-Source: ABdhPJzCHoj/ZvrJj7t400J/VsMUBFrd75e5tcT3ln+3OZZL67b775TNHUe3xKteGxNcW5bAkZ322A==
X-Received: by 2002:a92:c049:: with SMTP id o9mr483817ilf.193.1599597242634;
        Tue, 08 Sep 2020 13:34:02 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k14sm217738ioa.7.2020.09.08.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:34:02 -0700 (PDT)
Received: (nullmailer pid 868500 invoked by uid 1000);
        Tue, 08 Sep 2020 20:33:57 -0000
Date:   Tue, 8 Sep 2020 14:33:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
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
        Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200908203357.GA861143@bogus>
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907100039.1731457-3-cychiang@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> new file mode 100644
> index 000000000000..ae809346ca80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> @@ -0,0 +1,143 @@
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
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-sndcard
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
> +  headset-jack:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the codec for headset detection
> +
> +  hdmi-jack:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the codec for hdmi jack detection

You already have links to these devices. Why duplicate it here? 

What if you had 2 headsets? This doesn't scale.

Rob
