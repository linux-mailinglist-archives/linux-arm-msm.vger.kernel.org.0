Return-Path: <linux-arm-msm+bounces-32341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56118984D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 00:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869EB1C22695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 22:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2066146D57;
	Tue, 24 Sep 2024 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHSE/qt0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86308146A87;
	Tue, 24 Sep 2024 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727215477; cv=none; b=BW2MhH/pgwE8H+q8nXwHn+/mxm0YpiAw9dlbFcPTgxeUUzysWzBtbkv2aRbkeeFiwwR6MFj+v+tBR+Io+hF6EYj1N6R82/hk9QvQA93QN9JTXL1p7ekkoTTLiszoGPfOg7CFXbhida7BhiXMy99QTpXhbOm01clnoWFnzMOzmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727215477; c=relaxed/simple;
	bh=ph7TAmMw39B3nL4g9AnJGmFDqgpNUh2Ues8UMkyvezM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Izsbm4Bja7r9Lke8BFpPkq+NO+1NOHwe6Hd4BOz81toboZnIQUDbF02hMW4zw+6lKNgpHZqfkL0J4L78a+3i5lSkjVBjZbSQU5shDwYY81TnojVetQjJ9FE8I7JGr+FYqWPzrMiDM7gOuVSnPPh5L4ntkRO5NRTvnlfXuGLsbGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHSE/qt0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD6CC4CEC4;
	Tue, 24 Sep 2024 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727215477;
	bh=ph7TAmMw39B3nL4g9AnJGmFDqgpNUh2Ues8UMkyvezM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHSE/qt0AiT8AlwY1uSTrM4Z+ddSgOQ1IG50S21mOHCh5+bAm0FTiaj8U0tsSSsTY
	 O2kH8wsJaPK9PB92jyQVw/lhH+5Jbye96igquHgFjB4OjUO8QZ81XWKyH+MfvQyTS2
	 RdpMxn6MU3xPwqTU8MrZPY3VPdPRmSyRL9av7qiJhInMfvBKuynohB07s0T08Nbj7d
	 lmPdObo40LTaycX8ebXQTapeJK/rULYRm/TJvFhl37j60cjcRl62ZDMWCaIKuF2Jgx
	 p/6Di08hH6mRYEqPHHbE3jfXR+rHUKYV6+UymboTU/cEi164hzevz4dtd1IagSNl2M
	 Pzod9bdNwPm+A==
Date: Tue, 24 Sep 2024 15:04:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
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
Message-ID: <20240924220434.GB1585@sol.localdomain>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvJt9ceeL18XKrTc@infradead.org>

On Tue, Sep 24, 2024 at 12:44:53AM -0700, Christoph Hellwig wrote:
> On Sat, Sep 21, 2024 at 11:55:19AM -0700, Eric Biggers wrote:
> > (https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/md/dm-default-key.c),
> > and I've been looking for the best way to get the functionality upstream.  The
> > main challenge is that dm-default-key is integrated with fscrypt, such that if
> > fscrypt encrypts the data, then the data isn't also encrypted with the block
> > device key.  There are also cases such as f2fs garbage collection in which
> > filesystems read/write raw data without en/decryption by any key.  So
> > essentially a passthrough mode is supported on individual I/O requests.
> 
> Adding a default key is not the job of a block remapping driver.  You'll
> need to fit that into the file system and/or file system level helpers.

What about a block device ioctl, as was previously proposed
(https://lore.kernel.org/linux-block/1658316391-13472-1-git-send-email-israelr@nvidia.com/T/#u)?

> > It looks like this patch not only does not support that, but it ignores the
> > existence of fscrypt (or any other use of inline encryption by filesystems)
> > entirely, and overrides any filesystem-provided key with the block device's.  At
> > the very least, this case would need to be explicitly not supported initially,
> > i.e. dm-inlinecrypt would error out if the upper layer already provided a key.
> 
> I agree that we have an incompatibility here, but simply erroring out
> feels like the wrong way to approach the stacking.  If a stacking driver
> consumes the inline encryption capability it must not advertise it to
> the upper layers.

Right, I missed that's actually already how it works.  The crypto capabilities
are only passed through if the target sets DM_TARGET_PASSES_CRYPTO.

- Eric

