Return-Path: <linux-arm-msm+bounces-36278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17A9B47EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047CC1F245EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5706D205AA3;
	Tue, 29 Oct 2024 11:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMbDVKSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA02187FE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200147; cv=none; b=I0k0NhyFdFo0OA5AXu9Cb/KitBnMrxWZJij7nY6QmNtPf2Rg18jjDnAeIA+mzrfYUV5zXAVkPwRo3D2RykCQe1o6FsOv1NzX3iemaia0hFtYFxOpCHGZuoYI0dglpxebE1sZzJQpM/Ps5k+Iiwk+507d3MT2bevuQXM5deI9Moo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200147; c=relaxed/simple;
	bh=rRAEgyNOWwhOyxMUbVEYKP+9w548eZ2zWldFy83pZag=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=spHs732HAOsWgRym/PJJkvbi1Bg/6nNQSpFLPq/i9rMQtIj8HnRoNaBiHahrrqfex9k48qkPOfXih4xN/qgj0JV1rIgftaHefCfJJ7AezY0/dN1t68pyaKFCpkdCbhgGOG36M+eTsYuIXMDAsF/0zFs14N4zERFu2uudrmT9zHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMbDVKSg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730200144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XNsXWr8C4+pGAB/ZzZscQZye/5tnLQlo7HFEntqVYd0=;
	b=KMbDVKSgln1miomrl+sBU3FDZsOV2NME7JMHLDe8SagMdY6JxayJ61nWu+86BJ4dTpJwgP
	jho0HU3I3/9QI1aZjfl9EY+07QkhiPc4EaTNGBuwoBMLWfmb007qPEAiS4V3FDxBN8Yr+0
	LSPMG782Ch18uW93IVUzrjbA/dM6yLA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-OiGAK7LwPRCg8Cw3M5RuZg-1; Tue,
 29 Oct 2024 07:09:00 -0400
X-MC-Unique: OiGAK7LwPRCg8Cw3M5RuZg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 52DEC19560AA;
	Tue, 29 Oct 2024 11:08:56 +0000 (UTC)
Received: from [10.45.226.64] (unknown [10.45.226.64])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81B7D1955F21;
	Tue, 29 Oct 2024 11:08:49 +0000 (UTC)
Date: Tue, 29 Oct 2024 12:08:44 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Adrian Vovk <adrianvovk@gmail.com>
cc: Christoph Hellwig <hch@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
    Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk, song@kernel.org, 
    yukuai3@huawei.com, agk@redhat.com, snitzer@kernel.org, 
    adrian.hunter@intel.com, quic_asutoshd@quicinc.com, ritesh.list@gmail.com, 
    ulf.hansson@linaro.org, andersson@kernel.org, konradybcio@kernel.org, 
    kees@kernel.org, gustavoars@kernel.org, linux-block@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, 
    dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
    quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
In-Reply-To: <14126375-5F6F-484A-B34B-F0C011F3A9C5@gmail.com>
Message-ID: <74adbf13-c778-ee00-0cd6-3931a4a518ec@redhat.com>
References: <20240916085741.1636554-2-quic_mdalam@quicinc.com> <20240921185519.GA2187@quark.localdomain> <ZvJt9ceeL18XKrTc@infradead.org> <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com> <ZxHwgsm2iP2Z_3at@infradead.org> <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org> <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com> <ZxieZPlH-S9pakYW@infradead.org> <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com> <Zxnl4VnD6K6No4UQ@infradead.org>
 <14126375-5F6F-484A-B34B-F0C011F3A9C5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On Thu, 24 Oct 2024, Adrian Vovk wrote:

> >Sure.  But why would you do that?
> 
> As mentioned earlier in the thread: I don't have a usecase specifically 
> for this and it was an example of a situation where passthrough is 
> necessary and no filesystem is involved at all. Though, as I also 
> pointed out, a usecase where you're putting encrypted virtual partitions 
> on an encrypted LVM setup isn't all that absurd.
> 
> In my real-world case, I'm putting encrypted loop devices on top of a 
> filesystem that holds its own sensitive data. Each loop device has 
> dm-crypt inside and uses a unique key, but the filesystem needs to be 
> encrypted too (because, again, it has its own sensitive data outside of 
> the loop devices). The loop devices cannot be put onto their own 
> separate partition because there's no good way to know ahead of time how 
> much space either of the partitions would need: sometimes the loop 
> devices need to take up loads of space on the partition, and other times 
> the non-loop-device data needs to take up that space. And to top it all 
> off, the distribution of allocated space needs to change dynamically.
> 
> The current Linux kernel does not support this use-case without double 
> encryption. The loop devices are encrypted once with their own dm-crypt 
> instance. Then that same data is encrypted a second time over by the 
> partition.

You can add a flag to an inode, then you can modify the page cache code so 
that if it is reading/writing a flagged file, it will attach the flag to 
the bio. Then, you can create a device-mapper target "dm-flag-switch" that 
will forward unflagged bios to one underlying device and flagged bios to 
another underlying device.

I think this is not impossible. But this change needs to go through the 
VFS tree, so I suggest that you start asking about it there.

Mikulas


