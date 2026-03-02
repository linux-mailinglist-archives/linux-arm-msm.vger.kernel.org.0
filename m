Return-Path: <linux-arm-msm+bounces-94801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N1+ER9MpWmt8AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:36:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2A1D4B41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3256530086CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1ECE34E74F;
	Mon,  2 Mar 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKyknCBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81FF314B73
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440598; cv=pass; b=eI2FhJ/F2Mj3v79PFWtLBZ9ks8+u+6xknnBiiojqJjb+sHAZ9VD9uq6xuWIcPIjPQIgZOhFGQXl5eKIEaQdLNRJHF1c7aT3zXNiQfHdOf3mtKRPnaoFDN/leg8+a0JD7ZDnJKzlKY4bjjiWlLpvPbEMYOVrao2j4hr7Tn5cl4Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440598; c=relaxed/simple;
	bh=1GZQSHitluQNTjjmJ2I4j/0ggHOUPtN+HUcjzFFw0es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfsB/foQbsv5Aomk78m3tMDGw9z5E6z2g4GU0JQ7VWlrNFTOKTI2LBrzXt6Xw4pcKE2ygUyGH6YYJIyU5uxjl9UXYor962ooXP5OmpPBcI0d5R3yebhqepHFAXpD6AG92vm6g+10lo/thwq7oUBp2UmcDiCRDLOkaF2Uj5meXM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKyknCBv; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4c4b494fcso2565156a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772440596; cv=none;
        d=google.com; s=arc-20240605;
        b=hfRW3vkZAyZFV7mB5Po1mTJCgrfCQtJ1T8YooQ5pgqvSCBNxIDVBKrIutPgtUrVokH
         BDEUA/oJs7SWBBsBhlXRZwm1afr7Vw763TNc8SA+F2KOD/IEi9cQY97W1WIMM6k6QRW9
         RG7j3yLROfU6uvy3pJcy5Ne0grj6+zF83pZaVtDmlWumVG9NztbZ8k1k1CxTGTIUFHCz
         +niJUHDh3Mi5WoI6S2PWWUYwVz4azS+y1s/LvLp1SYZXPCh/VyuZSlo4ltk4ejK363Py
         QIJZuzFOHjyI3fKoq+qE18fSJWl2A+etir4ib0MsD921K9WbIIFQDkN4axqpBuECFxqO
         fesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJ2NNQwmgjk+we0fjyCXc+/B1tN8WZHhhsi0KDBtJrA=;
        fh=TEsfyT4lLSIUwUo5g3wKzMhWIOVDzvT43fhq0+K6gvY=;
        b=JPG1DgbnvaH14QsbzQVcoen00u8zbYqJFk1F7VKBs5wybbLLDupwhsWlUBXyYpgaL7
         8im/7M2GuGNmpD7Mdb4T90XFgxudaYO2ec6orBJTHTGmhPhzwvoLAI8Tps75WniMBmDh
         bkxw7KnqNAReIj/SRh4DNTD6Hrwk5Zi3W0ro0mtKdIhuYSbEHyhWa06qvl7ZIZxwJ2IZ
         Q6NBEDRZHHJqFUPg1JygnJjPwoV0lfGJMt/jZZFIAx0WCt3TgO0BiOTjAu4V6jzF8sMt
         542BAudXjrMQ5Kv4bl7wWSi4U9o/AbDtGNvqC4XRH+2hBynrIYuatJUKvT5niZiY7Mux
         iiTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772440596; x=1773045396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ2NNQwmgjk+we0fjyCXc+/B1tN8WZHhhsi0KDBtJrA=;
        b=EKyknCBvZohZ1myTBk6swdhxhfDdDvnH398QByv7I7TAMOsN+Dq3ZKmtfvXTierQuJ
         C2UglWe6MkU5pcwq+ldOWKFFmQVqDFDLS3+uSgpDQT041tGp+m1wMiAMdzTdtOq/ajqZ
         K0oaAfA3mde9EUQ8TwhplZAOL+MGA/SN6vuHJtgoghYCathP84TAv/S1Wt/jVNHOJVlV
         qiO210qO19M4auEyLVlEzTiq/FyPfPbf1Ws7UHcs2ubTkeJSmb3rgbm14eNX/NBRx9mg
         MTfZ+4zJTlWasjQkqtAFKje1kVkhFzg7obQ3o8/IlEqk0YY/ctJa2nNZHv7e8Xrrbezr
         UDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440596; x=1773045396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJ2NNQwmgjk+we0fjyCXc+/B1tN8WZHhhsi0KDBtJrA=;
        b=PSTr8j79Z0ljjvgjlOvEpVURe5GocEgKtDvJg/3VTI11/oHxTDMpiWLHDNE1VPljXR
         Lk3EaZnVXaZot332DlB1MG8FIDvs4fSc0vRNYbrnZYVYiPEqlwIXRn7e66QU0vX+5ZTg
         thZdEdzup7VNLhU0ZBn4vcQygyBKtpTqfu9/Gm2vKrzxPv7QgRqDy8q3zS6pft5LGi9V
         1mRtvFf1FP0o9/PABaczR6aCsM87UlOheboEK0CAuu9roGFnyJJsZEX/tUw8S+Wk1oth
         r2J7z7LYy4OQ7pzNUT8nv3v9Mau+SCWy2agaTI+Z0X18QTY3iYuw31oB8X4cLT0cYc/h
         0DyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiUOxGbSwNmvupfjeXdG9lCHK9jpgDHnrrfPdxXPrQBZMYUJCbDkzvjXHNWANc/306Nm68COgY/uR3s2cZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bSUsttSv+DeSWY2g7DVEjuT2gpWJj7cdWdOqHzYBb6p3ynWw
	kQy5Y1nbL7hHQdwLwPt3FCc35UTcA8Iuwbgp3ca6VDXlUuWB55OjLqwxeg5iG2/RkGDCakvC9R8
	Aeb5u+gG4YJXBNKgsVkmK7DmvAyFKf4w=
