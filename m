Return-Path: <linux-arm-msm+bounces-45642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4DA176B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 05:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F0C1889A3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 04:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245AD185955;
	Tue, 21 Jan 2025 04:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vySFzxyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368472CAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737435142; cv=none; b=F6vwnJ5gC21iaNT7ZjoddJV2FpdZCQrcGel8iQmOwAuNXIjEFv07Dr372qcygFcCUSMkl5+9q2nISFubSe4gdl51MPqTTcy7i9c3gvPIFMBu/9IVwvlDYR/TnKmmQBhfPCODEntKmGD+Y8tZgYagRjI2zFhOqeoVrk/qyXYCHj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737435142; c=relaxed/simple;
	bh=ry0jEP5XbmTbIN3yEdWYp/5XjVkVhLO1m5rN8v7tdZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+hmtWrhI5lt1iqk4p1oPIx2wA5QcLTUB+y5U0BFcHAtFkW7B4yHTW7CMstCEeAQr/fYWPbe2cpNRJEPDNjW/HMFbyv6+uI3gbr4K+sZhma6xmUQWnoRPD1E2vv22zDJTx/ITr5N/2Iwtxr05Xk+h51pVHvYUIxCgI4nTuCz29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vySFzxyN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so8916089a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 20:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737435139; x=1738039939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tyLr89Oro7K4WmxXil5fUnVrn0buPsx3daOJhuEBhU=;
        b=vySFzxyNIsds8HZ4JieSW94zD7jfbfzXavpWedcNgEJR1zRVU9u5OytG8PuUhYae8B
         S9zhioGvwd1pRlece9j+BGTjspJOAn1aXqRiSAPDVVADOaVSNlZZiLdwPoO3Md0kAFhL
         f+nUPbBZiLNZ7OXjll8ZTgZ1nJjtKBYUUQqKFjBWlO5k6cctuCDKLJNTfnWbH0YkKnuU
         hunneqYjkxgiNHGY9xofXCRD5UOy3EPBEz8TcSvxdw2VyxlKS6rnAaVMypg7DZs5khKy
         6LpkdAO5+aOEHdPDN91bvET4R6rjcGnJFDyOhH0O6Beug3GCD4KuFrGqJdYdqgBB9Won
         DnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737435139; x=1738039939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tyLr89Oro7K4WmxXil5fUnVrn0buPsx3daOJhuEBhU=;
        b=RYbOSWfCeEAO6Q03+iHInhun25KebaQYUh9U3VvYEIZxCYZ0/OWgdvZBdSC+dZ1qGb
         nETT54x16s3kAY9RduhW13QfEQZxZVU2HMrVsSlVp2mXAtPx07oUk1oFqTCdOeUCGdLR
         6sXLtiPBsrZGN6wa6am2ZBE/gJWYlrsVA8ZQYEedRqFr+/xuEsOnj0gvtE1OVMJkBS78
         z4J22yp0l5ssGKv6o0QhXctheYIg7KXcokSjzUtQt/54Lw9cDmloAVbmVyatNLZC2YFW
         rKHJJUikaTSIDkQQWV+/bvPpIt5o77inriK1t6Wqy7WRtCYqjxUPKqeTbRQ8m4xHEIux
         Nrpg==
X-Forwarded-Encrypted: i=1; AJvYcCUbjAjILBlw1drsVEiCHG9yunNVmZMXXJD/jwIPpUCL6/9CcTE7WrFFUe1CSYkJre5rVkVX9Krxaj3PzUWu@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpyNR1C9N8u1nhdalfeJQQ4+/xnK6XFz6rgkfmnbed6NHsa9J
	Wmcvblm3nbUMfUSi9SjnFMkVwZEZyLoFNxcr30+vCnrY4sQslMLfDl1Y53cuZg==
X-Gm-Gg: ASbGnctb1oSK/AhXaKOAVmPF/5th0T1LsJbzvN/Dji+i2w0hgUCs0rbGaCWoKTm34S3
	RjGFLCYhoUYVoKfopFuy2DgsMMs30Lx+XCRRmxOibxme+BTrLPSYuLON2egf+c698O58uUj6ziq
	J5rRHQOWukD+VO3A5FSZ+mm9mmaK6FjyH4nskBzYTiXFWwjoI6QjlWbJLqx4QAn5o8i43encyw3
	SHhiY+YZqLjFIOBPYCN6DW5JBc5DmRUhFFfZsiEtGJ03s+SBigd6V0cnCq1rujYNVSHjWesyIZW
	8JL+b2k=
X-Google-Smtp-Source: AGHT+IFSWF/3fxqQyQ4PQAR3oXpx/J8EguJMfXK4TSYqPEZ0xRHtpPEOOVb2sMjou628AnuBYq4BxA==
X-Received: by 2002:a05:6a00:3c8a:b0:727:3c37:d5fb with SMTP id d2e1a72fcca58-72dafb6fef4mr22643451b3a.16.1737435139390;
        Mon, 20 Jan 2025 20:52:19 -0800 (PST)
Received: from thinkpad ([117.213.102.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabacdbd5sm8099841b3a.180.2025.01.20.20.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 20:52:18 -0800 (PST)
Date: Tue, 21 Jan 2025 10:22:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
Message-ID: <20250121045212.jo5fi37n44lqab7u@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-2-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-2-quic_jhugo@quicinc.com>

On Fri, Jan 17, 2025 at 10:09:37AM -0700, Jeffrey Hugo wrote:
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 144 +++++++++++++++++++++++++-----------
>  1 file changed, 99 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e8c92972f9df..9fe13d3f09f0 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -177,6 +177,36 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
>  }
>  EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
>  
> +static void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	int ret, i;
> +	u32 val;
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
> @@ -226,24 +256,13 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
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
> @@ -255,11 +274,9 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
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
> @@ -274,18 +291,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
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
> @@ -296,6 +302,16 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
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
> @@ -310,6 +326,45 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  	kfree(image_info);
>  }
>  
> +static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info **image_info,
> +				size_t alloc_size)
> +{
> +	struct image_info *img_info;
> +	struct mhi_buf *mhi_buf;
> +
> +	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
> +	if (!img_info)
> +		return -ENOMEM;
> +
> +	/* Allocate memory for entry */
> +	img_info->mhi_buf = kzalloc(sizeof(*img_info->mhi_buf), GFP_KERNEL);
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
> +	img_info->entries = 1;
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
> @@ -364,9 +419,9 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	return -ENOMEM;
>  }
>  
> -static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const u8 *buf, size_t remainder,
> -			      struct image_info *img_info)
> +static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
> +				   const u8 *buf, size_t remainder,
> +				   struct image_info *img_info)
>  {
>  	size_t to_cpy;
>  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> @@ -390,10 +445,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> @@ -452,17 +506,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> +	/* Load the firmware into BHI vec table */
> +	memcpy(image->mhi_buf->buf, fw_data, size);
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
> @@ -493,7 +547,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  		}
>  
>  		/* Load the firmware into BHIE vec table */
> -		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
> +		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
>  	}
>  
>  	release_firmware(firmware);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

