Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0331E3554F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 15:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344397AbhDFNYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 09:24:20 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:36455 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhDFNYS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 09:24:18 -0400
Received: by mail-oo1-f49.google.com with SMTP id w1-20020a4adec10000b02901bc77feac3eso3682898oou.3;
        Tue, 06 Apr 2021 06:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=KqiWovFcA0VWUEW5WeOEp/JpvO8enKS6XaPrtTWARiI=;
        b=TYONHBVMlTJ9WjxSXBfwJQDPzOWz4qvA5pfCLzj2pH9t3KFBNTDAf0kAeqoT1tLYkn
         aoGpMS8Cc9uu6vqrQ/9s+RBGgxy+huszvv2GJknjVSCT80M65egZ39BdQjwpvfggBozB
         DxJoi9aNIXdkaUUO+hnghV5P81AWzIaNKQDlkbsQseHQ8unV88AhtQDHARH2OfIUx7Hn
         Yw2zmxH5gll9D9PJmqJua/s6igUHMb+ZRxThSfXWj78fmqtd46yKUw5Omip+u139jsH1
         mGjunOwxAMWV2On2ZFhNUApaQGTBHcrGn40nfnRK/mvxhkl7hNgbJLYm/N6D5yI8K4bC
         JRZg==
X-Gm-Message-State: AOAM531Es661i6NB+mqUmWi6oBTtlBR0CjQYBpGU5LPW8uc0bRN+RWNm
        Vb06f0BLQG9tSlxrdWfxpg==
X-Google-Smtp-Source: ABdhPJxJ41PdfLWO25H89QYPRHvvbckpBygxU6F09QKrCy3911/J1yRX6LxM3v5h+JUwJEogJi7wcA==
X-Received: by 2002:a4a:8c4f:: with SMTP id v15mr26861642ooj.25.1617715449941;
        Tue, 06 Apr 2021 06:24:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a6sm4670188otb.41.2021.04.06.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:24:08 -0700 (PDT)
Received: (nullmailer pid 1674498 invoked by uid 1000);
        Tue, 06 Apr 2021 13:24:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        vinod.koul@linaro.org, swboyd@chromium.org, robh+dt@kernel.org,
        tanmay@codeaurora.org, bjorn.andersson@linaro.org, sean@poorly.run,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org, dianders@chromium.org,
        kalyan_t@codeaurora.org
In-Reply-To: <1617620770-26202-3-git-send-email-mkrishn@codeaurora.org>
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org> <1617620770-26202-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v15 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
Date:   Tue, 06 Apr 2021 08:24:05 -0500
Message-Id: <1617715445.168054.1674497.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 05 Apr 2021 16:36:09 +0530, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI PHY.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
> 
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
> 
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
> 
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
> 
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
> ---
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         | 66 ++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         | 71 ++++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-common.yaml       | 40 ++++++++++++
>  5 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.example.dt.yaml:0:0: /example-0/dsi-phy@fd922a00: failed to match any schema with compatible: ['qcom,dsi-phy-28nm']

See https://patchwork.ozlabs.org/patch/1462327

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

