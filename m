Return-Path: <linux-arm-msm+bounces-34977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEADB9A41E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 17:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16A30B210F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 15:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F381E0DF2;
	Fri, 18 Oct 2024 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez7yx+zR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C67BAEC;
	Fri, 18 Oct 2024 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729263837; cv=none; b=mFjxJc/MjcBx1SCh09RJLACPmKoTZy+WBX8hbShK5VpME0yOTUYYtK6OEHUW9npMcTfFpMp+zONnWU49jkpTb0KD1DswXHmuWSurstPOsk3XCL+P3WSo9Xlo5SBwMEBHDf1SEWNr71e90uMRCV5swCdKdR9sebqfVOldAD5+I6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729263837; c=relaxed/simple;
	bh=2bfs2UEwo6ToOh8FqCQeqUWi9lfpjMNVBp5cRaIPVyM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qOHg6NFxP9+OqpHXFgoEyImxuhHbj5Ye81pQi3wk9wtzNpg/BWtL7XmsG7HA1Vcvp9xFzG2Y5HXRl34Hsjjbs0JWRfVgzlXlSKM8yBxk3CdkoBjDwek1MK7q/RT+nRV7xSPaJ5/RE0oc59iJUkxsCU4D5tdI/wHhphv8ZcTwgHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez7yx+zR; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4603aced3a5so16855491cf.1;
        Fri, 18 Oct 2024 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729263834; x=1729868634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2bfs2UEwo6ToOh8FqCQeqUWi9lfpjMNVBp5cRaIPVyM=;
        b=ez7yx+zR0cD5xTGSdsBViwj41n6ij5LFvlr809gs3Pqj5jiaQONjZ0TvKI14NOv2rD
         fbtDc7PYJcNmtgIdFXl5MO8Xnj/mL++/TjLIolhw4e1/C2r+I5y7b3juoFrOVY+esD8U
         L0/xTM76u8/BQxoHahMieWnTYcsh7gElxoDV9K1NnT/cmvXsIUeA4IRmN0/Gh++D6Nan
         yqWaDwdAYDwv+2jPtFMKb6uJgFl+fw/9I5qYhlXoXJan20DZrE9HU51IRxbwPq/uT0aM
         kGGG+MQzd3kpgomxbEUG0+HzyVf+h2+dCSks34G2k8/+4ajUM+BIeJd8xgcEy2NjMCS3
         6Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729263834; x=1729868634;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bfs2UEwo6ToOh8FqCQeqUWi9lfpjMNVBp5cRaIPVyM=;
        b=DgztNlIFSGvleZu1xB7H3zbHm1rTfc/h0QfwPn1WZiF50qRUh+acI1T5k3hrdnE3lS
         NBCrRIm1t4cKqkFHX9ZpjgrGqSZCJGY1w5Sz0zvMcfuXj2wcvSuqSEI3D/KPgxq/9sNF
         ByIhKxvfl9khDm+ZWp1+ZOqvOlhDAMXWq1XFlgnUwPVXAhpR9rcAXIQeEsGQXQTU0Apv
         Fcxp0QCwdrgG9JUZSTH3t23Hk8Bc/KZYAwdlWaGNA5LTds+i2UtOO178qUerDA/TR+jH
         xxnx3qhBVLCJ2LRkUlIy0pFK71BktMdbqsRUccMTMGKp0HqMIjvzn9GyG0UmbtvDITaY
         cZeg==
X-Forwarded-Encrypted: i=1; AJvYcCVHKZgzzZ/bAvoZCa/nenuBBBR9x7xvs1llYlqiCv7jtFbKeprhkgjE1m8f4t+9opxJc+o8WeaFIcEBBOd33y4o@vger.kernel.org, AJvYcCVLvOfMK+8FhI2E4iQ17WaQQEKe9KgaoIOcPE9acHCkwlL2LcEiNdVooYXyGrxTb3DyIEprBJR0H6CEJ2iz@vger.kernel.org, AJvYcCVlZ7oRwOQgSFgZDM986eLXjBQPVvVAuWK15pnav+RQLKeAB4FxiX0jPn/bIoq2+abMft/MBoezeUnOAQ==@vger.kernel.org, AJvYcCWCLZJJ2L3WHhpAK9wKyn7d1LiZE6Yz/eA7XvWz0O/MSSmlsMaUIUeuTrrsGgEKpRalfNOaosxdU9KR@vger.kernel.org, AJvYcCXVFpBHAtHErX2nf5opVVo1T0Imku4li7Y1Ril94azImZeS7TO4C8V5KR8gQjsCLP6bhqepnHMmIxYx/qfR@vger.kernel.org, AJvYcCXa+yIxV6JqKMN9qXSvJmkhPC0Z7W/O5Xty+eTUUNlxlLl2hjKlXXzJGOuOOxz5mL5gOn9NpQyvAfPvRiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzggh6hO9be8tUQP1pVY5lRQhOffZKIM8RbgOS1dU63A9t261Gq
	UkWoQS/PsFT9ECs4AqKAF65OHQpghR/VYZDx/c5QZBG775CryzQ2
