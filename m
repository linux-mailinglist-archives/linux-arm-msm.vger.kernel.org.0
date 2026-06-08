Return-Path: <linux-arm-msm+bounces-111940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vhZ/DykAJ2rZpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:47:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB2659608
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=kKQQBAck;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111940-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111940-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35EA030046BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A413D367B83;
	Mon,  8 Jun 2026 17:47:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC59356740
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:47:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780940835; cv=pass; b=Bf2mpwN7g1zmW7R2hViflMzK35ELX2sZoL1/H1CJdEVnsWLLMIIZJxtHnZyvRLjYz0DvJSp6+z84FRJW8BnJ/7JoC8JRF0VzwJcUXTc0t9GQGPDOC9+aX5Lf1hpwHeNgBghLgLLrRNJ9MFRrbgjz8lsCdId+Vy7RCtU2Znj5YlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780940835; c=relaxed/simple;
	bh=qHOSN3CiBXYnjZS3fMmxWOq5WSeYJzuNKPvw/847FmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmGUqfhz8J2Kzyhxb1KD4vY9bHImg/x9uI2oo5qQ3Sk5IRmLiq12KTzkwvcKQ7b0Z5gWPlkzJYKr7rVHnsiJhYKdU4hB9CLaGdKRjlFUQpFJX3JFdnYCCE9gEnBQOodRtqLmrNuF1naR7o2QvhbYdbNYKSyGfDxuzVxpeI2040c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKQQBAck; arc=pass smtp.client-ip=209.85.208.53
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68ca6f01079so5465676a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780940832; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLwF6ItXG/vQX4n13v7DFc8nAwgdZKffC6mlHYjzCyWDGP47QgGOmCWCYupw0qsA+2
         uv723i1fKzfYqaRHccS95PusNmLMUwVAZO4Vz4zuq8h9OYRo27Hb1eQ167/PGGKhLS+O
         +TipBQFSl9WlXSpMoZeIyoKvsMzAGtRGJeRtaRfCvlSNBCz92/lCW/C4S5hSgKDdBV5I
         z0h+e+l3AGa70kFCNeRwCQtvc84PmPH1dFwbDmm1t/bSWLxDzV7dOSicMbwOFhiZJ3u7
         CnoFqRrbz/PfU3lN3JptUYCKxhn3Q3LUQ5fS0zBNTJh8d7odRazbrPZqMw4RpN1h8+Eb
         MBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eOXE8R0rs9hWTG1f22gZq63lJX1nC2oAn7YRODWgoMM=;
        fh=FuO3Idbz0QZKzPEGJUw0h1m6vdkvnrYcPpfa2NGeDos=;
        b=aoen324/qT7hNCerSmQWrALvW7IO/+cR77RN8TRNLA1IoPHQdd+cEubu/KyEv/TeHN
         LXsK6QaH7qZjfxeT7XMwwKNk4+jjmmkUofcU/3pdDb0BDd1cb1xWX3V/3YaXCD8B6F/0
         5uPmUHGLvPABYCI4t4W0qmXi9aHQ7eqYDLAYhp01ofR4DzLzurw0ph/xU9C3OzL1vgw5
         j+xBQB1kcuNGLx4nibcyo4mQIJPcjjj7+y1kRueWCGOKB6HtvXlEHGEJL690O6MnqXio
         u/tiul4YyyuXwJBuaqzfP0HYIuHV2BlzYqRlTkOI78y+/R1OWyaxKfsmaPAm4B1YKKF8
         As5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780940832; x=1781545632; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eOXE8R0rs9hWTG1f22gZq63lJX1nC2oAn7YRODWgoMM=;
        b=kKQQBAckVZfId/WGRPH7EqFTUEym6KmDN02Nn//YQKgx/vFnkEK2tiK7P37qxt8iMU
         6Qt0murv16JIpWjiq+3Qkd6sr9g+UX95IblxhPNr+omyE/e36k/iPXWnoG5ZVZCqRL9Y
         v6mWPU9bf0WSj3qBOM4pNWnwq3eR9VUKN49A3sZKHO5VvXHH3SGjA4xh/i8ovCX2A/AZ
         nI/D7wcJrk7tULzEuRbA0+pl5defrozQJuCmMVviHehEpx5mw0z342mN+H2FG0qUzhUp
         1BCbAe21d9t4epdcfRR9T7+PvSWAnQclRzHBbJbCji2h3+BUi+kxVFPGMQqKBcytC7xl
         nadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780940832; x=1781545632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOXE8R0rs9hWTG1f22gZq63lJX1nC2oAn7YRODWgoMM=;
        b=liHIiC6lM2k8GL0ncXTmk8tdK4Hptm0fakvzYEUdyXmRyD+yR3hz/liFbz1FGZhLsK
         HIKpXP83rqZoFDY0AZuUnVdyQ3rkiNqGli20MDqHMC3SUhW5nkxHjJE41OFqTMt5pdwk
         XB5qoyMc8dFC6OnmfSoPe/YbnqIQS57c0PPW0hL+E6ZXcYNn1WBVjcqUfPrShkpwWNf6
         6RQfUhAWQl47gHpMfh6cudddDpQXd17Lp23x7mX00iZ62fddPZEzrurEO5ssXNJZY8qZ
         QFYRJE2sGmZs511JD6MsHuxjgDeqLf4FjHIbCmaseDVNv92aiKURMX855foRWEfnRYLN
         mDDg==
