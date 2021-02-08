Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49562313CED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhBHSNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:13:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:51546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235530AbhBHSMa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:12:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2506064DB3;
        Mon,  8 Feb 2021 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807909;
        bh=y2NVL4Yl43eMG6DShygFH6XSRthRihyKlGMQ4QdfkTU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=En1E006nnP3KHMxUQLxhxfyvn/RKeVS6gqvvxNj9dORDZCV27/ZIAF+ny1QllUNbD
         Mb/dNoY/AZOL+eUW30aFAnnRUaJNgIMseZz/p5box6doSINrHt35IbCgmhYGjgmMMe
         SxFycZSrBMQLHHv5kIYdHjOxAlx9rJTIU8op/AYjEF+FFsFUnVa0YaldzveZTi2waN
         uyTft2R7goXnTl8DpGOTob8tSGCcszS/gJ52KoXVDAuV96zxB0K88L0xIQfeml9DLn
         Y8asfRb5ISqsDkWUgCwxPrGdJD6m1OBalA32DfDvFDn1S+VDZCItUmWKNqSKrPdZeN
         QDiyaoF8LNMgA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210131013009.54177-1-konrad.dybcio@somainline.org>
References: <20210131013009.54177-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH] clk: qcom: smd-rpm: Add mdm9607 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:11:47 -0800
Message-ID: <161280790782.76967.18306042361115021910@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-01-30 17:30:09)
> Add support for RPM-managed clocks on the MDM9607 platform.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
>  drivers/clk/qcom/clk-smd-rpm.c                | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Doc=
umentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index b44a0622fb3a..5ac207d4b8ab 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -10,6 +10,7 @@ Required properties :
>  - compatible : shall contain only one of the following. The generic
>                 compatible "qcom,rpmcc" should be also included.
> =20
> +                       "qcom,rpmcc-mdm9607", "qcom,rpmcc"
>                         "qcom,rpmcc-msm8660", "qcom,rpmcc"
>                         "qcom,rpmcc-apq8060", "qcom,rpmcc"
>                         "qcom,rpmcc-msm8916", "qcom,rpmcc"
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 0e1dfa89489e..ceea50bae8f8 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -406,6 +406,37 @@ static const struct clk_ops clk_smd_rpm_branch_ops =
=3D {
>         .unprepare      =3D clk_smd_rpm_unprepare,
>  };
> =20
> +/* mdm9607 */
> +DEFINE_CLK_SMD_RPM_BRANCH(mdm9607, xo_clk_src, xo_a_clk_src, QCOM_SMD_RP=
M_MISC_CLK, 0,
> +                                                               19200000);

Same comment about the parent rate being specified here. Please follow
how clk-rpmh has done it.

> +DEFINE_CLK_SMD_RPM(mdm9607, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK=
, 0);
