Return-Path: <linux-arm-msm+bounces-37378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C29C2953
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 02:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1395A1F226B4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 01:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D47B200A9;
	Sat,  9 Nov 2024 01:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlD3jwbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEFD53A7;
	Sat,  9 Nov 2024 01:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731116921; cv=none; b=Nk8JrcGRi5mBJxNqOibpUjnE0VmWivp68nZNKmSPNP12ydTQ/qAx6/2t7nVMJLILmf44mLeGn10E0hygVWuk2XSwyxWr/X7kf6YWX8DgIy/lgGlm8pVRaxWhisG0HCAVyGETMu0iwgx2at6MrC/i7tGuxUtz3V7b4GH25YvoIKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731116921; c=relaxed/simple;
	bh=hclgpLx1u2thY5Z106IKKLi95qjbn5TRUXM80nF2DhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DAiw4/dlJLghUrD9lzgr5vLmuq1ZgsPM3hkgRO/BiC/ksaPIrQWOa8pSSsvhqTo6eGkYNmoecsSvbbD8/zzL7FYbXFTL/xBa+ZCawMfI1Ur7Lr3CWDw+a9mePlyCdpzFnbTAr8H4a5MKDuklMIdgv1clG92DajeORC5Nz2ZgZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlD3jwbU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A569FC4CECD;
	Sat,  9 Nov 2024 01:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731116920;
	bh=hclgpLx1u2thY5Z106IKKLi95qjbn5TRUXM80nF2DhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QlD3jwbUPMhO0wAmxenZoBqw4+Iv7j8dLfsMK7H5PIx/RPu9Aj8ZnLwvgfN43KDaI
	 +5t9l8KLlPt4+QSXCmrpjUnSQqrBM5Mep7BGsv/bBEudHkGL7B5f8c04qwdH+a+CCQ
	 ++7RfQSiYMNtSS+mPa+yh7oZhFQX2WbVowoIa5ek/O5tUVBsl8gAZIlZX9k6tYbBma
	 N2cVM+c+nrgVN4EWSOA4HWBHus+HDtUpZT7cY+NQOTpPZTh+2nlDuMo0lQTkeNfAYT
	 +nr/iw0DRnj8uwTJgtPu7xVeTVm1To1ANHJ8ulJjI+0A8HS3J7lMK/oTvMvyf5ZoeN
	 KEGReDo9Q+Ihg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, 
 linux-kernel@vger.kernel.org, a39.skl@gmail.com
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
Subject: Re: (subset) [PATCH v3 0/5] rb4210-rb2: add HDMI audio playback
 support
Message-Id: <173111691639.152465.4987333033665920086.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 01:48:36 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 18 Oct 2024 03:54:46 +0100, Alexey Klimov wrote:
> Rebased on top of -next, re-tested.
> 
> Changes since v2:
> -- added tags, updated commit messages, added Cc;
> -- updated LT9611 -> LT9611UXC comment in qrb4210-rb2.dts;
> -- updated addresses in DT to 8 hex digits as requested by Dmitry;
> -- added lpass pinctrl to sm6115.dtsi as suggested by Dmitry;
> -- added lpass pinctrl override and pins description to sm4250.dtsi,
> pins are the property of sm4250;
> -- verified with make dtbs_check as suggested by Krzysztof and Rob's bot.
> -- dropped two patches (they seem to be merged):
> [PATCH v2 1/7] ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
> [PATCH v2 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
> -- stopped Cc-ing out-of-date emails;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: qcom: sm8250: add handling of secondary MI2S clock
      commit: ed7bca5b2b891caedf2ed3ffc427eba23559da95

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


