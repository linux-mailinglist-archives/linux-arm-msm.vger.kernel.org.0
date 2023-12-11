Return-Path: <linux-arm-msm+bounces-4183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6780C4C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5336280EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4FD210EB;
	Mon, 11 Dec 2023 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOC5z0ZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3A1E536;
	Mon, 11 Dec 2023 09:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A86C433C7;
	Mon, 11 Dec 2023 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702287406;
	bh=PKwxxJaQ8XbMiumsFpz0ev2d9al4VPTBHyScl5V41AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOC5z0ZNq4fxQKIPsHGxX0cSM5q9bqqrcDfxrM/B9lO8dp2LAHHF+oW81I6+x4aBL
	 gzs9V47UnzJj7GxwM7y4Jr+BIyMDk3HPiXeVJz//NZOx/kOn/e27kka5o5dLPZ1l96
	 I7rYpnmxLmRbi+0y1z/kYkGEMrBf30/pTIHmPnWuz+LEkGjFCxpoOcJSqVujQibD/l
	 a5F8ZORDmEdv5v6P2ktPH2+SB45owIBe4F92tiVWNzqtvYqsi4mWoxEp0EiPh8nD9s
	 hjgJqVBAgdLr2iXsrbYXIRHArq1piCP/MZoTBhQtuTPOao7h56nmHEDqGo4XPGZrQl
	 ASgCQG4qoPIww==
Date: Mon, 11 Dec 2023 15:06:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Yaniv Gardi <ygardi@codeaurora.org>,
	Dov Levenglick <dovl@codeaurora.org>, Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Perform read back after writing reset
 bit
Message-ID: <20231211093630.GA2894@thinkpad>
References: <20231208-ufs-reset-ensure-effect-before-delay-v1-1-8a0f82d7a09e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208-ufs-reset-ensure-effect-before-delay-v1-1-8a0f82d7a09e@redhat.com>

On Fri, Dec 08, 2023 at 02:19:44PM -0600, Andrew Halaney wrote:
> Currently, the reset bit for the UFS provided reset controller (used by
> its phy) is written to, and then a mb() happens to try and ensure that
> hit the device. Immediately afterwards a usleep_range() occurs.
> 
> mb() ensure that the write completes, but completion doesn't mean that
> it isn't stored in a buffer somewhere. The recommendation for
> ensuring this bit has taken effect on the device is to perform a read
> back to force it to make it all the way to the device. This is
> documented in device-io.rst and a talk by Will Deacon on this can
> be seen over here:
> 
>     https://youtu.be/i6DayghhA8Q?si=MiyxB5cKJXSaoc01&t=1678
> 
> Let's do that to ensure the bit hits the device. By doing so and
> guaranteeing the ordering against the immediately following
> usleep_range(), the mb() can safely be removed.
> 
> Fixes: 81c0fc51b7a7 ("ufs-qcom: add support for Qualcomm Technologies Inc platforms")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> This is based on top of:
> 
>     https://lore.kernel.org/linux-arm-msm/20231208065902.11006-1-manivannan.sadhasivam@linaro.org/T/#ma6bf749cc3d08ab8ce05be98401ebce099fa92ba
> 
> Since it mucks with the reset as well, and looks like it will go in
> soon.
> 
> I'm unsure if this is totally correct. The goal of this
> seems to be "ensure the device reset bit has taken effect before
> delaying afterwards". As I describe in the commit message, mb()
> doesn't guarantee that, the read back does... if it's against a udelay().
> I can't quite totally 100% convince myself that applies to usleep_range(),
> but I think it should be.
> 

This patch is perfectly fine. I did similar cleanups earlier, but missed this
one. Thanks!

> In either case, I think the read back makes sense, the question is "is
> it safe to remove the mb()?".
> 
> Sorry, Will's talk over has inspired me to poke the bear whenever I see
> a memory barrier in a driver I play with :)
> 
>     https://youtu.be/i6DayghhA8Q?si=12B0wCqImx1lz8QX&t=1677

Yeah, this inspired me too :)

- Mani

> --->  drivers/ufs/host/ufs-qcom.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index cdceeb795e70..c8cd59b1b8a8 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -147,10 +147,10 @@ static inline void ufs_qcom_assert_reset(struct ufs_hba *hba)
>  	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, UFS_PHY_SOFT_RESET, REG_UFS_CFG1);
>  
>  	/*
> -	 * Make sure assertion of ufs phy reset is written to
> -	 * register before returning
> +	 * Dummy read to ensure the write takes effect before doing any sort
> +	 * of delay
>  	 */
> -	mb();
> +	ufshcd_readl(hba, REG_UFS_CFG1);
>  }
>  
>  static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
> @@ -158,10 +158,10 @@ static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
>  	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, 0, REG_UFS_CFG1);
>  
>  	/*
> -	 * Make sure de-assertion of ufs phy reset is written to
> -	 * register before returning
> +	 * Dummy read to ensure the write takes effect before doing any sort
> +	 * of delay
>  	 */
> -	mb();
> +	ufshcd_readl(hba, REG_UFS_CFG1);
>  }
>  
>  /* Host controller hardware version: major.minor.step */
> 
> ---
> base-commit: 8fdfb333a099b142b49510f2e55778d654a5b224
> change-id: 20231208-ufs-reset-ensure-effect-before-delay-6e06899d5419
> 
> Best regards,
> -- 
> Andrew Halaney <ahalaney@redhat.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

