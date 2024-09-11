Return-Path: <linux-arm-msm+bounces-31496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07D97509C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B3E7B25B44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9E1187343;
	Wed, 11 Sep 2024 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="entOCY4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675F186E54;
	Wed, 11 Sep 2024 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053372; cv=none; b=cAdMQ0sqeSaAQifH2iudbuCnPpNH5yxP2VC7CtIeZtrYXe4WdP2UsbL5oDaZaYYmxgOJ23uwX2Z62XFwm75YWfYmzxoNyCqHakaxOjGkJFyldx9aNbmvDELz6f4oX1az+ADzPJQtfGYkdICyoqZh5g7C1/d7J0bqr7GrkGYrKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053372; c=relaxed/simple;
	bh=+9YGffMsMXeBQxGd6pj0nRY4lcme7KcL7cz/QhK3qLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JjEPODcnCvTRijWsd/6i/uU06yIkjvdj3MmZap2v6VKQZoEb5o/AVS5kJesH88ZM/WXljdOncK29Z1wzj0Tt8unAnl157N7pqTQDVCsvle8+ENHogjqYf7HTWFty42f4PxExTbU6dnGvuxxComGrIMENytsL3/5QONh+2yOyxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=entOCY4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E99C4CED0;
	Wed, 11 Sep 2024 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726053371;
	bh=+9YGffMsMXeBQxGd6pj0nRY4lcme7KcL7cz/QhK3qLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=entOCY4gxiGfMjOTEplOiIV50YZLhSpYJf+hbp+c1rABmMT8Fm3JOA37NN6sWNVre
	 ZiCQyRkTnBvSabXXl/xDp/6mq3TS0GUp1aLmuKqBStcOE7TqXw4sa+CB/JISz1ETQr
	 KFYuSXdZsPegF4t0jD9fPEAkk0/QC2+6SVNucBtB9RHRtfNUs2XviYE2KnIyQ9doVQ
	 g3l5PnlzSjHzjd6WinytjPvfuz127sPh3yked0uNggqBaZAM34i2cKmNXIJoI5O6Ed
	 qumfgrZmbYVV/a6/E0G4Y7eAGiTKQCNnZMpPikXvcJ8LoUwRMGfwuJ8eZlDF4nG1P2
	 JoHwd/2hQ86hQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
Subject: Re: [PATCH 00/17] regulator: Few constifications of static data
Message-Id: <172605336975.30061.1450890402175817381.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 12:16:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 09 Sep 2024 15:51:11 +0200, Krzysztof Kozlowski wrote:
> Few cleanups (safer code), built tested.  Last two patches should
> probably be tested.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/17] regulator: da9052: Constify static data
        commit: 9653007e7d878609be205ced4803ca57be341845
[02/17] regulator: da9055: Constify static data
        commit: dfa9e708c63e7833c61f551069d3ff4b03af7895
[03/17] regulator: da9063: Constify static data
        commit: 0601c1e5c4a1162c909675233645889237b003a2
[04/17] regulator: da9121: Constify static data
        commit: b3f1e8e32ef579907fe0c0c9c102bb13883454d6
[05/17] regulator: da9211: Constify static data
        (no commit info)
[06/17] regulator: hi6421: Constify static data
        commit: b94afa51cad448d7d9bcb600ce267153132369ad
[07/17] regulator: hi6421v600: Constify static data
        commit: 5ec424afc95ab2490ae28b3e7756e6e9b271a5f0
[08/17] regulator: tps65023: Constify static data
        commit: 7fb636dc26d6fc532fbc96fc74847afedc128154
[09/17] regulator: max77826: Drop unused 'rdesc' in 'struct max77826_regulator_info'
        commit: 653976707d03f9c8e07f1c7733f27c89a1d5eb1c
[10/17] regulator: max77826: Constify static data
        commit: 96d7ee7cb01203ae0b6078631738754424d89cf8
[11/17] regulator: mtk-dvfsrc: Constify static data
        commit: 90b94a05b6cd54b6ae65d09df86d7b602a228ae1
[12/17] regulator: pcap: Constify static data
        commit: 7f1bfca46b1524a774d03eccd8042935c453843a
[13/17] regulator: pfuze100: Constify static data
        commit: 6f4fd2b8a5c08656d293ed491335747ff3d34104
[14/17] regulator: qcom-refgen: Constify static data
        commit: 7eb5d065ec6725d7da9a4f7ba71b6ff4aaf7eb42
[15/17] regulator: hi6421v530: Drop unused 'eco_microamp'
        commit: e9c7ff34c26d009c2f7c3d51236ed5a808dbc0d7
[16/17] regulator: hi6421v530: Use container_of and constify static data
        commit: 7dd36b3287182bc889953f7741bdcef037109210
[17/17] regulator: max77650: Use container_of and constify static data
        commit: c4d6a804713ac080841d1711a98ae1a6ecaede38

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


