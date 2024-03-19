Return-Path: <linux-arm-msm+bounces-14500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3287FC4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 11:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35521F22CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320087E567;
	Tue, 19 Mar 2024 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYL9otmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADA5810A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845737; cv=none; b=OHrGn/2mQzjxX4L5XvmgjYDQR5RciGNexJcAf4wJwtJuivGoLyoFDnW0H51XdywUMr/iAMsR+moIrnWeQSriSOHiyFr5wKnj7PCC0Mu2+hHKQMEuVI2FXVuMAwf8b6fpu0sxVn5+wCtVkzNpyx8wS1PbnIlh0JWm8+o9a9nvmNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845737; c=relaxed/simple;
	bh=vQRCv/UvyqZmU4fH8Jtcz8E6tM7uiDzvZSJYcz3PC1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5OZo67hiSneoe8t4nqat7MoWcCCgJ5ZWeLyvqo8ih1WQ8C4CvX4OZDvZqLFDuGTXekwMrm6io3be5jvjU2o5gcdhABb7Xg6PkKANKYobi4NcneV+lWZzyH7uz67rt+RjqsDXjOtpPVgGB20jWNz/rbndIleknFdZads9ymjhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYL9otmP; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60a15449303so54217017b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710845733; x=1711450533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UuiRCB4J1EASJb1go8Fpz/CijV4D1bMBgCchLstiJ5E=;
        b=xYL9otmP4eqPFb7HmyqvuX2IDitR1cCF85vpX1LPlTBeaSnA1244fsfgHoWWOW80Ra
         cQiD/hXDkHnqy7VCwLEcuupuIpYc42BLi03/J9r8nS7HMZopIsI2gSI7Q3ZTGLg726Zu
         +cIiIFzxz5x+/qjNlSN+FmtJtpIgeVDL92WcFzxCtR6KXMIts+l7TvlcsHHPEo6UYcud
         ugnPpX39FWef7kugqX56/HfuMIGycMU/FbMpFMx78Y/oHf3kGao2pv71C2tyyt5yjXxS
         NqU6x/FbdrsqKiSMxWJeBsKpTZTJv86cfxB/odW+jlAc+isS7d2itb4quEL6+5SSp/HD
         hmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710845733; x=1711450533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuiRCB4J1EASJb1go8Fpz/CijV4D1bMBgCchLstiJ5E=;
        b=q2Us+ubiSMKbkGSklwqzkbXLyDVKPuU+W0l/7MZSRdHFjsJmgNbVReLPhMjZ/iKIVV
         T6i+6pE+mvQC8wMF2vv2Mj+d7BTVUp9+M46XRK7g2vXHhAaAKhpIGw/bvwYsg7LItbRE
         tKDQ8U8KYKh9iVHmHqX9osYlFlVAMwT8K7svR37BLdBj5DmwAiST1b9+8RKInFM2UBgC
         vYocJPYUqaLzkGmBvainmgUWZZiIgy/Yk1JPjVI9IC58idlz0cwoU01lB8WZKLRNRh2w
         PsNhtme5J3lVl4LEKzpcf6b0TE4qVPUwhZzKGGW2nNqNg2YPu0fOpwLn9jz/ExhBJ8k+
         xlRg==
X-Forwarded-Encrypted: i=1; AJvYcCUa9v0Z5cwIpShxwgVAGYf67YnMAqpih24YckbTr0GOZQgFLzetJUEsVWjEVjtSt9MYUk+mFKf8GIQtWr1eJx7HHy2PlE1WEywqeeevCQ==
X-Gm-Message-State: AOJu0Yx/BwBikuBRGx2qh5coGdVr9CVBoj7i4sHvvMjkweGx4PhxE32N
	83VnY7W95Iervxcs0xJ717Vl8UB5GiF5T0ES/etdnO2moRheRRht1ZVHPoZ5rCGKAuBX/7nALi9
	TltZtdRfXvDqwUqk233xg76U6PxrqCvaPzv2pxg==
X-Google-Smtp-Source: AGHT+IG+cj2Aheca6UpAxlVZJCMgERGN9VnWz7DvJy8XksWseeZxvDZzQGrFmnlQaiA3352Eai507nvaF+fW3MxFqTo=
X-Received: by 2002:a25:1f56:0:b0:dcb:f7a0:b031 with SMTP id
 f83-20020a251f56000000b00dcbf7a0b031mr11312882ybf.50.1710845732757; Tue, 19
 Mar 2024 03:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-0-926d7a4ccd80@linaro.org>
 <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-3-926d7a4ccd80@linaro.org>
In-Reply-To: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-3-926d7a4ccd80@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 12:55:21 +0200
Message-ID: <CAA8EJpoJ0rUd8aY6xpXyL3Obg66XtOebso_AUUxKmg1CWNykJA@mail.gmail.com>
Subject: Re: [PATCH 3/7] phy: qcom: qmp-pcie: register second optional PHY AUX clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 12:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> add the code to register it for PHYs configs that sets a aux_clock_rate.
>
> In order to get the right clock, add qmp_pcie_clk_hw_get() which uses
> the newly introduced QMP_PCIE_PIPE_CLK & QMP_PCIE_PHY_AUX_CLK clock
> IDs and also supports the legacy bindings by returning the PIPE clock.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 70 ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 079b3e306489..2d05226ae200 100644
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
> @@ -3681,6 +3687,62 @@ static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
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
> +       }
> +
> +       return ERR_PTR(-EINVAL);
> +}

Can we use of_clk_hw_onecell_get() instead? I think it even should be
possible to use onecell for both cases, it will look at the first arg,
which will be 0 in case of #clock-cells equal to 0.

> +
>  static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np)
>  {
>         int ret;
> @@ -3689,6 +3751,14 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
>         if (ret)
>                 return ret;
>
> +       if (qmp->cfg->aux_clock_rate) {
> +               ret = phy_aux_clk_register(qmp, np);
> +               if (ret)
> +                       return ret;
> +
> +               return devm_of_clk_add_hw_provider(qmp->dev, qmp_pcie_clk_hw_get, qmp);
> +       }
> +
>         return devm_of_clk_add_hw_provider(qmp->dev, of_clk_hw_simple_get,
>                                            &qmp->pipe_clk_fixed.hw);
>  }
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

