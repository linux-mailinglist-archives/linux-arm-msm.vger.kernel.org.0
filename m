Return-Path: <linux-arm-msm+bounces-67349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430EB181B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C1C3B6A79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D90124676C;
	Fri,  1 Aug 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYx3IzMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194DE23C51B;
	Fri,  1 Aug 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051084; cv=none; b=seFDfQd3QVwpu7bLfe9SyzR4DVlY/hRbXo6TT3IBgZXzNLcIOins6mST0fLtQ69V49b39B81ZK+pK0xZPg85gNk0Y/rTxnIfz9hDCJD04e6TwJq6abaUEr6Kl2basiobw6e4Z4oRVYLdmhdbOM5GuEQOxXYDZ7Rj3yRwt77nJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051084; c=relaxed/simple;
	bh=zSsoy4h+MU+HAAWZKfOLQpjUGtZyXSjAdvjgDERSVAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNH3nNnSXGb3gZVsmZJgxEKspkqCwgnXsFlM7zdGZEzNjCzpsac4CAL1SNbufR2k9apSAzLLEc6eXNlfEFDE2bSMiE2rvVCHwJDRwJ19TgT1Cl2MsAFCOOyujkzJkXKu/HUTJz04c34XAHbc0JhOWvFkUd6oOTzceSy/sr6JgD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYx3IzMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97140C4CEE7;
	Fri,  1 Aug 2025 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754051083;
	bh=zSsoy4h+MU+HAAWZKfOLQpjUGtZyXSjAdvjgDERSVAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYx3IzMD7Mxf+LiwAs0M2LbOI4+cfWP/4Mu+nEItPRZNEbcsnkaHmnnDOyX9Fj35b
	 ductaaa4MiSAlMOZErKDfag1i5RbxheY5KeS6TNu0KgJ1g/StxG6Cagz3qIxSYwiqi
	 dlUeaMpOwtnGG/hEGLSvbgFHCl8At96iEG1pcMhOBEVUKUb2jqagwh+Yt2ewoStNdn
	 TMmrf/Bau5uyx7pApi6G5Xk8Jt7JzeD4B/4wCcK1iSCsfmfFRHJ6SfVMSrAmE7hgBF
	 0qrrtqOmLVwARWksKDPVAHEOH+fJGShmnKtPQIbJ9GNimR6lpHuDpVcrLlnzNxWrqY
	 /lAZC9dnWi78Q==
Date: Fri, 1 Aug 2025 17:54:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
Message-ID: <kayobeddgln5oi3g235ruh7f7adbqr7srim7tmt3iwa3zn33m4@cenneffnuhnv>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
 <eab85cb3-7185-4474-9428-8699fbe4a8e5@kernel.org>
 <40ace3bc-7e5d-417a-b51a-148c5f498992@quicinc.com>
 <2a7bf809-73d9-4cb6-bcc9-3625ef1eb1fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a7bf809-73d9-4cb6-bcc9-3625ef1eb1fa@kernel.org>

On Thu, Jul 31, 2025 at 10:38:56AM GMT, Krzysztof Kozlowski wrote:
> On 31/07/2025 10:34, Ram Kumar Dwivedi wrote:
> > 
> > 
> > On 31-Jul-25 12:15 PM, Krzysztof Kozlowski wrote:
> >> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
> >>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
> >>> on the Qualcomm SM8650 platform by updating the device tree node. This
> >>> includes adding new register regions and specifying the MSI parent
> >>> required for MCQ operation.
> >>>
> >>> MCQ is a modern queuing model for UFS that improves performance and
> >>> scalability by allowing multiple hardware queues. 
> >>>
> >>> Changes:
> >>> - Add reg entries for mcq_sqd and mcq_vs regions.
> >>> - Define reg-names for the new regions.
> >>> - Specify msi-parent for interrupt routing.
> >>>
> >>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>> index e14d3d778b71..5d164fe511ba 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>> @@ -3982,7 +3982,12 @@ ufs_mem_phy: phy@1d80000 {
> >>>  
> >>>  		ufs_mem_hc: ufshc@1d84000 {
> >>>  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> >>> -			reg = <0 0x01d84000 0 0x3000>;
> >>> +			reg = <0 0x01d84000 0 0x3000>,
> >>> +			      <0 0x01da5000 0 0x2000>,
> >>> +			      <0 0x01da4000 0 0x0010>;
> >>
> >>
> >> These are wrong address spaces. Open your datasheet and look there.
> >>
> > Hi Krzysztof,
> > 
> > I’ve reviewed it again, and it is correct and functioning as expected both on our upstream and downstream codebase.
> > I think it is probably overlooked by you. Can you please double check from your end?
> > 
> 
> No, it is not overlooked. There is no address space of length 0x10 at
> 0x01da4000 in qcom doc/datasheet system. Just open the doc and look
> there by yourself. The size is 0x15000.
> 

The whole UFS MCQ region is indeed of size 0x15000, but the SQD and VS registers
are at random offsets, not fixed across the SoC revisions. And there are some
big holes within the whole region for things like ICE and all.

So it makes sense to map only the part of these regions and leave the unused
ones.

But again, this should've been clearly explained in the patch description. I
hope it will be taken care in the next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

