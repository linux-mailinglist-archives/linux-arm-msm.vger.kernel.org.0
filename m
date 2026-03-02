Return-Path: <linux-arm-msm+bounces-94854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK7MOLlqpWkaAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:47:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E91D6C95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AAA903004F1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD3A35504D;
	Mon,  2 Mar 2026 10:47:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3135294F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448425; cv=none; b=NZ4n9Q3jcaOC26nIUZZDE58QphJ4JCQedFJGitOBG7hoyQVv3SJn3VgxcdIISYCnVhJACHir4F4pbYf7e5yJONCsB87qacRYUUCo7AFrMrhxMSYjyXaHComZbyFrgyFB4MvLqy72maDKxVxQiuWAJgNnEzAfhG4LSDBWVOGwjCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448425; c=relaxed/simple;
	bh=PO0TbLRbiVrKvdhPwH7RKWikT/wKrrUI+0ibUOovsCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWEmgxPlXulRaLuAOT/ocq5Y0DB0hPWuudtpS31rbR11O7mwpbe8NAEo3EU1M+V4s62iVKxPtqmyHCJ/mQbf+GA8pybtJR1xzLSYFRGIr/NUDhiutAFTCDZbLVO/OiyXPY19j3IPOYtd2CHtuSDH7lPjU8SzJOo5/UWn9Dr3jgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94ddffda372so3711384241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448423; x=1773053223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl7RAWu6mKzowPFnldQghONe5pbsD04RWaX4BUYhOlo=;
        b=UjrwiO8a6qUOKpcPQnX3i76tY+FU+NWH8iGFxuelgqMrN/aHSGUZmRKw0sTx9eBZF3
         Ldadd4gDq6ZUevfTxKRJKtYo4bbbSGbnPdWMRwwLYNqf1ihNfoZAZNkio+jLp45IN/3h
         XK7jZnuEiFHdYk7QVv1E1pAezi71y0Gk56x+V6nEjQDuMq1TUZXYTqAWBKAJhtsdqDGl
         E0F01J4IWX+wfG28+EO53c75MFqUL5WZtkUx+Shq3wUGVzcPypF5Q09JXhd2+itm9hxl
         /TEfFSg4vDNduImegkk1SRBh+zvG2Abi96Db1YieK7ZXNoYu3Y7YdSZOXeeWbw9VwV2p
         bjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSoya7mMAI56hQnb274mdlB82Uz8qP4CO792gAkPyffo/nnSRGAgN2UuYWrJ19Can4D8rW6N5DSlmpAZDX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwz2/zRCCR43UKkaqEbjaAN8ojhrxVGiYfwbAsHNWXzafecTOF
	m5BIyhrfGdc62brMmrrhuWFnuNUrEJKdck/k46ln0OzAjTWKE+Cbpz5wuUHR1qqv
X-Gm-Gg: ATEYQzytWB6Rhc7hp+iiP3hEziQAYbIw7PfLOT0bDwMXtwGaWZ42fGYvkHteMd6l4hy
	6CeboAdDWcykLBw41mgye5Mh2f65JLp+OGYNn+ITQZFQuz86AJNQz8GynlkzlttXHOs0BokhnPx
	Ov5ByLHetdqf/6t227+EfWPF6PnOYGra0vRBBd3ZTNlBJqPEatSg0Uwn7mbeWT44K/MY3J9H+CB
	gNtautwg0PBtj3n9D6IgvY/kUTStqW9Yd3oDwL0FJFNGvBA7frXhoQZebtaSm4/YZGOZUrNoeM9
	B6G+Ys3xx/6hecKH336xIOX4OQNr1nOFlep/H41GL1OTf2vEjYDNDG7rUiaL0Z8BZSGES6qwJfM
	woz9D68sO6I7wSKfm6RcwRQR7bV6dVk4LwBNAbyoAIk3ClfitGJD7wOxab/cMtAXPWUGECP2KBi
	VzrUcSOmtH9s5Eqj7U8twPOxnKEuJ7W6oFvHndsGab/jYSRMrH+e6cGSrpPIvq
X-Received: by 2002:a05:6102:160c:b0:5ff:6f3:3e35 with SMTP id ada2fe7eead31-5ff33153390mr5175634137.0.1772448422743;
        Mon, 02 Mar 2026 02:47:02 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea1596asm12814244137.9.2026.03.02.02.47.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:47:02 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94dd05a4b44so2640044241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:47:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUibmNBYG+FOTspZKYMU/nwPQQzDFovj8rfJXT49gmzqmtQRyX0AcdGRRT+CB0yy/GE8wHWsFUFU2eqwvKd@vger.kernel.org
X-Received: by 2002:a05:6102:440e:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5ff1cda8e40mr7754538137.5.1772447927548; Mon, 02 Mar 2026
 02:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com> <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
In-Reply-To: <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
X-Gm-Features: AaiRm52rSumTG3nFZ9P6FzWdxvQ0hMzWVlbis5lyqzx4MgKVwMUrLmFH3gE-zLg
Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-94854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.147];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A90E91D6C95
X-Rspamd-Action: no action

Hi Danilo,

On Mon, 2 Mar 2026 at 11:26, Danilo Krummrich <dakr@kernel.org> wrote:
> On Mon Mar 2, 2026 at 11:00 AM CET, Geert Uytterhoeven wrote:
> >> --- a/drivers/base/dd.c
> >> +++ b/drivers/base/dd.c
> >> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
> >>  }
> >>  __exitcall(deferred_probe_exit);
> >>
> >> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> >> +{
> >> +       const char *new, *old;
> >> +       char *cp;
> >> +
> >> +       if (!s)
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> >> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> >> +        * Thus we can store one character less to avoid truncation during sysfs
> >> +        * show.
> >> +        */
> >> +       if (len >= (PAGE_SIZE - 1))
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * Compute the real length of the string in case userspace sends us a
> >> +        * bunch of \0 characters like python likes to do.
> >> +        */
> >> +       len = strlen(s);
> >> +
> >
> > The newline case below is is basically the same case as the empty
> > string.  Hence if you would move the newline check here:
> >
> >     if (len) {
> >             cp = strnchr(s, len, '\n');
> >             if (cp)
> >                     len = cp - s;
> >     }
> >
> > then the "cp != s" check below is no longer needed.
> >
> >> +       if (!len) {
> >> +               /* Empty string passed - clear override */
> >> +               spin_lock(&dev->driver_override.lock);
> >> +               old = dev->driver_override.name;
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +               kfree(old);
> >> +
> >> +               return 0;
> >> +       }
> >
> > Also, this block can be eliminated completely...
> >
> >> +
> >> +       cp = strnchr(s, len, '\n');
> >> +       if (cp)
> >> +               len = cp - s;
> >> +
> >> +       new = kstrndup(s, len, GFP_KERNEL);
> >> +       if (!new)
> >> +               return -ENOMEM;
> >
> > ... by pre-initializing new to NULL, and making the allocation of new
> > conditional on len being non-zero.
> >
> >> +
> >> +       spin_lock(&dev->driver_override.lock);
> >> +       old = dev->driver_override.name;
> >> +       if (cp != s) {
> >> +               dev->driver_override.name = new;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +       } else {
> >> +               /* "\n" passed - clear override */
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +
> >> +               kfree(new);
> >> +       }
> >> +       kfree(old);
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
>
> This is essentially a copy of driver_set_override(). Except for the required
> minor changes I intentionally kept it "as is" as it will go through -fixes and
> we know it works properly.

So I will have two to fix? ;-)

> Do you mind sending a follow-up patch with your suggested improvements?

Adding it to my TODO list, if this patch makes it as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

