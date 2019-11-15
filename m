Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBE0FE0EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 16:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfKOPLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 10:11:14 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:41225 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbfKOPLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 10:11:14 -0500
Received: by mail-io1-f67.google.com with SMTP id r144so10741520iod.8;
        Fri, 15 Nov 2019 07:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFzvSShG866Tx0Q9T+Le+8pqUDl0GErr112sEYfvLrA=;
        b=vYNdD7nkYFmWZZmrsXGQn5WUw2fdx612njgNnf7ZYt6tIh/0DcDFcZHkS62g5ba5wj
         K+oepbMjd8eh/87t2eQHoB2UWLqdWbLKjDHbJG3Y7zBZB4v4XlqTS6hyp9DL5nDgAQEs
         MLXPhBYYGqsvtf5M4EsTT4kvQ4nNEMPcXo9MLKfEKN6tlC+Syg+0+lq2cIvZfhSJ+4sj
         OPMUq44RDCup2w8ay/2lbC/dNYopVcCLX6xm48+ngkO2PRtwO4Wy4Aw46174AdC1gzO8
         ueoFcrkMln3Jpy+dTSDlKu0vxc893jze4ZxBKhjWO1CG+kCxIFluSKE94mTLtm0Tb5FK
         urRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFzvSShG866Tx0Q9T+Le+8pqUDl0GErr112sEYfvLrA=;
        b=aqe/yVo0P00/O+Nig8H8AGYoWpveJ1FNBb6OMovGuw/WM3sztPhQ3MbKzkjZplN1fn
         9l0HzIuOgL7oHHoG+VRWf2EnsXHDzWgtc3JsMcZznLEfsS7OuW/tSLAFTy4bRFSvT6Kd
         noELcAKBZ9J3ER5T1ZLOldN8zNer7C9T/aRxe/WS7ZkWLfRicZ7rbXymzMsdQMC/xqfR
         bmA2Lr4NOWnXDdMY8G08CeCK/iId+sGRCrcJCgokIgPbz2vPboLPv/+0NTDzVxT9Hdc+
         aXlipTlxQXqkQ83HTxxhNqzWQlPuAxxyb2MkaRkQUyT4C3GvcWJk9QezOqzqNKB+om+k
         4GvA==
X-Gm-Message-State: APjAAAVXQ0SI4+nzg8VjUUb+/TyQDA3YYL6lsrknK9QJDcIiddAMqlPx
        SFdQPvqqcvZoSiWTohzlwy7YbmfOPPSvSwUOlqZf2g==
X-Google-Smtp-Source: APXvYqy8Ml8XdNNu1e1S+drq8SJ03lssUDFd9PATFauKT1En+/MUxAIZp27r7XLHypV0IGX3osYGBdIMvlMNj2od2DI=
X-Received: by 2002:a02:6a24:: with SMTP id l36mr1120582jac.46.1573830672557;
 Fri, 15 Nov 2019 07:11:12 -0800 (PST)
MIME-Version: 1.0
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org> <1573812304-24074-4-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1573812304-24074-4-git-send-email-tdas@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 15 Nov 2019 08:11:01 -0700
Message-ID: <CAOCk7NqfHe6jRPmw6o650fyd6EyVfFObHhJ9=21ipuAqJo6oGA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: Add YAML schemas for the QCOM
 GPUCC clock bindings
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 3:07 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> The GPUCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.txt       | 24 --------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
> deleted file mode 100644
> index 269afe8a..0000000
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Qualcomm Graphics Clock & Reset Controller Binding
> ---------------------------------------------------
> -
> -Required properties :
> -- compatible : shall contain "qcom,sdm845-gpucc" or "qcom,msm8998-gpucc"
> -- reg : shall contain base register location and length
> -- #clock-cells : from common clock binding, shall contain 1
> -- #reset-cells : from common reset binding, shall contain 1
> -- #power-domain-cells : from generic power domain binding, shall contain 1
> -- clocks : shall contain the XO clock
> -          shall contain the gpll0 out main clock (msm8998)
> -- clock-names : shall be "xo"
> -               shall be "gpll0" (msm8998)
> -
> -Example:
> -       gpucc: clock-controller@5090000 {
> -               compatible = "qcom,sdm845-gpucc";
> -               reg = <0x5090000 0x9000>;
> -               #clock-cells = <1>;
> -               #reset-cells = <1>;
> -               #power-domain-cells = <1>;
> -               clocks = <&rpmhcc RPMH_CXO_CLK>;
> -               clock-names = "xo";
> -       };
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> new file mode 100644
> index 0000000..c2d6243
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm grpahics clock control module which supports the clocks, resets and
> +  power domains.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8998-gpucc
> +      - qcom,sdm845-gpucc
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 source from GCC

This is not an accurate conversion.  GPLL0 was not valid for 845, and
is required for 8998.

> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: xo
> +      - const: gpll0
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
> +  # Example of GPUCC with clock node properties for SDM845:
> +  - |
> +    clock-controller@5090000 {
> +      compatible = "qcom,sdm845-gpucc";
> +      reg = <0x5090000 0x9000>;
> +      clocks = <&rpmhcc 0>, <&gcc 32>;
> +      clock-names = "xo", "gpll0";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +     };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
>
