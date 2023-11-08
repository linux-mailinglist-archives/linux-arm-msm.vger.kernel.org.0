Return-Path: <linux-arm-msm+bounces-142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF67E500C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFC50B20D02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 05:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E283DC8CC;
	Wed,  8 Nov 2023 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INFPOU7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2448C8C4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 05:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD713C433C7;
	Wed,  8 Nov 2023 05:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699421665;
	bh=QCMb8LNvrw0v1n2WKL+qqMTAtgJkKYzYKLDoK7dEVho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INFPOU7QgqLQwfvrQ2zSmvcDkpJuMTs/mqrdkxsp5CJh3g4qm6cPnm7zqAv6AaJXC
	 /slMj1Ht504mIuErcYlVfbIWwxPzRF+WGeIHYZCcFGZkNjikncQShyQ7AfZVr/2BLL
	 27mIl+jpDNxTpJCAweeSX4ICRZJnuOmdOueyTmgr9VFJdbfeqyGYXjX+fvZgkH/ya1
	 jW/Eo+5Kcz1Go/uRsCU51gHMhvjvQ+1Sr2URUMV2VduBebwh4z/3ckrXLQbUWbaBcs
	 TusYJpgcxgeXwo5pcRx+dUd2HRBaRaHWhQ4J6lB011K+aW1JOAxRKm5cxXLyZZqP1d
	 Uu5FryDZ9/pjQ==
Date: Wed, 8 Nov 2023 11:04:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <cang@qti.qualcomm.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, stanley.chu@mediatek.com,
	adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] scsi: ufs: ufs-qcom: Set initial PHY gear to max
 HS gear for HW ver 5 and newer
Message-ID: <20231108053415.GE3296@thinkpad>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-6-git-send-email-cang@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699332374-9324-6-git-send-email-cang@qti.qualcomm.com>

On Mon, Nov 06, 2023 at 08:46:11PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.
> 

How about,

"For UFSHC >= 5.0, set the initial PHY gear based on the gear value returned by
ufs_qcom_get_hs_gear(). For the rest, use the existing default value of G2."

> This patch is not changing any functionalities or logic but only a
> preparation patch for the next patch in this series.
> 

You are also moving the default phy_gear code to ufs_qcom_set_host_params(). So
it should be mentioned in the commit message.

> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 55ee31d..94d34b5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1069,6 +1069,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>  
>  	/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
>  	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> +	host->phy_gear = host_params->hs_tx_gear;
> +
> +	/*
> +	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> +	 * Switching to max gear will be performed during reinit if supported.
> +	 */

This comment should be moved inside the "if" condition here as done in the next
patch.

- Mani

> +	if (host->hw_ver.major < 0x5)
> +		host->phy_gear = UFS_HS_G2;
>  }
>  
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
> @@ -1313,12 +1321,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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