X-Forwarded-Encrypted: i=1; AFNElJ/zFAHkJCEsolzf47EWQEEc1FI40nWK1ocwN/nJYLXrFC+4chqXDkNJDY4HFZHtYM/w1FsHlZmKJKpt9OOV@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFKAg/HNuODumQvAR5VKitjdgeZP21eRUTPUT37rXkefdOz1E
	rUzRO4u/Ysr/DnTB+QFrSMdkPSIPKgYhee1VleNDzu/PU4yLz6fJ3IQg/mp8L/eOc0Ozp6KlhkP
	ir5auuGsMlzYFyrx5d1werkNb67N5qAFu+9eV/hvpaA==
X-Gm-Gg: Acq92OH9y5dFhok/yGCj7beg8XRX9kZanwSukhdofAfHwOe4tg6aCUrRNqiYFCcB+dw
	8CorAN8P+YYfJtGSHTSnx3TLFzs1H6rgnaHBmvmtuudHZ+kmweAxyBg/mT6nOn0Ku7HqTyfk5i+
	uFn5YSPX+mCS/RPcVI31CRQ2R/1G+ji8FX9zDTgops92V8hKyjzwuGnO1izdgheYZNaNH6ZpgXE
	IKHHGOnTKfEff5SpxgCC3NS+LxvCWUznUsbbevH6Ry52yYlLOCqu02h6LM6qpKybrFGfh55/EC0
	4nn9sSj0QiDp/cdkBQY8zJdzlYYmcRgSxq2TQnwCgLidSNtL3pXb
X-Received: by 2002:a05:6402:847:b0:68e:4c0:f5b1 with SMTP id
 4fb4d7f45d1cf-68fa4c00598mr6979387a12.2.1780940831827; Mon, 08 Jun 2026
 10:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602160829.560904-1-runyu.xiao@seu.edu.cn>
 <20260604035239.1711889-1-runyu.xiao@seu.edu.cn> <20260604035239.1711889-3-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260604035239.1711889-3-runyu.xiao@seu.edu.cn>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 8 Jun 2026 11:47:00 -0600
X-Gm-Features: AVVi8CfoZLiHBf9aDuZ4wDa8jT-va5Ux9POcpJ_j1yJw8B2FcWKwCD0yeZ72G4c
Message-ID: <CANLsYkwa9STAfcBxhgMVCEOWwmBVBx=fW+XwZrRUR07eeY6KjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rpmsg: core: use generic driver_override infrastructure
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux@armlinux.org.uk, andersson@kernel.org, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, nipun.gupta@amd.com, 
	nikhil.agarwal@amd.com, linux-remoteproc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:driver-core@lists.linux.dev,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:linux-remoteproc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-111940-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,linaro.org:dkim,linaro.org:email,linaro.org:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FDB2659608

