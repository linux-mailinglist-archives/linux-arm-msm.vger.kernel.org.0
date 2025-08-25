Return-Path: <linux-arm-msm+bounces-70782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3465AB34F17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 00:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2245C1A84EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6542BE644;
	Mon, 25 Aug 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrBpx7Es"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B802BE62B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756161424; cv=none; b=gCMPhsh8oJIgls79FU4LdC4G0419HSWNSKKtWg3HS/ppe46hDyKKa8rCVXTOV3DLXPvkTPtR+d4JMwy0WboQKS2i6mnXVmDgDWlfNMWLscQEOqq9bB4OlKYKMqwOpaatmvERvx2CQJjzGo0QIwwb9mxlUvujeR8aBh1hLx50vis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756161424; c=relaxed/simple;
	bh=51inI3eZvia41BReidXtbGEW3DV4KZfR7k+4D7uVVHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pihIM7KxdhDdQE6yl/EBnp/lPFxcC806/VOiwJNzE9svvJH3BsBdV7v20WYdWgSZspM4ZudJ+k7Qe0jMIGaRBEuFcjGFBFUCgxXMPhp4vTiIslxPEH49ZAGGxwvggX2uo4PzAlsu9PGOH7GFU2FP8OFyhCv8JNjvI0Vvpen1j3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrBpx7Es; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49064C4CEED;
	Mon, 25 Aug 2025 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756161422;
	bh=51inI3eZvia41BReidXtbGEW3DV4KZfR7k+4D7uVVHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrBpx7EswdbTxsyHBkitUJ+iDLK7HQhwBZH7N5lsOKmoFwanmrGSzSORj5GaYvw26
	 isEh0FqCYqS6MhdSygwFAA687D7nRHsLVrsYAk87JKyfFeYxGmA2+kkBurfZSnD8UU
	 39N84dU2DdtEaHS50T28XRMgEqxaZ/NBb22uIOwZQFc/vp0bf5PCjQ+slQWsynamYp
	 u07HF3bo8TpMmf1IGaITBl1c6/e5QKh5gIQE1pjab2SGue8muXcpxw0EePa2pPyrm0
	 qpggEZh76bNv7n4ETEc0sMZgdn0j8JlymswipZYsXo+UKawJ/2wLbeXZOmtlIDsR/8
	 LOfj6fOg13Dew==
Date: Mon, 25 Aug 2025 17:37:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 07/12] drivers: soc: qcom: Add sysfs support for DDR
 training data in Sahara.
Message-ID: <udlrclvrtmam3yfcof4mzwoyia54gbl7em7kabdfn5r42res5k@mbrild6mbahx>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-8-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-8-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:21PM +0530, Kishore Batta wrote:

No "drivers: " prefix in subject please.

> Add the Sahara training data structure and populate the DDR training data
> sysfs node.

Start with a problem description.

> During device boot, the device performs DDR training and sends
> the training data back to the host once complete.

"The device"? All devices, some devices?

> The host exposes this
> data to userspace via the sysfs interface.

I've read three sentences, you've given me breadcrumbs of what's going
on...but you're forcing me to guess how these three things fit together
and what you're trying to achieve...

> The "ddr_training_data" sysfs
> node will be present in the MHI controller node (e.g., mhi0, mhi1) along
> with other existing sysfs nodes at /sys/bus/mhi/devices/mhi*/.
> 
> When the host reboots, a userspace service is triggered via an udev rule to
> read the training data from the sysfs entry.

This describes one possible way to do that, but it's not the job of the
kernel to dictate how this is implemented. You should describe the
expected work to be performed by userspace, and you may suggest how
that could be implemented.

> The service then copies the
> valid training data to the image firmware filesystem.

This sentence doesn't make sense to a general Linux user, because
there's no separate "image firmware filesystem".

> This change includes
> the structures added for DDR training data and embeds them in the
> sahara_dev_driver_data structure. It also populates the sysfs attributes
> for DDR training data.

This half of the paragraph isn't directly related to the implementation
of the user space service, so better split it out in a paragraph of its
own.

