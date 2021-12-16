Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3474C477C3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 20:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbhLPTKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 14:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbhLPTKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 14:10:19 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5A5C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 11:10:19 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id i12so172800pfd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uO+11cw4ZctCPdxXSQXpwk66+o5puMHpd0KxCNexH+w=;
        b=NF9PS9/wDcok+Imq8A7bRq8QqRMXgyzebYarw2YRjSJ3EvGS7EyZ21k7tpCc8lGKf2
         kRgWiL8GJwpQS4WThrAuJFQxN8BLqdZn5ER0SB7JHytvyQ2A6BwJY0tqP/m3ziekpQGi
         h2K6MTy/3lHKPs4fPPABfi8HgMRG1MKdVuGg5Y2dim3CGmZivbLpvv5xai7+IQ1nDI1D
         etzgsJYAwcYrk4kJoHweryjUMj1kyzR96xMlvCspT7MaWK0xkZL2sohSLEE/l05f0DN6
         0KC8xFdyiCr76BKod17Zj3jMMMBndK9NDBcqBttvsSFZReBaG6HiVOHx3HhJ+VSMjR1O
         S71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uO+11cw4ZctCPdxXSQXpwk66+o5puMHpd0KxCNexH+w=;
        b=Kti0e21/4wU2oO5B9kBXZ/jl+GVbH6Ekz4S9+JFwwomEMOlLXnIGc21QwAbwnPUbL3
         fmFWW2I+B4jvfxngzi5XW2NEf26VLKE9c1DYa5MtoOgzRcuG72yqWQy94O/YlNvBmGvN
         n8/udJBqTwlqKqa07cgRCpUIdqf/m4L0VIB4+bLgfiIgO8JvOVI/E/I7GWYNWlrfsaDH
         vekcv72igkJSprUOSo/J1+1gXqb63q8L9t6quAb+5Ol/GT9bH7bLL7WiXBYuEvJOIAHe
         n4p9OlGCtKmdPtPFZxXQeSMt2QWdJGC8akHYVIM97a115seD4pFD+tolPepGAs45/mKH
         YNgw==
X-Gm-Message-State: AOAM532QBXR4XFRrQub9HANkhw9Sa+zh/XsCKza9/jHcI381xDjNU9vb
        rNLCbIODwyiBDui5/nrPHSzGqO2fDbGIE2gnz7bYHDvajNk=
X-Google-Smtp-Source: ABdhPJyHi/CcjLmMA8BDlLiVchhBwavFf2BU9wNZLuuiQbCKMhBSQXzAf1pHuOo2jglS4cInexL79hKeY5kIoYFmt9o=
X-Received: by 2002:a63:2212:: with SMTP id i18mr13216955pgi.586.1639681818623;
 Thu, 16 Dec 2021 11:10:18 -0800 (PST)
MIME-Version: 1.0
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org> <20211216034909.3EFCBC36AE0@smtp.kernel.org>
In-Reply-To: <20211216034909.3EFCBC36AE0@smtp.kernel.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 16 Dec 2021 20:21:51 +0100
Message-ID: <CAMZdPi9eAFaExcTTgOt6TFE37EA-bb9xSy3nq9=nKYd5kqwmfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: Add display clock controller driver for QCM2290
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,


On Thu, 16 Dec 2021 at 04:49, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Loic Poulain (2021-12-09 06:09:10)
> > diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> > new file mode 100644
> > index 00000000..8aa5d31
> > --- /dev/null
> > +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> > @@ -0,0 +1,602 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021, Linaro Ltd.
> > + */
> > +
[...]
> > +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
> > +       .cmd_rcgr = 0x205c,
> > +       .mnd_width = 8,
> > +       .hid_width = 5,
> > +       .parent_map = disp_cc_parent_map_4,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "disp_cc_mdss_pclk0_clk_src",
> > +               .parent_data = disp_cc_parent_data_4,
> > +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> > +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE | CLK_OPS_PARENT_ENABLE,
>
> These last two flags are needed for what?

NOCACHE is probably useless with mainline.

I've added OPS_PARENT_ENABLE because AFAIU changing clock rate can
lead to parent switch, and parent switch can only be done if parent
clocks are enabled for rcg2 clocks. Otherwise the update fails and we
get the following:
    disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
    WARNING: CPU: 2 PID: 77 at drivers/clk/qcom/clk-rcg2.c:122
update_config+0xe0/0xf0

I'm a bit surprised other similar dispcc drivers don't use the same
flags though.


>
> > +               .ops = &clk_pixel_ops,
> > +       },
> > +};
> > +
> > +static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
> > +       .cmd_rcgr = 0x208c,
> > +       .mnd_width = 0,
> > +       .hid_width = 5,
> > +       .parent_map = disp_cc_parent_map_1,
> > +       .freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "disp_cc_mdss_vsync_clk_src",
> > +               .parent_data = disp_cc_parent_data_1,
> > +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> > +               .flags = CLK_SET_RATE_PARENT,
> > +               .ops = &clk_rcg2_ops,
> > +       },
> > +};
> > +
[...]
> > +
> > +static struct clk_branch disp_cc_xo_clk = {
> > +       .halt_reg = 0x604c,
> > +       .halt_check = BRANCH_HALT,
> > +       .clkr = {
> > +               .enable_reg = 0x604c,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "disp_cc_xo_clk",
> > +                       .parent_hws = (const struct clk_hw*[]){
> > +                               &disp_cc_xo_clk_src.clkr.hw,
> > +                       },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
>
> We need a comment why it's critical. Also I'm not sure why we would ever
> turn this clk off or change the rate. Can't we just hit some registers
> during probe to make sure it's on and drop this clk?

Yes, good point, no objection, we will lose the hierarchical clk view
for this clk (up to bi_tcxo_ao), but it does not really matter.

Regards,
Loic
