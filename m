Return-Path: <linux-arm-msm+bounces-83266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49CC85796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 408B14E12D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EFD326928;
	Tue, 25 Nov 2025 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QkaNzEYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E188142E83
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081857; cv=none; b=WRa7aR2aZjrhxzG8BG1gZ/PGcA7LidInkRPnpUORcb9+9onlHDz8wpH60S3Q2D/+6K4ufL/bvQVUlfZoau22l7FIcj/aMNqFy0zdyuAkUUwWSk5M8iuNa31g041o2Fm9Be+6/9dD1CgRmjY0dRQk8kxCEkLH3Hekv+k6moBMtWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081857; c=relaxed/simple;
	bh=yaP/8uXSuvFrTFOxYGh3r4go0UVZ7v1l8AG9+zlKT48=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocYHFA3GNQJN1R1HWzUKyBysEWdLrFh68IPn7YPK0PaK4UilHH3MThEcy9oB6y5nrJyt5Gl0Q0fB5zUdQFTGBC8+jg7HClyJKCLPbGeeyP44niQLFkAoe/UC5CmaSHQyP6GsmrkRcN6Nk+ylhigMHpZxO35Td+KXGLFuybiQWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QkaNzEYP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59584301f0cso6106570e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764081853; x=1764686653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qlj+wVFMNp7WWgzjnDyNCaHtbz+5iGYQ8zDZKmaAEqA=;
        b=QkaNzEYP/CAJLHHl0ndpqBhbbkSEpl793Z4GlLrsMF/QjWrOJCLoaKZ5Fnm6jd6L0B
         2/BLUcoG4N6+JLtjozu9NZA674nsdk5zvUlypCfQOlQZlxKMFdGE73L2sEfgGSn0tqDE
         9DtCaXAkYsk52GpUGjA7RMPJ6p7bVFaLxvuyWOf0EznDEG8g+smqyCHwYFu225mqWNwB
         XAl7d2jLWjaAfk82QAZvdB9gludjv64ApkIEviKo4N/BZiHnf/8MhpYzWiCUHhLSVRE+
         4l1S9FjBRzT6+TpAZ3dBYR3r28SkmXolCPvqOEH0bNagV7//BhyZIw+Mnroc89dfEWdT
         I/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764081853; x=1764686653;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qlj+wVFMNp7WWgzjnDyNCaHtbz+5iGYQ8zDZKmaAEqA=;
        b=c/R/DMGKRu0waQCaqNr91JjJdZDCwijZF17vSvqY3ScYRf34Obmn7lOgEZWUlHAAFh
         eKmfLbgP3Y8JWJsRbN82ADlaT2Ye+Hzn9xYSmIpwaKnH7MTPfSJnttZRg5h1MxjobHF0
         LnT8t0WFGm0msA7Ns2Tqo/NQRfIZRY6HZk0rVaVe/4F4f83D6KML95gnp3IVenOd8Pl0
         mOukAb1XMetDRBw0YOEHnLNZ9+w9N9UwCU6uvVgKpnANJb1utCs7sKFELZf2fvKwsU39
         kaL6NqM5baWChjpZpGcQRmcpEhproNCaH9dgvMHA55VDKDTfLeIVGQWT6x8FmJCwQOuK
         NtKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMzDfN2ZOzTi0SFY1PQo6KpUq4IFHMyASVTHcR/aO6OTYODRndEtAu4FaRn0kQyEMZKXb1xye6qr9aZUIC@vger.kernel.org
X-Gm-Message-State: AOJu0YzTU6jtAvgoHaAIZ5kPED6T1SFK0r4iN8krxXX6fCkdYXPeKCID
	WCtVRCLRrOqg7W33THKJ3kuYUboYcsSHk7OxqYdCyT/PeVeQoz4Rjxv/xEyaqZ04iEWYtIs/q4P
	q9PwZJYpPYb4I7c0jtStuB6nkzXN7Q0p3A9T9tizYag==
X-Gm-Gg: ASbGncvpbr4EYRZJ6DIj3IXmo6lzv3jfV9KcfyoxHj77TnfyK3IxIEoC4u9W/ds5pCx
	NxVh1e8z8xO0wwDB4TO9JsG92XSDN8/0t6bqDsFFQwgdvNeOYshpFUa5/nDSMQWMKzWrIixMlis
	hThVtDtY8dvRkLrkThe5xV97fweC0YXngCjzjvrHlWgsMw9aWiKz92eFren9l578x5VCL7hv0KT
	jItAGT53y/361BKSA0QNqw8UHYg73voW+RE/Cq+N5qanudp/V/RC7YBkNlP8mJYcYPJpZ4+7w9n
	2/9bGir4VeQvM3XrL1VT2yD8Kn4DYfklSOblmA==
X-Google-Smtp-Source: AGHT+IF+t28TeLbLGYP1BCKq10BMjeeykNpp33NWJWxRESYFHKK6yjwGmxMH6LsHpAJuQK5XzXrIbhjldA5PwYW1rEU=
X-Received: by 2002:a05:6512:238c:b0:595:7e2d:986a with SMTP id
 2adb3069b0e04-596b505c940mr1264859e87.24.1764081853168; Tue, 25 Nov 2025
 06:44:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 06:44:12 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 06:44:12 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251122-next-15nov_expose_sysfs-v19-2-4d3d578ad9ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
 <20251122-next-15nov_expose_sysfs-v19-2-4d3d578ad9ee@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 06:44:12 -0800
