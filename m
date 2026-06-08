Return-Path: <linux-arm-msm+bounces-111847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YVGPGCCmJmosagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:23:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AA655A39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ndm6peKp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111847-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111847-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CEAB303ADD9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 11:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894A6357A4A;
	Mon,  8 Jun 2026 11:17:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A33546FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:17:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917430; cv=none; b=jTz1Bpd8hd0dpbaKvmO37WChtp7afvAhyjQzJ3nSGobc2Xqqx82nRU2u6Mc34Ws4H/aS0Q/JDH4i5LvnU2Lyi4QFHy82kTaKwSPyX8hgIRs2ooisa8B8S8WlsjBCaa2EIYlggjdCweiPl1WS88UaJWzxgoPrAdZNQQk7kWRdmPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917430; c=relaxed/simple;
	bh=vvLJtoOfykHLv8Na3fR6zMHq3xxP6leuqwO6vq0KVo4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pToARlkQwTioCEjGjTaaewy17JxDM7s+0zvp4nFoCgHNQPKzGnbLx69uY77xCx2SObPpSenSrN+KIGklBur8JA7ca25lf7eRkdsGzLQvdBRCZ1TbETPtoG6HFr6CggR+V0oI1qx4Tp4LdiCKMD7JmHeX/9G7Yu3Ubk4ejb1XGw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ndm6peKp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EDE1F0089D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917428;
	bh=JS7UICwqoceyTJ7x6+zt9hPHx1tUVGLh3IUeEbiEO/E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ndm6peKp0/oM2vQjaiN4z/ae9Z2txjjt10yQm79ZbJT5ms2qoGhDxmxafiP5M2rpw
	 /AsebPD1vQxWFqGDEeGFobqVh1lVwVoHSeSxzGbEAaO/ulhT33tjJXMNlizJ9k0eO5
	 UZQc8nl/GHD/qnIhLtfI91bqU83GgzBmkpwEB3ayW9tTgyw01TewL9m1GUhKz+vwjA
	 9c3jkFTBwCfb4rbRJ/h5/xy4IQcJifXPgw53yOFZJPQUIcWXxrV0HXnGGej9pwrTMU
	 79/KHf0mqKq9TaAHevgwxVwbxdns/J0FqxuZhaplgFC9H/3PMOEcjVCi1eK0IviuPF
	 N2eVTXKJHhZkA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa69131836so3528730e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9feWEAQGghaphQbywecif9MGPaFkT/tQ3YtCuTXu0TdHVB/GWx+SMmDJMx4ZahzIGUvM1jCRYRT6gSTG0D@vger.kernel.org
X-Gm-Message-State: AOJu0YxYp9KUidK+42DJktQSDFXxKRWmMrHguiMBeT5H2ja7wC0svVZe
	QVYw2w/z+0Q3mwl3MGTj3pKoBtH/fv6I2G1tLrCMnHUzlcuB2NETJCenD8BuG5LhZvixUtczRty
	aO3+i+Nvk7naWqdjNe0S0pCmj5aZlATXyHM63lcEm2Q==
X-Received: by 2002:a05:6512:1114:b0:5a8:8222:7fc9 with SMTP id
 2adb3069b0e04-5aa87ba35c2mr3672220e87.13.1780917427508; Mon, 08 Jun 2026
 04:17:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:17:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:17:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:17:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=McmoWvezeH05_5AR7ZbAyg1L567HsKWbuD7711LwnjV0Q@mail.gmail.com>
X-Gm-Features: AVVi8Cesm3odc32Z-SPOxn8Wmr5vbPlz43scUvzgQJv_WkuDGH2g_rYPFhE9BsE
Message-ID: <CAMRc=McmoWvezeH05_5AR7ZbAyg1L567HsKWbuD7711LwnjV0Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] block: implement NVMEM provider
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111847-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,makrotopia.org,kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,makrotopia.org:email,config.name:url,qualcomm.com:email,mail.gmail.com:mid,config.id:url,config.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE5AA655A39

