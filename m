Return-Path: <linux-arm-msm+bounces-24160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6A91724B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 22:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3A4282331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3014117C228;
	Tue, 25 Jun 2024 20:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hs/cDHdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E8018637;
	Tue, 25 Jun 2024 20:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346245; cv=none; b=npMrwNhu/j5gy7fTGZJWnOBd+wrpn9+FwaskU6RlIWI4A6GWBYQ+HSxyvLAq9zLdqxe5AximzbHju9sZIpBBaZSMCbB77Z2T8efdrs0bF1jfbSNdgkYdIIwhxeUEcPsOiam0DKLxmFXl/iXAOR1j17RrotySELle9qZbut6nw7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346245; c=relaxed/simple;
	bh=OHuNuVjqW1MgOu0CHLh31MnZvZNSL0S5UJ+5Ixi7jJ0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qOiY2q+Ng8JigAVFSouqFhB+rXc45PMwy+otQZnxwMbG8aAXW7yelRXI4x+hAWFAsBijjolXp/BtximVWK4uMIV5+/suVygSKokiq/Y+jyumw4thpOJN4dFOx9BfphZGyhR6UwPXiIUblgkRE8K3NA4gpcA0VRob0yqHW0gQ1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hs/cDHdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8C3C32789;
	Tue, 25 Jun 2024 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719346244;
	bh=OHuNuVjqW1MgOu0CHLh31MnZvZNSL0S5UJ+5Ixi7jJ0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Hs/cDHdGc7kqPDr8+uP3zhY2h8JsF1CfeuuxaPJXfz1xhUpibbHvXAm7+pdNv0ggS
	 kZp0E26jtQZBefXEEs1a5+C6avaXFnh6sPqZOG5DPdR2lC0XPqisSYxgAnExconRMX
	 XaE6AsIGHEqs7Is3hyWXoHiRor2dgWzzY6lM7f3cz2f33egWZ4v04P7JOPDl34eUsG
	 WUpEqX1DHCk8bntHjzmDIAtNQfdZrKyWEfES4z3J/zQAImFXjIb7Pypl3f5A4zyJZW
	 QV+KAMCC38ksp1lInfFCMo/hPfTfvdsapqU7D67EVxhWnVTLOc4LJaoe8H11C27ERn
	 FE7Dglv5j25CQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
References: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of
 v2.1 codec
Message-Id: <171934624243.1243504.8133552176483235259.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 21:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 25 Jun 2024 18:06:14 +0200, Krzysztof Kozlowski wrote:
> We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
> so handle it as well in all switch cases.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: add missing handling of v2.1 codec
      commit: 903e85093670c3e1107980b5e5a718682458f316

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


