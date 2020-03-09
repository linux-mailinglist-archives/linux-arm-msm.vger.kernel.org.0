Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFE217EAF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 22:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgCIVNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 17:13:52 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42547 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgCIVNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 17:13:51 -0400
Received: by mail-oi1-f193.google.com with SMTP id l12so11661288oil.9;
        Mon, 09 Mar 2020 14:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1O7KrZaULdV7e7gmb/1OPYLUWRSmATxGTYHmz7Vmh20=;
        b=mkr1CPih4OMFAWgK/cWxUaGjKU2dRtmSp05OltKjRit5GNJuzORk4iSdHFg2dzb3iI
         ArFiw2ayFNvLNj/utRoknekZlaDGQ/PlYNfAR6a/LrClXp5N6HYLU7sb+iXITJjNrQ+g
         1b3ic0IoBrMQ+sjJuVWOCStEYkPOyrCN4mab2AYSh6vJZzfvElpKXqYBVcilF+Xcz3fU
         ONJv2NlHOUcFQT+XFcLbnAA36oTC/kiX5Zlyp7a8QRsp7HYWqwIQs5QnRNXhyzY/2x9e
         u+dVJh91eBZ0x0UualmI+UYRICLo87AzTH75+3FpPGocGiGiEZQ59yASGpGfVsfSosPC
         UUYA==
X-Gm-Message-State: ANhLgQ23m6FaDNVrrqy8kk/8ry+OLa8BP6NVe+M6+1eYNeCjyXiKqIn9
        guzZOrPhKFPio+MkuN0wnw==
X-Google-Smtp-Source: ADFU+vvRj/iiV7KhB8aESxO7wMGC+tAofKVD4gjHWM1jmr1XRP26t2xFFjso8Y1HEz3xzEJRWqX8/g==
X-Received: by 2002:aca:56c5:: with SMTP id k188mr789156oib.165.1583788431056;
        Mon, 09 Mar 2020 14:13:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r8sm2103584otp.7.2020.03.09.14.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 14:13:50 -0700 (PDT)
Received: (nullmailer pid 26024 invoked by uid 1000);
        Mon, 09 Mar 2020 21:13:49 -0000
Date:   Mon, 9 Mar 2020 16:13:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
Message-ID: <20200309211349.GA10752@bogus>
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 03:25:17PM +0530, Sivaprakash Murugesan wrote:
> add dt-binding for ipq6018 apss clock controller
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,apsscc.yaml     | 58 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,apss-ipq6018.h      | 26 ++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
> new file mode 100644
> index 0000000..7433721
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,apsscc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ6018 APSS Clock Controller Binding
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>

I'd expect this to be a QCom person, not who is applying patches.

> +
> +description: |

You can drop '|'.

> +  Qualcomm IPQ6018 APSS clock control module which supports the clocks with
> +  frequencies above 800Mhz.
> +
> +properties:
> +  compatible :
> +    const: qcom,apss-ipq6018

Normal ordering is: qcom,ipq6018-apss

> +
> +  clocks:
> +    description: clocks required for this controller.
> +    maxItems: 4

Need to define what each clock is.

> +
> +  clock-names:
> +    description: clock output names of required clocks.
> +    maxItems: 4
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +      apss_clk: qcom,apss_clk@b111000 {

I thought I'd finally seen the last of these Qcom node names...

clock-controller@...

> +            compatible = "qcom,apss-ipq6018";
> +            clocks = <&xo>, <&gcc GPLL0>,
> +                        <&gcc GPLL2>, <&gcc GPLL4>;
> +            clock-names = "xo", "gpll0",
> +                         "gpll2", "gpll4";
> +            reg = <0xb11100c 0x5ff4>;
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +      };
> +...
> diff --git a/include/dt-bindings/clock/qcom,apss-ipq6018.h b/include/dt-bindings/clock/qcom,apss-ipq6018.h
> new file mode 100644
> index 0000000..ed9d7d8
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,apss-ipq6018.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

I'm pretty sure your employer would like an additional license here.

> +/*
> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + *
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
> +#define _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
> +
> +#define APSS_PLL_EARLY				0
> +#define APSS_PLL				1
> +#define APCS_ALIAS0_CLK_SRC			2
> +#define APCS_ALIAS0_CORE_CLK			3
> +
> +#endif
> -- 
> 2.7.4
> 