On Mon, 8 Jun 2026 12:50:41 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> From: Daniel Golle <daniel@makrotopia.org>
>
> On embedded devices using an eMMC it is common that one or more partitions
> on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
> data. Allow referencing the partition in device tree for the kernel and
> Wi-Fi drivers accessing it via the NVMEM layer.
>
> To safely defer the freeing of the provider private data until all
> consumers have released their cells, a nvmem_dev() accessor is added to
> the NVMEM core to expose the struct device embedded in struct nvmem_device.
> This allows registering a devm action on the nvmem device itself, ensuring
> the private data outlives any active cell references.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  block/Kconfig                  |   9 +++
>  block/Makefile                 |   1 +
>  block/blk-nvmem.c              | 171 +++++++++++++++++++++++++++++++++++++++++
>  drivers/nvmem/core.c           |  13 ++++
>  include/linux/nvmem-consumer.h |   6 ++
>  5 files changed, 200 insertions(+)
>
> diff --git a/block/Kconfig b/block/Kconfig
> index 15027963472d7b40e27b9097a5993c457b5b3054..0b33747e16dc33473683706f75c92bdf8b648f7c 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -209,6 +209,15 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
>  	  by falling back to the kernel crypto API when inline
>  	  encryption hardware is not present.
>
> +config BLK_NVMEM
> +	bool "Block device NVMEM provider"
> +	depends on OF
> +	depends on NVMEM
> +	help
> +	  Allow block devices (or partitions) to act as NVMEM providers,
> +	  typically used with eMMC to store MAC addresses or Wi-Fi
> +	  calibration data on embedded devices.
> +
>  source "block/partitions/Kconfig"
>
>  config BLK_PM
> diff --git a/block/Makefile b/block/Makefile
> index 7dce2e44276c4274c11a0a61121c83d9c43d6e0c..d7ac389e71902bc091a8800ea266190a43b3e63d 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -36,3 +36,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
>  					   blk-crypto-sysfs.o
>  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
>  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
> +obj-$(CONFIG_BLK_NVMEM)                += blk-nvmem.o
> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..99c7728fb7bccdc2216780a73a89a9210f925049
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * block device NVMEM provider
> + *
> + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Useful on devices using a partition on an eMMC for MAC addresses or
> + * Wi-Fi calibration EEPROM data.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/pagemap.h>
> +#include <linux/property.h>
> +
> +#include "blk.h"
> +
> +

Stray newline?

> +/* List of all NVMEM devices */
> +static LIST_HEAD(nvmem_devices);
> +static DEFINE_MUTEX(devices_mutex);
> +
> +struct blk_nvmem {
> +	struct nvmem_device	*nvmem;
> +	dev_t			devt;
> +	struct list_head	list;
> +};
> +
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> +	struct blk_nvmem *bnv = priv;
> +	size_t bytes_left = bytes;
> +	struct file *bdev_file;
> +	loff_t pos = from;
> +	int ret = 0;
> +
> +	bdev_file = bdev_file_open_by_dev(bnv->devt, mode, priv, NULL);
> +	if (!bdev_file)
> +		return -ENODEV;
> +
> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	while (bytes_left) {
> +		pgoff_t f_index = pos >> PAGE_SHIFT;
> +		struct folio *folio;
> +		size_t folio_off;
> +		size_t to_read;
> +
> +		folio = read_mapping_folio(bdev_file->f_mapping, f_index, NULL);
> +		if (IS_ERR(folio)) {
> +			ret = PTR_ERR(folio);
> +			goto err_release_bdev;
> +		}
> +
> +		folio_off = offset_in_folio(folio, pos);
> +		to_read = min(bytes_left, folio_size(folio) - folio_off);
> +		memcpy_from_folio(val, folio, folio_off, to_read);
> +		pos += to_read;
> +		bytes_left -= to_read;
> +		val += to_read;
> +		folio_put(folio);
> +	}
> +
> +err_release_bdev:
> +	fput(bdev_file);

There's a __free() action defined in linux/file.h so you can use:

	struct file *bdev_file __free(fput) = ...

and avoid this label.

> +
> +	return ret;
> +}
> +
> +static int blk_nvmem_register(struct device *dev)
> +{
> +	struct device_node *child, *np = dev_of_node(dev);
> +	struct block_device *bdev = dev_to_bdev(dev);
> +	struct nvmem_config config = {};
> +	struct blk_nvmem *bnv;
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!np)
> +		return 0;
> +
> +	/* skip devices without an nvmem layout defined */
> +	child = of_get_child_by_name(np, "nvmem-layout");
> +	if (!child)
> +		return 0;
> +	of_node_put(child);

Same as above, can be:

	struct device_node *child __free(device_node) == ...

> +
> +	/*
> +	 * skip block device too large to be represented as NVMEM devices,
> +	 * the NVMEM reg_read callback uses an unsigned int offset
> +	 */
> +	if (bdev_nr_bytes(bdev) > UINT_MAX)
> +		return -EFBIG;

