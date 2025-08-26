Return-Path: <linux-arm-msm+bounces-70790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB1B35177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 04:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31FCC2446BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 02:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F38561FCE;
	Tue, 26 Aug 2025 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIXfDb02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF798834
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756174618; cv=none; b=XCp//h+Sndv1o6Xu+8BxTWmtNohPBditKpJ7UdJwT2+H4LZ5e4aDJXW7bJDJCBZR+Uy0OB9TRRnKyw+1eGHO574Sfq66Vc+F1/8WbKtOtg8taMCPHTZRI8jAg1VB0p35VTkF2/IcglHhihif6/d/Q9hU8s43vC8KPFV2pRL1mfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756174618; c=relaxed/simple;
	bh=Wna5pjZP67vqIFy5LqzRhp/NNvPSkX65wbDxnzAaHps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUECmZbx4kr55+4j/jDzXs15Pea5lNvrFr2iQ96ZUWdCE6DltOQ6Wzf4TFXwJ7GTaJAhtTRcc2IXnUysA4DNJVqWuRS4opYQrS3aTe/YjLiCpdwPfx9eDtSGmE0VpoJ9q+STRuCAEAK71iWulJ0yip3uimfrBPtkpMNE0UUOshI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIXfDb02; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4260AC4CEED;
	Tue, 26 Aug 2025 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756174617;
	bh=Wna5pjZP67vqIFy5LqzRhp/NNvPSkX65wbDxnzAaHps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIXfDb023Q7YVMlqs2FK70BO1528yx6SflOkoyZ9oSQwEUCVPDRvJ4ptb3y+3C5Kl
	 Pq3/DuZ2HwbdzCB2OGI6lh1pzuIff5rrZieyPBbMmnXJpDybWAjJNtJOW/i4KgxiJe
	 9/rm3Tvo5lxQBg2N/o/qNsc9Gj5XKkO1rCt2R7eNdsCynNN7Vfv/GRIatguXpuwbQS
	 Sc8Lpjmd/lhkpaAcKfuhS1bixXdI24snsuTZZ6i1a0BzyEmS995JxCSlDNmCdvqyD8
	 2pxBWH/xxCJFL6GVxe84qaN3qCsSJ8zAEGLW6qFZo4niQmF1pJCVjPIp5Eas8MUVCX
	 B3jTpVbn2jVtQ==
Date: Mon, 25 Aug 2025 21:16:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 11/12] drivers: soc: qcom: Support to load saved DDR
 training data in Sahara.
Message-ID: <j5om75sck65rlh7bz62ojyvkqalvo4dv22kucqbwmvtgxk3lkf@xuylfq55ev67>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-12-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-12-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:25PM +0530, Kishore Batta wrote:
> Load the saved DDR training data during subsequent bootups. The image ID 34
> is for DDR training data image. During subsequent bootups, the Sahara
> driver needs to load the training data file associated with the serial
> number instead of the default file present in the image table. If the
> serial number-specific file is not present in the firmware directory,
> it indicates the first bootup of the device, and training data gets
> generated.

As with your other commit messages, you start by stating what the patch
does and they you add layer after layer with explanation on top of that.

Rewrite this one as well to clearly describe what problem the patch is
trying to solve, why the firmware loader is invoked here and what
expectations this has on user space.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/sahara/sahara.c | 71 +++++++++++++++++++++++++++-----
>  1 file changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> index 3887cdcfe256..28e52a9974a1 100644
> --- a/drivers/soc/qcom/sahara/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -68,6 +68,7 @@
>  #define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
>  #define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
>  #define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>  
>  struct sahara_dev_trng_data {
>  	void *trng_data;
> @@ -213,6 +214,8 @@ struct sahara_context {
>  	enum sahara_mode		current_mode;
>  	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
>  	u64				bytes_copied;
> +	u32				serial_num;
> +	char				*fw_folder_name;

Both of these are assigned and used solely within that one block below,
and they are 12 bytes. Can they not be put on the stack?

>  };
>  
>  struct sahara_dev_driver_data {
> @@ -270,6 +273,7 @@ static ssize_t ddr_training_read(struct file *filp, struct kobject *kobj,
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	int ret;
> +	char *fw_path;

Reverse xmas-tree please.

>  
>  	if (image_id == context->active_image_id)
>  		return 0;
> @@ -286,19 +290,64 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  	}
>  
>  	/*
> -	 * This image might be optional. The device may continue without it.
> -	 * Only the device knows. Suppress error messages that could suggest an
> -	 * a problem when we were actually able to continue.
> +	 * Image ID 34 corresponds to DDR training data. On subsequent
> +	 * bootups, the sahara driver may need to load the training data file
> +	 * associated with device's serial number instead of the default file
> +	 * listed in the image table.
> +	 *
> +	 * If the serial number specific file is not found in the firmware
> +	 * directory, it likely indicates the device is booting for the first
> +	 * time, and new training data will be generated.
>  	 */

This comment only relates to the first block below. How about moving it
into the block to make that clear - and to keep symmetry with the other
comment that you moved into the its block?

> -	ret = firmware_request_nowarn(&context->firmware,
> -				      context->image_table[image_id],
> -				      &context->mhi_dev->dev);
> -	if (ret) {
> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
> -			image_id, context->image_table[image_id], ret);
> -		return ret;
> -	}
> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID) {
> +		context->serial_num = context->mhi_dev->mhi_cntrl->serial_number;
> +		context->fw_folder_name =
> +			sahara_get_fw_folder_name(context->mhi_dev->mhi_cntrl->name);

Use a local variable for "name" to shorted the line, such that you don't
need to wrap it weirdly.

> +		if (!context->fw_folder_name)
> +			return -EINVAL;
> +
> +		fw_path = devm_kasprintf(&context->mhi_dev->dev, GFP_KERNEL,

fw_path is used for 3 lines, but you're keeping this allocation for an
undefined amount of time.

Regards,
Bjorn

> +					 "qcom/%s/mdmddr_0x%x.mbn",
> +					 context->fw_folder_name,
> +					 context->serial_num);
> +
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = firmware_request_nowarn(&context->firmware,
> +					      fw_path,
> +					      &context->mhi_dev->dev);
> +
> +		/*
> +		 * If there is failure to load serial number specific file, load
> +		 * the default file from image table
> +		 */
> +		if (ret) {
> +			ret = firmware_request_nowarn(&context->firmware,
> +						      context->image_table[image_id],
> +						      &context->mhi_dev->dev);
> +			if (ret) {
> +				dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
> +					image_id, context->image_table[image_id], ret);
> +			}
> +			return ret;
> +		}
> +	} else {
> +		/*
> +		 * This image might be optional. The device may continue without it.
> +		 * Only the device knows. Suppress error messages that could suggest an
> +		 * a problem when we were actually able to continue.
> +		 */
> +		ret = firmware_request_nowarn(&context->firmware,
> +					      context->image_table[image_id],
> +					      &context->mhi_dev->dev);
> +		if (ret) {
> +			dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
> +				image_id, context->image_table[image_id], ret);
>  
> +			return ret;
> +		}
> +	}
>  	context->active_image_id = image_id;
>  
>  	return 0;
> -- 
> 2.34.1
> 

