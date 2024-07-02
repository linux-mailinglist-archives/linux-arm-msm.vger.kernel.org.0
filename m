Return-Path: <linux-arm-msm+bounces-24904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469F9246E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 20:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A89A1B23463
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 18:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9DC1C6890;
	Tue,  2 Jul 2024 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDW/sPSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385621C6884;
	Tue,  2 Jul 2024 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943401; cv=none; b=bxZXB+rm7ltlRnMTSSx4J6JKp3OlDyv7DYWwqKObpIVZY0Zi2j0+9TC9E6FuH471/60Brpncat6JeFSLtKBpIlG7/o0Kou9dMjr+p0P3SEBsxbBtj7lkIZDxs8IVZ+leki30N77G6CQ8Lgwprs1pREwcq/8h5mIp+1Bc/SdSqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943401; c=relaxed/simple;
	bh=1PTZ3uQgLKGQChj25rDAqkSCJmHzdA4sq5F+oAYqs4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CgR8GIQWx7HV+9PDbmbGWYnwEV/RQinVw1myM/GQ/oXn69kGYB/aPH7NBxFh8P5YCoJBlzYQQj9IHw5+du1ih2DiBDAgXkKlGpFdbPPdnYh97n0x6ZZ/vgxBo3/ASzkeY9HcTBDClk4rB14OqtFrv1cpwH1aEBViubCUnLialYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDW/sPSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFD5C4AF0C;
	Tue,  2 Jul 2024 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943400;
	bh=1PTZ3uQgLKGQChj25rDAqkSCJmHzdA4sq5F+oAYqs4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hDW/sPSj3h9jL8Kqc/SGeHmG7EvO/537Jie5OQ1hK7jsU0foy6ZK+y+hdhYn3EmLY
	 0TNhVNo+fTLbLYQcFJGD/BCz4/fwCil5Qe+2z+FMBUhNJj9Ih+2fUOAscAzXnNaOeG
	 tn8IDzbb0205hCfEqIIalNz2dEGDvoXvpIZVySK4qpOVMfRIzuwKPWvdjhp0F6buBO
	 0mHqPGeUxfC1KbEP1G8HhhwKidkXeyRko+fpoab6x6s32w9h/uLvCkB3kP8pO7UpPT
	 ZziXOWTUF0bPcPz0LTD8bFOjaPdbqg+S5wrnkkAkQlmw9OS5lJMe8tU3J0HDuKzL/Y
	 NPMVyKHUfl8UQ==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, srinivas.kandagatla@linaro.org
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Manikantan R <quic_manrav@quicinc.com>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: codecs: wsa88xx: add support for
 static port mapping.
Message-Id: <171994339579.996226.3049749876359199381.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:03:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 27 Jun 2024 15:44:37 +0100, srinivas.kandagatla@linaro.org wrote:
> Existing way of allocating soundwire master ports on Qualcommm platforms is
> dynamic, and in linear order starting from 1 to MAX_PORTS.
> This will work as long as soundwire device ports are 1:1 mapped
> linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
> are NOT mapped in that order.
> 
> The result of this is that only one speaker among the pair of speakers
> is always silent, With recent changes for WSA codec to support codec
> versions and along with these patches we are able to get all speakers
> working on these SoCs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: wsa883x: Document port mapping property
      commit: 49beb4d2e85634ec1e1c82d76461d9552676045d
[2/6] ASoC: codecs: wsa883x: parse port-mapping information
      commit: 1cf3295bd108abbd7f128071ae9775fd18394ca9
[3/6] ASoC: dt-bindings: wsa8840: Document port mapping property
      commit: d47abee9fede21b19d5227061c5a8761ec1659fb
[4/6] ASoC: codecs: wsa884x: parse port-mapping information
      commit: e1bc5c324bcca3acdbe817ccbf9aa7992d89479d

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


