Return-Path: <linux-arm-msm+bounces-35640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A429E9ADA27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 04:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F281C2134E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 02:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AAD154456;
	Thu, 24 Oct 2024 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQZYfOsS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0054C1CD3F;
	Thu, 24 Oct 2024 02:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729738340; cv=none; b=I17i4B56ThPZvzuQcE8q7DDyMwueSuZhBpegn5OAZgdc6oQwun4V5cyPAKZc/s9TQa14qLYpgXwp9W3EaOfCinu7u/oX/0uLR3MlQNfDobFhcGOC4BKRQqCK4owD0qbeMi0xq1/pmH8Md3xRU35/oGlzbEdENjeCXgtVuJBrZ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729738340; c=relaxed/simple;
	bh=e63VNaMSa5J1MM9PfLmc6REGdLxKMyEsmvWlF5WdUQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGfZNEx5zSMesTHheEfD3e82WP+2cOtVWzIOcygSvRPyBKNulArEWYjos+8+65kCM6aU5MkA0T5IRvwgxttmeSqqQb/NtnjJufEdTKsgC//KUCbwrC9+Ic91YNbedWUKxsFFpu7F9/Fyo9II69WWMCwPWVJGSoUZU2hMiYbRkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQZYfOsS; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e3c3da5bcdso4562867b3.2;
        Wed, 23 Oct 2024 19:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729738338; x=1730343138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYASeKGsrTpRCjUsk5sbA5D7FM/sG/Zf4Yorg4QsRoE=;
        b=LQZYfOsSkvGsGhxzjT9ois6SBT6ahbJxk5ThEm8rPrGtMe0ptmCbjYd1wvbAFLJQzG
         jmG+RS0+Wcenl8Nw6JUsVoBwc+TNKAqrFkfe3ZWLUheB0wcv/7hrLKUA+paM2ZTRB0d2
         +IDricPzHci9iOblC8zAIcgCVH/dKpX9wyIiUWhsI4k1VpUBjxQgSxzG1ZBGQEYV8HmP
         2jy1Rkt1ThlPSR8R09NUA/09hxWg6PLbqU7iNgetUmDGAHVThe7cQYM9SCSbBFIa6LwF
         tgtrZ/De1S3pFGr4cJO6raYxciFQfgT9rrs+gcLwFjWXVEvoI244CQj2chj2NUm5riIc
         3ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729738338; x=1730343138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYASeKGsrTpRCjUsk5sbA5D7FM/sG/Zf4Yorg4QsRoE=;
        b=ez9usyPv6O9b3daBBQtEJwqFOGlPhiI2BOc2enp2a4Fk6gLwf0mV8Vjdj+kKkjmgPO
         wIS8gQKm7u7+q4r+HKCnwhDJ7fHP8haBvqEd4hD4bd7f4W53G9E/FlwuP1B7U6WWdloB
         XWSfNHgw5lniQgm3xFIFU0Vd6Wi1InUavWIBCl5EQM5cUMSiuYeTJU8al97CdHxBLAw6
         +WAhYiM/26ftYqxkfp24moddCR+4hV0dtl3yqVl91soFy5rafaSr8KAXI1OA3csITmkp
         MUV/pnNfyRZF0poRu6sMNwlpproFejlhjwN2pWS+HSS0Qd/g73dghFtv2hPVz6oJ9abV
         R3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1IqmBophzEUsjLWCcmjChzsosR+rhxQAuwquOa+id/uAS0CTr7yjOZJhnuzpyBR1l4ElsGq1wfOF8FlA=@vger.kernel.org, AJvYcCUOddC5PhiZPolCTzEpe1PHLI2elpbIeCfzYguFMVEEsVIUHL5+hWWKG033Tz0riXsy+tmhrN4pLam4s+as@vger.kernel.org, AJvYcCUdkxi2ntqa5Zyh6f5lVCosWyNoy54hX7m6d6DZ0PAIJm6xOkEmUVo5IhPon/CmiQgxQsfxqEVMLfFIt3n7xQIv@vger.kernel.org, AJvYcCUl1UnaOBr6Jyxe8P3sFO8092LvALE4kKuu18kqEn/iJdpkMVhG/fZEVDhCxb7BL39WQOeEdiyzWi6N/Q==@vger.kernel.org, AJvYcCVywGxY+mZcAoeHDcvwccYkmwpnQkNTVAjdVNsaQl+odLjPnNhTWLp8BLgEXr3jySv4L6vis++M58nc@vger.kernel.org, AJvYcCWWJTQdlpb0SKMzsXrnCmMoN/fCe5hkBiBtzj4HeHMg1AyGg3LAF7Oo3cdq+kX/mKTV+tcNaVGB4DWEQJmd@vger.kernel.org
