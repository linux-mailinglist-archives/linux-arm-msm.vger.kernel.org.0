Return-Path: <linux-arm-msm+bounces-95241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCBBCbmYp2kCigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 03:28:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6571F9DB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 03:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0F3430517CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 02:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468DA30E829;
	Wed,  4 Mar 2026 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FITNUxCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE03327A10F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591281; cv=pass; b=r/w36N4T1Q0xZrmjBrP8jPxGCGs9t/wdpJPTpRj2Nd/+G6NH0yjatVdXDkHIaSY6Id9x3AibNOvYw40NhSM5VyHkiu78VW8oG/kNrWz5IguVnhdQc+edCyRRIlUzU6fg1r719Q+qGp8QXMZxU9Q9iDPLSFDDBHbYwUtOt0e3ieE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591281; c=relaxed/simple;
	bh=py3aKKVn93HvEcbikt3U0dk2M/t9J8+imzeqfvnOlMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntzBlkLM60tpXTTt0BE8tHphN8ou5Ji/sa4VaRyf6RlO2103qMRBW/8MsvqnnP3fDGSmwxM61P+Je9dEnJRWvjMwzr7svcVtvzD9lF+/CWBFuDbDa4iDFG5rZT27+iDWGbpriXigs6EIeQ84IesfFHE78QAL5Q36yZGhFpmz/yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FITNUxCj; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4638a18efc2so4473722b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772591278; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7pDEDJoD+NRQ2jhMP3P5LvwQbhbUk4pDb/csM81h+NoYxAbIWM0jMV8Wy7Heqv/J5
         0aE2P/axhQ6u2a5icW178JLpsg1u5eNaZSHfwY2bC7qwB+u3F1/QQaZGgzI7VpTMEhI6
         ByXRlaNA6Cq4ZWyj7F9eK5Oqx4t/UkokR9ZdOaQ4UknXjY3tp6CXVxMD8Nyh4AwH9bit
         vkwp6O5gO6vU9nx9t4+h7zVELz/a/mO7vyJi+Z4IusQQlkGOtSuLpBaRNMmyfilcdAjx
         VpGse3a8+gB/CtdqmyaLpqVpo/TTAfhohtFpFHRhWleWvLeWOJxWGCiRhTJeIZt3+lge
         o3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Lcbeb/64UCshEgxWIZnEJ+ommj9WqeVen8Lhvcah74=;
        fh=JsxBSSGPO49Ryl+GXDqGyuikYlsuC/gBAKsfbzE/b/k=;
        b=YrvORWCroNpuRi03qxGiJb3N2UFj3ar6ASM1c4GdJrXSw3bxvLwvLM9N9iFRYTP6n2
         +AvVjuTi2JP605lt40V4jl1k+1crfHNHrFEsfgNt2UfjvBQSr6W20Jrrct6y1QwDe1y8
         QZhu7afvoWIA13OpZFOGT70Duf3XcmALcn01ojt7nZ1Ygif5jvL03cvTeR9azt+VGKX5
         hbo3KhNuSewDGbwEfPC7BKI5fQr1yY5yHRGorO3feHWB+PYaitKbtYRcITWRsLLh4iix
         N/STL5qMJlGi5/VkelYHggulY57oEOj1cUbXjH8hAE1XJQbRniIlvgpcBnQ+aRU65Nab
         Sktw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772591278; x=1773196078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Lcbeb/64UCshEgxWIZnEJ+ommj9WqeVen8Lhvcah74=;
        b=FITNUxCj0wnZV+AucLW0u5QCeeR9Za4KXpVt5oPxTbfTrr5dzZDc5IEno46XyK6iP1
         Pwyx7rq+nT/p60PLhXIN6klrfk3dErZW16ZAlsLzqFH5zywODRK5+j6WjHwY8fOWl7ys
         XDY8QdOyLIj0zQG40HkvdHCrvNRWKzZSSOTLluFyi7A3KiQxKlV48RhJr7wYF8UHiiJp
         8pqSJJFb3U3EtXXsmqsekfxfk6MSCD0UkHguo9OXPDfH1ta7Uf10EMPmaTsDZ7OMFYsr
         ZxVX2azCNXbEMMhQEY1l/y81pv4x/ctv6rlxEztY8j4LbJfxfsNPZG8a4jGZr3Xc0DGr
         nFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591278; x=1773196078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Lcbeb/64UCshEgxWIZnEJ+ommj9WqeVen8Lhvcah74=;
        b=w7w83a3mtKlVAx7idZ4uztIGH4F5r9/0WH2JMNpESM0VnGL0PGtew1znAfibXBMS0Q
         l1OrDtJQLLW6kv3ld6sO+j805LFhm3NXtMyEUGZ3qEm/RLdsL2zcIuc13syMjpwRuzJp
         ck1cDzZ5cqZJDU+qoYL6qhWZBGLmepJq9A164EUxPhaM8B+5OylEBqE97QSk+Og4UyLf
         FXUvvFxJyJahdrJZNtHFWuCvmPidfGdT5JCHbIlHVoJ6wDot8eFpbczSkYjyemEZr3OG
         37wXMkLWpHHuuSbOVzSLw0Ydqy5jPU1vcXIPekkoXIRdC0vs/wolTCWIIcc1Vfnm+phf
         ni5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2l8UnjDVnnGUQqi2NKXllw8NLQnVDOJBl3Da/D4tHDZ6bRi42Q/V8/z+0RxCR12hdFv965iyUV5MeyX2H@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn00oBbur7weFTRsctUtWd6IOS68uUYRU5XirRnZ6talDTaYvp
	iE8IlCaNs1Ba4uGX7mz2oJNFuJrzOg7dZEZ4jh2xtNy/3QgiwxMXZ5P8IsOikCKN8q3UOQuaPgP
	9wA9J8mp/41wFOznEKEhWpUkJol/qDd8=
