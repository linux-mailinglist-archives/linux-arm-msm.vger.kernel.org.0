Return-Path: <linux-arm-msm+bounces-94848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJPwA0VnpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:32:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6E1D6903
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 881EA30091CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF9A39B95E;
	Mon,  2 Mar 2026 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y1Xwe9Cd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48A375AD2;
	Mon,  2 Mar 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447042; cv=none; b=u/PgIIyadlKPfpXZdk9SEdJcmPhIJxV6bmxMA4PztPEyRl1WUcGhKyQ/B8E0+x8droSLZNjH279lVe73sgxGBvbvchhJm0Qt3P6BNNq8CMbpPJhiBhRXHxjpxGDDnVHzOZ31zA2srYEVE6hxQhhCcXHBQvH7j2z/rI7FotGfrO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447042; c=relaxed/simple;
	bh=MuTPYoq0rAKqkxKRuR0YVpITgKBx8TCvI9nCFxy/4qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkmO4Iw2eA5Bf7GlS3UKRLMWJ9Dr0p8At4n9OrWc82uslzRQUd5MAWeANu11GJvp0qxfov1J4D7N/t4jQAlCVdGVctUq91Fzn/+CaJfVqcGBxhKTt/whF5ZDPLKBN07LxyOptQOVafjf4dd2qfaD+JMYnQ6k9MNObrM8r3Jh7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y1Xwe9Cd; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772447038; x=1773051838; i=w_armin@gmx.de;
	bh=W4Rtd3cKZeS4h2+R0QVEjbpKe/BzwJgazIxvAtE74vI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y1Xwe9CdC10XEnrlD+IE1Fj9hQLPjYvW6VHRfxY4/Rc+JdKN9k4DLDLHjj1KyKb2
	 ELUM/Na3e59oiR7f8URTmUsR4Zdv054hY/8ypgGpHFopDPq0HnsniWLnxrDYrda7K
	 cUv0MudkcUo8igiYBw4IG3faMscv6dYnbN2jJxkjJvyceCt5Re3FoeFEWcbKGxNtG
	 a0nZTFtLs5AS2OeSJoW3A5hWrq6FlaW2APtntW2YnT1OyWtK+QT/2t0hyIOam0lW0
	 fg/GmhqVhpckK0QS5PHWc3Q2Qru27V72+IeNRI/Y6bJHF6IYa2WZeF+o2j7WwBMMd
	 qP/j7ICckXinxwnv/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQEx-1vIhX02qnP-00cf1E; Mon, 02
 Mar 2026 11:23:58 +0100
Message-ID: <bc06539d-84b3-4500-86e7-3f01f1ea3183@gmx.de>
Date: Mon, 2 Mar 2026 11:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct
 device
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org,
 srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
References: <20260302002729.19438-1-dakr@kernel.org>
 <20260302002729.19438-2-dakr@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lLAKf4Ro6CBwZfS4TaZwQSK7cBpkUgBE92oKczWJlCkl1vxaa0P
 lSj6ncr66rpkeTStUZeNuDNcmLWBqmqcMg4sc4E9rXwIlYXJZZOt4gRGbBjb1cKinnNGjT+
 HBFe/wp38I7vNkPw5UStHkQ/WMht2IqSHq2pano28VQ/yOoaTD6Quv9BXtSXuiEwBevwTtW
 bQFYFqR1qurUWGcOCegzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:97DW95w3tE0=;KHlXhmzUByPemGiNBnE097vegbI
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94848-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 09D6E1D6903
X-Rspamd-Action: no action

Am 02.03.26 um 01:25 schrieb Danilo Krummrich:

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

Nice patch series, centralizing the handling of driver_override in the
device core removes a lot of duplicated code.

I wonder if we can also move DEVICE_ATTR_DRIVER_OVERRIDE() into the device
core by registering the associated sysfs attribute inside bus_add_device()=
.

