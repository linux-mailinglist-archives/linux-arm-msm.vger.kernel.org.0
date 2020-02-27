Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B9E17151F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 11:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgB0Ki0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 05:38:26 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:22690 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728680AbgB0KiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 05:38:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582799905; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HgiY1jeOUKwTpMWR+Oc2ZANc5/ISbPjM6rPSOD/t/mI=;
 b=hHQCkcZab2rgDawYHLFvyEOo6/YFCBTntQMufc5lOp7fHnKe82J8WbKwpnuos9vUsSf/wd6H
 HoG2cHNfTOO4sVNX64hYb0G0Xz13jlkWCG4BpIXD5aKIuXPw0ty2TdtL+X5cOh0RfEd3obTY
 kpyVm0OgkpamJvCy2slhwpn+j0g=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e579c1c.7fb06d5828b8-smtp-out-n01;
 Thu, 27 Feb 2020 10:38:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37C88C4479F; Thu, 27 Feb 2020 10:38:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65CDFC43383;
        Thu, 27 Feb 2020 10:38:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 Feb 2020 16:08:19 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
In-Reply-To: <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
Message-ID: <e94805e32d1264ca9a162891db26730e@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Sivaprakash,

On 2020-02-27 15:25, Sivaprakash Murugesan wrote:
> add dt-binding for ipq6018 apss clock controller
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,apsscc.yaml     | 58 
> ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,apss-ipq6018.h      | 26 ++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
> b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
> new file mode 100644
> index 0000000..7433721
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,apsscc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ6018 APSS Clock Controller Binding
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +
> +description: |
> +  Qualcomm IPQ6018 APSS clock control module which supports the clocks 
> with
> +  frequencies above 800Mhz.
> +
> +properties:
> +  compatible :
> +    const: qcom,apss-ipq6018

Please use qcom,<chip>-<device>
instead.

> +
> +  clocks:
> +    description: clocks required for this controller.
> +    maxItems: 4
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
> diff --git a/include/dt-bindings/clock/qcom,apss-ipq6018.h
> b/include/dt-bindings/clock/qcom,apss-ipq6018.h
> new file mode 100644
> index 0000000..ed9d7d8
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,apss-ipq6018.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + *
> + * Permission to use, copy, modify, and/or distribute this software 
> for any
> + * purpose with or without fee is hereby granted, provided that the 
> above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL 
> WARRANTIES
> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE 
> FOR
> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY 
> DAMAGES
> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN 
> AN
> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING 
> OUT OF
> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

^^ is not needed just the SPDX
license identifier is enough.

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

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
