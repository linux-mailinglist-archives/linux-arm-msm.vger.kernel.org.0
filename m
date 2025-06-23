Return-Path: <linux-arm-msm+bounces-62102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C433BAE499C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FACD1887202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F8326C3B8;
	Mon, 23 Jun 2025 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unXGBZPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B0137923;
	Mon, 23 Jun 2025 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694420; cv=none; b=nCAJKRgX6S9wbkFC4N/o9GjXTOI+DVQ8TTAx2NHclx+NlpJJO/PT7EqaRBCi1DdzCh6s1p4AkRNGptJPJz0yQW7RqQxKnwz3KQ5pF/5TchrkUDWzv+ZdLCj4scUopnQQdkhjMWpb2usmotfz895/61so6bltYL9rHSTgIzSDNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694420; c=relaxed/simple;
	bh=RbdnKkPdChH9ud1EvbJKJWRbB02+2VVpJE72YYvelFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nFEiofxDN0UebI3sPi1csiMpzS54l4JOGD4lrsQ0EpYS2BS+ShCYgou/E0M146xAuP1par5nPOtQJGmp+AqdJZaLb5qcH/KFPVBmZiMLMSEXvjqXazGfZVstDUM+jBUI9h4eFTS9RZgJlD4gXkpuf+dj6iojhauV3VhEsTD+HhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unXGBZPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EACC4CEEA;
	Mon, 23 Jun 2025 16:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694419;
	bh=RbdnKkPdChH9ud1EvbJKJWRbB02+2VVpJE72YYvelFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=unXGBZPmhTFbshnjEYajp2YQWZGW4sm0YvdEj3VYhcxI35eptuB9j6JxVrNbxNxRT
	 GFQo8ta/utIQQ6Z3UrT7ByG323qGgkdEBir61/NWNrcT9eYNoLY2DX9bEYd5JW2BZs
	 ftBj0vPBt9S/uxan9HjMwG1yP6Xab4A3mvZV5UJ7uE5Tfe6Jv5p9VyJx6mX3sVbbow
	 yP4I1XqLGNcpT09NsJQeoqbVpAtqz3/bwcVJpuMlTbK2s0pKKWVdYRAZUdDGr4xjA4
	 PrL1h3AZ7bJYcOfBb73Pw6/m/VcvzK2aE3/Y17NlbGj+6/slWTmAEjPJrFb9yeEXn4
	 iyW5xKFWj4Sow==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthew Croughan <matthew.croughan@nix.how>
In-Reply-To: <20250617-snd-sm8250-dep-fix-v1-1-879af8906ec4@fairphone.com>
References: <20250617-snd-sm8250-dep-fix-v1-1-879af8906ec4@fairphone.com>
Subject: Re: [PATCH] ASoC: qcom: sm8250: Fix possibly undefined reference
Message-Id: <175069441422.140181.5569883866488657965.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Tue, 17 Jun 2025 14:20:12 +0200, Luca Weiss wrote:
> With CONFIG_SND_SOC_SM8250=y and CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS=m
> selected in kconfig, the build will fail due to trying to link against a
> symbol only found in the module.
> 
>   aarch64-linux-gnu-ld: sound/soc/qcom/sm8250.o: in function `sm8250_snd_exit':
>   sound/soc/qcom/sm8250.c:52:(.text+0x210): undefined reference to `qcom_snd_usb_offload_jack_remove'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: Fix possibly undefined reference
      commit: 999fb9d51f939ee23cbb9313ae558d29d6987804

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


