Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F5C2A7B16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 10:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgKEJ4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 04:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgKEJ4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 04:56:13 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76278C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 01:56:12 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id k26so1106617oiw.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndz5Vv+R7dwHwUNh16wYXBC3DQLbUHpsCLSiSv8wpGw=;
        b=OJTzDyH0esN9OPZyPAj6631qDN2gKy7xWH7yicsOC4KQfdY/dTXwvMSG+gayb42JMW
         Zd/x5gaJCd1Fd83MFYkkQtVXu4HRcd0xYvhCht5PuM8n/y0vmnjRUNr7kfyp6JuTPc0t
         3pOSPwss6bXAbAz66A7tfLPQYYIxd1R4nBfTxWE6YE0M8B95RUVqmukEWLcGzYQfo8IJ
         ICjj3djjZKHIxfyqy97mleTfyxxBPMLq33nSs4iDShPqcud/W7qrrZubYKqyfVaxGUq0
         WEetyzgIJLqHpCLiv5WwC07b/98nOMNmPs7zYMKduro2vUZaUFNLvO4s5uojDUZMzqBI
         PG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndz5Vv+R7dwHwUNh16wYXBC3DQLbUHpsCLSiSv8wpGw=;
        b=PYHCcw9Nw6R6SGLk+n+JLc3PXVU9LHD1IG0+tqrpGtn1s/wir7p861NZPzndDVM5+v
         urmAsDBCQtjaXdknzTE03RVeZaFJxWw+O+dM8SaL2X/o6DkfuovQiCHkw8G62NpHjcno
         oN0d/mp20RyY+JZ71NvA3dw+K5GR5D762Q70cTw9oLtqbSDVgyh8GgSltog+VCF06oL2
         OMGt4ozmkEGf+Tap2voIoMD6k2cIH+cwg22YcTiiQ5uyLlrmT2BW51nQaSYpXliueZ8b
         Sv9KwR/NfWdzW7YoFJuKnUcpfmp320oW4nf0NWa24Jgeiruj1GITH+t0UrYQn2jSaUkQ
         QOLg==
X-Gm-Message-State: AOAM530KZX6V4xCDqAuwX16iz/e7d4wOQeTy+VSg5PtbjO0ro1e4GHtF
        3oeT7iLk7ivb5lKyn+8y2QbiKS94iSDnHs1kHivfeg==
X-Google-Smtp-Source: ABdhPJzpNj4ARWML+b5ZkSBTL/EAiEsuc6lD/J3O0DQRD37LBqn+eu39NyqkN4z3f9pG87siPsVjo40h8K1SFJ7cKWA=
X-Received: by 2002:aca:f1c6:: with SMTP id p189mr1076089oih.18.1604570171786;
 Thu, 05 Nov 2020 01:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
 <20201023131925.334864-6-dmitry.baryshkov@linaro.org> <160454417608.3965362.16775651224166864448@swboyd.mtv.corp.google.com>
In-Reply-To: <160454417608.3965362.16775651224166864448@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 5 Nov 2020 12:56:00 +0300
Message-ID: <CAA8EJppY3gnumEWHiVtm-T9vBDLVkpojVC-BD4qpfQ0rzhymtA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: handle MMCX power domain
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 Nov 2020 at 05:42, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2020-10-23 06:19:25)
> > On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
> > This power domain is expressed as mmcx-supply regulator property. Use
> > this regulator as MDSS_GDSC supply.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/dispcc-sm8250.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> > index 07a98d3f882d..588575e1169d 100644
> > --- a/drivers/clk/qcom/dispcc-sm8250.c
> > +++ b/drivers/clk/qcom/dispcc-sm8250.c
> > @@ -963,6 +963,7 @@ static struct gdsc mdss_gdsc = {
> >         },
> >         .pwrsts = PWRSTS_OFF_ON,
> >         .flags = HW_CTRL,
> > +       .supply = "mmcx",
> >  };
> >
>
> Can this patch be applied to clk tree or will it break the tree without
> the dts/regulator bits in place?

It can be applied to clk tree. Regulator bits are already accepted by
Mark Brown.


-- 
With best wishes
Dmitry
