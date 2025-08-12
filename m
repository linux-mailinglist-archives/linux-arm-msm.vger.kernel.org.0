Return-Path: <linux-arm-msm+bounces-68753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A8FB2253D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634E83B167D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA8A2ED145;
	Tue, 12 Aug 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6QwRGWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324A2ED141;
	Tue, 12 Aug 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996712; cv=none; b=dB9eRb8dG2eRBjdf6BwsHMWVjnhnB0WnOG+MyqkIG11LaZTh/r2fBRJdmXwoffOiLIJfDNpFHxgtM6CzN+9H6DVGOtSu2pIvwRT4pWWZ0Vrq+XbdGlzLGfsSHvPCGlk09z9C45xB2YrshJGUeAwr7I7x3g4J8YX9LC4e/qkeytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996712; c=relaxed/simple;
	bh=NbG/dlAMBbcennAPv/FIC5IAuzcBiFtNf8p2K2/4H70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tfgY/C9d4gkR40+YBZSPhPwdwW8IfQ07y2EeFgMuB90GmX7tpbrllVyBHlRQLLX/nZYMQjkPf1vBXcHVhUfAduQRQ8WrE73qC/mZEDEG9BLErm0nZwjjdEZMi6z9udTDW7z2EgiiU16Xag3RS1VICBWuEEOYOtyD5WFZwS1DTR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6QwRGWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8035CC4CEF6;
	Tue, 12 Aug 2025 11:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996712;
	bh=NbG/dlAMBbcennAPv/FIC5IAuzcBiFtNf8p2K2/4H70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c6QwRGWmx8TDXhl97WGGhkLLG7F2WcfRKNik+10cNQOjIu7PeBUl/aRAPKDkWXYol
	 hS7OzGzYfR5JlN3xxWCQ70pcibnuKSmGXq/XOnugeZRrn7Hl7LLOCK5Ev4e/HVcX7o
	 55lQOL3BaJVoL6r3sfgYvphXBLn0ZGJOHh0jyhbxRxmmUJtBgH9T9hQr4+msVVUNnt
	 e/37uQv1mtL3jebcp2pSkSZtQKhlp82LZnvJPshiKokXCzKcifQ/fkd83D9zH/tKDd
	 eGxNMjem6BaonsZ0OAzyoD6OZqEiREfaEJZVjxOUSmZAFkxpvIvjBBiQXxPj4bccAZ
	 wvM0Z3ULjU6jg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, srini@kernel.org, lgirdwood@gmail.com, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, neil.armstrong@linaro.org, 
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250806140030.691477-1-alexey.klimov@linaro.org>
References: <20250806140030.691477-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: tx-macro: correct
 tx_macro_component_drv name
Message-Id: <175499671026.16031.5383052594222916199.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 06 Aug 2025 15:00:30 +0100, Alexey Klimov wrote:
> We already have a component driver named "RX-MACRO", which is
> lpass-rx-macro.c. The tx macro component driver's name should
> be "TX-MACRO" accordingly. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tx-macro: correct tx_macro_component_drv name
      commit: 43e0da37d5cfb23eec6aeee9422f84d86621ce2b

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


