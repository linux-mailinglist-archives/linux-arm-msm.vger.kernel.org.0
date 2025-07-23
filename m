Return-Path: <linux-arm-msm+bounces-66341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E7B0F867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 18:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31971899A24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D51215055;
	Wed, 23 Jul 2025 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Awaqrjy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC91FE444;
	Wed, 23 Jul 2025 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289338; cv=none; b=Z0vi6hY3rMoAKI+oXWtEwEZtUrlDa6xxkp5ENK7qtGY98reNStAPQ49GWRRe7TJbmLajPNvZlHuWvbSDBi0MsH+G90/SvbDjfrjLg5dttmyuiwPS2hNKxXqFycfufMHVMDJAFM81/Sm9dLpXmlpRKFhqkUZwmVyanggw/xrkFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289338; c=relaxed/simple;
	bh=w0B+2dVvjZ6/2JfehL/19FZ9dstC51Jmz5fKFmGhhSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CalSDY7VngWs1/fsGuU9jWY//lr9av/Liuh1K2lAPY3XWyZUU5GpUkASUm9oh/peVoZISLm2cUZwxdst7anMxwqzYdTqqFsXhv55nbEPorY2ChOKUQEAmuwyBAolzNNDlYx1j6JA1V6zviBcRmeel6fI1GNBKw/SYVtNMK78Nss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Awaqrjy4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3BCC4CEF8;
	Wed, 23 Jul 2025 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753289337;
	bh=w0B+2dVvjZ6/2JfehL/19FZ9dstC51Jmz5fKFmGhhSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Awaqrjy4HmOhGMjBtMnOXF3kJJtR3x4CjxlSc6olYDKKC/Go/8pnhGB619XmInTcd
	 xeMXlxkYl/V8XuuK5B8drGIltikcvnI1WN29nn9RUwYJ9ZvvAxuX1Z3p0VA9sl9f13
	 dnqJKHoQQF7fx32LEXccsw+dYhOkxmufPCQRgAdJ/SPYpZdUBs/do2h+IEmajcyDHM
	 Kvo8CBnsQ1mYmIOK9jX6Zc+pkxYZx+me3xgvvle4WS48MClhDGxJZcc+mXsH4XlvdE
	 /TaAH0pclLVfPxIapeWKAmqI70RCkzMPLipbunnf5pqIR0u5iCWZGMZd8VBHKksk4e
	 hUtyhTQa5ULUA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
Subject: Re: [PATCH v3 0/3] Enable USB audio offloading on Fairphone 4
 smartphone
Message-Id: <175328933413.84720.17376811405962157319.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:48:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 23 Jul 2025 16:03:37 +0200, Luca Weiss wrote:
> Updated description for v3:
> Add the missing bits for the sound subsystem to enable USB audio
> offloading on the Fairphone 4. This is mostly sndcard enablement now.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
      commit: b102c9d89fecd72be83eaab9b384285e2d0dc940
[2/3] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
      commit: d664e75317e19bb79b6d207f7729e35eca504a6a
[3/3] ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
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


