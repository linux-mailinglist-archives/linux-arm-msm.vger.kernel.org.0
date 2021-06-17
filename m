Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41C3ABDF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhFQV2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 17:28:49 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:39586 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbhFQV2s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 17:28:48 -0400
Received: by mail-il1-f182.google.com with SMTP id j14so6659208ila.6;
        Thu, 17 Jun 2021 14:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=S2QnEMjPyLJ51Kht1z23VYTeVyxh5naJwxQU5uQBV3s=;
        b=uSl4axqlk210owmikZ8EI6VtVClK1YCM4MV3tZP9OVADKb+WDw9fq7b/y2Z8IXJ6Hd
         saFhuQ5A88VoPXPtDTQmV9bXcuq3PdWVcUtP6Bt+rCWlqQCQHVG9kFFrJnfMY7kMIMB7
         DDs7Vwclg4rhkB3xr+EAUAkJJrQGvmmx674xQ512gB6VP4xDWrfssLZdRG1k22/J+xVz
         6kXD6jzbIJ5lx3/Ebdwa3/vSd2flrAAu5n7yvyMrO6BAbulgmDSKIHjbmQhzbOmaVXgp
         laSFd6a9deDPfP7GgaCOPIuy3nrI+XL2/3N3QdSxMn0+tD3FbkK/t+LiJPIR1g+QhPkc
         /mPg==
X-Gm-Message-State: AOAM533y5RfjrHBHrxrlLL9SCdHyhmCPXGeAHuYwDkbNhmNbdkxMU8G+
        viME6R2UtCBtXtPWqfDLekBFWAU95Q==
X-Google-Smtp-Source: ABdhPJwx/O9pKEetV4vbZYQ02eGDkjwiDJt/qlFofKiX/u2XNE3H0grx7CaSNbe0xBL5h6oggqcfNg==
X-Received: by 2002:a05:6e02:13e5:: with SMTP id w5mr5050540ilj.112.1623965200227;
        Thu, 17 Jun 2021 14:26:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q6sm95080ilm.45.2021.06.17.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 14:26:39 -0700 (PDT)
Received: (nullmailer pid 3336121 invoked by uid 1000);
        Thu, 17 Jun 2021 21:26:24 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210617144349.28448-2-jonathan@marek.ca>
References: <20210617144349.28448-1-jonathan@marek.ca> <20210617144349.28448-2-jonathan@marek.ca>
Subject: Re: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date:   Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.580046.3336120.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Jun 2021 10:43:33 -0400, Jonathan Marek wrote:
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
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493583

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

