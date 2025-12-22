Return-Path: <linux-arm-msm+bounces-86269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6171CD73F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 23:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA9A7301EC60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 22:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3555E327C0B;
	Mon, 22 Dec 2025 22:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKM/7+Wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082313254A2;
	Mon, 22 Dec 2025 22:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441566; cv=none; b=NAKRJnePVIqns7qu50QVOuylC+FhJvb1/395jT7EJKDt5kOse5AlhdKtQodbkuDEhYpFOwL33g4t243CukjNNXp3VabMVfqm2vWqhPTauAV4tu4AV3CRcg4eIjs1qvR1+LVGoLi7g/WHspjvPXuK7lAaY6MAx5a+el7lGewoiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441566; c=relaxed/simple;
	bh=PMDODyDWIB/IYC0AmTfC8hBD+46msPfpsVNcvj0+ax8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dsdx1/a8fe/m41U/CUyFkz9HpPCl6W25rb42JH4wNvfCUFA0ZEd6frUD9nRjn3fzVBtgOEaP/1Lv5rd6o9JAQcXMPqS3/58HjefyczApxfTQ1Ta9AGiITVRClUboogeNZjqx4bvQZ7Wf3g2PTdNKSAsWyzqd7vfMj32U54L3JjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKM/7+Wt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB7EC16AAE;
	Mon, 22 Dec 2025 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766441565;
	bh=PMDODyDWIB/IYC0AmTfC8hBD+46msPfpsVNcvj0+ax8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jKM/7+Wtqt/6QQWox7+PA9F2jL30fLnC4VBH9YpfZdnrnqa8ROlSZkGphwxLXTZDL
	 d6LOUl5GrBMd2vbN4eSDHEMg7vMvO+vEowhpeXTj/g0MWQYWCgxjiWy7dAgo+9hnGn
	 au7NnKACftW7u1FMKAKKemmXwTXTn7LjWonseFgTUGbDLls4T45E0p3vQ9qH0sVmnK
	 j/Gr7W9U9nkzyNvR6/B/9OgQQ57glrudB02xJ0HjYwlkmV41H9Ex3Y82EcCvsoBchX
	 aoexPOe8KRbUZiS1JUt8wjb9ahnnN8Ny6QMecC9qdmViu6rykwTy8c78tZX4NAKCXH
	 DJXBuj0VCUQJQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ma Ke <make24@iscas.ac.cn>
In-Reply-To: <20251219142412.19043-1-johan@kernel.org>
References: <20251219142412.19043-1-johan@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: pm4125: clean up bind() device reference
 handling
Message-Id: <176644156432.2187098.8236741716951052616.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 22:12:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 19 Dec 2025 15:24:12 +0100, Johan Hovold wrote:
> A recent change fixed a couple of device leaks on component bind failure
> and on unbind but did so in a confusing way by adding misleading
> initialisations at bind() and bogus NULL checks at unbind().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: pm4125: clean up bind() device reference handling
      commit: 97af54473f2a79f663bd14d7c75e97d04bd0e283

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


