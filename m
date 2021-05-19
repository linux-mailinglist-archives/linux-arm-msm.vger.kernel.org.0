Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24D63898F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhESV4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 17:56:47 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:40927 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbhESV4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 17:56:47 -0400
Received: by mail-ot1-f41.google.com with SMTP id 80-20020a9d08560000b0290333e9d2b247so2559067oty.7;
        Wed, 19 May 2021 14:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WLdhbkfROLOODKehFnwQndYXUu6pb9BwesCQWlQZNdw=;
        b=U+HHgxOF2UERRC0wF4iDu0cB+7WSoe7YhlnhiLybWZO8t5k5Ey3Mxjjbm8DGZGk/D+
         lsE54aJTzx0jU6Kpa8f9+2g9GDkzUTriQwvnHuvoCPPOAscmV+C49g2lm5R2Wg22CGZ9
         i7FR8/U2cv4l5amaGlQuvmKLzdGI4JSH+I2UT3uvLTB1yxV/yUSlLeKHxvh+lZ931pg5
         onmbTWhuynOC2tWlMxQq3o3pDWAUVx53yYrHWSm4fwPPv0OVz/SNEu8Nueh0rlUQsbd9
         Tcrso3N3btuYgxknq/pLFyjmSKspEhq7QJXdlrTRxL9uBYVzhYJXMXQ53f8uff/3MH9j
         g2Jg==
X-Gm-Message-State: AOAM533lFMn7ymaFvhOvaXBwZJsqjRN8Kw5zS7PZEgcLsMJGvxp6cF+p
        U9rx5u3Aig+Fvc66TdQv2Q==
X-Google-Smtp-Source: ABdhPJy49y22kLS9d/WyIC9ajGLpmAUxVb+mt4q2p/FqjQ7LQ4zq/L9X0mp5DRJqVySH6KSGKlsQBQ==
X-Received: by 2002:a9d:2271:: with SMTP id o104mr1314514ota.201.1621461326401;
        Wed, 19 May 2021 14:55:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v22sm171283oic.37.2021.05.19.14.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 14:55:24 -0700 (PDT)
Received: (nullmailer pid 3727657 invoked by uid 1000);
        Wed, 19 May 2021 21:55:23 -0000
Date:   Wed, 19 May 2021 16:55:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        devicetree@vger.kernel.org, khsieh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, sean@poorly.run,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        vinod.koul@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, abhinavk@codeaurora.org,
        dianders@chromium.org
Subject: Re: [PATCH v16 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Message-ID: <20210519215523.GA3727626@robh.at.kernel.org>
References: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
 <1621332225-31918-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621332225-31918-3-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 May 2021 15:33:44 +0530, Krishna Manikandan wrote:
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
> 
> Changes in v6:
>    - Add proper compatible string in example
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

Reviewed-by: Rob Herring <robh@kernel.org>
