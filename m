Return-Path: <linux-arm-msm+bounces-35736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4939AF28E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0049528B3AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE83A22B650;
	Thu, 24 Oct 2024 19:21:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.stoffel.org (mail.stoffel.org [172.104.24.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3F22B647;
	Thu, 24 Oct 2024 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.104.24.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729797701; cv=none; b=sq2X+sywZA+qh347weAjZHc3WzY5V2GWR2jXTgLQgEo6dpXyCFswqoTMh4AIeX1zX8JpFcVZG49ngzdryiFXl86QtYow7l4mrrCnAa/66i4PDiOs6nBk4zk3qKXXIYLzcg8RDgLyMlW6WsGlzPa+3G+YS6CrSEA8Ua+JIX/6qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729797701; c=relaxed/simple;
	bh=x5W7AHA7QoAl5BXhjCt2PyWAEngxusuwMWAjkEDBeo0=;
	h=MIME-Version:Content-Type:Message-ID:Date:From:To:Cc:Subject:
	 In-Reply-To:References; b=PxOhcxMBGdauYdzIRRSBXk/D49odILolP0HuBQyL988spgtEAOi9Gu2TSrQ0ohI9M4ekyjOiur8qq6eCr9qh7z/DOoGeQtpDQIwB+98KnNyBZMbv0ebiNH/UrAZxKv55qUKpyno9LzuWGK5Jc6Q4YXiw71mOr4A8Qi+L06zwhaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stoffel.org; spf=pass smtp.mailfrom=stoffel.org; arc=none smtp.client-ip=172.104.24.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stoffel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stoffel.org
Received: from quad.stoffel.org (syn-097-095-183-072.res.spectrum.com [97.95.183.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id B72191E468;
	Thu, 24 Oct 2024 15:21:37 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 15731A0A8C; Thu, 24 Oct 2024 15:21:37 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <26394.40513.57614.718772@quad.stoffel.home>
Date: Thu, 24 Oct 2024 15:21:37 -0400
From: "John Stoffel" <john@stoffel.org>
To: Adrian Vovk <adrianvovk@gmail.com>
Cc: Geoff Back <geoff@demonlair.co.uk>,
    Christoph Hellwig <hch@infradead.org>,
    Eric Biggers <ebiggers@kernel.org>,
    Md Sadre Alam <quic_mdalam@quicinc.com>,
    axboe@kernel.dk,
    song@kernel.org,
    yukuai3@huawei.com,
    agk@redhat.com,
    snitzer@kernel.org,
    Mikulas Patocka <mpatocka@redhat.com>,
    adrian.hunter@intel.com,
    quic_asutoshd@quicinc.com,
    ritesh.list@gmail.com,
    ulf.hansson@linaro.org,
    andersson@kernel.org,
    konradybcio@kernel.org,
    kees@kernel.org,
    gustavoars@kernel.org,
    linux-block@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    linux-raid@vger.kernel.org,
    dm-devel@lists.linux.dev,
    linux-mmc@vger.kernel.org,
    linux-arm-msm@vger.kernel.org,
    linux-hardening@vger.kernel.org,
    quic_srichara@quicinc.com,
    quic_varada@quicinc.com
X-Clacks-Overhead: GNU Terry Pratchett
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
In-Reply-To: <CAAdYy_=n19fT2U1KUcF+etvbLGiOgdVZ7DceBQiHqEtXcOa-Ow@mail.gmail.com>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
	<20240916085741.1636554-2-quic_mdalam@quicinc.com>
	<20240921185519.GA2187@quark.localdomain>
	<ZvJt9ceeL18XKrTc@infradead.org>
	<ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
	<ZxHwgsm2iP2Z_3at@infradead.org>
	<CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
	<ZxH4lnkQNhTP5fe6@infradead.org>
	<D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
	<ZxieZPlH-S9pakYW@infradead.org>
	<CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
	<dfe48df3-5527-4aed-889a-224221cbd190@demonlair.co.uk>
	<CAAdYy_=n19fT2U1KUcF+etvbLGiOgdVZ7DceBQiHqEtXcOa-Ow@mail.gmail.com>
X-Mailer: VM 8.3.x under 28.2 (x86_64-pc-linux-gnu)

>>>>> "Adrian" =3D=3D Adrian Vovk <adrianvovk@gmail.com> writes:

> On Thu, Oct 24, 2024 at 4:11=E2=80=AFAM Geoff Back <geoff@demonlair.c=
o.uk> wrote:
>>=20
>>=20
>> On 24/10/2024 03:52, Adrian Vovk wrote:
>> > On Wed, Oct 23, 2024 at 2:57=E2=80=AFAM Christoph Hellwig <hch@inf=
radead.org> wrote:
>> >> On Fri, Oct 18, 2024 at 11:03:50AM -0400, Adrian Vovk wrote:
>> >>> Sure, but then this way you're encrypting each partition twice. =
Once by the dm-crypt inside of the partition, and again by the dm-crypt=
 that's under the partition table. This double encryption is ruinous fo=
r performance, so it's just not a feasible solution and thus people don=
't do this. Would be nice if we had the flexibility though.
>>=20
>> As an encrypted-systems administrator, I would actively expect and
>> require that stacked encryption layers WOULD each encrypt.  If I hav=
e
>> set up full disk encryption, then as an administrator I expect that =
to
>> be obeyed without exception, regardless of whether some higher level=

>> file system has done encryption already.
>>=20
>> Anything that allows a higher level to bypass the full disk encrypti=
on
>> layer is, in my opinion, a bug and a serious security hole.

> Sure I'm sure there's usecases where passthrough doesn't make sense.
> It should absolutely be an opt-in flag on the dm target, so you the
> administrator at setup time can choose whether or not you perform
> double-encryption (and it defaults to doing so). Because there are
> usecases where it doesn't matter, and for those usecases we'd set
> the flag and allow passthrough for performance reasons.

If you're so concerend about security that you're double or triple
encrypting data at various layers, then obviously skipping encryption
at a lower layer just because an upper layer says "He, I already
encrypted this!" just doesn't make any sense. =20

So how does your scheme defend against bad actors?  I'm on a system
with an encrypted disk.  I make a file and mount it with loop, and the
encrypt it.  But it's slow!  So I turn off encryption.  Now I shutdown
the loop device cleanly, unmount, and reboot the system.  So what
should I be seing in those blocks if I examine the plain file that's
now not mounted? =20

Could this be a way to smuggle data out because now the data written
to the low level disk is encypted with a much weaker algorithm?  So I
can just take the system disk and read the raw data and find the data? =
=20

I'm not saying it's going to be easy or simple, but is it possible? =20=


John



