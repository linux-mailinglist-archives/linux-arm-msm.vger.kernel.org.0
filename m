Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED50427185
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 21:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241384AbhJHTvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 15:51:00 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:37634 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbhJHTu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 15:50:56 -0400
Received: by mail-oi1-f174.google.com with SMTP id o83so7681102oif.4;
        Fri, 08 Oct 2021 12:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=AyVTeSC8Yf3uhrD+x/CO53ijqdVFcAJcsxUhs3MRvmM=;
        b=66t+NCfcwQzVMs5dck7HI9RARQEZY98Du0rcxGpN5NnakH+ZzWaF89Cc2f7bjui3s+
         370PeYITtI1sZXC5ByWEe5ri4ZRkg8aWO6ZJVvYemyJLgAOWGV3G9z1wFRqbIU82eWX8
         YFugSQM3GgaKAjKS6CKqq97KWHwTCuoU23r9awU+FHCk0L/P0dJFo6qofBdFi0aQo/2m
         2f2Niz0IQj1qLLGjXeqB0bMtAFNBdIMUT55nk+6vqyicItsBMkXw1hIoiIrjf7poOdUu
         0r/b8ebkiNJLXJHXjY5VbNqdknXAfgi+y2fXz8rztfy/yvowLcWUNtBfPB/ugniUw838
         rrzA==
X-Gm-Message-State: AOAM530VowKJHZ3d/r3+UOiZ3W89UpfEKZlr4uEszCQzg11ebx3wRbde
        Ypo4Pu8vR+9QqBpzf+315Q==
X-Google-Smtp-Source: ABdhPJxfsMuBS32ogXG9PGtxIo/2x9osllcxajr/6xd0Jr7jQHCTqWEa16x2E6BS+7PFnBz0C84cOw==
X-Received: by 2002:aca:b388:: with SMTP id c130mr18261120oif.39.1633722540517;
        Fri, 08 Oct 2021 12:49:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k2sm42536oot.37.2021.10.08.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 12:48:59 -0700 (PDT)
Received: (nullmailer pid 3211957 invoked by uid 1000);
        Fri, 08 Oct 2021 19:48:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
        devicetree@vger.kernel.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        swboyd@chromium.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        judyhsiao@chromium.org, bgoswami@codeaurora.org, agross@kernel.org,
        alsa-devel@alsa-project.org, bjorn.andersson@linaro.org
In-Reply-To: <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org> <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital codecs
Date:   Fri, 08 Oct 2021 14:48:56 -0500
Message-Id: <1633722536.892404.3211956.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 08 Oct 2021 19:39:01 +0530, Srinivasa Rao Mandadapu wrote:
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>  4 files changed, 12 insertions(+), 4 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1538394


codec@3240000: 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clock-names:4: 'fsgen' was expected
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clock-names: Additional items are not allowed ('fsgen' was unexpected)
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'va', 'fsgen'] is too long
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clocks: [[75, 1], [75, 0], [76, 102, 1], [76, 103, 1], [77, 0], [78]] is too long
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml

codec@3240000: clocks: [[78, 1], [78, 0], [79, 102, 1], [79, 103, 1], [80, 0], [81]] is too long
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3240000: clocks: [[86, 1], [86, 0], [87, 102, 1], [87, 103, 1], [88, 0], [89]] is too long
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml

codec@3370000: 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

codec@3370000: clock-names:1: 'core' was expected
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

