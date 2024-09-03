Return-Path: <linux-arm-msm+bounces-30547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F6396A7DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 21:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 649661C24529
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 19:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625731DC743;
	Tue,  3 Sep 2024 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nICfBoUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311A61DC73C;
	Tue,  3 Sep 2024 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725393311; cv=none; b=D80gaufIlK5MFvZtiCroi2koaherJMqNC9BtJch8ZYy2kV11lfqfbn4gsBvaOdl5goYBXTG9u6Aq5xTx3EWSL0os1ewdGJelfqzhsvpywKql7wR77esCy85MFj4y38cLyegJJFxsj2+yGXPM3Nuo33J2uXMvsH2BWv9rvd58uz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725393311; c=relaxed/simple;
	bh=LmjZ5WVu9+gaNJJ9kk1RITONyd5+Jfpn3l706IYYomc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=su0xs0XhrIi55Vk6YqUq2uMcFHgpv1PnKqV1dhu9iEyw0wT3J6tBP70yg6LBGOBPRmu2C2feKScrjpcjawCdc99iPZa8PdfkEqtQDTcqBArL1oKFKbqySl3SF2wF6ARTAJkp9CzDLe8XdxBeklvvXRT0uZF3T8WHZmLjrvcBxx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nICfBoUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8D2C4CEC4;
	Tue,  3 Sep 2024 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725393309;
	bh=LmjZ5WVu9+gaNJJ9kk1RITONyd5+Jfpn3l706IYYomc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nICfBoUwhj1gTPS0bR4mOpR/rlmg7s+sLyJiKGgQlLYWy+KFvby5uRK+QFuzYZiZz
	 W9Oqu8142ENn3iQjdLH/atJzAcEvSOHfmZpYcB1xurir0inDOleoTzdeW/H1oA0jTe
	 gvxjZ9tYljgvFKic+1lzTWbieBS8pjhz2+WNGqvToTEjKVG6sMkn35McbE7K/T9796
	 vKd+Hr77VF2baztVvEWa8HP61MUnXVTdN1t99Qd+18FbSq1HgeNQ9lT4tuLBiJn9Qy
	 Tke+a62gVkHqLHRFZTJQI13JR7YSSTmwcTx4mr1q6skYxwlYfs+RmPVL43/SFlAMdb
	 JG+65j0geFPwg==
Message-ID: <8a02734c7b64efa186e97a54eb34c632.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZtVmKWTBtJiA53U0@hovoldconsulting.com>
References: <20240828171722.1251587-1-swboyd@chromium.org> <20240828171722.1251587-2-swboyd@chromium.org> <c1e35d3d-fa00-4453-aaa3-9f23a07acb4f@linaro.org> <CAE-0n51Ag1wpj0uUPVtMvgZJE2FF_FZkw+j=bRiAq3vYk=Y_Fw@mail.gmail.com> <CAE-0n53rNuyXcVcqTBSgbNzuJzCBkaHE21dPNkMTrs=BCTkmPg@mail.gmail.com> <ZtVmKWTBtJiA53U0@hovoldconsulting.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks at init
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, patches@lists.linux.dev, linux-clk@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, Taniya Das <quic_tdas@quicinc.com>
To: Johan Hovold <johan@kernel.org>
Date: Tue, 03 Sep 2024 12:55:07 -0700
User-Agent: alot/0.10

Quoting Johan Hovold (2024-09-02 00:15:53)
> On Fri, Aug 30, 2024 at 03:29:22PM -0700, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2024-08-29 09:34:05)
>=20
> > > It sounds like it's better to make the default always park at
> > > registration time and special case the one or two places where that
> > > isn't possible, i.e. USB because it has special rate requirements. So=
 I
> > > should just go back to v1 then and pile on the QUP patches.
> >=20
> > I've done this now and I'll push out clk-fixes with the QUP patches.
>=20
> I assumed you'd fix up all the other SoCs affected by this, but I only
> saw fixes for sm8550, sm8650 and x1e80100 in your fixes branch.
>=20
> Just sent a corresponding fix for sc8280xp, which I've confirmed also
> needs this for QUP:

Thanks!

>=20
>         https://lore.kernel.org/lkml/20240902070830.8535-1-johan+linaro@k=
ernel.org/
>=20
> But what about the sm8550 USB issue? Don't the other platforms also need
> a corresponding fix (e.g. for when booting from USB)?

I don't know. Are you seeing USB host issues on other platforms with
shared RCG clk_ops for the USB clk? It looks inconsistent that sometimes
there's a USB GDSC but the shared clk ops aren't used. If nothing is
broken then let's work on the proper fix, which is parking RCGs when the
GDSC is turned off so that turning on the GDSC always works. If USB is
broken for you then send another patch.

