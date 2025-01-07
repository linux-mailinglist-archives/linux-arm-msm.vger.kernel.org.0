Return-Path: <linux-arm-msm+bounces-44093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331CA03B49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D2197A076C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18B51DE8AA;
	Tue,  7 Jan 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Non02Xq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC6158868;
	Tue,  7 Jan 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242779; cv=none; b=rNnrEe1ufSLPt6vMCGSISUnsAHG2pAVAMCA0rCA+enGzJ/JrHY8KMeSis71k/IN8Ph0LRpQ9mPJ69HHqIlgC8VKcZ8/RS3FMqt/4VQU3N+egIa3B/n4n4dqvtTR5ZATkghVdXzR/787lwgmQAW0VzjnbB+VndCQhJUHAzbN8AD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242779; c=relaxed/simple;
	bh=kqqn99pnJM0rkF1It5qQUKFSbiZOaPNoOD3RfHi+LAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iySwzroDH7jRx+Lg43zZWvQxPQ7UojvungB4svz7T7GKtiYzvlu4fRX8r8ctJvbRbo1E3vgdwJFH7z29nQrFQ+iEZDHtV/keR8V7P/3JY6YpgfPseyGnH508uAo655Etk9Aomb5dHNNDNr4HkX9vFvodq08pg1WQJkDV8uyjgfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Non02Xq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0D4C4CED6;
	Tue,  7 Jan 2025 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736242779;
	bh=kqqn99pnJM0rkF1It5qQUKFSbiZOaPNoOD3RfHi+LAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Non02Xq9vfAyxaxzlq7noOiILjr0HYoodgY+Z+X7m3H3dnAw7skS7A/8R7ADS6GtO
	 ywYB47LXlHzouPnCPtk3O+vdEUi+tBUTFPFI7jljT9oB4bNsr2WHLol98KRY/PvEMv
	 9pIAKvEY4UXSfnL8ufhLhZeUWWjXYpOJUD7Yw48Di3PBdg5Us65vjgra+1YECNe5v+
	 9WoZrc1enHWnm0sIXqqqRIdmICp0PFl6n3bWrBt5AaXBdd9Q0GYEo79rNQeRAodZIO
	 2coIdV+IPB/QZOBj5AlfenAh3OFfKQDxqAoS+pitPyE3WMEVEkCnAOPneIc7LHIB+o
	 pMuV4RMRJSAxQ==
Date: Tue, 7 Jan 2025 09:39:33 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robin.murphy@arm.com,
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250107093932.GA6713@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com>
 <20250103153716.GE3816@willie-the-truck>
 <CAF6AEGua_WfLd2PQv42NK3R1oOgJ8wNf6yt6We4tH0GFkHPnoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGua_WfLd2PQv42NK3R1oOgJ8wNf6yt6We4tH0GFkHPnoA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jan 03, 2025 at 10:16:43AM -0800, Rob Clark wrote:
> On Fri, Jan 3, 2025 at 7:37 AM Will Deacon <will@kernel.org> wrote:
> >
> > (please don't top-post...)
> >
> > On Mon, Dec 30, 2024 at 06:45:29PM +0530, Bibek Kumar Patro wrote:
> > > On 12/12/2024 8:43 PM, Bibek Kumar Patro wrote:
> > > > This patch series consist of six parts and covers the following:
> > > >
> > > > 1. Provide option to re-enable context caching to retain prefetcher
> > > >     settings during reset and runtime suspend.
> > > >
> > > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > > >     pointer to qcom_smmu_match_data avoiding replication of multiple
> > > >     members from same.
> > > >
> > > > 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> > > >
> > > > 4. Introduce intital set of driver changes to implement ACTLR register
> > > >     for custom prefetcher settings in Qualcomm SoCs.
> > > >
> > > > 5. Add ACTLR data and support for qcom_smmu_500.
> > > >
> > > > Changes in v18 from v17_RESEND:
> > > >   - 1/5 : No changes
> > > >   - 2/5 : No changes - reviewed-by tags collected
> > > >   - 3/5 : Addition of
> > > >     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> > > >     around register access of PRR related private interfaces
> > > >     as discussed in v17_RESEND.
> > > >   - 4/5, 5/5 : No changes - reviewed-by tags collected
> > > >   Link to v17_RESEND:
> > > >   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
> > >
> > > Thought to follow up on this thread to highlight the latest version (v18) of
> > > this series, in case it was missed during the vacation period.
> >
> >
> > I'm waiting for Rob (Clark) to ack the last patch, as he had comments on
> > the previous version.
> 
> You mean 3/5?  The latest (v18) lgtm, a-b

Sorry, yes, I meant 3/5. Thanks for having a look!

Will

