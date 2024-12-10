Return-Path: <linux-arm-msm+bounces-41309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89A9EB175
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C2916B44E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601341A9B5A;
	Tue, 10 Dec 2024 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hViTFkPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48D1A9B4D;
	Tue, 10 Dec 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733835626; cv=none; b=VAOvY53hNJ5v2S2TZ7WosidN64GFzHxb9FEEMCD19uMvUdS3rxmH/qwW5znAETOuyxG+hk1praGlt6pMEGvymmcJF4bRoytYVzoG4QANhAk0kofM9oFMvqgiRuD+XzyoLvMv8WT1AjITCiDAMFo05uKH5i83iJ9cThHby54SdmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733835626; c=relaxed/simple;
	bh=nGTGbI8r40tu1LbIcEhtAsSOvoz3yt/JHqc54n6tD5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QwJn0O8FpDULY2FLjJf7Wmy7MrQ+IP8fpQwd1YDnTVfASajJnPB2E9pCclCv3kGSPrl1eI6BbHZ8AAT0hiNtneEoO5ZbrPzh0d/jsoCVE0mh1URJk1EuDBlcQQdRlTlX1f87NwB6wSkbDo1lg0gKHhOIdd9OrXBZDrH2wgFzfLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hViTFkPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D8EC4CEE2;
	Tue, 10 Dec 2024 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835625;
	bh=nGTGbI8r40tu1LbIcEhtAsSOvoz3yt/JHqc54n6tD5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hViTFkPHQUG0UctQM6W50D1TlNzHLXxUkKEKD8LmKibBWzUJhcMWkv8SvilHywTaU
	 Ikj5sHj/SV4L7ZhSS+QxY6ep6sGgkHb6sKA+6CYu3iIZWiL+56Fwt7+M8MvXXOIlfz
	 F3WeK35bnKqUsu5f2PXGzuiV2vu5sfV7GVLUBtwf86iVu/BGy9iddErtn5bIn/GDUv
	 ffN+lt1tS+nINE8fNho7EsAlZS7pyse1Hie6xODfzMi1jpy1nOiYklOwEZ0rL2+Wqz
	 Dkscjt9hOgtqTU8DZAZCeGU7x7iHT1MuVF+qWwXvdtG0k+gpHacPs233w3yAA7sWaT
	 Ej1IQpHc8tBvw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>
In-Reply-To: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of
 DAIs
Message-Id: <173383562301.33694.14621815920567072005.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 05 Dec 2024 09:40:20 +0100, Krzysztof Kozlowski wrote:
> Number of DAIs in the codec is not really a binding, because it could
> grow, e.g. when we implement missing features.  Add the define to the
> driver, which will replace the one in the binding header.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
      commit: 76c29db042e4f0fdea75c76cd4ad5f36080cd1c9
[2/2] ASoC: codecs: wcd9335: Drop number of DAIs from the header
      (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


