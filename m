Return-Path: <linux-arm-msm+bounces-52816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53791A755C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 11:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E728A3AEAD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFC715442A;
	Sat, 29 Mar 2025 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LEvALe9X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB759A926;
	Sat, 29 Mar 2025 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743245303; cv=none; b=FlxWmSI2OecNd3UmKNpSc3uSDtABWojBZqLpE7AlvPLJzkSsEpWb2YhbEYMdDYDWpLYEZ8cg5q5Ec7UH+e5f9+xNOmWAspvL1wxu7vTzDHqFocZizBoRXlMO2uz0HEjdRjXR46McUsgDGdsDyb4tVmnkixq/T/utaSFdiR5NtjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743245303; c=relaxed/simple;
	bh=VRILCUl6tghO5fvQBAa9MBDTlEh08r9uEGUP7rrLACI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbSGy6K1DMHC+24lXDvUt9G/puEGlMVEPhMODNgXDzuA7lvjRNtSklGRAAp7bYGQobaBjmMK2NYDga+4jUsEyv3OCeTyMp3Du0E+2JUrFF4P9DO9OlMXFXbqV6cZpApW8KAwFz0U23/Q+bRYvxpI7a4bPqtBgMGjRukQw/PnAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LEvALe9X; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F5EF44570;
	Sat, 29 Mar 2025 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743245293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyQo1MenJXkYhqS5gJTFkqIlunC7aRR8PjTnQH8TVW0=;
	b=LEvALe9XtbyP6nloZS51W+XWdzDiIx+iG6xmC+eMZJ924dmDzAVeUmmRhWhlp5z4grPXDm
	rjhoGw6/Ejt41w8iW3DB108kNlupUjE2xYcWec2V6vIgqLbWCNkyFsriIKodu9L67kVp9L
	mqoeMs17Vp0+8tBTWSRNmFigSCJceAdbKIKZo2dgb/N7AfvKht6ek/M1KHHclD43AYcGA8
	CTta/gxw3ssdSgRKydKCaMt3zDrcZUGJXkIt5xtUDRMty7+LF70fknBXzkdbmj6tdwW5Q3
	Fr/z8NOTEoGo/qc3/RCnAPT8o59dA73I7G1/ifHhcqs4enS3PmbZDwSv5u7c6w==
Date: Sat, 29 Mar 2025 11:48:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <20250329104812225f9ee5@mail.local>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeefleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheeuieeikefhgfdvhfehiedvhffgjeetfffgtefhudfgtefffeevledtleejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehquhhitggpmhhsrghvrghlihihsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehli
 hhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 29/03/2025 14:38:14+0530, Mukesh Kumar Savaliya wrote:
> Hi Markus,
> 
> On 3/29/2025 12:34 AM, Markus Elfring wrote:
> > > > Under which circumstances would you become interested to apply a statement
> > > > like “guard(spinlock_irqsave)(&gi3c->irq_lock);”?
> > > Didn't get, hence a question.  Do you suggest to use DEFINE_LOCK_GUARD_1 instead of existing method ?
> > I propose to pick further opportunities up for benefits from scope-based resource management.
> > 
> Sorry, still not clear to me what should i add/change ? please share me some
> example.

Don't change anything, Markus is wasting your time.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

