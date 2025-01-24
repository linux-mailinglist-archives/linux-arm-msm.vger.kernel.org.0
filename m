Return-Path: <linux-arm-msm+bounces-46026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43360A1AFEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 06:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28E73AEB6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 05:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470A813A879;
	Fri, 24 Jan 2025 05:35:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504B17FE;
	Fri, 24 Jan 2025 05:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737696938; cv=none; b=Gs9rDiPEwzvSvyXu3NLkzfGxg1nq9RqKLgt8YExi19QZJcATmTL6GulgRJ0XZ4mlr5QFkqiAujv/TGsWHqX+shbLlD3VSlxiNboqO3O8crTd1tWpOHO0eVZ2OtmrKIdO+U9zW8RITA+YKDFe9EvT6qSVMbdPMOCOUEuzCtM73iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737696938; c=relaxed/simple;
	bh=LD259O69EjZIwR7GKds0hX/13kux6dbH6gMPQnv4gcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEQZGFkcCTWo1Ah6bJ7+0FZE8D4EJT34bI8jkwgnPB8JrWHkY6g0wLB+0PrAJnMo5LtBJzX9sYRiMJeJH+CfIo2/qNBuOp5qqgKfVCEr+7iddpqCaIoCormQMFQIdjItnjyq+H8Y7Gus7F9Q2OFeKmJiqImY+vgbZRQwkibTCIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3993C4CED2;
	Fri, 24 Jan 2025 05:35:32 +0000 (UTC)
Date: Fri, 24 Jan 2025 11:05:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, quic_cang@quicinc.com,
	bvanassche@acm.org, beanhuo@micron.com, avri.altman@wdc.com,
	junwoo80.lee@samsung.com, martin.petersen@oracle.com,
	quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com, linux-scsi@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
Message-ID: <20250124053525.2sbefy4jitmzr6so@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
 <20250119073056.houuz5xjyeen7nw5@thinkpad>
 <e0207040-bebd-4e59-abd8-dee16edcc5b9@quicinc.com>
 <20250120154135.xhrrmy37xdr6asmu@thinkpad>
 <12f4234b-91ca-48e2-8638-771acc15a7be@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12f4234b-91ca-48e2-8638-771acc15a7be@quicinc.com>

On Tue, Jan 21, 2025 at 11:52:42AM +0800, Ziqi Chen wrote:
> 
> 
> On 1/20/2025 11:41 PM, Manivannan Sadhasivam wrote:
> > On Mon, Jan 20, 2025 at 08:07:07PM +0800, Ziqi Chen wrote:
> > > Hi Mani，
> > > 
> > > Thanks for your comments~
> > > 
> > > On 1/19/2025 3:30 PM, Manivannan Sadhasivam wrote:
> > > > On Thu, Jan 16, 2025 at 05:11:45PM +0800, Ziqi Chen wrote:
> > > > > From: Can Guo <quic_cang@quicinc.com>
> > > > > 
> > > > > Implement the freq_to_gear_speed() vops to map the unipro core clock
> > > > > frequency to the corresponding maximum supported gear speed.
> > > > > 
> > > > > Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > > > ---
> > > > >    drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 32 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > > index 1e8a23eb8c13..64263fa884f5 100644
> > > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > > @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
> > > > >    	return ret;
> > > > >    }
> > > > > +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
> > > > > +{
> > > > > +	int ret = 0 >
> > > > Please do not initialize ret with 0. Return the actual value directly.
> > > > 
> > > 
> > > If we don't initialize ret here, for the cases of freq matched in the table,
> > > it will return an unknown ret value. It is not make sense, right?
> > > 
> > > Or you may want to say we don't need “ret” , just need to return gear value?
> > > But we need this "ret" to check whether the freq is invalid.
> > > 
> > 
> > I meant to say that you can just return 0 directly in success case and -EINVAL
> > in the case of error.
> > 
> Hi Mani,
> 
> If we don't print freq here , I think your suggestion is very good. If we
> print freq in this function , using "ret" to indicate success case and
> failure case and print freq an the end of this function is the way to avoid
> code bloat.
> 
> How do you think about it?
> 

I don't understand how code bloat comes into picture here. I'm just asking for
this:

static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
{
	switch (freq) {
	case 403000000:
		*gear = UFS_HS_G5;
		break;
	...

	default:
		dev_err(hba->dev, "Unsupported clock freq: %ld\n", freq);
		return -EINVAL;
	}
	
	return 0;
}

> > > > > +
> > > > > +	switch (freq) {
> > > > > +	case 403000000:
> > > > > +		*gear = UFS_HS_G5;
> > > > > +		break;
> > > > > +	case 300000000:
> > > > > +		*gear = UFS_HS_G4;
> > > > > +		break;
> > > > > +	case 201500000:
> > > > > +		*gear = UFS_HS_G3;
> > > > > +		break;
> > > > > +	case 150000000:
> > > > > +	case 100000000:
> > > > > +		*gear = UFS_HS_G2;
> > > > > +		break;
> > > > > +	case 75000000:
> > > > > +	case 37500000:
> > > > > +		*gear = UFS_HS_G1;
> > > > > +		break;
> > > > > +	default:
> > > > > +		ret = -EINVAL;
> > > > > +		dev_err(hba->dev, "Unsupported clock freq\n");
> > > > 
> > > > Print the freq.
> > > 
> > > Ok, thank for your suggestion, we can print freq with dev_dbg() in next
> > > version.
> > > 
> > 
> > No, use dev_err() with the freq. >
> > - Mani
> > 
> I think use dev_err() here does not make sense:
> 
> 1. This print is not an error message , just an information print. Using
> dev_err() reduces the readability of this code.

Then why it was dev_err() in the first place?

> 2. This prints will be print very frequent, I afraid it will increase the
> latency of clock scaling.
> 

First you need to decide whether this print should warn user or not. It is
telling users that the OPP table supplied a frequency that doesn't match the
gear speed. This can happen if there is a discrepancy between DT and the driver.
In that case, the users *should* be warned to fix the driver/DT. If you bury it
with dev_dbg(), no one will notice it.

If your concern is with the frequency of logs, then use dev_err_ratelimited().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

