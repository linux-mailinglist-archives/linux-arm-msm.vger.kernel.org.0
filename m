Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BA728D85F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 04:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgJNCPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 22:15:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJNCPu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 22:15:50 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09A6121775;
        Wed, 14 Oct 2020 02:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602641750;
        bh=fhGr3XZdlfqYG0uznQMt8oChKQSM58pho3sZPb9atd4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t6kUtKXziKf2RQ/UNOfAl36wz+hr+5vw9eqZnq1hIGdQDYPU/sp9Rlj3lfaQ9eRQs
         9WDCEMUN+SRnKKAV34jXR7knZKfB3V78KfcgOhzRxJYzjefoLXFWfz6O8h4POM6wOz
         pSK9Ibtta+TL/Vf++s1TsOrvzx7Nzkum8nPqbEm0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201005225914.315852-3-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org> <20201005225914.315852-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 2/3] clk: qcom: gdsc: enable external switchable power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Oct 2020 19:15:48 -0700
Message-ID: <160264174883.310579.10321983404701479878@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-05 15:59:13)
> On SM8250 MDSS_GDSC (and respective dispcc clocks) are children of MMCX
> power domain. MMCX needs to be enabled to be able to access GDSC
> registers and to enable display clocks. Use dev_pm/opp to enable
> corresponding power domain.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

A general question is why is this done in the gdsc code instead of
somewhere generic? It seems that genpds may need to change the
performance state of other genpds. I vaguely recall that genpd supports
connecting different power domains together so maybe this could all be
handled in the genpd layer instead of here? Then a regulator could be
put behind a genpd and similarly be connected to the gdsc and turned on
before turning on the gdsc?

>  drivers/clk/qcom/gdsc.c | 56 ++++++++++++++++++++++++++++++++++++++---
>  drivers/clk/qcom/gdsc.h |  5 ++++
>  2 files changed, 57 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index bd537438c793..d58575f8f25f 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -57,6 +57,11 @@ struct gdsc {
> =20
>         const char                      *supply;
>         struct regulator                *rsupply;
> +
> +       const char                      *domain;
> +       unsigned int                    perf_idx;
> +       struct device                   *pd_dev;
> +       int                             pd_opp;

Please document these fields.

>  };
