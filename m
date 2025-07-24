Return-Path: <linux-arm-msm+bounces-66626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1202B1132B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 23:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8D24E0E2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 21:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01A822B8C5;
	Thu, 24 Jul 2025 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoAd06lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C141F0E29;
	Thu, 24 Jul 2025 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753392763; cv=none; b=AaKKbVQHs7d9dX9mQ653T6J8Vs38ED6KQdZyFqqSNBMAWoKoGxo4/8Q+gCzFykvmVvbUbgEQgMVwfY3PlDDvPXavmMWlJmdPCOtHx2xcdt6593SvnGMaZVqnQYfPrZd/yRH9WoxSByGHTQndvyNXq+M5+gH2KJzotZpmzGef+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753392763; c=relaxed/simple;
	bh=IAOBmpOtdxPPvzIH6qwDi7+1fhSxZmdUYE8fD3ANbBY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TmA8voSsuKLPwX8D6HgYD4m22cZF2ExU2hidALnvdEYQRkXlHkDTVqEuSN32AyFzNCzDVgqudajeKdUYM/T3ZHaoqtsNB8vCL5mD8s+bli0JseIIIYInw8Fn7c1ElJ4sFR1+M0B6egih/XjC0x0JMraKh/3s3Ydq4Xr3Gg4wTRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoAd06lj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084B7C4CEED;
	Thu, 24 Jul 2025 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753392762;
	bh=IAOBmpOtdxPPvzIH6qwDi7+1fhSxZmdUYE8fD3ANbBY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XoAd06lj/eeWJ5GgSpM3NPc4Gg5SL9Ui2VIAcWKfe0A5rQYrPaLmc/w3iBbtgJhG8
	 PiYAsjXvUM6mBRCPoQ87yptu0fhZI8AIdC8cU9cTAXsyVKWO61xmJFDZhBc5bClgnq
	 VMAFx4NsXVc5UtG34o2+VqZYmdBB73mMOeD+o16ECbBSrS6+eTJJsigpzQAZ+XNOE/
	 Y6rgXQqyOBpuZkHU/tgfRLaFwCuIyGw3NPHIensUHPMKdtZOnTCBB4wHaTwkGfy7Cl
	 +z4F8N6h+9twETCo5BHwYlBYcIUV8lU6Gu9WV5aucfP6ThpWcxq5b7o+01LB98dw7a
	 sfyhTzvr6MgBg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com> <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
Subject: Re: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Samuel Holland <samuel@sholland.org>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 24 Jul 2025 14:32:41 -0700
Message-ID: <175339276117.3513.1051998064079293542@lazor>
User-Agent: alot/0.11

Quoting Brian Masney (2025-07-03 16:22:25)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

