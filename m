Return-Path: <linux-arm-msm+bounces-70772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65648B34DFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 479931B25A66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7C2277C8D;
	Mon, 25 Aug 2025 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE0+4wKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDF284B4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157201; cv=none; b=Z34mGVwJzl2kgFgBfqARr8UPn1x9Oi26VIXy2cavWrNcOZfZuABl7ex/hL6xEy91J5i1e+5fRRDoxkoAQ5O7yyBTY+ZTBSrj3Ydi5WruRGDQ+gfFyAQFxpTkvQy05rvXaZQuSIZK4FH0+VTGcLRLEz6SYFlZupWHzDsfkyzek7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157201; c=relaxed/simple;
	bh=N9MDXl2L/guwRFArZHvmq1Bv8UMijrhBlBMVOZaJGY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfC52BBAh8XlQgn+Q3SkMtOCiOUf/ppFl1y2LIGz8ToJNxCedzkvss30RbaGNyhElvcbMegQJgfYP/Ov40gAVKyIcvZhOOghCeIlhslw2UQKMTfyCTQ/NiRBX8vcffd8gQLTe/FdljCzpf6mqO+cMR7SyQi+KMOAbKEO8sBI8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE0+4wKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CD9C4CEED;
	Mon, 25 Aug 2025 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756157200;
	bh=N9MDXl2L/guwRFArZHvmq1Bv8UMijrhBlBMVOZaJGY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE0+4wKs8pjyV3XjYJH9bd2atlqaD5yFT8/01SlcMH79scEByZajpm5WDeH3Wyx52
	 eqaKbnkIG84TNgew/Ygv48exEKJa9Vt+5AixSjl5wmLip0vaDmVNlXpiXXwtPFHpyH
	 6o2O/OYyGLSnSzee4CpyAs0Y5jVhkn7mvbqo3HS5HSydVnEZo5Huj0xM3Gq0aleDj3
	 9IGiik16m08KRGmqTpBjF9QgXSlmRCUihIkjdtKAE2MmvQiYw+qB7dZ0wL0jnaoWMx
	 HnMVSp/FnVAywqrDmaaOzeQx1dnD+0pYEGx7PPN1xgGfcwYK7Qmn36FWAUD8fxGaFJ
	 niqjFstyESFxQ==
Date: Mon, 25 Aug 2025 16:26:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 03/12] drivers: accel: qaic: Support for registration
 of image tables in Sahara.
Message-ID: <acifjjzchr22da33pmriawuasn4hf2rqm5gborontjnxzcbiyq@skz2mqcq6i2p>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-4-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-4-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:17PM +0530, Kishore Batta wrote:

Just noticed that your recipients list doesn't match get_maintainers.
Please adopt b4 and let it choose recipients for you.

And same subject prefix issues as all the patches.

> Support the registration of image tables in the Sahara driver. Each
> Qualcomm device can define its own image table, and client drivers can
> register their image tables with the Sahara protocol. The Sahara protocol
> driver now exposes the necessary APIs to facilitate image table
> registration and de-registration. These image tables are used by Sahara
> to transfer images from the host filesystem to the device.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/Makefile                 |   3 +-
>  drivers/accel/qaic/sahara_image_table.c     | 173 ++++++++++++++++++++
>  drivers/accel/qaic/sahara_image_table_ops.h | 102 ++++++++++++
>  3 files changed, 277 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/accel/qaic/sahara_image_table.c
>  create mode 100644 drivers/accel/qaic/sahara_image_table_ops.h
> 
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> index 1106b876f737..586a6877e568 100644
> --- a/drivers/accel/qaic/Makefile
> +++ b/drivers/accel/qaic/Makefile
> @@ -12,6 +12,7 @@ qaic-y := \
>  	qaic_drv.o \
>  	qaic_ras.o \
>  	qaic_timesync.o \
> -	sahara.o
> +	sahara.o \
> +	sahara_image_table.o
>  
>  qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
> diff --git a/drivers/accel/qaic/sahara_image_table.c b/drivers/accel/qaic/sahara_image_table.c
> new file mode 100644
> index 000000000000..dd0793a33727
> --- /dev/null
> +++ b/drivers/accel/qaic/sahara_image_table.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +#include "sahara_image_table_ops.h"
> +
> +struct sahara_image_table_context {
> +	struct list_head provider_list;
> +	/* Protects access to provider_list and related operations */
> +	struct mutex provider_mutex;
> +};

Drop this struct and turn the two members global variables.

