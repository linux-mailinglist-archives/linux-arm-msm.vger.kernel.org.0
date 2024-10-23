Return-Path: <linux-arm-msm+bounces-35549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D47609ABF73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955AC283075
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BA51534FB;
	Wed, 23 Oct 2024 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4HpS1+iP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBD1537CB;
	Wed, 23 Oct 2024 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729666672; cv=none; b=jJaX+vrEffzfDsgUXIFo5YcA4rJ1spTJc5RcVzWQBtlcF+2ReX0oeeIYGH1bMra/dj1HPBlun6EKa9xM0NzQJU0EVhG3NLU8C41diPkhTU68Qdb1iucENdhjZisGpg5w0Naib2xfKqvb3sMdHu46Sf+di/23Z2UvFf+xQf6rXbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729666672; c=relaxed/simple;
	bh=JM0QX+rcNcciycCq4cQEVeZ/Eg12wyw+gI6m5h++2PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B23ngIcCoZzbYwLHDTROa+Joe48/UrVVPMoZ4hyHxXRZCmqIiNJ9ODDKzTxAuj4P2lApOvW6XGgS83kssSU+86cZ1PVrEe0tMR/+L+IpWnVyzDGS30B/nlhl5hIjPNixyEt/1cDtEEvLQU8iWQImI85J6ER8qVN11h7OIDQxKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4HpS1+iP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l/dIdLkpg3nY7mL+kOCv40XaN/+P5ZiBELHPID6DHIA=; b=4HpS1+iPtWu3Q6rWByBHg6zg1t
	1JrA57T8qGLy/cN7tUE72nHaaV+hXcY7NKaOu2lwF5Sk4Vf8Y9Y9WZB1W1BbPt2NuqOn3gJohocEN
	f9PsZyaA7pOeWgeIIKsi75KubAnO0mtLiUnx6idLonBZGG/rj3qcVP+5tv1+h9H8jcMBlW+pdcFV8
	XpAcLjFgATy7mW7gDgV9b1TGTT8w6JYxd33LZfFcNIKE7byvcDEMecLyzGlzcBn0I3z6ZfN4bXvUZ
	Qp3bmBRNjyEbdYyBKc6jK6NOF6ffCtsh+Ay7cBYCyQ2rXf5msRguvAu/zehYyBKpN9Hnc5WVx0grf
	LB02Fw/g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VJM-0000000DHn8-1MMo;
	Wed, 23 Oct 2024 06:57:40 +0000
Date: Tue, 22 Oct 2024 23:57:40 -0700
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
Message-ID: <ZxieZPlH-S9pakYW@infradead.org>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org>
 <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org>
 <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org>
 <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Oct 18, 2024 at 11:03:50AM -0400, Adrian Vovk wrote:
> Sure, but then this way you're encrypting each partition twice. Once by the dm-crypt inside of the partition, and again by the dm-crypt that's under the partition table. This double encryption is ruinous for performance, so it's just not a feasible solution and thus people don't do this. Would be nice if we had the flexibility though.

Why do you assume the encryption would happen twice?

> >Because you are now bypassing encryption for certainl LBA ranges in
> >the file system based on hints/flags for something sitting way above
> >in the stack.
> >
> 
> Well the data is still encrypted. It's just encrypted with a different key. If the attacker has a FDE dump of the disk, the data is still just as inaccessible to them.

No one knows that it actually is encryped.  The lower layer just knows
the skip encryption flag was set, but it has zero assurance data
actually was encrypted.

