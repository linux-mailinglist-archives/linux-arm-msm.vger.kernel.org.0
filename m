Return-Path: <linux-arm-msm+bounces-32233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAFC983F90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 09:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFE0280EFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C523414884D;
	Tue, 24 Sep 2024 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hca81bFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51436224EA;
	Tue, 24 Sep 2024 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163901; cv=none; b=p0IcrlSl5zMH9LzGBJRxmVRfwOce0u9jFSkh8WmVNyqN4AMt8E2+eXMWCT2aUL9+Oc9mJ8q0DcbUgNJOk6ESfn/PUPKlufU2gGTYT+GiM1S73dB147oryAVlZRxKSVCBCGlWAmxmui5WP2q2mq4ejyuDpHtnMOzmvsKJ4moOB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163901; c=relaxed/simple;
	bh=KLJAg8LEAPMGZJuG/KhSybXNlWLQIRi/+4OZ9O9a/XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWLIajIGu3tVjLiaXpMNb5rGf5dgbWdRfH6M0e9FkPGf3zF6lXxE/ww7E+Wocd9q0Mx888NW4VrataM9Xpu4LKUeat1Qe3hKFsRXx1pSNbCXpswjGJhw04xk9S7MvM58dop4Oy8fIbhui4gQz7AOyGwKatZ1G6OBCRAS+hWaBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hca81bFp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fT8t09p6erN3pDvzXMMBDzSN+OtEWMEQMRtR+c1AOX8=; b=Hca81bFp34vjVqqCSPc4FQw+/z
	2pJW2t6D2slXOGZ/jwr4f3rL51d8T0OkQ5Pp8txkDx2MptwGnfl15NSfAOdtDMTsYQqqcFISprD5r
	RG4q953GwKaPKnxF5JoupU6x4NoWRDi0ehK3H/H/Z12cE4H4Bb5Nt4v/AoTEZQ3rDCcZfgUh81BZq
	gU2Ig+hCG1yCPiCNOhawBhj64CGm4Ib3/QxMT99XPRel8yV5fI8gDIldqpHDKqCFwrhPZ9ikKibFp
	rbyEYqwS8PFuleCukeWwuKKMts2ytXcQ9QczU6L3MBKymVvLqgo15FyeJrV0iIzLGzvuqFDpChOny
	y6odS+Dw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1st0E9-00000001TIz-3VJj;
	Tue, 24 Sep 2024 07:44:53 +0000
Date: Tue, 24 Sep 2024 00:44:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
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
Message-ID: <ZvJt9ceeL18XKrTc@infradead.org>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921185519.GA2187@quark.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sat, Sep 21, 2024 at 11:55:19AM -0700, Eric Biggers wrote:
> (https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/md/dm-default-key.c),
> and I've been looking for the best way to get the functionality upstream.  The
> main challenge is that dm-default-key is integrated with fscrypt, such that if
> fscrypt encrypts the data, then the data isn't also encrypted with the block
> device key.  There are also cases such as f2fs garbage collection in which
> filesystems read/write raw data without en/decryption by any key.  So
> essentially a passthrough mode is supported on individual I/O requests.

Adding a default key is not the job of a block remapping driver.  You'll
need to fit that into the file system and/or file system level helpers.

> 
> It looks like this patch not only does not support that, but it ignores the
> existence of fscrypt (or any other use of inline encryption by filesystems)
> entirely, and overrides any filesystem-provided key with the block device's.  At
> the very least, this case would need to be explicitly not supported initially,
> i.e. dm-inlinecrypt would error out if the upper layer already provided a key.

I agree that we have an incompatibility here, but simply erroring out
feels like the wrong way to approach the stacking.  If a stacking driver
consumes the inline encryption capability it must not advertise it to
the upper layers.


