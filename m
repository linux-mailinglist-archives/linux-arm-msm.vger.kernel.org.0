Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2BF78C2F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 13:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbjH2LDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 07:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbjH2LCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 07:02:55 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37F8E5B
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 04:02:22 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d749f57cb22so3992076276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693306942; x=1693911742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htUA3Pqo/wgLtU7I+zMlvC08LizycSF6y3MTiiAzjIA=;
        b=SHVKGTKArE3D4BM2ZsqPPWSUAEyaHwP4S2Gx4s42htL72dNFX86nOXeclRNBARGLdQ
         ft3NgLRsUXf27FqtWnL0TvxRlODwbu+HLiJsZ/aCxhDDt+ETnIBHk424sRlEQwuT0tmS
         fL9XC9/7f48QWc4ogDzsHzWuwesB9hxxSutBhCvEWgVPinqCOc3G6lJEa6CeqqoMOCK2
         eYclgA6jixDwTt++4hayHS6NqX4XO4nF4njBsFSl/mk/wS53yT1nK0NTwLC0D8QE0REf
         5fqnhXxUWkB2UgPIbyUF2qEOuaWUlOq0ZWV5aXnSzWitbTLqkW5YitIN92Uzv4CpAPcN
         67eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693306942; x=1693911742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htUA3Pqo/wgLtU7I+zMlvC08LizycSF6y3MTiiAzjIA=;
        b=XWFQvTqSKBH1t2gnov+lYG4LmseeqnU26z+QQVLLqe/BzAEXjJz6t32ZT/iIXv4tCN
         IIawAQumayI/ZJjA7cKtJDcYfBnKTlGKscZ9wvqjT3D9ASmD3Ft5wySdPLenVMBtbE0Y
         eWutaTx1R9MqdhyljrhOpnSkpuFX6C+ZHUGwRDcAnTA+ursUhvRKc+xhHPkJoBqTdT5X
         HHPHtmX3lAXupBx63sgkuXjwq1OPzrJHgzvjAfGDvEaGAtB+/PYfDp6IKXX6ZtKeEHs6
         8FZ7dsKocoxq8H+ra8BRpgQVBp8BV/adEHSJ8eHb75v0j3jwauKqiRIldyKRLNbzH/Ei
         rkVg==
X-Gm-Message-State: AOJu0Yw5s5QKHJ50GN0DCGO6zEGyynXQKkIIpED0pazdrHrUJ/pvONdr
        S+gMw7bw/TyhLN/CoWRPDNHSFZt91DE6oBMiFzssoQ==
X-Google-Smtp-Source: AGHT+IHp3Ajd7M1WNI45jKTX2bxQ7+cfWJifOSd/dyJsestJojnJeanITjApP5TIGB6ATtG2mqNPkVJtIObLu75p+i0=
X-Received: by 2002:a25:1ec4:0:b0:d0c:3be2:b626 with SMTP id
 e187-20020a251ec4000000b00d0c3be2b626mr24690245ybe.30.1693306942195; Tue, 29
 Aug 2023 04:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org> <20230217-topic-cpr3h-v14-3-9fd23241493d@linaro.org>
In-Reply-To: <20230217-topic-cpr3h-v14-3-9fd23241493d@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 29 Aug 2023 13:01:44 +0200
Message-ID: <CAPDyKFrXT+2NEMUzVv-kWjXAhLinXq99GKq4_Ge2VjthtYxtaA@mail.gmail.com>
Subject: Re: [PATCH v14 3/9] dt-bindings: soc: qcom: cpr3: Add bindings for
 CPR3 driver
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Aug 2023 at 13:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>
> Add the bindings for the CPR3 driver to the documentation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> [Konrad: Make binding check pass; update AGdR's email]
> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,cpr3.yaml    | 286 +++++++++++++++++++++
>  1 file changed, 286 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
> new file mode 100644
> index 000000000000..acf2e294866b

[...]

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    cpus {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        cpu@0 {
> +            compatible = "qcom,kryo280";
> +            device_type = "cpu";
> +            reg = <0x0 0x0>;
> +            operating-points-v2 = <&cpu0_opp_table>;
> +            power-domains = <&apc_cprh 0>;
> +            power-domain-names = "cprh";

Rather than using a Qcom specific power-domain-name, perhaps a common
power-domain-name for cpus, that can be used for "the performance
domain" would be a good idea here?

I have suggested using "perf" for the SCMI performance domain [1],
perhaps that description should be extended to cover this and other
performance domains too?

> +        };
> +
> +        cpu@100 {
> +            compatible = "qcom,kryo280";
> +            device_type = "cpu";
> +            reg = <0x0 0x100>;
> +            operating-points-v2 = <&cpu4_opp_table>;
> +            power-domains = <&apc_cprh 1>;
> +            power-domain-names = "cprh";
> +        };
> +    };

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/linux-arm-kernel/20230825112633.236607-9-ulf.hansson@linaro.org/
