Return-Path: <linux-arm-msm+bounces-35764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4D9AF7BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 04:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61913281053
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 02:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF30517CA1D;
	Fri, 25 Oct 2024 02:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpSG9TFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69C3D97A;
	Fri, 25 Oct 2024 02:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824990; cv=none; b=q2GW0U6eCDoTeCtRKOnDLf/MpqyGVMzs9d4H4f4XqhgXEIa0mT1c88rDMeCxB6dfpI4F+IPcTP2UmUvPtrAQ10imBy7S/UqsPrgfHnfDTSTlXcSUgf8+HE3FeUaQnA+HfaMFQ+nsebn4Qf5vU9Dl6h/VSlualmai5PtICKJY1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824990; c=relaxed/simple;
	bh=XywWuK21Kqbi5ds/dzHJKlCriZgNB0AONCXAcdIrKmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6NdG1AH91G27hQjA2ASO8Kr6yiTgv4EbHbNoi0gfyS9gXGrUfMmtUy2MGI2qwLowoARH45iIvF29Hr8vv49hNXwqIxS7wnNJoEMeAAEG/TvoPwXa9XDcZjU5Xkgakkj++s4fFKXBmwo55vsTSQlhSmFn6+B+Lr/XvyYvHR9SJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpSG9TFf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D04C4CEC7;
	Fri, 25 Oct 2024 02:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729824990;
	bh=XywWuK21Kqbi5ds/dzHJKlCriZgNB0AONCXAcdIrKmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpSG9TFfLeQ1GU3d6SZEE87VlYpl3kWJMH3RymPeAAMHt4uow+R8gOCoN6NrX1Dr5
	 qcdgL2vUpZBa7KGeC3Ng/OWpbO7lpQ3yD7iirq8QPSVFv1cIb4Pa2lxfSJfjNap070
	 Of9nHXiV3+yeuCPHsxtHnzQX4IYBAVXi2Hv7RrjJ+Ug4ouaUFxRP13Lr3hvFArB6/C
	 tXwAyDwza/P0y+pilxwJbiX/ekCNhzR9unB5VPnQqB508eSAJDpXs8Z6Uh5hCveicx
	 oBeSV3JWtqaRfEFsEYqYhZ40yh5nao7efP/SbOBvpbx9SONyo7axsfYcRSUiDkePrn
	 DEZLKfBvgipBA==
Date: Thu, 24 Oct 2024 19:56:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com
Subject: Re: [PATCH RFC 0/2] Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
Message-ID: <20241025025628.GD1781@sol.localdomain>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241023213134.GC3736641@google.com>
 <CAPDyKFo05Hyw9gdEBx7zQq_6P58ittHHsZQLuqmeR1AChyHSHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFo05Hyw9gdEBx7zQq_6P58ittHHsZQLuqmeR1AChyHSHw@mail.gmail.com>

On Fri, Oct 25, 2024 at 01:07:18AM +0200, Ulf Hansson wrote:
> On Wed, 23 Oct 2024 at 23:31, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Sun, Oct 06, 2024 at 07:25:28PM +0530, Seshu Madhavi Puppala wrote:
> > > Crypto reprogram all keys is called for each MMC runtime
> > > suspend/resume in current upstream design.
> >
> > Is that correct?  I thought that similar to what is done for UFS, the key
> > reprogramming happens only after the MMC controller is reset.  I thought that is
> > different from a runtime suspend.
> 
> Looks like Seshu is not really worried about the host's runtime
> suspend, but the card's runtime suspend.
> 
> Perhaps there are some out of tree code involved here that makes use
> of MMC_CAP_AGGRESSIVE_PM, which is what allows the card to be runtime
> suspended?
> 
> >
> > If it's in fact triggering more often, maybe that is what needs to be fixed?
> 
> We could extend the runtime PM autosusend timeout for the card, if
> that makes sense.
> 
> Kind regards
> Uffe

The keyslots are being reprogrammed from mmc_set_initial_state(), which is
documented as:

    /*
     * Set initial state after a power cycle or a hw_reset.
     */
    void mmc_set_initial_state(struct mmc_host *host)

It's called by: mmc_power_up(), mmc_power_off(), _mmc_hw_reset(), and
mmc_sdio_sw_reset().

Can that mean a power cycle of the card, not a power cycle of the host
controller?  The keyslots are part of the host controller, so that may explain
the problem.  The keyslots should be reprogrammed only when the host controller
is reset, as that is when they are lost.  (And it should not be skipped entirely
as this patchset does, as a host controller reset is possible.)

I am not an expert in MMC or in the details of how Qualcomm ICE is wired up to
the system, so I might have this wrong.  But let me know if it sounds right.

- Eric

