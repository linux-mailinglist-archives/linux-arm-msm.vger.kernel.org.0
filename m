Return-Path: <linux-arm-msm+bounces-44122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA308A03D55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336761881CC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ED01E04B9;
	Tue,  7 Jan 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUGtZS3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0721E3DD1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248330; cv=none; b=S4VX5CO8EAMQUIlGgmAdVVt8bhZzh2mKSb+oLCf6MfcL1eb0DUwn0nAb1Sf05Q593bNygrpF8afjX4r1iLbPvUnm27f8bwjeEuhgQWzfnI+zeMKxuwBWvH1pWmB9wev+YhKaGwTtxpARTwkMnlywp3OvbrqByFWPTHMANm/LdN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248330; c=relaxed/simple;
	bh=hT7bkN+E5xxsLEPSPqZgK9sCRWJzPwxKxpoe9TmSC3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlrRtIwg42nzmBpAXEFDFblRs2Nc8sZIlB5wxeGk8wBMeb/AXvu1bd7inmlQZuY/1cwYRx47bMTfjUGHgsN+XZRUvgh7Vx2kdnxNPezA+PBXPRnucvhXKQ73JdgGrmKMv/xzhprlO4RRmb+Tbmyt1/VOsFbunesTYKVjQxAiWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUGtZS3j; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736248327; x=1767784327;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hT7bkN+E5xxsLEPSPqZgK9sCRWJzPwxKxpoe9TmSC3E=;
  b=jUGtZS3j/iT8Cjn27CfnnL3RZCvZxfcgmeQDm6bM4SLsa4gMxMbwKH8H
   Vnsk7/YAKSRAmL8/DiLjy0sU4qU18gq4/bhuudINs+oNOsn74XDO3q4go
   MFr1LbHq9xDaircTyNuORVnc1vCtq3v5i4o4ImjMEmP4pm16irdF6DBv2
   CtLhKU4pblkEx2vHCd18F2zAqCpf4wxRF4/CHvtphTNd2DrBNkfcA6KnM
   9pjNWaux2n3TsT5JwJE6N2/0xNtILHcSrtsCptSHBsU5dfBRBirmYqduN
   VCVNk3GvHdC59yXmcxgU3nCddP/+PGgHfy2W4xduBqkeiyECqDxCCJ4CV
   g==;
X-CSE-ConnectionGUID: SWVcGTezRN2sePjcEVfTKg==
X-CSE-MsgGUID: RzW74SluSoaDpu/euSX32A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36646257"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36646257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:12:06 -0800
X-CSE-ConnectionGUID: nXd5xfL7R2m/Y5gbe8x5NQ==
X-CSE-MsgGUID: DKSYkrNXSRO7Mvz/w0N/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102609320"
Received: from derekcam-mobl.ger.corp.intel.com (HELO [10.245.83.121]) ([10.245.83.121])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:12:02 -0800
Message-ID: <0037bef6-18f1-4eca-80be-29be6cb603b6@linux.intel.com>
Date: Tue, 7 Jan 2025 12:12:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image transfer
 via BHIe in PBL
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 manivannan.sadhasivam@linaro.org, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-3-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241213213340.2551697-3-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 12/13/2024 10:33 PM, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, mhi host only performs firmware transfer via BHI in PBL and
> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> mhi controller has bhie regs, sets seg_len, and does not set
> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  8 ++++
>  3 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e3f3c07166ad..c9ecb6427209 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;
> +
> +	if (mhi_cntrl->fbc_download) {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_BHIE;
> +		else
> +			ret = MHI_FW_LOAD_BHI;
> +	}
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
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
> @@ -481,6 +531,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
>  		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
>  
> +	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
> +	if (fw_load_type == MHI_FW_LOAD_UNKNOWN) {
> +		dev_err(dev, "Cannot load FW as load type is UNKNOWN\n");
> +		return;
> +	}
> +
>  	/* check if the driver has already provided the firmware data */
>  	if (!fw_name && mhi_cntrl->fbc_download &&
>  	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
> @@ -518,20 +574,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret) {
> -		release_firmware(firmware);
> -		goto error_fw_load;
> -	}
> -	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> -
> -	/* Download image using BHI */
> -	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
> +	if (fw_load_type == MHI_FW_LOAD_BHIE)
> +		ret = mhi_send_image_bhie(mhi_cntrl, fw_data, size);
> +	else
> +		ret = mhi_send_image_bhi(mhi_cntrl, fw_data, size);
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
> @@ -550,7 +602,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * If we're doing fbc, populate vector tables while
>  	 * device transitioning into MHI READY state
>  	 */
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> @@ -575,7 +627,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> index 3134f111be35..afcf536083bc 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -29,6 +29,14 @@ struct bhi_vec_entry {
>  	u64 size;
>  };
>  
> +enum mhi_fw_load_type {
> +	MHI_FW_LOAD_UNKNOWN,
> +	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
> +	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
> +	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
> +	MHI_FW_LOAD_MAX,
> +};
> +
>  enum mhi_ch_state_type {
>  	MHI_CH_STATE_TYPE_RESET,
>  	MHI_CH_STATE_TYPE_STOP,


