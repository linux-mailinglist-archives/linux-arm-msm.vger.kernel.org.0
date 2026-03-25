Return-Path: <linux-arm-msm+bounces-99773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFdMMsBRw2mIqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:08:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322E31F0CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA1E1303EA82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9A02C0270;
	Wed, 25 Mar 2026 03:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsG2jCun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75E2BEC34
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408104; cv=pass; b=FUYjT7RaE35uk0xzqE+XnJjNsSK5z0C3eQw8VsqqYAG1Dz4er1v9OxEeHLP0lM116N85qaeFC8v6pQpuIgXXogC7AZh9sBA6e8wdc4lLk8MF+FJPYAWWlX6oGXDTxqdLojKMIlTumeW6ul/ZBlgrNtmh0kJQ5oNldCYglmex5y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408104; c=relaxed/simple;
	bh=hJdcGCQ3mHxI4qcvqZp/CCaqOJ76l13MZ1DRKNMUyZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQMI/qsl9Kl+4iQIr9yOoBswi5q2jmCZVWhFZVOTNmdGrWvxveciPbTarwSabYJbK3fl6er1IZGPDaPqyTN03u7foLnv3JRYXS4wido09tMRj98ontOgxxqm4zIZenRU9B9aY7NCwpV9GxmYVrSrdYHvbXbKJXWERb8Mt/0i9uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsG2jCun; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-67c1e0718f1so3413683eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774408102; cv=none;
        d=google.com; s=arc-20240605;
        b=Es2x/C/JJZxQb/pQYrHWI7avgL0yvBwuXCo8skjzfj21C0TgscydAXtjlUU45uuhAg
         sfxpj+KkcTNZKRGoQeg+mP1qDtKyLZfKbFWEO2J3H6NYQgORtucdU8x+v7e+KQS71PPg
         OkvaCBWsPmppvu7CVt2H++lr1++0+LxekVHJ3tMBKPIzaZGBvVug4idF6pCGJc9eWDWZ
         7aF5D/caOtJon2vTfv78qKTmSNQeZHg622Mh6Nkr8x96aRovlP9RcFrE2uL8iPJ7ZqUt
         i2usZ6uZIDupCGqXP6kUQyLh5vH4ThY7SK3aqvmLCrYEr+ySNKftPI8+ztBRUgaLukPe
         8rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L1agqMYRVyCUyftxunjR/Gctujg8X1gDCx6TflvnIV4=;
        fh=2IX3r+W6bZyStnIjX3wiQ+TQypTGY+U0iOrLABO/sYg=;
        b=OqFaY7RhbnleS3cbbAyWSe71GMz1JmjRqAuBTMTjNE0ehgcRSOUBw55Fsr8v887Qen
         S5CViXj1x+W0fpbTF4JoocD92UXrupCKo5IURCWbRoHII2CIlB/0Ro2TnriXM63vDm+e
         4k1ZArlUjLftMxTq8WDRxVg5YubyfwPOeoP1ZX8tz30nd0vmtlfWUO/wfB5WX4xQL6cn
         XkdJ1LOKkB+9yjXRWvfB3nB4YEehCzFFBw5L+vtuTW5hCgbAlZifTIU3CGU/+v//+pgO
         5N1KphZ8GDnTqaLSxOuodS0J4tMKHG/zuDqgdhPDtkdJ0F7R3n08nzdIA4jPfI9jz7R9
         h7QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774408102; x=1775012902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1agqMYRVyCUyftxunjR/Gctujg8X1gDCx6TflvnIV4=;
        b=QsG2jCunF6U9HFdPFtYk1Fvt12375/QhCCqZnpk7qBrUJDtwoPwbZG00Jxz3BLNAhH
         6yC6bntNmHyq7x7cP0+N6/uwrnu4b91f6kk14zUUgBqddni3wPt6K7GfK3VBO9vnm3J1
         z+WYSyue1n99gDpMq448CDF5siFzxJf5yHSUwcyJx6VhvxvHBUVIoZCA8J8lRlFVzyE+
         VVj1VO6NGN1ab9PiGjH0rUmDjcUZDFcwiB5b34LaaumYSy57XOpRmbzP5Qhozw3636yE
         ih5IVdoV+6OvYilULBnmHxgj0HuKO1k2K64kakQdkM8JMyQ6HNVTAAeXTM51wOpVMwzo
         g5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408102; x=1775012902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L1agqMYRVyCUyftxunjR/Gctujg8X1gDCx6TflvnIV4=;
        b=NTaj4qDQZBkA3a/2WWVzCd142aAMiiz7VHsqXeOldAxPD8bG0tJtTGQUk1EFrHxD73
         wF83FR23zGsRZXBpEtbtCyPO2mk6UE13HqsWpqigrKoMDJ751VjeadWM0l8CLbkjbwjf
         ps8R2Vl9BfQKXjhvp6PPeQXwbgixWB6IV23NCPhcqM8St6519ymey1YmUy9bDT/kN5rb
         QNSiGoAdQKG9PJ2xi4fGBU9dmIYwExrHlBEbStSE0eAGnm2oWw+n1+UfGN0qq+3j8vLQ
         RoPG2nlLVPSilUZ5F47HpK8//R0w7BHZOy4exg9xuceHjz9kHUvEdwxWBqWlzTVPf+KB
         KJvg==
