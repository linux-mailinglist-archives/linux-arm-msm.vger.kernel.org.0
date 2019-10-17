Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DC2DB5A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 20:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438130AbfJQSNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 14:13:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:57068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395229AbfJQSNa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 14:13:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D593C21835;
        Thu, 17 Oct 2019 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571336010;
        bh=p2EBmCeo1NzW2Lv198p0TuirtIGkkY0dXw/8bi0gofc=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=VmeeR2T3ro61u469I46UQl59iqcTLonF9jT0CcQrnpqp/tM8eEmYYv95c8iyr+DhZ
         sJcdMmtKBqLbAXpQxC3q+m6wPQxgE0150tgGg5X+BKTN8cQYyC/fPYmVQBXTXhdiOH
         1R38pxM2WKIS2DG4czOpHh6+huxMzr3PuYmZ2SZI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191006010100.32053-1-masneyb@onstation.org>
References: <20191006010100.32053-1-masneyb@onstation.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Brian Masney <masneyb@onstation.org>, mturquette@baylibre.com
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: add frequency table for gfx3d
User-Agent: alot/0.8.1
Date:   Thu, 17 Oct 2019 11:13:29 -0700
Message-Id: <20191017181329.D593C21835@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-10-05 18:01:00)
> From: Jonathan Marek <jonathan@marek.ca>
>=20
> Add frequency table for the gfx3d clock that's needed in order to
> support the GPU upstream on msm8974-based systems.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/clk/qcom/mmcc-msm8974.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8=
974.c
> index bcb0a397ef91..e70abfe2a792 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -452,10 +452,17 @@ static struct clk_rcg2 mdp_clk_src =3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_gfx3d_clk_src[] =3D {
> +       F(37500000, P_GPLL0, 16, 0, 0),
> +       F(533000000, P_MMPLL0, 1.5, 0, 0),
> +       { }
> +};

On msm-3.10 kernel the gpu clk seems to be controlled by the RPM[1].
What is going on here? This code just looks wrong, but I think it was
added as an rcg so that the branch wasn't orphaned and would have some
sane frequency. Eventually we planned to parent it to a clk exposed in
the RPM clk driver. It's been a while so I'm having a hard time
remembering, but I think GPU clk on this device needed to be controlled
by RPM so that DDR self refresh wouldn't interact badly with ocmem? Or
maybe ocmem needed GPU to be enabled to work? Maybe there is some
information in the 3.10 downstream kernel.

> +
>  static struct clk_rcg2 gfx3d_clk_src =3D {
>         .cmd_rcgr =3D 0x4000,
>         .hid_width =3D 5,
>         .parent_map =3D mmcc_xo_mmpll0_1_2_gpll0_map,
> +       .freq_tbl =3D ftbl_gfx3d_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "gfx3d_clk_src",
>                 .parent_names =3D mmcc_xo_mmpll0_1_2_gpll0,

[1] https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/mac=
h-msm/clock-rpm-8974.c?h=3Dmsm-3.10#n82
