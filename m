Return-Path: <linux-arm-msm+bounces-44121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D336FA03D42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ADB9165430
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706E41E102A;
	Tue,  7 Jan 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mz5fu/Vm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEF51E0DBA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248007; cv=none; b=TOyAMDiGgd2MWSECwhZwU2+mUhUgZLLqtRMIDX4N09cP8ixmr8GrI4BDMEgaSDIRjpiqmWvy4HEc7+MwVIOzNp/6N/bme40J/XrPSgN4eHgBS0cy8dbVkHkuD8cm/v3zO0Bsqr9dxR2fs46NF7zlR8dkqUy5XqEsA/BmDQRHXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248007; c=relaxed/simple;
	bh=wJSaWoFDYchpojRM0kpL/yBmnF5ud/8yWzzE4yjcMsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqmpz6q6CGq9GzvW/y9nAj2nmfLq+tT6u6+JUESj1/fTc3SBmLPEA+sl366sSktzzTnwAaey9dhJhwKpHBSeQht4Fd3jTmde8HxtjNwEQDIMzpbadSsf7nIUUBPXoyfXdbVeDPuBBBD0NwPCIwLPOFpqLRpxi66kM3HqVFGVOJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mz5fu/Vm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736248004; x=1767784004;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wJSaWoFDYchpojRM0kpL/yBmnF5ud/8yWzzE4yjcMsw=;
  b=mz5fu/VmtIDRuPRcdT1uk6TXJr5V7HReqRlt+Dt1O6JMQB6SvKaDAgOG
   rHlv8uMPCnJEtBHhMx8IbTbv2UatKtREzJgSGXivHRkRrsyk0nUdMvPNA
   gtjAGlmhX+keBMscfQm82v0gLMyEFf7AQK52qw601BGrydOV215zKT6wL
   C7Efifnl7auhgqcUUuzN7NiI56gndQTWm3MCtoDuvTZQkk8YlZBrODQ6C
   L/fmaqPSv5bwU0pXOm9aBo9TSdzFAzAN38QDq84uL0scHNaSqToxv45Tx
   Jk/LzNntAKPCJ8UAkhU1+7ZmMBI5xCZAxt7BPLqGIaI3mz3OiBFX1rW+B
   A==;
