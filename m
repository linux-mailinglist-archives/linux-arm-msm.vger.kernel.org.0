Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5F0133593
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 23:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgAGWO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 17:14:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:51410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727127AbgAGWO6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 17:14:58 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54EDE2073D;
        Tue,  7 Jan 2020 22:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578435297;
        bh=RucTsMxr2qacpOC34F0AC9F0BKeUpDA+psINAfp9OCo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MXaKcRixoGSgVj7J1nE7KRVF9SClcly8oq1T8gZButE9Mld4ndN4F69nFh3k2SfeF
         QGCDGUWSsTg04E9ZL9N9sqPp8Wwu/x7kCaFW39LkhxlfAXjovL/99wuxIzgjf3Eof2
         zAI12y1KH8JYB1uA7sUyYN0VqTple82pap51JrK4=
Received: by mail-qv1-f41.google.com with SMTP id m14so588568qvl.3;
        Tue, 07 Jan 2020 14:14:57 -0800 (PST)
X-Gm-Message-State: APjAAAXO3gPgj3sx+UNMTD2l3g30eDt3ZAKTki2K51X2eBRda+Ct8T8r
        Ck5Wdp5/YVL3NOlOSCyNIP6JeDvlAi4JEiTPQA==
X-Google-Smtp-Source: APXvYqybizgUrBr9nhhJvcbQ6c0I6iKBqW16hJjNrPtgV9+z/C+p7hKmsqwonNDKpS2lM5D11wSbF/mOy/0V8VBXvhs=
X-Received: by 2002:ad4:450a:: with SMTP id k10mr1434429qvu.136.1578435296434;
 Tue, 07 Jan 2020 14:14:56 -0800 (PST)
MIME-Version: 1.0
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org> <1576595987-10043-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1576595987-10043-1-git-send-email-jhugo@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Jan 2020 16:14:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+b45XoZ+RnDkuguW+NaPF_fEjzNmHueWT-cQFrX3+2Bg@mail.gmail.com>
Message-ID: <CAL_Jsq+b45XoZ+RnDkuguW+NaPF_fEjzNmHueWT-cQFrX3+2Bg@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 17, 2019 at 9:19 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
>
> For 7180 and 8150, the hardware always exists, so no clocks are truly
> optional.  Therefore, simplify the binding by removing the min/max
> qualifiers to clocks.  Also, fixup an example so that dt_binding_check
> passes.
>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml        | 73 +++++++++++++++++-----
>  1 file changed, 59 insertions(+), 14 deletions(-)

This breaks 'make dt_binding_check'...

>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index e73a56f..f2b5cd6 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -40,20 +40,40 @@ properties:
>         - qcom,gcc-sm8150
>
>    clocks:
> -    minItems: 1
> -    maxItems: 3
> -    items:
> -      - description: Board XO source
> -      - description: Board active XO source
> -      - description: Sleep clock source
> +    oneOf:
> +      #qcom,gcc-sm8150
> +      #qcom,gcc-sc7180
> +      - items:
> +        - description: Board XO source
> +        - description: Board active XO source
> +        - description: Sleep clock source
> +      #qcom,gcc-msm8998
> +      - items:
> +        - description: Board XO source
> +        - description: Sleep clock source
> +        - description: USB 3.0 phy pipe clock
> +        - description: UFS phy rx symbol clock for pipe 0
> +        - description: UFS phy rx symbol clock for pipe 1
> +        - description: UFS phy tx symbol clock
> +        - description: PCIE phy pipe clock
>
>    clock-names:
> -    minItems: 1
> -    maxItems: 3
> -    items:
> -      - const: bi_tcxo
> -      - const: bi_tcxo_ao
> -      - const: sleep_clk
> +    oneOf:
> +      #qcom,gcc-sm8150
> +      #qcom,gcc-sc7180
> +      - items:
> +        - const: bi_tcxo
> +        - const: bi_tcxo_ao
> +        - const: sleep_clk
> +      #qcom,gcc-msm8998
> +      - items:
> +        - const: xo
> +        - const: sleep_clk
> +        - const: usb3_pipe
> +        - const: ufs_rx_symbol0
> +        - const: ufs_rx_symbol1
> +        - const: ufs_tx_symbol0
> +        - const: pcie0_pipe
>
>    '#clock-cells':
>      const: 1
> @@ -118,6 +138,7 @@ else:
>        compatible:
>          contains:
>            enum:
> +            - qcom,gcc-msm8998
>              - qcom,gcc-sm8150
>              - qcom,gcc-sc7180
>    then:
> @@ -179,10 +200,34 @@ examples:
>      clock-controller@100000 {
>        compatible = "qcom,gcc-sc7180";
>        reg = <0x100000 0x1f0000>;
> -      clocks = <&rpmhcc 0>, <&rpmhcc 1>;
> -      clock-names = "bi_tcxo", "bi_tcxo_ao";
> +      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +
> +  # Example of MSM8998 GCC:
> +  - |
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-msm8998";
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> +      reg = <0x00100000 0xb0000>;
> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,

Probably because of this define.

> +               <&sleep>,
> +               <0>,
> +               <0>,
> +               <0>,
> +               <0>,
> +               <0>;

Why are these all 0?

> +      clock-names = "xo",
> +                    "sleep",
> +                    "usb3_pipe",
> +                    "ufs_rx_symbol0",
> +                    "ufs_rx_symbol1",
> +                    "ufs_tx_symbol0",
> +                    "pcie0_pipe";
>      };
>  ...
> --
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
>
