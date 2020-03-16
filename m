Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40EC718718B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731977AbgCPRtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:49:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:42018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730437AbgCPRtQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:49:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FEA720658;
        Mon, 16 Mar 2020 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584380955;
        bh=xfZTyr5ja+RYNnMtZwetmtPv+1AaqscNKven2FfkDxo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oSKsU9SJzm/EgdmfAJYDTOlPriLwztJA85HMjiIi2sSw8r069BfrEZgsdO3OKAAJb
         jNf1SxhN1ajEtZvk51Mb6dT8GkeMeTQCB7vItI33yfsE+L7gCgTAkkCoo4xjNNpHYJ
         kD56b2zhaxo0WpofpKkWwAxD4yOY8VF4YUbgcVQM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584356082-26769-2-git-send-email-tdas@codeaurora.org>
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org> <1584356082-26769-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/3] clk: qcom: gcc: Add support for a new frequency for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 16 Mar 2020 10:49:14 -0700
Message-ID: <158438095454.88485.11063617239206162025@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-16 03:54:40)
> There is a requirement to support 51.2MHz from GPLL6 for qup clocks,
> thus update the frequency table and parent data/map to use the GPLL6
> source PLL.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Any Fixes: tag for this? I guess the beginning of this driver being
introduced?

>  drivers/clk/qcom/gcc-sc7180.c | 73 ++++++++++++++++++++++---------------=
------
>  1 file changed, 37 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index 7f59fb8..ad75847 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -405,8 +406,8 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_=
clk_src[] =3D {
>=20
>  static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init =3D {
>         .name =3D "gcc_qupv3_wrap0_s0_clk_src",
> -       .parent_data =3D gcc_parent_data_0,
> -       .num_parents =3D 4,
> +       .parent_data =3D gcc_parent_data_1,

This should have been done initially. We shouldn't need to describe
"new" parents when they have always been there. Are there other clks in
this driver that actually have more parents than we've currently
described? If so, please fix them.

> +       .num_parents =3D 5,

Can you use ARRAY_SIZE(gcc_parent_data_1) instead? That way this isn't a
hard-coded value.

>         .ops =3D &clk_rcg2_ops,
>  };
>
