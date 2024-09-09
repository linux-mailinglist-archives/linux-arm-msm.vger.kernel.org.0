Return-Path: <linux-arm-msm+bounces-31376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F2972438
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 23:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1BA1F245BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 21:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EA318B487;
	Mon,  9 Sep 2024 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEdBBfYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA918B477;
	Mon,  9 Sep 2024 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725916090; cv=none; b=sBwgquzeppJuFgMZmjeSf3c6P1GTt8ETxd7KTdbTnvbuKNd8oG7aUrUrBMTgPoE/Cr7W/9olxI1HuMF9yE7Z405F9yQxsM42+yqOiIC4flCFfuhWIgk1ZDWfhp+gxCIRPORU1ltv5rYtcWhsjx4KagEseiXTPEFpFPew0lfDitY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725916090; c=relaxed/simple;
	bh=K0d0Cmm9uco8lIyrpR3SYsnrfPevZWfuyYlDY8b4emo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Tyq4wXMOyQCtIpw1F22jcQNzwh0PU1ASkCTvV4pbRKx8JMp89hHenlCzGC4sk9kOzoonf7IrCIC9kbRqaX3GnPeqNk5n3xlEYVoSbszjlgNriaiDo5sO+vHHzv/rS5ITrvbwG+5vleSeENKBfgYVPf2y6wOkE0ABTNrrH9Yl54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEdBBfYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C8EC4CEC5;
	Mon,  9 Sep 2024 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725916090;
	bh=K0d0Cmm9uco8lIyrpR3SYsnrfPevZWfuyYlDY8b4emo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qEdBBfYuj3iTfoZclaVlSuWmoNniufcLshNhA/2E26qqhpEG5PgIi/RGPKdV+tnm8
	 W5N1xe/SaHXvXTZdy9gQtmWf7hWCzKsakUk8xwmpvjwl3efjLlipHkg6HWbT5bDCG/
	 z9aCF3nUmiPuRMymU+4uO7QTQLt1+gUsQOI+iCZDW9VwSrSzUXuKMhOc+sO+qGqop4
	 yjUlRxcKYkV1RalEI8cNo55+jtKHCqPNjRoOSKTSnpFSoeoQxHprmjm5VGyLA7iCI9
	 yp3GTceK7ibnrNhInzazL3O44RzvKIhFmSZ5IN0pKEerP8ug8I8KU6gGFGbGqPf/Ms
	 aNqESTJfuMjbg==
Message-ID: <1abfacdc460a01b550e888ce593a06d2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9914729c-8e69-4ad5-a530-161f5430b71d@nvidia.com>
References: <20240906113905.641336-1-quic_skakitap@quicinc.com> <fdeadc0c-7f8d-4547-8703-c402bf06e495@nvidia.com> <9914729c-8e69-4ad5-a530-161f5430b71d@nvidia.com>
Subject: Re: [PATCH V3] clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Dan Carpenter <dan.carpenter@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, kernel test robot <lkp@intel.com>, linux-tegra@vger.kernel.org <linux-tegra@vger.kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Mon, 09 Sep 2024 14:08:07 -0700
User-Agent: alot/0.10

Quoting Jon Hunter (2024-09-09 03:57:09)
>=20
> On 06/09/2024 15:14, Jon Hunter wrote:
> >=20
> > On 06/09/2024 12:39, Satya Priya Kakitapalli wrote:
> >> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> >> operator to fix below build error and smatch warning.
> >>
> >> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
> >> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivm=
od'
> >>
> >> smatch warnings:
> >> drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn:=20
> >> replace
> >> divide condition '(remainder * 2) / prate' with '(remainder * 2) >=3D =

> >> prate'
> >>
> >> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for=20
> >> Zonda PLL")
> >> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> >> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> >> ---
> >> =C2=A0 drivers/clk/qcom/clk-alpha-pll.c | 4 +---
> >> =C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/clk-alpha-pll.c=20
> >> b/drivers/clk/qcom/clk-alpha-pll.c
> >> index 019713c38f25..f9105443d7db 100644
> >> --- a/drivers/clk/qcom/clk-alpha-pll.c
> >> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> >> @@ -2176,10 +2176,8 @@ static void zonda_pll_adjust_l_val(unsigned=20
> >> long rate, unsigned long prate, u32
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 quotient =3D rate;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remainder =3D do_div(quotient, prate);
> >> -=C2=A0=C2=A0=C2=A0 *l =3D quotient;
> >> -=C2=A0=C2=A0=C2=A0 if ((remainder * 2) / prate)
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *l =3D *l + 1;
> >> +=C2=A0=C2=A0=C2=A0 *l =3D rate + (u32)(remainder * 2 >=3D prate);
> >> =C2=A0 }
> >> =C2=A0 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned l=
ong=20
> >> rate,
> >=20
> >=20
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
>=20
>=20
> Looks like this has now landed in the mainline. Can we see if we can get =

> this into v6.11?
>=20
=20
Applied to clk-fixes. Was it too hard to keep the if statement and just
change to a comparison?

	if (remainder * 2 >=3D prate)
		*l =3D *l + 1;

