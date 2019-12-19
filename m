Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE9612716D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 00:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfLSX0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 18:26:19 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34382 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSX0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 18:26:18 -0500
Received: by mail-ot1-f68.google.com with SMTP id a15so9322401otf.1;
        Thu, 19 Dec 2019 15:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nV+BwOwkoFNGnADPXtyiIrKryTMNdw3bUGpG/MrLtkc=;
        b=BWE9IT6Y397pB20Fj1itKDs8et6taJPS1boI1gPxenJfwXq1EqBHok2h3EgDIOJ30X
         PixF1a3q2qsL8PKytsko/Y1ZmS9xbmfhij9a4xeKnqbJZ1M3d8gY/oDZI7QJx1IYUs52
         J8XSuhXw4B3k3AyQhVkmZ5JKFt1/Kml3UJBhXFK7nmAk02R9gJYDFBx+ycwAFRBULHaH
         +99wQJV8/k3UiKFYtefZ8X8VK6/7SxtCrU0S4g0RHxUjglEc5zVr4V14fGagQjAL5NUy
         owXSrZkSmSITxo628NIhH9DdqyeBeCjs8tj2eOcpch3X49nypruOEPs8DbRIyZCHHMHq
         slJg==
X-Gm-Message-State: APjAAAXrvBtdMuNcpXRTEBcIXSBI86hQX0U5lFLT78lGnfNZpFxZD+85
        iNXwJnqwhXUjl3TkCAC1kA==
X-Google-Smtp-Source: APXvYqyMhydbGXWleaUiT/A93Xl/Z8gTg2Yqzd9flb8AyBp7uQbaXRQClmqLEnXRycV5GvBQ1gQAAQ==
X-Received: by 2002:a05:6830:9:: with SMTP id c9mr11785841otp.94.1576797977761;
        Thu, 19 Dec 2019 15:26:17 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id 4sm2752337otu.0.2019.12.19.15.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:26:17 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:26:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Convert QCOM watchdog timer
 bindings to YAML
Message-ID: <20191219232615.GA22811@bogus>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <0b095b65496073a2ddf9de120f7809619b42cd1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b095b65496073a2ddf9de120f7809619b42cd1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 13, 2019 at 10:23:18AM +0530, Sai Prakash Ranjan wrote:
> Convert QCOM watchdog timer bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
>  .../bindings/watchdog/qcom-wdt.yaml           | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml


> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> new file mode 100644
> index 000000000000..4a42f4261322
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,kpss-timer
> +      - const: qcom,kpss-wdt
> +      - const: qcom,kpss-wdt-apq8064
> +      - const: qcom,kpss-wdt-ipq4019
> +      - const: qcom,kpss-wdt-ipq8064
> +      - const: qcom,kpss-wdt-msm8960
> +      - const: qcom,scss-timer

An 'enum' is better than oneOf+const.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  timeout-sec:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Contains the watchdog timeout in seconds. If unset, the
> +      default timeout is 30 seconds.

Include watchdog.yaml and don't redefine this.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    watchdog@208a038 {
> +      compatible = "qcom,kpss-wdt-ipq8064";
> +      reg = <0x0208a038 0x40>;
> +      clocks = <&sleep_clk>;
> +      timeout-sec = <10>;
> +    };
> ---
> 
> I have added Andy as the maintainer here since the get_maintainer script
> showed him. If he is not happy, then I can change it to Bjorn probably and
> again if he is not happy ;-) then I will add myself or whoever they suggest.

Add yourself.

Rob
