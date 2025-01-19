Return-Path: <linux-arm-msm+bounces-45487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E725A160AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 08:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59991886748
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 07:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14AA188714;
	Sun, 19 Jan 2025 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYbvbHU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1623C9;
	Sun, 19 Jan 2025 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737270703; cv=none; b=CTAi0ph4MSQzttYpm2qCRfuu1IjoT28CefscZ0XUSsBudFl5eXWF9zzs5lKDjQDTT7epIIxl8pQypicYgeHu+UOUG59cSXCRk8aMAWYx0sWvkBXGKgpjVXsLcnrkK2DlnIm5uuXD+ZkQE/J5Qi457DW210EFsdTfTJ5GDlHH5G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737270703; c=relaxed/simple;
	bh=rcm2VwhfL9VG1j4iZLHkUBMlqKdH3x7wY84FhttghM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mgt6qsSUeP/s7EL94DD0bmeo32CS5gwl9dzJtNIEjwyStXZ6sPx5gVbVIjMlPaxT4C2CV3VRbdtTfvwlwQtZL3fyHtm4ui6TKXU02036LtY75aqvT7k2km/CrMFKUIucZT2l81JYC4Bot5FIhQOFRgPQpxKv6NVFqHJ4H4YB81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYbvbHU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF5AC4CED6;
	Sun, 19 Jan 2025 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737270702;
	bh=rcm2VwhfL9VG1j4iZLHkUBMlqKdH3x7wY84FhttghM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYbvbHU9ebBwBZKrpJI57XOvVEc109zi5V31RWS1F+59cYE1HtHBsH0wVb+8z11s9
	 UOHmgTpv0xdN8QsAAnQe5kUEIsYPTTfSkXecBkUVlvvpQ54fjcqUMIWRYJg60rtLF3
	 lP02qYIvhtQdnEAP6yrPV/OP7Bbfrmbd1maGxG5CGyygvGmz2ReO9DMtKNL0qy2AbP
	 GzJQ3xej/hyRQaTWoP0ndssB1pBLB8CU3+9JJRtAvvwsYLNzEWvx05eKCKrOVlcSjX
	 LZ9OVlYqXrnBmgHbLjAHjt7EEuKlBZfpo/mEvmew7JQkDVyfQoS4ziFt6p4vr1bGQS
	 gTcCvxhjUuX3A==
Date: Sun, 19 Jan 2025 12:41:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maramaina Naresh <quic_mnaresh@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Minwoo Im <minwoo.im@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
Message-ID: <20250119071131.4hepn6msmh76npi7@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-2-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116091150.1167739-2-quic_ziqichen@quicinc.com>

On Thu, Jan 16, 2025 at 05:11:42PM +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
> two freqs,

'amongst more than two freqs': I couldn't parse this.

> so just passing up/down to vops clk_scale_notify() is not enough
> to cover the intermediate clock freqs between the min and max freqs. Hence
> pass the target_freq to clk_scale_notify() to allow the vops to perform
> corresponding configurations with regard to the clock freqs.
> 

Add a note that the 'target_freq' is not used in this commit.

> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Signed-off-by tag order is not correct here. This implies that Ziqi originally
worked on it, then Can took over and submitted. But it seems the reverse.

- Mani

> ---
>  drivers/ufs/core/ufshcd-priv.h  | 7 ++++---
>  drivers/ufs/core/ufshcd.c       | 4 ++--
>  drivers/ufs/host/ufs-mediatek.c | 1 +
>  drivers/ufs/host/ufs-qcom.c     | 5 +++--
>  include/ufs/ufshcd.h            | 2 +-
>  5 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
> index 9ffd94ddf8c7..0549b65f71ed 100644
> --- a/drivers/ufs/core/ufshcd-priv.h
> +++ b/drivers/ufs/core/ufshcd-priv.h
> @@ -117,11 +117,12 @@ static inline u32 ufshcd_vops_get_ufs_hci_version(struct ufs_hba *hba)
>  	return ufshcd_readl(hba, REG_UFS_VERSION);
>  }
>  
> -static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba,
> -			bool up, enum ufs_notify_change_status status)
> +static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba, bool up,
> +					       unsigned long target_freq,
> +					       enum ufs_notify_change_status status)
>  {
>  	if (hba->vops && hba->vops->clk_scale_notify)
> -		return hba->vops->clk_scale_notify(hba, up, status);
> +		return hba->vops->clk_scale_notify(hba, up, target_freq, status);
>  	return 0;
>  }
>  
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index acc3607bbd9c..8d295cc827cc 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1157,7 +1157,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
>  	int ret = 0;
>  	ktime_t start = ktime_get();
>  
> -	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, PRE_CHANGE);
> +	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, PRE_CHANGE);
>  	if (ret)
>  		goto out;
>  
> @@ -1168,7 +1168,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
>  	if (ret)
>  		goto out;
>  
> -	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, POST_CHANGE);
> +	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, POST_CHANGE);
>  	if (ret) {
>  		if (hba->use_pm_opp)
>  			ufshcd_opp_set_rate(hba,
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index 135cd78109e2..977dd0caaef6 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -1643,6 +1643,7 @@ static void ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
>  }
>  
>  static int ufs_mtk_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> +				    unsigned long target_freq,
>  				    enum ufs_notify_change_status status)
>  {
>  	if (!ufshcd_is_clkscaling_supported(hba))
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 68040b2ab5f8..b6eef975dc46 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1333,8 +1333,9 @@ static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba)
>  	return ufs_qcom_set_core_clk_ctrl(hba, false);
>  }
>  
> -static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
> -		bool scale_up, enum ufs_notify_change_status status)
> +static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> +				     unsigned long target_freq,
> +				     enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	int err;
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index d7aca9e61684..a4dac897a169 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
>  	void    (*exit)(struct ufs_hba *);
>  	u32	(*get_ufs_hci_version)(struct ufs_hba *);
>  	int	(*set_dma_mask)(struct ufs_hba *);
> -	int	(*clk_scale_notify)(struct ufs_hba *, bool,
> +	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
>  				    enum ufs_notify_change_status);
>  	int	(*setup_clocks)(struct ufs_hba *, bool,
>  				enum ufs_notify_change_status);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

