Return-Path: <linux-arm-msm+bounces-14580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5968802CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4005C283AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1775518C05;
	Tue, 19 Mar 2024 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/jqgUs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78620319
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710867376; cv=none; b=N5FIjRV3JhVyYM6lL2oN7dp+JwicXq4JDq6P/fVUDufNMcLszT/CjvdX7UOAC9ainFZ7tk6xUfZODVMx2EPfFyP3IS0TqmNe4/gXHopelqGxDbg/RAG/jJJYaBnjCXJKiBVk05f37Hrtd8LVkQaABjR7RVZubci563Bf1ytwlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710867376; c=relaxed/simple;
	bh=LaVCpzbTH+LzhK8Y8DRFFpXIJfoYVinZlhQWI32SZPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhXvZLExxuyx51Ig7hRyrWsykwLfCowKdQFOZ85Q9tMqb6klirR2Izot1HBahrM1MyYJOB9fQhh2njzJZqCJ6tIITpXnEkjwu0hgJ60vRsQECi6rDyZN/zvcawTWlvNY9Vjtay7aTLb9dUM231QViaQw/pUQxhNmEtmd5NKKZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/jqgUs3; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso4927405276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710867372; x=1711472172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YkHjKPhUPt3fZU/G756ueDdxkjyiTjvSfugB2XJYp2E=;
        b=h/jqgUs3Mqp1nrfrpXxi3haS1TjlIn1XHNjSEoQ7JrBrBP+FeKpG21hMjeFHHajFkw
         EYvYRocdve5WTfXqklq/55qBlajd8OtY6ivg4QTDiedMW7HLBvhgA8gnZRdK8D7BxTTj
         Q0Uk3ojVJbQXu1TGeWBnoSY/2/oygBkzYMnnvQn/1IRfPzlcDKhjVv+Tt6NhbFVZR0FB
         15LKcl6lB6w+tJG8OK4AH+4teh1tUA4WixblpA4w5QMeCYx/u+A/0iTn+FT040fBEhyV
         ifTGXn6yOTwvzXASFMbbA2DVMGEHG80+cLCzWMgDSc4SotnMHFVcFr0cmEtSA6L4vcPZ
         Ynng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710867372; x=1711472172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkHjKPhUPt3fZU/G756ueDdxkjyiTjvSfugB2XJYp2E=;
        b=UBMv85boWHQFK+pSMfjO8oT3GU4D2rJqISldF4spO9qr+aBA4/S0qYkyWpiYzcrT/h
         9Uq8z6DqDGUpn9/qrWR5+/XAeKEQH8GVwW7lt7nlUmEVO0LdlGfyRcnB92rXZmgoG3v4
         ifwkUVs0ATDIZiMfSJVfGt37kDtXvzCxWNCTYliBs0gy8Y5MSFUhxZWf8ocBI09mC9Bs
         6Qzz6XVIM52R/1znhfXDyAf6K06k20XSeT0gghAotkuW7xXp702iLfEvW/SO5asPHLDQ
         6bWgD6d/NMUplp9/gBVEmiLs1OMeyEyUX3t87JPu/XyDfZqmMMn0MbFKM3yEr8wBPmVt
         1BVw==
X-Forwarded-Encrypted: i=1; AJvYcCU6M4jBZomZE5ikVTJYSKad9dn7lG1UgJL5jifgUuW5ej6PHIGMswjaiBFdM2Rsv+BsLc+Win4P+q1v3QMIWZdibc0rQ/AhGHEjS6z2zA==
X-Gm-Message-State: AOJu0YztftSXWsHBSbVKjuS4j5SGZhdPlbBoGn5g8IIeSCe8WvbwY1/D
	h+lrhH4F9AlgU5VCr213lsfkp7jBFrSuVlEyRLcT7qSSAhL4+s/E1hKrvpHK4DB1uHjgAcrrapc
	/EgNWnK7jRU2GZvjfaZ2n8fPhr9cJ+bKwKGU+GQ==
