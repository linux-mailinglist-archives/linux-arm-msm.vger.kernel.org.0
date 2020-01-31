Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC89D14F0A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 17:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgAaQgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 11:36:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:58550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgAaQgY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 11:36:24 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39B972082E;
        Fri, 31 Jan 2020 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580488583;
        bh=Fs/FAawPdYJuq52mxS/wqXFtjT4M8et3Ikr/1M6FIic=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0vTVadZyhl18ZX2cB2ZszEp/pmLdOqd3Wb9g9oMn2WouCnQPQzkOnfSz7Mz2kdQ66
         mUTxp//K97YBKg5YuFxeHpHO487+Ba5g72MrxSkC8bNeSoTXR7lE2iRMWHlHpIIQbq
         8bihIsGKNz6axIaeu9XVyoIWYCzY/uSF9bnvcg80=
Received: by mail-qt1-f181.google.com with SMTP id v25so5848754qto.7;
        Fri, 31 Jan 2020 08:36:23 -0800 (PST)
X-Gm-Message-State: APjAAAXlf0R37utORTR9WCYlqlmKO19AbLjPT0UIh/jWJMkPNmVD6pcr
        5s/MKUZ+FJc03m7P0X6z0gnIeqYpFaoSCNTrAg==
X-Google-Smtp-Source: APXvYqxvfr9BW//7wSw4AQYOawlaBPSl3VOxQmUJxzMOB7suHBwIa8Z/SVB+GdRGRPXiNdGoCKMUZF8+LjvD3ZM7EhY=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr11714482qtj.300.1580488582310;
 Fri, 31 Jan 2020 08:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20200130211231.224656-1-dianders@chromium.org> <20200130131220.v3.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
In-Reply-To: <20200130131220.v3.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 31 Jan 2020 10:36:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-PZniVny7w@mail.gmail.com>
Message-ID: <CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-PZniVny7w@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] dt-bindings: clock: Cleanup qcom,videocc
 bindings for sdm845/sc7180
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 30, 2020 at 3:13 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This makes the qcom,videocc bindings match the recent changes to the
> dispcc and gpucc.
>
> 1. Switched to using "bi_tcxo" instead of "xo".
>
> 2. Adds a description for the XO clock.  Not terribly important but
>    nice if it cleanly matches its cousins.
>
> 3. Updates the example to use the symbolic name for the RPMH clock and
>    also show that the real devices are currently using 2 address cells
>    / size cells and fixes the spacing on the closing brace.
>
> 4. Split into 2 files.  In this case they could probably share one
>    file, but let's be consistent.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Added include file to description.
> - Split videocc bindings into 2 files.
> - Unlike in v2, use internal name instead of purist name.
>
> Changes in v2:
> - Patch ("dt-bindings: clock: Cleanup qcom,videocc") new for v2.
>
>  .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 +++++++++++++++++++
>  ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++++----
>  2 files changed, 77 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
>  rename Documentation/devicetree/bindings/clock/{qcom,videocc.yaml => qcom,sdm845-videocc.yaml} (60%)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
> new file mode 100644
> index 000000000000..f12ec56737e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,sc7180-videocc.yaml#

'bindings/' should be removed here. I just found my check on this was
inadequate. The clock bindings seem to have the most copy-n-paste of
this.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Video Clock & Reset Controller Binding for SC7180
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm video clock control module which supports the clocks, resets and
> +  power domains on SC7180.
> +
> +  See also dt-bindings/clock/qcom,videocc-sc7180.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-videocc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ab00000 {
> +      compatible = "qcom,sc7180-videocc";
> +      reg = <0 0x0ab00000 0 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
> +      clock-names = "bi_tcxo";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
> similarity index 60%
> rename from Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> rename to Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
> index 43cfc893a8d1..60300f5ab307 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
> @@ -1,30 +1,31 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/bindings/clock/qcom,videocc.yaml#
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,sdm845-videocc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Qualcomm Video Clock & Reset Controller Binding
> +title: Qualcomm Video Clock & Reset Controller Binding for SDM845
>
>  maintainers:
>    - Taniya Das <tdas@codeaurora.org>
>
>  description: |
>    Qualcomm video clock control module which supports the clocks, resets and
> -  power domains.
> +  power domains on SDM845.
> +
> +  See also dt-bindings/clock/qcom,videocc-sdm845.h.
>
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sc7180-videocc
> -      - qcom,sdm845-videocc
> +    const: qcom,sdm845-videocc
>
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: Board XO source
>
>    clock-names:
>      items:
> -      - const: xo
> +      - const: bi_tcxo
>
>    '#clock-cells':
>      const: 1
> @@ -48,15 +49,15 @@ required:
>    - '#power-domain-cells'
>
>  examples:
> -  # Example of VIDEOCC with clock node properties for SDM845:
>    - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
>      clock-controller@ab00000 {
>        compatible = "qcom,sdm845-videocc";
> -      reg = <0xab00000 0x10000>;
> -      clocks = <&rpmhcc 0>;
> -      clock-names = "xo";
> +      reg = <0 0x0ab00000 0 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
> +      clock-names = "bi_tcxo";
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> -     };
> +    };
>  ...
> --
> 2.25.0.341.g760bfbb309-goog
>