X-Gm-Gg: ATEYQzw2DuNHJpvQQdlyVuI0or77SezRq0HCgwsJj3wRLo+EaYPr9oZ3h4PxRYp4NAA
	BKcSaQSeUxZvqVcGKGZY2+lvBJqhKCaMaDfuxygZMug51KILEw2/WDJsIKnh+dghzpRoW+oV2b/
	Y2oJrEStEZZjMygoSMgzeOqnDArsrN+5f9R3QtARXg4VCtIgKwC6UndnB5sTxdT9KxS6jtkTc2t
	96MINzHa7XB9818fLECHB6oiBFCUCT2Wk9TwUpHHb3hML7aTdKbiRs70KFuKqmhNZgz58gMjC2G
	lAmIMo4E50q18PyHizLxiByMI/quedWL1xlQE4RwG5V933ounAl/+gdSTbu9+2nI7VcGaDsIKK4
	=
X-Received: by 2002:a05:6820:4de4:b0:667:7e1a:204a with SMTP id
 006d021491bc7-679faf91292mr6464642eaf.71.1772440595639; Mon, 02 Mar 2026
 00:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 16:36:25 +0800
X-Gm-Features: AaiRm53VKaieIbBWkzD1yY0EUmtpQaKFtqT6KmFajHbooqaebtPFWL-mvDVMBSU
Message-ID: <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9FE2A1D4B41
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 8:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applying the following diff fixes the KASAN issue. It was just a minor bug.

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a8cb90577d10..09b98f02f559 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
        devres_release_all(dev);

        kfree(dev->dma_range_map);
+       kfree(dev->driver_override.name);

        if (dev->release)
                dev->release(dev);
@@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
        else
                WARN(1, KERN_ERR "Device '%s' does not have a
release() function, it is broken and must be fixed. See
Documentation/core-api/kobject.rst.\n",
                        dev_name(dev));
-       kfree(dev->driver_override.name);
        kfree(p);
 }

With this applied, along with the PCI driver diff from the WIP patch,
the issue is resolved. I tested this on PCI and both PoCs no longer
trigger KASAN. I also ran with other debug options enabled (lockdep,
sleep inside atomic, etc.) and hit no warnings.