X-Gm-Gg: ATEYQzwYrfrallKYLSTBblbJvBAPlhx1QXIKlr65YGdaFpBBmeFT6VY8s9Et7Nl9miv
	6DtwMlJ5F+/cn/zoeZd2F31NcR2nhu/drW/2UvwJGh/cTSU+WMVKQumfDEq5PKCQ3O2EBAcOJ22
	4D5U6QezNaUWAetXH4YO8usTLR5PriiCCpanjFZ7vPNzEhrtNZ73BFPWETw5vdkG3peR5m1ANQw
	2jE2XQFHrW0ntnr09vFpqCSVzrVHFmcCONYW6MASz1kRVwIw5ZA5lnU6XcsU51BiUGrMY7IjwY2
	ptk2YHLS6e/6+LgVrOBxdW1GtrZ8PjMC9nM1f+a0de1nEqwvVIWae5LJMF/SB1g4zEeBHpvjyQ=
	=
X-Received: by 2002:a05:6808:30a1:b0:463:f9ad:a4cf with SMTP id
 5614622812f47-4651abb472dmr293614b6e.23.1772591277687; Tue, 03 Mar 2026
 18:27:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-2-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-2-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 4 Mar 2026 10:27:49 +0800
X-Gm-Features: AaiRm50ScKkUps_9Yhs72XBQaSHbpuEPqc11o2wDZQVrApNZde3wmBwc1fLjihM
Message-ID: <CALbr=LaR0B4BhEQ6md0nBe=7KtPHJYPq6i_p9Gn+s8zcoFAW6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] driver core: generalize driver_override in struct device
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
X-Rspamd-Queue-Id: CD6571F9DB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95241-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 7:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
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
> Co-developed-by: Gui-Dong Han <hanguidong02@gmail.com>
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Tested this on QEMU PCI with various debug options enabled.
Everything looks good so far, no issues found.

Will keep testing.