X-Forwarded-Encrypted: i=1; AJvYcCVUxdFcJJl9kuW53yEHzlfIR48uWI8BhMPfWW6yI9d3/86Mi+eIHBsIlPNXEKtNw3wC22ZFgjG8ZpcHGhmX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Hsv+IHXIVaViFf921QBhpCpT+O6D9wTxbEcMgzr+dXAoeuHu
	rnubUZ++eNkFyWZr5YsSR7Sm0+vKOhl6Blppb0tNav/eOKmbzVQAk5sYxCVy2u2bZQLhyXfJ4TJ
	5VzAu26hOvG7BfBX6ykSsjEtY3XUgvq0=
X-Gm-Gg: ATEYQzxSegGTG01NCRSimDwkoh3zRmi7EzKEIA0Y0j1+m/CN2m1jrvrUH769PSgOkqq
	BDrqTvlS0dlYMgNX0QAmen3gc/b3TrzG9XE3iZIoV6sOw3bdNqYeX0cfZINmTmk+pWp0Vljo6VO
	NhPzVkiqt4NYsry6P4zacp6SfjNZtOvj8s1qWjjnknOYaimg2btHo5O/LnSCp2fafL/83GZCmG5
	5xyl8H1FhhbgNkyW0ZRaC5ySuo1He538bn8o3SJSnmX7dRU9PsMkIRYfhIqaYRtuORrPnNuQsEs
	EKePBlQPNG8rrhP2UND9P4rbKlbsX972lfOakhwBKEKbCo4rgjaVY1nfQObQWu/oKNlm9tyHKq1
	dLYxTZZw=
X-Received: by 2002:a05:6820:1787:b0:67b:e203:6c8d with SMTP id
 006d021491bc7-67dff53efc8mr1216692eaf.52.1774408101668; Tue, 24 Mar 2026
 20:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324005919.2408620-1-dakr@kernel.org> <20260324005919.2408620-6-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-6-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 25 Mar 2026 11:08:11 +0800
