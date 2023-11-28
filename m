Return-Path: <linux-arm-msm+bounces-2265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B857FB969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841A6282A9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F9C4F5FE;
	Tue, 28 Nov 2023 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQ9fog7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536A4F5F4;
	Tue, 28 Nov 2023 11:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8835C433C7;
	Tue, 28 Nov 2023 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701170861;
	bh=B/yIJwxLaAT5R+A6b54U5ynQZIauIfWW6wfH2GeGYOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQ9fog7fgQPvyo6YamBdjTQIaFyIbBgPOndM0nhoIRfGIiMmC8WrLEhQvhnCS0QN2
	 QSm3tH0BUAoZ/L99xiBkw4FurCM3Hzqa7BmV8TvAbgVUBa0Co10LGM8UrQ7sRGH9NK
	 W6pszD10ZSyu3bmUx06Lm7rRLpd43MxyYFttVQ+mKq7EtBa4pxDTrXQkVJiYTO9EfN
	 XgIoEBd7Ih0And8QXM4ursYTyw0wENYnqw0JwgXOZjv7La5tnJ/B4G6ZKWgy7gPLvW
	 a2fO87YUdYPYAH18baKyMhpmdPhzrQJE0y4O/ldjFDHfvHdFoXsGlYkyUvyAOFeJ6N
	 pWJgn0s4iP15w==
Date: Tue, 28 Nov 2023 16:57:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: Can Guo <quic_cang@quicinc.com>, quic_asutoshd@quicinc.com,
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
Message-ID: <20231128112731.GV3088@thinkpad>
References: <1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com>
 <20231025074128.GA3648@thinkpad>
 <85d7a1ef-92c4-49ae-afe0-727c1b446f55@quicinc.com>
 <c6a72c38-aa63-79b8-c784-d753749f7272@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6a72c38-aa63-79b8-c784-d753749f7272@quicinc.com>

On Tue, Nov 28, 2023 at 03:40:57AM +0800, Ziqi Chen wrote:
> 
> 
> On 11/22/2023 2:14 PM, Can Guo wrote:
> > 
> > 
> > On 10/25/2023 3:41 PM, Manivannan Sadhasivam wrote:
> > > On Tue, Oct 24, 2023 at 07:10:15PM +0800, Ziqi Chen wrote:
> > > > During PISI test, we found the issue that host Tx still bursting after
> > > 
> > > What is PISI test?
> 
> SI measurement.
> 

Please expand it in the patch description.

> > > 
> > > > H/W reset. Move ufs_qcom_host_reset() to ufs_qcom_device_reset() and
> > > > reset host before device reset to stop tx burst.
> > > > 
> > > 
> > > device_reset() callback is supposed to reset only the device and not
> > > the host.
> > > So NACK for this patch.
> > 
> > Agree, the change should come in a more reasonable way.
> > 
> > Actually, similar code is already there in ufs_mtk_device_reset() in
> > ufs-mediatek.c, I guess here is trying to mimic that fashion.
> > 
> > This change, from its functionality point of view, we do need it,
> > because I occasionally (2 out of 10) hit PHY error on lane 0 during
> > reboot test (in my case, I tried SM8350, SM8450 and SM8550， all same).
> > 
> > [    1.911188] [DEBUG]ufshcd_update_uic_error: UECPA:0x80000002
> > [    1.922843] [DEBUG]ufshcd_update_uic_error: UECDL:0x80004000
> > [    1.934473] [DEBUG]ufshcd_update_uic_error: UECN:0x0
> > [    1.944688] [DEBUG]ufshcd_update_uic_error: UECT:0x0
> > [    1.954901] [DEBUG]ufshcd_update_uic_error: UECDME:0x0
> > 
> > I found out that the PHY error pops out right after UFS device gets
> > reset in the 2nd init. After having this change in place, the PA/DL
> > errors are gone.
> 
> Hi Mani,
> 
> There is another way that adding a new vops that call XXX_host_reset() from
> soc vendor driver. in this way, we can call this vops in core layer without
> the dependency of device reset.
> due to we already observed such error and received many same reports from
> different OEMs, we need to fix it in some way.
> if you think above way is available, I will update new patch in soon. Or
> could you give us other suggestion?
> 

First, please describe the issue in detail. How the issue is getting triggered
and then justify your change. I do not have access to the bug reports that you
received.

- Mani

> -Ziqi
> 
> > 
> > Thanks,
> > Can Guo.
> > > 
> > > - Mani
> > > 
> > > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > > ---
> > > >   drivers/ufs/host/ufs-qcom.c | 13 +++++++------
> > > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > index 96cb8b5..43163d3 100644
> > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > @@ -445,12 +445,6 @@ static int
> > > > ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> > > >       struct phy *phy = host->generic_phy;
> > > >       int ret;
> > > > -    /* Reset UFS Host Controller and PHY */
> > > > -    ret = ufs_qcom_host_reset(hba);
> > > > -    if (ret)
> > > > -        dev_warn(hba->dev, "%s: host reset returned %d\n",
> > > > -                  __func__, ret);
> > > > -
> > > >       /* phy initialization - calibrate the phy */
> > > >       ret = phy_init(phy);
> > > >       if (ret) {
> > > > @@ -1709,6 +1703,13 @@ static void ufs_qcom_dump_dbg_regs(struct
> > > > ufs_hba *hba)
> > > >   static int ufs_qcom_device_reset(struct ufs_hba *hba)
> > > >   {
> > > >       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > > +    int ret = 0;
> > > > +
> > > > +    /* Reset UFS Host Controller and PHY */
> > > > +    ret = ufs_qcom_host_reset(hba);
> > > > +    if (ret)
> > > > +        dev_warn(hba->dev, "%s: host reset returned %d\n",
> > > > +                  __func__, ret);
> > > >       /* reset gpio is optional */
> > > >       if (!host->device_reset)
> > > > -- 
> > > > 2.7.4
> > > > 
> > > 

-- 
மணிவண்ணன் சதாசிவம்

