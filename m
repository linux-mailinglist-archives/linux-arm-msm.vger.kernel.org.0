Return-Path: <linux-arm-msm+bounces-2263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603A27FB958
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9229F1C2121F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7A34F5F4;
	Tue, 28 Nov 2023 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoUKnOd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1284652D;
	Tue, 28 Nov 2023 11:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E45C433C8;
	Tue, 28 Nov 2023 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701170573;
	bh=WglVg4QTboxa3lShvbhgZWQpr4iJvJtH84sJvM8L2Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoUKnOd+WSY7zMaRmi6vpxO/0HINSs/K0kiokux3y/7OZyKEVGWUCkffSLUK9fGT2
	 aKQlGpy2IeZlZK3THoC3Nk69HdDRWqaaBbUthmrgs+dgpHBXwxE7yrH7UcDjCTKM5W
	 cM+igWMJ1Yk373hTLLdLkYx0YQ3sx96eP33DabCQf5SL90n47YKDdEPJbSpAk7iYiA
	 mhplZMp2agZtroYvsbq1ya7C6LMidw++F2jsVO6s26EtTDL4XZYaM+V9E4S5hKAqNG
	 uXWvrVNvHFlFINQxQ9dpj724nLWaL+mZOHAsgZtDg1pU3hbTApqtEcDdhLZt9QWv7f
	 M5q9JxujjV+Ow==
Date: Tue, 28 Nov 2023 16:52:43 +0530
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
Message-ID: <20231128112243.GT3088@thinkpad>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-8-git-send-email-quic_cang@quicinc.com>
 <20231128060046.GH3088@thinkpad>
 <d198f09b-6b5f-42de-9331-30c6d2a12b67@quicinc.com>
 <20231128105902.GP3088@thinkpad>
 <19e8a264-dc9f-4303-b5b4-f781b9fd0125@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19e8a264-dc9f-4303-b5b4-f781b9fd0125@quicinc.com>

On Tue, Nov 28, 2023 at 07:01:27PM +0800, Can Guo wrote:
> 
> 
> On 11/28/2023 6:59 PM, Manivannan Sadhasivam wrote:
> > On Tue, Nov 28, 2023 at 03:58:42PM +0800, Can Guo wrote:
> > > Hi Mani,
> > > 
> > > On 11/28/2023 2:00 PM, Manivannan Sadhasivam wrote:
> > > > On Thu, Nov 23, 2023 at 12:46:27AM -0800, Can Guo wrote:
> > > > > Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.
> > > > > 
> > > > 
> > > > MAX_GEAR will be used for hosts with hw_ver.major >= 4
> > > 
> > > I put it > 5 because I am not intent to touch any old targets which has
> > > proven working fine with starting with PHY gear HS_G2. If I put it >= 4,
> > > there would be many targets impacted by this change. I need to go back and
> > > test those platforms (HW ver == 4).
> > > 
> > 
> > This assumption will make the code hard to maintain. I think if you happen to
> > test it on atleast a couple of old targets it should be good since I do not see
> > how others can fail.
> 
> Point taken. I will put it >= 4 in next version and test it on platforms
> like SM8350 and SM8450.
> 

Appreciated, thanks!

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
> > > > > This patch is not changing any functionalities or logic but only a
> > > > > preparation patch for the next patch in this series.
> > > > > 
> > > > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > > > ---
> > > > >    drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
> > > > >    1 file changed, 15 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > > index 6756f8d..7bbccf4 100644
> > > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > > @@ -1067,6 +1067,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
> > > > >    		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
> > > > >    }
> > > > > +static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
> > > > > +{
> > > > > +	struct ufs_host_params *host_params = &host->host_params;
> > > > > +
> > > > > +	host->phy_gear = host_params->hs_tx_gear;
> > > > > +
> > > > > +	/*
> > > > > +	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> > > > > +	 * Switching to max gear will be performed during reinit if supported.
> > > > 
> > > > You need to reword this comment too.
> > > > 
> > > > > +	 */
> > > > > +	if (host->hw_ver.major < 0x5)
> > > > 
> > > > As I mentioned above, MAX_GEAR will be used if hw_ver.major is >=4 in
> > > > ufs_qcom_get_hs_gear(). So this check should be (< 0x4).
> > > > 
> > > > - Mani
> > > > 
> > > > > +		host->phy_gear = UFS_HS_G2;
> > > > > +}
> > > > > +
> > > > >    static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> > > > >    {
> > > > >    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > > > @@ -1303,6 +1317,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> > > > >    	ufs_qcom_set_caps(hba);
> > > > >    	ufs_qcom_advertise_quirks(hba);
> > > > >    	ufs_qcom_set_host_params(hba);
> > > > > +	ufs_qcom_set_phy_gear(host);
> > > > >    	err = ufs_qcom_ice_init(host);
> > > > >    	if (err)
> > > > > @@ -1320,12 +1335,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> > > > >    		dev_warn(dev, "%s: failed to configure the testbus %d\n",
> > > > >    				__func__, err);
> > > > > -	/*
> > > > > -	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> > > > > -	 * Switching to max gear will be performed during reinit if supported.
> > > > > -	 */
> > > > > -	host->phy_gear = UFS_HS_G2;
> > > > > -
> > > > >    	return 0;
> > > > >    out_variant_clear:
> > > > > -- 
> > > > > 2.7.4
> > > > > 
> > > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

