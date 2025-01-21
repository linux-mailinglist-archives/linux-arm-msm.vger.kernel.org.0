Return-Path: <linux-arm-msm+bounces-45643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 045EDA176B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 05:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C95F47A3D73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 04:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E48C185955;
	Tue, 21 Jan 2025 04:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="np3RHs+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9003D68
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737435289; cv=none; b=eyWNvpgnl5tYPAb62fEspkE/xhgIwEqUIt2r8iBNcbg1YsaHH+xWR8E191H6yKPmILe5gCUV6DkHnZ8SgXqYZME4mzhe5fbf6c801qbODPvPdu8zCWaWpK6+FAbWpTwhxDV0OyhZGFy4V89g83jHHZcHe9XABXs1Q6B11ZhL8cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737435289; c=relaxed/simple;
	bh=i/j0XrlJS7AjxwkZeapMDHhobTyZyFBbKWaqT2kyjM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekAxn2DAxI/Z5BHoxpO+tTxtcZ99GEt2DRHyVpOIKjSfyxs28eOWy7mrMoRmsOE3PurMHRrT6qzf/ptijqBBr4YafWpZzBTxSk3fpI4T4S7RB75b/V2uySvLQuVnqJvrOELO/v5k0g2Y3mZYAuyEadLSeuu7fAdZxT+2xBeGvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=np3RHs+q; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so8918343a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 20:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737435287; x=1738040087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VBH9834RN47Bq9S9SwBP5IhyNvK6QPWQqQCpbU4OxwM=;
        b=np3RHs+q8GH69mCW1Vk5/dz9ukRL9dgHPYdO+COO+O4Yvz1QpMfFdV7775jXsvro2o
         I3kAxuJnAxf3znl/Di9Sstsp7YqRGz/APzZKWw9qiwKKHQmfIneZNVjEyFG/BVsKTvBB
         BzNv3PeQM/Z5bSzB860rJhD/cHQPPUcPG67tw09JKb3FAwuE49zMWaa3To3fMNZSeDFY
         rHwgFCK/W0bAf26Ujc8VOsdLakSJtxPnIakE0e8bghuYyIMgreFKuy/EK8pc6CBedKU0
         Ug4OIkII2oj74eXOWwybG6nO6g5vKx645NPwc8QkqBrjWWXzbRIWekpmEGE2yYS0pkfy
         4Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737435287; x=1738040087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBH9834RN47Bq9S9SwBP5IhyNvK6QPWQqQCpbU4OxwM=;
        b=R7v9wzp5R2fs/Oya/HgQGmSUcbY+8A1gA+X+uN1KW4mjQvaME/aMwaSTPEhCL1xzXP
         OZa5s+raDbL9r+erS6UaVu5Z2y0q9f07a4uXnZjlGVho8YWafQ+GJYM9YcaWx0njcRI+
         f0hbltrHS2VCjySaYkCoc49EvWhxKqXcVwx7c4Fe98lWgI2IfDGUMHAxVK2HdbhZ6Po+
         paXTNobL2bQfvawzpH48XeFwrjwQDfV08bfs79kBrlwkDvbvg/3LJFjacyCgmYVPbDUY
         KtTK5ue/IZssw8yTCAg85CZds4S7/Os6Hvc4nkjXAaLthtPpeW7QKIDsolQdZalhEjRQ
         1NxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHEGosAlS/RvVuCg/ooL7o8Od06lXWjTBpIqLiSpCO3JS3O6s/4jF1b//Qeazl4xmr6sDTOqzDcTWjkdsN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy79fZMEwV+jUd22gnXoRb23vq36fJWgRXa+RNCytWKTDt9tBd4
	DtHbz0hd7LmgaxCFKy5kE6t+IheHoDdRPfcpe68AR3xcEC9GHfZmxQfCUqPXHA==
