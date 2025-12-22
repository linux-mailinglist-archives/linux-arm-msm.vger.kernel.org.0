Return-Path: <linux-arm-msm+bounces-86253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BBCD6D5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 18:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DCF9307570E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8929133B6F3;
	Mon, 22 Dec 2025 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XNkYCQOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA8033B6C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424386; cv=none; b=YCCfrxqcgbU4LJYeeN5E4Vz5v6+a+B+z/1ClECqJbmqoXYQsJqKCW9y3Sj5GY8V3eqk1RBJGOzWTd9hQZNQmych215Us8RUKTu4PsY2VHvLUSkjppMxYd7cGjoNEUWRdHlOdS+DpEf8N+XhF5cBjEAxeGAU+1nCMEKKxAWtZQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424386; c=relaxed/simple;
	bh=OMHHcBrunLTAqrONlLcoGvei/dPQg1xIVNEoe6PRSCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3eZiUR4tySAn6h3bzBkORnaw6nU+QTHxxpnm0E61nUOGfaDWEcFXAGbJ/5w5DW1Bt3atQo0RlX/BfMr0/o8NcXO5b2JERS17G8knMFRZn0ypIUKwp2GKaIdYVNAaT/ui9Pxeqe6RR7Zc0qxFFYSNFufvTi0fJ2fi5e4FrqWlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XNkYCQOz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5957db5bdedso4824912e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1766424383; x=1767029183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaDcd5KsdnsvFsY11kNpZaauB3pAQDiUFi0UpOQzbhI=;
        b=XNkYCQOzaAMjo7ceogJAePGsKHnQEHjhnhS4rdEcjV/TffyilFYToPzdhZMzUBtegz
         UNGlXggLfNDnllynjCZ1sjMPm0jxBQ4foWuOULkPJ7sza8e+ricmgNnFipakpvOT+H7t
         +xANBKzGwZHgsMGKmVpYfFjJEUAIZudpnrr9xISbMk8bBt45Tx67+dh39syr3KxBzz+y
         MRedrovjvtYKfkLTi5GDgTMwAs9njBA2AvMBVYYnFVl/S+T2laIDiI0fewgxCtiAGx3c
         SEhkF6yHumu212t1H2DiproatsWPGmPdOjCKPweFrx7ptKCdqfzzxs2awYr2DBC4Dh2U
         xHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766424383; x=1767029183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaDcd5KsdnsvFsY11kNpZaauB3pAQDiUFi0UpOQzbhI=;
        b=qfOe6d5wXqGNfVtPMkFz8HLMdZn4o9UIkY/Z6WweoborhFjaI7NIQ2Lo8y8yH/zqMd
         eBUymwUOaejrrwUDPn6PupL+EnUnlQIxFMomyiZur9lMwddVyu8kzDzsc4pqJNAYpupE
         zsSNR/14U7UTtruQcfFw5kPzsRu0eQAtubDVZe4HKqp+oVUMEsAy+aPeZv8Cc+ntR+t6
         ZzkclF1NvjbYvFHVyukadqkoiXJDgsP1NfyTLI82tgCGHH+F36YmKdVPZcI715v18lb3
         idfVbsi/AOh3cq5nhEgxrsdIc0ux8YFnKDuppOrb8FqdFN0Izh6kacrqB4b3zxY+Tehz
         zkdg==
X-Forwarded-Encrypted: i=1; AJvYcCXur6xPLDT8Dlwkm035iW6rqHadhbDzVDPC2vT3xcPzfMNmc7CMDayEI6kGLLzNktoToeqLfwgbal5BFBcO@vger.kernel.org
X-Gm-Message-State: AOJu0YyECUur6kwUOWWo/q8+Coygm3fOHGf1ULZ6fzGecvCweNnQRX4Z
	PgT9VY/Q1nusoqfLBeDfUnEaZyMlcIOd6HM6sdo3AIPtVUuQP2Ygcve8xRDXArSsFrFJ4+RuQyB
	aMojfQscMNqV4ne9sJkfjBm0QbMY/jI97q6sESk+tnQ==
