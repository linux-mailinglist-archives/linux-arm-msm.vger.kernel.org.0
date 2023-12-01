Return-Path: <linux-arm-msm+bounces-2814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FC800325
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 06:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6CA628143F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 05:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC9E5666;
	Fri,  1 Dec 2023 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEDiyVV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF151FC9;
	Fri,  1 Dec 2023 05:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF80C433C9;
	Fri,  1 Dec 2023 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701409463;
	bh=OwzaFwSrB9R9fz/n559M5Y5GjbwxckR18pqsJDu+mMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEDiyVV+bVWftBCoWFDjDRwtPnS2Fa/fWX6cNF0wy/0aTBwMXaC5UteWanowyhSVo
	 GRAMbBHPwtrGHAsylU8UfSDX8PFwuU2/nXx+MnwRLMlJYq1VF1ycRylzkH2PjNHoLJ
	 UevYMc2IX95mKh0ZJTCG6TF5Wtw7571XmygnzbqEithjdJNhwSoWk7QMGFJBItGDfp
	 mhSZLSNxB+OTYSzfqoYOTvXscPmdWQ45UmAMngOOTHYM5H/0eMfSA61qi74gPiZj+2
	 367fPwQZlAwEXdLwjaHXuq5BlFI3JihVOLNa2VM1GMbQd1zJzQ33VTpGrEHN/X1hj7
	 B1+YInbkcgh1A==
Date: Fri, 1 Dec 2023 11:14:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, adrian.hunter@intel.com, vkoul@kernel.org,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 08/10] scsi: ufs: ufs-qcom: Add support for UFS device
 version detection
Message-ID: <20231201054408.GC4009@thinkpad>
References: <1701407001-471-1-git-send-email-quic_cang@quicinc.com>
 <1701407001-471-9-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1701407001-471-9-git-send-email-quic_cang@quicinc.com>

On Thu, Nov 30, 2023 at 09:03:18PM -0800, Can Guo wrote:
> From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
> 
> A spare register in UFS host controller is used to indicate the UFS device
> version. The spare register is populated by bootloader for now, but in
> future it will be populated by HW automatically during link startup with
> its best efforts in any boot stages prior to Linux.
> 
> During host driver init, read the spare register, if it is not populated
> with a UFS device version, go ahead with the dual init mechanism. If a UFS
> device version is in there, use the UFS device version together with host
> controller's HW version to decide the proper PHY gear which should be used
> to configure the UFS PHY without going through the second init.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 35 ++++++++++++++++++++++++++++-------
>  drivers/ufs/host/ufs-qcom.h |  4 ++++
>  2 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index ee3f07a..99a0a53 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1065,17 +1065,38 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>  static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
>  {
>  	struct ufs_host_params *host_params = &host->host_params;
> +	u32 val, dev_major;
>  
>  	host->phy_gear = host_params->hs_tx_gear;
>  
> -	/*
> -	 * For controllers whose major HW version is < 4, power up the PHY using
> -	 * minimum supported gear (UFS_HS_G2). Switching to max gear will be
> -	 * performed during reinit if supported. For newer controllers, whose
> -	 * major HW version is >= 4, power up the PHY using max supported gear.
> -	 */
> -	if (host->hw_ver.major < 0x4)
> +	if (host->hw_ver.major < 0x4) {
> +		/*
> +		 * For controllers whose major HW version is < 4, power up the
> +		 * PHY using minimum supported gear (UFS_HS_G2). Switching to
> +		 * max gear will be performed during reinit if supported.
> +		 * For newer controllers, whose major HW version is >= 4, power
> +		 * up the PHY using max supported gear.
> +		 */
>  		host->phy_gear = UFS_HS_G2;
> +	} else {
> +		val = ufshcd_readl(host->hba, REG_UFS_DEBUG_SPARE_CFG);
> +		dev_major = FIELD_GET(UFS_DEV_VER_MAJOR_MASK, val);
> +
> +		/*
> +		 * Since the UFS device version is populated, let's remove the
> +		 * REINIT quirk as the negotiated gear won't change during boot.
> +		 * So there is no need to do reinit.
> +		 */
> +		if (dev_major != 0x0)
> +			host->hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
> +
> +		/*
> +		 * For UFS 3.1 device and older, power up the PHY using HS-G4
> +		 * PHY gear to save power.
> +		 */
> +		if (dev_major > 0x0 && dev_major < 0x4)
> +			host->phy_gear = UFS_HS_G4;
> +	}
>  }
>  
>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 11419eb..32e51d9 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -23,6 +23,8 @@
>  #define UFS_HW_VER_MINOR_MASK	GENMASK(27, 16)
>  #define UFS_HW_VER_STEP_MASK	GENMASK(15, 0)
>  
> +#define UFS_DEV_VER_MAJOR_MASK	GENMASK(7, 4)
> +
>  /* vendor specific pre-defined parameters */
>  #define SLOW 1
>  #define FAST 2
> @@ -54,6 +56,8 @@ enum {
>  	UFS_AH8_CFG				= 0xFC,
>  
>  	REG_UFS_CFG3				= 0x271C,
> +
> +	REG_UFS_DEBUG_SPARE_CFG			= 0x284C,
>  };
>  
>  /* QCOM UFS host controller vendor specific debug registers */
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