X-Gm-Gg: ASbGncts4mDxAoAPewwlo+plCvVrdaV86VvL6WZDwlRqWr/N/cOVx3Qk8v65YPc4Pi0
	TjVIlxM66sflw+nEfDQSHv/u4ZfeBWDn+4aI3s1en7h08O15QBNaAqrOTROO6juXvLdMxkfIhdl
	iM84M9Nb4vAMdfhTfLC3u4o4oaVPO46edxn2MerW4g7RINSqbP6L1dNOXR0fxesZwLLLDnc2bDE
	MSN+1VMKIu42yNqh52voqueM11Z2doR423z5tFgFe6kRjOfsXdRqRLaDvCEXlIpCAJsA2/zwlRs
	SMP59Sk=
X-Google-Smtp-Source: AGHT+IFnlPleuzWBFHah/aSvvGeXWlFEbI6Y7OXKasiHzfXSeHwzASaQloX5bR0dSIgLZ53KYGnZ/g==
X-Received: by 2002:a05:6a00:2d19:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-72dafa44141mr22175720b3a.13.1737435286796;
        Mon, 20 Jan 2025 20:54:46 -0800 (PST)
Received: from thinkpad ([117.213.102.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd30d03fsm7885724a12.54.2025.01.20.20.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 20:54:46 -0800 (PST)
Date: Tue, 21 Jan 2025 10:24:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <20250121045439.xx6mavzwklfnlvhf@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-3-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-3-quic_jhugo@quicinc.com>

On Fri, Jan 17, 2025 at 10:09:38AM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, MHI host only performs firmware transfer via BHI in PBL and
> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> MHI controller has BHIe regs, sets seg_len, and does not set
> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 73 ++++++++++++++++++++++++++-------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  7 ++++
>  3 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 9fe13d3f09f0..a206c3f0fcfd 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -440,12 +440,59 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	if (mhi_cntrl->fbc_download) {
> +		return MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->seg_len)
> +			return MHI_FW_LOAD_BHIE;
> +		else
> +			return MHI_FW_LOAD_BHI;
> +	}
> +}
> +
> +static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	/* Load the firmware into BHI vec table */
> +	memcpy(image->mhi_buf->buf, fw_data, size);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_load_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhie_table(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhie(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhie_table(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  {
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	enum mhi_fw_load_type fw_load_type;
>  	enum mhi_pm_state new_state;
> -	struct image_info *image;
>  	const char *fw_name;
>  	const u8 *fw_data;
>  	size_t size, fw_sz;
> @@ -506,21 +553,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret) {
> -		release_firmware(firmware);
> -		goto error_fw_load;
> -	}
> -	/* Load the firmware into BHI vec table */
> -	memcpy(image->mhi_buf->buf, fw_data, size);
> -
> -	/* Download image using BHI */
> -	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
> +	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
> +	if (fw_load_type == MHI_FW_LOAD_BHIE)
> +		ret = mhi_load_image_bhie(mhi_cntrl, fw_data, size);
> +	else
> +		ret = mhi_load_image_bhi(mhi_cntrl, fw_data, size);
>  
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
> -		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
> +		dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
> +			fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
> +			ret);
>  		release_firmware(firmware);
>  		goto error_fw_load;
>  	}
> @@ -539,7 +582,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * If we're doing fbc, populate vector tables while
>  	 * device transitioning into MHI READY state
>  	 */
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> @@ -564,7 +607,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	return;
>  
>  error_ready_state:
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  		mhi_cntrl->fbc_image = NULL;
>  	}
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index a9b1f8beee7b..13e7a55f54ff 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1144,7 +1144,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  	}
>  	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
>  
> -	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
> +	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size || mhi_cntrl->seg_len) {
>  		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
>  				   &bhie_off);
>  		if (ret) {
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 3134f111be35..ce566f7d2e92 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -29,6 +29,13 @@ struct bhi_vec_entry {
>  	u64 size;
>  };
>  
> +enum mhi_fw_load_type {
> +	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
> +	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
> +	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
> +	MHI_FW_LOAD_MAX,
> +};
> +
>  enum mhi_ch_state_type {
>  	MHI_CH_STATE_TYPE_RESET,
>  	MHI_CH_STATE_TYPE_STOP,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