X-Gm-Message-State: AOJu0YwjG7aj2GOCb2mcW79q1cFNSZvu1R/tG5DJmBEF7ZQlvm6m3Ti7
	v0nAlpJHHXYp4ADdGL5CbvtnW+n78PqccUrR8scibLIOzuShvtfyt7cP8inw0/ifwltXjrqRFR8
	8ai9S4Nfsrr+FAVgSDAspMkv0/vo=
X-Google-Smtp-Source: AGHT+IEDx8M9M5NfSQJM7sAyVqEx9xZRtt9pauz51dGR+BiVqQQoapvIb1oapCtzf34De00rMCmJwCTHDkr7sJLMo74=
X-Received: by 2002:a05:690c:f10:b0:6e3:1259:7ef2 with SMTP id
 00721157ae682-6e7f0df5ce6mr55492627b3.3.1729738337910; Wed, 23 Oct 2024
 19:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com> <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org> <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org> <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org> <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org>
In-Reply-To: <ZxieZPlH-S9pakYW@infradead.org>
From: Adrian Vovk <adrianvovk@gmail.com>
Date: Wed, 23 Oct 2024 22:52:06 -0400
Message-ID: <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
To: Christoph Hellwig <hch@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk, 
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com, snitzer@kernel.org, 
	Mikulas Patocka <mpatocka@redhat.com>, adrian.hunter@intel.com, quic_asutoshd@quicinc.com, 
	ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org, 
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 2:57=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Oct 18, 2024 at 11:03:50AM -0400, Adrian Vovk wrote:
> > Sure, but then this way you're encrypting each partition twice. Once by=
 the dm-crypt inside of the partition, and again by the dm-crypt that's und=
er the partition table. This double encryption is ruinous for performance, =
so it's just not a feasible solution and thus people don't do this. Would b=
e nice if we had the flexibility though.
>
> Why do you assume the encryption would happen twice?

I'm not assuming. That's the behavior of dm-crypt without passthrough.
It just encrypts everything that moves through it. If I stack two
layers of dm-crypt on top of each other my data is encrypted twice.

> > >Because you are now bypassing encryption for certainl LBA ranges in
> > >the file system based on hints/flags for something sitting way above
> > >in the stack.
> > >
> >
> > Well the data is still encrypted. It's just encrypted with a different =
key. If the attacker has a FDE dump of the disk, the data is still just as =
inaccessible to them.
>
> No one knows that it actually is encryped.  The lower layer just knows
> the skip encryption flag was set, but it has zero assurance data
> actually was encrypted.

I think it makes sense to require that the data is actually encrypted
whenever the flag is set. Of course there's no way to enforce that
programmatically, but code that sets the flag without making sure the
data gets encrypted some other way wouldn't pass review.

Alternatively, if I recall correctly it should be possible to just
check if the bio has an attached encryption context. If it has one,
then just pass-through. If it doesn't, then attach your own. No flag
required this way, and dm-default-key would only add encryption iff
the data isn't already encrypted.

Would either of those solutions be acceptable?

Best,
Adrian

