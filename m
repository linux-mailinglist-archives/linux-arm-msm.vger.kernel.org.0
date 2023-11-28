Return-Path: <linux-arm-msm+bounces-2264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDA7FB95F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398C02821AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C054B4F5F4;
	Tue, 28 Nov 2023 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCmNuBi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12084F5F1;
	Tue, 28 Nov 2023 11:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36231C433C8;
	Tue, 28 Nov 2023 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701170679;
	bh=IsNn+ClgvkZ4uETCGvuIForgy3jvNsLeqUnXrX0XuV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCmNuBi1q7zW0CbjVsoOuWVtQzzGwuXlPKHnOE7o7cFo3lHpuDDHUQHlT8A6qYUZu
	 ThI+045PVpaG57yYVqFKBxRA7FB/bkn9kjc2GlmWcP8q0U45AkNTKRdPoNkaM2srAJ
	 6c8pomjEvMzsvZWY4zG/cFhLbU6oc88VQhianOZMQEZLDC04mWHP+mrTRPMDCvEIwA
	 3FMj4mja4ZiEzdZ6thgqm2XTYLoJtF0ZVVi2zS6nJQdRy/1qx/WajBeX4CfchHTLlG
	 heu2ClC6A+ryTfAZJWf6jWpVcE0LMdsY4nKGKDPzM6aioCbw5tBSj4GnsWW1uRqZsM
	 fiE7KxIfNLqHg==
Date: Tue, 28 Nov 2023 16:54:09 +0530
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
Subject: Re: [PATCH v5 06/10] scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to
 hosts with HW version 5
Message-ID: <20231128112409.GU3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-7-git-send-email-quic_cang@quicinc.com>
 <20231128055520.GG3088@thinkpad>
 <4648b6a0-92cb-4411-9b58-03219962505d@quicinc.com>
 <20231128105506.GO3088@thinkpad>
 <46b24613-cffc-4a87-9232-8b93e09906f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46b24613-cffc-4a87-9232-8b93e09906f1@quicinc.com>

On Tue, Nov 28, 2023 at 06:59:39PM +0800, Can Guo wrote:
> 
> 
> On 11/28/2023 6:55 PM, Manivannan Sadhasivam wrote:
> > On Tue, Nov 28, 2023 at 03:48:02PM +0800, Can Guo wrote:
> > > Hi Mani,
> > > 
> > > On 11/28/2023 1:55 PM, Manivannan Sadhasivam wrote:
> > > > On Thu, Nov 23, 2023 at 12:46:26AM -0800, Can Guo wrote:
> > > > > Qcom UFS hosts, with HW ver 5, can only support up to HS-G5 Rate-A due to
> > > > > HW limitations. If the HS-G5 PHY gear is used, update host_params->hs_rate
> > > > > to Rate-A, so that the subsequent power mode changes shall stick to Rate-A.
> > > > > 
> > > > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > > 
> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > 
> > > > One question below...
> > > > 
> > > > > ---
> > > > >    drivers/ufs/host/ufs-qcom.c | 18 +++++++++++++++++-
> > > > >    1 file changed, 17 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > > index 9613ad9..6756f8d 100644
> > > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > > @@ -442,9 +442,25 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
> > > > >    static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> > > > >    {
> > > > >    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > > > +	struct ufs_host_params *host_params = &host->host_params;
> > > > >    	struct phy *phy = host->generic_phy;
> > > > > +	enum phy_mode mode;
> > > > >    	int ret;
> > > > > +	/*
> > > > > +	 * HW ver 5 can only support up to HS-G5 Rate-A due to HW limitations.
> > > > > +	 * If the HS-G5 PHY gear is used, update host_params->hs_rate to Rate-A,
> > > > > +	 * so that the subsequent power mode change shall stick to Rate-A.
> > > > > +	 */
> > > > > +	if (host->hw_ver.major == 0x5) {
> > > > > +		if (host->phy_gear == UFS_HS_G5)
> > > > > +			host_params->hs_rate = PA_HS_MODE_A;
> > > > > +		else
> > > > > +			host_params->hs_rate = PA_HS_MODE_B;
> > > > 
> > > > Is this 'else' part really needed? Since there wouldn't be any 2nd init, I think
> > > > we can skip that.
> > > 
> > > We need it because, even there is only one init, if a UFS3.1 device is
> > > attached, phy_gear is given as UFS_HS_G4 in ufs_qcom_set_phy_gear(), hence
> > > we need to put the UFS at HS-G4 Rate B, not Rate A.
> > > 
> > 
> > But the default hs_rate is PA_HS_MODE_B only and the else condition would be not
> > needed for the 1st init.
> 
> You are right, but still we need this in case the UFS device version is not
> populated, meaning dual init can also happen to SM8550. We need to apply the
> right hs_rate in case the 2nd init asks for HS_G4.
> 

Hmm, yeah I missed that corner case. This is fine.

- Mani

> Thanks,
> Can Guo.
> 
> > 
> > - Mani
> > 
> > > Thanks,
> > > Can Guo.
> > > 
> > > > 
> > > > - Mani
> > > > 
> > > > > +	}
> > > > > +
> > > > > +	mode = host_params->hs_rate == PA_HS_MODE_B ? PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
> > > > > +
> > > > >    	/* Reset UFS Host Controller and PHY */
> > > > >    	ret = ufs_qcom_host_reset(hba);
> > > > >    	if (ret)
> > > > > @@ -459,7 +475,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> > > > >    		return ret;
> > > > >    	}
> > > > > -	phy_set_mode_ext(phy, PHY_MODE_UFS_HS_B, host->phy_gear);
> > > > > +	phy_set_mode_ext(phy, mode, host->phy_gear);
> > > > >    	/* power on phy - start serdes and phy's power and clocks */
> > > > >    	ret = phy_power_on(phy);
> > > > > -- 
> > > > > 2.7.4
> > > > > 
> > > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

