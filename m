Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963483898D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhESVuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 17:50:19 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:43852 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhESVuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 17:50:19 -0400
Received: by mail-ot1-f53.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso2442460otu.10;
        Wed, 19 May 2021 14:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DKBY4C70+yMGXVKS4zX8Rv3RkluTwSHLjx9Ijn2Fbu0=;
        b=Sqn3jgEoo2GcSzPaFRYpBKd2IwR3H4BHhanmIC8vwe+WkPEONg91yJEQtaBrKShGzj
         wUKB+1BdaxeDq+Nr1l0j5Wmmrtp7KXGkfLC952ItSna7A+9C+vwR26dT3gs7GaAn6dbt
         eyo0od8n4eh8QlKpAD3H0N6NpW9xiAy135twHq8uwhUvTw8xjm2g7jG4/2T7XUjJ96FF
         RQBlteJ0kELSSjJ/Ww5jGCJPszZ3lhXF97F0vQSxEy0ntLEpmtOZGmwdSWCqLomY55x/
         rR8PO9s6vvCilgJwSv1yC229YkS4QIeexHimtRNhiXsHXZjSdufe1E46zG4Zm5taAOnk
         at3A==
X-Gm-Message-State: AOAM531xJ/q6r3p0Gl8jrTdGxFymRr0W4RQdrSA4M4GH/hmg+sSfWCam
        4nfDRdmb30/9qCyyUqwVLg==
X-Google-Smtp-Source: ABdhPJye89tMFxcBxGyJDTEoGXfkCtFUTPgxthvAlCu61laiKziMZZtdD04ofYvGHcI35GzSfLpUag==
X-Received: by 2002:a9d:61cb:: with SMTP id h11mr1263447otk.19.1621460937495;
        Wed, 19 May 2021 14:48:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i18sm129061oot.48.2021.05.19.14.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 14:48:56 -0700 (PDT)
Received: (nullmailer pid 3717476 invoked by uid 1000);
        Wed, 19 May 2021 21:48:55 -0000
Date:   Wed, 19 May 2021 16:48:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     swboyd@chromium.org, robh+dt@kernel.org, khsieh@codeaurora.org,
        dianders@chromium.org, freedreno@lists.freedesktop.org,
        kalyan_t@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, tanmay@codeaurora.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org, sean@poorly.run, vinod.koul@linaro.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v16 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210519214855.GA3717420@robh.at.kernel.org>
References: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 May 2021 15:33:42 +0530, Krishna Manikandan wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
