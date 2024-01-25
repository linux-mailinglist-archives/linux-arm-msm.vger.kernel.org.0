Return-Path: <linux-arm-msm+bounces-8214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5C83BDB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1241929125E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858C61CD24;
	Thu, 25 Jan 2024 09:43:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4571CD03
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706175830; cv=none; b=lwbei88bemzxjK2nTR5mT1Gjx9vFIjwQsqk2Ipyy9n7QfGSaGA7+FKgHDoE1jeRtCsbwtRbOTDbMWKXTzHpdWauNOcEgRsUSXWzl6rXUvEkqoCYK3iizjSfxlEMsc/zSdu67S4CliXYPkvrMP47xz1UohVvIORuBeyvC8RWL+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706175830; c=relaxed/simple;
	bh=PFOSAF9cxQoEPuEhbe/l/cyfvJjm0UX7yPpPUPKYm+g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eDxmNeV0La6A7uSNzZtBHCqqeY+kvlcsYaEXcxsCyDbkhH4IaybheR8yM9Q1QgsnWXIr8zd2z4CH142YdGdWYUnJ4DMmJYHH1LLvqTVlejNRPTj0iD/zwfXqj/a2RuMzrP9oCGWedjfj75EUQDVI97jjpbYs7hvnlTEgyQDNClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSwGl-0002Jt-GA; Thu, 25 Jan 2024 10:43:35 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSwGj-002FmG-00; Thu, 25 Jan 2024 10:43:33 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSwGi-0003jy-2w;
	Thu, 25 Jan 2024 10:43:32 +0100
Message-ID: <3ef1c6d075d8de9976468d46013ae7c292ff83ce.camel@pengutronix.de>
Subject: Re: [PATCH v5 3/6] reset: gpio: Add GPIO-based reset controller
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Sean Anderson
 <sean.anderson@seco.com>,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Date: Thu, 25 Jan 2024 10:43:32 +0100
In-Reply-To: <20240124074527.48869-4-krzysztof.kozlowski@linaro.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
	 <20240124074527.48869-4-krzysztof.kozlowski@linaro.org>
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

On Mi, 2024-01-24 at 08:45 +0100, Krzysztof Kozlowski wrote:
> Add a simple driver to control GPIO-based resets using the reset
> controller API for the cases when the GPIOs are shared and reset should
> be coordinated.  The driver is expected to be used by reset core
> framework for ad-hoc reset controllers.
>=20
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