> +
> +static struct sahara_image_table_context sahara_img_ctx = {
> +	.provider_list = LIST_HEAD_INIT(sahara_img_ctx.provider_list),
> +	.provider_mutex = __MUTEX_INITIALIZER(sahara_img_ctx.provider_mutex),
> +};
> +
> +/**
> + * sahara_register_image_table_provider - Register an image table provider.

https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
says you should put () after the function name.

> + * @provider: Pointer to the sahara_image_table_provider structure to be
> + *		registered.
> + *
> + * This function validates the provided sahara_image_table_provider structure
> + * and adds it to the global list of image table providers.

What is the key thing this function does? It validates the
image_table_provider! And then second to that it might add it to some
list...

> The list is
> + * protected by a mutex to ensure thread-safe operations.

https://docs.kernel.org/doc-guide/kernel-doc.html#function-context

> + *
> + * Return: 0 on success, -EINVAL if the provider or its required fields are
> + *		invalid.
> + */
> +int sahara_register_image_table_provider(struct sahara_image_table_provider
> +					  *provider)
> +{
> +	/* Validate the provider and its required fields */
> +	if (!provider || !provider->image_table || !provider->dev_name)
> +		return -EINVAL;
> +
> +	/* Acquire the mutex before modifying the list */

If that isn't obvious from the line mutex_lock(something) consider
giving the lock a better name.

It's obvious what this sequence does

lock()
modify(list)
unlock()

Document things that aren't obvious.


> +	mutex_lock(&sahara_img_ctx.provider_mutex);
> +
> +	/* Add the provider to the list */
> +	list_add(&provider->list, &sahara_img_ctx.provider_list);
> +
> +	/* Release the mutex after modification */
> +	mutex_unlock(&sahara_img_ctx.provider_mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * sahara_get_image_table - Get the image table for a given device name
> + * @dev_name: The name of the device for which the image table is requested.
> + *
> + * This function iterates through the list of registered image table providers
> + * and returns the image table for the provider matching the given device name.
> + *
> + * Return: A pointer to the image table if found, or NULL if no matching
> + *		provider is found.
> + */
> +const char * const *sahara_get_image_table(const char *dev_name)
> +{
> +	struct sahara_image_table_provider *provider;
> +
> +	/* Validate the device name */
> +	if (!dev_name) {
> +		pr_debug("sahara: Invalid argument %s\n", dev_name);
> +		return NULL;
> +	}

This is overly defensive. You're writing the only code that should ever
call this function, just make sure you don't explicitly pass NULL when
you do...

> +
> +	/* Iterate through the list to find the matching provider */
> +	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
> +		if (strcmp(provider->dev_name, dev_name) == 0)
> +			return provider->image_table;
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * sahara_get_image_table_size - Get the size of the image table for a given
> + *				device name.
> + * @dev_name: The name of the device for which the image table size is requested
> + *
> + * This function iterates through the list of registered image table providers
> + * and returns the size of the image table for the provider matching the given
> + * device name.
> + *
> + * Return: The size of the image table if found, or 0 if no matching provider
> + *         is found or if the device name is invalid.
> + */
> +size_t sahara_get_image_table_size(const char *dev_name)

You don't need two identical functions for getting the table and its
size, just add a "size_t *size" parameter to sahara_get_image_table()
and return both values in one - saves you 29 lines of ~copy-pasta.

> +{
> +	struct sahara_image_table_provider *provider;
> +
> +	/* Validate the dev name */
> +	if (!dev_name) {
> +		pr_debug("sahara: Invalid argument %s\n", dev_name);
> +		return 0;
> +	}
> +
> +	/* Iterate through the list to find the matching provider */
> +	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
> +		if (strcmp(provider->dev_name, dev_name) == 0)
> +			return provider->image_table_size;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * sahara_unregister_image_table_provider - Unregister an image table provider.
> + * @provider: Pointer to the sahara_image_table_provider structure to be
> + *		unregistered
> + *
> + * This function validates the provided sahara_image_table_provider structure
> + * and removes it from the global list of image table providers. The list is
> + * protected by a mutex to ensure thread-safe operations.
> + *
> + * Return: 0 on success, -EINVAL if the provider is invalid.
> + */
> +int sahara_unregister_image_table_provider(struct sahara_image_table_provider
> +						*provider)

unregister functions typically return void, because there isn't much
useful one can do if it fails.

> +{
> +	/* Validate the provider */
> +	if (!provider)
> +		return -EINVAL;

This doesn't really check that the point is valid, just that it's not
NULL. And per the intended usage, that can never happen. So I'd suggest
dropping this check.

> +
> +	/* Acquire the mutex before modifying the list */
> +	mutex_lock(&sahara_img_ctx.provider_mutex);
> +
> +	/* Remove the provider from the list */
> +	list_del(&provider->list);
> +
> +	/* Release the mutex after modification */
> +	mutex_unlock(&sahara_img_ctx.provider_mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
> + *				device
> + * @dev_name: Name of the device for which the firmware folder name is requested
> + *
> + * This function searches through the list of Sahara image table providers to
> + * find the provider matching the given device name. If a matching provider is
> + * found, the firmware folder name associated with that provider is returned.
> + * If the device name is invalid or no matching provider is found, the function
> + * returns NULL.
> + *
> + * Return: Firmware folder name if found, otherwise NULL.
> + */
> +char *sahara_get_fw_folder_name(const char *dev_name)
> +{
> +	struct sahara_image_table_provider *provider;
> +
> +	/* Validate the device name */
> +	if (!dev_name) {
> +		pr_debug("sahara: Invalid argument %s\n", dev_name);
> +		return NULL;
> +	}
> +
> +	/* Iterate through the list to find the matching provider */
> +	list_for_each_entry(provider, &sahara_img_ctx.provider_list, list) {
> +		if (strcmp(provider->dev_name, dev_name) == 0)
> +			return provider->fw_folder_name;
> +	}
> +
> +	return NULL;
> +}
> diff --git a/drivers/accel/qaic/sahara_image_table_ops.h b/drivers/accel/qaic/sahara_image_table_ops.h
> new file mode 100644
> index 000000000000..f8496bd1aa35
> --- /dev/null
> +++ b/drivers/accel/qaic/sahara_image_table_ops.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +
> +#ifndef __SAHARA_IMAGE_TABLE_OPS_H__
> +#define __SAHARA_IMAGE_TABLE_OPS_H__
> +
> +#include <linux/list.h>
> +
> +/**
> + * struct sahara_image_table_provider - Structure representing an image table
> + *					provider.
> + * @image_table: Pointer to the image table
> + * @image_table_size: Size of the image table
> + * @dev_name: Device name to identify the provider
> + * @fw_folder_name: Name of the folder where the image binaries exist.
> + * @list: List head for linking providers in a list
> + *
> + * This structure is used to represent an image table provider in the Sahara
> + * driver. It contains a pointer to the image table, the size of the image
> + * table, the device name for identifying the provider, and a list head for
> + * linking providers in a linked list.
> + */
> +struct sahara_image_table_provider {
> +	const char * const *image_table;
> +	size_t image_table_size;
> +	const char *dev_name;
> +	char *fw_folder_name;
> +	struct list_head list;
> +};
> +
> +/**
> + * sahara_register_image_table_provider - Register an image table provider.

You already provide kernel-doc in the implementation, no need to
duplicate it also in the header file.

Regards,
Bjorn

> + * @provider: Pointer to the sahara_image_table_provider structure to be
> + *            registered.
> + *
> + * This function validates the provided sahara_image_table_provider structure
> + * and adds it to the global list of image table providers. The list is
> + * protected by a mutex to ensure thread-safe operations.
> + *
> + * Return: 0 on success, -EINVAL if the provider or its required fields are
> + *         invalid.
> + */
> +int sahara_register_image_table_provider(struct sahara_image_table_provider
> +					  *provider);
> +
> +/**
> + * sahara_get_image_table - Get the image table for a given device name
> + * @dev_name: The name of the device for which the image table is requested.
> + *
> + * This function iterates through the list of registered image table providers
> + * and returns the image table for the provider matching the given device name.
> + *
> + * Return: A pointer to the image table if found, or NULL if no matching
> + *         provider is found.
> + */
> +const char * const *sahara_get_image_table(const char *dev_name);
> +
> +/**
> + * sahara_get_image_table_size - Get the size of the image table for a given
> + *                               device name.
> + * @dev_name: The name of the device for which the image table size is requested
> + *
> + * This function iterates through the list of registered image table providers
> + * and returns the size of the image table for the provider matching the given
> + * device name.
> + *
> + * Return: The size of the image table if found, or 0 if no matching provider
> + *         is found or if the device name is invalid.
> + */
> +size_t sahara_get_image_table_size(const char *dev_name);
> +
> +/**
> + * sahara_unregister_image_table_provider - Unregister an image table provider.
> + * @provider: Pointer to the sahara_image_table_provider structure to be
> + *            unregistered
> + *
> + * This function validates the provided sahara_image_table_provider structure
> + * and removes it from the global list of image table providers. The list is
> + * protected by a mutex to ensure thread-safe operations.
> + *
> + * Return: 0 on success, -EINVAL if the provider is invalid.
> + */
> +int sahara_unregister_image_table_provider(struct sahara_image_table_provider
> +						*provider);
> +
> +/**
> + * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
> + *                             device
> + * @dev_name: Name of the device for which the firmware folder name is requested
> + *
> + * This function searches through the list of Sahara image table providers to
> + * find the provider matching the given device name. If a matching provider is
> + * found, the firmware folder name associated with that provider is returned.
> + * If the device name is invalid or no matching provider is found, the function
> + * returns NULL.
> + *
> + * Return: Firmware folder name if found, otherwise NULL.
> + */
> +char *sahara_get_fw_folder_name(const char *dev_name);
> +
> +#endif // __SAHARA_IMAGE_TABLE_OPS_H__
> -- 
> 2.34.1
> 