X-Gm-Gg: AY/fxX7Dcx6UaVuyLbqLOnVzGShDt0Q6f1TZ1SBSo6cewOYvwSHeUh3YkVHULjWBHpG
	7siR+qt2Jj6goecS/2ZvXcySHLuMUN54bETTBYZayS0e0ypaPWsrcPeR4OmH4bnEEGzuftv9u/i
	QfFEXwSOnbxG/RFP1G9rDLDuC5wEcjd/pz5fgOkRyL0JjFPGrvaL7qcuYtJvKNziXBZT0cBX/zu
	zbx915bKtEtbGx0UAD9Ng/dP2B5JHAUXVuAI6Ord0xKAxMPmHVCK6tPFBq6PumInT8VMDgdZJkd
	iUn3n7sxiR26OAbaM375nCU6woNgurd4oUw1sw==
X-Google-Smtp-Source: AGHT+IHHrUjioE+4oGxrI2RZEOyG2V4gz0UD1pM+souTBtkWhlOrJEwpjpsg0kUgeSqCWXF/vwVFEgr3FOA2uN43Vw8=
X-Received: by 2002:a05:6512:3e16:b0:598:eecb:c7ef with SMTP id
 2adb3069b0e04-59a17d5ddc0mr3918851e87.26.1766424382502; Mon, 22 Dec 2025
 09:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
 <20251222-next-15nov_expose_sysfs-v21-2-244614135fd8@oss.qualcomm.com>
In-Reply-To: <20251222-next-15nov_expose_sysfs-v21-2-244614135fd8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Dec 2025 18:26:10 +0100
X-Gm-Features: AQt7F2qw7k825VeBGH-gxAXeuuEKzY6BBYGjMxRWjHkHXafUFF3NWVKxl_TZNI0
Message-ID: <CAMRc=MeBiHcYd_3p9k=QOc5zxC930W6=aaD4Jbh9zhMWjwZ=bA@mail.gmail.com>
Subject: Re: [PATCH v21 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bartosz Golaszewski <bgolasze@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 4:33=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Currently, there is no standardized mechanism for userspace to discover
> which reboot-modes are supported on a given platform. This limitation
> forces tools and scripts to rely on hardcoded assumptions about the
> supported reboot-modes.
>
> Create a class 'reboot-mode' and a device under it to expose a sysfs
> interface to show the available reboot mode arguments to userspace. Use
> the driver_name field of the struct reboot_mode_driver to create the
> device.  For device-based drivers, configure the device driver name as
> driver_name.
>
> This results in the creation of:
>   /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the list of supported reboot
> modes arguments provided by the driver, enabling userspace to query the
> list of arguments.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

[snip]

> +
>  static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reb=
oot,
>                                           const char *cmd)
>  {
> @@ -76,6 +109,15 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>         size_t len =3D strlen(PREFIX);
>         int ret;
>
> +       reboot->reboot_mode_device =3D device_create(&reboot_mode_class, =
NULL, 0,
> +                                                  (void *)reboot, reboot=
->driver_name);

You should define a separate struct in this file and pass it as
drvdata as argument 4. The main reason for using device_create() was
to not have to store any data associated with the sysfs ABI in a
separate struct, not in the public one.

> +       if (IS_ERR(reboot->reboot_mode_device)) {
> +               ret =3D PTR_ERR(reboot->reboot_mode_device);
> +               reboot->reboot_mode_device =3D NULL;
> +               return ret;
> +       }
> +
> +       mutex_init(&reboot->reboot_mode_mutex);

Add a corresponding mutex_destroy() please.

[snip]

> +
>  MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
>  MODULE_DESCRIPTION("System reboot mode core library");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..d7141a1a609b62bd3185642ec=
c1478fdd3555037 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,9 +2,15 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
>
> +#include <linux/mutex.h>
> +
>  struct reboot_mode_driver {
>         struct device *dev;
>         struct list_head head;
> +       const char *driver_name;

I have no idea why you're storing the name here.

As I said above: you should not need to modify this structure (if
maybe for the mutex if modifications of this struct from existing code
can race with the sysfs code). Use a separate one for sysfs data.

> +       struct device *reboot_mode_device;

I think you misunderstood my comment about the renaming: what I meant
was: propose to rename the existing reboot_mode_driver structure to
reboot_mode_device because this is what it is in reality.

> +       /* protects reboot_mode list */
> +       struct mutex reboot_mode_mutex;
>         int (*write)(struct reboot_mode_driver *reboot, unsigned int magi=
c);
>         struct notifier_block reboot_notifier;
>  };
>
> --
> 2.34.1
>

Bart

