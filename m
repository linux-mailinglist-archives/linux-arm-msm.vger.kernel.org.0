Return-Path: <linux-arm-msm+bounces-19436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD508BEF38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59011C21A95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 21:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361CE76EEA;
	Tue,  7 May 2024 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrv5QkKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF671B5C;
	Tue,  7 May 2024 21:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118731; cv=none; b=NintjaIYUNtPikyWY3ZjWeiItYBjAjBzefLb715EaGkkDs/b4yR7Z3jp4AMR51zi1GM/ogjxGH7ln0QX0rluSxqXPX0YiUixZl19LwnSAok8ZdTSdvRsY9pGluMkw+Vnet257bRKAglrOXxnnrhEI070gYFW5e4w85+J+FJBaTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118731; c=relaxed/simple;
	bh=DdIfWiVoX4WJikGmrYhiK9jfHI2XGJOD/rjGsuFWyHk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=YfjB63MEedUVkYBEltsIQpV0FWVaw0E97LYjX8fJlYpm99f+U5MGwSDeyqN0VRAdFNSH+FQvQPiuG9Vn6hxvs1l3Ccyk/clqVdpgvzu56bqGQGkRaQgc5U7Jc1ZD8JmRsvBIZUWmt5vsVZ4GSwkuRPtRcRfLm4ETwNirZjoN3i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrv5QkKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67580C2BBFC;
	Tue,  7 May 2024 21:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715118729;
	bh=DdIfWiVoX4WJikGmrYhiK9jfHI2XGJOD/rjGsuFWyHk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lrv5QkKWbIh/dkdhC2UOxgdtXuRWXRpQUShbolM8ov4AmoYK7wSPa36uaNkS2SWSk
	 mdVvLcBd7yoB8G6G7e6Fk4Yg4frrla2Ygye0JB+AauUqwpNhC0shgwuU6/Quewvxl7
	 lzf729tCzGjQdUJkLDTIsRxT6GsrVdmZajMpSVzuJuletv+q/QiteKKDoDvVYHmgez
	 mwlTZkIzjaZOEIr9+3+u1eTuCdP4BSBdux3L1YQoMp1KU/3t2wlMzX+oplUzUew6bz
	 Xf+1VezXbMcoYlp8NIqspXHWSLu/oj5hNWaoZpaN6mUtliKLOrqrQjkj0AGava7TFr
	 pXb5JrG/9I2fA==
Message-ID: <9440dd954294db7c02a11a1807d75ad9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aeaa72f6-b227-4b54-9836-0b8f4dba6ffb@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org> <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org> <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org> <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org> <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org> <7baef7a173dc4d1ecf8b0dafde565b1a.sboyd@kernel.org> <aeaa72f6-b227-4b54-9836-0b8f4dba6ffb@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on gcc_sdcc2_apps_clk_src
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Date: Tue, 07 May 2024 14:52:07 -0700
User-Agent: alot/0.10

Quoting Konrad Dybcio (2024-05-07 14:17:01)
>=20
>=20
> On 5/7/24 22:28, Stephen Boyd wrote:
> >>
> >=20
> > Can you share your patch that prints the message? What bit are you
> > checking in the hardware to determine if the RCG is enabled? Do you also
> > print the enable count in software?
>=20
> I already reset-ed the tree state, but I added something like
>=20
> if (rcg->cmd_rcgr =3D=3D the one in the declaration)
>         pr_err("gcc_sdcc2_apps_clk_src is %s\n", clk_is_enabled(hw) ? "EN=
ABLED" : "DISABLED");
>=20
> to drivers/clk/qcom/clk-rcg2.c : __clk_rcg2_set_rate()
>=20
>=20

Ok. You're reading the software state because there isn't an is_enabled
clk_op for RCGs. Can you also read the CMD register (0x0 offset from
base) and check for CMD_ROOT_EN (bit 1) being set? That's what I mean
when I'm talking about the RCG being enabled in hardware. Similarly,
read CMD_ROOT_OFF (bit 31) to see if some child branch of the RCG is
enabled at this time.

