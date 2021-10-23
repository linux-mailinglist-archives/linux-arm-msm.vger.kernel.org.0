Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A6D438403
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 17:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhJWPQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 11:16:27 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:38854 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhJWPQ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 11:16:27 -0400
Received: by mail-oi1-f181.google.com with SMTP id t4so8939316oie.5;
        Sat, 23 Oct 2021 08:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Bg2HoxcvGMf9Ovj9pzcdsVijqJ6NR5PA0icgim7NWfg=;
        b=7CzyhMNH61vH2pNSR/YdQ2vns9i8KDtcXTFW+nYPBnPd+9TD3JV0y9ExJ0shX6o93E
         ATqvz9l4N1Sg/T7XvmHrK5lpwesit7s6BpnbnO44HWIm2xRjfBplYWn8mJ8E77l4kpmJ
         ejxU/kI9ZjkigKCxqe9qypDmhw+E+EgbmheMohf+6/mWzQ6G4vaoZ3q7agMgjSsFVoak
         fZQL6J6HQvb9nck9ifd32OgqTZcxELVGREusZRI2DRB6enmKpG8aYt/opzvqjK/nC7lb
         bjoIZx5zvF36jjND1gYWJv7UUvzPYRYqBWPmzVEylDPVAzw+J0VMbp9cYriAwYydIxFv
         NEkQ==
X-Gm-Message-State: AOAM532otxW+l4C2G8QhTwiAeIMnpfitfxO1uaLhI3ZemeUCZrBnM2d6
        U994J6FZ/Xg3OeAWXf92UQ==
X-Google-Smtp-Source: ABdhPJwQDNUGM05bn4X0T3kRMyChqK0m5VA0mJAMxX4DU1XqHz1ATJcKoGJH4PT3tIl5jnn3ivdTug==
X-Received: by 2002:a05:6808:1392:: with SMTP id c18mr4610058oiw.23.1635002047669;
        Sat, 23 Oct 2021 08:14:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l7sm2001249oog.22.2021.10.23.08.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 08:14:06 -0700 (PDT)
Received: (nullmailer pid 457390 invoked by uid 1000);
        Sat, 23 Oct 2021 15:14:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        plai@codeaurora.org, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bgoswami@codeaurora.org, lgirdwood@gmail.com,
        alsa-devel@alsa-project.org, tiwai@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        rohitkr@codeaurora.org, perex@perex.cz, robh+dt@kernel.org
In-Reply-To: <1634982842-7477-9-git-send-email-srivasam@codeaurora.org>
References: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org> <1634982842-7477-9-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
Date:   Sat, 23 Oct 2021 10:14:05 -0500
Message-Id: <1635002045.623723.457389.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 23 Oct 2021 15:24:00 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg-names: ['lpass-hdmiif', 'lpass-lpaif'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: interrupts: [[0, 160, 1], [0, 268, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: interrupt-names: ['lpass-irq-lpaif', 'lpass-irq-hdmi'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: iommus: [[4294967295, 4128, 0], [4294967295, 4146, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545178

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

