Return-Path: <linux-arm-msm+bounces-35666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E22A9AE011
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 11:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4771C21F68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2441A3028;
	Thu, 24 Oct 2024 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2iCuWIsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824B1B4F32;
	Thu, 24 Oct 2024 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760651; cv=none; b=fvW/uFGIRuiDnZTaIq8MJfMo3qpREZMdNs/+bSMr7xKu7V4VKzUpg91t7bt2mkCbi/gkgNGzRURPDIRGNTCvdxbuNQP6e6lGdrzXE1nnEQgOP1BEjV0/jGcxRdbj4qQTddPJSftmS0mX9P4oG90kIbepyflprA5jk0+SRXQCTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760651; c=relaxed/simple;
	bh=EyPmGCUfQ8Y6M9C7NmD4I3C5x0XLdLsYt0oZ7HJm5gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7kVIhswyZb0XoNifghbCZNT87RXM0BCMze9vjiAYfbdajzEoJMEH0AXTLBkWVbGqKRgk5jkULL0lxKCc8hUOV+mWaTIvFozNDgEaHXFmf8TE1q8eRNQTvLmkUfZcDeYOswnTSLviYjs5MtVxKFkqTeRiGh9JSn1uxWDfO5fkNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2iCuWIsV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gc7TIYx8RU4Q8PM3q2bw2LoJRKDeD/wqCcHiZkboyi8=; b=2iCuWIsV6og9kCCjBAMgNtgAFB
	NkVgJ1lGp9IE//O8ftcsOdgO7RgipukKx3iKsr021YPA5+RsQyUC4SAv630Hlu3EVxBB+DHAptfMR
	Ul4s2+O+ncSyqrwggtvEw4IU2TT8hENWji8jnJvzRs2ee5euvq9maSgxoSh2NBYtZKFtRdKQYH3xU
	vJhnvjkafdLRVlqhx2oAfIcvpdYB0wP340JhJWwU2rFLBvIoofkMYsFlzVYQvFxNAnmuY7Bxo1I6f
	voIPgQSJC+yCKsFA9deNbxXbEIkBfo+HsB5xI3Qg7mllvOhTISoueY2QJz1qfHbu1OReQ1sp7s+RF
	H7pC19zg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tlC-0000000HNxA-3eJc;
	Thu, 24 Oct 2024 09:04:02 +0000
Date: Thu, 24 Oct 2024 02:04:02 -0700
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
Message-ID: <ZxoNgmwFVCXivbd3@infradead.org>
References: <ZvJt9ceeL18XKrTc@infradead.org>
 <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org>
 <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org>
 <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org>
 <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
 <Zxnl4VnD6K6No4UQ@infradead.org>
 <14126375-5F6F-484A-B34B-F0C011F3A9C5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14126375-5F6F-484A-B34B-F0C011F3A9C5@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Oct 24, 2024 at 03:52:24AM -0400, Adrian Vovk wrote:
> >
> >Sure.  But why would you do that?
> 
> As mentioned earlier in the thread: I don't have a usecase specifically for this and it was an example of a situation where passthrough is necessary and no filesystem is involved at all. Though, as I also pointed out, a usecase where you're putting encrypted virtual partitions on an encrypted LVM setup isn't all that absurd.

Can you please fix your mailer?  It's creating crazy long lines
that are completely unreadable.


