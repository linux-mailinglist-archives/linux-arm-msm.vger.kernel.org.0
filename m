Return-Path: <linux-arm-msm+bounces-35744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCB9AF403
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 22:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92351C227CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B3E2170CF;
	Thu, 24 Oct 2024 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKndqoH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DFC2003C2;
	Thu, 24 Oct 2024 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802747; cv=none; b=p0ohv6b5JqwxuaRebBWjpHaS0QpEvfQ20hpOl7YYW9oAyxWrgUjJsCbk5Z1A3PXAd6bQUhNfnLKskqX4keaKnqADS/3fnYb4Dnc3Zgt9uL3+76TCUaX/Mt5DkoguGx3TGDgg73cuhkJ5nBOcFcuEct4yryiIfkbCRKaXn/J9kdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802747; c=relaxed/simple;
	bh=3ayg46zIKeFZoO+X2Wcnl0LIEXu6WGk1odc9VLIfr8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RO8yFf0MkU/dAysEdskFTCNCA9nqhpIRT8TNKbdPrVNJJ2AvhTi7iAH4SMcpfznJmvXU/zifGjviu2up7Q+ASQWrQXYoOnus861+UIN5v75uzOoQF6UuIUoSIkQPQRj5vIbR25WTa2WxJSZMPRoE9iVGLBzEu7DDyzSPTXrXcoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKndqoH4; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e3cdbc25a0so17536877b3.2;
        Thu, 24 Oct 2024 13:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729802743; x=1730407543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2U/xmqL6VmN2LwWpIEhhcQQ83Rsr/TgmHhM2/FpOoo=;
        b=BKndqoH47f6os80/G4+SGnlBXPKAVRS/IHFZ2N0HDLzRTF3JuRSXm4lEszvOMWEyXO
         DtQ6N/zweuyRF5JhrlwHLzC35dTVFvNCT+hG4c50+lu8tTBpfp5CpW4ZUpNwGzlfHEzs
         dfl8Kr8qCVFF044e33hXTXH4/WGZ59XPsJK6CaqfO7/KhN3Ljb2cedJUCVKZnmr8cygW
         pupjD34e0hwsG3lTrpA/OjThLgh7Cb4hX9KbzMB+l/oD1yUMIL0THykfb4d016q5vOKh
         62DGB+A/IVijYX1oYm7JUQ+xXHzmTRt1i+L1PzwFNyq/46U4ULgtJ7IYxyccOnD/JwRJ
         Fhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729802743; x=1730407543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2U/xmqL6VmN2LwWpIEhhcQQ83Rsr/TgmHhM2/FpOoo=;
        b=LYipaZbU/4CJMMBLnTfvX1VZjC64878BYnP5bl0FWJabGmDIpz3j35Sgj6bnPXQ4us
         zmJpGS5fz11VjNBw9kwlOPxRfCg202m5jEfNBU+4pIt1QBQVryLIVrfwio0bHU4aUdzb
         eDIzxsfazmDetkWie2ZiFb88USh6j5j+kg/yXZIrJNjbFLeA5TUlRhBKwxABkzogZ/8l
         qyf5UV5lkOzWahTQiTiyN0lrymJXj2hABbu5oyZcaRW541U6Vd2sW51f8Z9ZLc5plVrx
         ZYvBx08aLlDRfiZESCIZ8GLrxdtP7BvlLyQN5IIeww8oRb+tKRC/a7rtRpD8iVriOHL4
         Xgpg==
X-Forwarded-Encrypted: i=1; AJvYcCUI3XEBAauM+Nm43GfOL9/JRRUkvlqzj1DGBY8UWowpCSX2XXjGiIptIAVeyEiu2ThPVRmg3aiMRgXQho8=@vger.kernel.org, AJvYcCUJD6b/zK4ZS5Ap3Hc3OrAn0WJutxElllpznqrzxgG/Jm9BRRUky/6wdT9OP7USwhYbco5x/hZfMDkUbdtl@vger.kernel.org, AJvYcCVEdGOekoyWWZsTRagDBOhn2WNY/EHjJpniT51/lFr3iV1PwNShi8LOIg4uJiAd30HQcrbBHFNO9HeUqy4Z7G0R@vger.kernel.org, AJvYcCVRZhe+GKw+irgOBDu75rtqX2j2BAQDfUglx8+/Rvxi9sVHEvZCsbfoj9yhUIyssU/Z1j65y0yuww6KDA==@vger.kernel.org, AJvYcCVtfKrbjjGi+jO6QnFqX2nEupPnrrkxc/RcauFPPpjRFsy592Is7UI37P1yIBRSxf3hb9rN7/BE3ss/a/Fu@vger.kernel.org, AJvYcCXP4hfWu1c4ZyaEBYYpT4a7X3031qR8PCDjR84xJgVrByxx6sRxxjSnQsahQD/pVxXUtxC2A6gdUcTV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7kF4OdxfYHbDACgdh7PWuhgXRzWn1lxTbLdNIBHeF9OJzGtN
	4rWBQqqaSxvdw9lWhILtQI4pix0jkAOIR484elY0Io7RPmNRZD7YHv+7nuMDc1Q91jxlPNYDaWb
	9+zHjQ/8s8rB86jeIusv03fPKGeY=
