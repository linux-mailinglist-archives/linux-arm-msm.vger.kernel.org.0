Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84D10A3EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2019 19:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfKZSLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Nov 2019 13:11:35 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40677 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKZSLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Nov 2019 13:11:35 -0500
Received: by mail-ed1-f67.google.com with SMTP id p59so17266219edp.7;
        Tue, 26 Nov 2019 10:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GrPJpcv2kAoZ7Pa5wFmqJ26HHkHbC+r60z5zGkgeTlc=;
        b=FSuf+eIjU3TVKhG5wdERqGRJHInyQ242QsArJiIxTXaO8NkLp8PHC/W0qznac8Bmdq
         zGrAW4QDMSJb/t9Mw60jLTMBeLECvQkTBdFmW5XYMUiFLKGxBURKYeho2WeWW/pvg/gT
         XKdiuDXkxT+gFJQbFXPcUWaASAIrsNWLhA7KNOyIuN9P0R7Caa5Yk8GLx0NrtRTWHhH1
         Iix6d8bsDgKHiQogZWKRPXH5lp/IXuiUKOBnEGnLW6QQ8MtYDzzas+6hng3h91spr8Mx
         9oYUVNU7ssTmVKPwyXRcAKDAFzylH77UGVf89YdyNumOq1iIGNllnoL/xFByP/CcN/qG
         kf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GrPJpcv2kAoZ7Pa5wFmqJ26HHkHbC+r60z5zGkgeTlc=;
        b=DLJhPvnEgOir0TcJDxVid6tVS7xikOI/beaAbRX/6O50nb26J1L7pOHA9d6J7tT6+N
         PWX4bYSdrGT+bFVI9Cpnu1Q10BQfuWmCbLMFwChdrjc181E0YTGllbIMmxv8piAl8KL8
         fd/pNEgMBr7lgs6ADP1wyKQ6TMVOEV7HNwvTYSLUqMNDCwLh5SCxFhs+gBBlrS7Xi0SQ
         78ZWUHkPMq+E6JharjgZV/LXd9Nccj2PlhBhGfPNRUuHqphABiGV5d4leLXRKw7OxKQM
         IRlulumxXC7WmAYZzNbCj+lJ+3pN2KJWQY1aeM/bEbzUFmWD3XRJEBl69bYwLOmFzIZa
         Mh4Q==
X-Gm-Message-State: APjAAAXVYOFtna2xjqBwGMNuTVGbYtHnJrr5xuMryInin7AFoRhbnCVA
        Zs+G+P4t3O5rivHAzl+bR9LJ9t+mjlg6a62harAXeQ30
X-Google-Smtp-Source: APXvYqyVJHex6P7ZcXk5/hKvrcaAeGEsaoCQtrfF/3Oau4K1nnAbP3tjEKKX+LCRti1tdM31YUGnazk/od3wjhMyB14=
X-Received: by 2002:a05:6402:2d7:: with SMTP id b23mr1048647edx.272.1574791891717;
 Tue, 26 Nov 2019 10:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20191126153437.11808-1-georgi.djakov@linaro.org>
In-Reply-To: <20191126153437.11808-1-georgi.djakov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 26 Nov 2019 10:11:19 -0800
Message-ID: <CAF6AEGvCibvC+VZ+9RwfgJ=m3i+mZOccVvRGygmS=ZLpqJQURA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Add missing flag to votable GDSCs
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, anischal@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 26, 2019 at 7:34 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> On sdm845 devices, during boot we see the following warnings (unless we
> have added 'pd_ignore_unused' to the kernel command line):
>         hlos1_vote_mmnoc_mmu_tbu_sf_gdsc status stuck at 'on'
>         hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc status stuck at 'on'
>         hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_tbu2_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_tbu1_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc status stuck at 'on'
>
> As the name of these GDSCs suggests, they are "votable" and in downstream
> DT, they all have the property "qcom,no-status-check-on-disable", which
> means that we should not poll the status bit when we disable them.
>
> Luckily the VOTABLE flag already exists and it does exactly what we need,
> so let's make use of it to make the warnings disappear.
>
> Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver for SDM845")
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Tested-by: Rob Clark <robdclark@gmail.com>

(on yoga c630)

> ---
>  drivers/clk/qcom/gcc-sdm845.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 95be125c3bdd..56d22dd225c9 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3255,6 +3255,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc = {
>                 .name = "hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct gdsc hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc = {
> @@ -3263,6 +3264,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc = {
>                 .name = "hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct gdsc hlos1_vote_aggre_noc_mmu_tbu1_gdsc = {
> @@ -3271,6 +3273,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_tbu1_gdsc = {
>                 .name = "hlos1_vote_aggre_noc_mmu_tbu1_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct gdsc hlos1_vote_aggre_noc_mmu_tbu2_gdsc = {
> @@ -3279,6 +3282,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_tbu2_gdsc = {
>                 .name = "hlos1_vote_aggre_noc_mmu_tbu2_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
> @@ -3287,6 +3291,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
>                 .name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
> @@ -3295,6 +3300,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
>                 .name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
> @@ -3303,6 +3309,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
>                 .name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
>         },
>         .pwrsts = PWRSTS_OFF_ON,
> +       .flags = VOTABLE,
>  };
>
>  static struct clk_regmap *gcc_sdm845_clocks[] = {
