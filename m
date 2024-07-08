Return-Path: <linux-arm-msm+bounces-25523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F165192AAA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0851F2323F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A035D3BB50;
	Mon,  8 Jul 2024 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMQaNt/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F82E64A;
	Mon,  8 Jul 2024 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470774; cv=none; b=lJCqXwEQicb4Y7wgG7GcscXHz/q04CnfU+qPERWK8N3yf8875H4eTr7SLUrKD6MFYfPbASR5pNLjO8vDiehTeZi5iKcO0EhGliajztJhTp1ME+DWPuhG49xN5DU9H6N/dzb+rCoqOng1B8G0KqChli1iLMfFEuc7MpMI5iluAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470774; c=relaxed/simple;
	bh=6+dCUea6mQ/szR3n13tThGhbyNduM++Q1F0ysCdACjk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=hkGdJn8xyeh645EkrdXP1KYNsah9NwbJR76p9kQ4jK6UYRTXLECAsEOHYAlNE6YocX6GymUYQdpKGJS/KQk3ZYDzJrQ2+qwVdhP/rWahUu+6ETUV0JCe4F+5dsrvcZPlwQj6ABR0sU9bLolSZ8kxXwz3UBpe103DA3sxz+gPOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMQaNt/b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CCFC116B1;
	Mon,  8 Jul 2024 20:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470774;
	bh=6+dCUea6mQ/szR3n13tThGhbyNduM++Q1F0ysCdACjk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DMQaNt/b3lm6XqOqOzFvmzXMi0QE2NMzNX74unf5v1Rwzkz+wNGdz9rO5KlivDtBM
	 aS0YDhlNI1NvK1muhfK5+9K1XAEsmc3CdiBexhynOTBzDslmu/2Hd2rCZClB6QCF6u
	 9nLGL131B1HLm7j6ie1OQC0OBqE+3qgytUZw//D71Cd1nQvRf1cGbF4QYb+MYwJfuB
	 Q9YEBuB40Pe9RHIrq32eyvSIy6m0xp03KBVOLwfTCh8NtKwks5aT1LKWzClEQ0f3SO
	 H6wPSAqo9SRHpHNDcNMr7vFkvMFZZ6iYvGkVR4afcJAfVusTAnRl6iewO2w0OBVBL1
	 0QZDGvm7Ru/aw==
Message-ID: <ee7380278b81195fbaac652c99c29936.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com> <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
Subject: Re: [PATCH 07/10] clk: lpc32xx: Constify struct regmap_config
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>
Date: Mon, 08 Jul 2024 13:32:51 -0700
User-Agent: alot/0.10

Quoting Javier Carrasco (2024-07-03 02:50:20)
> `lpc32xx_scb_regmap_config` is not modified and can be declared as const
> to move its data to a read-only section.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next

