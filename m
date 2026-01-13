Return-Path: <linux-arm-msm+bounces-88695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD14D1747A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E0673007245
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147EA37FF72;
	Tue, 13 Jan 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGBo4idm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6137FF6B;
	Tue, 13 Jan 2026 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292871; cv=none; b=unEmHqjkUaAJ4y8+cn28NQcmqwzJoRSfg97/XTM9E3eqHZ0zn0+3CvxG4wBELy9VJi5OSIV9XG6d2w01PrMY//JGGv5ESKU+XkqxDWPGSkJ+mEnnLVfB6EzWT+y/BeOfVVse/vQRD3uzLF9GoVE7HhhVJO8/x2Ycdsp2Tmvkz1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292871; c=relaxed/simple;
	bh=X2wKQR0SQCFwN++DAXNvxKm6lGM43qxxLpiR+rDDf6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qk2VVn/SaVPvs1gNuIZbLteOGhZVPXIR22cdGKOGLkM6tM6m+zRVceK+SHQFuegwR7vFWDgzGeRFoKIgwGzpkJmagj5sYY5kOHZoEAdoQ5P+89Nlp3nBY2cfIroDj/5bKl5hVh8K5I8DjywC95VCJF/cGleGLOnMTBCixvmDLmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGBo4idm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20576C19422;
	Tue, 13 Jan 2026 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292870;
	bh=X2wKQR0SQCFwN++DAXNvxKm6lGM43qxxLpiR+rDDf6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGBo4idmrp8zkr2k66YhS7nuSssrTxnqwKRQqTEgA1e4nqMHdH782w6lfngwR2Vmu
	 4mP4Ws2oQ1B5ccJuEcwYMilXNhPa8fDFpNjtejjBIWu76TG0Nb1K+9z73KkXX8RpQK
	 lIeiZH7zs+9aZXxRoQ1SBID3feKn7XlwcqZavNbPF8arIQUg8vgf8ANR+c/YVkxgKK
	 jmw8Ii/e2kyoXtA9rUOwoAeaexqDFqsB+Lb1VAuqaIMuYYqZ8vLCcMTzCdkgN233jC
	 CJW+UKc20hxHMbuix7jDLFLGsJT9hAfcmhAhdinWiSPm92E0+KYUNe580/OGlXNBG9
	 gSY7SX8N1aukA==
Date: Tue, 13 Jan 2026 13:57:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] drivers: bus: mhi: host: Add support for MHI MAX
 TRB capability
Message-ID: <gok5wlsti3y7eebdo4rjbvoclo3d2o2e3bseo3lwrooo5sf64a@42balu3tsz5e>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-10-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-10-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:42PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Read the MHI capability for MAX TRB length if device is supporting.

Expand TRB.

> Use this information to send MHI data with a higher TRB length, as
> supported by the device.
> 

Add some context on what the device is going to do with it.

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    |  9 ++++++++-
>  drivers/bus/mhi/host/init.c | 21 +++++++++++++++++++++
>  drivers/bus/mhi/host/main.c | 17 ++++++++++++++---
>  include/linux/mhi.h         |  2 ++
>  4 files changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index 3b3ecbc6169f..4962035f4693 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -158,6 +158,8 @@
>  #define MHI_TRE_GET_EV_PTR(tre)		le64_to_cpu((tre)->ptr)
>  #define MHI_TRE_GET_EV_CODE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
>  #define MHI_TRE_GET_EV_LEN(tre)		FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0)))
> +#define MHI_TRE_GET_EV_LEN_MAX_TRB(max_trb, tre)    (GENMASK(__fls(max_trb), 0) & \
> +						    (MHI_TRE_GET_DWORD(tre, 0)))
>  #define MHI_TRE_GET_EV_CHID(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
>  #define MHI_TRE_GET_EV_TYPE(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1)))
>  #define MHI_TRE_GET_EV_STATE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
> @@ -188,6 +190,7 @@
>  /* Transfer descriptor macros */
>  #define MHI_TRE_DATA_PTR(ptr)		cpu_to_le64(ptr)
>  #define MHI_TRE_DATA_DWORD0(len)	cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len))
> +#define MHI_TRE_DATA_DWORD0_MAX_TREB_CAP(max_len, len)	((GENMASK(__fls(max_len), 0)) & (len))
>  #define MHI_TRE_TYPE_TRANSFER		2
>  #define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>  								MHI_TRE_TYPE_TRANSFER) |    \
> @@ -206,7 +209,11 @@
>  #define MHI_RSCTRE_DATA_PTR(ptr, len)	cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr)
>  #define MHI_RSCTRE_DATA_DWORD0(cookie)	cpu_to_le32(cookie)
>  #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
> -							       MHI_PKT_TYPE_COALESCING))
> +								MHI_PKT_TYPE_COALESCING))
> +
> +/* MHI Max TRB Length CAP ID */
> +#define MAX_TRB_LEN_CAP_ID		0x5
> +#define MAX_TRB_LEN_CFG			0x4
>  
>  enum mhi_capability_type {
>  	MHI_CAP_ID_INTX = 0x1,
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 50f96f2c823f..b0982cb24fb9 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -500,6 +500,25 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability,
>  	return -ENXIO;
>  }
>  
> +static int mhi_init_ext_trb_len(struct mhi_controller *mhi_cntrl)

Why _ext_?

> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	u32 trb_offset;
> +	int ret;
> +
> +	ret = mhi_find_capability(mhi_cntrl, MAX_TRB_LEN_CAP_ID, &trb_offset);
> +	if (ret)
> +		return ret;
> +
> +	/* Get max TRB length */
> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
> +			   trb_offset + MAX_TRB_LEN_CFG, &mhi_cntrl->ext_trb_len);
> +
> +	dev_dbg(dev, "Max TRB length supported is : 0x%x\n", mhi_cntrl->ext_trb_len);

"Max TRB length: 0x%x"

But it feels more natural to expose the value in decimal, than in hex.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

