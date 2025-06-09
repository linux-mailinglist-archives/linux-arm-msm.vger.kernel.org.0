Return-Path: <linux-arm-msm+bounces-60692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF29AD2846
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8C018927C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 21:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0B7222577;
	Mon,  9 Jun 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEqmXUDO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2802222C7;
	Mon,  9 Jun 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502832; cv=none; b=bjeo/802oaMiF0CAJBr8MAsYf64tXv6wudyYoTjPa04y6BOEohl/mBobn+f4Dox053LC/lcsyv8VOFAQ4t1doO1Ko6LADOKyG8ccISLIW+fDN1QazjTlfAcVtZdMVcLMHANuoQXDN2dzepKKxXA0bb872VlQp7PpTYzbowEJ0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502832; c=relaxed/simple;
	bh=9x7mo1DcBg3Za+YKobC9xNragbDHesOEG0g2vqktlj4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KCoqoUb8UaENZDj+C1qVUGh6ZB0N1duj89YQLSGoo2JR0FLCD39tSkYgsQ0WNyjgM1oUMucYaQiSo7Ff+jRaz6N6WOscMWo8lfBak0BHUZ7p2dDVNGSgLLQ65cd/QgVxgURbxzfRTndi+QGWWIeqM50MBgJBseoLb2mwO7Y2o1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEqmXUDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E938EC4CEEF;
	Mon,  9 Jun 2025 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502832;
	bh=9x7mo1DcBg3Za+YKobC9xNragbDHesOEG0g2vqktlj4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vEqmXUDO7oYJc1GLA2P16DZyZ64rJ8O5ouacDUVJcYC2pBTuUz1Zg41YUAupPOOQK
	 VLepQAoJmw+/leOCSK9Fa8DdkeWfAe64KIscdlp40bNQT/iNO1ZfCPXe3fEHhYCbSk
	 FzHsnRqp6y0yXFf1MO9zGg6hncunwFAkUUQSgES90RI9zeuSUpdJNR7FaS0AwoGZxv
	 Dlrw8Q569zfJbwIfdDr1uXoKhuOBx2hgEySVerTxqCTATYUhFEOO09WBOWScplw0za
	 VBLRJApTdy1LeNixy3pQyWL1lPa8ysJj7QK5b1JfMmtuwYSTNs9eiOTo0iwWl70NI0
	 GFgP15dAo8+5w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
Subject: Re: [PATCH 0/6] ASoC: codecs: wcd93xx: Few simplifications of code
 and extend wcd939x
Message-Id: <174950282969.277844.5959032877651514065.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 26 May 2025 12:49:49 +0200, Krzysztof Kozlowski wrote:
> Make the WCD93xx codec drivers simpler using
> devm_regulator_bulk_get_enable() and obtain missing VDD_PX supply on
> wcd939x.
> 
> Context depends on fixes:
> https://lore.kernel.org/r/20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: wcd937x: Simplify with devm_regulator_bulk_get_enable()
      commit: 10cf8f6be63f2acfd3d366d917f1af6625cd9124
[2/6] ASoC: codecs: wcd938x: Simplify with devm_regulator_bulk_get_enable()
      commit: a7ee107c2dc382d28794d7b254d0b4de2a75dff2
[3/6] ASoC: codecs: wcd939x: Simplify with devm_regulator_bulk_get_enable()
      commit: cc50d176d0d8b38df2ae119310970f793cb5e756
[4/6] ASoC: codecs: wcd939x: Simplify return from devm_gpiod_get() error
      commit: 1a134881a8f861bfc996d77d3eee9017a95eb5d7
[5/6] ASoC: dt-bindings: qcom,wcd939x: Document missing VDD_PX supply
      commit: 7d648206bae8e7fd3d67481751a76dcb0a299eb8
[6/6] ASoC: codecs: wcd939x: Add VDD_PX supply
      commit: b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68

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


