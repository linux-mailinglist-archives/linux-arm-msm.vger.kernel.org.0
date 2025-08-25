Return-Path: <linux-arm-msm+bounces-70788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D395AB34F9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 01:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2990F7A6778
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B5D2C15A0;
	Mon, 25 Aug 2025 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDStY4bT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB42C15AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756163646; cv=none; b=qyNbZmFilz6U5X/EuhDchmKvJ1JeneUc4yGLjk1NEXQBuZj6V9C4TVtNzB7LSR5jWtBDQSKCuJuln8jJAJGSaJUzwYA09udL6lX/HhGT5AjX+AUjtjfolhfqdBDkLgn4WJ43IBN+0B/XI5aGETjK/OOfGqWVvXW/pdbYm0fPwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756163646; c=relaxed/simple;
	bh=pYtyW1PmJ0RUd28t5ucIgqgIXcoAvul3Wr4fZ8Z4gmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EstminhPQICKD/aGGIkq3zi4EtlBerh7ErOj7U444uxeQL5FlsLQQa+CgwxJicyK2KnrSPA7zammLmFX7Rp0JNgoFDotUaaHcwgzzu50tc8MkZJ/+UBOLa6YEOLL0yuBuvdI2bVJuQVjQUicspIxbqJWC4+CrkKjuMwvm/UhzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDStY4bT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80009C4CEED;
	Mon, 25 Aug 2025 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756163646;
	bh=pYtyW1PmJ0RUd28t5ucIgqgIXcoAvul3Wr4fZ8Z4gmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDStY4bTV2E6na8aB4yy9DWiVoJ+Ke7LXRh9XopkohTMWbC0C4N2prP2sP6BL5IMv
	 ohBGJOV8pIPCMXk+puvDw4v7eZ+wtKxxuYE+Q/9KfTduy3KYWbC6x1Wia4xeGrVPH5
	 Oak0oAhaLGogPhU6oH2jCq31hwUayGXb0FOVWkG6pDkyHVjBLuoww0g4r38Z5FeiQ1
	 piR9u7ASLIPjsDtQFgRUECjAJ59RZ0Kwt1NL8wkT2mGoF67Gl8em9dQLXeg5do0zy+
	 0IJLRonykZAcbMgFyOsY2Ki9SpdZwpOslGDWhQCV1iaKWoRq8xddKayCwTGUPgj7Su
	 wC/prUOthSOuA==
Date: Mon, 25 Aug 2025 18:14:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 10/12] drivers: soc: qcom: Support for DDR training in
 Sahara.
Message-ID: <mwbtmtj7dtarab2krchaolmltp7cd3kzw6v4plgfexailinm54@zfuvg3o4jdie>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-11-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-11-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:24PM +0530, Kishore Batta wrote:
> Support DDR training using Sahara command mode packets. Once the COMMAND
> EXECUTE packet is sent to the device, it responds with a packet containing
> the command ID. At this stage of boot, only the DDR training data command
> (ID - 9) is supported by the device. The host sends the command execute
> packet to execute command 9, and the device responds with the training
> data. This data is the actual DDR training data attached to the device,
> and its size is included in the response packet sent by the device.
> 
> Based on the size of the training data, the host queues multiple buffers
> to MHI to receive the data. This data is stored in a memory location
> and made available to the sysfs node.

