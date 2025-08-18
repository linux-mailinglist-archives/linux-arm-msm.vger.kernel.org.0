Return-Path: <linux-arm-msm+bounces-69473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36DB298F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 07:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3B661896A50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 05:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D572376EB;
	Mon, 18 Aug 2025 05:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdvPCVkh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86F204F99;
	Mon, 18 Aug 2025 05:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755495404; cv=none; b=asPdBkVOnCBw6J8mdbi4DDaeRc6Pz9MnVWCpo8jrUCu1fSM2+/bRXQRaT36wI8mQ7lmc30hewG2IshB+91e10SrgCKAnEn/Xtl/38O8JTdW8t4hwUGfoGrc1n/CwQzldJBvsS9pTlAQmC9kiHHS6XoKUYEfQn6dl32uAceis9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755495404; c=relaxed/simple;
	bh=zJX+MKpmqSRVyQ/hTAHrNBZdXqmZkb5k7P9uju/pf3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjU61TQQA1Grbb/LC+F+/PuSRYrTCM2eHKuitnHv7dI2ORHxPCTIrfquFXpf/vpiuwGZyZTAO4aiQ2yd/ca+xZkNaBE+Olit2fYC5a9Ks4M9WkVR6tqKGCErv9dz6iC6qMANO5SfYabEXdiepQSdXbCXWN29qL5RJ3XZI6Qv5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdvPCVkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA439C4CEEB;
	Mon, 18 Aug 2025 05:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755495404;
	bh=zJX+MKpmqSRVyQ/hTAHrNBZdXqmZkb5k7P9uju/pf3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdvPCVkhug6shHPIWtGoKqFiv40DzNoKITsa36zVw5pqLUKFAlrnOHh7nGZGsuwd6
	 8rB0cdkuBSQVh7atduGYKC0024ogZ2yzVz4LTsdPpv+sX9cXVuFjKj0ivMASbwLyOi
	 jMXTsRCScTEO7Mh4zjdjRur3wwfQ6aNoph110E/RytAM5IZh99ZxyZ1WDtybzdjU19
	 XjxGE4uB99QsFEfRWQxETZOR/6JmcITfheRGh3SvFM6TJ0fmKBSmNMwAjkvL+85bRr
	 MjSevYMNzQaYbQ/SLd5qLQHSwz8FClKzJuo9+EJrJZ6PYcngGDhmrjN0bcSD0UFkPs
	 lV0s8xeZ3u4zw==
Date: Mon, 18 Aug 2025 11:06:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH v5] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for  UFS controller v5
Message-ID: <xnwjpiczu3xzzntu45gxkmigwilt7i75iydk6vdp5xpeujh6i5@3ak7arychdxy>
References: <20250818040905.1753905-1-quic_pkambar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818040905.1753905-1-quic_pkambar@quicinc.com>

On Mon, Aug 18, 2025 at 09:39:05AM GMT, Palash Kambar wrote:
> Disabling the AES core in Shared ICE is not supported during power
> collapse for UFS Host Controller v5.0, which may lead to data errors
> after Hibern8 exit. To comply with hardware programming guidelines
> and avoid this issue, issue a sync reset to ICE upon power collapse
> exit.
> 
> Hence follow below steps to reset the ICE upon exiting power collapse
> and align with Hw programming guide.
> 
> a. Assert the ICE sync reset by setting both SYNC_RST_SEL and
>    SYNC_RST_SW bits in UFS_MEM_ICE_CFG
> b. Deassert the reset by clearing SYNC_RST_SW in  UFS_MEM_ICE_CFG
> 
> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> 
> ---
> changes from V1:
> 1) Incorporated feedback from Konrad and Manivannan by adding a delay
>    between ICE reset assertion and deassertion.
> 2) Removed magic numbers and replaced them with meaningful constants.
> 
> changes from V2:
> 1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
> 
> changes from V3:
> 1) Addressed Manivannan's comments and added bit field values and
>    updated patch description.
> 
> change from V4:
> 1) Addressed Konrad's comment and fixed reset bit to zero.
> ---
>  drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 444a09265ded..242f8d479d4a 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -38,6 +38,9 @@
>  #define DEEMPHASIS_3_5_dB	0x04
>  #define NO_DEEMPHASIS		0x0
>  
> +#define UFS_ICE_SYNC_RST_SEL	BIT(3)
> +#define UFS_ICE_SYNC_RST_SW	BIT(4)
> +
>  enum {
>  	TSTBUS_UAWM,
>  	TSTBUS_UARM,
> @@ -751,11 +754,29 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	int err;
> +	u32 reg_val;
>  
>  	err = ufs_qcom_enable_lane_clks(host);
>  	if (err)
>  		return err;
>  
> +	if ((!ufs_qcom_is_link_active(hba)) &&
> +	    host->hw_ver.major == 5 &&
> +	    host->hw_ver.minor == 0 &&
> +	    host->hw_ver.step == 0) {
> +		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
> +		reg_val = ufshcd_readl(hba, UFS_MEM_ICE_CFG);
> +		reg_val &= ~(UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW);

I guess you could use:

		FIELD_MODIFY(UFS_ICE_SYNC_RST_SEL, &reg_val, 0);
		FIELD_MODIFY(UFS_ICE_SYNC_RST_SW, &reg_val, 0);

This looks more cleaner.

With that,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> +		/*
> +		 * HW documentation doesn't recommend any delay between the
> +		 * reset set and clear. But we are enforcing an arbitrary delay
> +		 * to give flops enough time to settle in.
> +		 */
> +		usleep_range(50, 100);
> +		ufshcd_writel(hba, reg_val, UFS_MEM_ICE_CFG);
> +		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
> +	}
> +
>  	return ufs_qcom_ice_resume(host);
>  }
>  
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 6840b7526cf5..81e2c2049849 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -60,7 +60,7 @@ enum {
>  	UFS_AH8_CFG				= 0xFC,
>  
>  	UFS_RD_REG_MCQ				= 0xD00,
> -
> +	UFS_MEM_ICE_CFG				= 0x2600,
>  	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
>  	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

