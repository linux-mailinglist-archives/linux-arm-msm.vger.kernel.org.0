Return-Path: <linux-arm-msm+bounces-14536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF7880160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E3B0282B24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8BA7C0A7;
	Tue, 19 Mar 2024 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uYDJUIqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59864651BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864337; cv=none; b=iwV+Jwyb0wRf9p5MCtfLjxdtMBOe+JMvXX6jaPoqHCBpOlKZscVhV5gmvuXwLUXgRHG6TqC9z9Pzp8G1DgaKm3+cPrBc7Sg6P6maBrQVQOvqI5K2xeQ5MrwUznDUIyr8WDWI+VBC1Rqw+zI/ARBgJ671QtrF9p+zRJxSv+03sus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864337; c=relaxed/simple;
	bh=Ad79h1k+HD6v+kGeE/hH+EBlVR2ZFbisAIfFd18eHu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFCJe85VfaJJPxQX4sspaCRgyieifXoVcwUO3snv5PzpAAbuUr7eranQrVhKxsF+jo+NIiT3czIuNGH7dXfqP2vl5YYl7E/N/D7jH0AhZCtyQIW4r9vlTgasV8yovs524BPP1H3csVKECf06SAP607YIcGloLAO9CsduMvjfyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uYDJUIqt; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso3996002276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864334; x=1711469134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol5DwFk94dhNJ8561vUenj1hX3tsUa9C7nuNtM75Z+k=;
        b=uYDJUIqtI3oZMQjzeA1J5JXYh3HLSmLbQp++faxm/PYEYEDZ/ZBDwaHNvXsSh1Ik6e
         FOmtKDNxfumJI4E/n2xw1E5Md3lKq586rtIlkEkCdENUlTUbDyLtsg2sn8uvx4RdRG6D
         qUSZyM52FAdnyIRc0nCAXhiu0vqHOxxuF2Tf4iJXoH5urtMbNXiIOfooPtNiFPLFt2xq
         u2EnT7+RWgCReWaDFEdFhe92Lm1cEKorfj8lgj7i5bddmJsoBEqX2Bonf+LOCipJYRzu
         F6kg4wz0p/mXhaxgm3EyUVCblIHabnm86mlmwLEVSMpDEHMe97HEZYC86crABNn5Fb2n
         MjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864334; x=1711469134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol5DwFk94dhNJ8561vUenj1hX3tsUa9C7nuNtM75Z+k=;
        b=enBlGyIUm9LfrwNwyDC4v6om0GlqS3Q4wybL/cGiFb5z6FaJ6YYO0yYzjgIm8wW3EC
         iIqbmuyM8EqFyEy0qxflfWVfpk6IKrEh+rbdo4eK4Px0koTNEzdi74CbjO32NATLJAiS
         n5CxLJn7Cry3xcc8hpy++yfHuinBpqazUssRMKYRMsXvhRCyhyit0Yh0aXv46slzFEkp
         PtuE9aE6fQnTbreGsCQWjpL+DUTwPFzrzbWeUVw7kjiQzi2mQYyUNJgOy+pOScL4aP52
         t7OSDe1a+auBV9FD65l0tEy0UUfPIWrEa2dynBP7qGqBkfYgBTPzspsbhMikdjpX1A/T
         ZfAA==
X-Forwarded-Encrypted: i=1; AJvYcCXIJ67b4vFHGoKTcQeK+SPd76Wuz1fXrOp8l7sl1Ame483B/yrc6CQkdpwjseEwrg2VLyCxhBm+ETlwzue0aPM/ncrA/BZD+wOUJ0yPgQ==
X-Gm-Message-State: AOJu0YyYqlPItnuL36Z6nvNFyW4mUahViPAmIVeKuBNRXsbtoHU1XD7r
	0D13IxNrF7CHz/pTuGLPwsaqYm1yP9bUTzQ/LR9sdl2DIrue1Ruf1c0HR47XdKVawU9tQNLbsBS
	o9Eor7VQJ9nHbSSCmOBoIxtz3bd5TsMcIucTsjQ==
