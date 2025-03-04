Return-Path: <linux-arm-msm+bounces-50173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1352A4DE05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0341C1783C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 12:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13B22040BC;
	Tue,  4 Mar 2025 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQtCJjjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2B202C5C;
	Tue,  4 Mar 2025 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741091630; cv=none; b=jnuDDPFSIz7qIZflNkMzNxDRzk3kF3Q9hS4W5wb/Y/6C1GfhQUcjYGb+yQE9KRvNZDvJxSCNDWg5Iy2Valfbheu2hjcvxtoSd2O6XAZyOtMml5czNZXqxMk8hTe3GQd4I+RpreSoSr2BkoC5DE+2mK0gojn/9fOZsDGI14hwbmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741091630; c=relaxed/simple;
	bh=0zUFOrw8shW7MFjQk03ahVPm0Wdqf9mwdxeXee8/Z1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AeOYgC4sjxOjNCkgkzgOCJ32xgXAdPfMTPN3Hyq3ymYv2xIvvrcOQe3+xpO+cgaHeoSXh4Q3Uc7QqAOkfkPAOkEhiSppiove1iEw7UkqbtIfeVs93km2flNFsZYbL35fgvAiiXrEKXx5PRSSMLBye6cZECHsFPIbW+Jb6DZcF9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQtCJjjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180D8C4CEEB;
	Tue,  4 Mar 2025 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091630;
	bh=0zUFOrw8shW7MFjQk03ahVPm0Wdqf9mwdxeXee8/Z1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IQtCJjjsqrJ/wP1A6hezusBljzE8lD5Mzy+yAmTODCewUL/QDMQr+1k1H75BGZnan
	 IJTggTpG6/20xIPqcBx39mbvZ0rMH65SGzPqrAGMsrHz1VyPySm9iG7hpn5rp+7Bjw
	 SEfi9WUD3a79Sfg8Rbk1RTaVT09uPKn73W/Mhsw8eGUYJknk4wMxEuxUeYS/HNgbEu
	 OVvdEv2hg2bq8DLduSN4Cph8lPgNoitYl5hUucNhmfNeBJdEno7c45GqEm4mLVd7Rj
	 ecF+VxX9hsTvQRpwino8wb/CWQNJbffM+qibeQ92wj1UAcmviGKeQIjBB/f+t6eY8l
	 tDVX8a/jIDRfg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, steev@kali.org, perex@perex.cz, 
 tiwai@suse.com, jdelvare@suse.com, linux@roeck-us.net, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20250221032141.1206902-1-alexey.klimov@linaro.org>
References: <20250221032141.1206902-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: wsa883x: Implement temperature
 reading and hwmon
Message-Id: <174109162783.25452.6890803817267804274.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 12:33:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 21 Feb 2025 03:21:41 +0000, Alexey Klimov wrote:
> Read temperature of the amplifier and expose it via hwmon interface, which
> will be later used during calibration of speaker protection algorithms.
> The method is the same as for wsa884x and therefore this is based on
> Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASoC:
> codecs: wsa884x: Implement temperature reading and hwmon").
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa883x: Implement temperature reading and hwmon
      commit: a02c42d41af7d66db71ca43c52531c3253ebe35e

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


