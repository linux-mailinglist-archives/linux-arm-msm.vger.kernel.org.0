Return-Path: <linux-arm-msm+bounces-29810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC4962E3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 638451F25340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5661A4F2E;
	Wed, 28 Aug 2024 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="th8tRM3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F21A38E0;
	Wed, 28 Aug 2024 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724865209; cv=none; b=cFPHdHHruIF7jcYZz+tMYGJsLn8rKkaV2CyUNccAL9S72ud0S2Fyw3XvSD9IXSPhJCU60KG9atKEUAaBKb80uiYifJhXu98aEJJH3BSrTSghaSlnuZzEERAj00Va7NVxTPt3XoGrwI28noOKRDn16/811r5cLWWRPmTSr/Lsezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724865209; c=relaxed/simple;
	bh=cLO+Sn+ew3Mk96LWi6N6wDzzrKYqbu5dGoNPnfslJ50=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=D+jjnZ5S08p7Y7GGb76HHiuJDEKRxt9D7rFjQrE6UHmXVnK8NQQRVjVxXX3DjpZWZFRm2LTWHCeHn9w/V1DuBMMSGgdPmW47zrQymqyXUMmn9mAD+WGYs9gGAnFobgu1GEii/TDsfOaXhal6quQZmMehHuMW26KduwOwmpI+xIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=th8tRM3N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF775C4CEC0;
	Wed, 28 Aug 2024 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724865208;
	bh=cLO+Sn+ew3Mk96LWi6N6wDzzrKYqbu5dGoNPnfslJ50=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=th8tRM3NaCMksmgNuo0XVN+xB6BQqIURW5Bn7TJ3SzjXC1QMGKp6/RhHAeyYjJkiM
	 q/BuOIFhseImol5tvd/JvfascR0cxAHkpMRt9IhNvDuzkbZvsjyfg57sgUZBj7rYZ3
	 Ta0/peNPviP6HzMDs9LmQCDlGnQucGcYRTYyusXr+VEIycMmtTMOJgGH0Yeg9A5h2F
	 bEBoXZ/gFGuYcaQFgslfWxFPzKjQVD4MdxWXU6uXUzSwbia+sSDjXjChcJ6AXWetV3
	 MfZbVgV8m3yEGA1koxoK+6j2FrZWxyA+K/Ed/0dVboLkibhxRJzqb4U33D34WL7ZuZ
	 eglehfEBdBw5Q==
Message-ID: <00adff607d757702fa673942ed60c354.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1684855f-5901-459a-beb7-2569003b30ac@linaro.org>
References: <20240827231237.1014813-1-swboyd@chromium.org> <20240827231237.1014813-3-swboyd@chromium.org> <1684855f-5901-459a-beb7-2569003b30ac@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sm8550: Don't use shared clk_ops for QUPs
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, patches@lists.linux.dev, linux-clk@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <swboyd@chromium.org>
Date: Wed, 28 Aug 2024 10:13:26 -0700
User-Agent: alot/0.10

Quoting Neil Armstrong (2024-08-28 05:22:37)
> On 28/08/2024 01:12, Stephen Boyd wrote:
> > diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm855=
0.c
> > index 7944ddb4b47d..0244a05866b8 100644
> > --- a/drivers/clk/qcom/gcc-sm8550.c
> > +++ b/drivers/clk/qcom/gcc-sm8550.c
> > @@ -992,7 +992,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s7_clk_=
src_init =3D {
> >       .parent_data =3D gcc_parent_data_0,
> >       .num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> >       .flags =3D CLK_SET_RATE_PARENT,
> > -     .ops =3D &clk_rcg2_shared_ops,
> > +     .ops =3D &clk_rcg2_ops,
> >   };
> >  =20
> >   static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src =3D {
>=20
> I think you missed gcc_qupv3_wrap2_s7_clk_src

Nope. The diff header shows it is in gcc_qupv3_wrap2_s7_clk_src_init
which is assigned to the gcc_qupv3_wrap2_s7_clk_src clk's hw.init
pointer.

	.clkr.hw.init =3D &gcc_qupv3_wrap2_s7_clk_src_init,

