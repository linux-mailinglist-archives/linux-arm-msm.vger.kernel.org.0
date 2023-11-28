Return-Path: <linux-arm-msm+bounces-2186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D17FB12E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0862F281CED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 05:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08F8101E5;
	Tue, 28 Nov 2023 05:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZYM5gfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBAD101CE;
	Tue, 28 Nov 2023 05:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EA5C433C8;
	Tue, 28 Nov 2023 05:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701149073;
	bh=sIsBjrpSot3b7HbeiDj1WiAo9EQ85x5QrsxcU8uxZBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZYM5gfYm03LDxKFecMOeBwx5JVe8LekM4ojSyc/OpPTl0GC+2gZ5BUpizpddey6O
	 tzf44X/apOlirmH6b4SEvA5GYkdU/d/q38hLR3FwgtFiL6sNHDzlHPnMghA4BWVBTe
	 X3HHej83UxkZt2xlvM8qVSj4I5wGIjT7iJA0qypU25hZangjbevvoqc3Ysxxn5UR0L
	 QTSvPSTuWuUIxoCcQCnCBnOv2cmJjbVTvOvFxT3gilEk22daPjLZbJHre9b4YN7KDW
	 V1VWL+9WqpOjcGG8sMTRvt3wY2ggcQX+INb4THk9xDeUU0IC3Jnk1hU9+A0BQba4DJ
	 YmN9VAmYitnog==
Date: Tue, 28 Nov 2023 10:54:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, adrian.hunter@intel.com, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	"Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 03/10] scsi: ufs: ufs-qcom: Setup host power mode
 during init
Message-ID: <20231128052418.GD3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-4-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1700729190-17268-4-git-send-email-quic_cang@quicinc.com>

On Thu, Nov 23, 2023 at 12:46:23AM -0800, Can Guo wrote:
> Setup host power mode and its limitations during UFS host driver init to
> avoid repetitive work during every power mode change.
> 
> Acked-by: Andrew Halaney <ahalaney@redhat.com>
> Co-developed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++-------
>  drivers/ufs/host/ufs-qcom.h |  1 +
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index cc30ad9..cc0eb37 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  				struct ufs_pa_layer_attr *dev_req_params)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct ufs_host_params host_params;
> +	struct ufs_host_params *host_params = &host->host_params;
>  	int ret = 0;
>  
>  	if (!dev_req_params) {
> @@ -908,12 +908,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		ufshcd_init_host_param(&host_params);
> -
> -		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> -		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> -
> -		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
> +		ret = ufshcd_negotiate_pwr_param(host_params, dev_max_params, dev_req_params);
>  		if (ret) {
>  			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>  					__func__);
> @@ -1048,6 +1043,17 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>  		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>  }
>  
> +static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_host_params *host_params = &host->host_params;
> +
> +	ufshcd_init_host_param(host_params);
> +
> +	/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> +	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> +}
> +
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -1272,6 +1278,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  
>  	ufs_qcom_set_caps(hba);
>  	ufs_qcom_advertise_quirks(hba);
> +	ufs_qcom_set_host_params(hba);
>  
>  	err = ufs_qcom_ice_init(host);
>  	if (err)
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 82cd143..11419eb 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -238,6 +238,7 @@ struct ufs_qcom_host {
>  
>  	struct gpio_desc *device_reset;
>  
> +	struct ufs_host_params host_params;
>  	u32 phy_gear;
>  
>  	bool esi_enabled;
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

