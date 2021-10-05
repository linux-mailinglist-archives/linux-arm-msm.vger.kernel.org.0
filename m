Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD98C4233C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 00:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhJEWr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 18:47:57 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:46931 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236866AbhJEWr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 18:47:56 -0400
Received: by mail-oi1-f169.google.com with SMTP id s69so1319201oie.13;
        Tue, 05 Oct 2021 15:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1pxND7BCUQcsSSy7TZxTVSdJeMVhe7/yxhkqlpU5RsE=;
        b=qhHXB0KOH9CJzlOz5wyVTJohOosZCupknk+SiLbXzmTUEMrkrB4K2dHyeqgaYS5t/7
         dKlEX8vGbCkIZEE5L8Rt5vX3ZeDZzCob1vYd/wIVkYztTCxnY0dD8dC+hZTmg+A4U1mT
         PRdD6X3zHbgtmLinUiyqQFkYctdQw2A16f2Hi3EUGr7ysagE/bMsvbGS1kgRjTe1YThw
         RbJ6RHTD0o1Dq56HoQxaisWw6m2xixVk/Xhow9T8CXoT2o3maiv8SzKDbZ+OT7ZVl05G
         8LmwiSmkX5mK0c/sh1eLPIsk3tC+Z9sBbE7kMOSDe6Xm4YQ6WNC7iYVg7FBwQPzzoskB
         5EHQ==
X-Gm-Message-State: AOAM533TiLPdFkKLBQE50uzgDy8D43rJ/a/556wsOxlOhjmQbZPgROQg
        NbabXMtDHpa7SDKrbQsud2zoMjj+nQ==
X-Google-Smtp-Source: ABdhPJzOguD4l2kCjKfnxpvalktU+y3R8MfzP+cj3IqJDlV+LBYM1M+tbREdb4g60bxvG1vfkOBTew==
X-Received: by 2002:a05:6808:bcf:: with SMTP id o15mr4696483oik.171.1633473965166;
        Tue, 05 Oct 2021 15:46:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k23sm3760510ook.45.2021.10.05.15.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 15:46:04 -0700 (PDT)
Received: (nullmailer pid 106773 invoked by uid 1000);
        Tue, 05 Oct 2021 22:45:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     rohitkr@codeaurora.org, perex@perex.cz, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
        devicetree@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org,
        robh+dt@kernel.org, bgoswami@codeaurora.org,
        alsa-devel@alsa-project.org, swboyd@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        judyhsiao@chromium.org
In-Reply-To: <1633441974-15353-7-git-send-email-srivasam@codeaurora.org>
References: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org> <1633441974-15353-7-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2 6/9] ASoC: dt-bindings: Add SC7280 sound card bindings
Date:   Tue, 05 Oct 2021 17:45:59 -0500
Message-Id: <1633473959.357662.106769.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 05 Oct 2021 19:22:51 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

See https://patchwork.ozlabs.org/patch/1536654

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

