Return-Path: <linux-arm-msm+bounces-43902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72042A00B93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 16:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F34516394D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8173D1FA8DC;
	Fri,  3 Jan 2025 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWKUa1Mz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFBC1F9421;
	Fri,  3 Jan 2025 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735918643; cv=none; b=YlA4XymKTCs1Qt91y8Yrlt/js+MskG4ycDQ4eofAV08r6izauP6oiY1O2jsGe034pQwW9by1yqXKTg3+8yPMLs9GWQRipfj0W5Jn/e3I/DYHMMuHIHDYUrmybBs9v10WU+lveOrRlfqhACf/VVJGixwZqoRCiKCcZ5Xy9K+tVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735918643; c=relaxed/simple;
	bh=KnHv5oQRaYx4DU4fQ9sL4Q1OxVgQhnnH0NGST/QZixk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBIHdB+2hpVoCJ0KYI7lkEt+NVOAf/87KmxdxJMmyKp88PiLo8zr3Pz76KI5In16EVAf9N45j9ECg7VvtLSIfR7CbEpAQiJKpuxz+f33EX9+68TvEfDt6u7/dDwpZzPM7kETtw2W16YH+4zXPjXp1mrnMDX04kYSyj6u3PZmPFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWKUa1Mz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7EAC4CECE;
	Fri,  3 Jan 2025 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735918642;
	bh=KnHv5oQRaYx4DU4fQ9sL4Q1OxVgQhnnH0NGST/QZixk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWKUa1MzSSp98zFZJn6r0t5w4VFvnZ3vGnndiVea73h68oea9nfH/0EvHg+RWHpOd
	 byr1RTLZqoBgvYlOk9N3XjOLUnGlxqYqdLtkED9/XjE13dfiYdUTe0r2OwNR8RP2Pu
	 VR6dGqCOPos9xSrTZ1LtQAb4i8VBMkdqlKzPFKkzsFigUgAdXmC2Z1yG17ZsrgNrEB
	 o3mI52ODbFV1eGnZDob3GG4deQ28s3M5EmE75MbbMPeYUwcOEpwSSWM1Wh/FVcktrn
	 Pv9EE30V2ew2k9HkaJLbE6M3GX7kZSuBVwgT14LZ2rvNdXoLKe+603UVNj9piP5o+O
	 Mx6BKHL3vjOXQ==
Date: Fri, 3 Jan 2025 15:37:17 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250103153716.GE3816@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

(please don't top-post...)

On Mon, Dec 30, 2024 at 06:45:29PM +0530, Bibek Kumar Patro wrote:
> On 12/12/2024 8:43 PM, Bibek Kumar Patro wrote:
> > This patch series consist of six parts and covers the following:
> > 
> > 1. Provide option to re-enable context caching to retain prefetcher
> >     settings during reset and runtime suspend.
> > 
> > 2. Remove cfg inside qcom_smmu structure and replace it with single
> >     pointer to qcom_smmu_match_data avoiding replication of multiple
> >     members from same.
> > 
> > 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> > 
> > 4. Introduce intital set of driver changes to implement ACTLR register
> >     for custom prefetcher settings in Qualcomm SoCs.
> > 
> > 5. Add ACTLR data and support for qcom_smmu_500.
> > 
> > Changes in v18 from v17_RESEND:
> >   - 1/5 : No changes
> >   - 2/5 : No changes - reviewed-by tags collected
> >   - 3/5 : Addition of
> >     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> >     around register access of PRR related private interfaces
> >     as discussed in v17_RESEND.
> >   - 4/5, 5/5 : No changes - reviewed-by tags collected
> >   Link to v17_RESEND:
> >   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
>
> Thought to follow up on this thread to highlight the latest version (v18) of
> this series, in case it was missed during the vacation period.


I'm waiting for Rob (Clark) to ack the last patch, as he had comments on
the previous version.

Will

