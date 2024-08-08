Return-Path: <linux-arm-msm+bounces-28198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923994C670
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 23:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C171C2205D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 21:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FC615B98F;
	Thu,  8 Aug 2024 21:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnDsAlGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82A15B561;
	Thu,  8 Aug 2024 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723153622; cv=none; b=iwtkWG3rmCo1gz4FkUSMOehKQnSzvkv11M9qRDWiffnZlN9ZtQKUan22e/CZFc14/dJ3TzSAt/XgnqgKGJYTkZrpPvDFbk1sZf5xRvc6mQhopUsxAMKO0SwRgG+/gM8KKFaK7mOl/y3Cu1tXh4gohtGxHogFh8pHZIQHFvz+lFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723153622; c=relaxed/simple;
	bh=4qDVAjJfZJck66hTltxpHpYd6rfa84s00JWu0atPoDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GE8EnyG3T+rgSwL4IwuqLYvXPqxaPr0ygygZilpYte6CVkXbYRUF9uJ2OWPbMPyguFPkCkMNkAsYn9Y6WjF+PIvBcq/rh9bZP4hsipx9Y9rQvTyPTp35P/P/higzOmO9IhdhckRrBav/TnRlTbYBjyJQwt8t0vbBMEBwlXc6Lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnDsAlGR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62D5C4AF0C;
	Thu,  8 Aug 2024 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153621;
	bh=4qDVAjJfZJck66hTltxpHpYd6rfa84s00JWu0atPoDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XnDsAlGRPM/2ZTTer/eUU69MDS2XWj6RVEI/S2Q5jVPCjGHSADI7izX3KPyJrLWPf
	 nd5QNC2584o8dsyCcGgRkam5I67qT6G2zO4qE4BwNfa1/lyeGvA+jz14R2QGR/GTaJ
	 M0GoOrne1v5aDNz3YZzz8tKt9MOyBQ+HxhUKcI1cbwIG3jxQfZmVfVZhe4pk+zGcGj
	 Et88J0b1EsujTi4sDFvKoLWV+1UaV7LLKrz3qvHuZckWLGKKH8mGerXntDmbUhxRVT
	 nGsCbGcI8ENlfRl2bx0l64ZtJVad85d2R8SvT6EBqvM0TdU2zGyh3fdyws44iHV7OC
	 /9+0fKuTDjpkA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset
 GPIO polarity in example
Message-Id: <172315361817.480667.1573735001583504478.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:46:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 06 Aug 2024 13:49:28 +0200, Krzysztof Kozlowski wrote:
> The reset GPIO of WCD9370/WCD9375 is active low and that's how it is
> routed on typical boards, so correct the example DTS to use expected
> polarity.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset GPIO polarity in example
      commit: 2f3e2c9eaafc272266344d777f8de44f8632e247
[2/4] ASoC: dt-bindings: qcom,wcd934x: Correct reset GPIO polarity in example
      commit: 55922275702e112652d314a9b6a6ca31d4b7252e
[3/4] ASoC: dt-bindings: qcom,wcd938x: Correct reset GPIO polarity in example
      commit: 871f1a16fa3506487de24b05d68be45e9185e77a
[4/4] ASoC: dt-bindings: qcom,wcd939x: Correct reset GPIO polarity in example
      commit: 81f88fddef9cddae6b4e5d9359022c7a2a3e3b6a

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