X-CSE-ConnectionGUID: h6w2OigtQqSBEUvMPgE35A==
X-CSE-MsgGUID: QoyDziS2Txy+hD16+WK2zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47782032"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47782032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:06:44 -0800
X-CSE-ConnectionGUID: JDwiL8OhRDuC1Tt5Bm5USA==
X-CSE-MsgGUID: yakZGx+6T6acA/Ih+AgFZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102633597"
Received: from derekcam-mobl.ger.corp.intel.com (HELO [10.245.83.121]) ([10.245.83.121])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:06:41 -0800
Message-ID: <05386aca-5100-475b-b462-ec1942a580f7@linux.intel.com>
Date: Tue, 7 Jan 2025 12:06:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 manivannan.sadhasivam@linaro.org, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-2-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241213213340.2551697-2-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/13/2024 10:33 PM, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Refactor the firmware loading code to have distinct helper functions for
> BHI and BHIe operations. This lays the foundation for separating the
> firmware loading protocol from the firmware being loaded and the EE it
> is loaded in.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c | 155 +++++++++++++++++++++++++-----------
>  1 file changed, 110 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e8c92972f9df..e3f3c07166ad 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -177,6 +177,37 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
>  }
>  EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
>  
> +static inline void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	int ret;
> +	u32 val;
> +	int i;
> +	struct {
> +		char *name;
> +		u32 offset;
> +	} error_reg[] = {
> +		{ "ERROR_CODE", BHI_ERRCODE },
> +		{ "ERROR_DBG1", BHI_ERRDBG1 },
> +		{ "ERROR_DBG2", BHI_ERRDBG2 },
> +		{ "ERROR_DBG3", BHI_ERRDBG3 },
> +		{ NULL },
> +	};
> +
> +	read_lock_bh(pm_lock);
> +	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> +		for (i = 0; error_reg[i].name; i++) {
> +			ret = mhi_read_reg(mhi_cntrl, base, error_reg[i].offset, &val);
> +			if (ret)
> +				break;
> +			dev_err(dev, "Reg: %s value: 0x%x\n", error_reg[i].name, val);
> +		}
> +	}
> +	read_unlock_bh(pm_lock);
> +}
> +
>  static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
>  			    const struct mhi_buf *mhi_buf)
>  {
> @@ -226,24 +257,13 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
>  }
>  
>  static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
> -			   dma_addr_t dma_addr,
> -			   size_t size)
> +			    const struct mhi_buf *mhi_buf)
>  {
> -	u32 tx_status, val, session_id;
> -	int i, ret;
> -	void __iomem *base = mhi_cntrl->bhi;
> -	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	struct {
> -		char *name;
> -		u32 offset;
> -	} error_reg[] = {
> -		{ "ERROR_CODE", BHI_ERRCODE },
> -		{ "ERROR_DBG1", BHI_ERRDBG1 },
> -		{ "ERROR_DBG2", BHI_ERRDBG2 },
> -		{ "ERROR_DBG3", BHI_ERRDBG3 },
> -		{ NULL },
> -	};
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	u32 tx_status, session_id;
> +	int ret;
>  
>  	read_lock_bh(pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> @@ -255,11 +275,9 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>  	dev_dbg(dev, "Starting image download via BHI. Session ID: %u\n",
>  		session_id);
>  	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
> -	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
> -		      upper_32_bits(dma_addr));
> -	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
> -		      lower_32_bits(dma_addr));
> -	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH, upper_32_bits(mhi_buf->dma_addr));
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW, lower_32_bits(mhi_buf->dma_addr));
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, mhi_buf->len);
>  	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>  	read_unlock_bh(pm_lock);
>  
> @@ -274,18 +292,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>  
>  	if (tx_status == BHI_STATUS_ERROR) {
>  		dev_err(dev, "Image transfer failed\n");
> -		read_lock_bh(pm_lock);
> -		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> -			for (i = 0; error_reg[i].name; i++) {
> -				ret = mhi_read_reg(mhi_cntrl, base,
> -						   error_reg[i].offset, &val);
> -				if (ret)
> -					break;
> -				dev_err(dev, "Reg: %s value: 0x%x\n",
> -					error_reg[i].name, val);
> -			}
> -		}
> -		read_unlock_bh(pm_lock);
> +		mhi_fw_load_error_dump(mhi_cntrl);
>  		goto invalid_pm_state;
>  	}
>  
> @@ -296,6 +303,16 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>  	return -EIO;
>  }
>  
> +static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info *image_info)
> +{
> +	struct mhi_buf *mhi_buf = image_info->mhi_buf;
> +
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len, mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(image_info->mhi_buf);
> +	kfree(image_info);
> +}
> +
>  void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  			 struct image_info *image_info)
>  {
> @@ -310,6 +327,47 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  	kfree(image_info);
>  }
>  
> +static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info **image_info,
> +				size_t alloc_size)
> +{
> +	struct image_info *img_info;
> +	struct mhi_buf *mhi_buf;
> +	int segments = 1;Are you planning for variable segment count in future?

> +	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
> +	if (!img_info)
> +		return -ENOMEM;
> +
> +	/* Allocate memory for entry */
> +	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
> +				    GFP_KERNEL);
> +	if (!img_info->mhi_buf)
> +		goto error_alloc_mhi_buf;
> +
> +	/* Allocate and populate vector table */
> +	mhi_buf = img_info->mhi_buf;
> +
> +	mhi_buf->len = alloc_size;
> +	mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> +					  &mhi_buf->dma_addr, GFP_KERNEL);
> +	if (!mhi_buf->buf)
> +		goto error_alloc_segment;
> +
> +	img_info->bhi_vec = NULL;
> +	img_info->entries = segments;
> +	*image_info = img_info;
> +
> +	return 0;
> +
> +error_alloc_segment:
> +	kfree(mhi_buf);
> +error_alloc_mhi_buf:
> +	kfree(img_info);
> +
> +	return -ENOMEM;
> +}
> +
>  int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  			 struct image_info **image_info,
>  			 size_t alloc_size)
> @@ -364,9 +422,18 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	return -ENOMEM;
>  }
>  
> -static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const u8 *buf, size_t remainder,
> -			      struct image_info *img_info)
> +static void mhi_firmware_copy_bhi(struct mhi_controller *mhi_cntrl,
> +				  const u8 *buf, size_t size,
> +				  struct image_info *img_info)
> +{
> +	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> +
> +	memcpy(mhi_buf->buf, buf, size);
> +}
I'm not sure this function improves readablity.

> +static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
> +				   const u8 *buf, size_t remainder,
> +				   struct image_info *img_info)
>  {
>  	size_t to_cpy;
>  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> @@ -390,10 +457,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	enum mhi_pm_state new_state;
> +	struct image_info *image;
>  	const char *fw_name;
>  	const u8 *fw_data;
> -	void *buf;
> -	dma_addr_t dma_addr;
>  	size_t size, fw_sz;
>  	int ret;
>  
> @@ -452,17 +518,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
> -				 GFP_KERNEL);
> -	if (!buf) {
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret) {
>  		release_firmware(firmware);
>  		goto error_fw_load;
>  	}
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
>  
>  	/* Download image using BHI */
> -	memcpy(buf, fw_data, size);
> -	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
> +	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
>  
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
> @@ -493,7 +558,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  		}
>  
>  		/* Load the firmware into BHIE vec table */
> -		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
> +		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
>  	}
>  
>  	release_firmware(firmware);

Regards,
Jacek

