Return-Path: <linux-arm-msm+bounces-34826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 061D79A30B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43F31F2378D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44131D7986;
	Thu, 17 Oct 2024 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVC0WbI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A069B18784A;
	Thu, 17 Oct 2024 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729204095; cv=none; b=LEAb0M7FepQrTgdq7wD/Y7cgeujHheIWXBkdyD+D7nwhigDEXmb0HPcbVYu99ib9oSWOs50mh/SEb0HOakgkrnPxR6+El42HbjaEwZNH9K+4RNbDbWDaF+yN0ti3Uolg+kKZ/vw7Qppk4699tLwcfxTb0p94ZWOYf63AoDu/SDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729204095; c=relaxed/simple;
	bh=oEa+a9DDwsqUSkAhW5o61k5zSyPggFEVhYjGAjjoDko=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=c+W3TrQz4SyWVThoTcg2ffrzn7YXcCzg2LwTaECn7I4lrpzHrpikHDC8lgxnCOqBB/xO1cjWNjdIVgWlj/GPM+TLsCjN4F+4xhbQ7lxugHFJDPf3UxU9IpMcC2S7ci9ofj9aP83XbdgFaS/cY7OVaANi0pgM+FuBmf6NHfXaPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVC0WbI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B5DC4CEC3;
	Thu, 17 Oct 2024 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729204095;
	bh=oEa+a9DDwsqUSkAhW5o61k5zSyPggFEVhYjGAjjoDko=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bVC0WbI4sygWAtxZzEqtNpY3iR0eQWot3pxzqfrl4qb53j7EjHw0kRdas4Ltnh1gU
	 H6GOYjXOwJ4ZsxV4aOVKAVu93b0TgN7eFpB+vJb94bOe1Frw22/IlnbBUV0RWLbCZ3
	 B+IvpZ+xQi7bxNNpXwteKViO0qN5K6Il4WeP0Nuz9KBsIKViIf1UklfcNMB0wbtrwh
	 KS301ckdg2T5Oje4v3NQvXb4Q3ZC4UMEPsRrF4mT9KZkUYimEbSJz6/TwEQguLWz3Q
	 KeI/+o+TGrnXHRq41Gg2x/IQgY3H5gIb+GzqqlANvgrVf+a3E2Bl0WvYm0DGpuBDzH
	 jcCNUn2TKJpCA==
Message-ID: <5904599efffa7ce747772c0dcc1c897b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <we4stuv7td5jmvicsvsjowqg76merg5lmlgqj6dvqvqecsw7xk@bfz2kdjnt6kb>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org> <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org> <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org> <we4stuv7td5jmvicsvsjowqg76merg5lmlgqj6dvqvqecsw7xk@bfz2kdjnt6kb>
Subject: Re: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch ops
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kalpak Kawadkar <quic_kkawadka@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 15:28:13 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-10-17 15:00:03)
> On Thu, Oct 17, 2024 at 11:10:20AM -0700, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2024-10-17 09:56:57)
> > > From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > >=20
> > > Add support for SREG branch ops. This is for the clocks which require
> >=20
> > What is SREG? Can you spell it out?
>=20
> Unfortunately, no idea. This is the only register name I know.
>=20

Can someone inside qcom tell us?

>=20
> >=20
> > >         u8      halt_check;
> >=20
> > Instead of adding these new members can you wrap the struct in another
> > struct? There are usually a lot of branches in the system and this
> > bloats those structures when the members are never used.
> >=20
> >       struct clk_sreg_branch {
> >               u32 sreg_enable_reg;
> >               u32 sreg_core_ack_bit;
> >               u32 sreg_periph_ack_bit;
> >               struct clk_branch branch;
> >       };
> >=20
> > But I'm not even sure that is needed vs. just putting a clk_regmap
> > inside because the clk_ops don't seem to use any of these other members?
>=20
> Yes, nice idea. Is it ok to keep the _branch suffix or we'd better
> rename it dropping the _branch (and move to another source file while we
> are at it)?
>=20

I don't really care. Inside qcom they called things branches in the
hardware and that name was carried into the code. If sreg is a branch
then that would make sense. From the 'core_ack' and 'periph_ack' it
actually looks like some sort of power switch masquerading as a clk.

