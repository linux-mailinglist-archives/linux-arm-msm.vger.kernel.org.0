Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA391410004
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 21:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344867AbhIQTvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 15:51:46 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35505 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbhIQTuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 15:50:21 -0400
Received: by mail-oi1-f176.google.com with SMTP id r26so15482064oij.2;
        Fri, 17 Sep 2021 12:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=k73+20oMzuAw5PJdzXrVZQ8DNLKi5Ygwc7hTogsnp9k=;
        b=RerxTSYNPhdbhFiYzE3HsnpiT+Mfig/YiWi8d0qEg/pKvj3mTZrkmLjipCVx3NLYNo
         tUgnlgWBemp+2o8YG6uGcaClElyahN9VdQ71eNJr0v+0RTpfkru1jVNBSE1IZl8zQ8jN
         fefj3wFRE/qzJadPveHz1II9mr1iMicaXeQeUxtW3MJaX9cIY4slsAL5Me8wxPYHnvkS
         xksulL1oQ381Vek3X8NyuUOvYJvifRBWppThu7a+EEo5+qG0vHZjwh2glVwUSD+Uwd2P
         2enmauiCC3wmgzU/jwmGrb6bhVgJuzAjan4W5uLAg/vaYH3UddjslQV8LLHKB02a+ZXa
         r2CA==
X-Gm-Message-State: AOAM530kVrGCjyHdjFA9s48F/cNJlVb8i4qq54aSau1SKTKjhye0/qBP
        1xFZ+mKTK64xDv4gZQnT673WWUhGYQ==
X-Google-Smtp-Source: ABdhPJyHkJprsjX0KNy6IqPp7iO8QrFdQymObPv0zprHFsIFbUJLu1hwZxjDZRpoBAGKg4nANmhoNQ==
X-Received: by 2002:aca:3114:: with SMTP id x20mr1734704oix.174.1631908138523;
        Fri, 17 Sep 2021 12:48:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o8sm1642429oiw.55.2021.09.17.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 12:48:57 -0700 (PDT)
Received: (nullmailer pid 2025331 invoked by uid 1000);
        Fri, 17 Sep 2021 19:48:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     perex@perex.cz, tiwai@suse.com, plai@codeaurora.org,
        robh+dt@kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        broonie@kernel.org, lgirdwood@gmail.com, judyhsiao@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgoswami@codeaurora.org, agross@kernel.org,
        srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
        rohitkr@codeaurora.org
In-Reply-To: <1631872892-1821-2-git-send-email-srivasam@codeaurora.org>
References: <1631872892-1821-1-git-send-email-srivasam@codeaurora.org> <1631872892-1821-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
Date:   Fri, 17 Sep 2021 14:48:54 -0500
Message-Id: <1631908134.321286.2025330.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 15:31:31 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> This patch depends on the dt-bindings header patch
>   -- https://patchwork.kernel.org/project/alsa-devel/list/?series=543829
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1529313

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