X-Google-Smtp-Source: AGHT+IFtSxqYQ+Uh1KxSL4gmbFP2b5u4RAOEyxYYnsypWhrbsVj/jXKkNnFmi1COXRELCZUTv+Zc5A==
X-Received: by 2002:a05:622a:2309:b0:460:8be6:9b00 with SMTP id d75a77b69052e-460aede585bmr37176911cf.50.1729263833772;
        Fri, 18 Oct 2024 08:03:53 -0700 (PDT)
Received: from [127.0.0.1] (syn-076-188-177-122.res.spectrum.com. [76.188.177.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460b818e356sm2189391cf.69.2024.10.18.08.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 08:03:53 -0700 (PDT)
Date: Fri, 18 Oct 2024 11:03:50 -0400
From: Adrian Vovk <adrianvovk@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
CC: Eric Biggers <ebiggers@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 axboe@kernel.dk, song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
 snitzer@kernel.org, Mikulas Patocka <mpatocka@redhat.com>,
 adrian.hunter@intel.com, quic_asutoshd@quicinc.com, ritesh.list@gmail.com,
 ulf.hansson@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
User-Agent: Thunderbird for Android
In-Reply-To: <ZxH4lnkQNhTP5fe6@infradead.org>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com> <20240916085741.1636554-2-quic_mdalam@quicinc.com> <20240921185519.GA2187@quark.localdomain> <ZvJt9ceeL18XKrTc@infradead.org> <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com> <ZxHwgsm2iP2Z_3at@infradead.org> <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com> <ZxH4lnkQNhTP5fe6@infradead.org>
Message-ID: <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 18, 2024 1:56:38 AM EDT, Christoph Hellwig <hch@infradead=2Eorg=
> wrote:
>On Fri, Oct 18, 2024 at 01:44:19AM -0400, Adrian Vovk wrote:
>> > So just run a target on each partition=2E
>>=20
>>=20
>> That has different semantics=2E If I encrypt each virtual partition the=
re's
>> nothing encrypting the metadata around the virtual partitions=2E Of cou=
rse,
>> this is a rather contrived example but point stands, the semantics are
>> different=2E
>
>Then you set up an dm-crype device mapper table for the partition table a=
s
>well=2E

Sure, but then this way you're encrypting each partition twice=2E Once by =
the dm-crypt inside of the partition, and again by the dm-crypt that's unde=
r the partition table=2E This double encryption is ruinous for performance,=
 so it's just not a feasible solution and thus people don't do this=2E Woul=
d be nice if we had the flexibility though=2E

Plus, I'm not sure that such a double encryption approach is even feasible=
 with blk-crypto=2E Is the blk-crypto engine capable of receiving two keys =
and encrypting twice with them?

>
>> > This is the prime example of why allowing higher layers to skip
>> > encryption is a no-go=2E
>> >
>>=20
>> In what way does that break the file system's security model? Could you
>> elaborate on what's objectionable about the behavior here?
>
>Because you are now bypassing encryption for certainl LBA ranges in
>the file system based on hints/flags for something sitting way above
>in the stack=2E
>

Well the data is still encrypted=2E It's just encrypted with a different k=
ey=2E If the attacker has a FDE dump of the disk, the data is still just as=
 inaccessible to them=2E

In fact, allowing for this will let us tighten up security instead of punc=
hing holes=2E It would let us put encrypted home directories on top of full=
-disk encryption=2E So if an attacker has a disk image and the FDE key, the=
y still wouldn't be able to decrypt the user's home directory because they'=
d need more keys=2E We also want to put fscrypt on top of the encrypted hom=
e directories to encrypt each app data directory, so if you have a banking =
app the attacker wouldn't be able to get that app's data even if they manag=
e to get your home directory key=2E Right now, doing something like this re=
quires stacking encryption and is thus unfeasible and we can't do it, so we=
're stuck with one layer of full disk encryption and no isolation between u=
sers and apps=2E

Thanks,
Adrian

