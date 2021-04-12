Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB7435CF2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 19:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243558AbhDLRFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 13:05:07 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:45648 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243708AbhDLRDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 13:03:55 -0400
Received: by mail-oi1-f178.google.com with SMTP id d12so14074200oiw.12;
        Mon, 12 Apr 2021 10:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bk4HDeKR+toH2oCWOomBubb2tI7dn2Ufe/jMDW0e+EI=;
        b=Up12KUhmMmixqdSNnU42srIuDmb0NoiLNZmi2X/7mXPa0IUZ9ZpBpPPHqiTr0aTX50
         nsOIjnEtZYdoftoscML9zs9DQKljAirUzynkvP7QsZuDfUQC9ezgngYstwR5epTG8dny
         YPT/PM0LuPFb+AmF0ZMLDB8ebL3dxUKLwExRslmGSwpWXfMj/oH5JbhGA+7ptnqdtv5w
         /gnm4luuMycxRyr66uJwbcLVtxfmg49CnUhqqwCxaB9udqhUjca4ZpmpMxWfB8JiQ0Pf
         Zvz6GoXvDp/o2aHtfFGwTDs17XyIXe62EaChz+VodQWL417U3reS5G9ytOvITfelku2J
         vaVQ==
X-Gm-Message-State: AOAM533OePjYI33eqKqPTkb735kNjp5Go4jaFSRdIU/aBC7z8O1ol5BG
        SC/XSYev1RYBLnIVDPuxyw==
X-Google-Smtp-Source: ABdhPJzaCMtbVP2hz7fdM7Un2vWUQwgynfH1W8jP6A19AA/xnu2qLRSJ+VRbIm/94kkBdX66ZgumHA==
X-Received: by 2002:a05:6808:a8a:: with SMTP id q10mr69213oij.167.1618247016335;
        Mon, 12 Apr 2021 10:03:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 62sm2788817oto.60.2021.04.12.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:03:35 -0700 (PDT)
Received: (nullmailer pid 4049154 invoked by uid 1000);
        Mon, 12 Apr 2021 17:03:34 -0000
Date:   Mon, 12 Apr 2021 12:03:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7280
Message-ID: <20210412170334.GA3971998@robh.at.kernel.org>
References: <1617969272-10246-1-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617969272-10246-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 09, 2021 at 05:24:31PM +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Add the LPASS clock IDs for
> LPASS PIL client to request for the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7280-lpasscc.yaml        | 69 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,lpass-sc7280.h      | 16 +++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpass-sc7280.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> new file mode 100644
> index 0000000..7b62763
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7280-lpasscc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Core Clock Controller Binding for SC7280
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm LPASS core clock control module which supports the clocks and
> +  power domains on SC7280.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,lpass-sc7280.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-lpasscc
> +
> +  clocks:
> +    items:
> +      - description: gcc_cfg_noc_lpass_clk from GCC
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    minItems: 3

You don't need minItems, as 3 is implied.

> +    items:
> +      - description: LPASS qdsp6ss register
> +      - description: LPASS top-cc register
> +      - description: LPASS cc register
> +
> +  reg-names:
> +    items:
> +      - const: qdsp6ss
> +      - const: top_cc
> +      - const: cc
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,lpass-sc7280.h>
> +    clock-controller@3000000 {
> +      compatible = "qcom,sc7280-lpasscc";
> +      reg = <0x03000000 0x40>, <0x03c04000 0x4>, <0x03389000 0x24>;
> +      reg-names = "qdsp6ss", "top_cc", "cc";
> +      clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
> +      clock-names = "iface";
> +      #clock-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,lpass-sc7280.h b/include/dt-bindings/clock/qcom,lpass-sc7280.h
> new file mode 100644
> index 0000000..a259463
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lpass-sc7280.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

What about non-GPL OS users?

> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_SC7280_H
> +#define _DT_BINDINGS_CLK_QCOM_LPASS_SC7280_H
> +
> +#define LPASS_Q6SS_AHBM_CLK				0
> +#define LPASS_Q6SS_AHBS_CLK				1
> +#define LPASS_TOP_CC_LPI_Q6_AXIM_HS_CLK			2
> +#define LPASS_QDSP6SS_XO_CLK				3
> +#define LPASS_QDSP6SS_SLEEP_CLK				4
> +#define LPASS_QDSP6SS_CORE_CLK				5
> +
> +#endif
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
