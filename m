Return-Path: <linux-arm-msm+bounces-35662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFBE9ADE32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ACED1C2256A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 07:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFE51AAE3F;
	Thu, 24 Oct 2024 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/SNzV/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283A18B488;
	Thu, 24 Oct 2024 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729756350; cv=none; b=jiq2gXxcV0rMv/TqJlWFjPsIyoQ6JAVQgSo/mEk4//8sPIHnwy3Z1EL9I/qHolyCaZtKwH6oiV60uHxbn/PxuhEwzpbiShUBKQBEXtd6Aeso6P8rNJIr6l3JnVzCgdtZMt5djgCa9AcmfCoN9riy0gPB/fIHdnGQ8ClTi/u7BXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729756350; c=relaxed/simple;
	bh=3bsoItA4FoWHgxKrlTUQpSwnVMUBVNKejfINlmF4PYs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YutRaMIorE3joki4j42utFS75UOiPGVEGKeXAtANjC9xjYlHYhrWjFBiEPHvv8oryU+lohTVBVEH8xJ9o9sqbKpqCK9xNQibPL0vJD9+Llrz7oSYz7z88GwZCP1eKLeFjS0nWZ8eQu8vDaAi1/228nN9sM8l7G8ShXO3mEC3Yyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/SNzV/8; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cd7a2ed34bso3507616d6.2;
        Thu, 24 Oct 2024 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729756347; x=1730361147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O0/EFW0Ues6w3fPRU2v9fda5kssgHquHWtzyYPgwJuQ=;
        b=G/SNzV/8d4+5Alz61iZYTXAWd/wcEtwGqeTI+DfDNF1TirErORH6IwiEuphstS3S/x
         d0iJjLN5OCmQ3a6oU3yFnQGKXMbXyf8UNTIdsrNBO426Jy5G4JS6Tk4tXer3CNdrvoPK
         oCnwGZuwRKl1J3I/52gkNmJ2pH3XASMjHFRTCdK4hdMwY47tr6p1tUAFBHjWgp7La2HK
         1yD7Sfr0llgpIdVZMOl8IIdOjwWx0wvT6TvDYItPB4dLIITnvOTNzZPp4ZogQ+ih6Oya
         kZXlzNx+nqUkPbX8ZxPQC8nKBPzPOLJ3dInpYQrX9vaOxaMDTf3na2WzROzigu/RYz8F
         8Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729756347; x=1730361147;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0/EFW0Ues6w3fPRU2v9fda5kssgHquHWtzyYPgwJuQ=;
        b=s0QtRpyI2ba20aOod8N8dYpjklD3eGXF1+33CcqUvnpUf8jqw/+nKmJWVU3VthtISX
         P/yRFe8UTwJrsRMW5+oviehltJOcVeFmelM6gY8w0nslYgI2H4lEFbvbYxL1yqE4ND3d
         Xmc4wI3JLO1i4juhFW/5pt6uQQWW0r/W8eH7elntbGQoqPgwcvqEInxuiSow4opLnCeX
         kujZSumNBGxO5MLnYq7HRIK7e2wegx25jJqTuGggLbu9PL/TFoB28c0QHw5Bu2ApVLhI
         yX8MgXInZQ47dt8MY6tXgkn4rs0MZw+6VWT71XIWZA0J9WycruxtJEQYsxtMBs27rC9o
         dVWA==
X-Forwarded-Encrypted: i=1; AJvYcCU97fEDtEM+VHyNkEcPQemnp3mi9rCD38ouN+FAZBYK4bwcYUMz64E5qgr5eqhHJvUVoldcv3P2eVhdww==@vger.kernel.org, AJvYcCUZolEIeiZcRqCWipv4aJfxz7Q7VzkQa889dRYUNE8h0KGj+JpTMS0I+p2It31APIaeMHM/8XcIjzKFhRY=@vger.kernel.org, AJvYcCV3L7vWaKVle+VrnQUYOTEgldQFY+UQZRTOQlgRRPGbcF3TQNDZIS327UJkop3jFYW82heMZhqjPAeXYFc9@vger.kernel.org, AJvYcCWOJrC6mSGaOU0WCbCF/Dd76MCWKgtZrIVaqJwHbubzJdp8QWi9WXA+4J+vei3TOobB2+CxBRoswqpXsCsG@vger.kernel.org, AJvYcCWqb3qus818YpuYB5ZH6QWhF7FfioFNOmoED4hHr0kT4VVrxSrTX04udtYolEXt9FD8Jdh/k/MVJZGcHdslKevN@vger.kernel.org, AJvYcCXsJTojbj9PNcZTx5Ddp2hkaHwS600w7FHkY9JO2Pvz8qbPEJAhkJ6z79gVA6L2XHNTcxu2sWHRw/04@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8HQFJ4isFLiVcen7uyd6w32/qB1o8BMh/NUfPz7NYu23oK9R
	o1Vv+/YFfjUGzsY7Zqg5MvpO1d7p3Txmu5Xki1wE89/f21emj4K6
X-Google-Smtp-Source: AGHT+IFy8n3my83FIpBvse1TJXvT5l1N0qfdSpBUn31spF9HVcMzbXW4pytU5zfKNTw3TxdD0g0ncw==
X-Received: by 2002:a05:6214:3f8e:b0:6cc:51f:6c41 with SMTP id 6a1803df08f44-6ce34284a29mr65067106d6.36.1729756347374;
        Thu, 24 Oct 2024 00:52:27 -0700 (PDT)
