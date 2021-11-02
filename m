Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E9E442E4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 13:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhKBMl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 08:41:29 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:35551 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhKBMl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 08:41:29 -0400
Received: by mail-oi1-f179.google.com with SMTP id bn12so1787564oib.2;
        Tue, 02 Nov 2021 05:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0yfbsryEjmN9vwwP//YfNBCrdvNe0yYLPhJeAfuOOQs=;
        b=ggXgQOk5LCAW8yX3y9GXKx4nKiepjfntBkRVIOvUjsi4cNB2CIteoUXJ2mnBV17eF8
         5ubueuBWcQWP84N1Gdbghjfxf0Ql4XXnf7zNIVKRl6iDPLk2OgzMYrDkjIsbv9l8XSE0
         y6pHHzLKQE/Reqvv5GK+Oz3W5yRX0qc2mLtVTeBMPvY1gKjLt5Gi8P5M3expjkLxq5pY
         psVJscq2oI1ESpeW4mmJ/mmiefKQyN7hqG8ccxXjCjw+msa9tg4AYgSG35VV6jmytlqr
         1WIMhmRe5WjLsE8sjc0YkUeEktbv6Fxs1cmYdp8PsDmYT/ls7TZBf7rejilxd/FEmdip
         2eeQ==
X-Gm-Message-State: AOAM533TIbxyiyuHEqs9Dd3Nk9Jh4KAfjA5QC1zWoRI4BVyl37ODT7V4
        LbTjjJpP1+GGA9MPaEgRDg==
X-Google-Smtp-Source: ABdhPJzNemQUYREkjWtK4Z7J5RwmZFURPklIkPVqCmGlI2S/6JIc3SWDKlpQ8oWJVKw+syDJjuRyDQ==
X-Received: by 2002:a05:6808:e84:: with SMTP id k4mr4928387oil.135.1635856734298;
        Tue, 02 Nov 2021 05:38:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bd5sm2582438oib.2.2021.11.02.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 05:38:53 -0700 (PDT)
Received: (nullmailer pid 2636024 invoked by uid 1000);
        Tue, 02 Nov 2021 12:38:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, tiwai@suse.com,
        linux-kernel@vger.kernel.org, plai@codeaurora.org, perex@perex.cz,
        bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org,
        swboyd@chromium.org, alsa-devel@alsa-project.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        robh+dt@kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, rohitkr@codeaurora.org, broonie@kernel.org
In-Reply-To: <1635838265-27346-9-git-send-email-srivasam@codeaurora.org>
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org> <1635838265-27346-9-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v4 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
Date:   Tue, 02 Nov 2021 07:38:52 -0500
Message-Id: <1635856732.594488.2636023.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Nov 2021 13:01:03 +0530, Srinivasa Rao Mandadapu wrote:
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

See https://patchwork.ozlabs.org/patch/1549500

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

