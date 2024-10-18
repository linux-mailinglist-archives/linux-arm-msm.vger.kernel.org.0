Return-Path: <linux-arm-msm+bounces-34850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDF9A342B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E8EA283839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 05:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F7917B505;
	Fri, 18 Oct 2024 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pN1jvbXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D1617279E;
	Fri, 18 Oct 2024 05:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729228939; cv=none; b=knn+5YIozTmGxkbhqadgtJKiP5wdXdc8TvzYFNX//5H3TN+brmpIkRhR+H5J7+BnnvRVFtEwBXbmz1fw/FYZXDkXFK1hPxShRoKsVg4XH8+qQuUpSwojz0oDFVVJjI1IqdSmAr4P1R1uD7JO+uwO+ZLRUKT1F+bqY4Djq4+YQS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729228939; c=relaxed/simple;
	bh=SbU7YvsCLBo1fozw+FCn9FJ09fqD2MMNao4L3BGSKMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEmrw7ORRvqLP+QI6nPzgidKofeWmTIHRPaY7+AcuWOgkrI1B8AEk6dQ6x7KPn8+Fs1CkjkeTFVu3bTB621EMrEMecpJIDkpIk1Djem4sfTpeDX6dfmI+UZaJsTg1vFWqKjxwbvxGOed2WE18om5O9m4RmvM9oeoUbVxKKutLI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pN1jvbXe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SbU7YvsCLBo1fozw+FCn9FJ09fqD2MMNao4L3BGSKMY=; b=pN1jvbXeIe6Ly1VsjgN9jHbM3X
	grsroMmv6DWVBi/qgE6zMc7DQUd5KKDwUPQpSz6tMVyjkVsiUcxAa7I3U1FfLYR+e3WkJ25Y7EYLo
	kkPCDoKb1H39X7AOfEhw9roZJP0bBvx+c60wsU85OyRTCi4DqUe4Dp7K0K7aayfRzdNoTCs8/5VLB
	g7aUcZnJh8RxPoQKf+HZRewwL0NxIGD7TxhTxq80itaL4BJXfjw+89QQlaepUSlxtgHRoCzbXxaQO
	7gPm52k8QXwHogv5Dn2Hu1iikUVePK1WbOXVT+EyngGke06K7pGO+HUxiTDW337Dof1/grzE8WeuH
	KnaBqS0w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fRC-0000000GxYM-2rYk;
	Fri, 18 Oct 2024 05:22:10 +0000
Date: Thu, 17 Oct 2024 22:22:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Adrian Vovk <adrianvovk@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
	snitzer@kernel.org, mpatocka@redhat.com, adrian.hunter@intel.com,
	quic_asutoshd@quicinc.com, ritesh.list@gmail.com,
	ulf.hansson@linaro.org, andersson@kernel.org,
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Message-ID: <ZxHwgsm2iP2Z_3at@infradead.org>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org>
 <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Oct 17, 2024 at 11:26:49PM -0400, Adrian Vovk wrote:
> Let's say I'm using LVM, so I've got a physical partition that stores a
> couple different virtual partitions. I can use dm-default-key both
> underneath the physical partition, and on top of some of the virtual
> partitions. In such a configuration, the virtual partitions with their own
> dm-default-key instance get encrypted with their own key and passed through
> the lower dm-default-key instance onto the hardware. Virtual partitions that
> lack their own dm-default-key are encrypted once by the lower dm-default-key
> instance. There's no filesystem involved here, and yet to avoid the cost of
> double-encryption we need the passthrough functionality of dm-default-key.
> This scenario is constrained entirely to the block layer.

So just run a target on each partition.

> Other usecases involve loopback devices. This is a real scenario of
> something we do in userspace. I have a loopback file, with a partition table
> inside where some partitions are encrypted and others are not. I would like
> to store this loopback file in a filesystem that sits on top of a dm-crypt
> protected partition. With the current capabilities of the kernel, I'd have
> to double-encrypt. But with dm-default-key, I could encrypt just once.

Which would completely break the security model of the underlying
file system, because it can't trust what you do in the loop device.

This is the prime example of why allowing higher layers to skip
encryption is a no-go.