X-Google-Smtp-Source: AGHT+IHQGyrQSCFzYPtFZI5OVIQnV9UqVHhY1ukDJX0beVjFP+DlS1CQJiXmzNZgxIr8UYHu6GIuRKmLMusHowKmWWE=
X-Received: by 2002:a25:904:0:b0:dbe:9509:141c with SMTP id
 4-20020a250904000000b00dbe9509141cmr2672384ybj.30.1710867372238; Tue, 19 Mar
 2024 09:56:12 -0700 (PDT)
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
 <CAA8EJpovp1S9MYb3ByeoR7WmjPgUmqicqs_fQo_OoL5_NTNPJw@mail.gmail.com>
 <c799b110-978f-412f-b50e-87a4215a17cf@linaro.org> <CAA8EJpp2pVnKh4J0TnGy_s_GB60P58xEW7OtmzReGVTF-1Ax-g@mail.gmail.com>
 <3141e539-67f9-4a90-abf7-0cc8d95f7396@linaro.org>
In-Reply-To: <3141e539-67f9-4a90-abf7-0cc8d95f7396@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 18:56:00 +0200
Message-ID: <CAA8EJpq70JervmeDKS8T3xY3qgTunJWyPPomn_pRTRqOyDzMMg@mail.gmail.com>
Subject: Re: [PATCH 3/7] phy: qcom: qmp-pcie: register second optional PHY AUX clock
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 18:46, <neil.armstrong@linaro.org> wrote:
>
> On 19/03/2024 17:05, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 17:15, <neil.armstrong@linaro.org> wrote:
> >>
> >> On 19/03/2024 15:46, Dmitry Baryshkov wrote:
> >>> On Tue, 19 Mar 2024 at 16:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>
> >>>> On 19/03/2024 11:59, Neil Armstrong wrote:
> >>>>> On 19/03/2024 11:55, Dmitry Baryshkov wrote:
> >>>>>> On Tue, 19 Mar 2024 at 12:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>>>>
> >>>>>>> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> >>>>>>> add the code to register it for PHYs configs that sets a aux_clock_rate.
> >>>>>>>
> >>>>>>> In order to get the right clock, add qmp_pcie_clk_hw_get() which uses
> >>>>>>> the newly introduced QMP_PCIE_PIPE_CLK & QMP_PCIE_PHY_AUX_CLK clock
> >>>>>>> IDs and also supports the legacy bindings by returning the PIPE clock.
> >>>>>>>
> >>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>>> ---
> >>>>>>>     drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 70 ++++++++++++++++++++++++++++++++
> >>>>>>>     1 file changed, 70 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >>>>>>> index 079b3e306489..2d05226ae200 100644
> >>>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >>>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >>>>>>> @@ -22,6 +22,8 @@
> >>>>>>>     #include <linux/reset.h>
> >>>>>>>     #include <linux/slab.h>
> >>>>>>>
> >>>>>>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >>>>>>> +
> >>>>>>>     #include "phy-qcom-qmp-common.h"
> >>>>>>>
> >>>>>>>     #include "phy-qcom-qmp.h"
> >>>>>>> @@ -2389,6 +2391,9 @@ struct qmp_phy_cfg {
> >>>>>>>
> >>>>>>>            /* QMP PHY pipe clock interface rate */
> >>>>>>>            unsigned long pipe_clock_rate;
> >>>>>>> +
> >>>>>>> +       /* QMP PHY AUX clock interface rate */
> >>>>>>> +       unsigned long aux_clock_rate;
> >>>>>>>     };
> >>>>>>>
> >>>>>>>     struct qmp_pcie {
> >>>>>>> @@ -2420,6 +2425,7 @@ struct qmp_pcie {
> >>>>>>>            int mode;
> >>>>>>>
> >>>>>>>            struct clk_fixed_rate pipe_clk_fixed;
> >>>>>>> +       struct clk_fixed_rate aux_clk_fixed;
> >>>>>>>     };
> >>>>>>>
> >>>>>>>     static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> >>>>>>> @@ -3681,6 +3687,62 @@ static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
> >>>>>>>            return devm_clk_hw_register(qmp->dev, &fixed->hw);
> >>>>>>>     }
> >>>>>>>
> >>>>>>> +/*
> >>>>>>> + * Register a fixed rate PHY aux clock.
> >>>>>>> + *
> >>>>>>> + * The <s>_phy_aux_clksrc generated by PHY goes to the GCC that gate
> >>>>>>> + * controls it. The <s>_phy_aux_clk coming out of the GCC is requested
> >>>>>>> + * by the PHY driver for its operations.
> >>>>>>> + * We register the <s>_phy_aux_clksrc here. The gcc driver takes care
> >>>>>>> + * of assigning this <s>_phy_aux_clksrc as parent to <s>_phy_aux_clk.
> >>>>>>> + * Below picture shows this relationship.
> >>>>>>> + *
> >>>>>>> + *         +---------------+
> >>>>>>> + *         |   PHY block   |<<---------------------------------------------+
> >>>>>>> + *         |               |                                               |
> >>>>>>> + *         |   +-------+   |                      +-----+                  |
> >>>>>>> + *   I/P---^-->|  PLL  |---^--->phy_aux_clksrc--->| GCC |--->phy_aux_clk---+
> >>>>>>> + *    clk  |   +-------+   |                      +-----+
> >>>>>>> + *         +---------------+
> >>>>>>> + */
> >>>>>>> +static int phy_aux_clk_register(struct qmp_pcie *qmp, struct device_node *np)
> >>>>>>> +{
> >>>>>>> +       struct clk_fixed_rate *fixed = &qmp->aux_clk_fixed;
> >>>>>>> +       struct clk_init_data init = { };
> >>>>>>> +       int ret;
> >>>>>>> +
> >>>>>>> +       ret = of_property_read_string_index(np, "clock-output-names", 1, &init.name);
> >>>>>>> +       if (ret) {
> >>>>>>> +               dev_err(qmp->dev, "%pOFn: No clock-output-names index 1\n", np);
> >>>>>>> +               return ret;
> >>>>>>> +       }
> >>>>>>> +
> >>>>>>> +       init.ops = &clk_fixed_rate_ops;
> >>>>>>> +
> >>>>>>> +       fixed->fixed_rate = qmp->cfg->aux_clock_rate;
> >>>>>>> +       fixed->hw.init = &init;
> >>>>>>> +
> >>>>>>> +       return devm_clk_hw_register(qmp->dev, &fixed->hw);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void *data)
> >>>>>>> +{
> >>>>>>> +       struct qmp_pcie *qmp = data;
> >>>>>>> +
> >>>>>>> +       /* Support legacy bindings */
> >>>>>>> +       if (!clkspec->args_count)
> >>>>>>> +               return &qmp->pipe_clk_fixed.hw;
> >>>>>>> +
> >>>>>>> +       switch (clkspec->args[0]) {
> >>>>>>> +       case QMP_PCIE_PIPE_CLK:
> >>>>>>> +               return &qmp->pipe_clk_fixed.hw;
> >>>>>>> +       case QMP_PCIE_PHY_AUX_CLK:
> >>>>>>> +               return &qmp->aux_clk_fixed.hw;
> >>>>>>> +       }
> >>>>>>> +
> >>>>>>> +       return ERR_PTR(-EINVAL);
> >>>>>>> +}
> >>>>>>
> >>>>>> Can we use of_clk_hw_onecell_get() instead? I think it even should be
> >>>>>> possible to use onecell for both cases, it will look at the first arg,
> >>>>>> which will be 0 in case of #clock-cells equal to 0.
> >>>>>
> >>>>> Let me investigate if it's possible
> >>>>
> >>>> Ok, it would work but it would require building a clk_hw_onecell_data a runtime,
> >>>> while we could simply provide this qmp_pcie_clk_hw_get() and avoid runtime 2 allocations.
> >>>>
> >>>> I'm not sure it's worth it.
> >>>
> >>> Single allocation (or even 0 allocations if you embed it into struct
> >>> qmp_pcie) for the sake of using standard helpers.
> >>
> >> And I just recall I tried the same for Amlogic clocks, but the clk_hw_onecell_data hws
> >> field is a flexible array member you can't set at runtime, if you try you'll get:
> >> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:3753:38: error: invalid use of flexible array member
> >>    3753 |                 qmp->clk_hw_data.hws = qmp->clk_hws;
> >
> > Yes, so it's either
> > devm_kzalloc(dev, struct_size(data, hws, 2), GFP_KERNEL);
> > or
> > struct qmp_pcie {
> > ...
> >    struct {
> >      struct clk_hw_onecell_data clk_data;
> >      struct clk_hw clocks[2];
> >    };
> > };
>
> I won't go down this path because of that mess and using of_clk_hw_onecell_get() would need
> to still add a custom getter before calling of_clk_hw_onecell_get() to handle the
> #clock-cells=0 legacy case.

No need for custom getters, if you select the getter during DT probe.
But yes, choose whatever seems better.

>
> Neil
>
> >
> >>
> >> Neil
> >>
> >>>
> >>>
> >>>
> >>
> >
> >
>


-- 
With best wishes
Dmitry