X-Google-Smtp-Source: AGHT+IF8cnUo8sbparMWwRRVzaaD6qBiN+30eL8pVGijJslX0pHZp1XBv9v7gWbSuNhRHpCDDPAmYisXA5pPMF9uvsQ=
X-Received: by 2002:a25:780b:0:b0:dcd:97ad:74b3 with SMTP id
 t11-20020a25780b000000b00dcd97ad74b3mr2186633ybc.63.1710864334302; Tue, 19
 Mar 2024 09:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-0-926d7a4ccd80@linaro.org>
 <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-3-926d7a4ccd80@linaro.org>
 <CAA8EJpoJ0rUd8aY6xpXyL3Obg66XtOebso_AUUxKmg1CWNykJA@mail.gmail.com>
 <85d67f3f-2b01-44c0-ace3-5e7cb48a9431@linaro.org> <090e306c-0bfc-4374-83ed-e883d73a0f0a@linaro.org>
 <CAA8EJpovp1S9MYb3ByeoR7WmjPgUmqicqs_fQo_OoL5_NTNPJw@mail.gmail.com> <c799b110-978f-412f-b50e-87a4215a17cf@linaro.org>
In-Reply-To: <c799b110-978f-412f-b50e-87a4215a17cf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 18:05:22 +0200
Message-ID: <CAA8EJpp2pVnKh4J0TnGy_s_GB60P58xEW7OtmzReGVTF-1Ax-g@mail.gmail.com>
Subject: Re: [PATCH 3/7] phy: qcom: qmp-pcie: register second optional PHY AUX clock
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 17:15, <neil.armstrong@linaro.org> wrote:
>
> On 19/03/2024 15:46, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 16:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> On 19/03/2024 11:59, Neil Armstrong wrote:
> >>> On 19/03/2024 11:55, Dmitry Baryshkov wrote:
> >>>> On Tue, 19 Mar 2024 at 12:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>>
> >>>>> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> >>>>> add the code to register it for PHYs configs that sets a aux_clock_rate.
> >>>>>
> >>>>> In order to get the right clock, add qmp_pcie_clk_hw_get() which uses
> >>>>> the newly introduced QMP_PCIE_PIPE_CLK & QMP_PCIE_PHY_AUX_CLK clock
> >>>>> IDs and also supports the legacy bindings by returning the PIPE clock.
> >>>>>
> >>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>> ---
> >>>>>    drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 70 ++++++++++++++++++++++++++++++++
> >>>>>    1 file changed, 70 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >>>>> index 079b3e306489..2d05226ae200 100644
> >>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >>>>> @@ -22,6 +22,8 @@
> >>>>>    #include <linux/reset.h>
> >>>>>    #include <linux/slab.h>
> >>>>>
> >>>>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >>>>> +
> >>>>>    #include "phy-qcom-qmp-common.h"
> >>>>>
> >>>>>    #include "phy-qcom-qmp.h"
> >>>>> @@ -2389,6 +2391,9 @@ struct qmp_phy_cfg {
> >>>>>
> >>>>>           /* QMP PHY pipe clock interface rate */
> >>>>>           unsigned long pipe_clock_rate;
> >>>>> +
> >>>>> +       /* QMP PHY AUX clock interface rate */
> >>>>> +       unsigned long aux_clock_rate;
> >>>>>    };
> >>>>>
> >>>>>    struct qmp_pcie {
> >>>>> @@ -2420,6 +2425,7 @@ struct qmp_pcie {
> >>>>>           int mode;
> >>>>>
> >>>>>           struct clk_fixed_rate pipe_clk_fixed;
> >>>>> +       struct clk_fixed_rate aux_clk_fixed;
> >>>>>    };
> >>>>>
> >>>>>    static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> >>>>> @@ -3681,6 +3687,62 @@ static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
> >>>>>           return devm_clk_hw_register(qmp->dev, &fixed->hw);
> >>>>>    }
> >>>>>
> >>>>> +/*
> >>>>> + * Register a fixed rate PHY aux clock.
> >>>>> + *
> >>>>> + * The <s>_phy_aux_clksrc generated by PHY goes to the GCC that gate
> >>>>> + * controls it. The <s>_phy_aux_clk coming out of the GCC is requested
> >>>>> + * by the PHY driver for its operations.
> >>>>> + * We register the <s>_phy_aux_clksrc here. The gcc driver takes care
> >>>>> + * of assigning this <s>_phy_aux_clksrc as parent to <s>_phy_aux_clk.
> >>>>> + * Below picture shows this relationship.
> >>>>> + *
> >>>>> + *         +---------------+
> >>>>> + *         |   PHY block   |<<---------------------------------------------+
> >>>>> + *         |               |                                               |
> >>>>> + *         |   +-------+   |                      +-----+                  |
> >>>>> + *   I/P---^-->|  PLL  |---^--->phy_aux_clksrc--->| GCC |--->phy_aux_clk---+
> >>>>> + *    clk  |   +-------+   |                      +-----+
> >>>>> + *         +---------------+
> >>>>> + */
> >>>>> +static int phy_aux_clk_register(struct qmp_pcie *qmp, struct device_node *np)
> >>>>> +{
> >>>>> +       struct clk_fixed_rate *fixed = &qmp->aux_clk_fixed;
> >>>>> +       struct clk_init_data init = { };
> >>>>> +       int ret;
> >>>>> +
> >>>>> +       ret = of_property_read_string_index(np, "clock-output-names", 1, &init.name);
> >>>>> +       if (ret) {
> >>>>> +               dev_err(qmp->dev, "%pOFn: No clock-output-names index 1\n", np);
> >>>>> +               return ret;
> >>>>> +       }
> >>>>> +
> >>>>> +       init.ops = &clk_fixed_rate_ops;
> >>>>> +
> >>>>> +       fixed->fixed_rate = qmp->cfg->aux_clock_rate;
> >>>>> +       fixed->hw.init = &init;
> >>>>> +
> >>>>> +       return devm_clk_hw_register(qmp->dev, &fixed->hw);
> >>>>> +}
> >>>>> +
> >>>>> +static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void *data)
> >>>>> +{
> >>>>> +       struct qmp_pcie *qmp = data;
> >>>>> +
> >>>>> +       /* Support legacy bindings */
> >>>>> +       if (!clkspec->args_count)
> >>>>> +               return &qmp->pipe_clk_fixed.hw;
> >>>>> +
> >>>>> +       switch (clkspec->args[0]) {
> >>>>> +       case QMP_PCIE_PIPE_CLK:
> >>>>> +               return &qmp->pipe_clk_fixed.hw;
> >>>>> +       case QMP_PCIE_PHY_AUX_CLK:
> >>>>> +               return &qmp->aux_clk_fixed.hw;
> >>>>> +       }
> >>>>> +
> >>>>> +       return ERR_PTR(-EINVAL);
> >>>>> +}
> >>>>
> >>>> Can we use of_clk_hw_onecell_get() instead? I think it even should be
> >>>> possible to use onecell for both cases, it will look at the first arg,
> >>>> which will be 0 in case of #clock-cells equal to 0.
> >>>
> >>> Let me investigate if it's possible
> >>
> >> Ok, it would work but it would require building a clk_hw_onecell_data a runtime,
> >> while we could simply provide this qmp_pcie_clk_hw_get() and avoid runtime 2 allocations.
> >>
> >> I'm not sure it's worth it.
> >
> > Single allocation (or even 0 allocations if you embed it into struct
> > qmp_pcie) for the sake of using standard helpers.
>
> And I just recall I tried the same for Amlogic clocks, but the clk_hw_onecell_data hws
> field is a flexible array member you can't set at runtime, if you try you'll get:
> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:3753:38: error: invalid use of flexible array member
>   3753 |                 qmp->clk_hw_data.hws = qmp->clk_hws;

Yes, so it's either
devm_kzalloc(dev, struct_size(data, hws, 2), GFP_KERNEL);
or
struct qmp_pcie {
...
  struct {
    struct clk_hw_onecell_data clk_data;
    struct clk_hw clocks[2];
  };
};

>
> Neil
>
> >
> >
> >
>


-- 
With best wishes
Dmitry

