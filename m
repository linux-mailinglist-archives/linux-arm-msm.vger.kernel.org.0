Return-Path: <linux-arm-msm+bounces-45613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B15A16F58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D668B1883F6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010C01E8840;
	Mon, 20 Jan 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3MZly8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E8B1E8824;
	Mon, 20 Jan 2025 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387518; cv=none; b=EEDO91cSarKUbJtuW+pJJz3humWBM6mLnvHj6dQGgryaY4YUy7WYC2FJawIaGoNh5m7sR/ndLMaIk8S+AOfSW5BXpM5CEwSCm9rahLTlvEpZCFRIil9tUnvMRkBC4vNIMaA2xQ3N3rGQwKy1zxnQuDedNBvIjYx1u+u49bDA50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387518; c=relaxed/simple;
	bh=DVUvoJIHLiUYHupURPdG/3K0udtI8Y/qhWh8bnVptFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPv1p9VBGCHLh+uhsm+f1Y0H7R0lky0a0E5dsl6C/aZWhCguhj4Oxqmdy+ItdjK5w5hC781bhpzUVGsRzNFAWJoDEh8An+cn4w9EfrVXVYFRJIRFOrLE/TfazIN9+jRKwUKZShcEs3rDuiqR8ldOV7vdQYDs1zlMGv8//7EHNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3MZly8y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C85C4CEDD;
	Mon, 20 Jan 2025 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737387518;
	bh=DVUvoJIHLiUYHupURPdG/3K0udtI8Y/qhWh8bnVptFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3MZly8yPEL+ML9sLcHzsTD0LwexfWEiUnaTZIJU0aXwTh6GhvCCIP7W1DRx3fpil
	 72Zff62OeO1hkHNid+0UkJU1sh2inzL0uBbLXD9WhQW3aQcEBbYAiClRp33k/D7aEu
	 5jAZB2HlDbwg/PkNhL2zChp3iIDw2COUu4AidGcXrb2xKd4k0EDzgsD9OVCY3Ta+C5
	 jShBIHt9Bz4TOLfku4Xt/A59RTbC0F2dfx+533svJsEZ5vW5bPLq3UkFL9Pgyp5meI
	 oHHCHjnFXSV93lnFKAF3GL3w66oKEnIwfYADNepXHfoQxG6je+oEg/lLJFtkeGdRcB
	 bYJ4LZ5u4sGTA==
Date: Mon, 20 Jan 2025 21:08:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maramaina Naresh <quic_mnaresh@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Minwoo Im <minwoo.im@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
Message-ID: <20250120153821.3v3c53sc43a7yx7s@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-2-quic_ziqichen@quicinc.com>
 <20250119071131.4hepn6msmh76npi7@thinkpad>
 <57d52f72-31ec-46cf-b632-74b09e29f501@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57d52f72-31ec-46cf-b632-74b09e29f501@quicinc.com>

On Mon, Jan 20, 2025 at 08:01:03PM +0800, Ziqi Chen wrote:
> Hi Mani,
> 
> Thanks for you review~
> 
> On 1/19/2025 3:11 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jan 16, 2025 at 05:11:42PM +0800, Ziqi Chen wrote:
> > > From: Can Guo <quic_cang@quicinc.com>
> > > 
> > > If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
> > > two freqs,
> > 
> > 'amongst more than two freqs': I couldn't parse this.
> > 
> 
> It means that the devfreq framework will tell UFS core driver the devfreq
> freq, then UFS core driver will find the recommended freq from our freq
> table based on the devfreq freq. For legacy mode , we can only have 2
> frequencies in the table. But if the OPP V2 is used, we can have 3 , 4 or
> more freq tables. You can refer to my PATCH 8/8.
> 
> > > so just passing up/down to vops clk_scale_notify() is not enough
> > > to cover the intermediate clock freqs between the min and max freqs. Hence
> > > pass the target_freq to clk_scale_notify() to allow the vops to perform
> > > corresponding configurations with regard to the clock freqs.
> > > 
> > 
> > Add a note that the 'target_freq' is not used in this commit.
> > 
> 
> Sorry, I don't very understand this comment, I mentioned the "target_freq"
> in the commit message,  Could you let me know what note you want me do add?
> 
> > > Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > 
> > Signed-off-by tag order is not correct here. This implies that Ziqi originally
> > worked on it, then Can took over and submitted. But it seems the reverse.
> 
> Thanks for your reminder. Is below tag order OK ?
>     Signed-off-by: Can Guo <quic_cang@quicinc.com>
>     Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>

'Co-developed-by' is not needed unless you also worked on the patch. I guess you
are just sending the patch authored by Can, so you can drop this and keep your
'Signed-off-by' tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

