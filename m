Return-Path: <linux-arm-msm+bounces-25902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D72D692DDB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 03:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85D3D1F21924
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 01:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB138F72;
	Thu, 11 Jul 2024 01:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnITX3Ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF6B674;
	Thu, 11 Jul 2024 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720660246; cv=none; b=IzmSqlz+B9byiPOJRYtWl1ow04ui0qxonKqWLIGCrsHypO9Af//aidmaERxl3mXXRn/lzRqVmuiozA5aMu5D8mmOHEPwf7JU3wOlB2tw3lqyGciKJS5gqHk28eZYDyWktHgJB6r4xL9FTeBaUiNI0hWXAqABXtk3kDbtj4wGjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720660246; c=relaxed/simple;
	bh=4adTuxbDi35JH0mF6nibIf+rZaUnp1ZHEwRyH+5+8PI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LHNgDJARQc9EBBdaNMKc5DDhH0tIXnd+xVpdnN9Lg01gx2DX6agmeCEX5rbpTf/kZARNl7ypbUhxwGEwNakCVFmzGxzIpo6xDpLJTakIHpHSnufkIMxoCc0LJ/sxVikE4nqCqa0wPZGsn+lKDXuitr/9B97eJUFeVaHwDlu8W6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnITX3Ag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F76C4AF07;
	Thu, 11 Jul 2024 01:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720660245;
	bh=4adTuxbDi35JH0mF6nibIf+rZaUnp1ZHEwRyH+5+8PI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CnITX3AgLGKOxCjH5CBLtEW5HAngIKzDD9FF+XtS46V2CsusfOu98wN2mxuDbg87U
	 RCDyDUcGDG+Du0JpTyAo4VgKe/DDEAe/lSMRQ4c0+U13DSCwuHkLVWQo2xMthg3ObN
	 uf0lmxAAnoFM1j8IYOHa3desJnc35uWDFzPwbTYXVx6G6gl7GcUkuJh+sgNQaypWE0
	 rhF1vDWEoumZGnP/jOufzNTdQqa/akzJSTyAHtNI1a2SLx7ecw5z1yH+mtHz2q0zyi
	 ZTg2K1wnyZc14smU0qqpXKO1VLJZoDJTPkhWDjshaod3t8LjmWXjiaOHAh8n8PjY6/
	 /CywQyV+yxlTg==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
Subject: Re: [PATCH v2 0/2] ASoC: dt-bindings: convert qcom sound bindings
 to yaml
Message-Id: <172066024227.393700.11903720765661169490.b4-ty@kernel.org>
Date: Thu, 11 Jul 2024 02:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45

On Wed, 10 Jul 2024 12:36:05 +0100, Rayyan Ansari wrote:
> These patches convert the remaining plain text bindings for Qualcomm
> sound drivers to dt schema, so device trees can be validated against
> them.
> 
> v1: https://lore.kernel.org/all/20240709152808.155405-1-rayyan.ansari@linaro.org/
> 
> Thanks,
> Rayyan
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
      commit: 054ac9c97c7d9eb55f471fc6f019b654d17332a7
[2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
      commit: 3cbda25e2db28b4352c73d4167f0dab10049ea54

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


