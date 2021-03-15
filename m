Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0474133C097
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 16:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhCOPym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 11:54:42 -0400
Received: from mail-il1-f177.google.com ([209.85.166.177]:35984 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhCOPya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 11:54:30 -0400
Received: by mail-il1-f177.google.com with SMTP id g9so9826429ilc.3;
        Mon, 15 Mar 2021 08:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BV2tBvpQhGTolvZKbVnY6CtsKG/9mQ2MNLQv1g5WpSs=;
        b=XKP6hk9tlwcnEiA58I89rHQbXslG7oAZhqQkEQDwxGz0yF3ZXimIpedlQeKehhbFTO
         WnEcKvEErFPl/kL04Kg/zm4FN8mDm+t8765UoC/eZ2qdt0x/gNQt+EUysbgehsyVFQ7x
         6F4b9Y2orWgHY5M141/SPGYfD2cU7v/G8POdV7uLMnmmVGRUuS4I4thDovHc78EX573F
         ApBjAWageuQVWn9vwSkZX7Ij3IyYxquAvajKXRXodCll3PX+Sx43p3UiVO85TvUKomJX
         n61yjO5SUyhu3HtRWpMCtHpOvG1iFtY1kjc17OmtZzi6gqs6sckl3zYrgrX09kZw4mj6
         yQag==
X-Gm-Message-State: AOAM530jI5AicQjfDxWkn8onywEzBKB/GjKew+Lx5lNoHsdLXfsh/Jbt
        RoQbN4D/x8nnH0spl9tB5w==
X-Google-Smtp-Source: ABdhPJyS0HQsSUoIM0WYGJTXQJQ/ayw6jP4Y327PsM22ujuGoIzmDuYiJdkCA+GI20wBQRY7xHuyYg==
X-Received: by 2002:a92:4a0e:: with SMTP id m14mr195561ilf.117.1615823669738;
        Mon, 15 Mar 2021 08:54:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m5sm7995561ilq.65.2021.03.15.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 08:54:28 -0700 (PDT)
Received: (nullmailer pid 934191 invoked by uid 1000);
        Mon, 15 Mar 2021 15:54:25 -0000
Date:   Mon, 15 Mar 2021 09:54:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC
 driver
Message-ID: <20210315155425.GA932686@robh.at.kernel.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 13, 2021 at 03:19:10AM +0100, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> new file mode 100644
> index 000000000000..f8067fb1bbd6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/qcom,gcc-msm8994.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8994
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on MSM8994 and MSM8992.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-msm8994.h
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,gcc-msm8992
> +      - qcom,gcc-msm8994

qcom,msm8994-gcc

> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep
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
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@300000 {
> +      compatible = "qcom,gcc-msm8994";
> +      reg = <0x300000 0x90000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      clocks = <&xo_board>, <&sleep_clk>;
> +      clock-names = "xo", "sleep";
> +    };
> +...
> -- 
> 2.30.2
> 
