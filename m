Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4366213C688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgAOOtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:49:47 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43195 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbgAOOtq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:49:46 -0500
Received: by mail-oi1-f196.google.com with SMTP id p125so15577455oif.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H1ze89BBE7QI+NzTkr8tdkM1RIqde14fHEiBxrkkmaI=;
        b=o4ubrKX4EU2mXtiEPt4Rz0G2/ZW39cL6NuXewBRJbRr4ybzeYG8YnbD3HJCjT5hh08
         FzgM8yjJl1Fw/aJaKpApFys9m5ItHOp4phxBcm2hgxC1/dTKSjxX6N0jDFQ9iv7wlnH/
         9QUde9KDfTsviAUfC0lZvEYA8gX1RckHd1dQROgUIEyAAoL73P+biwpX/guaXCs3LllP
         gljjam9bDnj6CtmR83kpvEFlrLx2H5U081YdhCdSAlBpaB04KxgoTLf5TxGx4v7q8DAZ
         698behTYMnp0HTXJZiU20ePAldXEU7bRUAxwDfS5biLZLWIHb2NEAS9pUT6lWuTMCLSu
         T64Q==
X-Gm-Message-State: APjAAAW90oDGT4jqXTIaO4rFi1ZcrZE0cRCgEdF2n0x4hbHMI6x9Kgyg
        iNDOTciurFlkWopz6B/LhXl4Ah4=
X-Google-Smtp-Source: APXvYqz6Jhyju1Q76FJvwfWmsd15nppmhK7Oh4snH/KL0zQ1wfmCDKw08tC0nRBm1QuIPhIN4Zoavw==
X-Received: by 2002:aca:554d:: with SMTP id j74mr97006oib.92.1579099785510;
        Wed, 15 Jan 2020 06:49:45 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w72sm5716013oie.49.2020.01.15.06.49.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:49:43 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:49:42 -0600
Date:   Wed, 15 Jan 2020 08:49:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Dai <daidavid1@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: interconnect: Update Qualcomm SDM845
 DT bindings
Message-ID: <20200115144942.GA15075@bogus>
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org>
 <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 09, 2020 at 08:33:01PM -0800, David Dai wrote:
> Redefine the Network-on-Chip devices to more accurately describe
> the interconnect topology on Qualcomm's SDM845 platform. Each
> interconnect device can communicate with different instances of the
> RPMh hardware which are described as RSCs(Resource State Coordinators).
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,sdm845.yaml         | 49 ++++++++++++++++++----
>  1 file changed, 40 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> index 61e0097..6741a12 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> @@ -13,21 +13,44 @@ description: |
>     SDM845 interconnect providers support system bandwidth requirements through
>     RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>     able to communicate with the BCM through the Resource State Coordinator (RSC)
> -   associated with each execution environment. Provider nodes must reside within
> -   an RPMh device node pertaining to their RSC and each provider maps to a
> -   single RPMh resource.
> +   associated with each execution environment. Provider nodes must point to at
> +   least one RPMh device child node pertaining to their RSC and each provider
> +   can map to multiple RPMh resources.
>   
>  properties:
> +  reg:
> +    maxItems: 1
> +
>    compatible:
>      enum:
> -      - qcom,sdm845-rsc-hlos
> +      - qcom,sdm845-aggre1-noc
> +      - qcom,sdm845-aggre2-noc
> +      - qcom,sdm845-config-noc
> +      - qcom,sdm845-dc-noc
> +      - qcom,sdm845-gladiator-noc
> +      - qcom,sdm845-mem-noc
> +      - qcom,sdm845-mmss-noc
> +      - qcom,sdm845-system-noc
>  
>    '#interconnect-cells':
>      const: 1
>  
> +  qcom,bcm-voter-names:
> +    items:
> +      - const: apps
> +      - const: disp

If these are always the names, why do you need them?

> +
> +  qcom,bcm-voters:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      List of phandles to qcom,bcm-voter nodes that are required by
> +      this interconnect to send RPMh commands.

Is the max length 2?

> +
>  required:
>    - compatible
> +  - reg
>    - '#interconnect-cells'
> +  - qcom,bcm-voters
>  
>  additionalProperties: false
>  
> @@ -35,9 +58,17 @@ examples:
>    - |
>        #include <dt-bindings/interconnect/qcom,sdm845.h>
>  
> -      apps_rsc: rsc {
> -              rsc_hlos: interconnect {
> -                      compatible = "qcom,sdm845-rsc-hlos";
> -                      #interconnect-cells = <1>;
> -              };
> +      mem_noc: interconnect@1380000 {
> +             compatible = "qcom,sdm845-mem-noc";
> +             reg = <0 0x01380000 0 0x27200>;
> +             #interconnect-cells = <1>;
> +             qcom,bcm-voters = <&apps_bcm_voter>;
> +      };
> +
> +      mmss_noc: interconnect@1740000 {
> +             compatible = "qcom,sdm845-mmss-noc";
> +             reg = <0 0x01740000 0 0x1c1000>;
> +             #interconnect-cells = <1>;
> +             qcom,bcm-voter-names = "apps", "disp";
> +             qcom,bcm-voters = <&apps_bcm_voter>, <&disp_bcm_voter>;
>        };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