> ---
>  drivers/base/bus.c         | 43 ++++++++++++++++++++++++++-
>  drivers/base/core.c        |  2 ++
>  drivers/base/dd.c          | 60 ++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h     | 54 ++++++++++++++++++++++++++++++++++
>  include/linux/device/bus.h |  4 +++
>  5 files changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index bb61d8adbab1..c734e7162b74 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -504,6 +504,36 @@ int bus_for_each_drv(const struct bus_type *bus, str=
uct device_driver *start,
>  }
>  EXPORT_SYMBOL_GPL(bus_for_each_drv);
>
> +static ssize_t driver_override_store(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    const char *buf, size_t count)
> +{
> +       int ret;
> +
> +       ret =3D __device_set_driver_override(dev, buf, count);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +
> +static ssize_t driver_override_show(struct device *dev,
> +                                   struct device_attribute *attr, char *=
buf)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       return sysfs_emit(buf, "%s\n", dev->driver_override.name);
> +}
> +static DEVICE_ATTR_RW(driver_override);
> +
> +static struct attribute *driver_override_dev_attrs[] =3D {
> +       &dev_attr_driver_override.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group driver_override_dev_group =3D {
> +       .attrs =3D driver_override_dev_attrs,
> +};
> +
>  /**
>   * bus_add_device - add device to bus
>   * @dev: device being added
> @@ -537,9 +567,15 @@ int bus_add_device(struct device *dev)
>         if (error)
>                 goto out_put;
>
> +       if (sp->bus->driver_override) {
> +               error =3D device_add_group(dev, &driver_override_dev_grou=
p);
> +               if (error)
> +                       goto out_groups;
> +       }
> +
>         error =3D sysfs_create_link(&sp->devices_kset->kobj, &dev->kobj, =
dev_name(dev));
>         if (error)
> -               goto out_groups;
> +               goto out_override;
>
>         error =3D sysfs_create_link(&dev->kobj, &sp->subsys.kobj, "subsys=
tem");
>         if (error)
> @@ -550,6 +586,9 @@ int bus_add_device(struct device *dev)
>
>  out_subsys:
>         sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
> +out_override:
> +       if (dev->bus->driver_override)
> +               device_remove_group(dev, &driver_override_dev_group);
>  out_groups:
>         device_remove_groups(dev, sp->bus->dev_groups);
>  out_put:
> @@ -607,6 +646,8 @@ void bus_remove_device(struct device *dev)
>
>         sysfs_remove_link(&dev->kobj, "subsystem");
>         sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
> +       if (dev->bus->driver_override)
> +               device_remove_group(dev, &driver_override_dev_group);
>         device_remove_groups(dev, dev->bus->dev_groups);
>         if (klist_node_attached(&dev->p->knode_bus))
>                 klist_del(&dev->p->knode_bus);
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 791f9e444df8..09b98f02f559 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
>         devres_release_all(dev);
>
>         kfree(dev->dma_range_map);
> +       kfree(dev->driver_override.name);
>
>         if (dev->release)
>                 dev->release(dev);
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
> index 0be95294b6e6..e65d564f01cd 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -483,6 +483,8 @@ struct device_physical_location {
>   *             on.  This shrinks the "Board Support Packages" (BSPs) and
>   *             minimizes board-specific #ifdefs in drivers.
>   * @driver_data: Private pointer for driver specific info.
> + * @driver_override: Driver name to force a match.  Do not touch directl=
y; use
> + *                  device_set_driver_override() instead.
>   * @links:     Links to suppliers and consumers of this device.
>   * @power:     For device power management.
>   *             See Documentation/driver-api/pm/devices.rst for details.
> @@ -576,6 +578,10 @@ struct device {
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
> @@ -701,6 +707,54 @@ struct device_link {
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
> +       return __device_set_driver_override(dev, s, s ? strlen(s) : 0);
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
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index 99c3c83ea520..cda597812324 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -63,6 +63,9 @@ struct fwnode_handle;
>   *                     this bus.
>   * @pm:                Power management operations of this bus, callback=
 the specific
>   *             device driver's pm-ops.
> + * @driver_override:   Set to true if this bus supports the driver_overr=
ide
> + *                     mechanism, which allows userspace to force a spec=
ific
> + *                     driver to bind to a device via a sysfs attribute.
>   * @need_parent_lock:  When probing or removing a device on this bus, th=
e
>   *                     device core should lock the device's parent.
>   *
> @@ -104,6 +107,7 @@ struct bus_type {
>
>         const struct dev_pm_ops *pm;
>
> +       bool driver_override;
>         bool need_parent_lock;
>  };
>
> --
> 2.53.0
>

