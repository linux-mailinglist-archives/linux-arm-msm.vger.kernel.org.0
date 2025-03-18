Return-Path: <linux-arm-msm+bounces-51851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0FA67FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 23:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6AF7423B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499362135BC;
	Tue, 18 Mar 2025 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxRsJ2Nw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142D72080CD;
	Tue, 18 Mar 2025 22:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742338234; cv=none; b=WCgFR0J6UG9ZlLalBXBqwfSFNBiDm0MEPzDVz5DuDmqhzciLnIDG0ls/kmo/nZWyvQqZsOj2us5GsCPyS0+i5DDE6IMUtaqgQ4zSW1QhvA+PMZtqg7Nd4wwNE2QgehOgQHsFDHDdFQ52CHwp0N51q9fXO/eEM318qQDJPUR19XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742338234; c=relaxed/simple;
	bh=c4bsVe+5uL9D6uBKzHJO71coGq992rq3ehHjhbm4ZO4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ocIrDb8aF8ZCGdO+t/8tqiyf1+mSDx5MU5upmhZuew+EEiCDxMQFEfLsimLcdSPlWRayS6QPonFNoA6lyizCArfB09egPIwBjfrLGmAFMZoyiea9ks+FL/cPnv7MQnSUYysKjLiLqpFmNH4WOV5+QviuUyQ6G0FlGdpw8zJo3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxRsJ2Nw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601FBC4CEE9;
	Tue, 18 Mar 2025 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742338233;
	bh=c4bsVe+5uL9D6uBKzHJO71coGq992rq3ehHjhbm4ZO4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TxRsJ2Nwag6309asbOZC3fzbTIIkz6FiBRP5612KDJkVMfcmjUHRFhiHSoGe63NzB
	 QnSrAHR5WTT6/rOSny96TnP0KVrS7HKtcABULGkvLuzBdwT9uzPxJFZ1kgI3SIFY+l
	 B/pfSUjPIHl+ZKU6IdwM+Ly/o0bZoAJKtwH5l21igPdgXR2NLP1B1+G633bGdCas3a
	 +I4DYgOhHcSFrKWf7TZYKXZ39Woimk6n9VsO46V2APqdm37McEA8Mv1tM/FX5Qz90d
	 lzsquBJaVkX5O5WB/gBHf/qFK5Y4Z3imxIXMpmIJq3fIHDjm8AXkAEoIlPE1cb5nIp
	 MeB2r2YbGnUsw==
Message-ID: <ef86ccad056bc03af7f01d5696787766.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com> <20250313110359.242491-5-quic_mmanikan@quicinc.com> <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
Subject: Re: [PATCH v12 4/6] clk: qcom: Add NSS clock Controller driver for IPQ9574
From: Stephen Boyd <sboyd@kernel.org>
Cc: andersson@kernel.org, mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com, geert+renesas@glider.be, lumag@kernel.org, heiko@sntech.de, biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, nfraprado@collabora.com, elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, javier.carrasco@wolfvision.net, ebiggers@google.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_varada@quicinc.com, quic_srichara@quicinc.com
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>
Date: Tue, 18 Mar 2025 15:50:31 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Marek Beh=C3=BAn (2025-03-17 07:08:16)
> On Thu, Mar 13, 2025 at 04:33:57PM +0530, Manikanta Mylavarapu wrote:
>=20
> > +static struct clk_rcg2 nss_cc_clc_clk_src =3D {
> > +     .cmd_rcgr =3D 0x28604,
> > +     .mnd_width =3D 0,
> > +     .hid_width =3D 5,
> > +     .parent_map =3D nss_cc_parent_map_6,
> > +     .freq_tbl =3D ftbl_nss_cc_clc_clk_src,
> > +     .clkr.hw.init =3D &(const struct clk_init_data) {
> > +             .name =3D "nss_cc_clc_clk_src",
> > +             .parent_data =3D nss_cc_parent_data_6,
> > +             .num_parents =3D ARRAY_SIZE(nss_cc_parent_data_6),
> > +             .ops =3D &clk_rcg2_ops,
> > +     },
> > +};
>=20
> This structure definition gets repeated many times in this driver,
> with only slight changes. (This also happens in other qualcomm clock
> drivers.)
>=20
> Would it be possible to refactor it into a macro, to avoid the
> insane code repetition?
>=20

We have this discussion every couple years or so. The short answer is
no. The long answer is that it makes it harder to read because we don't
know what argument to the macro corresponds to the struct members.

It could probably use the CLK_HW_INIT_PARENTS_DATA macro though.

static struct clk_rcg2 nss_cc_clc_clk_src =3D {
     .cmd_rcgr =3D 0x28604,
     .mnd_width =3D 0,
     .hid_width =3D 5,
     .parent_map =3D nss_cc_parent_map_6,
     .freq_tbl =3D ftbl_nss_cc_clc_clk_src,
     .clkr.hw.init =3D CLK_HW_INIT_PARENTS_DATA("nss_cc_clc_clk_src",
                                              nss_cc_parent_data_6,
					      &clk_rcg2_ops, 0),
     },
};

but then we lose the const. Oh well.

The whole qcom clk driver probably needs an overhaul to just have
descriptors that populate a bunch of clks that are allocated at probe
time so that the memory footprint is smaller if you have multiple clk
drivers loaded and so that we can probe the driver again without
unloading the whole kernel module.

