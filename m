Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF759DBA19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 01:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441737AbfJQXRB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 19:17:01 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33759 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438437AbfJQXRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 19:17:00 -0400
Received: by mail-il1-f193.google.com with SMTP id v2so3806485ilm.0;
        Thu, 17 Oct 2019 16:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o5eiJ+Rr8lrcCywXBY41R7qO2TUsmlP34HZv/WGlGI8=;
        b=aTR86OCwa7fQ4jf/ECe+TcV8dbTTUD+Nmb9upANhKQ1xQdFOV6aysx8K4i+BFqdZgl
         6naN5yrV4WNhPGRFeE6uylFvIwApaaD06n+7BWaSsw3AGjyji/z5D8Z7yr+7vKXtCapt
         vkJt2NH+Facqutf1WMl3ZY3ua2hNN65IJevNPMKTSnJTAHQeTKWX/vW73qpl8CnsRP6J
         WWlKbkaz5/kQHSeZZuqxVG6si+54GoWB04LXqev7s4i8L6k+PG/SAjOFuCBojSRFFLFo
         brS9afkspy/vMAjkJ0X+GPiF9oKlQ419Y+39ZkqTo6VrYROxGVlM9U0jpj02uuOeE2xR
         LnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o5eiJ+Rr8lrcCywXBY41R7qO2TUsmlP34HZv/WGlGI8=;
        b=XbZBwxuOLC3T6IaT2KjW5DK8fWh3IF0hjcf0qbHdqMPuRB34M+jyL/HQK+gZl+Ecnb
         oEX5G2NvST+K6GhUn8i1v645aEPaDow6VaKTKsFbg3R4LN1GfCqg612ISMAeiak4aEp3
         au6OIeCyxMsqL7UaZoqy8AYSphRMzrJ8VKrTgjEmzwgS6QHSdcdI/sckdbbr58DFTsab
         8gJeEkw/tBVKZ+mwBKUiLk93oF8123m+LhpEywOaPtPMxWoMIth2beORNK7GwKuPXA2P
         ac4RIEzL/uziOEfBdWgkGqSCt87QgNzrpWuC/3+jliucpQZ1xP3So53O6ru+f3K8Qqoh
         cHtA==
X-Gm-Message-State: APjAAAUKOpNr/hKio8wPFY4hQDsEsU5pNWe+6d6714KjHhanxBmCoSRF
        hVrAGqbefRS0Vg5KGSDCdfnupyPZ4bz65SZ92Oo=
X-Google-Smtp-Source: APXvYqz2VKklqccrCLE38xT07Yj3Dju5GcLXQelKSQkeQlo7gkReRkybRpkVAPFsBBwdPbIb+5ElDDBVtY3NeZ6W2xM=
X-Received: by 2002:a92:1dd6:: with SMTP id g83mr6764418ile.178.1571354219313;
 Thu, 17 Oct 2019 16:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com>
 <20191002011640.36624-1-jeffrey.l.hugo@gmail.com> <20191017215023.2BFEC20872@mail.kernel.org>
In-Reply-To: <20191017215023.2BFEC20872@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 17 Oct 2019 17:16:48 -0600
Message-ID: <CAOCk7NqgWkt6BwY75eGS2dbJ7GGk3DqH5NC0VLHUq4fc6WuYog@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: qcom: Add MSM8998 GPU Clock Controller
 (GPUCC) driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 17, 2019 at 3:50 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-10-01 18:16:40)
> > diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> > new file mode 100644
> > index 000000000000..f0ccb4963885
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gpucc-msm8998.c
> > @@ -0,0 +1,346 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019, Jeffrey Hugo
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/bitops.h>
> > +#include <linux/err.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/clk.h>
>
> Drop this include please.

Will do.

>
> > +
> > +
> > +static struct clk_rcg2 rbcpr_clk_src = {
> > +       .cmd_rcgr = 0x1030,
> > +       .hid_width = 5,
> > +       .parent_map = gpu_xo_gpll0_map,
> > +       .freq_tbl = ftbl_rbcpr_clk_src,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "rbcpr_clk_src",
> > +               .parent_data = gpu_xo_gpll0,
> > +               .num_parents = 2,
> > +               .ops = &clk_rcg2_ops,
> > +       },
> > +};
> > +
> > +static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
> > +       F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > +       { }
>
> I guess this one doesn't do PLL ping pong? Instead we just reprogram the
> PLL all the time? Can we have rcg2 clk ops that set the rate on the
> parent to be exactly twice as much as the incoming frequency? I thought
> we already had this support in the code. Indeed, it is part of
> _freq_tbl_determine_rate() in clk-rcg.c, but not yet implemented in the
> same function name in clk-rcg2.c! Can you implement it? That way we
> don't need this long frequency table, just this weird one where it looks
> like:
>
>         { .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 }
>         { }
>
> And then some more logic in the rcg2 ops to allow this possibility for a
> frequency table when CLK_SET_RATE_PARENT is set.

Does not do PLL ping pong.  I'll look at extending the rcg2 ops like
you describe.

>
> > +};
> > +
> > +static struct clk_rcg2 gfx3d_clk_src = {
> > +       .cmd_rcgr = 0x1070,
> > +       .hid_width = 5,
> > +       .parent_map = gpu_xo_gpupll0_map,
> > +       .freq_tbl = ftbl_gfx3d_clk_src,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "gfx3d_clk_src",
> > +               .parent_data = gpu_xo_gpupll0,
> > +               .num_parents = 2,
> > +               .ops = &clk_rcg2_ops,
> > +               .flags = CLK_OPS_PARENT_ENABLE,
>
> Needs CLK_SET_RATE_PARENT presumably?

Ah yeah.  Thanks for catching.

>
> > +       },
> > +};
> > +
> > +static const struct freq_tbl ftbl_rbbmtimer_clk_src[] = {
> > +       F(19200000, P_XO, 1, 0, 0),
> > +       { }
> > +};
> > +
> [...]
> > +
> > +static const struct qcom_cc_desc gpucc_msm8998_desc = {
> > +       .config = &gpucc_msm8998_regmap_config,
> > +       .clks = gpucc_msm8998_clocks,
> > +       .num_clks = ARRAY_SIZE(gpucc_msm8998_clocks),
> > +       .resets = gpucc_msm8998_resets,
> > +       .num_resets = ARRAY_SIZE(gpucc_msm8998_resets),
> > +       .gdscs = gpucc_msm8998_gdscs,
> > +       .num_gdscs = ARRAY_SIZE(gpucc_msm8998_gdscs),
> > +};
> > +
> > +static const struct of_device_id gpucc_msm8998_match_table[] = {
> > +       { .compatible = "qcom,gpucc-msm8998" },
>
> The compatible is different. In the merged binding it is
> qcom,msm8998-gpucc. Either fix this or fix the binding please.

This is wrong.  Will fix.
