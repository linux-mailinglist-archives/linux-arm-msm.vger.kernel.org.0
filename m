Return-Path: <linux-arm-msm+bounces-83496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B46C8B178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39D4A4E1E27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F324233D6EF;
	Wed, 26 Nov 2025 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EfyIyjXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C7328B50
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176229; cv=none; b=pPQwd+iXIuB9tZErW2fJS54maaGtnnvO/MjPX+lu69lZISAPVhNRn1kP5VTOuMBJ2OWNSnGFbTtDqd5hVOoa9ebayfkWPk38lEneyRCAqhOulSql5fNUnoMyfuZGNeZ3yzWsCP/5D2Mtpa3ii4kURQxwFA1zrP/jQmcFurrjJ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176229; c=relaxed/simple;
	bh=gzXc2LlfH1NtGEWbEAMpuUzR+DbcGYaJo3ZDcCkFLDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu6UEV+yDDBuhXbJN4fw+kLszJzn/baMG4rZZfOvNotQDFjrcv8kfALL1dHvEyp73zno7umI13QXu8iqqE/MfwBGbkmW7SYuFurh/1aEiLksuSAfzanDqYNfwTk9VmbG9rPSWZpLu9v7oh9k9UOV/QWM7h+aZnxtfcJhykq71bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EfyIyjXA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37ce27af365so170211fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764176226; x=1764781026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbqZxnCgIP/lZ7i202XMoKrrxmiILyqg/b2DVygoqY8=;
        b=EfyIyjXAGyxGbbCS+AoYcnknAAEptjCzxQnnPTZGJ+2ABg5VyVObYSwA3iVa+P2Tc/
         MeL+jxmEqxIMX1XNq3JBkEOm8cAF5MQcQL+0qH9hyn1omebjNAxdGqv/NSoqYQ5NtT4T
         91X7F+c7R28w0U/x5IqFOEubWu3QxcoWKcr1fWNqpUyZFT0ygMrb/6MPvnOy0RngjuHs
         tzrGuKl+kZ895rlMMfGlHumgpbuTkO5Tz1aZ1ImBQKGHlPTgbfyinKtzyuM27BpbXh1i
         6D+2jF2IJ+l0M3LQqeiXttHvqSZtk+ZAz2YS+ZUB5x6S1pcWIqVaFaePMSqOLhWSsnvO
         Xy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176226; x=1764781026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EbqZxnCgIP/lZ7i202XMoKrrxmiILyqg/b2DVygoqY8=;
        b=EBGvbSdMF3RxOzhInU8b3T4rGyM0kkVqKskEyHt6Yaaz1kVCHCQk9K1AZ28mzcVl99
         JF7f0i1txeerrISc1f6QAFxVKXQedRH0Niygyaw9qRiit7mTJ2cqBqf1GY09DvWj6aj/
         5IICkBdQKaVEB+KEpIL+e87KADC8h8CRZQ5Ri5Pw1zVuFEpxZku8JvM8LqiLiWxLCygj
         YNL3Tmb6HMJZd//kY4zKxakhhe3RAXFnPkjuNAkI3UFi1AvP3vY05BPofQw7dCqW6MWV
         ze0fBHhhSyhDjRZmnB2UrDx4fDWb7A3MK6o6FBNByH2UgkmRFohrU2w2048FOLUrJwyd
         pbxg==
X-Forwarded-Encrypted: i=1; AJvYcCVbMjFuH9SYrCuqHYUrkz7XLQN8arYtutPcfFV+b0nyOW7jafyb+MFgf8/7KQqSUq6kA1SR49oROnvEjV1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gpmKlDuTOZZ1EYDXp1nXtOUCqhp/rH64QAnEtAktgDw/yVL1
	SldEYYAEcFgpgczWxX7B2PfvaU5eAL0rw+uFynhth9AJ2dzOc/ysvMajJXAOUL++ubG5yCXDKol
	+LtdhrjwpzkHyctfE2MVI0dNkk2cYIWQBzc/sOoN74g==
