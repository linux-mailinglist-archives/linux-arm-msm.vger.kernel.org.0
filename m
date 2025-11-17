Return-Path: <linux-arm-msm+bounces-82112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76996C64600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D66DD356CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7AB3328F2;
	Mon, 17 Nov 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXEs49DX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760BF3314DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385959; cv=none; b=JLVPn11VaGERbHVZ+Yr89K4d3/lDs8C0dzWV7xICc0L8e/9ETTjljfMldOIjNrAmwzwrW6m/TTuvW/3KcLenZ5BqGvIa19oGqJP59ZB6kBkqDbqET4sPqQqpMlEaC73L8IWT9CWddzncuz3rBSNnWbZxupkInTUyNcXaYHOOA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385959; c=relaxed/simple;
	bh=BXrkaPWSS4ADX1uV9kOtNe4mMT/WZtJVEu732fC+Nsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ew7Q8A2kcs5l9czRlK1EgqVRLv44heF69u2A7947Dxe1tVjZbeGVZXGlK9KzgR/Bhe/Zxuq6Lr7wrIX9p1EZtIdCJoRRVl1nU6RWbBtyDbb/+DYyyWb7v3QTfkWbiJLbRH9w12JkWohNaIVF53OqWhih6jTJuEJqeVsvFSGFIjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXEs49DX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so6907167a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763385955; x=1763990755; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PKrCcNYpwdQk4idzk2CaMl1TyunpWVVmxS8N4sU6sgM=;
        b=ZXEs49DXok9qsNJGDEed75ch4EE4emxdz0OrONswDKPI7biOc+XLwta3F1bGgY+7ZD
         zyDtlJeI2I2fLo/0Q8BYW6qfE/fdzHbYETPohTHGTdiDCKkp7uojcbxiRKdrn7qvk1Y3
         oLCgWJAeLVJDLkoJlIa/E9z5HKP7vEwPSVskYkAuvtu6hHrIBXcFENdXGl/EXAxxPiJI
         5k7Ha2iuByhrH3VWDc1jYO2+k706r2+g5DN4i6xhsC/CkoofKxp+Bk2jrg9eQQ0I698Q
         S7es/ajWmGhb0TeA/74VHz62tg/+1ynKnPmMUgcwRVSif9TtQ4aLpMNHqHJ4VgxiV6IR
         Kf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763385955; x=1763990755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKrCcNYpwdQk4idzk2CaMl1TyunpWVVmxS8N4sU6sgM=;
        b=XlFYtiNRoDieEuGmP1YiSZKw2sRUACkC+q5own8hvNlIOidpqipLZdL1G1F5OxsB8H
         gCDtLUy68QH97C2mcbVxSyPGgNeksfL6+nRlTFLSksMVhfOG/Hh4QhE3X5p/pd4/QJDJ
         6ZtlxR74ClgyNRJXocyqNGY+/WknoBSlcFBjimx2Qy5/C4HIcyIm8O9MoODg0/lmL7xr
         cniuqV7vCKHrUx28EzsZOJCwZpPompIGdpJNZmfzDjlOaJtloQN0JKSEjTycLpkKYljw
         lbERUSL7QOV3jwahAuueUV2ytIOkoRCrKqhiPPa7uyqZ8lF0PdGQ5NkO5L4fVJsY2deG
         JxPA==
X-Forwarded-Encrypted: i=1; AJvYcCXAfW2Oa1GZZEc02FTFiMMSuphkIH+2ZrmHKCu8ny5AUYylgTO2iWJDrgw/n3SXPv9rgU9DK6G6EuI5j1DV@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBdISj4u/LPaBMIQLtsgBNF4kE36khGWwPoR//YIfX/Wbl990
	RMqCiyPMjo2F/UwFsgm4LCEYkghm+VhXcOOX16F1K3UOnU4NImkv17D9kMD2O7xi3Q9ItZNLqOJ
	XaUOaQdOUCMgvM93WLfCGW48UFvRgPTfWXcell8LQX5+FFOwr4DF+Qnk=
X-Gm-Gg: ASbGncsxTitNLvQ6qr4MzUsYy+xe64UDw32itBJK0TB5rSJfvwu4i8awAL07+i1LSGM
	PABqETZ0nd5Skdd5TDPj//nmVXSph2ndOmnaMRFFmPXy/abTsWapVC+A0uVe1ApyFWljKOkOv7M
	sAHPsBYwB+T4YDikbP3TphABcuZVa63cxnv9WG5oH4jW0PA8azFvUscp1ibm3VLnl3ZVDudDPK6
	xah1fNFdCzfHB/00j2n3Qa45aQTp70uowOX7q5aXZsm52c152mHawqPELGdLjZBI+0WorlBPl0j
	6fUlVpT4fQ2MBbv2VvXZAqvW2ci4dtRNslhi7Q==
X-Google-Smtp-Source: AGHT+IGA9IKPcA2NVRU837UYITNqUiXqVbs8u2QaPkG4oxbaV5NUnuCMpfTaiZd84H+nHDlEyxQ+y6jkHzkDtmQk7r0=
X-Received: by 2002:a17:906:dc8b:b0:b73:7ebd:469d with SMTP id
 a640c23a62f3a-b737ebd51c7mr700980966b.18.1763385954694; Mon, 17 Nov 2025
 05:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
 <20251116-next-15nov_expose_sysfs-v1-2-3b7880e5b40e@oss.qualcomm.com>
