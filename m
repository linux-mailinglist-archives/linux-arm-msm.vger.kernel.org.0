Return-Path: <linux-arm-msm+bounces-70789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE13B34FA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 01:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 440877A6775
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C853C1A9FA4;
	Mon, 25 Aug 2025 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqw3X7cZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F7193077
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756164280; cv=none; b=gMNg6ana/RWpXK+u1wuMrLqUZsxyxpi6dM/gxd3z+B/TX9rbS4gMWc26RouuXauXJbrZdZr6J7geUYX7LBPsBD0cWGvNS8Ly3BE8gIr+QHR+dSMkhGj9Ct7f7O8RT20mnlzUJYRQpnex6LwU5ddmeuXJAOigfmAH2F+y3aGdO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756164280; c=relaxed/simple;
	bh=I7QUpxBACEoRTQ/UzWuGbAGJDKoRDN15fz1Il5f5TIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgjS2i3XxtU1JiNqXYLwSDWgFiR7cNHk+4xAfjevzuPR0uw09jdIlI15eYF77o4rMNZPaM5sUIsq7ts2AkSQ83vgDW3WU4FdHxhh02KiMTsS0mTwfhDJ9/vloCTTPD7N7jkItDFLXzOrVltahAIg3/n175bpvuoRSAOb9FnQGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqw3X7cZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1162C4CEED;
	Mon, 25 Aug 2025 23:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756164280;
	bh=I7QUpxBACEoRTQ/UzWuGbAGJDKoRDN15fz1Il5f5TIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqw3X7cZrC65h2XDAAR+e+I+k3+HZ3wudhFHh249mOtA+7QiSXnhcKpwvThhjO5XA
	 UGBhvzO5pAZuJbdjoQY0AIOpR+saK2SJ9/WHm+Zz/Q4Ddari6IwG8lyxdHiFQxzci8
	 uEUWK65mYQ/mwuuOLXeVzX/e3CRVE89yuSwFVySU4IruX90An/+fyULsNLcy4oRl/S
	 Qd366QElvhaEn3RsekEurz3YWcwEhUtKmsbB5vyTXd34/iIpeuXP7PqpR0n6VeU5vH
	 LDZFQkuhytw7T3Lp3eewm5rE0KPbzPyBcGTQ/Kk0je9KtNsRjDA/PW5BMc2HYOUhYC
	 daVTdCZ49P5Bw==
Date: Mon, 25 Aug 2025 18:24:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm
 QDU device.
Message-ID: <et4b6ijowhuins5xibpne4jf7v2cus4i3sqk3cm7aqasc6v6w4@psiej5eq4ftx>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:20PM +0530, Kishore Batta wrote:
> Add support for the Qualcomm QDU device. The Qualcomm QDU driver acts
> as a client driver to the Sahara protocol, including the QDU100-specific
> image table and registering it during device initialization.

"including the QDU100-specific image table"? That's not "including" it's
the only thing it does.

> The
> registration of the image table is required to transfer the QDU100
> specific firmware back to the device using Sahara protocol packets.

Compare above 5-6 lines with:

"The QDU device is flash-less and uses Sahara to load its firmware,
provide the table of firmware files."

> The
> MHI driver exposes a new channel name for the Qualcomm QDU100 device in
> the pci_generic.c file, and the same channel support is added in the
> Sahara driver.

Which MHI driver exposes a new channel name? Please rephrase this and
perhaps split it into a separate patch?

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig         | 14 ++++++
>  drivers/soc/qcom/Makefile        |  1 +
>  drivers/soc/qcom/qdu.c           | 85 ++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/sahara/sahara.c |  1 +
>  4 files changed, 101 insertions(+)
>  create mode 100644 drivers/soc/qcom/qdu.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 7ea4cff9a679..ffaaf6261c35 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -303,6 +303,20 @@ config QCOM_UBWC_CONFIG
>  	  with coherent configuration data. This module functions as a single
>  	  source of truth for that information.
>  
> +config QCOM_QDU
> +	tristate "Qualcomm QDU driver"
> +	select QCOM_SAHARA_PROTOCOL
> +	help
> +	  This is a client driver which registers the device specific operations
> +	  with sahara protocol which is used to download firmware to Qualcomm
> +	  distributed unit device.
> +	  The Qualcomm QDU driver facilitates the registration of device
> +	  specific operations with the sahara protocol, enabling firmware
> +	  download to the QDU device.

