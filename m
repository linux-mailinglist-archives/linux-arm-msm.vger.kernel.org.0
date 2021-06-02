Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3ED398346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFBHm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:42:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229604AbhFBHm1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:42:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B7536138C;
        Wed,  2 Jun 2021 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622619644;
        bh=M1l/NYYtuxFxbVu7WCKEPQpJqbzqM6h63WYxIjp5/+0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n0Kb8UIKF9KVJqNnBYgLU06PQfXnj2Hr5vKjqld98lCNsK/wgmIzAQc+PjsFxfElr
         p9ZM7NP0JsRi3O1skvftL82V9y9vyFF8KQ8GF38YUGsXmDRdBzts/qae3t9ptd5zRK
         GCAw/6g96k8W/0lF2K7g0mrbRqDM9OcSM9PQbfQRLFmSW5EiouJ9BYJnE1eDn+WBn5
         9jvxjHJMsES4/A+iebnUW4o6YWKCkIrUfhv9oMGBjbOagQQvLYWj1E7WqnRED92+o+
         SdTP4BVqOzKMCy6FLxMqbfhjfV/N1ZzEYOnXOAchKLqAUTOuQJ6Lf3rmq2fdQ0eIRK
         /mycxf9AmQq6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210502122027.9351-5-bartosz.dudziak@snejp.pl>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl> <20210502122027.9351-5-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH 4/4] clk: qcom: smd-rpm: Add support for MSM8226 RPM clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 02 Jun 2021 00:40:43 -0700
Message-ID: <162261964337.4130789.14816345669886604238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bartosz Dudziak (2021-05-02 05:20:27)
> Add rmp smd clocks, PMIC and bus clocks which are required on MSM8226
> for clients to vote on.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 74 ++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 0e1dfa8948..bf73942e86 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -406,6 +406,79 @@ static const struct clk_ops clk_smd_rpm_branch_ops =
=3D {
>         .unprepare      =3D clk_smd_rpm_unprepare,
>  };
> =20
> +/* msm8226 */

This doesn't apply anymore. Can you resend just this one patch please?
And base it on clk-next which I will push out shortly. Ideally a bunch
of clks can be reused instead of redefined.

> +DEFINE_CLK_SMD_RPM(msm8226, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, =
0);
> +DEFINE_CLK_SMD_RPM(msm8226, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, =
1);
