Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33370225C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 11:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgGTJzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 05:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgGTJzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 05:55:36 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B0AC0619D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 02:55:36 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j11so19535216ljo.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=czrhyEhEcs9KJspCOYLvyQfPnpci+2QYLOQ/WNW3lw4=;
        b=CnrhO/P3aw1bN3pJS1WTslSh7lPanYvbf976SXyyViWivKY8mGeZOxGF6spscG4a1b
         AzC35iSDUUSEX5QqQXDG0Dn9kVHODA7YLORPopS104iIUwrhm4qUSIeXG34qK/gSv1j1
         6nDDcVHVm4Qevmn2gjv1NgsCxUBrPucPvzmBT+ANXqJJg8uR2YqBLZcOe31YPS+VIc52
         g7bQNukOcKW6Y0Y3rbkmut/mg4YqJ80wmNtrVwNIL7xnw54V/5Xs/047iMhY9xpL/IN4
         lgKMaFfPIwGh+Xvmo+bSS0jYrci3XSXT2JLA0dGTW24OD7cj94VHQeMoK0Ecq6E+cJSN
         HVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=czrhyEhEcs9KJspCOYLvyQfPnpci+2QYLOQ/WNW3lw4=;
        b=N3vroDoJTb8wmKp1TrNnU84OxS8y/GoeZYPcpuyHvNJBSOrkf4k3AC43gdmIGfcMX/
         6CRRkwF7AEsRxuf1ALN35g8YLOHRTa/JZ/pwmLa5r1rgJsm7y0VTs8YyR1U5qJyCrD2w
         amTb/viM5p33FNkZRQjdycvAvhiLrTYVCUVMlo6AtelZ/kMQwt0ECKMTq+Y59wBlV+xm
         q7FAwyi0u0+t8qjgK4VZLmwTMQ8gfxe6hIwewOxo6luYtLlEfnJuyFCx+1IKe42LXOdX
         9FsCgROD1SPut62FX1u0vCCvp+O1suPAWu5cw508HEAMBcW0tGKJtJQA4/E681mk+DUb
         4PmQ==
X-Gm-Message-State: AOAM530d7QlwiOGVSmGRxbV2l+U+clnx/F0+LRpjFfjEDn5GCR0udbcm
        mRNhmMFA0m65OdK8s+CjsldzbJm9rMp0PNwiCTPZ6Q==
X-Google-Smtp-Source: ABdhPJx7dPlocqfGM7sZ2KHKcW665NVMq4cJYWrzSHYvVDC6FGbeJQjTYpRHJaYHlI1CZ3+Gs0JPtBwFu51lvd8XbNk=
X-Received: by 2002:a2e:8855:: with SMTP id z21mr10483601ljj.325.1595238934491;
 Mon, 20 Jul 2020 02:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200716022817.30439-1-ansuelsmth@gmail.com> <20200716022817.30439-5-ansuelsmth@gmail.com>
In-Reply-To: <20200716022817.30439-5-ansuelsmth@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 20 Jul 2020 15:25:23 +0530
Message-ID: <CAP245DVSwmk121SkZXqeXF2YUhDUw+KAb=F2EF8d63prKg+hVQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: thermal: tsens: document ipq8064 bindings
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 7:58 AM Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Document the use of bindings used for ipq8064 SoCs tsens.
> ipq8064 use the same gcc regs and is set as a child of the qcom gcc.
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../bindings/thermal/qcom-tsens.yaml          | 50 ++++++++++++++++---
>  1 file changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index d7be931b42d2..9d480e3943a2 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -19,6 +19,11 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> +      - description: msm9860 TSENS based

Another variant of the number here: I've seen 8960, 8064 (correct) and
8060, 9860 (wrong) so far.

Just use 8960 throughout this series and then add a new patch at the
end of the series for a compatible for ipq8064.

> +        items:
> +          - enum:
> +            - qcom,ipq8064-tsens
> +
>        - description: v0.1 of TSENS
>          items:
>            - enum:
> @@ -85,12 +90,18 @@ properties:
>        Number of cells required to uniquely identify the thermal sensors. Since
>        we have multiple sensors this is set to 1
>
> +required:
> +  - compatible
> +  - interrupts
> +  - "#thermal-sensor-cells"
> +
>  allOf:
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq8064-tsens
>                - qcom,msm8916-tsens
>                - qcom,msm8974-tsens
>                - qcom,msm8976-tsens
> @@ -111,17 +122,42 @@ allOf:
>          interrupt-names:
>            minItems: 2
>
> -required:
> -  - compatible
> -  - reg
> -  - "#qcom,sensors"
> -  - interrupts
> -  - interrupt-names
> -  - "#thermal-sensor-cells"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,tsens-v0_1
> +              - qcom,tsens-v1
> +              - qcom,tsens-v2
> +
> +    then:
> +      required:
> +        - reg
> +        - interrupt-names
> +        - "#qcom,sensors"
>
>  additionalProperties: false
>
>  examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    // Example msm9860 based SoC (ipq8064):
> +    gcc: clock-controller {
> +
> +           /* ... */
> +
> +           tsens: thermal-sensor {
> +                compatible = "qcom,ipq8064-tsens";
> +
> +                 nvmem-cells = <&tsens_calib>, <&tsens_calsel>;
> +                 nvmem-cell-names = "calib", "calib_sel";
> +                 interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                 #thermal-sensor-cells = <1>;
> +          };
> +    };
> +
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      // Example 1 (legacy: for pre v1 IP):
> --
> 2.27.0
>