X-Google-Smtp-Source: AGHT+IFzblQ9puj991how00tuuoiZFFvFMJ0QTk55nDO5R1JUY5KhEEZ90uHNFgYdfXSVSGbp7B73kNRe+QJs5MwWTg=
X-Received: by 2002:a05:690c:668a:b0:6db:de34:8049 with SMTP id
 00721157ae682-6e7f0e40050mr94523647b3.16.1729802742988; Thu, 24 Oct 2024
 13:45:42 -0700 (PDT)
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
 <ZxieZPlH-S9pakYW@infradead.org> <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
 <dfe48df3-5527-4aed-889a-224221cbd190@demonlair.co.uk> <CAAdYy_=n19fT2U1KUcF+etvbLGiOgdVZ7DceBQiHqEtXcOa-Ow@mail.gmail.com>
 <26394.40513.57614.718772@quad.stoffel.home>
In-Reply-To: <26394.40513.57614.718772@quad.stoffel.home>
From: Adrian Vovk <adrianvovk@gmail.com>
Date: Thu, 24 Oct 2024 16:45:31 -0400
Message-ID: <CAAdYy_=DnhpwOyU0d-UNuLrd+nhQ6kijwxsrJJykL5hJ7Fb5HA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
To: John Stoffel <john@stoffel.org>
Cc: Geoff Back <geoff@demonlair.co.uk>, Christoph Hellwig <hch@infradead.org>, 
	Eric Biggers <ebiggers@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk, 
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

On Thu, Oct 24, 2024 at 3:21=E2=80=AFPM John Stoffel <john@stoffel.org> wro=
te:
>
> >>>>> "Adrian" =3D=3D Adrian Vovk <adrianvovk@gmail.com> writes:
>
> > On Thu, Oct 24, 2024 at 4:11=E2=80=AFAM Geoff Back <geoff@demonlair.co.=
uk> wrote:
> >>
> >>
> >> On 24/10/2024 03:52, Adrian Vovk wrote:
> >> > On Wed, Oct 23, 2024 at 2:57=E2=80=AFAM Christoph Hellwig <hch@infra=
dead.org> wrote:
> >> >> On Fri, Oct 18, 2024 at 11:03:50AM -0400, Adrian Vovk wrote:
> >> >>> Sure, but then this way you're encrypting each partition twice. On=
ce by the dm-crypt inside of the partition, and again by the dm-crypt that'=
s under the partition table. This double encryption is ruinous for performa=
nce, so it's just not a feasible solution and thus people don't do this. Wo=
uld be nice if we had the flexibility though.
> >>
> >> As an encrypted-systems administrator, I would actively expect and
> >> require that stacked encryption layers WOULD each encrypt.  If I have
> >> set up full disk encryption, then as an administrator I expect that to
> >> be obeyed without exception, regardless of whether some higher level
> >> file system has done encryption already.
> >>
> >> Anything that allows a higher level to bypass the full disk encryption
> >> layer is, in my opinion, a bug and a serious security hole.
>
> > Sure I'm sure there's usecases where passthrough doesn't make sense.
> > It should absolutely be an opt-in flag on the dm target, so you the
> > administrator at setup time can choose whether or not you perform
> > double-encryption (and it defaults to doing so). Because there are
> > usecases where it doesn't matter, and for those usecases we'd set
> > the flag and allow passthrough for performance reasons.
>
> If you're so concerend about security that you're double or triple
> encrypting data at various layers, then obviously skipping encryption
> at a lower layer just because an upper layer says "He, I already
> encrypted this!" just doesn't make any sense.

I'm double or triple encrypting data at various layers to give myself
a broader set of keys that I can work with and revoke individually,
not because encrypting the same data more than once makes the
encryption more secure. I expressly _don't_ want to encrypt the data
multiple times, I just want the flexibility to wipe keys from memory
and make parts of the filesystem tree cryptographically inaccessible.