This makes it sound like there's a bunch going on in this driver, is
more of this coming?

> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called qdu.
> +
>  source "drivers/soc/qcom/sahara/Kconfig"
>  
>  endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 99e490e3174e..8d036edf304a 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>  obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>  obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>  obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
> +obj-$(CONFIG_QCOM_QDU) += qdu.o

This list was somewhat an approximation of being in alphabetical
order...

> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
> new file mode 100644
> index 000000000000..afd8011793fa
> --- /dev/null
> +++ b/drivers/soc/qcom/qdu.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */

Look at other drivers in drivers/soc/qcom...they don't format this
comment like this.

> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/sahara_image_table_ops.h>
> +
> +static const char * const qdu100_image_table[] = {
> +	[5] = "qcom/qdu100/uefi.elf",
> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
> +	[16] = "qcom/qdu100/efs1.bin",
> +	[17] = "qcom/qdu100/efs2.bin",
> +	[20] = "qcom/qdu100/efs3.bin",
> +	[23] = "qcom/qdu100/aop.mbn",
> +	[25] = "qcom/qdu100/tz.mbn",
> +	[29] = "qcom/qdu100/zeros_1sector.bin",
> +	[33] = "qcom/qdu100/hypvm.mbn",
> +	[34] = "qcom/qdu100/mdmddr.mbn",
> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
> +	[37] = "qcom/qdu100/multi_image.mbn",
> +	[38] = "qcom/qdu100/xbl_config.elf",
> +	[39] = "qcom/qdu100/abl_userdebug.elf",
> +	[40] = "qcom/qdu100/zeros_1sector.bin",
> +	[41] = "qcom/qdu100/devcfg.mbn",
> +	[42] = "qcom/qdu100/zeros_1sector.bin",
> +	[43] = "qcom/qdu100/kernel_boot.elf",
> +	[45] = "qcom/qdu100/tools_l.elf",
> +	[46] = "qcom/qdu100/Quantum.elf",
> +	[47] = "qcom/qdu100/quest.elf",
> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
> +	[49] = "qcom/qdu100/shrm.elf",
> +	[50] = "qcom/qdu100/cpucp.elf",
> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
> +	[54] = "qcom/qdu100/qupv3fw.elf",
> +};
> +
> +static struct sahara_image_table_provider qdu100_provider = {
> +	.image_table = qdu100_image_table,
> +	.image_table_size = ARRAY_SIZE(qdu100_image_table),
> +	.dev_name = "qcom-qdu100",
> +	.fw_folder_name = "qdu100",
> +	.list = LIST_HEAD_INIT(qdu100_provider.list)
> +};
> +
> +static struct sahara_image_table_provider *qdu_providers[] = {
> +	&qdu100_provider,
> +};
> +
> +static int __init qdu_init(void)

So patch 2, 3, and 4 just laid the groundwork, so that you could add a
new "driver" with the only purpose of carrying an array of firmware
names and the extra code to register it with the Sahara driver.

Why don't you just put the qdu100_image_table[] array in sahara.c and
save us a whole bunch of changes?

> +{
> +	int ret;
> +
> +	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {

Future proof! Please don't.

Regards,
Bjorn

> +		ret = sahara_register_image_table_provider(qdu_providers[i]);
> +		if (ret) {
> +			pr_err("qdu: Failed to register image table %d\n", ret);
> +
> +			/* Rollback previously registered providers */
> +			while (--i >= 0)
> +				sahara_unregister_image_table_provider(qdu_providers[i]);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +module_init(qdu_init);
> +
> +static void __exit qdu_exit(void)
> +{
> +	int ret;
> +
> +	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
> +		ret = sahara_unregister_image_table_provider(qdu_providers[i]);
> +		if (ret)
> +			pr_err("qdu: Failed to unregister image table %d\n", ret);
> +	}
> +}
> +module_exit(qdu_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm distributed unit driver");
> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> index 5e17d71a2d34..b07f6bd0e19f 100644
> --- a/drivers/soc/qcom/sahara/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -795,6 +795,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>  
>  static const struct mhi_device_id sahara_mhi_match_table[] = {
>  	{ .chan = "QAIC_SAHARA", },
> +	{ .chan = "SAHARA", },
>  	{},
>  };
>  
> -- 
> 2.34.1
> 

