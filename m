Return-Path: <linux-arm-msm+bounces-74524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA269B95F28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CFCD164A66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8E2324B13;
	Tue, 23 Sep 2025 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOOgoKyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04AD30FC3D;
	Tue, 23 Sep 2025 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632981; cv=none; b=INti/Y/N6/kpHLxX583CA98UpOnNl3vAOqKcP4SU3A5uSsV43z/LRXCRky9b+T6D/t87/cV59ZodXkhjwMZCFO0OAsQcxlZ6iiHZt/8+jEBZO8pESXfP1ySQUnaoilmox3OUHbF5EaCr47L91lPWai3+j0D7wgLmQBfyenxcWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632981; c=relaxed/simple;
	bh=NVdwjuphmRJx2SydrOL+6cejFrImHZOeT4DPAJvC9Sc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WXrChC+GaPhOyOwMmEhi3/kQwatrO3OMk421R5kcOEbQ8PKrw/35SxIZ4VdltKupl9C0n+jYq22WCD7OwgA5MWFfBJlGJ0N4X+UheRUTkl9QQTlr17t53RDh7P2UfiXNPCohYJwyoDFVJy8Ba/Hp5/m1krKhIgqQMtGCyqvjhRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOOgoKyB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C32BC113CF;
	Tue, 23 Sep 2025 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758632981;
	bh=NVdwjuphmRJx2SydrOL+6cejFrImHZOeT4DPAJvC9Sc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rOOgoKyBWzaItfktw2mJ/47GXQKMOut6XmQnNVlM4MdynB+ZL3FoyIBu71ow3N3BH
	 MQp4ZCWl38KoNtIgDl//h3lkpHrDZXgxzHb4ZsD24GwtceYTD7koF9LcMRbTr/P7rc
	 6xWjr2SVuTXHkiEnLwl+S/zwtRNN/nnmzY25EXz68QNvSeT6MBwORL+JbbncQDkxUh
	 xKa6hYc+RsaQujgIQxnstmYfHf3jgQ2FC/EZeXGJqVdVTGY1exsgpJCLI3FOFr0Lfe
	 ge5gDjcJmafX/t45gnok17ejj7jfCQaUnSvgidsYyM5ct4a97a8dkkuA/GYOw6EJcL
	 4G1zSiPfuBHcw==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 pierre-louis.bossart@linux.dev, dmitry.baryshkov@oss.qualcomm.com, 
 Ma Ke <make24@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 stable@vger.kernel.org
In-Reply-To: <20250923065212.26660-1-make24@iscas.ac.cn>
References: <20250923065212.26660-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v4] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-Id: <175863297892.1081221.9696569570789415839.b4-ty@kernel.org>
Date: Tue, 23 Sep 2025 15:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Tue, 23 Sep 2025 14:52:12 +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data() and
> add devm_add_action_or_reset() in the probe function, which ensures
> that the reference count of the device is correctly managed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()
      commit: 4e65bda8273c938039403144730923e77916a3d7

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


