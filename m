Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C8E45A80D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 17:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238272AbhKWQiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 11:38:18 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:40604 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238988AbhKWQiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 11:38:15 -0500
Received: by mail-io1-f50.google.com with SMTP id p23so28738045iod.7;
        Tue, 23 Nov 2021 08:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=bgBtIYtL7cZLwHi0L+w9re6YrEvFyB7ccly3PyNrDyU=;
        b=yK6F8heBpkKxPZu7A30Qh3Lq8PoAL8uArECSP0nVuQ0py1usHQIBtxTXhRzJ6jBphu
         gtRnAziPrKx3k0uPSZzieG1dVc5XRZ64h2t7kXG40w2hE7BdUY+Ofh5ZI2N5E9h8l4WM
         4wxndeyVxIKTt1u+s78aDkDQN0E+oQURDOFog2GujqNBqVBPsv2ytguLT0OqmQjhlD3M
         DAfAwXd4t6YQzOeqmusKa7ivTmoRbrW9m9JT0XkhwpoPsIC//IoesSYuJkm5ZMqsYNKs
         erweMtSZK4m5Jn1F71cSM7LN+5nQ8j6QU9Zl6vSMG2ZrgSBShlLRo9UKOBT5kF32sDc2
         j7MA==
X-Gm-Message-State: AOAM530/beRlPZJF9kf5iu8nuA5QeyP0rB9E2xHjCHFevYOdIaVvrTfi
        gkiLK5CIH001ZnnCQ3o1kg==
X-Google-Smtp-Source: ABdhPJyP64Phebi0pVUPZ/k/nTCv7LmrCcljL5544fGi89PXitfCOjUCM83X7GDD0NIiKnJEGGvAxQ==
X-Received: by 2002:a05:6638:25c8:: with SMTP id u8mr8081813jat.23.1637685306186;
        Tue, 23 Nov 2021 08:35:06 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n12sm9272035ilk.80.2021.11.23.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:35:05 -0800 (PST)
Received: (nullmailer pid 3442906 invoked by uid 1000);
        Tue, 23 Nov 2021 16:34:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, rohitkr@codeaurora.org,
        judyhsiao@chromium.org, bjorn.andersson@linaro.org,
        plai@codeaurora.org, tiwai@suse.com, agross@kernel.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        devicetree@vger.kernel.org, robh+dt@kernel.org, perex@perex.cz
In-Reply-To: <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org> <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
Date:   Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.630368.3442905.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Nov 2021 17:16:37 +0530, Srinivasa Rao Mandadapu wrote:
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

See https://patchwork.ozlabs.org/patch/1558044

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

