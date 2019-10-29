Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B3AE7E63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 03:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbfJ2CEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 22:04:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44398 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfJ2CEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 22:04:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id n48so8416741ota.11;
        Mon, 28 Oct 2019 19:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HFyv8biFiEa7dI7+8/hKQK/SKrkibEovMGYz51a6e3Q=;
        b=PMiab0SYWy7QtcAdn43dh73BY3tnpVkIcwbDaOwCh7kPydf1wRsJuUpQlAIakxRqiX
         kn3tOrIsY2FcXuC6/h+Rq4tgNsJFibYnsBhEFUqih2CEBzpilllXvVvjFVp4vHEvgAH2
         RNX1kRdmMGJtUYHNHxsaqsSkkAL+3KzA3gwWYmxpNfOi+z81Uxv7NA4fbMU/w4siHZYU
         jcqI4ofCAolAGpC4gZ/L50YMpfCFkLmSxFwoUj3ircqPd7Pe1n4RLhX7lZJ2AAWRSZSk
         z3hTSxjFM9FzQkc7Ive5dkOpBoLjDhKXSAU5qLuZAa5NnqNaeoUwNM1+AX67K/q7zQkt
         Lijw==
X-Gm-Message-State: APjAAAWX9D/mIfsckQJH2rFXpc05JwoC4y1i3whItrvq8q2MNZKvY9HB
        JWu+WJby3v1kGsJ8WBwfZQ==
X-Google-Smtp-Source: APXvYqz/PKQhwGT0k8RL1Zb/NY7UEotlPlxCE0kRl2Ne5SNWKtblnq+z4dve81EPfyp+V4p8my/E/A==
X-Received: by 2002:a9d:469d:: with SMTP id z29mr16109164ote.309.1572314692113;
        Mon, 28 Oct 2019 19:04:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n1sm154935oij.13.2019.10.28.19.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 19:04:51 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:04:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 RPMHCC clock bindings
Message-ID: <20191029020450.GA16322@bogus>
References: <1571393364-32697-1-git-send-email-tdas@codeaurora.org>
 <1571393364-32697-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571393364-32697-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 18, 2019 at 03:39:22PM +0530, Taniya Das wrote:
> The RPMHCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmh-clk.txt    | 27 ------------
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 49 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> deleted file mode 100644
> index 365bbde..0000000
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Qualcomm Technologies, Inc. RPMh Clocks
> --------------------------------------------------------
> -
> -Resource Power Manager Hardened (RPMh) manages shared resources on
> -some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
> -other hardware subsystems via RSC to control clocks.
> -
> -Required properties :
> -- compatible : must be one of:
> -	       "qcom,sdm845-rpmh-clk"
> -	       "qcom,sm8150-rpmh-clk"
> -
> -- #clock-cells : must contain 1
> -- clocks: a list of phandles and clock-specifier pairs,
> -	  one for each entry in clock-names.
> -- clock-names: Parent board clock: "xo".
> -
> -Example :
> -
> -#include <dt-bindings/clock/qcom,rpmh.h>
> -
> -	&apps_rsc {
> -		rpmhcc: clock-controller {
> -			compatible = "qcom,sdm845-rpmh-clk";
> -			#clock-cells = <1>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> new file mode 100644
> index 0000000..326bfd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,rpmhcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. RPMh Clocks Bindings
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Resource Power Manager Hardened (RPMh) manages shared resources on
> +  some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
> +  other hardware subsystems via RSC to control clocks.
> +
> +properties:
> +  compatible :

drop space     ^

> +    enum:
> +       - qcom,sdm845-rpmh-clk
> +       - qcom,sm8150-rpmh-clk

Wrong indent (1 char too many).

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1

Can drop this. Implied by items list.

> +    items:
> +      - const: xo
> +
> +  '#clock-cells':
> +      const: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +
> +examples:
> +  # Example for GCC for SDM845: The below node should be defined inside
> +  # &apps_rsc node.
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    rpmhcc: clock-controller {
> +      compatible = "qcom,sdm845-rpmh-clk";
> +      clocks = <&xo_board>;
> +      clock-names = "xo";
> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
