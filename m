Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71AA513C669
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbgAOOox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:44:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44415 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgAOOox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:44:53 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so15535745oia.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ky4RIbVWy7rBgUBCjlLOjE84AfoKdzvyQIgA25sSC+w=;
        b=OdVP4X8nk0+ucW8M9T10cYN0mgIU38GoXYq3lro67rMntyZHKfa3KOcN7VL1ps8XQ9
         fP1DLUACDE+Ee3WTFU7aCt4RzhnjJfmwHLwO5mYpxOVpHMr3ZcEP1Pe8ZjqiMRl5VfLQ
         dlZHTWa3mFsG5vx+fLjjYLPYbLCXlvGtRRYWVZDvK7V3agORDUstq/qgnMAtg3uovgKg
         236qZJ40cBiwoKOzFGblqFFa6yiX190s8JBG2MaCxXyw+pcdDzgYA1JZ0LpD73id9wRT
         swEuTkSvQCDMC0xNqr4J4vnH1AHKkQfWqale8uWrjd22ToTuiBWs5lv+7C9vTzgv85zl
         FMQQ==
X-Gm-Message-State: APjAAAWkyNlzqNrROZ2WXid2xUzTD7dvHaN75t3INxvuDrSuQYZ+x9OK
        o0p62fJYCKl8yO5rIZq6hOLbPM0=
X-Google-Smtp-Source: APXvYqy1oBlLEZhX8B2fHJi2cw/Lr8vih9AIIXNeGKSNrSPsuZEa51VYEaiiUeRas12+Cs6wH5RXIA==
X-Received: by 2002:aca:5588:: with SMTP id j130mr70616oib.122.1579099491976;
        Wed, 15 Jan 2020 06:44:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e65sm6650752otb.62.2020.01.15.06.44.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:44:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:44:49 -0600
Date:   Wed, 15 Jan 2020 08:44:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Dai <daidavid1@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: interconnect: Add YAML schemas for
 QCOM bcm-voter
Message-ID: <20200115144449.GA5371@bogus>
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org>
 <1578630784-962-3-git-send-email-daidavid1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578630784-962-3-git-send-email-daidavid1@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 09, 2020 at 08:33:00PM -0800, David Dai wrote:
> Add YAML schemas for interconnect bcm-voters found on QCOM RPMh-based
> SoCs.
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,bcm-voter.yaml      | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> new file mode 100644
> index 0000000..a6bdf6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,bcm-voter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm BCM-Voter Interconnect
> +
> +maintainers:
> +  - David Dai <daidavid1@codeaurora.org>
> +
> +description: |

Don't need '|' unless you need formatting preserved.

> +    The Bus Clock Manager (BCM) is a dedicated hardware accelerator
> +    that manages shared system resources by aggregating requests
> +    from multiple Resource State Coordinators (RSC). Interconnect
> +    providers are able to vote for aggregated thresholds values from
> +    consumers by communicating through their respective RSCs.

Indent should be 2 spaces.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sdm845-bcm-voter
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apps_rsc: interconnect@179c0000 {

Unit-address should also have 'reg' property.

> +        compatible = "qcom,rpmh-rsc";

Note that once this has a schema, it will be checked, so make sure it's 
complete.

> +
> +        apps_bcm_voter: bcm_voter {
> +            compatible = "qcom,sdm845-bcm-voter";
> +        };
> +    };
> +
> +    disp_rsc: interconnect@179d0000 {
> +        compatible = "qcom,rpmh-rsc";
> +
> +        disp_bcm_voter: bcm_voter {
> +            compatible = "qcom,sdm845-bcm-voter";
> +        };
> +    };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
