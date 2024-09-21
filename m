Return-Path: <linux-arm-msm+bounces-32148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D197DE69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 20:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9BDA1F219D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 18:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CE43D556;
	Sat, 21 Sep 2024 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjPywhe5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA72207A;
	Sat, 21 Sep 2024 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726944924; cv=none; b=Km0EpnsHLPXXdNl/jGmDWLwtAqb6zw2uVmCy1azo4ZftWAJsWajGs3lfg5ulegOannHPZIzyYd192aVK9yvKiDjZvjTiUsCq8TGKb2VYPtSCDMyBk1sBADzP2VqHqdwKCOW0kyhfcLL6aZl7y0tAezgnHN8k4gL8WTIAbIp++aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726944924; c=relaxed/simple;
	bh=EW3RqMHmcEVsqOD5+PwtqaAXSNldoK2gO0jXhV+18kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeIBBLiA+fg/1kM4bCwBExEVs9ydUrpdn++DrSIFXIz0OrUZUyqSxi3gWoll1Zn+eMKS25IX/E0n2AhW8IaS6HJEJMpb/CuezddZ6iMSvJGyGdvNP7kkx6dz+qknwIGiK82MqgaYVOXhGXgwja2XNR6Fve90gmsiSBrssjYepec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjPywhe5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABA3C4CEC2;
	Sat, 21 Sep 2024 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726944924;
	bh=EW3RqMHmcEVsqOD5+PwtqaAXSNldoK2gO0jXhV+18kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjPywhe58rjvE4SbSbM1Npo55fwjBx5SLQftNBpgzlj0/V6ahO8ptaZKylyPqONha
	 w/lbemqX0tGsVB7Odo/aIKA7Kk0ffms22xNqzLEhAKznt7F2W5OJJbt1wrxIrWKStR
	 l/3q0oJ+882ddwqXdm3p6DfA/t5u5VGZNluqJLKf8pihowiEgogxQ85KjlxatQXb/T
	 yz6tCz3Ph/+Ql8f2CNfsd7+72n0Qu0xDFii00dpuT6kWdr/aN5OIbqVi5QbdSoKFPP
	 aEKejnbbmA+lg8AiOANAHpXRNzndXwZBYRCyPthQZqfAxwK0wS7BCSX+NaU9rsNmES
	 S1ar0JM1+9iOw==
Date: Sat, 21 Sep 2024 11:55:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: axboe@kernel.dk, song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
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
Message-ID: <20240921185519.GA2187@quark.localdomain>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916085741.1636554-2-quic_mdalam@quicinc.com>

Hi,

On Mon, Sep 16, 2024 at 02:27:39PM +0530, Md Sadre Alam wrote:
> QCOM SDCC controller supports Inline Crypto Engine
> This driver will enables inline encryption/decryption
> for ICE. The algorithm supported by ICE are XTS(AES)
> and CBC(AES).
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v2]
> 
> * Added dm-inlinecrypt driver support
> 
> * squash the patch blk-crypto: Add additional algo modes for Inline
>   encryption and md: dm-crypt: Add additional algo modes for inline
>   encryption and added in this
> 
> Change in [v1]
> 
> * This patch was not included in [v1]
> 
>  block/blk-crypto.c           |  21 +++
>  drivers/md/Kconfig           |   8 +
>  drivers/md/Makefile          |   1 +
>  drivers/md/dm-inline-crypt.c | 316 +++++++++++++++++++++++++++++++++++
>  include/linux/blk-crypto.h   |   3 +
>  5 files changed, 349 insertions(+)
>  create mode 100644 drivers/md/dm-inline-crypt.c

Thanks for working on this!  Android uses a similar device-mapper target called
dm-default-key
(https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/md/dm-default-key.c),
and I've been looking for the best way to get the functionality upstream.  The
main challenge is that dm-default-key is integrated with fscrypt, such that if
fscrypt encrypts the data, then the data isn't also encrypted with the block
device key.  There are also cases such as f2fs garbage collection in which
filesystems read/write raw data without en/decryption by any key.  So
essentially a passthrough mode is supported on individual I/O requests.

It looks like this patch not only does not support that, but it ignores the
existence of fscrypt (or any other use of inline encryption by filesystems)
entirely, and overrides any filesystem-provided key with the block device's.  At
the very least, this case would need to be explicitly not supported initially,
i.e. dm-inlinecrypt would error out if the upper layer already provided a key.

But I would like there to be an agreed-upon way to extend the code to support
the pass-through mode, so that filesystem and block device level encryption work
properly together.  It can indeed be done with a device-mapper target (as
Android does already), whether it's called "dm-inlinecrypt" or "dm-default-key",
but not in a standalone way: pass-through requests also require an addition to
struct bio and some support in block and filesystem code.  Previously, people
have said that supporting this functionality natively in the block layer would
be a better fit than a dm target (e.g., see the thread
https://lore.kernel.org/all/1658316391-13472-1-git-send-email-israelr@nvidia.com/T/#u).
I'd appreciate people's feedback on which approach they'd prefer.

Anyway, assuming the device-mapper target approach, I also have some other
feedback on this patch:

New algorithms should not be added in the same patch as a new dm target.  Also,
I do not see why there is any need for the new algorithms you are adding
(AES-128-XTS, AES-128-CBC, and AES-256-CBC).  XTS is preferable to CBC, and
AES-256 is preferable to AES-128.  AES-256-XTS is already supported, both by
blk-crypto and by Qualcomm ICE.  So you should just use AES-256-XTS.

There are also a lot of miscellaneous issues with the proposed code.  Missing
->io_hints and ->status methods, truncating IVs to 32 bits, unnecessarily using
a custom algorithm name syntax that doesn't make the IV generation method
explicit, unnecessarily splitting bios, incrementing IVs every 512 bytes instead
of each sector, etc.  I can comment on all of these in detail if you want, but
to start it might be helpful to just check out dm-default-key
(https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/md/dm-default-key.c)
and maybe base your code on that, as it has handled these issues already.  E.g.,
its syntax is aligned with dm-crypt's, it implements ->io_hints and ->status,
and it calculates the maximum DUN correctly so that it can be determined
correctly whether the inline encryption hardware can be used or not.

Finally, the commit message needs to summarize what the patch does and what its
motivation is.  Currently it just talks about the Qualcomm ICE driver and
doesn't actually say anything about dm-inlinecrypt.  Yes, the motivation for
dm-inlinecrypt involves being able to take advantage of inline encryption
hardware such as Qualcomm ICE, but it's not explained.

Thanks,

- Eric

