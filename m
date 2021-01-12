Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970742F3D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 01:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393298AbhALVgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 16:36:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:59910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406940AbhALT6a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 14:58:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 824A5206C3;
        Tue, 12 Jan 2021 19:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610481469;
        bh=z2DPQkl8j3oNPm3GhJ8TMRR7bamYAtVZ1voeLiWbMM8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NMenzqaWfNOWIcxf5UoRPKmW/Qc4ecdCxabu0U4W1H9MccT0Z9wNL6P73LKufTcKT
         YnjLp7gRbSks9kfkPR3OvrAc7I2dd8q7fQLhmgNcQ2YmHgEyRFqkBq2M+NrG9otogt
         8FqA+Xd1dqSkqDLjH5nZDEhFjoe74xygFmoPOuYnclBrKzjQCyturU24uwRcqTeijq
         65tMAMwwYTvRRA0h5nEkj+mkeGrCD4XVl/PpAg005fXDhkF5glZk8E7tsxj/f103OU
         K1N0kf0ccBZF0ZsVLmdQyX9fKlFtGBpF9Q+7XBqcYi68vN0z2dP6n1VUWZEnDBPTMU
         VnELaShy2mpsg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201226140934.89856-1-konrad.dybcio@somainline.org>
References: <20201226140934.89856-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: Fix mmss_s0_axi clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mike Turquette <mturquette@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 12 Jan 2021 11:57:46 -0800
Message-ID: <161048146613.3661239.17638637385414531449@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-12-26 06:09:34)
> On boards without cont_splash the clock wouldn't get enabled.
> Reparent it and strongly depend on the parent to make sure
> it's accessible. Access to MMSS depends on mmss_s0_axi being

It's not a dependency. The parent is supposed to be the actual parent
clk that is directly upstream of the clk. I understand that some
dependency isn't enabled but maybe that just means we need to write some
enable bit when this driver probes instead?

> up and alive.
>=20
> Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clo=
ck controller (MMCC)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/clk/qcom/mmcc-msm8974.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8=
974.c
> index 015426262d08..6220b62ece1e 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -2101,11 +2101,11 @@ static struct clk_branch mmss_s0_axi_clk =3D {
>                 .hw.init =3D &(struct clk_init_data){
>                         .name =3D "mmss_s0_axi_clk",
>                         .parent_names =3D (const char *[]){
> -                               "mmss_axi_clk_src",
> +                               "mmss_mmssnoc_axi_clk",
>                         },
>                         .num_parents =3D 1,
>                         .ops =3D &clk_branch2_ops,
> -                       .flags =3D CLK_IGNORE_UNUSED,
> +                       .flags =3D CLK_IGNORE_UNUSED | CLK_SET_RATE_PAREN=
T | CLK_OPS_PARENT_ENABLE,
>                 },
>         },
