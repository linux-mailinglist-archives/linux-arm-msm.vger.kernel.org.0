Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420E746024A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Nov 2021 00:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhK0XSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Nov 2021 18:18:41 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:37473 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhK0XQl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Nov 2021 18:16:41 -0500
Received: by mail-oi1-f182.google.com with SMTP id bj13so26457861oib.4;
        Sat, 27 Nov 2021 15:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=F1dfF+UJik1r5mhkv4NnnGU7zXHuMkitsnrdy1AJCzk=;
        b=4qEeKDsOPm2C5GQG8DvvFKMNWi8wtaCPTJoc/RI8V7mzG1NYbLFUmIQ+zM/9EddpEw
         4TYiykekcfmb5NEyXBJgnOgtQPeBXDALTpWzM4UhgsarX/e5rf/WOGKHgPZCWYEAqWBk
         Xxc5fzywWREGAz2aTozgzyIHgnmRRP2S2Ow8eP8NLYRQ7s3ZFlmUxB42pMgmJrQx6GpC
         7ppXFoKUgAzyK7jYeVItOExfhUX22EEfARA8+Zv6AyR71S9UW2gvHIUW/an8zwncIKdu
         D9FByyNwOt+qtXIR1awSmGYhJcZZCWrI4ApTXFh4+KZWBcM56ytXq3/kfOdHmV6oBO+l
         iaiQ==
X-Gm-Message-State: AOAM532fu1jvNNKfn5VqX6TovJDEfWGfgrnrGev58rxppdIJgpnBCq/3
        YAlae2ki+WRTc9Z+JcitsQ==
X-Google-Smtp-Source: ABdhPJzSuBiE1CXj2mVuQFmgrkkEOv1pSaWpzMY01SDv891PvCWQIDXhfY9y6KbhhAbeIgqglSZc1g==
X-Received: by 2002:a05:6808:dc5:: with SMTP id g5mr31799706oic.58.1638054805572;
        Sat, 27 Nov 2021 15:13:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i29sm1854687ots.49.2021.11.27.15.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 15:13:24 -0800 (PST)
Received: (nullmailer pid 1973540 invoked by uid 1000);
        Sat, 27 Nov 2021 23:13:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, judyhsiao@chromium.org,
        agross@kernel.org, plai@codeaurora.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, tiwai@suse.com, rohitkr@codeaurora.org,
        devicetree@vger.kernel.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        linux-kernel@vger.kernel.org, bgoswami@codeaurora.org,
        alsa-devel@alsa-project.org, broonie@kernel.org,
        srinivas.kandagatla@linaro.org, perex@perex.cz,
        swboyd@chromium.org, lgirdwood@gmail.com
In-Reply-To: <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org> <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
Date:   Sat, 27 Nov 2021 16:13:22 -0700
Message-Id: <1638054802.081809.1973539.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Nov 2021 17:34:40 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for sc7280 lpass cpu driver which supports
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

See https://patchwork.ozlabs.org/patch/1560102

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