Bus types that honor driver_override could for example set a boolean flag
inside struct bus_type to tell the device core that driver_override is
supported.

However this is just a suggestion, the current patch series seems fine to =
me.

Thanks,
Armin Wolf

> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@ker=
nel.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   drivers/base/core.c    |  2 ++
>   drivers/base/dd.c      | 60 +++++++++++++++++++++++++++++++
>   include/linux/device.h | 81 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 143 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 791f9e444df8..a8cb90577d10 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2566,6 +2566,7 @@ static void device_release(struct kobject *kobj)
>   	else
>   		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it=
 is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
>   			dev_name(dev));
> +	kfree(dev->driver_override.name);
>   	kfree(p);
>   }
>  =20
> @@ -3159,6 +3160,7 @@ void device_initialize(struct device *dev)
>   	kobject_init(&dev->kobj, &device_ktype);
>   	INIT_LIST_HEAD(&dev->dma_pools);
>   	mutex_init(&dev->mutex);
> +	spin_lock_init(&dev->driver_override.lock);
>   	lockdep_set_novalidate_class(&dev->mutex);
>   	spin_lock_init(&dev->devres_lock);
>   	INIT_LIST_HEAD(&dev->devres_head);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0354f209529c..697e36e63cab 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>   }
>   __exitcall(deferred_probe_exit);
>  =20
> +int __device_set_driver_override(struct device *dev, const char *s, siz=
e_t len)
> +{
> +	const char *new, *old;
> +	char *cp;
> +
> +	if (!s)
> +		return -EINVAL;
> +
> +	/*
> +	 * The stored value will be used in sysfs show callback (sysfs_emit())=
,
> +	 * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +	 * Thus we can store one character less to avoid truncation during sys=
fs
> +	 * show.
> +	 */
> +	if (len >=3D (PAGE_SIZE - 1))
> +		return -EINVAL;
> +
> +	/*
> +	 * Compute the real length of the string in case userspace sends us a
> +	 * bunch of \0 characters like python likes to do.
> +	 */
> +	len =3D strlen(s);
> +
> +	if (!len) {
> +		/* Empty string passed - clear override */
> +		spin_lock(&dev->driver_override.lock);
> +		old =3D dev->driver_override.name;
> +		dev->driver_override.name =3D NULL;
> +		spin_unlock(&dev->driver_override.lock);
> +		kfree(old);
> +
> +		return 0;
> +	}
> +
> +	cp =3D strnchr(s, len, '\n');
> +	if (cp)
> +		len =3D cp - s;
> +
> +	new =3D kstrndup(s, len, GFP_KERNEL);
> +	if (!new)
> +		return -ENOMEM;
> +
> +	spin_lock(&dev->driver_override.lock);
> +	old =3D dev->driver_override.name;
> +	if (cp !=3D s) {
> +		dev->driver_override.name =3D new;
> +		spin_unlock(&dev->driver_override.lock);
> +	} else {
> +		/* "\n" passed - clear override */
> +		dev->driver_override.name =3D NULL;
> +		spin_unlock(&dev->driver_override.lock);
> +
> +		kfree(new);
> +	}
> +	kfree(old);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>   /**
>    * device_is_bound() - Check if device is bound to a driver
>    * @dev: device to check
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0be95294b6e6..4599156d5cbd 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -266,6 +266,33 @@ ssize_t device_show_string(struct device *dev, stru=
ct device_attribute *attr,
>   	struct dev_ext_attribute dev_attr_##_name =3D \
>   		{ __ATTR(_name, (_mode) & ~0222, device_show_string, NULL), (_var) }
>  =20
> +/**
> + * DEVICE_ATTR_DRIVER_OVERRIDE - Define sysfs driver_override attribute=
 callbacks
> + *
> + * Generates the standard driver_override_show() and driver_override_st=
ore()
> + * sysfs callbacks and the static DEVICE_ATTR_RW(driver_override) decla=
ration.
> + */
> +#define DEVICE_ATTR_DRIVER_OVERRIDE()						\
> +static ssize_t driver_override_store(struct device *dev,			\
> +				     struct device_attribute *attr,		\
> +				     const char *buf, size_t count)		\
> +{										\
> +	int ret;								\
> +										\
> +	ret =3D __device_set_driver_override(dev, buf, count);			\
> +	if (ret)								\
> +		return ret;							\
> +										\
> +	return count;								\
> +}										\
> +static ssize_t driver_override_show(struct device *dev,				\
> +				    struct device_attribute *attr, char *buf)	\
> +{										\
> +	guard(spinlock)(&dev->driver_override.lock);				\
> +	return sysfs_emit(buf, "%s\n", dev->driver_override.name);		\
> +}										\
> +static DEVICE_ATTR_RW(driver_override)
> +
>   #define DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
>   	struct device_attribute dev_attr_##_name =3D		\
>   		__ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
> @@ -483,6 +510,8 @@ struct device_physical_location {
>    * 		on.  This shrinks the "Board Support Packages" (BSPs) and
>    * 		minimizes board-specific #ifdefs in drivers.
>    * @driver_data: Private pointer for driver specific info.
> + * @driver_override: Driver name to force a match.  Do not touch direct=
ly; use
> + *		     device_set_driver_override() instead.
>    * @links:	Links to suppliers and consumers of this device.
>    * @power:	For device power management.
>    *		See Documentation/driver-api/pm/devices.rst for details.
> @@ -576,6 +605,10 @@ struct device {
>   					   core doesn't touch it */
>   	void		*driver_data;	/* Driver data, set and get with
>   					   dev_set_drvdata/dev_get_drvdata */
> +	struct {
> +		const char	*name;
> +		spinlock_t	lock;
> +	} driver_override;
>   	struct mutex		mutex;	/* mutex to synchronize calls to
>   					 * its driver.
>   					 */
> @@ -701,6 +734,54 @@ struct device_link {
>  =20
>   #define kobj_to_dev(__kobj)	container_of_const(__kobj, struct device, =
kobj)
>  =20
> +int __device_set_driver_override(struct device *dev, const char *s, siz=
e_t len);
> +
> +/**
> + * device_set_driver_override() - Helper to set or clear driver overrid=
e.
> + * @dev: Device to change
> + * @s: NUL-terminated string, new driver name to force a match, pass em=
pty
> + *     string to clear it ("" or "\n", where the latter is only for sys=
fs
> + *     interface).
> + *
> + * Helper to set or clear driver override of a device.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +static inline int device_set_driver_override(struct device *dev, const =
char *s)
> +{
> +	return __device_set_driver_override(dev, s, strlen(s));
> +}
> +
> +/**
> + * device_has_driver_override() - Check if a driver override has been s=
et.
> + * @dev: device to check
> + *
> + * Returns true if a driver override has been set for this device.
> + */
> +static inline bool device_has_driver_override(struct device *dev)
> +{
> +	guard(spinlock)(&dev->driver_override.lock);
> +	return !!dev->driver_override.name;
> +}
> +
> +/**
> + * device_match_driver_override() - Match a driver against the device's=
 driver_override.
> + * @dev: device to check
> + * @drv: driver to match against
> + *
> + * Returns > 0 if a driver override is set and matches the given driver=
, 0 if a
> + * driver override is set but does not match, or < 0 if a driver overri=
de is not
> + * set at all.
> + */
> +static inline int device_match_driver_override(struct device *dev,
> +					       const struct device_driver *drv)
> +{
> +	guard(spinlock)(&dev->driver_override.lock);
> +	if (dev->driver_override.name)
> +		return !strcmp(dev->driver_override.name, drv->name);
> +	return -1;
> +}
> +
>   /**
>    * device_iommu_mapped - Returns true when the device DMA is translate=
d
>    *			 by an IOMMU

