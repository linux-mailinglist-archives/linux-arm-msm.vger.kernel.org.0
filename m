Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF25B38CD6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 20:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhEUSae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 14:30:34 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:33369 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhEUSad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 14:30:33 -0400
Received: by mail-oi1-f181.google.com with SMTP id b25so20567696oic.0;
        Fri, 21 May 2021 11:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8emx9ZI3CrAcxovqlGVNx1EFwTvU6MTMB4GL7Tv15Ik=;
        b=RMDSpOenNDp8BeUvDibf/0rXAsrxqsWFtoT7UUQZYUUDbYzHd6W1XUZ+fhKKM28lSl
         rc8tBOjbsL3rQ7V1eQYgHfM6wpAC2JcOUhSaUgx9MLbDbOnZmO6dy5UUYakTnfEf33AI
         eHGGF1POfujQR/ZMNxA3MxRL4sJ03O841IgY/GwkLgc/pmdA/kBthmwiS6z4YvEZF7GT
         KGRFGrdQ+VnplgxfzCC2yb9D/zeuSM6LZa1/o8lCIQKj493UvkiJvu/j2rWAasrqdHYo
         XVeBbSMR6ldX9pTsHBjhx+e+MmimOc89wXhbJdIBFPCOsu2gUtIN1FjyEbeak1dwjdRW
         zn0g==
X-Gm-Message-State: AOAM532J0iyxpFTmA9EzWqoN8Kh8IFcWsuTVQJlaRxW8ejpiFceCIxyr
        pSU2gprgchKy1EOW0+Ae8Q==
X-Google-Smtp-Source: ABdhPJzImzD+1PZ0sMh1zRAT7Crgc0DGWCKYrQp2JRd0FGG8b+zGLHg3aLxiNlyHeWoG3rKDP/yUAg==
X-Received: by 2002:aca:d18:: with SMTP id 24mr2997436oin.56.1621621750075;
        Fri, 21 May 2021 11:29:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm1296649oie.32.2021.05.21.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:29:09 -0700 (PDT)
Received: (nullmailer pid 162381 invoked by uid 1000);
        Fri, 21 May 2021 18:29:07 -0000
Date:   Fri, 21 May 2021 13:29:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, khsieh@codeaurora.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dianders@chromium.org, tanmay@codeaurora.org, robh+dt@kernel.org,
        kalyan_t@codeaurora.org, sean@poorly.run,
        linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210521182907.GA161758@robh.at.kernel.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 May 2021 15:57:21 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
>     - Changed dpu to DPU (Sam Ravnborg)
>     - Fixed indentation issues (Sam Ravnborg)
>     - Added empty line between different properties (Sam Ravnborg)
>     - Replaced reference txt files with  their corresponding
>       yaml files (Sam Ravnborg)
>     - Modified the file to use "|" only when it is
>       necessary (Sam Ravnborg)
> 
> Changes in v3:
>     - Corrected the license used (Rob Herring)
>     - Added maxItems for properties (Rob Herring)
>     - Dropped generic descriptions (Rob Herring)
>     - Added ranges property (Rob Herring)
>     - Corrected the indendation (Rob Herring)
>     - Added additionalProperties (Rob Herring)
>     - Split dsi file into two, one for dsi controller
>       and another one for dsi phy per target (Rob Herring)
>     - Corrected description for pinctrl-names (Rob Herring)
>     - Corrected the examples used in yaml file (Rob Herring)
>     - Delete dsi.txt and dpu.txt (Rob Herring)
> 
> Changes in v4:
>     - Move schema up by one level (Rob Herring)
>     - Add patternProperties for mdp node (Rob Herring)
>     - Corrected description of some properties (Rob Herring)
> 
> Changes in v5:
>     - Correct the indentation (Rob Herring)
>     - Remove unnecessary description from properties (Rob Herring)
>     - Correct the number of interconnect entries (Rob Herring)
>     - Add interconnect names for sc7180 (Rob Herring)
>     - Add description for ports (Rob Herring)
>     - Remove common properties (Rob Herring)
>     - Add unevalutatedProperties (Rob Herring)
>     - Reference existing dsi controller yaml in the common
>       dsi controller file (Rob Herring)
>     - Correct the description of clock names to include only the
>       clocks that are required (Rob Herring)
>     - Remove properties which are already covered under the common
>       binding (Rob Herring)
>     - Add dsi phy supply nodes which are required for sc7180 and
>       sdm845 targets (Rob Herring)
>     - Add type ref for syscon-sfpb (Rob Herring)
> 
> Changes in v6:
>     - Fixed errors during dt_binding_check (Rob Herring)
>     - Add maxItems for phys and phys-names (Rob Herring)
>     - Use unevaluatedProperties wherever required (Rob Herring)
>     - Removed interrupt controller from required properties for
>       dsi controller (Rob Herring)
>     - Add constraints for dsi-phy reg-names based on the compatible
>       phy version (Rob Herring)
>     - Add constraints for dsi-phy supply nodes based on the
>       compatible phy version (Rob Herring)
> 
> Changes in v7:
>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
>     - Modify the schema for data-lanes (Rob Herring)
>     - Split the phy schema into separate schemas based on
>       the phy version (Rob Herring)
> 
> Changes in v8:
>     - Resolve merge conflicts with latest dsi.txt file
>     - Include dp yaml change also in the same series
> 
> Changes in v9:
>     - Combine target specific dsi controller yaml files
>       to a single yaml file (Rob Herring)
>     - Combine target specific dsi phy yaml files into a
>       single yaml file (Rob Herring)
>     - Use unevaluatedProperties and additionalProperties
>       wherever required
>     - Remove duplicate properties from common yaml files
> 
> Changes in v10:
>     - Split the patch into separate patches for DPU, DSI and
>       PHY (Stephen Boyd)
>     - Drop unnecessary fullstop (Stephen Boyd)
>     - Add newline whereever required (Stephen Boyd)
>     - Add description for clock used (Stephen Boyd)
>     - Modify the description for interconnect entries  (Stephen Boyd)
>     - Drop assigned clock entries as it a generic property (Stephen Boyd)
>     - Correct the definition for interrupts (Stephen Boyd)
>     - Drop clock names from required properties (Stephen Boyd)
>     - Drop labels for display nodes from example (Stephen Boyd)
>     - Drop flags from interrupts entries (Stephen Boyd)
> 
> Changes in v11:
>     - Drop maxItems for clocks (Stephen Boyd)
> 
> Changes in v12:
>     - Add description for register property (Stephen Boyd)
>     - Add maxItems for interrupts (Stephen Boyd)
>     - Add description for iommus property (Stephen Boyd)
>     - Add description for interconnects (Stephen Boyd)
>     - Change display node name to display_controller (Stephen Boyd)
> 
> Changes in v13:
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add ranges property in example (Stephen Boyd)
>     - Modify description for iommus property (Stephen Boyd)
>     - Add Dp bindings for ports in the same patch (Stephen Boyd)
>     - Remove soc from examples and change address and size cells
>       accordingly (Stephen Boyd)
>     - Add reference for ports
> 
> Changes in v14:
>     - Modify title for SC7180 and SDM845 yaml files (Stephen Boyd)
>     - Add required list for display-controller node (Stephen Boyd)
> 
> Changes in v16:
>     - Add reference for port (Rob Herring)
>     - Make additionalProperties as false (Rob Herring)
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 228 +++++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 212 +++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 -------------
>  3 files changed, 440 insertions(+), 141 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

