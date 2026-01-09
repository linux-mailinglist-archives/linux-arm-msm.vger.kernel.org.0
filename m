Return-Path: <linux-arm-msm+bounces-88269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D8D09251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA909307A031
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E22633C52A;
	Fri,  9 Jan 2026 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVjGcQkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8AB33B6F1;
	Fri,  9 Jan 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767959580; cv=none; b=KsaUlMtMYmuOv7lqzAgKHT5SYzvSuRLnDJQZPPHDQfwANuRxDwPuJYK9UlpwEBx2jMKLyEC6xPtbbTiN4ckBrkC2mugTNfrvZ7HOZvy35degI3//DLq7WxUXXUIpN5qpc9M7VuBelpZdoox+3m0hPT41CMJScf3mS5uIEv2I+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767959580; c=relaxed/simple;
	bh=5Z6K6b1yM72R3LASDW2ZKPjr20pV1qeRdu+728KuN+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJJyCeDG+jtUTLzdnnLVdPRJQ1gkSJDN2RIiSi/dgCLjQk13NsjqLvrFQo7bFLBT+IoPplQcJ3cK98y44aTvWbz6Cnlre/ZWzeIqCBoIH9pby5wEFDEEwSjiCeV7CQ8yAwaO8qQzSTttjJITSdQ/L5NtOVOrm4jyTWkApLO80wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVjGcQkH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456E8C4CEF1;
	Fri,  9 Jan 2026 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767959579;
	bh=5Z6K6b1yM72R3LASDW2ZKPjr20pV1qeRdu+728KuN+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVjGcQkHcjIDYK23XM3rCa18GyKj04XSU4+1RCtCFA+d5j5Dhs1w5PfAuoNUNj2rO
	 yYOBPNQjFMEuiBpuAC069DzFnrIxytAVI/vBT5NkDhyI4Kl5JjHhUtZtyL3QPZzr8T
	 DTZbUMo5Hb4Vf58OA7J1PeDZgMFS+3c8ZnmgbVsOIKeGmS8ICOUKU+VyV0LnF+/kAW
	 vLbQaxpO5Qwyrstrih+Uxqho+YNmMeRUD2OXXG1ttpj8+RoIGKzB1mEZdnzMTfGGrU
	 iNijSxt1bbKCNVqE/o5w3GuD6QxXqjb7kKM/MGb1Ylhf6DfMN9ZQGTbSNBA7L0zIro
	 UQ6VspIBgAfEg==
Date: Fri, 9 Jan 2026 11:52:54 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, robin.murphy@arm.com,
	joro@8bytes.org, catalin.marinas@arm.com, kernel-team@android.com,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <aWDsFoEe7PHQaL9F@willie-the-truck>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
 <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
 <b0a39971-5616-4768-b08f-b359cabd2f6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a39971-5616-4768-b08f-b359cabd2f6e@oss.qualcomm.com>

On Fri, Jan 09, 2026 at 04:59:13PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 1/6/2026 4:28 AM, Will Deacon wrote:
> > On Tue, 09 Dec 2025 10:53:23 +0530, bibek.patro@oss.qualcomm.com wrote:
> > > Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> > > 
> > > These are QoS settings and are specific to per SoC thus different
> > > settings, eg: some have shallow prefetch while others have no
> > > prefetch.
> > > 
> > > Aswell, this prefetch feature is not implemented for all the
> > > platforms, capturing to those are implemented to the best of my
> > > knowledge.
> > > 
> > > [...]
> > 
> > Applied to iommu (arm/smmu/updates), thanks!
> > 
> 
> Hi Will,
> 
> While reviewing the applied patch, I noticed that during the transition from
> v2 [1] to v3 [2], one of the SoC entries (sa8775p) appears to have been
> dropped while addressing the review comments.
> 
> Sorry for not catching this earlier.
> 
> Would it be acceptable at this stage to send a v6 including the diff below?
> Alternatively, if it’s easier on your side, please feel free to squash this
> into the existing patch currently applied in your tree.
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 456d5146831e..718d102356d9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -43,6 +43,8 @@ static const struct of_device_id
> qcom_smmu_actlr_client_of_match[] = {
>                         .data = (const void *) (PREFETCH_DEEP | CPRE |
> CMTLB) },
>         { .compatible = "qcom,qcm2290-mdss",
>                         .data = (const void *) (PREFETCH_SHALLOW | CPRE |
> CMTLB) },
> +       { .compatible = "qcom,sa8775p-mdss",
> +                       .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>         { .compatible = "qcom,sc7280-mdss",
>                         .data = (const void *) (PREFETCH_SHALLOW | CPRE |
> CMTLB) },
>         { .compatible = "qcom,sc7280-venus",
> 
> If neither approach looks suitable, I can send a standalone follow‑up patch,
> either on top of your tree[3] or on tip.

No worries, but please just send a patch on top so that we have an
explanation in the commit message and we won't have to rebase the
branch.

Cheers,

Will