I was working on a similar patch recently, but your version is better.
Not returning the string directly provides better encapsulation and
makes the API much harder to misuse.

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  drivers/base/core.c    |  2 ++
>  drivers/base/dd.c      | 60 +++++++++++++++++++++++++++++++
>  include/linux/device.h | 81 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 791f9e444df8..a8cb90577d10 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2566,6 +2566,7 @@ static void device_release(struct kobject *kobj)
>         else
>                 WARN(1, KERN_ERR "Device '%s' does not have a release() f=
unction, it is broken and must be fixed. See Documentation/core-api/kobject=
.rst.\n",
>                         dev_name(dev));
> +       kfree(dev->driver_override.name);
>         kfree(p);
>  }
>
> @@ -3159,6 +3160,7 @@ void device_initialize(struct device *dev)
>         kobject_init(&dev->kobj, &device_ktype);
>         INIT_LIST_HEAD(&dev->dma_pools);
>         mutex_init(&dev->mutex);
> +       spin_lock_init(&dev->driver_override.lock);
>         lockdep_set_novalidate_class(&dev->mutex);
>         spin_lock_init(&dev->devres_lock);
>         INIT_LIST_HEAD(&dev->devres_head);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0354f209529c..697e36e63cab 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size=
_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_em=
it()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newl=
ine.
> +        * Thus we can store one character less to avoid truncation durin=
g sysfs
> +        * show.
> +        */
> +       if (len >=3D (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends =
us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len =3D strlen(s);
> +
> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old =3D dev->driver_override.name;
> +               dev->driver_override.name =3D NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }
> +
> +       cp =3D strnchr(s, len, '\n');
> +       if (cp)
> +               len =3D cp - s;
> +
> +       new =3D kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;
> +
> +       spin_lock(&dev->driver_override.lock);
> +       old =3D dev->driver_override.name;
> +       if (cp !=3D s) {
> +               dev->driver_override.name =3D new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name =3D NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0be95294b6e6..4599156d5cbd 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -266,6 +266,33 @@ ssize_t device_show_string(struct device *dev, struc=
t device_attribute *attr,
>         struct dev_ext_attribute dev_attr_##_name =3D \
>                 { __ATTR(_name, (_mode) & ~0222, device_show_string, NULL=
), (_var) }
>
> +/**
> + * DEVICE_ATTR_DRIVER_OVERRIDE - Define sysfs driver_override attribute =
callbacks
> + *
> + * Generates the standard driver_override_show() and driver_override_sto=
re()
> + * sysfs callbacks and the static DEVICE_ATTR_RW(driver_override) declar=
ation.
> + */
> +#define DEVICE_ATTR_DRIVER_OVERRIDE()                                   =
       \
> +static ssize_t driver_override_store(struct device *dev,                =
       \
> +                                    struct device_attribute *attr,      =
       \
> +                                    const char *buf, size_t count)      =
       \
> +{                                                                       =
       \
> +       int ret;                                                         =
       \
> +                                                                        =
       \
> +       ret =3D __device_set_driver_override(dev, buf, count);           =
         \
> +       if (ret)                                                         =
       \
> +               return ret;                                              =
       \
> +                                                                        =
       \
> +       return count;                                                    =
       \
> +}                                                                       =
       \
> +static ssize_t driver_override_show(struct device *dev,                 =
               \
> +                                   struct device_attribute *attr, char *=
buf)   \
> +{                                                                       =
       \
> +       guard(spinlock)(&dev->driver_override.lock);                     =
       \
> +       return sysfs_emit(buf, "%s\n", dev->driver_override.name);       =
       \
> +}                                                                       =
       \
> +static DEVICE_ATTR_RW(driver_override)
> +
>  #define DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
>         struct device_attribute dev_attr_##_name =3D              \
>                 __ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
> @@ -483,6 +510,8 @@ struct device_physical_location {
>   *             on.  This shrinks the "Board Support Packages" (BSPs) and
>   *             minimizes board-specific #ifdefs in drivers.
>   * @driver_data: Private pointer for driver specific info.
> + * @driver_override: Driver name to force a match.  Do not touch directl=
y; use
> + *                  device_set_driver_override() instead.
>   * @links:     Links to suppliers and consumers of this device.
>   * @power:     For device power management.
>   *             See Documentation/driver-api/pm/devices.rst for details.
> @@ -576,6 +605,10 @@ struct device {
>                                            core doesn't touch it */
>         void            *driver_data;   /* Driver data, set and get with
>                                            dev_set_drvdata/dev_get_drvdat=
a */
> +       struct {
> +               const char      *name;
> +               spinlock_t      lock;
> +       } driver_override;
>         struct mutex            mutex;  /* mutex to synchronize calls to
>                                          * its driver.
>                                          */
> @@ -701,6 +734,54 @@ struct device_link {
>
>  #define kobj_to_dev(__kobj)    container_of_const(__kobj, struct device,=
 kobj)
>
> +int __device_set_driver_override(struct device *dev, const char *s, size=
_t len);
> +
> +/**
> + * device_set_driver_override() - Helper to set or clear driver override=
.
> + * @dev: Device to change
> + * @s: NUL-terminated string, new driver name to force a match, pass emp=
ty
> + *     string to clear it ("" or "\n", where the latter is only for sysf=
s
> + *     interface).
> + *
> + * Helper to set or clear driver override of a device.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +static inline int device_set_driver_override(struct device *dev, const c=
har *s)
> +{
> +       return __device_set_driver_override(dev, s, strlen(s));
> +}
> +
> +/**
> + * device_has_driver_override() - Check if a driver override has been se=
t.
> + * @dev: device to check
> + *
> + * Returns true if a driver override has been set for this device.
> + */
> +static inline bool device_has_driver_override(struct device *dev)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       return !!dev->driver_override.name;
> +}
> +
> +/**
> + * device_match_driver_override() - Match a driver against the device's =
driver_override.
> + * @dev: device to check
> + * @drv: driver to match against
> + *
> + * Returns > 0 if a driver override is set and matches the given driver,=
 0 if a
> + * driver override is set but does not match, or < 0 if a driver overrid=
e is not
> + * set at all.
> + */
> +static inline int device_match_driver_override(struct device *dev,
> +                                              const struct device_driver=
 *drv)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       if (dev->driver_override.name)
> +               return !strcmp(dev->driver_override.name, drv->name);
> +       return -1;
> +}
> +
>  /**
>   * device_iommu_mapped - Returns true when the device DMA is translated
>   *                      by an IOMMU
> --
> 2.53.0
>

