Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F221552F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 08:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgBGH1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 02:27:45 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:15874 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbgBGH1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 02:27:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581060464; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KTv4fIeCwA0tv++pqo2+X+UtVG51ml7PK4d9aLsLQYg=;
 b=DkzCbLZZA9RckoNt+E5o3YGF9zEOFMB+kmvUaztcZ5dcJubSoMIljVLLtLstUXOR5E8Lv7S1
 ztS63eqpXSESsWe9Z///JWDIyu1wbAV/SEyPvbejqvNUYuvyZ3zS+9kIiJ0BWCosdJY7+e2h
 yZq4Zuxv+idjGmFsK5YKNNLpA/g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d1170.7f12b35fb5a8-smtp-out-n01;
 Fri, 07 Feb 2020 07:27:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E47EBC4479C; Fri,  7 Feb 2020 07:27:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B10CC43383;
        Fri,  7 Feb 2020 07:27:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Feb 2020 12:57:43 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Michael_Turquette_=C2=A0?= <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
In-Reply-To: <1580357923-19783-2-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
 <1580357923-19783-2-git-send-email-tdas@codeaurora.org>
Message-ID: <8d29b13e5444676df46b2479a1f48e36@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Taniya,

On 2020-01-30 09:48, Taniya Das wrote:
> The Modem Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 58 
> ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/clock/qcom,mss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..ebb04e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +properties:
> +  compatible:
> +    enum:
> +       - qcom,sc7180-mss
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      - description: gcc_mss_mfab_axi clock from GCC
> +      - description: gcc_mss_nav_axi clock from GCC

we don't seem to be referencing the
mss_mfab_axi and mss_nav_axi in the
mss clk driver though, do we really
need them in bindings? If we dont
can we drop the clock-names as well.

> +      - description: gcc_mss_cfg_ahb clock from GCC
> +
> +  clock-names:
> +    items:
> +      - const: gcc_mss_mfab_axis_clk
> +      - const: gcc_mss_nav_axi_clk
> +      - const: cfg_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example of MSS with clock nodes properties for SC7180:
> +  - |
> +    clock-controller@41a8000 {
> +      compatible = "qcom,sc7180-mss";
> +      reg = <0x041a8000 0x8000>;
> +      clocks = <&gcc 126>, <&gcc 127>, <&gcc 125>;
> +      clock-names = "gcc_mss_mfab_axis_clk", "gcc_mss_nav_axi_clk", 
> "cfg_clk";
> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a 
> member
> of the Code Aurora Forum, hosted by the  Linux Foundation.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
