Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7C8789733
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 16:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjHZOKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 10:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbjHZOJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 10:09:56 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBD22117
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 07:09:52 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d6b1025fc7aso1693264276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693058992; x=1693663792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GLSSaVuhVa/Seaf2opF9C5bgQRp/jxtlH/etGCBIFHY=;
        b=rLOAt/D51tglIMQNlYbSHCQqbPy/NaR0UR/nMvV/BoPW2nHHO9+GGDIV4Xm6JngLzy
         +LMxsvxWaiRJqIEKjJT9cv7dvWoI6OzLuri3h9eA+VVNlWqd9l+EoeUoNYgHQ1GdcAVu
         0vN++69Vi0OdJ6gyQ3OyGzHSNWTvf3MKR7Iz+SFbSYLiKq7zvnvjinr63IrI3YIzOaSd
         WtQDJyN25t6xTVt/VK1BrLpnh+YqF4dfzzG4rrsCuHJMX/PYdVsNW1g3qJz+okJyJlho
         cDwPnZSRrvSz8OfwsnSlKHJ83MazDGCYwNQCdfZi8AoSIT0aM+Byu5BfRL5fE+Cr3TCm
         saEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693058992; x=1693663792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLSSaVuhVa/Seaf2opF9C5bgQRp/jxtlH/etGCBIFHY=;
        b=Vu6TRMS/QXc34KTQyrDEpDXaLFho8myOEDRqml6St0VP9h/uPEXVUXFDyf1K8+Nmec
         /sQaAtAq5FW/UMtVbeO+AAsYAgYMacRlETYENdlsAlRehZy+Afhyp6wbLsKCqZl4W5HN
         xBcGD9azhDtU2Domia/v80wEEkYRNuBcT6i1WQWlsQb9UJ9XvvBZs2HmEgZYYFGvPDtq
         Nyq6TFX7p7/HESopLS6q1uqsFeXzn/EJZBh3qKQyU5QdEty+kmYRee2EZTJQvC9A49/C
         lpHd1i9JVkEXqyLKN4mVTq1YF1bClHxyRpFdS29JztNBp7nObAntnvUu5LwjkjKtkZfX
         9xuQ==
X-Gm-Message-State: AOJu0YwdccD7h0BhfdPPHdk/t502u+NnBDW0eu5ok3ei/smgMO1K8bmr
        xHba6TJOziMwpEgoDQk+vzwFkOZaQvc2JYy3WXjbfg==
X-Google-Smtp-Source: AGHT+IGgBzt5ZyWKDExLe7+eimASykGaadRBeGKuOHwEO8O81GoNT1rO3C548Ws1CO71WAzF1aqupoG6R5Z5HE5KnGk=
X-Received: by 2002:a25:9111:0:b0:d7a:be78:d57b with SMTP id
 v17-20020a259111000000b00d7abe78d57bmr2119358ybl.20.1693058992052; Sat, 26
 Aug 2023 07:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
 <20230825-topic-6115_lpasscc-v1-3-d4857be298e3@linaro.org> <a9d52cd9-845e-ff88-3c26-858cb6604e43@linaro.org>
In-Reply-To: <a9d52cd9-845e-ff88-3c26-858cb6604e43@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 26 Aug 2023 17:09:40 +0300
Message-ID: <CAA8EJprEnMjbKw2fbU1X7GV=ANARNhofSQh49Bdo1kvuOskbbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: Add SM6115 LPASSCC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Aug 2023 at 12:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/08/2023 20:13, Konrad Dybcio wrote:
> > SM6115 (and its derivatives or similar SoCs) have a LPASS clock
> > controller block which provides audio-related resets.
> >
> > Add the required code to support them.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/clk/qcom/Kconfig          |  9 +++++
> >  drivers/clk/qcom/Makefile         |  1 +
> >  drivers/clk/qcom/lpasscc-sm6115.c | 84 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 94 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index bd9bfb11b328..df9cf112e4b6 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -1001,6 +1001,15 @@ config SM_GPUCC_8550
> >         Say Y if you want to support graphics controller devices and
> >         functionality such as 3D graphics.
> >
> > +config SM_LPASSCC_6115
> > +     tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
> > +     depends on ARM64 || COMPILE_TEST
> > +     select SM_GCC_6115
> > +     help
> > +       Support for the LPASS clock controller on SM6115 devices.
> > +       Say Y if you want to toggle LPASS-adjacent resets within
> > +       this clock controller to reset the LPASS subsystem.
> > +
> >  config SM_TCSRCC_8550
> >       tristate "SM8550 TCSR Clock Controller"
> >       depends on ARM64 || COMPILE_TEST
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index 4790c8cca426..61e3c72fe954 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -128,6 +128,7 @@ obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
> >  obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
> >  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
> >  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
> > +obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
> >  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
> >  obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
> >  obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
> > diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
> > new file mode 100644
> > index 000000000000..6aa19e16c53b
> > --- /dev/null
> > +++ b/drivers/clk/qcom/lpasscc-sm6115.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022, 2023 Linaro Limited
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <dt-bindings/clock/qcom,sm6115-lpasscc.h>
> > +
> > +#include "common.h"
> > +#include "reset.h"
> > +
> > +static const struct qcom_reset_map lpass_audiocc_sm6115_resets[] = {
> > +     [LPASS_AUDIO_SWR_RX_CGCR] =  { .reg = 0x98, .bit = 1, .udelay = 500 },
> > +};
> > +
> > +static struct regmap_config lpass_audiocc_sm6115_regmap_config = {
> > +     .reg_bits = 32,
> > +     .reg_stride = 4,
> > +     .val_bits = 32,
> > +     .name = "lpass-audio-csr",
> > +     .max_register = 0x1000,
> > +};
> > +
> > +static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
> > +     .config = &lpass_audiocc_sm6115_regmap_config,
> > +     .resets = lpass_audiocc_sm6115_resets,
> > +     .num_resets = ARRAY_SIZE(lpass_audiocc_sm6115_resets),
> > +};
> > +
> > +static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
> > +     [LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
> > +};
> > +
> > +static struct regmap_config lpasscc_sm6115_regmap_config = {
> > +     .reg_bits = 32,
> > +     .reg_stride = 4,
> > +     .val_bits = 32,
> > +     .name = "lpass-tcsr",
> > +     .max_register = 0x1000,
> > +};
> > +
> > +static const struct qcom_cc_desc lpasscc_sm6115_reset_desc = {
> > +     .config = &lpasscc_sm6115_regmap_config,
> > +     .resets = lpasscc_sm6115_resets,
> > +     .num_resets = ARRAY_SIZE(lpasscc_sm6115_resets),
> > +};
> > +
> > +static const struct of_device_id lpasscc_sm6115_match_table[] = {
> > +     {
> > +             .compatible = "qcom,sm6115-lpassaudiocc",
> > +             .data = &lpass_audiocc_sm6115_reset_desc,
> > +     }, {
> > +             .compatible = "qcom,sm6115-lpasscc",
> > +             .data = &lpasscc_sm6115_reset_desc,
> > +     },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, lpasscc_sm6115_match_table);
>
> Everything here is almost the same as sc8280xp one, so this should be
> added to sc8280xp. You cut some boilerplate and additional driver.

We have been there. It quickly becomes a nightmare to maintain.
Consider dispcc-sm8250.c

But I agree with you, this code looks too similar. If we expect more
similar lpasscc drivers, which provide no clocks, just several resets,
maybe we can create a common generic wrapper and make resets lists
corresponding driver data?

-- 
With best wishes
Dmitry
