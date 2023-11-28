Return-Path: <linux-arm-msm+bounces-2189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2F7FB17F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6368B2100B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 05:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3160110791;
	Tue, 28 Nov 2023 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="saHyu7lN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F0D27C;
	Tue, 28 Nov 2023 05:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E651C433C7;
	Tue, 28 Nov 2023 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701150338;
	bh=IpdDHxnNUn+Hb3z1l3qGEkObmpbHSBRfgo+SKmvwZ5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saHyu7lNp0b6woOoouZ9hk5wL7KbSDmevsLyOGFewWjonoTx9XL7yZUOr3kZaJIuE
	 pf1MKQAUh01DIwrJAKdq+TT5S82eQh4XMjgelEvAdpqmA+MmiXOSmgnnAnY2YBaE3E
	 mtne3FqO7JytprCHGNlTSCbr/NxNXdzYLunWhGs6bavezuC+SWT2Dcpkf1C1mtvDBa
	 dHk2m45LvUlOqd7Yokd0VsLc3OEGp+qYM8XLF/PNK2V/Q4JrASRf9OryqU5POR1Ufc
	 2zLAznk/aQZ8EYz7MuVD/plLW472lq1mi/YSFCLweWZeU5QzocihKimOryvwV50y+z
	 R45h6Bn8YhBKA==
Date: Tue, 28 Nov 2023 11:15:22 +0530
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
Subject: Re: [PATCH v5 04/10] scsi: ufs: ufs-qcom: Limit negotiated gear to
 selected PHY gear
Message-ID: <20231128054522.GF3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-5-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1700729190-17268-5-git-send-email-quic_cang@quicinc.com>

On Thu, Nov 23, 2023 at 12:46:24AM -0800, Can Guo wrote:
> In the dual init scenario, the initial PHY gear is set to HS-G2, and the
> first Power Mode Change (PMC) is meant to find the best matching PHY gear
> for the 2nd init. However, for the first PMC, if the negotiated gear (say
> HS-G4) is higher than the initial PHY gear, we cannot go ahead let PMC to
> the negotiated gear happen, because the programmed UFS PHY settings may not
> support the negotiated gear. Fix it by overwriting the negotiated gear with
> the PHY gear.
> 

I don't quite understand this patch. If the phy_gear is G2 initially and the
negotiated gear is G4, then as per this change,

phy_gear = G4;
negotiated gear = G2;

Could you please explain how this make sense?

- Mani

> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index cc0eb37..d4edf58 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -920,8 +920,13 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  		 * because, the PHY gear settings are backwards compatible and we only need to
>  		 * change the PHY gear settings while scaling to higher gears.
>  		 */
> -		if (dev_req_params->gear_tx > host->phy_gear)
> +		if (dev_req_params->gear_tx > host->phy_gear) {
> +			u32 old_phy_gear = host->phy_gear;
> +
>  			host->phy_gear = dev_req_params->gear_tx;
> +			dev_req_params->gear_tx = old_phy_gear;
> +			dev_req_params->gear_rx = old_phy_gear;
> +		}
>  
>  		/* enable the device ref clock before changing to HS mode */
>  		if (!ufshcd_is_hs_mode(&hba->pwr_info) &&
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

