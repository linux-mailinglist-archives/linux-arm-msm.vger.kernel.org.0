Return-Path: <linux-arm-msm+bounces-32808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5E98AE88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 22:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7425CB22F24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 20:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D19C1A2562;
	Mon, 30 Sep 2024 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsuYYobj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7881A255F;
	Mon, 30 Sep 2024 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727728658; cv=none; b=PcDVc0cAqjzPnjDGw6btxUGcWtSR2H4WKMTtoVQ5+R5yNO8urJtuvWbAguOYy6UTur4xcXsRjcLNo7Sy6nSdRkm0WIFriyuWh27vxwH9C6o0HqvFWdYCw2CodEvS3S7/KDjo0pJqHy5BrImUbD+FnaBY2e67X/4fj7t6TFzKB1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727728658; c=relaxed/simple;
	bh=yZEDogMovAy8OcspPW/wXi+jAkY68ZCI6FD5u4YtdL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aiSjKQ3fMjwr0K0S367lE7D6WoX1284rp4wsIaiAEEhVwuxjARL4l7MYFRDVa5rcEF+zy+W0B+m5WKM0X2jGKoFu89kIW9Jbj1Yue/aGeOHHf3fs7mXt33eMgbw42urkv1EzGN3WhEhc5hFRqiw4llxGhXBRdydJir5ir+yp2Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsuYYobj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8780BC4CED3;
	Mon, 30 Sep 2024 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727728658;
	bh=yZEDogMovAy8OcspPW/wXi+jAkY68ZCI6FD5u4YtdL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hsuYYobjq+De0sKXlMhUfX00qWYUvNa30uYYfU6mvlAimpOlId7YZIuOzwOOjlnsB
	 d4rldw4oXU2eyT+eJZnixz57w9kdUIYismeX6kJnjgfUmASXqZC9qMjSGPoXP5Db1A
	 1Me9WVRqSweVNk1dk8Yf616Yjnbjq+rSEXpVyQ2toh9W2FDHbVHnKXMBtPhfBtxKGv
	 DSnUExxf4VGPQ6udx9j+WO1O6Z1OQ6YOp1Jucr0Vetd4KvvAdLiBpvsNOzqf16hpzy
	 bKKGdNjbVvnJPD9QA7uTVHNvzAdLzH01JgACLxavH6lGkxjySVsBcFCSBEmzlaTxWp
	 Hg1HMDbx2dujw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Min-Hua Chen <minhuadotchen@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240926231038.31916-1-minhuadotchen@gmail.com>
References: <20240926231038.31916-1-minhuadotchen@gmail.com>
Subject: Re: [PATCH] regulator: qcom-smd: make smd_vreg_rpm static
Message-Id: <172772865733.2147169.16731345779366535012.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 21:37:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Fri, 27 Sep 2024 07:10:36 +0800, Min-Hua Chen wrote:
> Since smd_vreg_rpm is used only in
> drivers/regulator/qcom_smd-regulator.c, make it static and fix the
> following sparse warning:
> 
> drivers/regulator/qcom_smd-regulator.c:14:21: sparse: warning:
> symbol 'smd_vreg_rpm' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom-smd: make smd_vreg_rpm static
      commit: 18be43aca2c0ec475037923a8086d0a29fcc9d16

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