In-Reply-To: <20251116-next-15nov_expose_sysfs-v1-2-3b7880e5b40e@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 17 Nov 2025 14:25:42 +0100
X-Gm-Features: AWmQ_bko9MypuXVKQ-ri649OhlUs0218mLgHlt4bzFRM40wdm7fFs3mbaFjy7YE
Message-ID: <CACMJSeu6BGS+AyEXyR9S7d6qGkbP3GiEzq6qy1860QaOQ-peQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Nov 2025 at 16:20, Shivendra Pratap
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
>  drivers/power/reset/reboot-mode.c | 72 +++++++++++++++++++++++++++++++++++++++
>  include/linux/reboot-mode.h       |  3 ++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..062df67735c4818cfeb894941e537f19ea9d4ccb 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -7,18 +7,77 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
>
>  #define PREFIX "mode-"
>
> +static DEFINE_MUTEX(reboot_mode_mutex);
> +
>  struct mode_info {
>         const char *mode;
>         u32 magic;
>         struct list_head list;
>  };
>
> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +       struct reboot_mode_driver *reboot;
> +       struct mode_info *info;
> +       ssize_t size = 0;
> +
> +       reboot = container_of(dev, struct reboot_mode_driver, reboot_mode_device);
> +       if (!reboot)
> +               return -ENODATA;
> +
> +       list_for_each_entry(info, &reboot->head, list)
> +               size += sysfs_emit_at(buf, size, "%s ", info->mode);
> +
> +       if (!size)
> +               return -ENODATA;
> +
> +       return size + sysfs_emit_at(buf, size - 1, "\n");
> +}
> +static DEVICE_ATTR_RO(reboot_modes);
> +
> +static struct attribute *reboot_mode_attrs[] = {
> +       &dev_attr_reboot_modes.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(reboot_mode);
> +
> +static const struct class reboot_mode_class = {
> +       .name = "reboot-mode",
> +       .dev_groups = reboot_mode_groups,
> +};
> +
> +static void reboot_mode_device_release(struct device *dev)
> +{
> +    /* place holder to avoid warning on device_unregister. nothing to free */
> +}
> +
> +static void reboot_mode_create_device(struct reboot_mode_driver *reboot)
> +{
> +       static bool is_class_registered;
> +
> +       reboot->reboot_mode_device_registered = false;
> +
> +       scoped_guard(mutex, &reboot_mode_mutex) {
> +               if (!is_class_registered) {
> +                       if (!class_register(&reboot_mode_class))
> +                               is_class_registered = true;
> +               }
> +       }

This could be achieved with DO_ONCE() but you still haven't explained
why this needs to be done here. Why not in the module's
subsys_initcall()? As of now, the class will not appear in sysfs until
the first device is registered which isn't a very common behavior.

Bart

> +
> +       reboot->reboot_mode_device.class = &reboot_mode_class;
> +       reboot->reboot_mode_device.release = reboot_mode_device_release;
> +       dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
> +       if (!device_register(&reboot->reboot_mode_device))
> +               reboot->reboot_mode_device_registered = true;
> +}
> +
>  static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>                                           const char *cmd)
>  {
> @@ -78,6 +137,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>
>         INIT_LIST_HEAD(&reboot->head);
>
> +       reboot_mode_create_device(reboot);
> +
>         for_each_property_of_node(np, prop) {
>                 if (strncmp(prop->name, PREFIX, len))
>                         continue;
> @@ -119,6 +180,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>         list_for_each_entry(info, &reboot->head, list)
>                 kfree_const(info->mode);
>
> +       if (reboot->reboot_mode_device_registered) {
> +               device_unregister(&reboot->reboot_mode_device);
> +               reboot->reboot_mode_device_registered = false;
> +       }
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(reboot_mode_register);
> @@ -136,6 +202,11 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>         list_for_each_entry(info, &reboot->head, list)
>                 kfree_const(info->mode);
>
> +       if (reboot->reboot_mode_device_registered) {
> +               device_unregister(&reboot->reboot_mode_device);
> +               reboot->reboot_mode_device_registered = false;
> +       }
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(reboot_mode_unregister);
> @@ -162,6 +233,7 @@ int devm_reboot_mode_register(struct device *dev,
>         if (!dr)
>                 return -ENOMEM;
>
> +       reboot->driver_name = reboot->dev->driver->name;
>         rc = reboot_mode_register(reboot);
>         if (rc) {
>                 devres_free(dr);
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..400cfde0e029aef14ff90a11b9d12d0c3ce8dee6 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -5,6 +5,9 @@
>  struct reboot_mode_driver {
>         struct device *dev;
>         struct list_head head;
> +       const char *driver_name;
> +       struct device reboot_mode_device;
> +       bool reboot_mode_device_registered;
>         int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
>         struct notifier_block reboot_notifier;
>  };
>
> --
> 2.34.1
>

