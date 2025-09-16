Return-Path: <linux-arm-msm+bounces-73803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D0B5A3AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447E07AAE70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40491285069;
	Tue, 16 Sep 2025 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rzggNwY2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SDnxirkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285C279788;
	Tue, 16 Sep 2025 21:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758057026; cv=none; b=MTtUU094xwRm2o62WM4w0pMI30YTd+d2Ryw0TClE/Piy+d7DXlT90abACJYG4880jZG/18AmZbqkMotznmhD708clAor1/zf5Bz7ZO6rXKvftqLSkwIsPqpTmg3hO/1rEOliJAm6ddJn+zPR9hCtrRwidNWceaXuaEzcek3Z950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758057026; c=relaxed/simple;
	bh=8cCmYW5hdWkzAHs68vgot2dAtZak/ByN7XZ37Qz//U0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=koceLGtvEVeFn7hx+U8cVEH+UM2OOMpPbXXCGgk25fOFEMzJXUIHozkl9haOhqOqklfxtUrVnU4gw3p4y6MmjPj22MmZeViPOk01U5RT+y8WmLBuCeALECezMh3iY1U8Wl2R9fFaxmHCJ2WHBsDGGWvpJiu5/2Epw8DG7FfeAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rzggNwY2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SDnxirkN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758057022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pj5Qf/1bxCFrPvhs0jRUa6YUBACyGl4rbZxu2Lu22Yo=;
	b=rzggNwY2vNIxBIBWhIM2eNT5/Wfp/pOEx3vtX/gpirUkPKVvJ0xOMkn1gIzyLdOdcJM/AD
	LJ2HK4ybwmU0mn9P3gCiw4KAwCnEtKWMS9Sb/0qKfySh8hUCPH70rJAg5Vq0oS1Etq5y9s
	fWaUbCSElmQMt6NX3zClcf91wEMcC1oZuAdCi/5IRA+Ig27XqQiW9KvpUqkD9NqXkHLd/0
	Gd0n3URf4LrYUw8JAffVYVHTmdNOaBv3i4kwOMJvXw8NmVIpVwwAtKoaJo94DrP41+tyCK
	c1/lgsIXQKLPw28SqA5WCxffxdnDK3zoAfFJs9W+tYUbrCs6XWPUEcEbL4SF7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758057022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pj5Qf/1bxCFrPvhs0jRUa6YUBACyGl4rbZxu2Lu22Yo=;
	b=SDnxirkNQwaVrfSM04srsZSWToQc90VpYlu25/LRFyplMb/H/OpA4GODTfBkYO63u2m+3S
	JVN0QitkAjbE61Dw==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <20250912150855.2901211-10-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org>
Date: Tue, 16 Sep 2025 23:10:21 +0200
Message-ID: <87cy7q9k8y.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
> nr_irqs is required for debugging the kernel, and needs to be
> accessible for kmemdump into vmcoreinfo.

That's a patently bad idea.

Care to grep how many instances of 'nr_irqs' variables are in the
kernel?

That name is way too generic to be made global.

Thanks,

        tglx

