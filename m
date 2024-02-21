Return-Path: <linux-arm-msm+bounces-12026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01F85D697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59DA1F21A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1140C3F9D3;
	Wed, 21 Feb 2024 11:15:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781A73F9C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708514119; cv=none; b=SIYgS5yPVGvE2WEb9yklO03THpnWRgRVA2hqqKlyNuXDFNEu0zEqXvIpdng/1kAitq/OF4CdvOarz7eT//q2GYEcCDWfYYWv4M19i+QnNv4ebEZs9NXDSWpQj6e0t0edNWwukTASI+1smbyZPg/KNP6xcNd+Loh3tWD4j2s+h/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708514119; c=relaxed/simple;
	bh=irQ6ebiQiyGpcMm37AjfJenPghYMGL62W6zUcLWPX+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GVKm983OnMHu/cmZIcMh0nJ7Bxyrnpho51Zr+fdHuEkN/u1o1NOFGvVG6Hf+4HlprNE1ffriIDlbX142wF5E5rtQTvZeV2bcOIRKp/4rgKVGoDU1oLA9aQBdcgKvN4Gl17HF+MGwnLmue4rE1CRIslKY4fX13s7Z5rmomRErYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYx-0006aF-9K; Wed, 21 Feb 2024 12:14:55 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYt-0021lT-Mj; Wed, 21 Feb 2024 12:14:51 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYt-0005LY-1x;
	Wed, 21 Feb 2024 12:14:51 +0100
Message-ID: <6cc0774c0093086aa2504d6124ee6b9af4615677.camel@pengutronix.de>
Subject: Re: [PATCH v6 0/6] reset: gpio: ASoC: shared GPIO resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>,  Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Frank Rowand <frowand.list@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,  linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-pm@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, Sean Anderson <sean.anderson@seco.com>
Date: Wed, 21 Feb 2024 12:14:51 +0100
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

On Mon, 29 Jan 2024 12:52:10 +0100, Krzysztof Kozlowski wrote:
> Dependencies / Merging
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Depends on !GPIOLIB stub:
>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowsk=
i@linaro.org/
>=20
> 2. Patch #2 (cpufreq: do not open-code of_phandle_args_equal()) and patch=
 #4
>    (reset: Instantiate reset GPIO controller for shared reset-gpios) depe=
nd on OF
>    change (patch #1).
>=20
> [...]

Applied patches 1-4 to reset/next, thanks!

[1/6] of: Add of_phandle_args_equal() helper
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D26ea8511c849
[2/6] cpufreq: do not open-code of_phandle_args_equal()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D0f28982835c2
[3/6] reset: gpio: Add GPIO-based reset controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dcee544a40e44
[4/6] reset: Instantiate reset GPIO controller for shared reset-gpios
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dc721f189e89c

regards
Philipp