> 
> Userspace service - https://github.com/qualcomm/csm-utils
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/sahara/sahara.c | 109 ++++++++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> index b07f6bd0e19f..df103473af3a 100644
> --- a/drivers/soc/qcom/sahara/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -60,6 +60,12 @@
>  #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>  #define SAHARA_MEM_READ64_LENGTH	0x18
>  
> +struct sahara_dev_trng_data {

trng - "True Random Number Generator"?

> +	void *trng_data;
> +	u64 trng_data_sz;
> +	bool receiving_trng_data;
> +};
> +
>  struct sahara_packet {
>  	__le32 cmd;
>  	__le32 length;
> @@ -177,6 +183,58 @@ struct sahara_context {
>  	bool				is_mem_dump_mode;
>  };
>  
> +struct sahara_dev_driver_data {
> +	struct bin_attribute ddr_attr;
> +	struct sahara_dev_trng_data *sdev;

"sdev" as an abbreviation for "sahara device training data"? I would
have guessed it related tot he "sahara device driver data"...

Why do you have two separate structs for these?

> +	struct sahara_context *context;
> +};
> +
> +/* Exposes DDR training data via sysfs binary attribute for user-space access */
> +static ssize_t ddr_training_read(struct file *filp, struct kobject *kobj,
> +				 const struct bin_attribute *attr, char *buf,
> +				 loff_t offset, size_t count)
> +{
> +	struct sahara_dev_driver_data *sahara_data;
> +	struct sahara_dev_trng_data *sdev;
> +	size_t data_size;
> +
> +	sahara_data = container_of(attr, struct sahara_dev_driver_data, ddr_attr);
> +
> +	if (!sahara_data)
> +		return -EIO;
> +
> +	sdev = sahara_data->sdev;
> +
> +	if (!sdev || !sdev->trng_data)

This isn't assigned anywhere...

> +		return -EIO;
> +
> +	data_size = attr->size;
> +
> +	if (data_size == 0)
> +		return 0;
> +
> +	if (offset >= data_size)
> +		return -EINVAL;
> +
> +	if (count > data_size - offset)
> +		count = data_size - offset;
> +
> +	/* Copy the training data into the buffer */
> +	memcpy(buf, (sdev->trng_data + offset), count);
> +
> +	/* Free memory after last read */
> +	if (offset + count >= data_size) {
> +		kfree(sdev->trng_data);
> +		sdev->trng_data = NULL;
> +		kfree(sdev);

Allowing the data to be read only one time and then failing subsequent
reads is going to be confusing to people. Imagine debugging this and
depending on how fast you can hexdump the attribute you either break the
userspace thing or you are unable to catch the data.

> +		sdev = NULL;
> +		kfree(sahara_data);

But you did device_create_bin_file() on &sahara_data->ddr_attr...what
happens now?

> +		sahara_data = NULL;
> +	}
> +
> +	return count;
> +}
> +
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	int ret;
> @@ -703,11 +761,42 @@ static void sahara_dump_processing(struct work_struct *work)
>  	sahara_send_reset(context);
>  }
>  
> +static int sahara_dev_populate_attribute(struct sahara_dev_driver_data *sahara_data)
> +{
> +	int ret;
> +	struct sahara_context *context = sahara_data->context;
> +
> +	/* DDR training data attribute */
> +	sahara_data->ddr_attr.attr.name = "ddr_training_data";
> +	sahara_data->ddr_attr.attr.mode = 0444;
> +	sahara_data->ddr_attr.read = ddr_training_read;
> +
> +	/* Size is populated during device bootup */

Where? In some other patch?

> +	sahara_data->ddr_attr.size = 0;
> +	sahara_data->ddr_attr.write = NULL;
> +
> +	/*
> +	 * Remove any existing sysfs binary attribute to avoid stale entries
> +	 * during warm boot or reinitialization. This ensures clean state before
> +	 * re-creating the attribute.

But why do you need to recreate it? What is the life cycle of this file
and how does it conflict with the life cycle of the sahara MHI device?

> +	 */
> +	device_remove_bin_file(&context->mhi_dev->mhi_cntrl->mhi_dev->dev,
> +			       &sahara_data->ddr_attr);
> +
> +	/* Create the binary attribute */
> +	ret = device_create_bin_file(&context->mhi_dev->mhi_cntrl->mhi_dev->dev,
> +				     &sahara_data->ddr_attr);
> +
> +	return ret;
> +}
> +
>  static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>  {
>  	struct sahara_context *context;
>  	int ret;
>  	int i;
> +	struct sahara_dev_driver_data *sahara_data;
> +	struct sahara_dev_trng_data *sdev;

This had a nice reverse xmas tree feel to it...perhaps you can keep
that?

>  
>  	context = devm_kzalloc(&mhi_dev->dev, sizeof(*context), GFP_KERNEL);
>  	if (!context)
> @@ -717,6 +806,17 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	if (!context->rx)
>  		return -ENOMEM;
>  
> +	sahara_data = kzalloc(sizeof(*sahara_data), GFP_KERNEL);

For the case where userspace doesn't read the DDR training data (e.g.
because the particular device doesn't implement/need that), where is
this freed?

> +	if (!sahara_data)
> +		return -ENOMEM;
> +
> +	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
> +	if (!sdev)
> +		return -ENOMEM;
> +
> +	sahara_data->context = context;
> +	sahara_data->sdev = sdev;
> +
>  	/*
>  	 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
>  	 * will request for READ_DATA. This is larger than
> @@ -749,7 +849,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  		return -EINVAL;
>  
>  	context->active_image_id = SAHARA_IMAGE_ID_NONE;
> -	dev_set_drvdata(&mhi_dev->dev, context);
> +	dev_set_drvdata(&mhi_dev->dev, sahara_data);

sahara_mhi_remove and sahara_mhi_dl_xfer_cb still assumes that drvdata
is of type struct sahara_context.

Regards,
Bjorn

> +
> +	ret = sahara_dev_populate_attribute(sahara_data);
> +	if (ret) {
> +		dev_err(&context->mhi_dev->dev,
> +			"Failed to populate bin attribute: %d\n", ret);
> +		return ret;
> +	}
>  
>  	ret = mhi_prepare_for_transfer(mhi_dev);
>  	if (ret)
> -- 
> 2.34.1
> 

