Return-Path: <linux-arm-msm+bounces-32964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23698E24F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 20:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89FC8B21BD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 18:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6147212F0A;
	Wed,  2 Oct 2024 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeKlvi7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C171D1743;
	Wed,  2 Oct 2024 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727893351; cv=none; b=C4DjWUXSuWn1dyhZTZmu6eLFLADy8Oik+WQ4mHCMsEwx/5hjog7SWQzMFTVNc6zuvhF87a+7dB1zowMc+n7PFYS0gsvOxAGo001PZAaCXuN56Vnqv88aZGh7DSMZw6msmbLOlPF2ieOYdPEVCysENT4IBTbW7D8NV7Df4+ZZ/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727893351; c=relaxed/simple;
	bh=vrEwO142Vt6SPOAdlphqDikIDAg1+nVpkIbjIETDyC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQenfIjDbs83GCTww/LdyRlLKjvMBdWzVf4Wjp2/TK6LiHbjgn/+tDDlJK8aVQTaikInW9PUdhYB1o/9paj38ekj0x/3R3KFcYcuss1wun0/mAHJWsQVzx3QtHh6le4mpRQPN+p5znYzH77szXiWAfZOmd3/r72NgfbGq+ahKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeKlvi7Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7437CC4CEC2;
	Wed,  2 Oct 2024 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727893351;
	bh=vrEwO142Vt6SPOAdlphqDikIDAg1+nVpkIbjIETDyC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HeKlvi7Q7CEwPk/CifDRD2PjgNdtz7KGMKKJHrKkui4OM6lvXfno9FXsyrMCSztTQ
	 tWKDI2w0xO2Oqy8oaQv31Go61tlIK4NTmS//ms5jcYwEWcAXTdvNY/4PFbfWoOjgeO
	 Ny1gR62gaQMYvsS8orTxh1pshkKMhtP+gKjQh3bsnaFAT/411n67Jrm9ipZoeaUdHi
	 uoxZ5KF94bXG9Cmkgzr1kar2dlkD+Xcl2XlXp8gx2BSeTVYRYK4K5VBxeMITs4QIJf
	 X6ZFjtDiqnDHlmVQJsacmIFN/vQd3jlolht/ECqAnD1SXnjLg1aIMuPnyhTPfbmkvi
	 VW0e0bIRSRf2Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
 bgoswami@quicinc.com, lgirdwood@gmail.com, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, perex@perex.cz, tiwai@suse.com, 
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, 
 linux-kernel@vger.kernel.org, a39.skl@gmail.com, 
 Konrad Dybcio <konradybcio@kernel.org>, Alex Elder <elder@kernel.org>
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Subject: Re: (subset) [PATCH v2 0/7] qrb4210-rb2: add HDMI audio playback
 support
Message-Id: <172789334720.173380.12816331564584587389.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 19:22:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8

On Wed, 02 Oct 2024 03:20:08 +0100, Alexey Klimov wrote:
> Rebased on top of -master, tested.
> 
> Changes since v1:
> -- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
>    and disabling it causes audio delay on playback start;
> -- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
> -- moved lpi_i2s2_active pins description to qrb423310 board-specific file
>    as suggested by Dmitry Baryshkov;
> -- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
> -- lpass_tlmm is not disabled;
> -- lpass_tlmm node moved to sm4250.dtsi;
> -- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
> -- added some reviewed-by tags.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
      commit: bbd1e5ea66f6ca88624faefe0a153637f53ad15d
[2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
      commit: b97bc0656a66f89f78098d4d72dc04fa9518ab11

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


