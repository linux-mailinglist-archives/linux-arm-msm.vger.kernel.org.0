Return-Path: <linux-arm-msm+bounces-140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543F7E4FFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A661C208F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 05:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF47D8F78;
	Wed,  8 Nov 2023 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRwgleDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277B8F68
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 05:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADBCC433C7;
	Wed,  8 Nov 2023 05:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699421000;
	bh=++vhZB15HxrLswU7fa24vBW1/27vv3P0P8S8OaR39Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRwgleDpUFOOJ8A4W7bPzr5rP6mFuOcJWod8cuIC2SIlRc9W1unVcUlyh5s2ZUfMI
	 1hH+qDFDXF5fEZ+kJNUsSliTKNTPlAZkwjLqNEr2BYgjVLogSWCWI186upKKjNVQoW
	 spqAyhqVrZJrX1o4g0X4szuzyTcAR4hOK7IBnJMR0+EfoHVIYCMEfPLOgtPgXTpijv
	 J7coGlt6wGdHOiulGYc2xxrcx3aZqbPTE89OTZnqWxkcIu7c39z1+hfa4ewBqbBIsy
	 joxP2FXu8w9HMtyzqP6084oGnDQoNyNdkiIYBxiYPywsEvviWx5Pzvdl+0v+zNZFl9
	 97xHkGlZnjnOQ==
Date: Wed, 8 Nov 2023 10:53:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <cang@qti.qualcomm.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, stanley.chu@mediatek.com,
	adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] scsi: ufs: ufs-qcom: Allow the first init start
 with the maximum supported gear
Message-ID: <20231108052310.GC3296@thinkpad>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-4-git-send-email-cang@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699332374-9324-4-git-send-email-cang@qti.qualcomm.com>

On Mon, Nov 06, 2023 at 08:46:09PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> During host driver init, the phy_gear is set to the minimum supported gear
> (HS_G2). Then, during the first power mode change, the negotiated gear, say
> HS-G4, is updated to the phy_gear variable so that in the second init the
> updated phy_gear can be used to program the PHY.
> 
> But the current code only allows update the phy_gear to a higher value. If
> one wants to start the first init with the maximum support gear, say HS-G4,
> the phy_gear is not updated to HS-G3 if the device only supports HS-G3.
> 

Can you elaborate when this can happen? AFAICS, there are 3 possibilities of
initial phy gear with this series:

1. If ufshc is < 5.0, then G2 will be used.
2. If ufshc is >= 5.0 and if the version is populated in register, then that
gear will be used. Most likely that gear can be G4/G5 depending on the device
connected.
3. If ufshc is >=5.0 and version is not populated, then G4 will be used.

In all the above cases, I do not see any necessity to switch the phy gear
setting to lower one while scaling. Since the gears are backwards compatible,
we always use one phy gear sequence. Moreover, we only have 2 init sequences.

Please correct me if I'm missing anything.

- Mani

> The original check added there is intend to make sure the phy_gear won't be
> updated when gear is scaled down (during clock scaling). Update the check
> so that one can start the first init with the maximum support gear without
> breaking the original fix by checking the ufshcd_state, that is, allow
> update to phy_gear only if power mode change is invoked from
> ufshcd_probe_hba().
> 
> This change is a preparation patch for the next patches in the same series.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index cc0eb37..60b35ca 100644
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

-- 
மணிவண்ணன் சதாசிவம்

