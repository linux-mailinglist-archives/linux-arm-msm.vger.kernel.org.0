Return-Path: <linux-arm-msm+bounces-61560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37971ADC602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8926D189888A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AF828DB46;
	Tue, 17 Jun 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXjOG/DR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15123B601;
	Tue, 17 Jun 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151978; cv=none; b=WBk2Bl3BkSyl5QfXCeBw5aOEMItVd+ivPRzyBKeQYkweBnGZI/DB2I1Z1g9pRYuMsPPGmyLJYAun9ZZ4qOeN4tFKiNpvjcL8QcmD8RBpFtAJGcOFLKXd4pvISa+a9ZdETPwJyb9FN8R/ckCZ1py97xgbBEqGjjCYYK+IbZXIpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151978; c=relaxed/simple;
	bh=4KUYIV6SZlEja+Pg1akvLLX7vi5cpb/CJh39gaHB/dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/mr6t4quzxznLITP7On4CJw6RsFwaecAwDEgB9E83wViySCRBU9verleFnn11i3cXzwaBulv1KH3bHg4QNkk2jZNlTSy5iiW7HeZr/6aaTz3HTLz8bRW4IvTEXu67YdEIeo0Hq/bj048F5QTB4epiHFX1X55+ruvOboYqZdjuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXjOG/DR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7552DC4CEE3;
	Tue, 17 Jun 2025 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151977;
	bh=4KUYIV6SZlEja+Pg1akvLLX7vi5cpb/CJh39gaHB/dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXjOG/DRrQEwqXPdzif6cWhErEsTTfQZtVq2RMLAmyxozUWlUs4m4DmZLrHB//CUs
	 AsEQx3UzDzro7hwMDSuuBaLRCAJi4aSMzkVPP9YdO2b28MsDUMrSlNNqtjmvCvx09+
	 P4k6RP074fKZkwC7n/vw5swJBthCk6RUlLp1Rft6haNLawa4eFiFp1GDdIaUh3ytNO
	 c73VVZMYcv+GLdl6uI12odB7gmIeXBr8RwV1ogc82EOWMp1yoE/hVnlxBA2VtwrLSt
	 MKEEBx6VQHsfhQjujA3CmK58xEpDgpEQ6Ya5QE6HxnXwCaIOTUypQFj3YfnP7ovx7C
	 m2JrXYgvHDekw==
Date: Tue, 17 Jun 2025 14:49:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com, 
	Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
 <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>

On Fri, Jun 06, 2025 at 12:53:33AM -0700, Qiang Yu wrote:
> On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > 
> > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > > unable to process this non-standard ELF format and therefore require
> > > special handling during image loading.
> > > 
> > 
> > What are those "some devices"? Why are they not able to process this format
> 
> Eg. QCC2072

Is it a new kind of WLAN chipset using the ath12k driver?

> 
> > which is used across the rest of the Qcom devices?
> 
> These devices include TME-L (Trust Management Engine Lite).
> Currently, the FBC image is a non-standard ELF file containing an ELF
> header followed by segments for SBL and WLAN firmware. The ELF header and
> SBL segment within the first 512KB are loaded via BHI, while the full FBC
> image is loaded via BHIe.
> 
> Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
> processed, as it does not conform to the standard ELF format. 

Okay. These information should be part of the patch description.

> > 
> > > Add standard_elf_image flag to determine whether the device can process
> > > the non-standard ELF format. If this flag is set, a standard ELF image
> > > must be loaded, meaning the first 512 KB of the FBC image should be
> > > skipped when loading the AMSS image over the BHIe interface.
> > 
> > Please explain what is present in the first 512KiB and why skipping that is
> > required.
> 
> ELF header and SBL segment are in the first 512KiB.
> 
> New FBC image format adds second ELF header in the start of WLAN FW
> segment on top of current format. After loading SBL, second ELF header
> and WLAN FW segment is loaded using BHIe.
> > 
> > > Note that
> > > this flag does not affect the SBL image download process.
> > > 
> > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - V1 patch is paused because of no user. WLAN team plan to add support for
> > >   new WLAN chip that requires this patch, so send v2.
> > > - Change author and SOB with new mail address.
> > > - Reword commit message.
> > > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > > ---
> > >  drivers/bus/mhi/host/boot.c | 7 +++++++
> > >  include/linux/mhi.h         | 4 ++++
> > >  2 files changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > > --- a/drivers/bus/mhi/host/boot.c
> > > +++ b/drivers/bus/mhi/host/boot.c
> > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > >  	 * device transitioning into MHI READY state
> > >  	 */
> > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > 
> > This print is just a noise even for debug.
> 
> Will drop it.
> 
> > 
> > > +		if (mhi_cntrl->standard_elf_image) {
> > > +			fw_data += mhi_cntrl->sbl_size;
> > > +			fw_sz -= mhi_cntrl->sbl_size;
> > 
> > Is it possible to detect the image type during runtime instead of using a flag?
> > Also, the flag is currently unused. So it should come along an user.
> 
> Perhaps we can check the second ELF Magic Number, but I don't think it's
> safe to determine the format by doing such check. Using a flag is simple
> and safe.

Why do you think it is not safe? IMO, relying on a flag is the not so safe
option. What would happen if an user has used old FW? The driver would blindly
assume that the FW is always of the new format, but the user is not aware of it.
It may lead to weird FW crash that would be difficult to debug.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

