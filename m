Return-Path: <linux-arm-msm+bounces-14811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBA886A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 173061C20621
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFF67E6;
	Fri, 22 Mar 2024 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mio9O0QK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D10383B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711104090; cv=none; b=O8oC0qeuOGhESWRL5SIedG0VQNd4rmlOOrAuvhyt9Mn68uJXbgwCkUifoFugqntsnfIfqQHAp7cdnjIb2vbHpJTxL60PqSnM7ByRcQiMqMo2Owmm0UcXHlnfkI4B4gtNhE+WdEwUB4XGufJYBMoU0w4E/ztVmKPGSMnwLBEd6lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711104090; c=relaxed/simple;
	bh=mwhueK18SP4vH/odlVDO7dsuDSw2o85nRGUzPd2gdTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReMJoKKuDZAstzJvQQKth1+sKxb88UR6YRI+ClbFeNFMBJxhFtGbEy9nzpcibUPTHFS/aTxwByqO5tC0Rvk3mAj32bFCuBM46IQIpv93ATkQcxBKv+EU8Y3PceVpoSQfKWxznEGseVGpedc+8HkmWc2xXf3dBk2kvkQGMhMeZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mio9O0QK; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso1927893276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711104088; x=1711708888; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r3j8ySJDt0zAi6ld6z1Lj8J4TK4Y7Ou8xI40rnNaKms=;
        b=Mio9O0QKYtTs6x8Kx/i4rH5pS83OlMtPvR1YHjijxIeehQWLg3nmEmdbu6/P2xgohL
         +5n1142on/+e7i5ELM7mXVGvq+Y8+7uMn2cM29NY4CdFU5XnIQ6saFLddRQCS2yDVLRp
         iGM8+J+XnrJtioNXrpQK7sEOQDeVpIm3zagOD4mYYkzBts3gJ/bWUgz+NORYweSv27/1
         Mqtqz29jWRa+hj1mbC9BfIJPSDkH4Y4JgtaL8Wf5jnYUmNtySTwa+t80ofq7ZEPz3qkX
         TrWLiImnjizqe7V0NQwkGJoHnYgXOAJ6G4wPAJj1rhB5NJfeJOv4uGKXTQzlw9XDR1TG
         vn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711104088; x=1711708888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3j8ySJDt0zAi6ld6z1Lj8J4TK4Y7Ou8xI40rnNaKms=;
        b=HfwMRBnBKqUCeZ7Nosh5erHWpVYea19FirNIuVu6fEXWJav9HQFlMdkiAMrZ36Db44
         Obqb0UQiUuQeqx+cL46p2PQBlMuITYvvhiGvLjjX35Irb9Zk1k/sjkpsW2XKRSoiFQ/r
         IpflrlS2rjaaA+w6slFuF52AewnixMzo6fERmcTdVG2sPGEfOYWO2EjGM4x4Qtm7oxz3
         1LV3eJ/6KEGh9EwFy4+SKbFopKAt0SoghROYK6uqSo9GSwg5AcgId0X2fMHK8f7tUf9H
         5go4bemywTIRqMlEAxARu8IiZG2XXzx4X60merghItV18XAT82zAr6ri3uLYYHSUP7Fm
         Z6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCW/sUjwCnhabLFlyCLHHMUGzuw0c5FCxLI8AAf+v1b64M1WrxXQnzRPZF/byWNztFKRzJ1VskmIXWwXaFTfO7+XQATBBfkCx1XhsMElRQ==
X-Gm-Message-State: AOJu0Yw0eZ8m1r+BOpJOaN7dykWyttE7Jwo/UHr8k3Etoh91t5NnUe6l
	vWrZM+/J0wShJUfvprdZpXid4MiUm6Hqs03cQhijUEBCYvL646wfOxRSigN8zS5Up1UwH4CcKAC
	WS3waNsJen7ILq/sL9GiB6GYu5M+jnrDBqz1wNg==
X-Google-Smtp-Source: AGHT+IECg8xX2zG9AQzDESnUGKYjL+NJyLZiZXz5O/yXLNKfSKZNNivj+dBmvfrO7HDlJz5jdiXaKfZqiP/XNvTEZuI=
X-Received: by 2002:a25:2644:0:b0:dcc:79ab:e51a with SMTP id
 m65-20020a252644000000b00dcc79abe51amr1725019ybm.57.1711104087935; Fri, 22
 Mar 2024 03:41:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
 <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-3-3ec0a966d52f@linaro.org>
