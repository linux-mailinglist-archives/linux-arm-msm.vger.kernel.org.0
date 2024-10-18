Return-Path: <linux-arm-msm+bounces-34852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF29A34E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8251F25247
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 05:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA23318872C;
	Fri, 18 Oct 2024 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dsXHgo8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EAA16A956;
	Fri, 18 Oct 2024 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231003; cv=none; b=RE96tA0VoMfzx6b3o7T4soPler/Ekg/8P45V5sjoHbZOU3tJD3e7iIGM+egNlTGu5WaE7I5QH/H1ajATIpZlu+1l67I/RsxtAQQcXqI2epd9fwa7uG+dyxPogBnPOPV/AP2zCuegCDjoJHyE280T7Hd0lHGGHRKFqRCwLC2Ct7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231003; c=relaxed/simple;
	bh=KQXMxq9xyEnxveLtUTCsk7rHQIZf8YRsfjPWVEZLEA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBtZtC2HlZ6qd56ApVp7etnrbtblUdlDuUlJYL/AWaqtIivLeUGX2Megr58QOIkZFyGBUZD4SJ+jQ88iEWmIYI/7KdkMlFY6tiBcRLnztcjv0zgCkhNAzXexSfVbeUEjrYeo2rIhnYMunXRVi4h2HE9K2SkOv7jSed6SzGdYuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dsXHgo8U; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DrapM8V0roazjVvh+9x1l3Lmh4S4DQREm0viXSpD/fY=; b=dsXHgo8UrUJL+S0w2HmAikDgJk
	Uvn1+CWaY/kqI7HcTItHPPxDiLHXjMMkruLQ/tyzuOqGGZT0ODpvSmpNJKf8+8BPfiLkUkJj2W5QC
	eST7ZCMxDbbQ0HbAm+hV8kucQrVkp6MrsvQnJFtxgeEpdsMpWyV/wV3OFv7S2NyS5U8Gd+ialRQa6
	gWj50jSz2TQPGfLtQ0SWC2uqJk/I7b4zticLeeUIqBjh2d90Iw1msQOkOZv1fE6cytT+YSqL10W5G
	UVWx9XwEOYvvrTiSQERCfhzvdOOA7tBN3mtKNVzDJmfgah7EZD0VShWzHjs4uXWJzzZuhrM6rJEp+
	nDPaCuLA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fyY-0000000H2tp-21ND;
	Fri, 18 Oct 2024 05:56:38 +0000
Date: Thu, 17 Oct 2024 22:56:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Adrian Vovk <adrianvovk@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
	snitzer@kernel.org, Mikulas Patocka <mpatocka@redhat.com>,
	adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
	ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org,
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Message-ID: <ZxH4lnkQNhTP5fe6@infradead.org>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org>
 <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org>
 <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Oct 18, 2024 at 01:44:19AM -0400, Adrian Vovk wrote:
> > So just run a target on each partition.
> 
> 
> That has different semantics. If I encrypt each virtual partition there's
> nothing encrypting the metadata around the virtual partitions. Of course,
> this is a rather contrived example but point stands, the semantics are
> different.

Then you set up an dm-crype device mapper table for the partition table as
well.

> > This is the prime example of why allowing higher layers to skip
> > encryption is a no-go.
> >
> 
> In what way does that break the file system's security model? Could you
> elaborate on what's objectionable about the behavior here?

Because you are now bypassing encryption for certainl LBA ranges in
the file system based on hints/flags for something sitting way above
in the stack.


