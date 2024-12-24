Return-Path: <linux-arm-msm+bounces-43199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE19FBA6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3500D164D26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F249192589;
	Tue, 24 Dec 2024 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hrIp5ir/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB541922F5;
	Tue, 24 Dec 2024 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735027775; cv=none; b=n0zJxmtP/IFAMeFaaoMMPB3KtigApFgvBwnjNZA6x/VZ4xOLj5JNhf79bloIXD02Zl9Wc4ss/cHHTlK83AaHLwd/k7wZ89CHII0fx4UMpkC1pIMDqLyPI5DDX7rrNn+ozyCYeZc8Y4k0JqqsRGXzeaMKPsUb3DuvTF4gkXcqbj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735027775; c=relaxed/simple;
	bh=gYBOmkoqoYQCX9BX1/Oyj57RvRePbSwW1FuXVuY/+1k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P/VYIpGP23Wtm8CLiahTMHO9/p0yhpNzadKi7D8CQFFYVaN0g7x0UuCHyG3bIL0a8TGzRVKrxk+iueQp4Q++ooU50O/Ebp6PNFLGrpOJ2pNd3w/CXi+mwnRLqyxZffFmxqjf44y/x/rx7eBJe55HyJ83Y6eTqeQmghVtOePTn3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hrIp5ir/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4168BFF803;
	Tue, 24 Dec 2024 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735027769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYBOmkoqoYQCX9BX1/Oyj57RvRePbSwW1FuXVuY/+1k=;
	b=hrIp5ir/oBVKPtqVecBkhLw7G4MovL8iUYOODPTqeyNS4BUkBIemX383FlRZhWDv8n9ix5
	eI+dsIkDZZzSB0Bsg/HL2Cro/RRoVAsJTUu/ggHddXNn4E3UxdRMKcOehBdsNQUp/pxEa4
	GK7WUeRROrz58lGSTb20D+k701Sw3+BAWzuLQkSOC6eNetfOQYosyaMKBqBHxVmMgJ5lc6
	bOH/aSRy9mU3cBAKNqafuVTxPDeaf78zQVVGL/zenIXboCb3pQf4AbnzdQwfckKTzUJC8o
	Qo+Lp9PqCatY5N5AzZcL88IYEzJFfOe+dg8VpWKlRJ3BkvABjoUNmZi+wqw77w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <bbrezillon@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <quic_srichara@quicinc.com>,
  <quic_varada@quicinc.com>,  <quic_nainmeht@quicinc.com>,
  <quic_laksd@quicinc.com>
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
In-Reply-To: <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com> (Md Sadre
	Alam's message of "Tue, 24 Dec 2024 10:52:03 +0530")
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
	<20241220093029.z4zsr3owdnqll2vg@thinkpad>
	<18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 24 Dec 2024 09:09:27 +0100
Message-ID: <87seqdpknc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

>> Do you plan to respin this series? FYI, these are regressions, so
>> should go in
>> early as possible.
> Waiting for SPI NAND series patches [1] to be merged (raw nand change
> patch 2-5). On top of that will repost these patches.

When there are comments on a series, the entire series usually gets
discarded, so it is now out of my sight. If you want the spi bits to be
applied, it must make sense to have them alone, but you can send a new
version of the spi bits alone if you feel like the raw nand patches
aren't ready. But otherwise please fix the series and send a new
version.

Thanks,
Miqu=C3=A8l

