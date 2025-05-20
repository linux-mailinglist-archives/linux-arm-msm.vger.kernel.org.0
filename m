Return-Path: <linux-arm-msm+bounces-58680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DAABD336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997E97AD50B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5682676F8;
	Tue, 20 May 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4C1b21z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758C02676DF;
	Tue, 20 May 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732833; cv=none; b=lS7m/lR0hUGvXvJ9nqH2X0w9+mTNkXPhN1oAT27stvgKOj+xbq7ZUAIFW+uoi87Arpx9I93LwLcAHLmFQB8Jorw/92K5CR0o9KaAoMEuW8Cx+Xg3ya7SnzZRdgT1L4GzWs66FJJjmB5AGETgXnizHC4oYBmVz1Z3Uqqe45W76PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732833; c=relaxed/simple;
	bh=drmLNZREsEi2qwurO6x9+d7a7DiG6SJbsdoEHUKB2oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CG2sc5VYkEz1LIui/7YMTBDI6f6k9teoxnw5NKzwgjkZQDNvMGBkKLwNymhhkptpJ4tnJMLV0y3VwMJPnGBQ6lbO/Jp8+QsNWNNmd8/R6h8U9KDr1O1hOFbuhnvzevvETr9FJAWOVoBWPf+smYw1cfQX8Zm1IWeRfxOYJTg5fdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4C1b21z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BF7C4CEE9;
	Tue, 20 May 2025 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732833;
	bh=drmLNZREsEi2qwurO6x9+d7a7DiG6SJbsdoEHUKB2oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U4C1b21zU3uzpfHHnbaMqpSOiiIiTNkSuUcm6CRIhplDoB4c+Yk5tCkg7Sgo9b73Y
	 mI/Y/enOhxwT8WjiRg2ahQdK1J3KL3GPraHKqsUala59dOqUhEGVpsCoRd/iqPfkyp
	 6Akp6WoIMvFrwjJqeBpFJlnp9YKm+//Oj3u8aEU5LGFnOEpeL0t6VWPVw7tNt4EsX2
	 p6Huu5iTP5vRgw3cKlzad0hvT7anwzMvRrmcNhF8nlYGM/ZbJsx4qfLQXudby9zT01
	 xeT48yVR66tADMN+pLKYbzBCSEzQNp8zX35OubBEO+ouUyBuorcP1F0X5pxXuSWOAy
	 9bmJGif+nFvyA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
References: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] regulator: qcom_spmi: Constify struct
 spmi_voltage_range
Message-Id: <174773283210.19657.11607687696086405986.b4-ty@kernel.org>
Date: Tue, 20 May 2025 10:20:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 18 May 2025 14:16:21 +0200, Christophe JAILLET wrote:
> 'struct spmi_voltage_range' are only modified at runtime to compile a
> field, n_voltages, that could be computed at compile time.
> 
> So, simplify spmi_calculate_num_voltages() and compute n_voltages at
> compile time within the SPMI_VOLTAGE_RANGE macro.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom_spmi: Constify struct spmi_voltage_range
      commit: e9be77134469df4a11da898bec2bfc137700a9f3

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


