Return-Path: <linux-arm-msm+bounces-80723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C58C3F2DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66151188E6DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66AC3043D6;
	Fri,  7 Nov 2025 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyc00Umb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00C3043C0;
	Fri,  7 Nov 2025 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762508063; cv=none; b=QZMP0zx0hGv9e/D2gV3K6KF4iBF58Ngbl0Pv8t2Q9B+OBaio0FjAbqNST0lu43ucYsfIGg3s9GkCgeAGGVoj2C9Z1w44K9FzDg7aH3ClceDJnNE/QZKeaHBRMdVgKBfbYfVr5+YaJ3B7ryAC+4IUiwxaY6+C/433T9i4ILA344g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762508063; c=relaxed/simple;
	bh=zL+4rcyTARsIe4hJxa00Ims71iycI5pdNXjIiz9peTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EuG+JHTPn5hSNyk3AfiTPkVWqYKYbrn/SAsFVZjd5Z9SIWGDT5HDeBJFH9kpdhQBu1PcQv7nemdvh3IMVIXTPpHGh8FF22D5A9TkB1K1qYQE5KyEQsRMczdTyav7yzKtV4UL+MWRxvAo2ygFTXc2qM4zU9iUGk2HgyAYojHSg9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyc00Umb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F33C113D0;
	Fri,  7 Nov 2025 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762508063;
	bh=zL+4rcyTARsIe4hJxa00Ims71iycI5pdNXjIiz9peTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jyc00Umb1JORVOZ2GpMEINSZ9j7D4zfvsDFu8ztoyHs/9qoQ8SHnjGvDd/78XNJPT
	 hSebqSP/Nkzn8IFu+TOvBdvNUJq/GoYNYn8bCp8RL32J4g39sBj4c7tIxCN15Xx7Xw
	 6P5thM/Pp5uKwwN52ASrUWbzmY245gJrU+U4q+bZI2HdlDAokr4tDmVncRFpfpzpL3
	 bjvgIhhiCtT6RiSw5/9CjCeLVklwYA0lsbY0fm49gcheJ5vgb4g3aV9RtyrLwc9K8S
	 MSjOsJoDvWnksHoscILjHsumIwHPgJMZCJ481lEMji8FpnOIWXeoQPXQF16FzXEMTi
	 ZCMf783Oi5iFw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 alexey.klimov@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251014153541.283899-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251014153541.283899-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: pm4125: remove duplicate code
Message-Id: <176250805971.2488867.8965802820499372032.b4-ty@kernel.org>
Date: Fri, 07 Nov 2025 09:34:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Tue, 14 Oct 2025 16:35:41 +0100, Srinivas Kandagatla wrote:
> With recent addition of wcd-common, lot of code duplication in
> pm4125 codec can be removed now.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: pm4125: remove duplicate code
      commit: 6951be397ca8b8b167c9f99b5a11c541148c38cb

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


