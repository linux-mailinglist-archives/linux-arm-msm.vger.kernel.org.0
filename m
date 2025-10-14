Return-Path: <linux-arm-msm+bounces-77203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332ABD972D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEB9A3BE972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2188A30C62B;
	Tue, 14 Oct 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGSuAlHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E569915B135;
	Tue, 14 Oct 2025 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446285; cv=none; b=i3z0VEjqIeFUsNfGFvPPP8oJ/0dkKkccG8wbUpTEHyt85+Clx8GHLl9GGW/aUNdmHJK3dvRXiHY6ZPvyU4kxZG7IZluXs3U4QtoCWJgeTWqNZTU/PmL+uEI08y5+ah+QTExnfwHLqxpZepNLfY2JSC+KddAdSYTJLKDJkqQt0XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446285; c=relaxed/simple;
	bh=OUsA9Im50tJdAfQLMgW2hzMFod3I2cybckT4bnebQUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgPJHXduadIiolOfE/eblh2bDv26pDd8FClHB1S+QOIiY19CNgyC+TAR4tvgBmugfBPIjJD9JeO1M5+R9MrK9uvU47ywPmu+dLY4YA/AUjFPAYek1HINFvxqA565e/S2BxNm3QE4kKlEEQAPG99HSRxYKJS7WE11JBHeXV35ioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGSuAlHk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85031C113D0;
	Tue, 14 Oct 2025 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446284;
	bh=OUsA9Im50tJdAfQLMgW2hzMFod3I2cybckT4bnebQUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGSuAlHkfXWgG2GEK6UXJwQ2ddkrR0+YnwHHpkm1sYz+HCXHkhGGjAOzTDOhrwMRo
	 SYPScgL8QX45VWhmYdCpgbGKY67ZCUfnKrBozVBwBCfd4zlqZZkFtr57ITY4JLS7Yy
	 oMWveG4gNJTi3Bcd6XNKCF1zoQ+qOe13cXJ7Xabiw3ZKJ3iqVlMbmjpKeexnf//lIJ
	 fTl9HkOj12QrscWA9dA1p410JzWj/qnH6Nc2XKad/Z70RV/5a7sQ3k3pG9KhXGn7HO
	 W3RWd7Zlsa9uk9VnLrGzV0umIv2+SdXU+Ik4vxbcfu0Jt4qgdTORiw4xlw3nMyuDcD
	 IEADG2YvblXXA==
Date: Tue, 14 Oct 2025 18:21:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Update session id for each suspend and
 resume
Message-ID: <d6gvgkzmrgixm3gtvfepfwh2vm7mgm75ksjd2xzy2jrkmmixks@i54qn2467g2b>
References: <20250912100827.294443-1-slark_xiao@163.com>
 <6510264c-d91a-45f3-b484-18d334c515e8@oss.qualcomm.com>
 <4205cc0b.3a60.199508f0d03.Coremail.slark_xiao@163.com>
 <2d5c6560.6e9e.199e1b29e6f.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d5c6560.6e9e.199e1b29e6f.Coremail.slark_xiao@163.com>

On Tue, Oct 14, 2025 at 03:50:03PM +0800, Slark Xiao wrote:
> At 2025-09-16 11:26:16, "Slark Xiao" <slark_xiao@163.com> wrote:
> >
> >
> >At 2025-09-15 15:26:33, "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com> wrote:
> >>
> >>
> >>On 9/12/2025 3:38 PM, Slark Xiao wrote:
> >>> On Qualcomm module side, there is a UART print as below:
> >>> session id: 0x355fe689 state:2
> >>> session id: 0x1f478e42 state:5
> >>> The session id reads from register BHI_IMGTXDB(0x218), and the
> >>> state indicates the D3 or D0 state.
> >>> 
> >>> In Windows side, MHI driver would update this session id for each
> >>> suspend/resume progress. We benefit from this mechanism since it
> >>> could help sync each suspend and resume progress between host and
> >>> device, especially for some suspend issue which needs to take
> >>> hundreds or thousands cycle. We can easy to figure out which
> >>> suspend cycle get a problem and what's happened at that time for
> >>> both host and device because they have same id.
> >>> 
> >>> But in Linux side, this session id value would always be 0x0.
> >>> So we add it for potential debug usage.
> >>> 
> >>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>> ---
> >>>   drivers/bus/mhi/host/pm.c | 15 +++++++++++++++
> >>>   1 file changed, 15 insertions(+)
> >>> 
> >>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> >>> index 33d92bf2fc3e..a6573f687363 100644
> >>> --- a/drivers/bus/mhi/host/pm.c
> >>> +++ b/drivers/bus/mhi/host/pm.c
> >>> @@ -864,6 +864,13 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
> >>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> >>>   	enum mhi_pm_state new_state;
> >>>   	int ret;
> >>> +	void __iomem *base = mhi_cntrl->bhi;
> >>> +	u32 session_id;
> >>> +
> >>> +	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
> >>> +	dev_dbg(dev, "Starting enter suspend, session id: 0x%x\n",
> >>> +		sessin_id);
> >>> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
> >>I agree this will help in debugging, but unless it is documented
> >>in the MHI spec we can't have this. Since in future if there is
> >>some other purpose for this register we end up facing issues.
> >>
> >>if it already part of spec point it in the commit text.
> >>
> >>- Krishna Chaitanya.
> >Hi Krishna,
> >I am not a member of Qualcomm so I don't have a detailed MHI
> >spec to describe this register usage.
> >But I get some information from their Windows MHI driver:
> >
> >1. There is release note which describe it:
> >UDE/QMI/win/qcude/installer/ReadMe.txt 
> >UDE/QCUDE.Standalone.Source.1.00.44.Windows-AnyCPU_ReadMe_1.txt
> >......
> >MHI driver 1.1.0.2
> >  b. Add write to BHI_IMGTXDB for debug purposes.
> >......
> >
> >2.From the code side,  there is a same operation for MHI driver
> >enter into M0:
> >HostDriver/win/NTAD/MhiHost/Mhi/src/Mhi.c
> >......
> >void MhiRequestM0(PMHI_DEV_CTXT MhiCtxt)
> >{
> >.....
> >   /* Set BHI_IMGTXDB */
> >   KeQuerySystemTime(&randSeed);
> >   MhiCtxt->SessionID = RtlRandomEx(&randSeed.LowPart);
> >   MhiTrace(TRACE_LEVEL_ERROR, TRACE_FLAG_MHICONFIG, "NEW SessionID: 0x%x\n", MhiCtxt->SessionID);
> >   MHI_WRITE_REG(deviceContext->BHIContext.BhiBase, BHI_IMGTXDB, MhiCtxt->SessionID);
> >
> >   MhiTrace(TRACE_LEVEL_ERROR, TRACE_FLAG_MHICONFIG, "Req -> M0\n");
> >......
> >
> >Not sure if above information is enough for this commit.
> >
> >Thanks
> 
> Any updates about this commit?
> 

Since this session ID behavior is not documented in the MHI/BHI spec, we can't
have this patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

