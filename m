Return-Path: <linux-arm-msm+bounces-14526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6E88005A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5147B281E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 15:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABEC3C2D;
	Tue, 19 Mar 2024 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1CVPPov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805A62818
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710861290; cv=none; b=hOcw1UMiGHhWhgc27KgDME20qOCIsWTIFsGSOPq0Ymfx7gfSrXaa23nRhMWAmK9Dr9avOe8rwjfBRf4mu2rD6t17hY1kuWVbKMlKZUn0sLxp+cHb1i6unlwxCo2RKzcU8bEBVPoRqVWcYGzlVYNV4lSdcTCzTv7zJqt8/pdwhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710861290; c=relaxed/simple;
	bh=xkOj7b1ZMS1MAMZcml0MFwR7EPZeVwY387Yu/UIqvC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeYctnJ0/odfBoyaEZ7yIZB5Cx3gPr9CsdZ1s/FOALHMo59zmgk6h96buUC4rl6a+h+B4UUSfnFJ7EUm+vf/viPcg6SrIZWuJmP9qNMTu1JWgeFYx7Q1cnK5ieRioBcsvFMVA8HG2Amgz3+UHOlWm9vfdvbfAivPjYwCjnW1Il8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1CVPPov; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60cbcd04de9so54072467b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710861288; x=1711466088; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVS70bXiNRbmokdk3ZXS6O5QaKqdEKXiWAu/P/5kjr4=;
        b=K1CVPPov3HskgLs31sDLA7DPx5nTxoYA/EIebJqEiHW44B6bxq93/Fz+tt9JCR5ka3
         LeACirfK8zbbUUTYGJeLlDAGd+nMKqc3nLU0VGe0r9hW/O+y6x/NBzLoBn68fFp+yIB9
         bhYks9yoEXAel5ykdHMlk53DwJHI0hJb9XBOUTRTblFRN4g98HQ9zx1uEI5Cyi4T8blH
         pA07bar7kMcuoVl8cJKCgJxd3OasopqjSgprWZHNI7Y2Ob9H4k80b9Rs9lAzD5yTIAL5
         PMR3SUv2pyo6SgieYi6KbCyxtXyi+ODUqAuqIqwrBQDUYp8D1qsucq8/AwsupcPX7mlF
         FIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710861288; x=1711466088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVS70bXiNRbmokdk3ZXS6O5QaKqdEKXiWAu/P/5kjr4=;
        b=tIGA+dIcWCSCNllmjwfLCEirWOdL8xCGt/sMTEjh1WaSR9DP2gnyZJUAMSPSjB/qwO
         ke+pD9ISF57JUkGLCdL0jVQlYXXTKgV+YM9LO+PB5qmNhwdujiUDXqdk0+pQAP3RRB9A
         VJQTcZpzhUix96f785h5L/ZAyZhatHi6RnD/r9ffltVKp3dcIz5wwhhUujx28yhX4gZV
         UCrRnKODekhfXSRJEse0G6PaeJzZV6chAVm0Rr+XtJBhw2zTqiBqR3uDuum9d9Kyjmj8
         7aE4JAdifVOJa6eV8Xbjb/1F8284H/PdNDTO3yiPI4ZYLSMyZ3iqJJCPe8g1X8OyvxaE
         8UsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUBebTWeF36dYf5HwW8Or29Eh3JDLkxtOjOAccHgnTArCwzAkp7iyuoh+VCFgKalMamn73+kUz0XauXfYXz/DVEDwaHOM8FwpVy1/W/w==
X-Gm-Message-State: AOJu0YxWipvCcauSo2m/uYvjDw7ZCipeooDb5HVq3HMXh+F7/d6T0PG8
	YuSZ/1MGaGdKQfABQjmUh9M3696y1ToX7IhHfTZEu75SyIE/jJ2acP2tyJsjcrJDosZXXGxOc3v
	67e5YfOuOFPcffl9Xwp2HOzR53oCpoZ7XX7W4AA==
X-Google-Smtp-Source: AGHT+IG371BrZteUMWggF3PVFpNhCgWwIYWH2iJha3VI99fIj7cSbX2f6XkXyduzPhNwbRX4IAWI+7qZYQxenZkfms4=
X-Received: by 2002:a25:1f56:0:b0:dcb:f7a0:b031 with SMTP id
 f83-20020a251f56000000b00dcbf7a0b031mr11972884ybf.50.1710861288226; Tue, 19
 Mar 2024 08:14:48 -0700 (PDT)
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
 <CAA8EJpovp1S9MYb3ByeoR7WmjPgUmqicqs_fQo_OoL5_NTNPJw@mail.gmail.com> <1b6bc933-d749-4852-a292-5b3b7bedc44e@linaro.org>
In-Reply-To: <1b6bc933-d749-4852-a292-5b3b7bedc44e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 17:14:36 +0200
Message-ID: <CAA8EJpou16Et516ncXFM6x7hv4yWX651V_XgU=k2KG4VKze+3g@mail.gmail.com>
Subject: Re: [PATCH 3/7] phy: qcom: qmp-pcie: register second optional PHY AUX clock
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 17:10, <neil.armstrong@linaro.org> wrote:
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
>
> I didn't find evidence this is the case, while following of_parse_clkspec() called
> from of_clk_get_hw() or clk_core_get(), where clkspec is not initialized, the
> __of_parse_phandle_with_args() and of_phandle_iterator_args() don't touch
> clkspec->args if it->cur_count is 0. So clkspec->args[0] may be left initialized
> and it would be abusingthe API to use it with #clocks-cells = 0.

Ack, true.

>
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
> >
> Well, sure
>
> Thanks,
> Neil
>


-- 
With best wishes
Dmitry

