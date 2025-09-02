Return-Path: <linux-arm-msm+bounces-71551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036AB3FD30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6B81A80E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5572F998B;
	Tue,  2 Sep 2025 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVijmPE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638EA2F90F9;
	Tue,  2 Sep 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810653; cv=none; b=jJ2vt2JAvDKjrC2s91pcBEvXs+Aop0Yw1JvSssZc2uhxiywpCi2lw5PXKwDB514f3QIdZP+DJvJ7qAv+bVabyzkWi2LPAfGlMacJwGgIFxEAL0t39oAIXPBi2Ofr6vU+N8COhww7eX1K5HQu7GqoOJqFQJlCGw1kH1VLRswiwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810653; c=relaxed/simple;
	bh=8Y3f7k+rjBQ8stcqEtFzNrgEJb0w7lnMZUfzl6tati0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=svb0iO44S7hENkBdZg+EkVSYwMYKHPy4pkB5rVm2mZgyOLz7wWXOOMNAZFx8i+kgSjaISTsWVCqr+TWQ2P1Q23Ny8trz8nXuSV9dKfkZmTjf/5WChrqKUlFMFr0ZCwKtV987Cj56aVapdoA80A7jxCvwbSypqe2Nnuq8gHZV/mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVijmPE7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F486C4CEF8;
	Tue,  2 Sep 2025 10:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756810652;
	bh=8Y3f7k+rjBQ8stcqEtFzNrgEJb0w7lnMZUfzl6tati0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bVijmPE7AW6OilZCkTpWAYM8D96WFD9aseCsIparj6n+CLw8To0rhBHDOVuK+NgBv
	 qkYZYf6IRz0tEKhwDnwSBe0ZkJevmrgMJtxZh8o3GMpTc+FJ8UGiue2sEZGdHNLG/I
	 20w00v3Jh5/a4wW9qJA452XsV42ztQRY8JX/hwNoENUBBqYjAEqO9zIXk3mtfIWGxg
	 BnO8hVhuoeTUA7JMUSK/3MNyqtMWKVeks3/F7dPo3KZgzkW2fXibRBBdPKKCRJqACU
	 irXfNwOYlg5zgk1eXBPNICqHCnDXZ/PV7ai6zbIg0lKJz/4a81rgdPMHW+N+w0M7IT
	 kxVht8t8/jvkA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org
In-Reply-To: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] ASoC: qcom: audioreach: fix sparse warnings
Message-Id: <175681065094.47687.9352312314536522097.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 11:57:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 25 Aug 2025 11:12:44 +0100, Srinivas Kandagatla wrote:
> Recent static calibration support patches have excersised new code path
> exposing some missing checks and also accessing some variables which are
> of LE type that are accessed directly without converting it to CPU type.
> 
> Thanks to Dan Carpenter and kernel test robot for reporting this.
> 
> --srini
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: qcom: audioreach: fix potential null pointer dereference
      commit: 8318e04ab2526b155773313b66a1542476ce1106
[2/3] ASoC: qcom: topology: convert to cpu endainess type before accessing
      commit: 7e67e1c99efa6ecd003d51a42dbe7bd5bad329eb
[3/3] ASoC: qcom: audioreach: convert to cpu endainess type before accessing
      commit: 8f57dcf39fd0864f5f3e6701fe885e55f45d0d3a

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


