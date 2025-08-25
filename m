Return-Path: <linux-arm-msm+bounces-70773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C082B34E2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267F91A8855F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA95623ABA7;
	Mon, 25 Aug 2025 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ffa5LHOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947CEF9CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157934; cv=none; b=dSXRTE/Rixinat6PmgEQGWOyIJXYbYjfXcHMloJWtuQN2sqJilA0Gt1IHWqFasdecAJj3b7dNH1+CrJ7KaxX2b8GdUSXReRtAq6HZqzSBQOl5tOwd00z04gynqLsNYy2DtDZUejk56MitztiGtPxh7J0sgvtBwwUyXufAQFpRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157934; c=relaxed/simple;
	bh=z47pfTHUHGCj0fmiKTUydnHjSn9MrUcsv68MZZ7Vo/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWDFupARkrTTTWg4Bk1XBW4Yn5wPzSvn6hrNJ+iT1qVtdtth0WaR3voWa5gjSV6y+5B0sPetrOiGk1o0emu6GF9KaVQBME3b1nshPXAo3kJLOOWuC/2viuIQRykTpOAIgfhMyrwV39RMBYWYWJ/FOpB0wBIL9wQwTMSURI8kQw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ffa5LHOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49177C4CEED;
	Mon, 25 Aug 2025 21:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756157933;
	bh=z47pfTHUHGCj0fmiKTUydnHjSn9MrUcsv68MZZ7Vo/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ffa5LHOzS3dpzZVro18wrXQCoHw6VzqLxMB9gLbvapfxlN5KRc1hAK99VSKuq7yT9
	 XdXa2cZHcF+hAUVyq5dz4m/67LFrzNjuvzfqWbecCvfOLyLRaScx21dEnPyYMZ6vEO
	 R3kE9JuT6WNZiRFJ/X5bxONpnJQpkPKyjpEKOk0ulSQjHGRZ8hUIKvIql5JxvmvSt0
	 iuEOOcAAAQrKpmbzh/hoF2jEO6cLXpU6aaGi90lZ3b27spV2hY4dQHqRpqVQR/oJ+e
	 k6FVBbwZ+T7oFdv/miPLtitZrfmU5x5RmLYXpnA2Tq8q9o5YIqGnzy3Kk3XLHkhAJh
	 EFbvKuRLw1bpQ==
Date: Mon, 25 Aug 2025 16:38:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 04/12] drivers: accel: Register Qualcomm AIC specific
 image tables with Sahara.
Message-ID: <mftf4oqwa2mslfghmkohkrgyx2ka2cowfjmfnly35pdly337ny@3o4xk75ppmax>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-5-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-5-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:18PM +0530, Kishore Batta wrote:
> Register Qualcomm AIC-specific image tables with the Sahara protocol.
> The Sahara protocol provides a method for client drivers to register
> device-specific image tables, which is mandatory for firmware transfer.
> During QAIC device initialization, the QAIC driver must register the
> image table information with the Sahara protocol for firmware transfer
> to occur. Once the device is probed, it sends the required Sahara packets
> to the host. Based on the connected device, Sahara selects the appropriate
> image table and sends the firmware image data back to the device.

