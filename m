Return-Path: <linux-arm-msm+bounces-88673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F848D16F49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB69C3010FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E16330FC3E;
	Tue, 13 Jan 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtk0GdKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D9824290D;
	Tue, 13 Jan 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288399; cv=none; b=mNTUsze5UAnXpetoGaCQcSMdOexAY2lt6D4um4GYHQLbXVaGf2qXnhl6ni6LvmXnWuertH1HQ2FYdZG/9C76Q+B34szhDgWDTDjrEIH7OzOf+KUcsc/pt85HChciZqP0NPU2UGM/PKu2l2Abk2lCajGoQ/uFnb99/D2ibHcAGOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288399; c=relaxed/simple;
	bh=04GpJoYBI3MpHElb+mWeTl5CD/pVXY6JUdtsfLVKI1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiSiErhEE3Pa6TOaT3YM0nhM0MLPYap7EBWeT/kdovDQMu38ETEdVoddys+h2kT2RzpEaAigwmkT8lOYDrmiutsny/TVaQpP0LjfRfT38QyexTYxgLlikVDdx+LvsJ1NtJYAdhksHtzNou3ZmpqXPDJEvqg/laRFVrIh13l8FoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtk0GdKo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3B1C116C6;
	Tue, 13 Jan 2026 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768288399;
	bh=04GpJoYBI3MpHElb+mWeTl5CD/pVXY6JUdtsfLVKI1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtk0GdKom5QUN/wnoLeXDwHZZwiTgRKjwuZvejSr66NB0aTdgTIWsOKK08YBzGXCX
	 xdzJdiYDaheW5+n3x14zUazasQDOODYAWwpdVHkwDMEe9A52l+MUgWyv7Q3k/d4yPu
	 p1J4FusCKhtbi70uugEsgIBU8Sl5d2+TUToAoJXiftyLV1oeEBByMv+a/HsAhacgvb
	 tK9rn9drLs6TLE6YSs8/ajZ5QmpprhxbhMHEXoymoajzziSCc3UW6L4zCcQ8In3AiK
	 0OedB8WGr/VFDQJtO39WNCmiA1JfNUpcA//1xrCAsEOQ/loVUbvq2KqBxlbOAUHR9O
	 0JeQ9Kt6Nqwsg==
Date: Tue, 13 Jan 2026 12:43:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH 01/11] bus: mhi: host: Add support to read MHI
 capabilities
Message-ID: <u3d62zn56yj6k56t4jwcqylm4rofipp2f42dgpi2kqgumowzu7@m5iqfem5y5up>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-1-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-1-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:33PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
> located after the ERDB array. The location of this group of registers is
> indicated by the MISCOFF register. Each capability has a capability ID to
> determine which functionality is supported and each capability will point
> to the next capability supported.
> 
> Add a basic function to read those capabilities offsets.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    | 13 +++++++++++++
>  drivers/bus/mhi/host/init.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index dda340aaed95..58f27c6ba63e 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -16,6 +16,7 @@
>  #define MHICFG				0x10
>  #define CHDBOFF				0x18
>  #define ERDBOFF				0x20
> +#define MISCOFF				0x24
>  #define BHIOFF				0x28
>  #define BHIEOFF				0x2c
>  #define DEBUGOFF			0x30
> @@ -113,6 +114,9 @@
>  #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>  #define MHISTATUS_SYSERR_MASK		BIT(2)
>  #define MHISTATUS_READY_MASK		BIT(0)
> +#define MISC_CAP_MASK			GENMASK(31, 0)
> +#define CAP_CAPID_MASK			GENMASK(31, 24)
> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>  
>  /* Command Ring Element macros */
>  /* No operation command */
> @@ -204,6 +208,15 @@
>  #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>  							       MHI_PKT_TYPE_COALESCING))
>  
> +enum mhi_capability_type {
> +	MHI_CAP_ID_INTX = 0x1,
> +	MHI_CAP_ID_TIME_SYNC = 0x2,
> +	MHI_CAP_ID_BW_SCALE = 0x3,
> +	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
> +	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
> +	MHI_CAP_ID_MAX,
> +};

If you are not going to define a variable with type 'mhi_capability_type', I'd
suggest using '#define'.

> +
>  enum mhi_pkt_type {
>  	MHI_PKT_TYPE_INVALID = 0x0,
>  	MHI_PKT_TYPE_NOOP_CMD = 0x1,
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 099be8dd1900..4c092490c9fd 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -466,6 +466,38 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	return ret;
>  }
>  
> +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
> +{

Why can't you return the cap offset like pci_find_capability()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

