Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17AC9409F22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 23:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244595AbhIMVdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 17:33:13 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:45021 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhIMVdN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 17:33:13 -0400
Received: by mail-ot1-f52.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so15360969otg.11;
        Mon, 13 Sep 2021 14:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=XnVyvRrK1owG70oj9OBKMWq8slrlkz/+5/c6V4H3/gU=;
        b=cQzqn0nrz8Ex6wCYYLFrpqRIgJzx6+90Sm1L5gVtZ9PZFXP2Jo/a7DrZMsqor/EkqE
         8Uf/7T7qMcqMNCXrqYVXf0TDxbHOR99DQ6U5fSEQZOeI6uPBPb9XeH3m3VH+Mvzgbp73
         wcw4ovpwHjSSfqA5HlTA1uzurYLBoOFKNY1RkFRyggz/I1smTFbbB/fl+YJWN8lxKljn
         ryeGINJbaGczveq83MU28Sz6PlVsSvZjFhyQXPhQLfgUwgODalJU3mDbfPjY8yTnfRMg
         tdOcFm8xWHzReYNU+EENlzvCQ++SLnIHaVDtRujUedwgp90DcCchD3/k0EyzhLAe+yAS
         SVOw==
X-Gm-Message-State: AOAM530WFxN86DZ60D8yGhA9ejM9MjsaMUblB+D3kFWx8ueIsV+Qv3oE
        +9Tab95gzc6bNW0Cq1bYhw==
X-Google-Smtp-Source: ABdhPJyCDct3Ef1sAiH5at31Q3Pw/8cEU7uq1EmCixfb3ChclnbVNePBX4QBllaF2VGBKlennTyL3g==
X-Received: by 2002:a9d:5a89:: with SMTP id w9mr11641935oth.91.1631568716465;
        Mon, 13 Sep 2021 14:31:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 67sm2142358ota.70.2021.09.13.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 14:31:55 -0700 (PDT)
Received: (nullmailer pid 1412997 invoked by uid 1000);
        Mon, 13 Sep 2021 21:31:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     plai@codeaurora.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        swboyd@chromium.org, lgirdwood@gmail.com, perex@perex.cz,
        rohitkr@codeaurora.org
In-Reply-To: <1631539062-28577-2-git-send-email-srivasam@codeaurora.org>
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org> <1631539062-28577-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
Date:   Mon, 13 Sep 2021 16:31:54 -0500
Message-Id: <1631568714.639730.1412996.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Sep 2021 18:47:41 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1527380

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

