Return-Path: <linux-arm-msm+bounces-47551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A27A30928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7391885F7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA371F3BBE;
	Tue, 11 Feb 2025 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aM2e2a5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034DE1F193C;
	Tue, 11 Feb 2025 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271327; cv=none; b=RIR8JSZVgPw75vczbVWSstIgNAHfTxDZsUHmStB54HvpyKn+qbHYuslVrKrZKIODJz9Dngk0F8tMYyBYXZtj7yJapHoMyV+4WIIwgxKgP/GwhCj6S4vT9Xn/z80AAHWpwEklPn9EfKwQMNkZTBiyv65bJ6ohOjxhpzokWcGx4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271327; c=relaxed/simple;
	bh=u8/Lnpmqqyug00ve4rh0Ch5QRFxC7d9Lp8kwRDFpdMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QsKZ37UvEn9PuBadrozRs6ClRh7O47QtuJZzj5iOfz5m//gc6xua7xrcO28eO0GdyzmH56tdLa3uVrwEMFq2MyKHs6+RG064DUW7DfbrtRUjB2uKnz6bV9Ospse4/LJ35w40gXuRmB33DQQVqxdg3PqPt9pqX7r8TvZsCpKK2hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aM2e2a5Z; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8707B41E0D;
	Tue, 11 Feb 2025 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739271323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNAL4qcDpZADEcFGQJigZHn9NAqCEryKx7MhvZmyVLc=;
	b=aM2e2a5ZRNus+//jkXB7rQ3t2k+vf14eyttffiLsJBwOBsqez1SCdQbPYuKbWzEJIIlCkf
	4gwmrY4LpEfpXYkLwnNsuC1sawJ6twdSrAhsvQ0SCLZ3nI5wMTSWBNHKslJZsyXl1Yu4uq
	tW7aiMLvURuBu19jzkHQXAs2//tHwA2Jem04Y2NoC/KL+WrwTwyTFFAj7yikHuluB2GBFC
	O9DkGeOl2UuV33nAuEj4aSfs/mvo7IztjgTu9wFj7Pui7Vt4QM/lOUsbXb9nPSHgppcBSM
	JaW3ygaW46SPDvDN22XP0YCafv5JahZFZqTJcRZpJoX9SpjpQ6oujETDBqSIKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
In-Reply-To: <67aa6527.050a0220.173001.b011@mx.google.com> (Christian
	Marangi's message of "Mon, 10 Feb 2025 21:44:21 +0100")
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
	<877c5xu8yt.fsf@bootlin.com>
	<67aa6527.050a0220.173001.b011@mx.google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 11:55:22 +0100
Message-ID: <87bjv8sqcl.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Christian,

>> I'm fine with your two patches. I was about to apply them, but the first
>> one needs to go through fixes, whereas the second through next, and they
>> are dependent on each other. I propose the following modification:
>> - create patch 1/2 with the content of the cleanup done just below, but
>>   only adapted to the very specific spot that is touched by the fix "fix
>>   broken config...". It would be a prerequisite for the fix.
>> - patch 2/2 would be the content of "fix broken config..."
>>=20
>> And aside, a totally independent patch easy to apply on -rc1 with the
>> rest of this patch.
>>=20
>> Would that work for you?
>>
>
> Mhhh are they really dependent on each other?
>
> I posted them in 2 separate patch as one should have priority and be
> applied ASAP. The other is really a cleanup and from what I can see no
> delta in the patch gets affected by the fix in the other patch.
>
> In theory they should apply independently.

Ah ok, I must have misread them, fine then.

Thanks,
Miqu=C3=A8l