X-Gm-Features: AQROBzD64p8E8k4KuR51RUiYotZVMtC9NAESBq-7RvJsmuQyKbQ4KJC_uWmm37s
Message-ID: <CALbr=La3gV5VmoXauF-fkmXveoJGtTvef1d1nrLtUZNHx2eF+w@mail.gmail.com>
Subject: Re: [PATCH 05/12] PCI: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>, Mark Brown <broonie@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-spi@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-arm-kernel@lists.infradead.org, Wang Jiayue <akaieurus@gmail.com>, 
	Yao Zi <me@ziyao.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com,ziyao.cc];
	TAGGED_FROM(0.00)[bounces-99773-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7322E31F0CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 9:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
>
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
>
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> Fixes: 782a985d7af2 ("PCI: Introduce new device binding path using pci_de=
v.driver_override")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Tested on QEMU PCI with multiple debug configs enabled. The original
PoCs run cleanly without triggering the issue.

Thanks Danilo.

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  drivers/pci/pci-driver.c           | 11 +++++++----
>  drivers/pci/pci-sysfs.c            | 28 ----------------------------
>  drivers/pci/probe.c                |  1 -
>  drivers/vfio/pci/vfio_pci_core.c   |  5 ++---
>  drivers/xen/xen-pciback/pci_stub.c |  6 ++++--
>  include/linux/pci.h                |  6 ------
>  6 files changed, 13 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index dd9075403987..d10ece0889f0 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -138,9 +138,11 @@ static const struct pci_device_id *pci_match_device(=
struct pci_driver *drv,
>  {
>         struct pci_dynid *dynid;
>         const struct pci_device_id *found_id =3D NULL, *ids;
> +       int ret;
>
>         /* When driver_override is set, only bind to the matching driver =
*/
> -       if (dev->driver_override && strcmp(dev->driver_override, drv->nam=
e))
> +       ret =3D device_match_driver_override(&dev->dev, &drv->driver);
> +       if (ret =3D=3D 0)
>                 return NULL;
>
>         /* Look at the dynamic ids first, before the static ones */
> @@ -164,7 +166,7 @@ static const struct pci_device_id *pci_match_device(s=
truct pci_driver *drv,
>                  * matching.
>                  */
>                 if (found_id->override_only) {
> -                       if (dev->driver_override)
> +                       if (ret > 0)
>                                 return found_id;
>                 } else {
>                         return found_id;
> @@ -172,7 +174,7 @@ static const struct pci_device_id *pci_match_device(s=
truct pci_driver *drv,
>         }
>
>         /* driver_override will always match, send a dummy id */
> -       if (dev->driver_override)
> +       if (ret > 0)
>                 return &pci_device_id_any;
>         return NULL;
>  }
> @@ -452,7 +454,7 @@ static int __pci_device_probe(struct pci_driver *drv,=
 struct pci_dev *pci_dev)
>  static inline bool pci_device_can_probe(struct pci_dev *pdev)
>  {
>         return (!pdev->is_virtfn || pdev->physfn->sriov->drivers_autoprob=
e ||
> -               pdev->driver_override);
> +               device_has_driver_override(&pdev->dev));
>  }
>  #else
>  static inline bool pci_device_can_probe(struct pci_dev *pdev)
> @@ -1722,6 +1724,7 @@ static const struct cpumask *pci_device_irq_get_aff=
inity(struct device *dev,
>
>  const struct bus_type pci_bus_type =3D {
>         .name           =3D "pci",
> +       .driver_override =3D true,
>         .match          =3D pci_bus_match,
>         .uevent         =3D pci_uevent,
>         .probe          =3D pci_device_probe,
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 16eaaf749ba9..a9006cf4e9c8 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -615,33 +615,6 @@ static ssize_t devspec_show(struct device *dev,
>  static DEVICE_ATTR_RO(devspec);
>  #endif
>
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       int ret;
> -
> -       ret =3D driver_set_override(dev, &pdev->driver_override, buf, cou=
nt);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *=
buf)
> -{
> -       struct pci_dev *pdev =3D to_pci_dev(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len =3D sysfs_emit(buf, "%s\n", pdev->driver_override);
> -       device_unlock(dev);
> -       return len;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
>  static struct attribute *pci_dev_attrs[] =3D {
>         &dev_attr_power_state.attr,
>         &dev_attr_resource.attr,
> @@ -669,7 +642,6 @@ static struct attribute *pci_dev_attrs[] =3D {
>  #ifdef CONFIG_OF
>         &dev_attr_devspec.attr,
>  #endif
> -       &dev_attr_driver_override.attr,
>         &dev_attr_ari_enabled.attr,
>         NULL,
>  };
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..b4707640e102 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2488,7 +2488,6 @@ static void pci_release_dev(struct device *dev)
>         pci_release_of_node(pci_dev);
>         pcibios_release_device(pci_dev);
>         pci_bus_put(pci_dev->bus);
> -       kfree(pci_dev->driver_override);
>         bitmap_free(pci_dev->dma_alias_mask);
>         dev_dbg(dev, "device released\n");
>         kfree(pci_dev);
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
> index d43745fe4c84..460852f79f29 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1987,9 +1987,8 @@ static int vfio_pci_bus_notifier(struct notifier_bl=
ock *nb,
>             pdev->is_virtfn && physfn =3D=3D vdev->pdev) {
>                 pci_info(vdev->pdev, "Captured SR-IOV VF %s driver_overri=
de\n",
>                          pci_name(pdev));
> -               pdev->driver_override =3D kasprintf(GFP_KERNEL, "%s",
> -                                                 vdev->vdev.ops->name);
> -               WARN_ON(!pdev->driver_override);
> +               WARN_ON(device_set_driver_override(&pdev->dev,
> +                                                  vdev->vdev.ops->name))=
;
>         } else if (action =3D=3D BUS_NOTIFY_BOUND_DRIVER &&
>                    pdev->is_virtfn && physfn =3D=3D vdev->pdev) {
>                 struct pci_driver *drv =3D pci_dev_driver(pdev);
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback=
/pci_stub.c
> index e4b27aecbf05..79a2b5dfd694 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -598,6 +598,8 @@ static int pcistub_seize(struct pci_dev *dev,
>         return err;
>  }
>
> +static struct pci_driver xen_pcibk_pci_driver;
> +
>  /* Called when 'bind'. This means we must _NOT_ call pci_reset_function =
or
>   * other functions that take the sysfs lock. */
>  static int pcistub_probe(struct pci_dev *dev, const struct pci_device_id=
 *id)
> @@ -609,8 +611,8 @@ static int pcistub_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
>
>         match =3D pcistub_match(dev);
>
> -       if ((dev->driver_override &&
> -            !strcmp(dev->driver_override, PCISTUB_DRIVER_NAME)) ||
> +       if (device_match_driver_override(&dev->dev,
> +                                        &xen_pcibk_pci_driver.driver) > =
0 ||
>             match) {
>
>                 if (dev->hdr_type !=3D PCI_HEADER_TYPE_NORMAL
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1c270f1d5123..57e9463e4347 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -575,12 +575,6 @@ struct pci_dev {
>         u8              supported_speeds; /* Supported Link Speeds Vector=
 */
>         phys_addr_t     rom;            /* Physical address if not from B=
AR */
>         size_t          romlen;         /* Length if not from BAR */
> -       /*
> -        * Driver name to force a match.  Do not set directly, because co=
re
> -        * frees it.  Use driver_set_override() to set or clear it.
> -        */
> -       const char      *driver_override;
> -
>         unsigned long   priv_flags;     /* Private flags for the PCI driv=
er */
>
>         /* These methods index pci_reset_fn_methods[] */
> --
> 2.53.0
>

