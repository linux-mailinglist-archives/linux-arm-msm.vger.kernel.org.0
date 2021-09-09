Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BCB4051A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354328AbhIIMhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 08:37:18 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:33695 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344408AbhIIMeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 08:34:07 -0400
Received: by mail-ot1-f44.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso2300737otu.0;
        Thu, 09 Sep 2021 05:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=abEhaeOy2YSPN/FnaISQGKPeJ66igV5iFQgXJZSBBLU=;
        b=HCJbKFL9sFqX1ppmzishD7Y1n2MbRz6JpTq+F5VDF+JH/W0bhRoZYnsfCT5+Bj1L7I
         anSpeN/ZtFQy9NL2Wb/P6c0bTuIJnop/vA63BXtHQf+VcRs+utDnGTLvzY6tDryUJ1cP
         aDcrcbQXeobuxM7TD00+blFQ2eIQCLcmgnEEZI+SKVVih1cGRnlEa3GMKfmET2id7gh1
         GvJMGn04jrdLUr3xGKP8+36pj/B2kOEjIFcUdBDHZO1K8X+/cEbECXsLQg4Gm2Bfo162
         8vYFJuj/nsd9Alro4hi4fl8VfMQgSrd2kJlyzpf6sY1XIKyGHQR20xq/eIjoLtPqauVx
         k3fQ==
X-Gm-Message-State: AOAM531ipYs2/zktF7UNcTba+9E5fs+utgMKom5YQcdaQOrOhQ108PGL
        x9yHby83kbHsUKugdIlXnA==
X-Google-Smtp-Source: ABdhPJxcpJ9iZIIumS08m5EWjFkP5+Lg9n++RGx/6qUcAsMjiuJwc9M/jZdbHzbGyu4mT27btG7wgg==
X-Received: by 2002:a9d:2053:: with SMTP id n77mr2273577ota.9.1631190777626;
        Thu, 09 Sep 2021 05:32:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g23sm405642otl.23.2021.09.09.05.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:32:56 -0700 (PDT)
Received: (nullmailer pid 200340 invoked by uid 1000);
        Thu, 09 Sep 2021 12:32:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, bgoswami@codeaurora.org,
        devicetree@vger.kernel.org, tiwai@suse.com, judyhsiao@chromium.org,
        lgirdwood@gmail.com, perex@perex.cz, swboyd@chromium.org,
        plai@codeaurora.org
In-Reply-To: <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org> <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
Date:   Thu, 09 Sep 2021 07:32:53 -0500
Message-Id: <1631190773.288819.200339.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
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
make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1438: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525980

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

