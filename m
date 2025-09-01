Return-Path: <linux-arm-msm+bounces-71396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EE4B3E2E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62CF63B759B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 12:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8417B33438E;
	Mon,  1 Sep 2025 12:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CCyJyNzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4768334381;
	Mon,  1 Sep 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729695; cv=none; b=fI3d8SPr9EiQNALXPMGqaAfqqtgrhL4HrtjexDiB7d/DzjQlM4o8mD+1/iWO1aaoOUMhbM2y0cGU7SQrM8moKtGqrDQICgRRZFM2PTWgniu+T8iHxjK/rgoP1pxbNqclUv7BEscZ7jptubNm+JGfIgPw/0UOQ08s+T7OA61d1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729695; c=relaxed/simple;
	bh=+8R/O18LZqCyu75IsrJ/f9VtSglPFzfE9V4f3cQUPO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HPB2ekxflTbIcD7DUXqYedGe2/MePz4PoclFwkEI5/yQAUzxGHPXgKsPx6gFLRkg8p0pRPrX+ZmrackdSUO75Kbtuzt7VY/hiU1rZv/Iq9I5nnoSgscypRsqnzh9gqvKcHymvFCQLx/vkN3SkYld+uumwBo/m7L8yy9H4ffw0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CCyJyNzU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BDAD1A0D2B;
	Mon,  1 Sep 2025 12:28:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33DB860699;
	Mon,  1 Sep 2025 12:28:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 153F91C22DA1B;
	Mon,  1 Sep 2025 14:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729690; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ur5gPEONmA8zR2mkETJKSgE70gid+jSi6gNy0OMfO3s=;
	b=CCyJyNzUAdIp9fZ4994dyIPTp7C/xHQMagErb2a9UCWyPEB3aEyzeJYtXJwVv8ZemrZR29
	B16znJSIN5vRJpAH64GZweHJBzd/Ue2SK3CqqJmRyhrK8+Tnkrv2bgRb+1HPNGF/lGPGMI
	rjoUl3rSrSOQLONzcGNKZuBDjHDN3irqOxEIYx1ZHs+3c6cvYdUJ4c0ILI6jxN93u6eXYx
	PtBQ4vCpqtr/nneDSyogIVvJCBYAxDZ4p7CAk15IH5UNWfSpHCgiErXIvKyW5y5PyD8ljF
	e1KrAlanxk+xg9/enBbNyp1P6+0JNEjs0etUHY5fnPN5XhWkrsQKjBy6WQly1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
References: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for
 sg_init_table()
Message-Id: <175672968988.48694.15291064215961087931.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:28:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 11 Aug 2025 10:30:42 +0200, Gabor Juhos wrote:
> Since commit ddaad4ad774d ("mtd: nand: qpic_common: prevent out of
> bounds access of BAM arrays"), the {cmd,data}_sgl_nitems members in
> the 'bam_transaction' structure are containing the number of elements
> in the cmd/data scatter-gather lists.
> 
> Change the qcom_clear_bam_transaction() function to use these numbers
> while reinitializing the sg lists instead of recomputing the number of
> elements to make it less error prone.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for sg_init_table()
      commit: 5b5dc7db5a8dc2c221526acf81b323ec1f972d0f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


