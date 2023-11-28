Return-Path: <linux-arm-msm+bounces-2191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D037FB1B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 07:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D871C20B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641C010A31;
	Tue, 28 Nov 2023 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HS4tQajd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0610A2B;
	Tue, 28 Nov 2023 06:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98BBC433C7;
	Tue, 28 Nov 2023 06:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701151260;
	bh=EmSRmB2oOmQQilyIRrm1yWV+Y6rGwVrGp62r+MRCOT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HS4tQajdUVUFlC6yrPhG5YVFPgqYnCkB3m4xVYKG4vocgoxOSfQx2/4rIGjchvE9p
	 08UMVKJHXc+J8y8QI942vMt6ioOwPBPhBGjf+Z0shJClxJ7EnguKgAmCkgzgHPqeLn
	 snG0vaXP5us0ok7r2HcwMj0oqPKl15PWaEwQLY0qdcmy0hXzzw3xlzTe7fZJAOYInK
	 1qNyOPCGe5A9MGkcBUd3pRE1s0HvnWMq44GQvtemFUHQT3/LI9WlYCaUsEPbc36mrP
	 1oJjGxN0dKFjEUTwEswgCVjR00bEDR4oF4o+bfgTMBR59oAGOocD/ayXJiS8aVYJV2
	 vEaDVcgMqp0gw==
Date: Tue, 28 Nov 2023 11:30:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, adrian.hunter@intel.com, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/10] scsi: ufs: ufs-qcom: Set initial PHY gear to
 max HS gear for HW ver 5 and newer
Message-ID: <20231128060046.GH3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-8-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1700729190-17268-8-git-send-email-quic_cang@quicinc.com>

On Thu, Nov 23, 2023 at 12:46:27AM -0800, Can Guo wrote:
> Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.
> 

MAX_GEAR will be used for hosts with hw_ver.major >= 4

> This patch is not changing any functionalities or logic but only a
> preparation patch for the next patch in this series.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 6756f8d..7bbccf4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1067,6 +1067,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>  		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>  }
>  
> +static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
> +{
> +	struct ufs_host_params *host_params = &host->host_params;
> +
> +	host->phy_gear = host_params->hs_tx_gear;
> +
> +	/*
> +	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> +	 * Switching to max gear will be performed during reinit if supported.

You need to reword this comment too.

> +	 */
> +	if (host->hw_ver.major < 0x5)

As I mentioned above, MAX_GEAR will be used if hw_ver.major is >=4 in
ufs_qcom_get_hs_gear(). So this check should be (< 0x4).

- Mani

> +		host->phy_gear = UFS_HS_G2;
> +}
> +
>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -1303,6 +1317,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	ufs_qcom_set_caps(hba);
>  	ufs_qcom_advertise_quirks(hba);
>  	ufs_qcom_set_host_params(hba);
> +	ufs_qcom_set_phy_gear(host);
>  
>  	err = ufs_qcom_ice_init(host);
>  	if (err)
> @@ -1320,12 +1335,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  		dev_warn(dev, "%s: failed to configure the testbus %d\n",
>  				__func__, err);
>  
> -	/*
> -	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> -	 * Switching to max gear will be performed during reinit if supported.
> -	 */
> -	host->phy_gear = UFS_HS_G2;
> -
>  	return 0;
>  
>  out_variant_clear:
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

