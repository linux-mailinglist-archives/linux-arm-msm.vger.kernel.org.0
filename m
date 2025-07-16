Return-Path: <linux-arm-msm+bounces-65301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22241B07A71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27AE93AC055
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B99C2F49F1;
	Wed, 16 Jul 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sw/z8ivV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB701D5CEA;
	Wed, 16 Jul 2025 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752681412; cv=none; b=dm9dum3/6IKnoW5DnzHKV4LToHxSF/CJ6xDcNyu28+ctUe4ta1iRYjyl1okQriFGkjGsk4WY2tLbueojUZOKO/bkPUZjHB5psbD8hHAk0IkzLP8df/o+VlcUJ7+pBAgOe10JOX3Kow+2W8V70SXR5QLLF0vatkdIHdqT22XCn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752681412; c=relaxed/simple;
	bh=j3TttxUjfeEIYj/27r+70TqhavnZm9v8n1qfjW7IrTk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s0d6Q0DUIAeAwXHtg5YQP9PZ3nEW8qqHWuCF2+j/UJ+HK4Q5XgG5g/mypKgf1kQ8N28DmRW5NgOZOMJkVxMA7IWy/5/le4Ub8pjnZzTPj5aXXRqxzQeayINCqDTF4u/v1jMgTUjCbsVflNelpqyPT6f/HqO9tWTZBVnrvi6KrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw/z8ivV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8AEC4CEE7;
	Wed, 16 Jul 2025 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752681411;
	bh=j3TttxUjfeEIYj/27r+70TqhavnZm9v8n1qfjW7IrTk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Sw/z8ivVd6dq7SnuhQl9WjoPlHY5E+iLdCym7zhxlRodGfvUeWo+jwloXfYciB79v
	 Q9OBCRnKRAUGkEllf9Dr8fOYdLnnQVohb9VInbBlOCCpoOg0bSNLPkV1eKhPD2UYjX
	 4D4Ts1DMeErL69i91RV0Ap+fz8KmOeMfLHBpRiHA6tmohh725iQUbZzjhZ9V68SrGa
	 ei5A5brpxFA77NAgfssDN6WtJfZ4u7Aw4kTS6tN91XNXPfj5+xaLatkjSldeV0e3H9
	 SfA7z51DWHVqQ1oQqYVCBsdAt+Go/5R+T4dvmKLvJ63y3/601o1jYHPJC/29DyDp7z
	 wSctUd8mbuD7g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250716074957.102402-2-krzysztof.kozlowski@linaro.org>
References: <20250716074957.102402-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,lpass-va-macro: Define
 clock-names in top-level
Message-Id: <175268140929.726552.6903010373670247326.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 16:56:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 16 Jul 2025 09:49:58 +0200, Krzysztof Kozlowski wrote:
> Device variants use different amount of clock inputs, but all of them
> are in the same order, 'clock-names' in top-level properties can define
> the list and each if:then: block can only narrow the number of items.
> 
> This is preferred syntax, because it keeps list unified among devices
> and encourages adding new entries to the end of the list, instead of
> adding them in the middle.  The change has no functional impact, but
> partially reverts approach implemented in commit cfad817095e1 ("ASoC:
> dt-bindings: qcom,lpass-va-macro: Add missing NPL clock").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,lpass-va-macro: Define clock-names in top-level
      commit: aa84580e058c4d7567b2a5e5a9d12f94af75d297

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


