Return-Path: <linux-arm-msm+bounces-25522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264D92AA9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0239E1F2312D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5CD38FA5;
	Mon,  8 Jul 2024 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiKpcWLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBFDA29;
	Mon,  8 Jul 2024 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470751; cv=none; b=nudisVaMVsLN+9uAUdha6Ge7KhyPttTth0wInXxa2Ep54m78IeHK+7w7OR+pQyWIH4O6BUmL+KEc+GmVdRrrmTv3VAkQmK6N1bZSi51CXgL96skhwZElXemYBbj6zQGnAFvuCeicMletC2vLJhb5ywwuFG09elSXu0Kl7Es5YIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470751; c=relaxed/simple;
	bh=o6bbEfjjZfn+HQSX2vDZxVVpP++ERSsjFMMXPHwb5bA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mfmUtGi60u9JKfGjPfxwHRPonTSjvZh9c9QbZV3+mecy9QmS1uDGM4viJwOmGFv4Fick9onqhm2wuag2+wXwVwvRAUfBzrN7KOob34POmomD4BlFsGQ9mjn+q92k+ozlRgmU53eAuosXIbexJzgzAoTflJayESxP1GBDt8fFPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiKpcWLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D495C116B1;
	Mon,  8 Jul 2024 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470751;
	bh=o6bbEfjjZfn+HQSX2vDZxVVpP++ERSsjFMMXPHwb5bA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eiKpcWLCEfGFJ6LRC5eoBLHbP2zqqmeWz/IfTsZtRAMLM2qvMWY2lP2qMIRQka5gC
	 wb3X2QF8fbnKauRurzMotlMOvU74hVGOb28RtDkzvio/Xjz959K3WacjHjy9WNBMFe
	 /GMMyGGc3Ao9qfkH8g55dJfIG1ePkUO10nT21Q8MBSK3wN3WOnKXra29Fx0u0w4nYZ
	 0XP8sO4ZVMXxxys0EBbaxcmDaOl2BXwpYCvicLL6VLaWf1jQFks0w3TfsZzfkWbnWO
	 xcDfTJoWjwPeMuNKoO59ITQzh78qOjnrD+nar/ffgySAfX3mqtCEHR2oRRcjjRi/34
	 EsrHnePZm6fRA==
Message-ID: <b0c2d9ac495de65039fdaa8494b7d0f5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com> <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
Subject: Re: [PATCH 10/10] clk: xilinx: Constify struct regmap_config
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>
Date: Mon, 08 Jul 2024 13:32:29 -0700
User-Agent: alot/0.10

Quoting Javier Carrasco (2024-07-03 02:50:23)
> `vcu_settings_regmap_config` is not modified and can be declared as
> const to move its data to a read-only section.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next

