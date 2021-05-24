Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A9338F5D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 00:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhEXWty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 18:49:54 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35802 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhEXWty (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 18:49:54 -0400
Received: by mail-oi1-f176.google.com with SMTP id v22so28542240oic.2;
        Mon, 24 May 2021 15:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KpKDmmYFy0WymhW++fAl7+6dJhCoWfgKM1MbYWz2Ja0=;
        b=n4wwH1uIkcj5iikHrDD60fGOWUII/6kSCSeU6vzhzoZuZeMZlw6jysBTeiQ8AxEt1V
         Bpu1hQ6CPNSed0gwRgMNWJfNM4jCqVrFT2IvrblwoRHI4nkhSerfpqcxmk8em1m5R3SS
         a0olMzyfUyXmWJLBXfpE9rNmLGX2F+NrVOoJbLqGmGwUlSelw7h/L1mhTqzTlXEBbkru
         O1y4c++lLHmTEy9abgkLnEqRvP8St4wLoKKFYnNUR0gjQQ+gxWuQAlRgeMkQb7ilPCH9
         x4bh6B+8TDjFHWnGU1LTkbifFb2DvaKIE2gx3hMAAGGc8S5bE/Pc6CR1pQScJruDdGgu
         C8VA==
X-Gm-Message-State: AOAM532/RKcykr77jj52UqTuuiikClTlnTlO4NXX/ZDk8gsuQMSqT3w9
        32Kh3GVPN7MNGWyBavDIuA6I54dIXg==
X-Google-Smtp-Source: ABdhPJz5h2oM8aTFPJKI31HulznG3xW2XN9lU0oXrZlOIYquqz8vF2erRkrzWxbLCYco4ih9DhrhXw==
X-Received: by 2002:a05:6808:4cf:: with SMTP id a15mr886196oie.78.1621896494189;
        Mon, 24 May 2021 15:48:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c19sm2881987oiw.7.2021.05.24.15.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 15:48:13 -0700 (PDT)
Received: (nullmailer pid 1314077 invoked by uid 1000);
        Mon, 24 May 2021 22:48:12 -0000
Date:   Mon, 24 May 2021 17:48:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, khsieh@codeaurora.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        abhinavk@codeaurora.org, tanmay@codeaurora.org,
        freedreno@lists.freedesktop.org, swboyd@chromium.org,
        devicetree@vger.kernel.org, vinod.koul@linaro.org,
        kalyan_t@codeaurora.org, bjorn.andersson@linaro.org,
        sean@poorly.run
Subject: Re: [PATCH v18 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
Message-ID: <20210524224812.GA1314047@robh.at.kernel.org>
References: <1621856653-10649-1-git-send-email-mkrishn@codeaurora.org>
 <1621856653-10649-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621856653-10649-2-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 May 2021 17:14:11 +0530, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
> 
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
> 
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
> 
> Changes in v4:
>     - Add maxItems for phys property (Stephen Boyd)
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add reference for data-lanes property (Stephen Boyd)
>     - Remove soc from example (Stephen Boyd)
> 
> Changes in v5:
>     - Modify title and description (Stephen Boyd)
>     - Add required properties for ports node (Stephen Boyd)
>     - Add data-lanes in the example (Stephen Boyd)
>     - Drop qcom,master-dsi property (Stephen Boyd)
> 
> Changes in v6:
>     - Add required properties for port@0, port@1 and corresponding
>       endpoints (Stephen Boyd)
>     - Add address-cells and size-cells for ports (Stephen Boyd)
>     - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
> 
> Changes in v7:
>     - Add reference for ports and data-lanes (Rob Herring)
>     - Add maxItems and minItems for data-lanes (Rob Herring)
> 
> Changes in v8:
>     - Drop common properties and description from ports (Rob Herring)
>     - Add reference for endpoint (Rob Herring)
>     - Add correct reference for data-lanes (Rob Herring)
>     - Drop common properties from required list for ports (Rob Herring)
> 
> Changes in v9:
>     - Drop reference for data-lanes (Rob Herring)
>     - Add unevaluatedProperties for endpoint (Rob Herring)
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  | 185 +++++++++++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
>  2 files changed, 185 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
