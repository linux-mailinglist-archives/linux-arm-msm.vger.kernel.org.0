Return-Path: <linux-arm-msm+bounces-45614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4BA16F70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA663AA05C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451441E9B27;
	Mon, 20 Jan 2025 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYh9Yrjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173017C68;
	Mon, 20 Jan 2025 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387710; cv=none; b=QpWw4sBb9puBLuDmVIrCSQF5wvPPCOxeRyzrLn8Zmfco/71/2aIUNU08E2J1n4mlw3kAdgR2bfCKbC4dE9BRE1lCzGlv0AT1xB2j2SL+L0P+1bYeJoTgO/tDcprkmmlK+ZStZMKszgvLJ8gh5/2Yh/pCcbbl4GkApt4VHnfOSCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387710; c=relaxed/simple;
	bh=HLDHizSBJBuDKpSc1jLQRo5tMMcBm24/Q+DGpwKcGMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7fk0eBbth9JO53LsAoJgnB0rKqeegVT7hhXbFyfLowFeoLipwILA/BJ6m+Snam1Mon2Yow1FNp85ZLbuGAFZ0r6cZbEcdVJfye/k+9hY9Kfwe3dUId69eYVmCM6JE+YChMhMXQqQfEwf9daUHqop6gtNd8uKMdI7mYNhf5b1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYh9Yrjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE37DC4CEDD;
	Mon, 20 Jan 2025 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737387709;
	bh=HLDHizSBJBuDKpSc1jLQRo5tMMcBm24/Q+DGpwKcGMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYh9YrjtV7onpWYaskgn8ukOky0WFCDXaey6oXU1kXTMDGjzlM2yVS3Bu28/R4LpE
	 bBzwk9ULGQcUt04vULGpIw6Y1U5WMhfFRIB5oSifLpc9a0TnGZixs35yjPqaT5KQGi
	 ZPJT4wqcTJ9EobT0u/9VYRr7vlCoimjXt6+6E1yZ5cTOex/U9Lf0NMVRikVRud3iH0
	 VsDd1wPchSXuFlgwKSkmJogoQUmVRT52B07X9TWqXjAh70+JMSLeQ8ko+ZHUbX1nQ0
	 X1qXcazgs2ndJDJ2JJwCdSwcXhfd70zsLhEmVpPSpjCsz3XxG04nDYvj/3DRAhPYXR
	 9jQ69hyrSD96g==
Date: Mon, 20 Jan 2025 21:11:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
Message-ID: <20250120154135.xhrrmy37xdr6asmu@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
 <20250119073056.houuz5xjyeen7nw5@thinkpad>
 <e0207040-bebd-4e59-abd8-dee16edcc5b9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0207040-bebd-4e59-abd8-dee16edcc5b9@quicinc.com>

On Mon, Jan 20, 2025 at 08:07:07PM +0800, Ziqi Chen wrote:
> Hi Mani，
> 
> Thanks for your comments~
> 
> On 1/19/2025 3:30 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jan 16, 2025 at 05:11:45PM +0800, Ziqi Chen wrote:
> > > From: Can Guo <quic_cang@quicinc.com>
> > > 
> > > Implement the freq_to_gear_speed() vops to map the unipro core clock
> > > frequency to the corresponding maximum supported gear speed.
> > > 
> > > Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > ---
> > >   drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
> > >   1 file changed, 32 insertions(+)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index 1e8a23eb8c13..64263fa884f5 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
> > >   	return ret;
> > >   }
> > > +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
> > > +{
> > > +	int ret = 0 >
> > Please do not initialize ret with 0. Return the actual value directly.
> > 
> 
> If we don't initialize ret here, for the cases of freq matched in the table,
> it will return an unknown ret value. It is not make sense, right?
> 
> Or you may want to say we don't need “ret” , just need to return gear value?
> But we need this "ret" to check whether the freq is invalid.
> 

I meant to say that you can just return 0 directly in success case and -EINVAL
in the case of error.

> > > +
> > > +	switch (freq) {
> > > +	case 403000000:
> > > +		*gear = UFS_HS_G5;
> > > +		break;
> > > +	case 300000000:
> > > +		*gear = UFS_HS_G4;
> > > +		break;
> > > +	case 201500000:
> > > +		*gear = UFS_HS_G3;
> > > +		break;
> > > +	case 150000000:
> > > +	case 100000000:
> > > +		*gear = UFS_HS_G2;
> > > +		break;
> > > +	case 75000000:
> > > +	case 37500000:
> > > +		*gear = UFS_HS_G1;
> > > +		break;
> > > +	default:
> > > +		ret = -EINVAL;
> > > +		dev_err(hba->dev, "Unsupported clock freq\n");
> > 
> > Print the freq.
> 
> Ok, thank for your suggestion, we can print freq with dev_dbg() in next
> version.
> 

No, use dev_err() with the freq.

- Mani 

-- 
மணிவண்ணன் சதாசிவம்

