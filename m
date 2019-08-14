Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D76E18D242
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 13:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfHNLeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 07:34:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44472 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfHNLeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 07:34:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7CBDC607F1; Wed, 14 Aug 2019 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565782484;
        bh=b2jQMWzdFfaiBKrnO+UzX1RZMx1ZpZC8kl9TtoYO7vw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nLsND9JYti7vgLF+IVn/CPPUA7aSDfuTJefNobMGVVaPFvPxHwJxjBPJY3tyW0S43
         YPPlkbvRjb15EdpQtiOiiwg0aA8npQzFepUNzBxDfR3A5jZ1RosDv2RTDC2VVTx1z9
         n+GTheo2dKQecq2kp9FBzGBX50OlqM36gXYSlYxw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id A92D060392;
        Wed, 14 Aug 2019 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565782483;
        bh=b2jQMWzdFfaiBKrnO+UzX1RZMx1ZpZC8kl9TtoYO7vw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Tv43NQ7c6CUs7smO+hqpHlo9Wz4CQf8n8VcbBm35s0Hqvgw9tl97fKyRIXQ6sOELM
         tuIAjnkaJkxhaRG9n5288IfE9CWoRBHmb0TLuwKMrnb31rFzNFElJmur6EmwnEBYXH
         Qwnu0nrolqJfnMLOo/t6B/6jfz1V072Mn9VWFSDw=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 14 Aug 2019 17:04:43 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
In-Reply-To: <20190807112432.26521-2-sibis@codeaurora.org>
References: <20190807112432.26521-1-sibis@codeaurora.org>
 <20190807112432.26521-2-sibis@codeaurora.org>
Message-ID: <8d32736068a35e250e42e2d70f07dd28@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

on running dt_binding_check found a
few errors which I'll fix in the next
re-spin.


On 2019-08-07 16:54, Sibi Sankar wrote:
> Add bindings for Operating State Manager (OSM) L3 interconnect provider
> on SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,osm-l3.yaml    | 55 +++++++++++++++++++
>  .../dt-bindings/interconnect/qcom,osm-l3.h    | 13 +++++
>  2 files changed, 68 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h
> 
> diff --git
> a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> new file mode 100644
> index 0000000000000..51a4722e1a69f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Operating State Manager (OSM) L3 Interconnect Provider
> +
> +maintainers:
> +  - Sibi Sankar <sibis@codeaurora.org>
> +
> +description:
> +  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the 
> OSM.
> +  The OSM L3 interconnect provider aggregates the L3 bandwidth 
> requests
> +  from CPU/GPU and relays it to the OSM.
> +
> +properties:
> +  compatible:
> +    const: "qcom,sdm845-osm-l3"
> +
> +  reg:
> +    maxItems: 1
> +    description: OSM L3 registers

will correct the error ^^

> +
> +  clocks:
> +    items:
> +      - description: xo clock
> +      - description: alternate clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: alternate
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clocks-names

s/clocks-names/clock-names

> +  - '#interconnect-cells'
> +
> +examples:
> +  - |
> +    osm_l3: interconnect@17d41000 {
> +      compatible = "qcom,sdm845-osm-l3";
> +      reg = <0 0x17d41000 0 0x1400>;
> +
> +      clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;

will replace rpmh_cxo_clk with 0
and GPLL0 with 165

> +      clock-names = "xo", "alternate";
> +
> +      #interconnect-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h
> b/include/dt-bindings/interconnect/qcom,osm-l3.h
> new file mode 100644
> index 0000000000000..6662134c84248
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +
> +#define MASTER_OSM_L3_APPS	0
> +#define MASTER_OSM_L3_GPU	1
> +#define SLAVE_OSM_L3		2
> +
> +#endif

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
