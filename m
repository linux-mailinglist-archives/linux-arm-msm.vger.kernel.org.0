Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06B41B17DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 23:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgDTVBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 17:01:12 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38726 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbgDTVBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 17:01:12 -0400
Received: by mail-oi1-f196.google.com with SMTP id r66so10127336oie.5;
        Mon, 20 Apr 2020 14:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tEPqLrCHDoG9Ero5B2m0h3HZkz0IPEK75a1FjNh32kg=;
        b=DeCcHo9T5eGFt8i7eUroCnrsadFXJtBHHv66zxtqIv2kOikNDcAobaYZH9iwjDzVE0
         S25lNUI8A/AwqDYGv5B/azRmW8+obX4W1Gli8+A2QDCGG/7cm/sSBUa2QDJ+FrbdaiY2
         4/PVwlViEIQxlv/1NsURrU8ilCvt33GmmrDlxczkH9T01+tvZnU5asDcQbQk3CW+qqD/
         vRoC2kUlZemO7an0utexZuLjeEzdUjUG4ruzjUQREZYpLfFKkPbwKTxHUla7lVsqN5eL
         vwybom/YUVAzsoyHqLYkP/jaqtAmC2VCttlwfbRFGdS76KkOgwipD2ZbyYskhzThVj8X
         zCPA==
X-Gm-Message-State: AGi0PuZCWJaQmTpBX+WDzXdxKcfcD5sB2D6Lu9iZ5DJ3qd8vnhuNnaAA
        7tLib6LNzT+sjit4wENP/w==
X-Google-Smtp-Source: APiQypLjsiY39/Nvmw1B1qa5NtEoy7MDqhH5h9uokQff++VafGJL8qiYaQOFkvSPxqPJYJff2F6rFg==
X-Received: by 2002:aca:6042:: with SMTP id u63mr987869oib.179.1587416470793;
        Mon, 20 Apr 2020 14:01:10 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o34sm139742ooi.46.2020.04.20.14.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:01:09 -0700 (PDT)
Received: (nullmailer pid 21483 invoked by uid 1000);
        Mon, 20 Apr 2020 21:01:08 -0000
Date:   Mon, 20 Apr 2020 16:01:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/8] dt-bindings: clock: Add YAML schemas for QCOM A53
 PLL
Message-ID: <20200420210108.GA19108@bogus>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
 <1586832922-29191-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586832922-29191-3-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14, 2020 at 08:25:16AM +0530, Sivaprakash Murugesan wrote:
> This patch adds schema for primary CPU PLL found on few Qualcomm
> platforms.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V3]
>  * Fixed dt binding error in "$id" field.
> 
>  .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 --------
>  .../devicetree/bindings/clock/qcom,a53pll.yaml     | 60 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
> deleted file mode 100644
> index e3fa811..0000000
> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Qualcomm MSM8916 A53 PLL Binding
> ---------------------------------
> -The A53 PLL on MSM8916 platforms is the main CPU PLL used used for frequencies
> -above 1GHz.
> -
> -Required properties :
> -- compatible : Shall contain only one of the following:
> -
> -		"qcom,msm8916-a53pll"
> -
> -- reg : shall contain base register location and length
> -
> -- #clock-cells : must be set to <0>
> -
> -Example:
> -
> -	a53pll: clock@b016000 {
> -		compatible = "qcom,msm8916-a53pll";
> -		reg = <0xb016000 0x40>;
> -		#clock-cells = <0>;
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> new file mode 100644
> index 0000000..c865293
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,a53pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm A53 PLL Binding
> +
> +maintainers:
> +  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
> +
> +description:
> +  The A53 PLL on few Qualcomm platforms is the main CPU PLL used used for
> +  frequencies above 1GHz.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8916-a53pll
> +      - qcom,ipq6018-a53pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clocks:
> +    description: clocks required for this controller.

That's every 'clocks'. Drop.

> +    maxItems: 1
> +
> +  clock-names:
> +    description: clock output names of required clocks.

Drop. 'clock-names' are the input names.

> +    maxItems: 1

Need to define what the names are.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  #Example 1 - A53 PLL found on MSM8916 devices
> +  - |
> +    a53pll: clock@b016000 {
> +        compatible = "qcom,msm8916-a53pll";
> +        reg = <0xb016000 0x40>;
> +        #clock-cells = <0>;
> +    };
> +
> +  #Example 2 - A53 PLL found on IPQ6018 devices
> +  - |
> +    a53pll_ipq: clock@b116000 {
> +        compatible = "qcom,ipq6018-a53pll";
> +        reg = <0x0b116000 0x40>;
> +        #clock-cells = <0>;
> +        clocks = <&xo>;
> +        clock-names = "xo";
> +    };
> -- 
> 2.7.4
> 
