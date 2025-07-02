Return-Path: <linux-arm-msm+bounces-63418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60864AF5BC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 16:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9DC1C4410B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 14:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75D930AACA;
	Wed,  2 Jul 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psjtlS2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158D30AAB5;
	Wed,  2 Jul 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468020; cv=none; b=tIx+bK2omLylFPLUWpvUIvQzfsflZQ36KzXmL/ipvaCRG/tL0qq/QuJO8MyydugW/azADFIXFyUi49RBTg0V1TRww9I8UHiMwKq7qlQoTDv+NK6CDhSu7cSYgHK7nLF8379TnAwBzuD9S/Vqpqyy3YfNlCxcg6tujuSAoodGYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468020; c=relaxed/simple;
	bh=YB+SqpHJK/1OIVhZqx+TQHSDi0rUKrHSsi1YuF2D9c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M1EkmaR/j4vgE/ZCugR83n3YIr585z8w9KmDy90Jf7kfghArDDWhbmA8M1m9vlIcrDZZseMbEkHDag0r2aDeFQhggT0IQN0WZlXohyBRcJXx2z56QVYu1LNESJV21/Omvn2/d8x1rElWDvYL+B2dNkI5jqnRnb5EnvQCt+2sgrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psjtlS2e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FF3C4CEEF;
	Wed,  2 Jul 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468020;
	bh=YB+SqpHJK/1OIVhZqx+TQHSDi0rUKrHSsi1YuF2D9c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=psjtlS2exQUV1FflYSGUEdM+ELbGrJXtQnnS3BYUJMzovaoPoAgVcdNR8Jq6B0iiI
	 MlJD2yH3V8/SJnwICIv/s/FAwy6WuttwOUcGtgHklBxDeD9i6BmP6/FSQSZRatdaUg
	 27n9AljlL7ZmXrzFglDngSQfeiO2F6TSAnLNf7Yyj9YMddE6TiBuhalC/80x8dcOVm
	 LH3c0GVtdeksrTFfHCfTrZgGBnZSeKz0BWRkeu+MLJXsKTl4CON4ndkb5inOG/DlD+
	 SYT034zlDwtd2oRjGNQ07r9sAgWPzwKHDoBwdbOSb2+uNq5O0JKZNIT2qDgECXJFaw
	 MFMmqLaxQEkPw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@oss.qualcomm.com
In-Reply-To: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
References: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
Subject: Re: [PATCH v1 0/2] Add sound card support for QCS8275
Message-Id: <175146801653.192310.9791150746905326384.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 15:53:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 01 Jul 2025 15:59:13 +0530, Prasad Kumpatla wrote:
> This patchset adds support for sound card on Qualcomm QCS8275 boards.
> 
> Prasad Kumpatla (2):
>   ASoC: dt-bindings: qcom,qcs8275-snd: Add QCS8275 sound card
>   ASoC: qcom: sc8280xp: Add support for QCS8275
> 
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  sound/soc/qcom/sc8280xp.c                                | 1 +
>  2 files changed, 2 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8275 sound card
      commit: 3b8dc31715e31ab930d36ef7b98ffc714344e411
[2/2] ASoC: qcom: sc8280xp: Add support for QCS8275
      commit: 34d340d48e595f8dfd4e72fe4100d2579dbe4a1a

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


