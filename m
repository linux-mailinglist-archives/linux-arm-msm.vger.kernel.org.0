Return-Path: <linux-arm-msm+bounces-30282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA419667C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E646CB262D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF951BB6AB;
	Fri, 30 Aug 2024 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NONv074o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378B1BB6A3;
	Fri, 30 Aug 2024 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725038063; cv=none; b=ELqkjgPv+495YMoGynZB1oZ1MV4mPW5OS/GPlQcV5n9qI1fAYh9i1pnB06YHkvzmJmDAHrnqY4/IkH8o8sZvLHQ+pdGcGmOkDQ5zGY9EpRtJVf/Uhnm4RF+xbIfv8s7+3iMRO6IiZIWdxE8i6V3iUH8Ygu4J3H75J1O+V7w68Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725038063; c=relaxed/simple;
	bh=H0wJ8wsMUAah1G02ZzmrdrdnFaoSA3Mc9Ef9ZQp8UDw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hlj8q/O1JcC9g518J+vbPDggku27rvn1Mn3rhRiahMtnvIwC9RLn8iVtnpmRVeUUc7EhUO0yR1MoSzfnPm5gOT51yKDQNAq1hucAADASD7aY38woz1a2OvQiVC5MSrdhl/L4xFDRs1xo2a/8zbvFyBL3l3SOtrgKyZUwNQQXajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NONv074o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84A6C4CEC9;
	Fri, 30 Aug 2024 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725038063;
	bh=H0wJ8wsMUAah1G02ZzmrdrdnFaoSA3Mc9Ef9ZQp8UDw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NONv074ocJd0COZKyehHgQa/K5T3X51wcgIKZ0DLPRj4WPPJcMF9Lzgetr0xDpZfw
	 iyX5lR6UQStuwoPjFMlb4Spzv77o6jEPx+Puo35bl+4ffPcF6Df0Upeatn9Ncbzmgt
	 PDGMvOXg2HwWWPxbIJ8pJujZfzxPoqOqpAi/vp/av8RhpNC/6YxZCAymnzekHnE71O
	 kSHc89slXgfRp7cOTlg4zHjJCsL1j6CICu1G5+ClSBE1nOJUi7MKlWboeHEUDi8Oi0
	 TLzApWFEzGcGFWBy3ZDubain6Se8a5kDpZZVuyVv6Blsla+gQC1wlqTW6OinuTTJ/A
	 Sc6d5IrFYLBag==
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20240830073511.1.Ib733229a8a19fad8179213c05e1af01b51e42328@changeid>
References: <20240830073511.1.Ib733229a8a19fad8179213c05e1af01b51e42328@changeid>
Subject: Re: [PATCH] regulator: core: Stub devm_regulator_bulk_get_const()
 if !CONFIG_REGULATOR
Message-Id: <172503806142.196819.2979143374573134626.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 18:14:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 30 Aug 2024 07:35:12 -0700, Douglas Anderson wrote:
> When adding devm_regulator_bulk_get_const() I missed adding a stub for
> when CONFIG_REGULATOR is not enabled. Under certain conditions (like
> randconfig testing) this can cause the compiler to reports errors
> like:
> 
>   error: implicit declaration of function 'devm_regulator_bulk_get_const';
>   did you mean 'devm_regulator_bulk_get_enable'?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Stub devm_regulator_bulk_get_const() if !CONFIG_REGULATOR
      commit: 1a5caec7f80ca2e659c03f45378ee26915f4eda2

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