Received: from [127.0.0.1] (syn-076-188-177-122.res.spectrum.com. [76.188.177.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008acc1fsm46933966d6.20.2024.10.24.00.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 00:52:27 -0700 (PDT)
Date: Thu, 24 Oct 2024 03:52:24 -0400
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
In-Reply-To: <Zxnl4VnD6K6No4UQ@infradead.org>
References: <20240916085741.1636554-2-quic_mdalam@quicinc.com> <20240921185519.GA2187@quark.localdomain> <ZvJt9ceeL18XKrTc@infradead.org> <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com> <ZxHwgsm2iP2Z_3at@infradead.org> <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com> <ZxH4lnkQNhTP5fe6@infradead.org> <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com> <ZxieZPlH-S9pakYW@infradead.org> <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com> <Zxnl4VnD6K6No4UQ@infradead.org>
Message-ID: <14126375-5F6F-484A-B34B-F0C011F3A9C5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 24, 2024 2:14:57 AM EDT, Christoph Hellwig <hch@infradead=2Eorg=
> wrote:
>On Wed, Oct 23, 2024 at 10:52:06PM -0400, Adrian Vovk wrote:
>> > Why do you assume the encryption would happen twice?
>>=20
>> I'm not assuming=2E That's the behavior of dm-crypt without passthrough=
=2E
>> It just encrypts everything that moves through it=2E If I stack two
>> layers of dm-crypt on top of each other my data is encrypted twice=2E
>
>Sure=2E  But why would you do that?

As mentioned earlier in the thread: I don't have a usecase specifically fo=
r this and it was an example of a situation where passthrough is necessary =
and no filesystem is involved at all=2E Though, as I also pointed out, a us=
ecase where you're putting encrypted virtual partitions on an encrypted LVM=
 setup isn't all that absurd=2E

In my real-world case, I'm putting encrypted loop devices on top of a file=
system that holds its own sensitive data=2E Each loop device has dm-crypt i=
nside and uses a unique key, but the filesystem needs to be encrypted too (=
because, again, it has its own sensitive data outside of the loop devices)=
=2E The loop devices cannot be put onto their own separate partition becaus=
e there's no good way to know ahead of time how much space either of the pa=
rtitions would need: sometimes the loop devices need to take up loads of sp=
ace on the partition, and other times the non-loop-device data needs to tak=
e up that space=2E And to top it all off, the distribution of allocated spa=
ce needs to change dynamically=2E

The current Linux kernel does not support this use-case without double enc=
ryption=2E The loop devices are encrypted once with their own dm-crypt inst=
ance=2E Then that same data is encrypted a second time over by the partitio=
n=2E

Actually this scenario is simplified=2E We actually want to use fscrypt in=
side of the loopback file too=2E So actually, without the passthrough mecha=
nism some data would be encrypted three distinct times=2E

>> > No one knows that it actually is encryped=2E  The lower layer just kn=
ows
>> > the skip encryption flag was set, but it has zero assurance data
>> > actually was encrypted=2E
>>=20
>> I think it makes sense to require that the data is actually encrypted
>> whenever the flag is set=2E Of course there's no way to enforce that
>> programmatically, but code that sets the flag without making sure the
>> data gets encrypted some other way wouldn't pass review=2E
>
>You have a lot of trusted in reviers=2E But even that doesn't help as
>the kernel can load code that never passed review=2E

Ultimately, I'm unsure what the concern is here=2E

It's a glaringly loud opt-in marker that encryption was already performed =
or is otherwise intentionally unnecessary=2E The flag existing isn't what p=
unches through the security model=2E It's the use of the flag that does=2E =
I can't imagine anything setting the flag by accident=2E So what are you ac=
tually concerned about? How are you expecting this flag to actually be misu=
sed?

As for third party modules that might punch holes, so what? 3rd party modu=
les aren't the kernel's responsibility or problem

>> Alternatively, if I recall correctly it should be possible to just
>> check if the bio has an attached encryption context=2E If it has one,
>> then just pass-through=2E If it doesn't, then attach your own=2E No fla=
g
>> required this way, and dm-default-key would only add encryption iff
>> the data isn't already encrypted=2E
>
>That at least sounds a little better=2E=20

Please see my follow up=2E This is actually not feasible because it doesn'=
t work=2E Sometimes, fscrypt will just ask to move encrypted blocks around =
without providing an encryption context; the data doesn't need to be decryp=
ted to be reshuffled on disk=2E This flag-less approach I describe would ac=
tually just break: it it would unintentionally encrypt that data during shu=
ffling=2E

> But it still doesn't answer
>why we need this hack instead always encrypting at one layer instead
>of splitting it up=2E

In my loopback file scenario, what would be the one layer that could handl=
e the encryption?

- the loopback files are just regular files that happen to have encrypted =
data inside of them=2E Doing it a different way changes the semantics: with=
 a loopback file, I'm able to move it into a basic FAT filesystem and back =
without losing the encryption on the data

- the filesystem is completely unaware of any encryption=2E The loopback f=
iles are just files with random content inside=2E The filesystem itself is =
encrypted from below by the block layer=2E So, there's nothing for it to do=
=2E

- the underlying instance of dm-crypt is encrypting a single opaque blob o=
f data, and so without explicit communication from above it cannot possibly=
 know how to handle this=2E

Thus, I don't see a single layer that can handle this=2E The only solution=
 is for upper layers to communicate downward=2E

Best,
Adrian 

