Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96203443796
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 21:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhKBVBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 17:01:34 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38819 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhKBVBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 17:01:34 -0400
Received: by mail-ot1-f51.google.com with SMTP id c2-20020a056830348200b0055a46c889a8so638377otu.5;
        Tue, 02 Nov 2021 13:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=X+PbCIBbupD5QlN7dstqXrkneFhSekQ8ud9fjKAPemE=;
        b=5d8I1HX+yOeXST/NTwGV+6nN2V77fuvjfequtTZv9YyyA+uqy6dBzeIpO6d5sWiAqL
         I7AzRVLrtfLf/j6awhTVFctF7a/fH1kO7dh5R+izoC0/2Q74V5+W9p5w8CNYZyvUNPIA
         hPloMV6KpohYCf5thdfNfLGjvdRRphyRS/986ciSTluxKpsJfjPZdYj4oSIlEA6BiKTe
         Fhz5FW8x0AjwqIKWo0aOj6G7UsuY/Zwyjug2oM8udm11e0Q848Hmv+rqdlcXGkZfs7Ba
         UDvIblxF1qjMSjm06Q3D8Vds34r+Nkp+sRS0cJ1UzsAOOeaiyaRen/mrWMOlpOjsv3rG
         b5WQ==
X-Gm-Message-State: AOAM532SI9TWVOcI5qrnVpJbMS6zLmkP+FsmaIohInwE5spXmfqIFCe7
        FyKEPmkC1koLvC7J0kxakg==
X-Google-Smtp-Source: ABdhPJxd7nHSOxQQYcM1AqgSl5jOlctl2u+Zih91go3saWqDKwRuki9qZYS+68Gyo04l8qmpTPDT3Q==
X-Received: by 2002:a9d:75c2:: with SMTP id c2mr29999973otl.69.1635886738566;
        Tue, 02 Nov 2021 13:58:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q63sm17699oia.55.2021.11.02.13.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 13:58:58 -0700 (PDT)
Received: (nullmailer pid 3465321 invoked by uid 1000);
        Tue, 02 Nov 2021 20:58:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     plai@codeaurora.org, tiwai@suse.com, robh+dt@kernel.org,
        perex@perex.cz, devicetree@vger.kernel.org, judyhsiao@chromium.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        swboyd@chromium.org, bgoswami@codeaurora.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org
In-Reply-To: <1635851372-19151-2-git-send-email-srivasam@codeaurora.org>
References: <1635851372-19151-1-git-send-email-srivasam@codeaurora.org> <1635851372-19151-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v5 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
Date:   Tue, 02 Nov 2021 15:58:56 -0500
Message-Id: <1635886737.005870.3465320.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Nov 2021 16:39:31 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
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

See https://patchwork.ozlabs.org/patch/1549576

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

