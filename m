Return-Path: <linux-arm-msm+bounces-22535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C3906171
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 03:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BA32834FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 01:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524ECB669;
	Thu, 13 Jun 2024 01:59:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 14.mo581.mail-out.ovh.net (14.mo581.mail-out.ovh.net [178.33.251.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451F168D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 01:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718243950; cv=none; b=Tj11Xff1sJSQmAoJq6lw4Mv/TwFmnnk9KQ98MYHVIH24CnzuGST4qV2uLOTYViHhhE6jqnkjunFvsXZZhzjt1BbMmui8mrdp8eJhH3KLw5is4OOp/j8xXlMxt0JAK7qzbUobOIMLn3ijQSvsvl6pPFIlY3nTSTsN0MUnEA9f9DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718243950; c=relaxed/simple;
	bh=KzwCtGoCwtsF3CfcweDKgrTOyhrnDMmW56Ale1QeMEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D7vfbuNjoizXPGDIil6LPFkFjH3+RmkhoMG0oyzC1RFZLJOKWcNLy5O7Y6rdSZCQzXdd9TRFvRJKWe2KgStvQNI/DiuBJ5VUVQfWzVP0jwwo38I6r+07bzGOk88EFsDVuaplBEtZLLBijgrjtShrX9ra6eFIrFF2Nf+3mxvzaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.251.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.2.251])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4W017F5PWfz19tC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 22:54:01 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dxjts (unknown [10.110.113.129])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 96F8D1FE88;
	Wed, 12 Jun 2024 22:54:00 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-6684bf9d7b-dxjts with ESMTPSA
	id IPYkIQgnamaHBQAAd8G54g
	(envelope-from <andi@etezian.org>); Wed, 12 Jun 2024 22:54:00 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G003b15965ea-e6ae-42f6-b281-ca76e21c9f69,
                    DA170D98FC4D5E4E6D17746280F9905ED5007368) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Rudolf Marek <r.marek@assembler.cz>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240607-md-drivers-i2c-busses-v1-1-0340f4590199@quicinc.com>
References: <20240607-md-drivers-i2c-busses-v1-1-0340f4590199@quicinc.com>
Subject: Re: [PATCH] i2c: add missing MODULE_DESCRIPTION() macros
Message-Id: <171823283902.404205.70695545508575687.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 00:53:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 2812779443686935184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeduhedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth

Hi

On Fri, 07 Jun 2024 09:28:43 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-qup.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: add missing MODULE_DESCRIPTION() macros
      commit: 1131179f9f4d073bff70e9afe4179caa703c6af1