As I write at the tail end of this patch, this is scattered over a whole
bunch of patches now. The "made available to the sysfs node" only barely
relates to the content of this patch, but to HEAD^^^.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/sahara/sahara.c | 197 +++++++++++++++++++++++++++++++
>  1 file changed, 197 insertions(+)
> 
> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> index 81d9b40d0f92..3887cdcfe256 100644
> --- a/drivers/soc/qcom/sahara/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -60,8 +60,14 @@
>  #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>  #define SAHARA_MEM_READ64_LENGTH	0x18
>  #define SAHARA_COMMAND_READY_LENGTH	0x8
> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
>  #define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
> +#define SAHARA_SWITCH_MODE_LENGTH	0xc
> +
>  #define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
> +#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
>  
>  struct sahara_dev_trng_data {
>  	void *trng_data;
> @@ -113,6 +119,16 @@ struct sahara_packet {
>  		struct {
>  			__le32 client_command;
>  		} command_execute;
> +		struct {
> +			__le32 client_command;
> +			__le32 response_length;
> +		} command_execute_resp;
> +		struct {
> +			__le32 client_command;
> +		} command_exec_data;
> +		struct {
> +			__le32 mode;
> +		} mode_switch;
>  	};
>  };
>  
> @@ -178,6 +194,7 @@ struct sahara_context {
>  	struct sahara_packet		*rx;
>  	struct work_struct		fw_work;
>  	struct work_struct		dump_work;
> +	struct work_struct		cmd_work;
>  	struct mhi_device		*mhi_dev;
>  	const char * const		*image_table;
>  	u32				table_size;
> @@ -194,6 +211,8 @@ struct sahara_context {
>  	void				*mem_dump_freespace;
>  	u64				dump_images_left;
>  	enum sahara_mode		current_mode;
> +	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
> +	u64				bytes_copied;
>  };
>  
>  struct sahara_dev_driver_data {
> @@ -555,6 +574,21 @@ static void sahara_command_execute(struct sahara_context *context, u32 client_co
>  		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
>  }
>  
> +static void sahara_switch_mode_to_img_tx(struct sahara_context *context)
> +{
> +	int ret;
> +
> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_SWITCH_MODE_CMD);
> +	context->tx[0]->length = cpu_to_le32(SAHARA_SWITCH_MODE_LENGTH);
> +	context->tx[0]->mode_switch.mode = SAHARA_MODE_IMAGE_TX_PENDING;
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
> +			    SAHARA_SWITCH_MODE_LENGTH, MHI_EOT);
> +
> +	if (ret)
> +		dev_err(&context->mhi_dev->dev, "Unable to send mode switch %d\n", ret);
> +}
> +
>  static void sahara_command_ready(struct sahara_context *context)
>  {
>  	dev_dbg(&context->mhi_dev->dev,
> @@ -580,6 +614,165 @@ static void sahara_command_ready(struct sahara_context *context)
>  	 sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
>  }
>  
> +static void sahara_alloc_mem_training_data(struct sahara_context *context)
> +{
> +	struct sahara_dev_driver_data *sahara_data;
> +	struct sahara_dev_trng_data *sdev;
> +
> +	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
> +	sdev = sahara_data->sdev;
> +
> +	sdev->trng_data = kzalloc(sdev->trng_data_sz, GFP_KERNEL);
> +	if (!sdev->trng_data) {
> +		sahara_send_reset(context);
> +		return;
> +	}
> +
> +	for (int i = 0; i < SAHARA_NUM_CMD_BUF; ++i) {
> +		context->cmd_buff[i] = devm_kzalloc(&context->mhi_dev->dev,
> +						    SAHARA_PACKET_MAX_SIZE,
> +						    GFP_KERNEL);

Don't use devm allocations at runtime. When is this freed? When is the
sahara device reclaimed?

> +		if (!context->cmd_buff[i]) {
> +			dev_err(&context->mhi_dev->dev,
> +				"Failed to allocate cmd_buff[%d]\n", i);
> +			sahara_send_reset(context);
> +			/*
> +			 * Mark unused entries as NULL to avoid accidental usage
> +			 */
> +			while (--i >= 0)
> +				context->cmd_buff[i] = NULL;
> +
> +			return;
> +		}
> +	}
> +}
> +
> +static void sahara_command_execute_resp(struct sahara_context *context)
> +{
> +	int ret;
> +	int client_command;
> +	int response_length;
> +	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
> +	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
> +
> +	dev_dbg(&context->mhi_dev->dev,
> +		"Command execute resp received. Length: %d resp_length: %d\n",
> +		le32_to_cpu(context->rx->length),
> +		le32_to_cpu(context->rx->command_execute_resp.response_length));
> +
> +	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
> +	    le32_to_cpu(context->rx->command_execute_resp.response_length < 0)) {
> +		dev_err(&context->mhi_dev->dev,
> +			"Malformed command execute resp packet - length %d\n",
> +			le32_to_cpu(context->rx->length));
> +
> +		return;
> +	}
> +
> +	client_command = le32_to_cpu(context->rx->command_execute_resp.client_command);
> +	response_length = le32_to_cpu(context->rx->command_execute_resp.response_length);
> +
> +	if (client_command == SAHARA_EXEC_CMD_GET_TRAINING_DATA) {
> +		sdev->trng_data_sz = response_length;
> +		sahara_data->ddr_attr.size = response_length;
> +		sdev->receiving_trng_data = true;
> +
> +		sahara_alloc_mem_training_data(context);

If either allocation in sahara_alloc_mem_training_data() fails you will
mhi_queue_buf NULL pointers below.

> +
> +		/* Queue multiple buffers for receiving data */
> +		u64 data_len = sdev->trng_data_sz;
> +		u64 pkt_data_len;
> +		int i;
> +
> +		for (i = 0; i < SAHARA_NUM_CMD_BUF && data_len; ++i) {
> +			pkt_data_len = min(data_len, SAHARA_PACKET_MAX_SIZE);
> +			ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
> +					    context->cmd_buff[i], pkt_data_len,
> +					    data_len <= pkt_data_len ? MHI_EOT : MHI_CHAIN);
> +
> +			if (ret) {
> +				dev_err(&context->mhi_dev->dev,
> +					"Unable to queue command buff %d\n", ret);
> +				return;
> +			}
> +
> +			data_len -= pkt_data_len;
> +		}
> +	}
> +
> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_DATA_CMD);
> +	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXEC_DATA_LENGTH);
> +	context->tx[0]->command_exec_data.client_command =
> +		cpu_to_le32(context->rx->command_execute_resp.client_command);
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
> +			    context->tx[0], SAHARA_COMMAND_EXEC_DATA_LENGTH, MHI_EOT);
> +
> +	if (ret)
> +		dev_err(&context->mhi_dev->dev,
> +			"Unable to send command exec get data command %d\n", ret);
> +}
> +
> +static void sahara_handle_training_data(struct sahara_context *context)
> +{
> +	u64 bytes_copied = context->bytes_copied;
> +	u64 bytes_to_copy;
> +	int i;
> +	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
> +	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
> +
> +	for (i = 0; i < SAHARA_NUM_CMD_BUF && bytes_copied < sdev->trng_data_sz; ++i) {
> +		bytes_to_copy = min_t(size_t, SAHARA_PACKET_MAX_SIZE,
> +				      sdev->trng_data_sz - bytes_copied);
> +
> +		/* Copy the received data into the training data buffer */
> +		memcpy(sdev->trng_data + bytes_copied, context->cmd_buff[i], bytes_to_copy);
> +
> +		bytes_copied += bytes_to_copy;
> +		context->bytes_copied = bytes_copied;
> +	}
> +
> +	if (bytes_copied == sdev->trng_data_sz) {
> +		/* Handle completion of data reception */
> +		sahara_switch_mode_to_img_tx(context);
> +		context->current_mode = SAHARA_MODE_FW_DOWNLOAD;
> +		sdev->receiving_trng_data = false;
> +	}
> +}
> +
> +static void sahara_command_processing(struct work_struct *work)
> +{
> +	struct sahara_context *context = container_of(work, struct sahara_context, cmd_work);
> +	int ret;
> +	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
> +	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
> +
> +	if (sdev->receiving_trng_data) {
> +		sahara_handle_training_data(context);
> +	} else {
> +		switch (le32_to_cpu(context->rx->cmd)) {
> +		case SAHARA_EXECUTE_RESP_CMD:
> +			sahara_command_execute_resp(context);
> +			break;
> +		case SAHARA_EXEC_CMD_GET_TRAINING_DATA:
> +			sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
> +			break;
> +		default:
> +			dev_err(&context->mhi_dev->dev,
> +				"Invalid client command 0x%x\n", le32_to_cpu(context->rx->cmd));
> +			break;
> +		}
> +	}
> +
> +	/* Requeue buffer for receiving next command */
> +	if (!sdev->receiving_trng_data) {
> +		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE, context->rx,
> +				    SAHARA_PACKET_MAX_SIZE, MHI_EOT);
> +		if (ret)
> +			dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
> +	}
> +}
> +
>  static void sahara_processing(struct work_struct *work)
>  {
>  	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
> @@ -906,6 +1099,7 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	context->mhi_dev = mhi_dev;
>  	INIT_WORK(&context->fw_work, sahara_processing);
>  	INIT_WORK(&context->dump_work, sahara_dump_processing);
> +	INIT_WORK(&context->cmd_work, sahara_command_processing);
>  
>  	/* Get the image table for a given device name */
>  	context->image_table = sahara_get_image_table(mhi_dev->mhi_cntrl->name);
> @@ -950,6 +1144,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>  
>  	cancel_work_sync(&context->fw_work);
>  	cancel_work_sync(&context->dump_work);
> +	cancel_work_sync(&context->cmd_work);
>  	vfree(context->mem_dump);
>  	sahara_release_image(context);
>  	mhi_unprepare_from_transfer(mhi_dev);
> @@ -971,6 +1166,8 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>  		context->rx_size = mhi_result->bytes_xferd;
>  		if (context->current_mode == SAHARA_MODE_MEM_DUMP)
>  			schedule_work(&context->dump_work);
> +		else if (context->current_mode == SAHARA_MODE_CMD)
> +			schedule_work(&context->cmd_work);

That means that you introduced the command mode work spread across three
(four?) different patches, but the only way to reason about the addition
is to read them all and think of them as one change.

Please try to slice it differently - rather than introducing some piece
of command mode and then another piece, which at each step is
incomplete. This patch indicates that you get the list of commands and
you can choose to call them or not. So why not implement the command
list send, receive and handling in one patch - without calling any
command. Then another patch that implements the DDR training command. 
Suddenly you have two (or more) patches that are coherent in themselves
- not scattered across multiple commits.

Regards,
Bjorn

>  		else
>  			schedule_work(&context->fw_work);
>  	}
> -- 
> 2.34.1
> 

