Return-Path: <linux-arm-msm+bounces-30006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7A9643F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A88051C246C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6B718D63A;
	Thu, 29 Aug 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSljn5f1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1D158A08;
	Thu, 29 Aug 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933391; cv=none; b=EWXt8yxFOnwqLU3nmetZrwjY1VBSZKftacL9mDyBeqL1DKOPHG/C8NMxDm5/OzKaENHmBdJ4z7ScBHTM0RsUyCNIdkgYeTdMnHgDLWy/iZdwrwa+nTi28c8K50CicvTJ+T1IKQfhG70N3mJmgbHTESK/olIuc0toR9/EzHhd5/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933391; c=relaxed/simple;
	bh=RGI992Vi3pjBdiCY0+FQtxsoxOrq88F9UvSMi8RwN+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TxQrXv2allcgj0dau1ZZuIOBHzAe4HVl9ya3N0D8H6KYEy9yguWYIHfL6JaC3occWoJAKyvlX279y39F+cShzVEYWCRq6/HbDzmyAAQC2fzXI7SXf9yrbQthjwjLZ4p5lh6NcSmP10a1F+bCjM1XRKef+2RkaeEOL5KpqFUG1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSljn5f1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA0CC4CEC1;
	Thu, 29 Aug 2024 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724933391;
	bh=RGI992Vi3pjBdiCY0+FQtxsoxOrq88F9UvSMi8RwN+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MSljn5f1uDlTag3z0ZBKLXyVCAMQLBHUH8IaRqsHDOwnQpKu8jmF6K4HLHuJsqJhC
	 f2jD9oplfRU6jJuKLTuOxx45nxtq5rVfMSYw1rzj/am1iAVLEiiUizaPVt4BhG/cfv
	 eyQw30qt9pqDCXGzPNkGjWPCOcs3kB1B7jDx/darvXPP22cwPwgNQrdp7dwvylMABk
	 7Qoz7kZMVhAziatSLDop+TgCzjM5674M/mWWAm2fhGEw2vEQP5JDKzhSHZrRrBBIpe
	 BqVrFMQHb6NBU3cvs5HTicQB5YpfDUoi8Xe46SqCDEhj9pZLknFc1R/F7EH8dMu1fw
	 HMrPczJKX81dw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240828130056.3481050-1-robh@kernel.org>
References: <20240828130056.3481050-1-robh@kernel.org>
Subject: Re: [PATCH 1/2] regulator: qcom_spmi: Drop unnecessary
 of_find_property() call
Message-Id: <172493339011.26021.13552493234529231254.b4-ty@kernel.org>
Date: Thu, 29 Aug 2024 13:09:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 28 Aug 2024 08:00:54 -0500, Rob Herring (Arm) wrote:
> There's no need to check for presence of "qcom,saw-reg" before parsing
> it. If the property doesn't exist, parsing it will return NULL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: qcom_spmi: Drop unnecessary of_find_property() call
      commit: 7540bd3398675e54cbd7324c47be8cd3c7a6d9c5
[2/2] regulator: qcom_spmi: Use of_property_read_bool()
      commit: dd72a3b8a6007b44ed3b85e1d606afc434879e70

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


