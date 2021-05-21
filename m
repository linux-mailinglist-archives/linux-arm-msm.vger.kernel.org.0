Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC7938CD6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 20:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbhEUSbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 14:31:08 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:42503 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhEUSbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 14:31:08 -0400
Received: by mail-oo1-f51.google.com with SMTP id v13-20020a4ac00d0000b029020b43b918eeso4781192oop.9;
        Fri, 21 May 2021 11:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tz6qVE77xjQTgH3EvwvCGLs3nMgxHBUD5V9Eqv4sIOg=;
        b=JMoW7VsKSvf8kAxjE5U6dLCN2Wbx8h1+UD5MIpw9fh1tSC5JGHfPWoIYFKDGFTXp31
         izKLX4ay0dJnlAjZir7ZvSg8ag/He5VxjGfSJ00mrFea4F29RfH/sVHOfgiIsD97uYpr
         mRZxAStxAYumQel+wIP+l/cwfuc065UibtHEJyzfTe7680g0nu7HG2LsoCuY41ZTcoyD
         vWdR7DERpsjdkwyywAqDBk2W4nFQxqEmTKuOq//elhl7ISLDb8XzqJdZyz9RwWwOcIzV
         TXdWOSCzu5/sGrh+W6nbtaxunf0jkEOly+cvmbyPlryWSfvyvJP5qkdTxCqMEaT5+USj
         CAKw==
X-Gm-Message-State: AOAM530l5XZQULEoi4wxxvJDFf1WHlqN2xwYr4qYCa1U+XekdARjlNHN
        ZDz07UHUdFZ6bW/qIgwLWw==
X-Google-Smtp-Source: ABdhPJwUaOQ3rcWENSb9U/Qt8wdNmQKm47UAKpPeq/0cATJVzmjSXBXOkw6hCj5jPwgDDocmleAxSw==
X-Received: by 2002:a4a:6142:: with SMTP id u2mr9229182ooe.9.1621621783445;
        Fri, 21 May 2021 11:29:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l186sm1262215oih.55.2021.05.21.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:29:42 -0700 (PDT)
Received: (nullmailer pid 163550 invoked by uid 1000);
        Fri, 21 May 2021 18:29:41 -0000
Date:   Fri, 21 May 2021 13:29:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     khsieh@codeaurora.org, swboyd@chromium.org, vinod.koul@linaro.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org, sean@poorly.run,
        kalyan_t@codeaurora.org, bjorn.andersson@linaro.org,
        dianders@chromium.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Message-ID: <20210521182941.GA163205@robh.at.kernel.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 May 2021 15:57:23 +0530, Krishna Manikandan wrote:
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


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

