Return-Path: <linux-arm-msm+bounces-2651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 228567FE98B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 08:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5094A1C20911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 07:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7181DA42;
	Thu, 30 Nov 2023 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/Q2h0Q1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15117991;
	Thu, 30 Nov 2023 07:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD8DC433C8;
	Thu, 30 Nov 2023 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701328587;
	bh=lLUoztCwhCN/7/8toyFFX0k88uIj2NbfdQ4XFG2xYLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/Q2h0Q1LvPmphRQaScbts6BBRVynUgqRHZqnMk1DnUdOuUEZRaPZhfmyK8OFXhDw
	 NNlUoQt+7UprWXvvbM72uOjGo3t9tHxBi8UQaMnnBg5w6yZ01WfNo7z1Be92I6IA3a
	 OHQ2ltXTceVJe1VsqXqsp50ZmE0y6yOR0O2P6GCAMKidm7V9WC6sSlj7R38VO3NFqd
	 kwXeJ+Vm55EnewENCo9RsPQaD5H02ZtVjf0gpGrqJPJJRVCDU18BLiZkrSHdFxV5qz
	 STEK0uuvT6Bl6yy+gLit23uLBdRAUy2J5BfdT9vh7ifz++lxzqAVv7toJ3s/3/JkC7
	 vZC+v5nOGPKdg==
Date: Thu, 30 Nov 2023 12:46:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, adrian.hunter@intel.com, cmd4@qualcomm.com,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/10] scsi: ufs: ufs-qcom: Check return value of
 phy_set_mode_ext()
Message-ID: <20231130071617.GH3043@thinkpad>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-10-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1701246516-11626-10-git-send-email-quic_cang@quicinc.com>

On Wed, Nov 29, 2023 at 12:28:34AM -0800, Can Guo wrote:
> In ufs_qcom_power_up_sequence(), check return value of phy_set_mode_ext()
> and stop proceeding if phy_set_mode_ext() fails.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 30f4ca6..9c0ebbc 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -475,7 +475,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		return ret;
>  	}
>  
> -	phy_set_mode_ext(phy, mode, host->phy_gear);
> +	ret = phy_set_mode_ext(phy, mode, host->phy_gear);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: phy set mode failed, ret = %d\n",
> +			__func__, ret);

No need to print the error message here as it is already done in the PHY driver.

Also, this patch should come before the PHY patch returning error.

- Mani

> +		goto out_disable_phy;
> +	}
>  
>  	/* power on phy - start serdes and phy's power and clocks */
>  	ret = phy_power_on(phy);
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

