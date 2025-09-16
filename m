Return-Path: <linux-arm-msm+bounces-73705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB5B595C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 614A37ADB75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6256830DEDC;
	Tue, 16 Sep 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UX4EWgXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3206530DEB4;
	Tue, 16 Sep 2025 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024531; cv=none; b=o1KNE++Bn0IyjXI8Rg5G4RwV8CIEP6roc2lopqe7WtUWul7A63YxsG2uWNLeEeO96/Z3MzxZVxVRNN8LuPtm8wmYRcQOQFOo8sNR5XT/e8F3z+FCXdLAzw2RMkWKihhPM36vRC1Qq5p7yG5wTaUJLDDg/tW2UvLquLcIMIw7b8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024531; c=relaxed/simple;
	bh=lroRgaiNQjTEgIzOrH59+2moAsgRYB7bHRVnEv4zEs8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E1qWNEwcOFk9XGfvNeuJNdGNaL+1diAv6LdwrAOyMFwdG1/vgzssc0NYbGOq+vsAIL7AldiIIyMwVBn2XBpI3oYtCWSl9RKj//dEiRE17txnshlgaq5MUDwdPetPpu2jfHAEzR9OjPpAqc6+CWuHWEN0SDXeOYqj0e+SNQNXHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UX4EWgXH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD60C4CEEB;
	Tue, 16 Sep 2025 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758024530;
	bh=lroRgaiNQjTEgIzOrH59+2moAsgRYB7bHRVnEv4zEs8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UX4EWgXHkfs9xl/c7N5Nw5eHl8xYqGwEIjGbFUF7hUx0/GVRQ1w36cVWwGh/Oo5mt
	 ZEyDDiZ1iEfURMWl6fGz8+7j6Fk0wgrQarP9dbqTPNxnZgkDTM/c7tIjtZ9xhNrwaN
	 +HcVW4ekMLhCXUFr8dSc5lY0/p9JD4AS7LxwADEKoRkXQrfK2XOBK/JLC/7+/WJIdr
	 sl7RvZLr6wjy9E5V/HdGYMSDIvX6DMD0Vc6Swk6rY9OyHqw4AdkEtTkxBLsQ4NWLcT
	 rswCJ/jci0iW4I9wZ94xwZyhlZK4jJRq5+Y/9cA4+fqtVLEMh0vBS12QKu/wAJRmUR
	 EXlnn5gCU0XLA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com, 
 prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com, 
 stable@vger.kernel.org
In-Reply-To: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1] ASoC: qcom: sc8280xp: Fix sound card driver name
 match data for QCS8275
Message-Id: <175802452817.111062.2711141246036859762.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 13:08:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Sun, 14 Sep 2025 18:45:49 +0530, Mohammad Rafi Shaik wrote:
> The QCS8275 board is based on Qualcomm's QCS8300 SoC family, and all
> supported firmware files are located in the qcs8300 directory. The
> sound topology and ALSA UCM configuration files have also been migrated
> from the qcs8275 directory to the actual SoC qcs8300 directory in
> linux-firmware. With the current setup, the sound topology fails
> to load, resulting in sound card registration failure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc8280xp: Fix sound card driver name match data for QCS8275
      commit: c7a321e4e90e1bd072697bc050b9426e04cffc6a

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


