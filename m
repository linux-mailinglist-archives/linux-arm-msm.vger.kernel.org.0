Return-Path: <linux-arm-msm+bounces-25886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0392D97B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 21:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 030BF282623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301808289E;
	Wed, 10 Jul 2024 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRrlAxsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE315E88;
	Wed, 10 Jul 2024 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720640869; cv=none; b=NnO1qjA9q7VNzQtp0ZXXPKYmrtHx+hf+iMa4mtAWXhEabZoV6cbNI8FRSh3Hpbun40YMKe8k4AlXxErbLTR7Laq+1IJ79AvMaAH9QfvzfioQRwP+KZ5EyQr02h09uyH/oe6MzkImBc8+5iMBsHSFeP/Ji3bBQ6a+oI66w2j55KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720640869; c=relaxed/simple;
	bh=UuJMlch6WraU5bI9HL7iYn7FKqFuRq32/WSvkM0/YRU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=KaWy+mmS4P5CxXmAdBfiYCGroOfwi0m5HBVDGJ+WgNUT6IAOcYrrggUIQlRPgb3r/mUi4pPwmQoMWYFtgqfalNGt7LHGIkKV008r+KQBtOO3fBy0j12XBXt8hAD9cT5YZAIcLmdheb9v94/KHr3RKLRm5iwAxz1/q2varlVAGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRrlAxsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F70EC32781;
	Wed, 10 Jul 2024 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720640868;
	bh=UuJMlch6WraU5bI9HL7iYn7FKqFuRq32/WSvkM0/YRU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kRrlAxsg/ofRQNnJkliK4cbH50GLBLqqkzChA0cmrQglOc2GBRPVh9DhWtAbiFIjR
	 svKrNUmyoVeyuHeOxl2FvxVMkGfkojVL5El+Kj3HCaELlZZxCBvrUApB++1iA9sagy
	 SdqVbDTvCXM7bRb58V4IikN0rGjVZnP70IvFOiKQVOSBwCcORWU94A/mEdxyOiGPYn
	 3EQZx7DrCTp/MrWn7fx2V7qTqOKU4VNkbxyNXvcoFmH0lVAq9z7fmm2aYYPCFZXPPw
	 TXWONDFVZwpkeU0y7l0Lz7TMFtDbu/fvjnDaJ8xDIBHCWzXUndFqnNykZNlTf4crAN
	 flcWmNkmoDNHA==
Message-ID: <cc91609f78905a8c5d5bf28590a1a23b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com> <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>
Date: Wed, 10 Jul 2024 12:47:46 -0700
User-Agent: alot/0.10

Quoting Javier Carrasco (2024-07-03 02:50:22)
> `sun8i_r40_ccu_regmap_config` is not modified and can be declared as
> const to move its data to a read-only section.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next

