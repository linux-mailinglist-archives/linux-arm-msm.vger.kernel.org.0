Return-Path: <linux-arm-msm+bounces-55148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E49A98C0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1F01B804A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CC21A727D;
	Wed, 23 Apr 2025 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo+4qxsF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC81A3161;
	Wed, 23 Apr 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416580; cv=none; b=NWjheYi6WmQg394E3WLrBSNPHAqY7g+SdKVNvAkEvazx2PcimLzPQWJqX2ONLp24OycwnlE3CvtkwOq7GJANV2D1Ahz7ruAvnBTfdpROkpS9705evE6jl6s3EbuxGN3GuNfoosm3Zx5RelqaGnBXEDo79PmAsp+dEkvzhVlJSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416580; c=relaxed/simple;
	bh=TLNo+cEr9a5ZaMfW1syRuCKSQsHU8Gj546QRb+xgVrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRSCABhg3Tc0rHlg8nkI4cwnQtphYzNUGF7bbamaEY3F1ldsLFuc3DLEK2EOt3+sGvJho0KFUHajIWvr5f7J15uT0idchyK6dRx4CDr5hkdyVVJv9wSRAUxtmY8hVNNJGKg/yB2uGPfwtBk1aRw2Fon2xgiwx71tXfqZ9p97+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo+4qxsF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1D6C4CEE2;
	Wed, 23 Apr 2025 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745416579;
	bh=TLNo+cEr9a5ZaMfW1syRuCKSQsHU8Gj546QRb+xgVrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo+4qxsF6nP7HbesDNMloUvlp5AnUsCJmOmU5XTAJxhlZgTUXLnI+nR2n81HBU0cd
	 EsKhcl0iyzecjZHxg1PSe/cRyIRE9BCrILh9wYu9X7b62e5+qB2x9C9p5p9Xw31spt
	 JR7i+DGelkQMFpo7vAjjVTkbhJF30g5km5k1IjvC7FHz5p8f9j8jEduo6cO2RV9nk+
	 MB422YGaYHw6tu4h1sAcLQnh0Uk/pk6pGGiUzQKvU91wPLxYT7WDOVdSOfU2vrzJeT
	 A2nfMox06SpE2u3i5dUR5wMM92CvtwN/Gy5sK5WmPgAV/28DdFPuT9gcWXGQ8OvbuZ
	 enxzzqqRc8A7w==
Date: Wed, 23 Apr 2025 08:56:17 -0500
From: Rob Herring <robh@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
	krzk+dt@kernel.org, mani@kernel.org, conor+dt@kernel.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	beanhuo@micron.com, peter.wang@mediatek.com,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
Message-ID: <20250423135617.GA227946-robh@kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-4-quic_nitirawa@quicinc.com>
 <20250422124546.GB896279-robh@kernel.org>
 <06c6c892-c597-4d1f-9d28-52455d6471f9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06c6c892-c597-4d1f-9d28-52455d6471f9@quicinc.com>

On Wed, Apr 23, 2025 at 01:14:27AM +0530, Nitin Rawat wrote:
> 
> 
> On 4/22/2025 6:15 PM, Rob Herring wrote:
> > On Thu, Apr 17, 2025 at 06:16:45PM +0530, Nitin Rawat wrote:
> > > There are emulation FPGA platforms or other platforms where UFS low
> > > power mode is either unsupported or power efficiency is not a critical
> > > requirement.
> > > 
> > > Disable all low power mode UFS feature based on the "disable-lpm" device
> > > tree property parsed in platform driver.
> > > 
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > ---
> > >   drivers/ufs/host/ufs-qcom.c | 15 ++++++++-------
> > >   1 file changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index 1b37449fbffc..1024edf36b68 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -1014,13 +1014,14 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
> > > 
> > >   static void ufs_qcom_set_caps(struct ufs_hba *hba)
> > >   {
> > > -	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> > > -	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
> > > -	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
> > > -	hba->caps |= UFSHCD_CAP_WB_EN;
> > > -	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
> > > -	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> > > -
> > > +	if (!hba->disable_lpm) {
> > > +		hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> > > +		hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
> > > +		hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
> > > +		hba->caps |= UFSHCD_CAP_WB_EN;
> > > +		hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
> > > +		hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> > > +	}
> > 
> > Doesn't RuntimePM already have userspace controls? And that's a Linux
> > feature that shouldn't really be controlled by DT. I think this property
> > should still to things defined by the UFS spec.
> 
> Hi Rob,
> Yes userspace has runtime PM control but by the time UFS driver probes
> completes and userspace is up, there are chances runtime PM may get kicked
> in.

That sounds like a problem more than 1 device would have...

Rob