X-Gm-Gg: ASbGncvfZMjQLMJKHAaXNKaxKAjurKffGRIy8Y+g7oJ9Q4EgqFxN1q0h6HXdTWWI5uC
	gfx353RLphAkPDnRyeRJg16kxXMjaOZlAbK/WY42wZYdOpoJ22I9i/hV1hn5i207jYw/M1u4l8R
	ir3vyZ8dSCVDVdV1JFa058Z/cPJ8nm7NVsPEflk/XOg/A6diKN8pnNmq4rboAfK9PAVtK+3cOdf
	6dGghOmpY3NATLzooi/Fbmyk8yKFH4itR2C5EmbWz0Goi824MHPLFbYKtSEYZyLHYb2iGwjFUeY
	BIlsfw9kqAiOkzaiCXmBw9Y1Wvk=
X-Google-Smtp-Source: AGHT+IErRUjhNVbLqzVjxbcK1CYjltVuZHOc5fzudcpc5EwVyEZJCC/Y6E/1dlEutCZjrPJdpyM7JVpvhPnzlPDcauA=
X-Received: by 2002:a05:651c:41c6:b0:37b:970f:d33b with SMTP id
 38308e7fff4ca-37cd9174e1dmr55217781fa.3.1764176226306; Wed, 26 Nov 2025
 08:57:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
 <20251122-next-15nov_expose_sysfs-v19-2-4d3d578ad9ee@oss.qualcomm.com>
 <CAMRc=Me=F5gTmkfO+2_3_pqebsz9GvabCK+xv6bfQeGgkSs6Dw@mail.gmail.com> <dda61a49-90b1-ef48-5a46-d6953cd5375a@oss.qualcomm.com>
In-Reply-To: <dda61a49-90b1-ef48-5a46-d6953cd5375a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 17:56:54 +0100
X-Gm-Features: AWmQ_bluuaTcAqYNWzEq9zAeQFhvKiBcRtbO_0icEBMpDgmmCEeuvtSQ9xCa_XI
Message-ID: <CAMRc=McgiuD1D+WqmO9x2G8devztrLy6uLwxjFpxJ+LbKx2YJg@mail.gmail.com>
Subject: Re: [PATCH v19 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 5:48=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >>
> >> +static bool reboot_mode_class_registered;
> >
> > You don't need this, please see below.
>
> reboot_mode_class_registered was used for two reason.
> one is resolved: will directly call class_unregister.
>
> for second : If class_register fails, we want don't call register device
> in reboot_mode_register.
>
> at -
>         if (reboot_mode_class_registered)
>                 reboot_mode_register_device(reboot);
>

I'd just error out of the initcall if registering the class fails.
It's very unlikely anyway and points to a bigger problem.

> >> +
> >> +static void reboot_mode_register_device(struct reboot_mode_driver *re=
boot)
> >> +{
> >> +    reboot->reboot_mode_device.class =3D &reboot_mode_class;
> >> +    reboot->reboot_mode_device.release =3D reboot_mode_device_release=
;
> >> +    dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
> >> +    if (!device_register(&reboot->reboot_mode_device))
> >> +            reboot->reboot_mode_device_registered =3D true;
> >> +    else
> >> +            reboot->reboot_mode_device_registered =3D false;
> >
> > Just use device_create(). I would also suggest creating a private struc=
ture
> > that embeds the pointer to the struct device created by device_create()=
 and
> > the pointer to the reboot_mode_driver. If you pass it as driver data to
> > device_create(), you'll be able to retrieve it with dev_get_drvdata() i=
n
> > sysfs callbacks.
>
> Had made change to use device_create and dev_get_drvdata in below change,=
 and have then
> changed it to above as per the reviews on the same.
> https://lore.kernel.org/all/qhlxxfsyc42xemerhi36myvil3bf45isgmpugkuqzsvgc=
c3ifn@njrtwuooij2q/
>
> Should we change to device_create?
>

Ah, I missed that part. My preference is for device_create() as IMO it
results in much more elegant code (especially if we don't end up
extending the public struct) and memory is cheap but I'll let Bjorn
decide.

Bart

