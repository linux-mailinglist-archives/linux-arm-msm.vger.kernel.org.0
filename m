Return-Path: <linux-arm-msm+bounces-19556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 523768C090E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 03:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C50F0B20B65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 01:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DA213BC3F;
	Thu,  9 May 2024 01:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVuvsQFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A60F2BB12;
	Thu,  9 May 2024 01:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217989; cv=none; b=dqmLTUeO78NKcOqdkDUdOSO7IksIgpQYdhtDkl2kaL2ZUK9WEA8ZvS22zE8R4Xpy1DYF9u+deAHUHUH0EvF5UsSlkIyCJPriBOO4hA2XqvNMTrtC+VJRajt02VhOmCvUr3r9rcBdYwdpkhf8Cew5naazid11dVEfwR36FxTYPvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217989; c=relaxed/simple;
	bh=F178WmldtkIwVeYOQABqKHM4vPoy8AbnJu1sSpFXEQc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mU8NO3qWZepcD5NKm/x46tUIowbp4OTvEaN5/9qnMyp+R60F6IBpgqEk+gz6u+y+c99vEfdtKGW02jaGrbyAlD4RuquHD6QNfjirqaIvRoOBtozvrkC3eg187R99VsR2dWl6XBFtE2Ut87zQf68GNuLj7STHrOs1Vl3w/T+cgM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVuvsQFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78BBC113CC;
	Thu,  9 May 2024 01:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715217988;
	bh=F178WmldtkIwVeYOQABqKHM4vPoy8AbnJu1sSpFXEQc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dVuvsQFzCWdYoGOjin+3SauwzQJ2vJPMNetl3PSmvR+m4mNfqJQnjZbeJ+G/xwHvU
	 OwZC9IQssxXjtIscDtJZ/HQuBQ0Acd4/o6AzXcgc2kWbIuWkNo2LTLXb7u/2/YFgl8
	 WEENxMFfmm1f40JUKDnaAIKbIeyolEBxDnNN7hMRges1kIpFUiUt1B5TjpUaR61DFN
	 QKHdqSt2URADBw0aVLN/bCLs7jl1aIpHSD2wOFqamkmjx7zUukUHu0/KRiObhZnNmT
	 yKERafsQvMFS5pdn9YS+qUXRFy1k7WnadpVs1RRZXnJ70HyN0YPIQgeLLlpTbyc5IW
	 P9Et6dbwynvWA==
Message-ID: <4b24ab67d437b13ab27106e08aad68bf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240508023648.207465-1-andersson@kernel.org>
References: <20240508023648.207465-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gabor Juhos <j4g8y7@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Christian Marangi <ansuelsmth@gmail.com>, Luca Weiss <luca@z3ntu.xyz>, Nathan Chancellor <nathan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski <krzk@kernel.org>, Marc Gonzalez <mgonzalez@freebox.fr>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 08 May 2024 18:26:26 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-05-07 19:36:48)
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.10
>=20
> for you to fetch changes up to 3c5b3e17b8fd1f1add5a9477306c355fab126977:
>=20
>   clk: qcom: clk-alpha-pll: fix rate setting for Stromer PLLs (2024-05-07=
 21:10:18 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