On Wed, 3 Jun 2026 at 21:52, Runyu Xiao <runyu.xiao@seu.edu.cn> wrote:
>
> RPMSG still keeps driver_override in bus-private storage.
>
> That private pointer can be updated from the sysfs driver_override
> attribute, and also from rpmsg_register_device_override(). Both paths
> replace the pointer and can free the old value.
>
> However, driver_match_device() can call rpmsg_dev_match() from
> __driver_attach() without holding the device lock, and rpmsg_dev_match()
> still dereferences that private pointer directly.
>
> This leaves the match path racing with concurrent driver_override
> updates, with the usual risk of comparing against freed memory.
>
> Switch rpmsg to the driver-core driver_override infrastructure. This
> removes the private storage, uses device_match_driver_override() for the
> locked read in rpmsg_dev_match(), and converts
> rpmsg_register_device_override() to device_set_driver_override() so the
> in-kernel override path uses the same core-managed storage. With that
> storage now owned by struct device, drop the remaining rpmsg transport
> release-path frees of rpdev->driver_override as well.
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/
> Fixes: 39e47767ec9b ("rpmsg: Add driver_override device attribute for rpmsg_device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> drivers/rpmsg/qcom_glink_native.c |  2 --
> drivers/rpmsg/rpmsg_core.c        | 41 ++++++--------------------------------
> drivers/rpmsg/virtio_rpmsg_bus.c  |  1 -
> include/linux/rpmsg.h             |  4 ----

For the bottom 3:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  4 files changed, 6 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e7f7831d37f8..11d3007db5cd 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -358,33 +358,6 @@ rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       int ret;
> -
> -       ret = driver_set_override(dev, &rpdev->driver_override, buf, count);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *buf)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len = sysfs_emit(buf, "%s\n", rpdev->driver_override);
> -       device_unlock(dev);
> -       return len;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
>  static ssize_t modalias_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
> @@ -405,7 +378,6 @@ static struct attribute *rpmsg_dev_attrs[] = {
>         &dev_attr_dst.attr,
>         &dev_attr_src.attr,
>         &dev_attr_announce.attr,
> -       &dev_attr_driver_override.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(rpmsg_dev);
> @@ -424,9 +396,11 @@ static int rpmsg_dev_match(struct device *dev, const struct device_driver *drv)
>         const struct rpmsg_driver *rpdrv = to_rpmsg_driver(drv);
>         const struct rpmsg_device_id *ids = rpdrv->id_table;
>         unsigned int i;
> +       int ret;
>
> -       if (rpdev->driver_override)
> -               return !strcmp(rpdev->driver_override, drv->name);
> +       ret = device_match_driver_override(dev, drv);
> +       if (ret >= 0)
> +               return ret;
>
>         if (ids)
>                 for (i = 0; ids[i].name[0]; i++)
> @@ -533,6 +507,7 @@ static void rpmsg_dev_remove(struct device *dev)
>
>  static const struct bus_type rpmsg_bus = {
>         .name           = "rpmsg",
> +       .driver_override = true,
>         .match          = rpmsg_dev_match,
>         .dev_groups     = rpmsg_dev_groups,
>         .uevent         = rpmsg_uevent,
> @@ -560,9 +535,7 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>
>         device_initialize(dev);
>         if (driver_override) {
> -               ret = driver_set_override(dev, &rpdev->driver_override,
> -                                         driver_override,
> -                                         strlen(driver_override));
> +               ret = device_set_driver_override(dev, driver_override);
>                 if (ret) {
>                         dev_err(dev, "device_set_override failed: %d\n", ret);
>                         put_device(dev);
> @@ -573,8 +546,6 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>         ret = device_add(dev);
>         if (ret) {
>                 dev_err(dev, "device_add failed: %d\n", ret);
> -               kfree(rpdev->driver_override);
> -               rpdev->driver_override = NULL;
>                 put_device(dev);
>         }
>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 401a4ece0c97..d9d4468e4cbd 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1626,7 +1626,6 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  {
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> @@ -1862,7 +1861,6 @@ static void qcom_glink_device_release(struct device *dev)
>
>         /* Release qcom_glink_alloc_channel() reference */
>         kref_put(&channel->refcount, qcom_glink_channel_release);
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 5ae15111fb4f..1b8bb05924af 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -374,7 +374,6 @@ static void virtio_rpmsg_release_device(struct device *dev)
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>         struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>
> -       kfree(rpdev->driver_override);
>         kfree(vch);
>  }
>
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 83266ce14642..2e40eb54155e 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -41,9 +41,6 @@ struct rpmsg_channel_info {
>   * rpmsg_device - device that belong to the rpmsg bus
>   * @dev: the device struct
>   * @id: device id (used to match between rpmsg drivers and devices)
> - * @driver_override: driver name to force a match; do not set directly,
> - *                   because core frees it; use driver_set_override() to
> - *                   set or clear it.
>   * @src: local address
>   * @dst: destination address
>   * @ept: the rpmsg endpoint of this channel
> @@ -53,7 +50,6 @@ struct rpmsg_channel_info {
>  struct rpmsg_device {
>         struct device dev;
>         struct rpmsg_device_id id;
> -       const char *driver_override;
>         u32 src;
>         u32 dst;
>         struct rpmsg_endpoint *ept;
> --
> 2.34.1

