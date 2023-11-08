Return-Path: <linux-arm-msm+bounces-138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB567E4FD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 089BF1C209CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 05:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525D46ADE;
	Wed,  8 Nov 2023 05:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2CSg6RN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333136AAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 05:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18490C433C8;
	Wed,  8 Nov 2023 05:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699420060;
	bh=T+5cW3D4tAaO3IaJl4GhQCISyR4UsA5zyjkxg/vQH7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2CSg6RNo/JMuR+m1JQnR+ZejSHnnUD6p4h0omBhAUR8tNHWukDqLuvuwSDjhCsCQ
	 I17EzBWg4lsbjYBO+YLMX8TB70jYTmetb7B8ZowEBmEJDww2NZpdXyv5uKQbxH3B1e
	 CXD9Zvk2IW8g9HspjIUO8wSQcIRg9O244L8TshZEnemV134RJ/PALESuJFF2eWeQHf
	 zDl5jmt+H+4UOeeyr6AGpD534duauloqsToct/yElq/mkSvJkiasQUxNQn5YdMdcp8
	 8KCY0bbCEEbwfd4LSBYw0gVMjkqTVNsxstxt6xDpiSJj7dH6rAXZbVlIvZlJXG5lB0
	 nIMF9lY3Iq4Cg==
Date: Wed, 8 Nov 2023 10:37:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <cang@qti.qualcomm.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, stanley.chu@mediatek.com,
	adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org,
	"Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] scsi: ufs: ufs-qcom: Setup host power mode during
 init
Message-ID: <20231108050729.GA3296@thinkpad>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-3-git-send-email-cang@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699332374-9324-3-git-send-email-cang@qti.qualcomm.com>

On Mon, Nov 06, 2023 at 08:46:08PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Setup host power mode and its limitations during UFS host driver init to
> avoid repetitive work during every power mode change.
> 
> Co-developed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 22 ++++++++++++++--------
>  drivers/ufs/host/ufs-qcom.h |  1 +
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index aee66a3..cc0eb37 100644
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
> @@ -908,13 +908,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		ufshcd_init_host_param(&host_params);
> -		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;

As Andrew spotted, this gets removed without explanation. So, I'd also suggest
doing it in a separate patch.

- Mani

> -
> -		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> -		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> -
> -		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
> +		ret = ufshcd_negotiate_pwr_param(host_params, dev_max_params, dev_req_params);
>  		if (ret) {
>  			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>  					__func__);
> @@ -1049,6 +1043,17 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
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
> @@ -1273,6 +1278,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  
>  	ufs_qcom_set_caps(hba);
>  	ufs_qcom_advertise_quirks(hba);
> +	ufs_qcom_set_host_params(hba);
>  
>  	err = ufs_qcom_ice_init(host);
>  	if (err)
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 9950a00..ab94c54 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -240,6 +240,7 @@ struct ufs_qcom_host {
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

