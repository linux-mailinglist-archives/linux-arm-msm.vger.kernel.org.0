Return-Path: <linux-arm-msm+bounces-71919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7BB4280D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 19:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB8C71BA0AE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41E72D3ECA;
	Wed,  3 Sep 2025 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWT7gyqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15861547C9;
	Wed,  3 Sep 2025 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756921059; cv=none; b=pJrXMUBf2HxJhy/ANrGjJv8FUISE0nKUGI/NYCjq2AW2MN1Y5A90erQgKufKx2EBb/cXfXyeaBjdtDW2YVmUsulAPAVVMOi1Dd0gOHwsEXcJSyojBE7N//bJ9lvCdi3aOsibpLcjnJt/q9Gyv/U1ywyUDyabzqxU+ajEzkfCidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756921059; c=relaxed/simple;
	bh=F9Gp6CV4E8HRJ0qdd3K4Ng1mxFLLKfFJsyPWLsgFWKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evVGeQNk+ZHqKT0TNi2UmWcvHmbCae/sF7BKbNrES4QSJH7aqcChjez1h5mAr3agw9qk5Tv/4VQA/16zuF6JOvE8LJKdhPZ/O2BWr2OHmQIUQevoQwQXlCHhJkPgHcOohmRxnUukmXzO1VfrzPC0uPAf56wlm8pk1uli7fqJZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWT7gyqL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C8EC4CEE7;
	Wed,  3 Sep 2025 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756921059;
	bh=F9Gp6CV4E8HRJ0qdd3K4Ng1mxFLLKfFJsyPWLsgFWKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sWT7gyqLK6HfvDZ+1Gycs+KDBWl4gwm/A/mcSKd+7FVAer600fup/bmePZ5lYpFJm
	 T1hMuCiXJ/caWobhBrF1CbRCe4mQDj3yJglOoYBuNzp1juCFchtKYx9eOODfIkUXxE
	 IxliW1RtLq/xO4Xm3rKkxNJuU+qCmJFAKpQTXYziUtftUHjxwl7PNTaNBnnXmx8CvP
	 hSFchGBlhtvrLm7Cafz0NH7+4c/4MlcMMnOVaW1QAc3daYNMpDXx56Ke90XwEniXG6
	 9oA78bqLUuLQSwfb28AF6E8DWS5/+gSp/TeUfsHBP8xHlfEWzCZozHNBDso3PbDYGa
	 EEqQ87Ctrkreg==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] ASoC: qcom: add support for Glymur
Message-Id: <175692105707.244487.8107730396325224823.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 18:37:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Tue, 02 Sep 2025 15:00:38 +0100, Srinivas Kandagatla wrote:
> This patchset adds basic support for Glymur sound card,
> - by reusing x1e80100 snd card machine
> - reusing lpass wsa and va codec macro which are identical to v2.9 codec version.
> 
> For now only tested WSA and VA, which is why tx and rx codec macros are
> not added as part of this series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: qcom: x1e80100: set card driver name from match data
      commit: 5ab26b8ca5649e4a16e4b48efe5a0b92299c8f51
[2/6] ASoC: dt-bindings: qcom,sm8250: Add glymur sound card
      commit: 8f48b160e1b8f0c959e25df63994e6204b3794a8
[3/6] ASoC: qcom: x1e80100: add compatible for glymur SoC
      commit: 8c7ea98650e644ff61d3774085f732b40d8f7788
[4/6] ASoC: dt-bindings: qcom: Add Glymur LPASS wsa and va macro codecs
      commit: 25436580f025d42bd7ccf3b960f4c405f3c91512
[5/6] ASoC: codecs: lpass-macro: add Codec version 2.9
      commit: c73e2c5672dae4f6711cab99cabff9e72cd0591a
[6/6] ASoC: codecs: lpass-wsa-macro: add Codev version 2.9
      commit: ce1a46b2d6a8465a86f7a6f71beb4c6de83bce5c

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


