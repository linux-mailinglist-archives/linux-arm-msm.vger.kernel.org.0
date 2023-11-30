Return-Path: <linux-arm-msm+bounces-2648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF57FE948
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 07:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F291C20A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 06:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EDA14F8D;
	Thu, 30 Nov 2023 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loGYpoO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3810977;
	Thu, 30 Nov 2023 06:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD50C433CC;
	Thu, 30 Nov 2023 06:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701326553;
	bh=3ZrDhM013NGA07FQN53GnlT8/tNmjwSsKx1hHNJ7Rzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loGYpoO9b1Y80KOFWcAmmz+L3BS2lYVqrAe2I3+oIUMPTgpIggiN0w7ObJ6whM40y
	 glzLAWEGmpGAkaCUPRd6LtqkwmZ9oLLR20JEi1d8nYXYB+rwmkbiT7e+D3IKEfN3/l
	 4CwBkthUsXx1pvYHXxob0fT0lFjwAKGxlqXKAV2WIHMs3/uJ4fAbuPLz58X/omgVKd
	 ArP4lN0B54GGuYKBYBV7ra+iiHxFptsZWuUEwcEQUqCmHagjCpYXRlTfBT8Ayk34V3
	 Fr2RfRRmL2bEay6iyh6iAiSLWSYb3hY6mT+D8Bk0ZSYVrx8haFZ96eZ/fTglIqfYkO
	 lU5OJYFXv8tJA==
Date: Thu, 30 Nov 2023 12:12:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com,
	cmd4@qualcomm.com, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 04/10] scsi: ufs: ufs-qcom: Allow the first init start
 with the maximum supported gear
Message-ID: <20231130064221.GE3043@thinkpad>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-5-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1701246516-11626-5-git-send-email-quic_cang@quicinc.com>

On Wed, Nov 29, 2023 at 12:28:29AM -0800, Can Guo wrote:
> During host driver init, the phy_gear is set to the minimum supported gear
> (HS_G2). Then, during the first power mode change, the negotiated gear, say
> HS-G4, is updated to the phy_gear variable so that in the second init the
> updated phy_gear can be used to program the PHY.
> 
> But the current code only allows update the phy_gear to a higher value. If
> one wants to start the first init with the maximum support gear, say HS-G4,
> the phy_gear is not updated to HS-G3 if the device only supports HS-G3.
> 
> The original check added there is intend to make sure the phy_gear won't be
> updated when gear is scaled down (during clock scaling). Update the check
> so that one can start the first init with the maximum support gear without
> breaking the original fix by checking the ufshcd_state, that is, allow
> update to phy_gear only if power mode change is invoked from
> ufshcd_probe_hba().
> 
> This change is a preparation patch for the next patches in the same series.

If you happen to respin the series, please remove this line. When the patches
get merged, there will be no concept of patches/series as all will be git
commits.

You can have this information in the comment section (below --- line) though.

> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 9a90019..81056b9 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -916,11 +916,12 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  		}
>  
>  		/*
> -		 * Update phy_gear only when the gears are scaled to a higher value. This is
> -		 * because, the PHY gear settings are backwards compatible and we only need to
> -		 * change the PHY gear settings while scaling to higher gears.
> +		 * During UFS driver probe, always update the PHY gear to match the negotiated
> +		 * gear, so that, if quirk UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH is enabled,
> +		 * the second init can program the optimal PHY settings. This allows one to start
> +		 * the first init with either the minimum or the maximum support gear.
>  		 */
> -		if (dev_req_params->gear_tx > host->phy_gear)
> +		if (hba->ufshcd_state == UFSHCD_STATE_RESET)
>  			host->phy_gear = dev_req_params->gear_tx;
>  
>  		/* enable the device ref clock before changing to HS mode */
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

