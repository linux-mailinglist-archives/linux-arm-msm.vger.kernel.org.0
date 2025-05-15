Return-Path: <linux-arm-msm+bounces-58053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DFAB830B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E2E4E25CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7A9297A70;
	Thu, 15 May 2025 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebfdF+vD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14B297138;
	Thu, 15 May 2025 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301946; cv=none; b=AD19n4RLlHPWX3B6kdliRPtuTySyJFvqH3ZW96ASvYOcr5XDT7uyt8v/AnZ8RYFxShYOXW8qwT+a4WcbNqUCs4UXbkf9R0o9VSatV3dvo8I93J/aG2iwc/BxLuk7v6RrLU3jHwv/D2k+tuzNPU/K3vKyj8FyJPZ6jcUBujc8Pco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301946; c=relaxed/simple;
	bh=fV4AqBLs6sQuWNeGcRZVWFcPBQUDPrRzODcRR8ehQ2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i9vCJiOqSL0iNWNt4rvrWbNxgrB0FUnQnDVpoiDzVfIEEkLoIUIZRE15DpunjA5/8WyJJma963nIlKG/cXLH4nH02juPDpf9WawIFZwAVtGAAK2QAEsdY83LXeIgXgox8VeAx2m9FxlABL8+yKJinxQ+Wm1v60hH5TPQY7Frg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebfdF+vD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8942C4CEEF;
	Thu, 15 May 2025 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747301945;
	bh=fV4AqBLs6sQuWNeGcRZVWFcPBQUDPrRzODcRR8ehQ2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ebfdF+vDktjwS8Y1cO78LjudsqTHVJtVshJyWIHDhYxD5Tfow3W5Vr3cPmxDR8ail
	 gyBW8LRzFj4qwQ3Ot0l7wNA2Q6AIP0nYY0teE7JD7r5iKlBfrG617dJvaLK/I7c48k
	 KFnNJQdKWPbe+InxQ0vYFJYEuPhEMtvnie2P3SB5YOnNEaZPcE4waHwHj3JcY40w/A
	 vko1ojovhQxxfZvtFjdOxA5TLZbRsBXDFUeNFQbF2Zh6x2PsSSilmHgpGFo7WBEASL
	 Mp8lgvtlOAkA8YebRbkYuMsCexsbDDGTOHLLuVxUUVeImjUE4tUBaaoyWinoiuYLmp
	 C1vtxQA9c/nZQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
References: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dais: Print APM port id in decimal
 on enable error
Message-Id: <174730194105.333989.6865469375895643519.b4-ty@kernel.org>
Date: Thu, 15 May 2025 11:39:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 14 May 2025 19:53:38 +0200, Konrad Dybcio wrote:
> Change the port enable failure error message format specifier to make
> it less confusing.
> 
> Take the chance to align the style ('fail'->'Failed') while at it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6apm-lpass-dais: Print APM port id in decimal on enable error
      commit: 723059ee896f9f302cfd36f49eac192ed4cfd3e1

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


