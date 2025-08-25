Return-Path: <linux-arm-msm+bounces-70786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF705B34F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 00:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD1F1B25D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D54A2C0F95;
	Mon, 25 Aug 2025 22:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3XBCaT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2736719E975
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162684; cv=none; b=apMyqs/xhLNEdRZrojS1fdWto5qCIBL2zirAE3dtOcjHWmF2NQ+W5M6q6WxHUqtlIiwSKsuwrAwynL7ekDV3Y5VjHpZ2g+cWVmgXj1+td4p1UHUP9WpsJvtx2DnaA/gEQmoigLikFYGi3NvsgEL1Wf8dIQkBLXsbdBPB7eJx0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162684; c=relaxed/simple;
	bh=Qi6SrWJmaJ0zqNVcVJ+3uam9XTkVt3lneFa6d9Vh7cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq7j4PSL8c8biXPgLJcRVOtdsCZ7MeLKBDzWHUoGy4WIatXCzKP1UZhRTRR94o9vMA579bwImchSBY02nPsC2nCx2UhII2Bf0aZJru078It8wbVwy9kYl5kactEelATXIVnZg7GG9ogCCKTg1MtLysXhHUcm4VO23lKwBic5YdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3XBCaT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA63C4CEED;
	Mon, 25 Aug 2025 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756162683;
	bh=Qi6SrWJmaJ0zqNVcVJ+3uam9XTkVt3lneFa6d9Vh7cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3XBCaT4RzrlxyZgpKqI7LtDiZ42J0WRo4zxVX2n82sYej3NRHAjOMJBY7Kyp7YAS
	 ngRqYXkK+tnRgQxFQksljX6yXtAw4AN8bk7kIHQ4NOM2D0hJ+x+5fB5NemO2dm72N0
	 6e1dsUv0oYsmHuorURmBeUl/X/zDL/kjyrqkGvdiT6shzpNlyJ4xvL4wUyKPOcUIAo
	 oIOmIOVQhaNr+Jhj7LC5BstTM+v7J3DGTTAoBnzN+4luDhm2sQFdotz+exeO5E9rVu
	 unboN12Z7Li995HWVlp6ecVyKdGSSkSx2g0Ng62dOWWzK64GISkpL5rxYqOTZV1zav
	 lrUFLNTZgSmpw==
Date: Mon, 25 Aug 2025 17:58:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 08/12] drivers: soc: qcom: Support Sahara command mode
 packets(READY and EXECUTE)
Message-ID: <nkgamfhw3rkddsuamfcvbdtbczjgb5enfsnoujy7ij57qcnfxe@7dp3n3xydsf2>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-9-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-9-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:22PM +0530, Kishore Batta wrote:
> During device boot, the device performs DDR training, and this training
> data needs to be stored at the host end to improve subsequent boot times.

As with the previous patch, I'd like to see this to be clarified. All
devices? Some devices? The tail end of the sentence indicate that this
is a performance improvement, is it?

Describe when DDR training happens, how it relates to Sahara and what
support a device that implements this needs from the host.

Note also, that above and below text does not belong in the same
paragraph, they are talking about different things.

> The Sahara protocol specification indicates that DDR training data can
> be stored at the host end using command mode packets. The device sends
> the command mode packet to the host through the HELLO packet, and the
> host changes its mode of operation accordingly.
> 

Okay, so the HELLO packet contains the information about the mode...

> Once the device determines that it needs to change the mode of operation
> to command mode, it sends the command ready packet.

...but what does this then describe?

> The host receives
> the command ready packet and then sends command 8 to get the list of
> commands supported by the device as per Sahara protocol specification.
> 

And then what?

Imagine that the reader doesn't know how the DDR training exchange over
Sahara works when they start reading this, will they have developed that
understanding when they get to the end of this text?

> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/sahara/sahara.c | 91 +++++++++++++++++++++++++++++---
>  1 file changed, 85 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> index df103473af3a..84327af48569 100644
> --- a/drivers/soc/qcom/sahara/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -59,6 +59,9 @@
>  #define SAHARA_RESET_LENGTH		0x8
>  #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>  #define SAHARA_MEM_READ64_LENGTH	0x18
> +#define SAHARA_COMMAND_READY_LENGTH	0x8
> +#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
>  
>  struct sahara_dev_trng_data {
>  	void *trng_data;
> @@ -66,6 +69,13 @@ struct sahara_dev_trng_data {
>  	bool receiving_trng_data;
>  };
>  
> +enum sahara_mode {
> +	SAHARA_MODE_NONE,
> +	SAHARA_MODE_MEM_DUMP,
> +	SAHARA_MODE_CMD,
> +	SAHARA_MODE_FW_DOWNLOAD,
> +};
> +
>  struct sahara_packet {
>  	__le32 cmd;
>  	__le32 length;
> @@ -100,6 +110,9 @@ struct sahara_packet {
>  			__le64 memory_address;
>  			__le64 memory_length;
>  		} memory_read64;
> +		struct {
> +			__le32 client_command;
> +		} command_execute;
>  	};
>  };
>  
> @@ -181,6 +194,7 @@ struct sahara_context {
>  	void				*mem_dump_freespace;
>  	u64				dump_images_left;
>  	bool				is_mem_dump_mode;
> +	enum sahara_mode		current_mode;
>  };
>  
>  struct sahara_dev_driver_data {
> @@ -282,8 +296,15 @@ static void sahara_release_image(struct sahara_context *context)
>  static void sahara_send_reset(struct sahara_context *context)
>  {
>  	int ret;
> +	struct sahara_dev_driver_data *sahara_data;
> +	struct sahara_dev_trng_data *sdev;
> +
> +	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
> +	sdev = sahara_data->sdev;
>  
>  	context->is_mem_dump_mode = false;
> +	context->current_mode = SAHARA_MODE_NONE;
> +	sdev->receiving_trng_data = false;

This is never set to true. So yet another incomplete patch?

>  
>  	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
>  	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
> @@ -297,6 +318,7 @@ static void sahara_send_reset(struct sahara_context *context)
>  static void sahara_hello(struct sahara_context *context)
>  {
>  	int ret;
> +	u32 mode;
>  
>  	dev_dbg(&context->mhi_dev->dev,
>  		"HELLO cmd received. length:%d version:%d version_compat:%d max_length:%d mode:%d\n",
> @@ -317,11 +339,17 @@ static void sahara_hello(struct sahara_context *context)
>  		return;
>  	}
>  
> -	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
> -	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
> -	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
> +	mode = le32_to_cpu(context->rx->hello.mode);
> +
> +	switch (mode) {
> +	case SAHARA_MODE_IMAGE_TX_PENDING:
> +	case SAHARA_MODE_IMAGE_TX_COMPLETE:
> +	case SAHARA_MODE_MEMORY_DEBUG:
> +	case SAHARA_MODE_COMMAND:

You're effectively adding one more condition to the if statement. One
can argue if the if statement or the switch is the cleaner way to write
that, but when you replace 4 lines and add 11 it's hard to see that all
you did was add one more accepted mode.

> +		break;
> +	default:
>  		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
> -			le32_to_cpu(context->rx->hello.mode));
> +			mode);
>  		return;
>  	}
>  
> @@ -514,6 +542,46 @@ static void sahara_memory_debug64(struct sahara_context *context)
>  		dev_err(&context->mhi_dev->dev, "Unable to send read for dump table %d\n", ret);
>  }
>  
> +static void sahara_command_execute(struct sahara_context *context, u32 client_command)
> +{
> +	int ret;
> +
> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_CMD);
> +	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXECUTE_LENGTH);
> +	context->tx[0]->command_execute.client_command = client_command;
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
> +			    SAHARA_COMMAND_EXECUTE_LENGTH, MHI_EOT);
> +
> +	if (ret)
> +		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
> +}
> +
> +static void sahara_command_ready(struct sahara_context *context)
> +{
> +	dev_dbg(&context->mhi_dev->dev,
> +		"Command ready cmd received. Length:%d\n",
> +		le32_to_cpu(context->rx->length));
> +
> +	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_READY_LENGTH) {
> +		dev_err(&context->mhi_dev->dev, "Malformed command ready packet - length %d\n",
> +			le32_to_cpu(context->rx->length));
> +		return;
> +	}
> +
> +	/*
> +	 * If the device sends the command ready packet, then its an indication

"If the device sends" sounds conditional - but if you're here the device
did send a command ready packet. And it's not an "indication", it really
means that we're switching to command mode.

> +	 * to host that it needs to switch to command mode.
> +	 */
> +	context->current_mode = SAHARA_MODE_CMD;
> +
> +	/*
> +	 * As per sahara spec, the host needs to send command ID 8 to get the
> +	 * list of commands supported by the device.
> +	 */
> +	 sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);

What will the device send next? Where is this handled? In the next^2
patch?

> +}
> +
>  static void sahara_processing(struct work_struct *work)
>  {
>  	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
> @@ -538,6 +606,9 @@ static void sahara_processing(struct work_struct *work)
>  	case SAHARA_MEM_DEBUG64_CMD:
>  		sahara_memory_debug64(context);
>  		break;
> +	case SAHARA_CMD_READY_CMD:
> +		sahara_command_ready(context);
> +		break;
>  	default:
>  		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
>  			le32_to_cpu(context->rx->cmd));
> @@ -873,7 +944,11 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  
>  static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>  {
> -	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
> +	struct sahara_dev_driver_data *sahara_data;
> +	struct sahara_context *context;
> +
> +	sahara_data = dev_get_drvdata(&mhi_dev->dev);
> +	context = sahara_data->context;
>  
>  	cancel_work_sync(&context->fw_work);
>  	cancel_work_sync(&context->dump_work);
> @@ -888,7 +963,11 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>  
>  static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>  {
> -	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
> +	struct sahara_dev_driver_data *sahara_data;
> +	struct sahara_context *context;
> +
> +	sahara_data = dev_get_drvdata(&mhi_dev->dev);
> +	context = sahara_data->context;

This was broken between the patches.

Make sure you structure your patches such that:
1) One can reason about the whole thing that the patch introduces
2) Don't break the system inbetween any two patches - as this prevents
the use of "git bisect"

Regards,
Bjorn

>  
>  	if (!mhi_result->transaction_status) {
>  		context->rx_size = mhi_result->bytes_xferd;
> -- 
> 2.34.1
> 

