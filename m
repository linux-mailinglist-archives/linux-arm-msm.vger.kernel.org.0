Return-Path: <linux-arm-msm+bounces-86286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9302CD848F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 227893002145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 06:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A237C2EF662;
	Tue, 23 Dec 2025 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYsmq4S/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A927979A;
	Tue, 23 Dec 2025 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472424; cv=none; b=uoN/UNt/o7Z3J0C6EjVh1CH4mlMOXPkztomnYLOpWeuJdWMHGOxBpIzfWLaj5o246Se/i+L9r57hHyMDqzz06TiSd2AZK7/PkcxQoxNcncfYSS57fBjyF79f7krAQU4sg5m0w5+1D3jSW9Ikhq52cJbCiPLS3gzix6+0ZaY3Dyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472424; c=relaxed/simple;
	bh=cFge2vlhRMUIT0+8omY6uD5N3ir1Dqt5yv4+Go+gKIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tp0WAQdgvOHsGAoDA9j0eZMU9aceBvaMcdbJVj48x9ACBTW5Myfr/UOVOM04uYDygzgdMaurrOp+b3LJ4IpZepu5EOJNSkZXVZ72XlMN56JIUZ3voxzYIY5fpA0vhyAmHwHIt34sfBQL2/omQx/nT0o+G+6XddMq0vHYe0CKK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYsmq4S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E06C113D0;
	Tue, 23 Dec 2025 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766472424;
	bh=cFge2vlhRMUIT0+8omY6uD5N3ir1Dqt5yv4+Go+gKIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SYsmq4S/jItHU1UXU6OPNhYrB/JlZgo1Ob6jUMaiqlpbfpA8XznJmc98a/0PYt0rB
	 i/j52FpXCJBawC8qAG0oRbsevlMiyYh5CwPjgrHW0/mpSh2taySZgkzWzGc87cwxq5
	 LiByC3dG2insA69vLpt1MrWKoub3quFLLf+9EoAJyImEMaiyT75ewvuMvqIAQBnFAX
	 wh7Q7UBLPbfelviC/YzH/SNdlU/Pz4qN/VaTR0EXvuVXR/U8ZR9q5GpES/c7GeJD2T
	 pc+cVwDu/VCMsUJvWvNcN6PXydwQY6sSrrvrJdppIRSjnDUXtVtSTlgtp/04iCjomB
	 ODucPLO2vw9YA==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
References: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/2] soundwire: Use bus methods for .probe(),
 .remove() and .shutdown()
Message-Id: <176647241852.660744.6794196408685688679.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 12:16:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 15 Dec 2025 18:49:24 +0100, Uwe Kleine-König wrote:
> this patch set converts the soundwire bus to use bus callbacks instead
> of driver callbacks.
> 
> Both have the same purpose. Bus methods are a bit more powerful (because
> .shutdown is also called for unbound drivers). This series is part of
> the quest to remove the driver callbacks.
> 
> [...]

Applied, thanks!

[1/2] soundwire: Make remove function return no value
      commit: 478f3890709a092a97a0218f61af19ac9b725573
[2/2] soundwire: Use bus methods for .probe(), .remove() and .shutdown()
      commit: 866160a51f5586d53e17ceab36029c8805ffea28

Best regards,
-- 
~Vinod