In-Reply-To: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-3-3ec0a966d52f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 12:41:16 +0200
Message-ID: <CAA8EJpoJWKZcZu3SY2P9dpYQ_KXkimRXNhAKfaOreCGZ1muYqw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] phy: qcom: qmp-pcie: register second optional PHY
 AUX clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 11:43, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> add the code to register it for PHYs configs that sets a aux_clock_rate.
>
> In order to get the right clock, add qmp_pcie_clk_hw_get() which uses
> the newly introduced QMP_PCIE_PIPE_CLK & QMP_PCIE_PHY_AUX_CLK clock
> IDs and also supports the legacy bindings by returning the PIPE clock
> when #clock-cells=0.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Small question below.

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 78 ++++++++++++++++++++++++++++++--
>  1 file changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index e8da2e9146dc..6c9a95e62429 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -22,6 +22,8 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> +
>  #include "phy-qcom-qmp-common.h"
>
>  #include "phy-qcom-qmp.h"
> @@ -2389,6 +2391,9 @@ struct qmp_phy_cfg {
>
>         /* QMP PHY pipe clock interface rate */
>         unsigned long pipe_clock_rate;
> +
> +       /* QMP PHY AUX clock interface rate */
> +       unsigned long aux_clock_rate;
>  };
>
>  struct qmp_pcie {
> @@ -2420,6 +2425,7 @@ struct qmp_pcie {
>         int mode;
>
>         struct clk_fixed_rate pipe_clk_fixed;
> +       struct clk_fixed_rate aux_clk_fixed;
>  };
>
>  static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> @@ -3686,6 +3692,62 @@ static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
>         return devm_clk_hw_register(qmp->dev, &fixed->hw);
>  }
>
> +/*
> + * Register a fixed rate PHY aux clock.
> + *
> + * The <s>_phy_aux_clksrc generated by PHY goes to the GCC that gate
> + * controls it. The <s>_phy_aux_clk coming out of the GCC is requested
> + * by the PHY driver for its operations.
> + * We register the <s>_phy_aux_clksrc here. The gcc driver takes care
> + * of assigning this <s>_phy_aux_clksrc as parent to <s>_phy_aux_clk.
> + * Below picture shows this relationship.
> + *
> + *         +---------------+
> + *         |   PHY block   |<<---------------------------------------------+
> + *         |               |                                               |
> + *         |   +-------+   |                      +-----+                  |
> + *   I/P---^-->|  PLL  |---^--->phy_aux_clksrc--->| GCC |--->phy_aux_clk---+
> + *    clk  |   +-------+   |                      +-----+
> + *         +---------------+
> + */
> +static int phy_aux_clk_register(struct qmp_pcie *qmp, struct device_node *np)
> +{
> +       struct clk_fixed_rate *fixed = &qmp->aux_clk_fixed;
> +       struct clk_init_data init = { };
> +       int ret;
> +
> +       ret = of_property_read_string_index(np, "clock-output-names", 1, &init.name);
> +       if (ret) {
> +               dev_err(qmp->dev, "%pOFn: No clock-output-names index 1\n", np);
> +               return ret;
> +       }
> +
> +       init.ops = &clk_fixed_rate_ops;
> +
> +       fixed->fixed_rate = qmp->cfg->aux_clock_rate;
> +       fixed->hw.init = &init;
> +
> +       return devm_clk_hw_register(qmp->dev, &fixed->hw);
> +}
> +
> +static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct qmp_pcie *qmp = data;
> +
> +       /* Support legacy bindings */
> +       if (!clkspec->args_count)
> +               return &qmp->pipe_clk_fixed.hw;
> +
> +       switch (clkspec->args[0]) {
> +       case QMP_PCIE_PIPE_CLK:
> +               return &qmp->pipe_clk_fixed.hw;
> +       case QMP_PCIE_PHY_AUX_CLK:
> +               return &qmp->aux_clk_fixed.hw;

Does the absence of the default case trigger a warning if compiled with W=1?

> +       }
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
>  static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np)
>  {
>         int ret;
> @@ -3694,9 +3756,19 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
>         if (ret)
>                 return ret;
>
> -       ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &qmp->pipe_clk_fixed.hw);
> -       if (ret)
> -               return ret;
> +       if (qmp->cfg->aux_clock_rate) {
> +               ret = phy_aux_clk_register(qmp, np);
> +               if (ret)
> +                       return ret;
> +
> +               ret = of_clk_add_hw_provider(np, qmp_pcie_clk_hw_get, qmp);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &qmp->pipe_clk_fixed.hw);
> +               if (ret)
> +                       return ret;
> +       }
>
>         /*
>          * Roll a devm action because the clock provider is the child node, but
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