This does describe things that is happening. But it doesn't describe the
purpose of this patch.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 57 +++++++++++++++++++++++++++--
>  drivers/accel/qaic/mhi_controller.h |  2 +
>  drivers/accel/qaic/qaic_drv.c       |  7 ++++
>  drivers/accel/qaic/sahara.c         | 17 +++++----
>  drivers/accel/qaic/sahara.h         |  6 ---
>  5 files changed, 73 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 5cc7994f4809..16c346e0e3b5 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -13,6 +13,7 @@
>  
>  #include "mhi_controller.h"
>  #include "qaic.h"
> +#include "sahara_image_table_ops.h"
>  
>  #define MAX_RESET_TIME_SEC 25
>  
> @@ -801,8 +802,6 @@ const char * const aic100_image_table[] = {
>  	[10] = "qcom/aic100/fw10.bin",
>  };
>  
> -const size_t aic100_image_table_size = ARRAY_SIZE(aic100_image_table);
> -
>  const char * const aic200_image_table[] = {
>  	[5]  = "qcom/aic200/uefi.elf",
>  	[12] = "qcom/aic200/aic200-nsp.bin",
> @@ -831,7 +830,59 @@ const char * const aic200_image_table[] = {
>  	[75] = "qcom/aic200/pvs.bin",
>  };
>  
> -const size_t aic200_image_table_size = ARRAY_SIZE(aic200_image_table);
> +static struct sahara_image_table_provider aic100_provider = {
> +	.image_table = aic100_image_table,
> +	.image_table_size = ARRAY_SIZE(aic100_image_table),
> +	.dev_name = "AIC100",
> +	.fw_folder_name = "aic100",
> +	.list = LIST_HEAD_INIT(aic100_provider.list)
> +};
> +
> +static struct sahara_image_table_provider aic200_provider = {
> +	.image_table = aic200_image_table,
> +	.image_table_size = ARRAY_SIZE(aic200_image_table),
> +	.dev_name = "AIC200",
> +	.fw_folder_name = "aic200",
> +	.list = LIST_HEAD_INIT(aic200_provider.list)
> +};
> +
> +static struct sahara_image_table_provider *aic_providers[] = {
> +	&aic100_provider,
> +	&aic200_provider,
> +};
> +
> +int qaic_sahara_register_image_tables(void)
> +{
> +	int ret;
> +
> +	for (int i = 0; i < ARRAY_SIZE(aic_providers); i++) {
> +		ret = sahara_register_image_table_provider(aic_providers[i]);
> +		if (ret) {
> +			pr_err("qaic: Failed to register image table %d\n",
> +			       ret);
> +
> +			/* Rollback previously registered providers */
> +			while (--i >= 0)
> +				sahara_unregister_image_table_provider(aic_providers[i]);
> +
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +void qaic_sahara_unregister_image_tables(void)
> +{
> +	int ret;
> +
> +	for (int i = 0; i < ARRAY_SIZE(aic_providers); i++) {
> +		ret = sahara_unregister_image_table_provider(aic_providers[i]);
> +		if (ret)
> +			pr_err("qaic: Failed to unregister image table %d\n",
> +			       ret);
> +	}
> +}
> +
>  
>  static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
>  {
> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
> index 8939f6ae185e..90c0f07cbdf6 100644
> --- a/drivers/accel/qaic/mhi_controller.h
> +++ b/drivers/accel/qaic/mhi_controller.h
> @@ -12,5 +12,7 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>  void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
>  void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>  void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
> +int qaic_sahara_register_image_tables(void);
> +void qaic_sahara_unregister_image_tables(void);
>  
>  #endif /* MHICONTROLLERQAIC_H_ */
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index e31bcb0ecfc9..5c4fab328003 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -688,6 +688,12 @@ static int __init qaic_init(void)
>  		goto free_mhi;
>  	}
>  
> +	ret = qaic_sahara_register_image_tables();

Now that you're doing this on a per-device basis (but actually per
driver), could this somehow be done from qaic_mhi_register_controller()
instead. So we don't run this code unless you actually have a QAIC
attached?

> +	if (ret) {
> +		pr_debug("qaic: Image table registration failed %d\n", ret);

That's not a debug print...which is also the reason why you pr_err()
inside the function. I.e. this is at best spamming the log.

> +		goto free_mhi;
> +	}
> +

Regards,
Bjorn

>  	ret = qaic_timesync_init();
>  	if (ret)
>  		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
> @@ -727,6 +733,7 @@ static void __exit qaic_exit(void)
>  	 * reinitializing the link_up state after the cleanup is done.
>  	 */
>  	link_up = true;
> +	qaic_sahara_unregister_image_tables();
>  	qaic_ras_unregister();
>  	qaic_bootlog_unregister();
>  	qaic_timesync_deinit();
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index cf8f8b585223..7eae329396be 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -14,6 +14,7 @@
>  #include <linux/workqueue.h>
>  
>  #include "sahara.h"
> +#include "sahara_image_table_ops.h"
>  
>  #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>  #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
> @@ -738,13 +739,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	INIT_WORK(&context->fw_work, sahara_processing);
>  	INIT_WORK(&context->dump_work, sahara_dump_processing);
>  
> -	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
> -		context->image_table = aic200_image_table;
> -		context->table_size = aic200_image_table_size;
> -	} else {
> -		context->image_table = aic100_image_table;
> -		context->table_size = aic100_image_table_size;
> -	}
> +	/* Get the image table for a given device name */
> +	context->image_table = sahara_get_image_table(mhi_dev->mhi_cntrl->name);
> +	if (!context->image_table)
> +		return -EINVAL;
> +
> +	/* Get the image table size for a given device name */
> +	context->table_size = sahara_get_image_table_size(mhi_dev->mhi_cntrl->name);
> +	if (!context->table_size)
> +		return -EINVAL;
>  
>  	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>  	dev_set_drvdata(&mhi_dev->dev, context);
> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
> index d7fd447ca85b..dde8c736d29e 100644
> --- a/drivers/accel/qaic/sahara.h
> +++ b/drivers/accel/qaic/sahara.h
> @@ -8,10 +8,4 @@
>  int sahara_register(void);
>  void sahara_unregister(void);
>  
> -extern const char * const aic200_image_table[];
> -extern const size_t aic200_image_table_size;
> -
> -extern const char * const aic100_image_table[];
> -extern const size_t aic100_image_table_size;
> -
>  #endif /* __SAHARA_H__ */
> -- 
> 2.34.1
> 

