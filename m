Return-Path: <linux-arm-msm+bounces-35664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9049ADEA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49DF1F23729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577541C4A35;
	Thu, 24 Oct 2024 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="leqWNAvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound1a.eu.mailhop.org (outbound1a.eu.mailhop.org [52.58.109.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAE1C4A23
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=52.58.109.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757499; cv=pass; b=lifWcZzb79471c0wymoyW2yD5ROD/2nvRgQJM4XdGgYvT4NUx2CRcy93jVHdqKWJRlsI3oqP3pqJ9Jj1Er6xZEjCcYlfHOT4H54YC6eYhAHrstiZD/u22vFFA4goNaXHgGlSaln/P9dXmJn3dA9Oy58o40NnKcjDsq3fsmOgXhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757499; c=relaxed/simple;
	bh=KArsoC11KVIWCNUmC3ZjBiqmSFW6aY2M79+FZ3Z8XFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbYCqc8I2L/VWOz57Yy/Ar8ae1h2TWHWcYtwwXWOBXu7ZglcBkPmjchMiHnoHSb9iyHZxfzWpHQClkABzm2HEXoHK21f/zIjX63ePYBk/BbTDsr/qXKyR4OXUiKvyEojONDsVJS5sK3hHHWlO+D8p5lFl0G4TbVFyKjYAB2aUYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=demonlair.co.uk; spf=pass smtp.mailfrom=demonlair.co.uk; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=leqWNAvf; arc=pass smtp.client-ip=52.58.109.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=demonlair.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=demonlair.co.uk
ARC-Seal: i=1; a=rsa-sha256; t=1729757491; cv=none;
	d=outbound.mailhop.org; s=arc-outbound20181012;
	b=mHVIo9l+eUceMqrTd4IBgWRVsXg/hJ3KfjdYtYL6kssWxWV/mS/L03IHldKiU6twlKGPfeb+tayAz
	 VSxgHZyAQBI+Natx4qEnlxiE8kXvMUkB75eYFxVEUXT4dq7Gvy34pAoj+0ngLjRXXEm1XkcG8/xpsl
	 c6HA8QK48bTsnZMdGE1/F9+ZGIG6463VfTeQB5Br0HzDRhOJFOnGRBpCMzDZ1FBTJ4NTTs/QqZVmQz
	 15i/rh3Nhupy8ivUNuwmn1qgD4BZJ7xuYul2yjStnn4ffSg/DIYYf+9nB4ppaR58OuBfD2yIrOuHg8
	 KPxsW+0CWHNvmObsVrsI7kOX4xryKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=arc-outbound20181012;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:dkim-signature:from;
	bh=AaVvclh9QZ53PLSnyOJZ8mzm2MIO2jd4GM/cgUMkd+o=;
	b=rcLUzQA5Rj5RKUwHwr1nZSyUP0JWLal5K7WfLCnw3p46P0Uee+X7MtSg5YnO4BRMormYx9V7aZgQG
	 G6HukKxfDIJOJOi339965kzsyxYFY+Crad/akLAvYPe+e1tTry10kIg58cW7bYSWBAKjZQHVPnj23i
	 dKX8Na9/wHcXeDMTXvTGqxTIrATk2wzTncU+/oE9xpylg9A/7chn8oDtqN+WgzvjdU3mQwMZgAjlBx
	 AAMIL8+Htreuy3zfSZa4gUQDUidd9dOUhhtvny5lgmlKL+2Ba8JH10yL3EN3jgQ6G0CyfvXkxE+LDc
	 4Cm/Wu5d9CqG/8/szqWxU/ScF0/QITQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
	spf=softfail smtp.mailfrom=demonlair.co.uk smtp.remote-ip=217.43.3.134;
	dmarc=none header.from=demonlair.co.uk;
	arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=AaVvclh9QZ53PLSnyOJZ8mzm2MIO2jd4GM/cgUMkd+o=;
	b=leqWNAvfbUwKVMIca8V8cB42gLdOAxnLWreZsnmoHG1KnVXqO1RNI2xiI6HzU/nq0oZ4YOEOJB4/3
	 UV7jWx9suy8DnRvzRTIizoT5oi2f//I5IXjoGS+qptz/r5dvD4jm7em37cJq0GgTZ5Tr6ESHjEJZpS
	 0U/8tPsjWc3pf+AQ0V20mdz+myOd1xm5aKEDWIUcFZrve0ps3qHBTyOYHmEw+byjekRLyNHvONP8zl
	 dt9Es9zunA2DxaMeXwJIHgcAEyGGvsKgbeHPzl/7WgJVnI4umPqel5h5CW9Dq9v7ur88cIygY2Jxxv
	 0r99P3lvRserXXW30uoXBUQXwGhn2ow==