X-Gm-Features: AWmQ_bm7vPymFKXeQGxB4f9CLQrF_cM60h3J_7_VsADx5ztHQ72YE6oIL7d6l08
Message-ID: <CAMRc=Me=F5gTmkfO+2_3_pqebsz9GvabCK+xv6bfQeGgkSs6Dw@mail.gmail.com>
Subject: Re: [PATCH v19 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Nov 2025 19:05:45 +0100, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
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
>  drivers/power/reset/reboot-mode.c | 86 +++++++++++++++++++++++++++++++++++++++
>  include/linux/reboot-mode.h       |  3 ++
>  2 files changed, 89 insertions(+)
>
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..71cd97ffb3ee8da530514ab918bc6d58a122b4ce 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -13,12 +13,61 @@
>
>  #define PREFIX "mode-"
>
> +static bool reboot_mode_class_registered;

You don't need this, please see below.

> +
>  struct mode_info {
>  	const char *mode;
>  	u32 magic;
>  	struct list_head list;
>  };
>
> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct mode_info *info;
> +	ssize_t size = 0;
> +
> +	reboot = container_of(dev, struct reboot_mode_driver, reboot_mode_device);
> +	if (!reboot)
> +		return -ENODATA;
> +
> +	list_for_each_entry(info, &reboot->head, list)
> +		size += sysfs_emit_at(buf, size, "%s ", info->mode);
> +

Don't you need locking here? What if we'll end up adding a new reboot mode at
the same time?

> +	if (!size)
> +		return -ENODATA;
> +
> +	return size + sysfs_emit_at(buf, size - 1, "\n");
> +}
> +static DEVICE_ATTR_RO(reboot_modes);
> +
> +static struct attribute *reboot_mode_attrs[] = {
> +	&dev_attr_reboot_modes.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(reboot_mode);
> +
> +static const struct class reboot_mode_class = {
> +	.name = "reboot-mode",
> +	.dev_groups = reboot_mode_groups,
> +};
> +
> +static void reboot_mode_device_release(struct device *dev)
> +{
> +    /* place holder to avoid warning on device_unregister. nothing to free */
> +}
> +
> +static void reboot_mode_register_device(struct reboot_mode_driver *reboot)
> +{
> +	reboot->reboot_mode_device.class = &reboot_mode_class;
> +	reboot->reboot_mode_device.release = reboot_mode_device_release;
> +	dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
> +	if (!device_register(&reboot->reboot_mode_device))
> +		reboot->reboot_mode_device_registered = true;
> +	else
> +		reboot->reboot_mode_device_registered = false;

Just use device_create(). I would also suggest creating a private structure
that embeds the pointer to the struct device created by device_create() and
the pointer to the reboot_mode_driver. If you pass it as driver data to
device_create(), you'll be able to retrieve it with dev_get_drvdata() in
sysfs callbacks.

> +}
> +
>  static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>  					  const char *cmd)
>  {
> @@ -78,6 +127,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>
>  	INIT_LIST_HEAD(&reboot->head);
>
> +	if (reboot_mode_class_registered)
> +		reboot_mode_register_device(reboot);
> +
>  	for_each_property_of_node(np, prop) {
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> @@ -119,6 +171,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  	list_for_each_entry(info, &reboot->head, list)
>  		kfree_const(info->mode);
>
> +	if (reboot->reboot_mode_device_registered) {
> +		device_unregister(&reboot->reboot_mode_device);
> +		reboot->reboot_mode_device_registered = false;
> +	}
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(reboot_mode_register);
> @@ -136,6 +193,11 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  	list_for_each_entry(info, &reboot->head, list)
>  		kfree_const(info->mode);
>
> +	if (reboot->reboot_mode_device_registered) {
> +		device_unregister(&reboot->reboot_mode_device);
> +		reboot->reboot_mode_device_registered = false;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(reboot_mode_unregister);
> @@ -162,6 +224,7 @@ int devm_reboot_mode_register(struct device *dev,
>  	if (!dr)
>  		return -ENOMEM;
>
> +	reboot->driver_name = reboot->dev->driver->name;
>  	rc = reboot_mode_register(reboot);
>  	if (rc) {
>  		devres_free(dr);
> @@ -199,6 +262,29 @@ void devm_reboot_mode_unregister(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
>
> +static int __init reboot_mode_init(void)
> +{
> +	if (class_register(&reboot_mode_class))
> +		reboot_mode_class_registered = false;
> +	else
> +		reboot_mode_class_registered = true;
> +
> +	return 0;
> +}
> +
> +static void __exit reboot_mode_exit(void)
> +{
> +	if (reboot_mode_class_registered)
> +		class_unregister(&reboot_mode_class);

Please take a moment to read the code of the functions you're calling. The
class_unregister() function will check if the class you're passing as argument
was previously registered. If not, it will do nothing. You don't need all this
checking.

> +}
> +
> +#ifdef MODULE
> +module_init(reboot_mode_init);
> +module_exit(reboot_mode_exit);
> +#else
> +subsys_initcall(reboot_mode_init);
> +#endif

You don't need to do this. It's perfectly fine to just do:

subsys_initcall(reboot_mode_init);
module_exit(reboot_mode_exit);

This is handled in the module.h header[1].

> +
>  MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
>  MODULE_DESCRIPTION("System reboot mode core library");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..400cfde0e029aef14ff90a11b9d12d0c3ce8dee6 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -5,6 +5,9 @@
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> +	const char *driver_name;
> +	struct device reboot_mode_device;
> +	bool reboot_mode_device_registered;

No need for this, just use device_is_registered() wherever you need to check
it.

>  	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
>  	struct notifier_block reboot_notifier;
>  };
>
> --
> 2.34.1
>
>
>

Thanks,
Bart

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/module.h#n103

