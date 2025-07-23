Return-Path: <linux-arm-msm+bounces-66340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8598EB0F863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 18:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8B216D150
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40F20B81B;
	Wed, 23 Jul 2025 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKRPkjjk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBED17A2E8;
	Wed, 23 Jul 2025 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289334; cv=none; b=rfCT7/Cm9eK47Zo9YW5n1NPljLVntIfV8jzZ9txW24x17ou5CJiw34CYaFNF1E6xFnJKxLDfTg7hwncU50DEKHaAZh2KdGvS9ybSucdl2CLhew3U+XHssooa85F+1Tgq8BORVc0Mi9LREScApxMK24m5ti1bRp+xe2/89GNkZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289334; c=relaxed/simple;
	bh=Tv5MXYJWzsY90WmBLspDcy0thO2AOlGxw9qBnGijwJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tbQpaxMmRaGjcUOqOAfiWayj9varu8JqAI531hUFCFRHw6/IJP3gViKhNasaPJJ9kuLzBDIm/q3rG0YFlsufRnc7jNBuMu1cqJALhKUMmmU8o9bNWJxtq4X0dY7y5OARlco9OK48taLKIjGDVhgSupB5Azz/U9V2DdOxNJc04gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKRPkjjk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBF6C4CEF4;
	Wed, 23 Jul 2025 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753289333;
	bh=Tv5MXYJWzsY90WmBLspDcy0thO2AOlGxw9qBnGijwJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DKRPkjjkzFN7HHda4O+bD3mLMfc2IDdfyATq5ezaULle8jZ4S9pOqLCrBJDXiyaGc
	 zO7ZJ41b5AMIAReuhjx5UP9XqTKluma2VBqUfTJDECXZSkvzx9mBt7QQxY/tuGYlW+
	 BIaOqu62RkvWY+WWqjBHWgqmfBVV0cVgJ3Bq4pyqjc6DAn3++PG1c2clZA5HMFX0bt
	 joBUmrDsugiYAyFNtOIfdeL4pzT6VbmKZz2+tFntKWHuJskFg4ljVoUnQ7sr7FjjVS
	 Dn3PXCZx5SY++TtbLPbmwNQADo7WYLZSZfDuqi/Zx0FapncOLL/JcKUUfNjtr/VET6
	 hJNqXNFPYD+Sw==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
Subject: Re: (subset) [PATCH v2 0/5] Enable USB audio offloading on
 Fairphone 4 smartphone
Message-Id: <175328932957.84720.16658134148834686492.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:48:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 01 May 2025 08:48:46 +0200, Luca Weiss wrote:
> Since the series for the USB sound offloading driver was finally merged,
> we can add the sm6350 dts and enable it on Fairphone 4.
> 
> A few devicetree binding bits have also been missing in that series, so
> there's some extra patches for the basics in this series.
> 
> Depends on:
> - For qcom,sm8250.yaml & sm8250.c:
>   https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com/T/
> - For dts:
>   https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
      commit: b102c9d89fecd72be83eaab9b384285e2d0dc940
[2/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
      commit: d664e75317e19bb79b6d207f7729e35eca504a6a
[3/5] ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
      commit: c58c35ef6ae62e36927f506a5afc66610b7261d9

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


