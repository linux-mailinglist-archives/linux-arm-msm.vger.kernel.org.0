Return-Path: <linux-arm-msm+bounces-400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB737E7765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 03:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE08A1C20850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 02:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AD61365;
	Fri, 10 Nov 2023 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfOw3bKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976010F2;
	Fri, 10 Nov 2023 02:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7DC433C8;
	Fri, 10 Nov 2023 02:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699583116;
	bh=nCqJntDqtr3Op8eiSqf8/ZXz/ghvEugYu+jVdT6SWHs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qfOw3bKv/WRzdyAGiUKgvzzZJdSjugDsJE5QFa/TwCeRCK/r8X41TCZWewzxPF+dX
	 26OF5MvxycRdwK11otk17kQC4j3w0m7iMlvMXu3t9xFf2qDgsvDWN0KVMQiXpTWk3L
	 zm1XNVxu2CiGqApnMBRVeGF3FdSRaOJgkIW2MFNZdhE/QtMPDZrxx639fD/OriYTzK
	 7LbAZZvW5cPNNbqK7ArdoZ9EoDWod/766RWct9TlgQ7YPqtLhYjyMTSf+tUHqpVWVz
	 9rdm+dweWTZfVeK1oGxCfF7pf/eAKMI2InCcP5xQMpQLQMQN8MCa3K0M9Kd0i1ptJq
	 1hCi6cwJaKwLw==
Message-ID: <d1279446a7eb4109c73355a7983ba3f1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <28c8559b9eba1a2b7c3554859c095cde.sboyd@kernel.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org> <20231004012308.2305273-3-dmitry.baryshkov@linaro.org> <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org> <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org> <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com> <849046e96437d11e8fb997597b40979e.sboyd@kernel.org> <e20129cd99e0685de27d48d73cc2b045.sboyd@kernel.org> <28c8559b9eba1a2b7c3554859c095cde.sboyd@kernel.org>
Subject: Re: [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked' clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 Nov 2023 18:25:13 -0800
User-Agent: alot/0.10

Quoting Stephen Boyd (2023-11-08 20:20:50)
>=20
> Here's what's happening without any changes
>=20
>  1. mdp and rot are sourcing from disp_cc_pll0 at driver probe, disp_cc_p=
ll0 is enabled
>  2. mdp is configured to restore on XO
>  3. rot is configured to restore on XO
>  4. mdp is switched to XO on clk_enable()
>  5. mdp is switched to XO on clk_disable()
>  6. disp_cc_pll0 is left untouched
>  7. rot branch clk is disabled during late init (disp_cc_mdss_rot_clk)
>  8. rot rcg is still enabled
>  9. disp_cc_pll0 is disabled during late init
>  10. mdp is switched to XO on clk_enable()
>  11. mdp branch is stuck off
>=20
> I could see the problem happening if mdp branch and rot branch were
> swapped. When we enable/disable mdp branch it will actually
> enable/disable the rot rcg because feedback is going there. During boot
> this is fine because disp_cc_pll0 is enabled. Leaving it enabled
> throughout boot hides the problem because enabling mdp branch is
> actually enabling rot branch. Once we get to late init, we disable rot
> branch (actually mdp branch). The mdp rcg is already parked, so this
> should be OK. The problem is the mdp branch (actually rot branch) has
> been disabled, while the rot rcg is still sourcing disp_cc_pll0. We'll
> disable the pll during late init, and this will wedge the clk off. When
> we go to turn on the mdp branch (actually the rot branch) after late
> init, we'll try to turn on the branch and the rot rcg will be parented
> to the disp_cc_pll0 still (because we never moved it off).
>=20
> This patch fixes the problem for me. Obviously, things are still bad
> though because we don't report the proper parent to the framework. We
> can do that pretty easily by parking at clk registration time though and
> also by saving the config register.

Argh! I forgot to put back disabling unused clks. This patch is garbage
and doesn't actually work. I started directly writing things with devmem
and saw that the branch bits are correct. The status bit in the rcg
changes when the corresponding branch is enabled.

It seems that rot must be parked on XO, otherwise mdp branch will fail
to enable after late init. I was hoping these two clks weren't related,
but they must be related somehow. I've parked rot on XO right after
disp_cc_pll0 is disabled and that also works.

My guess is the GDSC is restoring rcg registers, and that restoring
requires the source clk to be running (maybe they hardcoded that
requirement in the hardware). In the case of rot, the source clk is
disp_cc_pll0, which is always enabled during boot. When I hack it so
that disp_cc_pll0 is disabled at the end of dispcc probe, and rot is the
only clk still sourcing from it, nothing is busted until the gdsc powers
off, saves state, and then powers on again. That's the case where I
reported the stuck clk warning happens early, before late init. Once the
gdsc powers on the second time, it must wedge the rcg hardware and
affect mdp even though mdp was parked on XO.

Fun! This must be why qcom didn't want to have dirty registers. It must
confuse the gdsc hardware and cause it to restore the clk to the parent
that isn't enabled.

BTW, I tried changing the rcg source for rot after the mdp branch is
stuck off, and the rot rcg goes from reporting root off, to reporting
root is on, which is weird. Maybe that's just showing the rot rcg is in
some sort of wedged state as well.

So long story short, I think I understand the problem now. The gdsc is
saving and restoring the register contents, and enabling the rcg clks
when it does so. If that runs into some stuck rcg problem, it will wedge
the clks in weird ways. The only safe thing to do is make sure that when
the gdsc is turned off, all the rcgs are parked on sources that are
going to be enabled when the gdsc powers on the next time. For now,
we've decided that source is XO, because it is simple. It seems like
that means we need to park all shared rcg clks at registration time.
Or we need to teach the clks about their gdsc and switch rcgs over to
the safe source when disabling the gdsc.

Parking at init is easy, we call clk_rcg2_shared_disable() from the init
routine, and that parks the clk and stashes the config register. I just
don't know if that causes some sort of problem for bootsplash logic. The
mdp clk could be running quite fast, and we'll basically force it over
to XO immediately. It may be better to teach the gdsc code to park the
rcgs when disabling the gdsc. Then we can maintain the mdp clk rate out
of boot for as long as the gdsc is enabled out of boot, and we contain
the "fix" to where the problem is, gdsc can't restore a clk sourcing
something that's off. If we did this we still need to fix the parent
mapping at clk registration, i.e. parked_cfg needs to be read from the
hardware so that get_parent works.

