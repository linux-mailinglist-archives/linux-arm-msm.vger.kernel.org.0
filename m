Return-Path: <linux-arm-msm+bounces-47430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F39A2F135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF923A578D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 15:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40578204866;
	Mon, 10 Feb 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c9sM934H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772620485F;
	Mon, 10 Feb 2025 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200544; cv=none; b=gw9yBCRQaMNG0Xg8SI0dxHN99BrnrncPgfX5jyJe52LP6kmQynh0+hJ69J/4Fs+i78o8OdtxytoEZAGF0ag5truyj+iqQjnxGkszemdAuK6N55YGQrLKRIN2rxHsKkZSGrkTjMq+Svu1OAg2aItXvr61D+f8chbwhjZq1JT2GRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200544; c=relaxed/simple;
	bh=hwWrEvltiRHAjVgSUXhdzAXJjuUHGywLxolwHaSxYJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hw3a4RVvBeehicKvbwI4shdWjXCt5thWzkD3Ib7uXian+CJp18vwN6szR1Y+6kFKw2OurCxtBuWMegFUqleqJYV3LxdfitiWFFBuZrWEgi2cJt30qNRdzOJUhw2NYC2XeWvzQ1/620oiwgZCtPReFoFx157w/8tR0dT6uNuYGnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c9sM934H; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89D0E440F7;
	Mon, 10 Feb 2025 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739200540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BuDequG6EZO1QNTpWbwf3tZ30bqjnVT5i0K+9L/qjc=;
	b=c9sM934H6A4jJUaJ7FMnoMxHxOqVbwve9CAwl3B2Bsm7c/jdmfq6IqRF1GlpWXXgdeO9DZ
	xFHN0KGd29zwmUooY/o0oGyeH+h9qjlFFMh+AWcHrBACdljmIy1kwClGuzRvrVgv8t60u0
	pGHWzFvBgC3Duuwdgj1dgSEp0DzVKJwyNRMWQ8T2JUJFkT5BrKY44BFzDRt6HFbkFDfcBf
	78x8QcmYiMlhAgNjTGTPBsSAmmwTUMmYMqWkCPGwWDIlLYNSuMPSs/YfKmwFXxBh02Jfgz
	mmZ6TBaguGRqRKSnVGPTry0V35Gi3ntOfyIgYQZN+o5BwppWPIGq1TUpG+N0tA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
In-Reply-To: <20250209145439.19047-1-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Sun, 9 Feb 2025 15:54:32 +0100")
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 16:15:38 +0100
Message-ID: <877c5xu8yt.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Christian,

On 09/02/2025 at 15:54:32 +01, Christian Marangi <ansuelsmth@gmail.com> wro=
te:

> With some research in some obscure old QSDK, it was possible to find the
> MASK of the last register there were still set with raw shift and
> convert them to FIELD_PREP API.
>
> This is only a cleanup and modernize the code a bit and doesn't make
> any behaviour change.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c    | 36 ++++++++++++++--------------

I'm fine with your two patches. I was about to apply them, but the first
one needs to go through fixes, whereas the second through next, and they
are dependent on each other. I propose the following modification:
- create patch 1/2 with the content of the cleanup done just below, but
  only adapted to the very specific spot that is touched by the fix "fix
  broken config...". It would be a prerequisite for the fix.
- patch 2/2 would be the content of "fix broken config..."

And aside, a totally independent patch easy to apply on -rc1 with the
rest of this patch.

Would that work for you?

Thanks,
Miqu=C3=A8l

