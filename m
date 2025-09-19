Return-Path: <linux-arm-msm+bounces-74215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901BB8A1DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624191C25626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217512FC03B;
	Fri, 19 Sep 2025 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgmm1bZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3D1C862E;
	Fri, 19 Sep 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293866; cv=none; b=tdLPgZPlsRgli+BJEqQ/Fh8IKUNtfoPrDH4JSPIH5mAR8DfR9mjMBT9jKhwQ47v5EQKH6VNu2PmJ3PLtYjZ12BqCiJI6lovfeaECfAf+bqMwGKbCIVma7LmIPx0TOSCibjtfnyxeQ+BmKcAeotl0WoaeowotLPTJoh9rdJUlONs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293866; c=relaxed/simple;
	bh=PS8ubXu5Kppe4atQoWr6Kmj6Ede0rdtmbXeTw2ERbq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gc9qr1zQDCHOsGX9KsZTydRXoodfk0SpcXQ9AJUM5JmNZqzTjWkuPG/3XQea1peRuvYoO0yELtN/6xwDsM28V4w1vtsqTHB8Pa0H2Kank86SD1avxYakGWvUSrfvQjNyehTsGi2f/i2Pa0Hw92J1VKHVJ4xNmUQgUjl7n+c8UWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgmm1bZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F942C4CEF5;
	Fri, 19 Sep 2025 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293865;
	bh=PS8ubXu5Kppe4atQoWr6Kmj6Ede0rdtmbXeTw2ERbq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fgmm1bZyGaIRL4Yox7sOtaA2ZKp3Hl3XypidPD3CcPm3QlFhsXLtbBAsEAN2MnDYs
	 meigfUOsHUQDEoNYFYanNTVopj/W/op6sxBzgT9yGzyM1uvqlEirTjlzlCG4+S/s50
	 HE+LPm9ROGE7WKGjBIP83mEhW7dfCwy9SwA6DlKAyXHgaMwXpweQ5wVQ/swWioWWYa
	 h5qqRdQt/SB/2DceYU28tudGDCJpoN4q7LtPk+LAzAFLnuklocmIg+IVFatPtWzmVr
	 IISC0RFWZRPXYI7FiU7D3E6RjbqyGv6b+ZQvUtNrZwL5iNC2QTqndOE3IjioUyHOT8
	 tiSS0UlIPkUqQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/13] ASoC: codecs: wcd93xxx: remove code
 duplication
Message-Id: <175829386322.143827.8672127425047600449.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 15:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Tue, 09 Sep 2025 13:19:41 +0100, Srinivas Kandagatla wrote:
> All the Qualcomm WCD codecs and WCD based codecs have lots of code in
> common, resulting in lot of duplicate code.
> This series is an attempt to clean some of this by moving the common
> code to wcd-common library or to soundwire helper functions.
> 
> Currently I have done cleanups for 4 codecs wcd934x, wcd937x, wcd938x
> and wcd939x, however any new Qualcomm codecs can avoid this duplication
> by using the wcd-common library.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: codecs: wcd937x: set the comp soundwire port correctly
        commit: 66a940b1bf48a7095162688332d725ba160154eb
[02/13] ASoC: codecs: wcd937x: make stub functions inline
        commit: c4bb62eb594418a6bd05ff03bb9072ee1fef29c2
[03/13] soundwire: bus: add of_sdw_find_device_by_node helper
        commit: 76cffc3eb1bdee0a7e8cca090adfd46a740f1cb0
[04/13] soundwire: bus: add sdw_slave_get_current_bank helper
        commit: 2e07017b28e8bbace4a4973d11d0646575d36f94
[05/13] ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
        commit: 772ed12bd04e6e6ad6d3fbc34016a2f88e63af7d
[06/13] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
        commit: 45a3295a3005f7782054a153312ba81d28eb7664
[07/13] ASoC: codecs: wcd: add common helper for wcd codecs
        commit: 4f16b6351bbff629e1a2a9d902b96210a50d65f0
[08/13] ASoC: codecs: wcd-common: move WCD_SDW_CH to common
        commit: 4652f02cf6150ae496eec582e76b7cc7bb3089a1
[09/13] ASoC: codecs: wcd-common: move component ops to common
        commit: ebaf88c0546ddfd5efe5d7867a2e8e9f0e5969ed
[10/13] ASoC: codecs: wcd939x: get regmap directly
        commit: 45f2c5e1d1fa413e862379f0ec765c3fdd07ec8e
[11/13] ASoC: codecs: wcd-common: move status_update callback to common
        commit: 59aebbbb0b47ee97c15cb6992c0fd665289544de
[12/13] ASoC: codecs: wcd938x: get regmap directly
        commit: edf8918028e226515c3869c3b8b16f12fe6e62fe
[13/13] ASoC: codecs: wcd937x: get regmap directly
        commit: 0266f9541038b9b98ddd387132b5bdfe32a304e3

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


