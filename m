Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3043A1AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 18:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhFIQTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 12:19:02 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46812 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237477AbhFIQS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 12:18:59 -0400
Received: by mail-ot1-f47.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso24405513otl.13;
        Wed, 09 Jun 2021 09:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=pGGy0QJiGHO1VqANFEeP8eQnM2OGRel1gTBvXXS9M6M=;
        b=F4pC2j1+8nk11vArjlRzMOKHXpbTptScH8fuR1EM+n2/SL6RUTNf8NArckvNXRvP+R
         lUHm5VhvFWRHzWiu1wy4/+RBbTEB6+cwG/O0b5UWmswGXuV3spuvLmmaFGgXlYdKbqmK
         jgBKLUNAW/yVdbnvZq2Lq+3mRRW7zqDr+2r/0JhTSFGaUz+0+uPOau5+P9/XVpu2ex1X
         FSCQWaxdpKqyMtVc6k2i+TcLzL6l15eRHZCtDXKUa+biuwXuRb1+cxRZGaYukyLwvXxB
         lskEJQ5lATCm66LJMkDAQs0bTHQxwWNK1uwFI1V8n/P5+wtwnoGhZvWARuujaShRX+UN
         Y9lg==
X-Gm-Message-State: AOAM532nB9mFNylyiMUUXCGkSEx8R4D2lkK96Kh0P7ced0SgMisNiZNr
        VsABep2S3nW+zVLAmapc7w==
X-Google-Smtp-Source: ABdhPJz9lb6nQLNfKFtmUMYZW5PMOiiZPprVnIwJWUBq/29WErexzGXTF+CbUeDZFUDAGFLzY7eHew==
X-Received: by 2002:a05:6830:14c:: with SMTP id j12mr196670otp.0.1623255408424;
        Wed, 09 Jun 2021 09:16:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v203sm49302oie.52.2021.06.09.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 09:16:47 -0700 (PDT)
Received: (nullmailer pid 3763302 invoked by uid 1000);
        Wed, 09 Jun 2021 16:16:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>
In-Reply-To: <20210608195342.18269-2-jonathan@marek.ca>
References: <20210608195342.18269-1-jonathan@marek.ca> <20210608195342.18269-2-jonathan@marek.ca>
Subject: Re: [PATCH v3 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date:   Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.647740.3763301.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 08 Jun 2021 15:53:27 -0400, Jonathan Marek wrote:
> These got lost when going from .txt to .yaml bindings, add them back.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
Error: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dts:26.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489620

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