This will mean a failed probe. Wouldn't it be better to use -ENODEV?

> +
> +	bnv = kzalloc_obj(*bnv);
> +	if (!bnv)
> +		return -ENOMEM;
> +
> +	config.id = NVMEM_DEVID_NONE;
> +	config.dev = &bdev->bd_device;
> +	config.name = dev_name(&bdev->bd_device);
> +	config.owner = THIS_MODULE;
> +	config.priv = bnv;
> +	config.reg_read = blk_nvmem_reg_read;
> +	config.size = bdev_nr_bytes(bdev);
> +	config.word_size = 1;
> +	config.stride = 1;
> +	config.read_only = true;
> +	config.root_only = true;
> +	config.ignore_wp = true;
> +	config.of_node = to_of_node(dev->fwnode);
> +
> +	bnv->devt = bdev->bd_device.devt;
> +	bnv->nvmem = nvmem_register(&config);
> +	if (IS_ERR(bnv->nvmem)) {
> +		dev_err_probe(&bdev->bd_device, PTR_ERR(bnv->nvmem),
> +			      "Failed to register NVMEM device\n");
> +		kfree(bnv);
> +		return PTR_ERR(bnv->nvmem);
> +	}
> +
> +	scoped_guard(mutex, &devices_mutex)
> +		list_add_tail(&bnv->list, &nvmem_devices);

I'm not sure I understand the need to store these? Whatever you need to do in
remove() can be scheduled in a devres action here.

> +
> +	return 0;
> +}
> +
> +static void blk_nvmem_unregister(struct device *dev)
> +{
> +	struct blk_nvmem *bnv_c, *bnv_t, *bnv = NULL;
> +
> +	scoped_guard(mutex, &devices_mutex) {
> +		list_for_each_entry_safe(bnv_c, bnv_t, &nvmem_devices, list) {
> +			if (bnv_c->devt == dev_to_bdev(dev)->bd_device.devt) {
> +				bnv = bnv_c;
> +				list_del(&bnv->list);
> +				break;
> +			}
> +		}
> +
> +		if (!bnv)
> +			return;
> +	}
> +
> +	nvmem_unregister(bnv->nvmem);
> +	kfree(bnv);
> +}
> +
> +static struct class_interface blk_nvmem_bus_interface __refdata = {
> +	.class = &block_class,
> +	.add_dev = &blk_nvmem_register,
> +	.remove_dev = &blk_nvmem_unregister,
> +};
> +
> +static int __init blk_nvmem_init(void)
> +{
> +	int ret;
> +
> +	ret = class_interface_register(&blk_nvmem_bus_interface);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +device_initcall(blk_nvmem_init);
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 311cb2e5a5c02d2c6979d7c9bbb7f94abdfbdad1..ee3481229c20b3063c86d0dd66aabbf6b5e29169 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -2154,6 +2154,19 @@ const char *nvmem_dev_name(struct nvmem_device *nvmem)
>  }
>  EXPORT_SYMBOL_GPL(nvmem_dev_name);
>
> +/**
> + * nvmem_dev() - Get the struct device of a given nvmem device.
> + *
> + * @nvmem: nvmem device.
> + *
> + * Return: pointer to the struct device of the nvmem device.
> + */
> +struct device *nvmem_dev(struct nvmem_device *nvmem)
> +{
> +	return &nvmem->dev;
> +}
> +EXPORT_SYMBOL_GPL(nvmem_dev);

This should still be a separate patch.

> +
>  /**
>   * nvmem_dev_size() - Get the size of a given nvmem device.
>   *
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 34c0e58dfa26636d2804fcc7e0bc4a875ee73dae..ce387c89dc8e4bc1241f3b6f36be8c6c95e282ed 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -82,6 +82,7 @@ int nvmem_device_cell_write(struct nvmem_device *nvmem,
>
>  const char *nvmem_dev_name(struct nvmem_device *nvmem);
>  size_t nvmem_dev_size(struct nvmem_device *nvmem);
> +struct device *nvmem_dev(struct nvmem_device *nvmem);
>
>  void nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries,
>  			    size_t nentries);
> @@ -220,6 +221,11 @@ static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
>  	return NULL;
>  }
>
> +static inline struct device *nvmem_dev(struct nvmem_device *nvmem)
> +{
> +	return NULL;
> +}
> +
>  static inline void
>  nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries, size_t nentries) {}
>  static inline void
>
> --
> 2.34.1
>
>

Bart