For example: my loop devices. I'd like to stack three layers of
encryption: the backing filesystem is encrypted, the loop devices are
encrypted, and inside the loop devices we use fsverity. Specifically
in my use-case: the backing filesystem is the root filesystem, each
loopback file is a user's home directory, and each folder with fscrypt
encryption belongs to a single app. The root filesystem is protected
with generic full-disk-encryption, and contains both the home
directories and other lightly-sensitive data that can be shared
between users (WiFi passwords, installed software). The
full-disk-encryption key is in memory for as long as the system is
booted, so the data is protected while the system is powered off. Then
on top of that I have the home directories, which are in an encrypted
loopback file encrypted with a key derived from the user's login
password. We deem not only file names and contents sensitive, but also
directory structures and file metadata (xattrs, etc), so fsverity is
not an option for us. The user's encryption key is in memory for as
long as the user is logged in. Note that this is a stronger protection
than the rootfs's encryption: each user's data is protected not only
when the device is off, but also when the user is logged out. A
similar pattern repeats for the fscrypt dirs: each app gets an
fsverity-protected data directory, and keys are only given to the app
while it's running and while the user's session is unlocked. When the
user locks their device, or when an app is closed, that app's keys are
wiped from memory. This way, an attacker can get their hands on a
booted and logged-in device, but as long as it's locked they won't be
able to extract the necessary keys to read your banking app's login
credentials and steal your money (for example...)

That's the encryption scheme I'd like to implement on the Linux
desktop. We're part of the way there already, and we've hit the
double-encryption barrier. Note that none of the security of this
scheme comes from the fact that data is encrypted twice. Again we
don't want the data to be encrypted multiple times: the performance
cost that this would incur is a blocker to implementing this
encryption scheme. We stack encryption so that we can revoke parts of
the key hierarchy, not to actually stack encryption.

> So how does your scheme defend against bad actors?

Hopefully my explanation above makes my threat model and use-case a
bit more clear.

> I'm on a system with an encrypted disk.  I make a file and mount it with =
loop, and the
> encrypt it.  But it's slow!  So I turn off encryption.  Now I shutdown
> the loop device cleanly, unmount, and reboot the system.  So what
> should I be seing in those blocks if I examine the plain file that's
> now not mounted?

Depends on what you mean by "turn off encryption".

I'm going to assume you mean that you just turned on the passthrough
mode in the lower dm-default-key table and did nothing else? In this
case, if you read the loopback file you'll get the ciphertext of the
lower encryption layer, or in other words you'll see the ciphertext
resulting from encrypting the loopback file twice. If you try to mount
the loopback file as you normally do, you'll just see gibberish data,
and the data will be inaccessible until you turn passthrough back off.
You already wrote data to disk that was encrypted twice, and now
you're telling the lower layer to do nothing for those block ranges.
So, the upper layer will see the lower layer's ciphertext, instead of
its own. It'll decrypt the lower layer's ciphertext with the upper
layer's key, and return the gibberish result that this operation
produces. New data you write to the loopback file will work as it's
supposed to: it'll be encrypted once, and can be read back fine.
Similar things will happen if you flip the passthrough flag from on to
off as well.  Changing the passthrough mode flag on a lower layer
requires a reformat of the data inside. It's similar behavior to
setting up dm-crypt with the wrong encryption algorithm or the wrong
key.

Let's say that you _do_ reformat the loopback file when you turn on
passthrough mode. So now you have passthrough mode on, and all data is
encrypted once on disk. Then you try to read the loopback file. You'll
see the same ciphertext that you'd see if you were stacking two
instances of dm-crypt on top of each other. The only difference from
dm-crypt is that this ciphertext is stored directly on disk, instead
of being encrypted a second time. So if you get the LBAs on disk, then
read the disk directly on those LBAs, you'll see the same ciphertext
as reading it through a filesystem. That's the difference.

> Could this be a way to smuggle data out because now the data written
> to the low level disk is encypted with a much weaker algorithm?  So I
> can just take the system disk and read the raw data and find the data?

The weakest encryption algorithm is just storing the plaintext on
disk; XOR with a null key, if you will. Let's say that there's an
out-of-tree device-mapper driver for this, called dm-fake-encryption.
You're asking what would happen if we put an instance of
dm-fake-encryption on top of a passthrough-enabled dm-default-key.

Well, then data that went through dm-fake-encryption will be stored in
plaintext on disk, and data that doesn't go through dm-fake-encryption
will instead go through dm-default-key and get properly encrypted on
disk. If an attacker gets the disk, then all the data that was written
through the dm-fake-encryption layer will be stored in plaintext on
disk and the attacker will be able to read it. Data that didn't go
through dm-fake-encryption will be encrypted on disk and the attacker
will be unable to read it.

However, I don't understand the risk of smuggling this introduces. In
situations where smuggling data through layers of encryption is a risk
factor to worry about (a cloud VPS host?), the administrator would
just disable passthrough. With passthrough off on the layer below,
dm-fake-encryption's signalling is ignored and the data is
double-encrypted anyways. No smuggling possible then.

Could you walk me through a specific attack scenario for this that you
have in mind? Because I can't really think of one, so it's hard to
think of a solution.

Best,
Adrian