X-MHO-RoutePath: ZGVtb25sYWly
X-MHO-User: 89f053c2-91df-11ef-9b6c-7b4c7e2b9385
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from phoenix.demonlair.co.uk (host217-43-3-134.range217-43.btcentralplus.com [217.43.3.134])
	by outbound2.eu.mailhop.org (Halon) with ESMTPA
	id 89f053c2-91df-11ef-9b6c-7b4c7e2b9385;
	Thu, 24 Oct 2024 08:11:17 +0000 (UTC)
Received: from [10.57.1.52] (neptune.demonlair.co.uk [10.57.1.52])
	by phoenix.demonlair.co.uk (Postfix) with ESMTP id D9D111EA107;
	Thu, 24 Oct 2024 09:11:14 +0100 (BST)
Message-ID: <dfe48df3-5527-4aed-889a-224221cbd190@demonlair.co.uk>
Date: Thu, 24 Oct 2024 09:11:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Content-Language: en-GB
To: Adrian Vovk <adrianvovk@gmail.com>, Christoph Hellwig <hch@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk, song@kernel.org,
 yukuai3@huawei.com, agk@redhat.com, snitzer@kernel.org,
 Mikulas Patocka <mpatocka@redhat.com>, adrian.hunter@intel.com,
 quic_asutoshd@quicinc.com, ritesh.list@gmail.com, ulf.hansson@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, kees@kernel.org,
 gustavoars@kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain> <ZvJt9ceeL18XKrTc@infradead.org>
 <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org>
 <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org>
 <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org>
 <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
From: Geoff Back <geoff@demonlair.co.uk>
In-Reply-To: <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 24/10/2024 03:52, Adrian Vovk wrote:
> On Wed, Oct 23, 2024 at 2:57 AM Christoph Hellwig <hch@infradead.org> wrote:
>> On Fri, Oct 18, 2024 at 11:03:50AM -0400, Adrian Vovk wrote:
>>> Sure, but then this way you're encrypting each partition twice. Once by the dm-crypt inside of the partition, and again by the dm-crypt that's under the partition table. This double encryption is ruinous for performance, so it's just not a feasible solution and thus people don't do this. Would be nice if we had the flexibility though.

As an encrypted-systems administrator, I would actively expect and
require that stacked encryption layers WOULD each encrypt.  If I have
set up full disk encryption, then as an administrator I expect that to
be obeyed without exception, regardless of whether some higher level
file system has done encryption already.

Anything that allows a higher level to bypass the full disk encryption
layer is, in my opinion, a bug and a serious security hole.

Regards,

Geoff.


>> Why do you assume the encryption would happen twice?
> I'm not assuming. That's the behavior of dm-crypt without passthrough.
> It just encrypts everything that moves through it. If I stack two
> layers of dm-crypt on top of each other my data is encrypted twice.
>
>>>> Because you are now bypassing encryption for certainl LBA ranges in
>>>> the file system based on hints/flags for something sitting way above
>>>> in the stack.
>>>>
>>> Well the data is still encrypted. It's just encrypted with a different key. If the attacker has a FDE dump of the disk, the data is still just as inaccessible to them.
>> No one knows that it actually is encryped.  The lower layer just knows
>> the skip encryption flag was set, but it has zero assurance data
>> actually was encrypted.
> I think it makes sense to require that the data is actually encrypted
> whenever the flag is set. Of course there's no way to enforce that
> programmatically, but code that sets the flag without making sure the
> data gets encrypted some other way wouldn't pass review.
>
> Alternatively, if I recall correctly it should be possible to just
> check if the bio has an attached encryption context. If it has one,
> then just pass-through. If it doesn't, then attach your own. No flag
> required this way, and dm-default-key would only add encryption iff
> the data isn't already encrypted.
>
> Would either of those solutions be acceptable?
>
> Best,
> Adrian
>


