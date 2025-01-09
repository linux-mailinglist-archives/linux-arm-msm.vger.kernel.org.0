Return-Path: <linux-arm-msm+bounces-44670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2F4A08241
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 22:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD2241889F75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 21:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E10204C32;
	Thu,  9 Jan 2025 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVbQgnr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB555204C20;
	Thu,  9 Jan 2025 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458573; cv=none; b=BajiwwbJ83vZTXMfk1frpNWuxoxO21hfk/wHppdhn84ysCKOXAlYyLwTOF73TVK0QyheMmUG5tKED+o187q2bz7cjkHQnzLO1kMmMJHZx5Q7ynBSN3TpbQrbED0HErfGp8TFRA1cBlYM3Xo1Xh3RB9oPfr/MsbecHdpCEeMT/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458573; c=relaxed/simple;
	bh=oWeTJvSV3nU7lPJyh9EggaBihBXttmXhilPkA3sJrXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HvY3B4CL6YDTcRvwsD5lfhYTbxI6vhy4InaSanb3Dc1hILpykh12cszJW0bcy2U+a13wY0JwtHasT2QAduBTsOc8xsi/hLlLIv+I4/U86GDhwGa8BqNKOlAQ5kuR1l77zfASIWPeG3ZV6iDrktkPxezKpQLRHOBkQhYU3ZEtjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVbQgnr2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BE2C4CED2;
	Thu,  9 Jan 2025 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458572;
	bh=oWeTJvSV3nU7lPJyh9EggaBihBXttmXhilPkA3sJrXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oVbQgnr2o9IBzXfuPGiy6YIzq0h+rk9umsnGXfNRsbuH10pOIdeP0lI6GCklflxI3
	 /ZbXvbCbz201neyTUEVSVQ0jMXTgBMNG/3qF+isFJBhISHbtdanNLA86+vvZY3PLf/
	 02mS34PvKCf3VL8shO43TxPmfAbn7qL+L9NFHnV6N62/p/BL2CHPHRuiBNxP2ouUTw
	 +VrJDJYWPkkE9OfQWwqvPT54ONYeV2uhlGiOapND+gZBv2o8Z37lQ/4BXFwP77aYIC
	 ba76SHPNNvpi5rlKVwsfXpoApETbhi6wPHfimN1q3B7KsQX64Or6l4YBvnm3cLH+0T
	 72c+zuf/Uu9+w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250109182303.3973082-1-robh@kernel.org>
References: <20250109182303.3973082-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_present() for non-boolean
 properties
Message-Id: <173645856449.810998.11706229796048790590.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 21:36:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 12:23:00 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_property_present() for non-boolean properties
      commit: 84eac6d478c00f8f9101f91716ea3866d2fc1e54

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


