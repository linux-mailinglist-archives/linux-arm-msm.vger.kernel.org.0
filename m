Return-Path: <linux-arm-msm+bounces-2260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40B7FB933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48E16282A13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20F54F5E9;
	Tue, 28 Nov 2023 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZNdqWOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B26134AE;
	Tue, 28 Nov 2023 11:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568CBC433C7;
	Tue, 28 Nov 2023 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701170142;
	bh=3+j71CuhjAOePD46bT+Oifrh9ykcPU2RFbLXXeRFQys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZNdqWOh6qU+ZW25NoVDR0ho+3PC8J3JfEp9d+h766C2jbGpO5HIcLr6YeQ0g875U
	 xPFXxdB13sTGHFWZOZDKxFUqZtN8xVGKLLnMalBzIdomBJ0X9klYxzCt223iI74Y0f
	 d+07Tg31Jg5TODNX0V54OQNBF+CGfBC0ppetifmnZWxu9Hfde84vdYYsYPnRSp2PiY
	 R+2+uI0enCq8TAZ4Xyaf5/NOGjVJ5obgM04WQfKcx+HBXIzlZP7YteB1/F4bP5Ad8k
	 qQBKajWstbNG99FyIHBOWU+LuIKGROsMBCMQj0hOnG90h+c2em5TOlbfgpV8S7l7li
	 SMSKHgYBeX7bw==
Date: Tue, 28 Nov 2023 16:45:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_asutoshd@quicinc.com,
	bvanassche@acm.org, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com, linux-scsi@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scsi: ufs: qcom: move ufs_qcom_host_reset() to
 ufs_qcom_device_reset()
Message-ID: <20231128111528.GR3088@thinkpad>
References: <1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com>
 <20231025074128.GA3648@thinkpad>
 <85d7a1ef-92c4-49ae-afe0-727c1b446f55@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85d7a1ef-92c4-49ae-afe0-727c1b446f55@quicinc.com>

On Wed, Nov 22, 2023 at 02:14:57PM +0800, Can Guo wrote:
> 
> 
> On 10/25/2023 3:41 PM, Manivannan Sadhasivam wrote:
> > On Tue, Oct 24, 2023 at 07:10:15PM +0800, Ziqi Chen wrote:
> > > During PISI test, we found the issue that host Tx still bursting after
> > 
> > What is PISI test?
> > 
> > > H/W reset. Move ufs_qcom_host_reset() to ufs_qcom_device_reset() and
> > > reset host before device reset to stop tx burst.
> > > 
> > 
> > device_reset() callback is supposed to reset only the device and not the host.
> > So NACK for this patch.
> 
> Agree, the change should come in a more reasonable way.
> 
> Actually, similar code is already there in ufs_mtk_device_reset() in
> ufs-mediatek.c, I guess here is trying to mimic that fashion.
> 
> This change, from its functionality point of view, we do need it, because I
> occasionally (2 out of 10) hit PHY error on lane 0 during reboot test (in my
> case, I tried SM8350, SM8450 and SM8550， all same).
> 

I do not suspect the intention of this patch, but I do not like the way how it
is being done. Even if the reset has to be moved, the patch description should
describe how it fixes the issue.

- Mani

> [    1.911188] [DEBUG]ufshcd_update_uic_error: UECPA:0x80000002
> [    1.922843] [DEBUG]ufshcd_update_uic_error: UECDL:0x80004000
> [    1.934473] [DEBUG]ufshcd_update_uic_error: UECN:0x0
> [    1.944688] [DEBUG]ufshcd_update_uic_error: UECT:0x0
> [    1.954901] [DEBUG]ufshcd_update_uic_error: UECDME:0x0
> 
> I found out that the PHY error pops out right after UFS device gets reset in
> the 2nd init. After having this change in place, the PA/DL errors are gone.
> 
> Thanks,
> Can Guo.
> > 
> > - Mani
> > 
> > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > ---
> > >   drivers/ufs/host/ufs-qcom.c | 13 +++++++------
> > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index 96cb8b5..43163d3 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -445,12 +445,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> > >   	struct phy *phy = host->generic_phy;
> > >   	int ret;
> > > -	/* Reset UFS Host Controller and PHY */
> > > -	ret = ufs_qcom_host_reset(hba);
> > > -	if (ret)
> > > -		dev_warn(hba->dev, "%s: host reset returned %d\n",
> > > -				  __func__, ret);
> > > -
> > >   	/* phy initialization - calibrate the phy */
> > >   	ret = phy_init(phy);
> > >   	if (ret) {
> > > @@ -1709,6 +1703,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
> > >   static int ufs_qcom_device_reset(struct ufs_hba *hba)
> > >   {
> > >   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > +	int ret = 0;
> > > +
> > > +	/* Reset UFS Host Controller and PHY */
> > > +	ret = ufs_qcom_host_reset(hba);
> > > +	if (ret)
> > > +		dev_warn(hba->dev, "%s: host reset returned %d\n",
> > > +				  __func__, ret);
> > >   	/* reset gpio is optional */
> > >   	if (!host->device_reset)
> > > -- 
> > > 2.7.4
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

