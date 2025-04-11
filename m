Return-Path: <linux-arm-msm+bounces-53998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE04A85BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D8319E2F12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10E122127C;
	Fri, 11 Apr 2025 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtzGtOeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A17202C43;
	Fri, 11 Apr 2025 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371330; cv=none; b=p3AH10HyaKXepHNWBYX6yf6r7ZVE6Cgafio87Fn28ORCo65rsShWOyYtf89WtmikKHBvFU43d7SWxRiydtQD0gnqY3b8kyb3x2TdK6/fGe3wg5pEImEkZpcABeODmE7bdGWTT5nmmSa6GOHi5AhBecvnHiUJDZ6LcnNCDJTe3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371330; c=relaxed/simple;
	bh=ZHpRmlxi0N8UYKKEPd33twsru7ukxPU6RRFGjJueWLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR9d9IrlhQ4YF8mqEwKRiX5HcYx7As2oaGNaAlxJvH5dDhH1N2722LfqklKGLEmGGEU4uM2/hDPPK9oPh2siNRMlI39WrrhFxhqEZn4f6XdbR4u1y6r4NzdrtG/9wRH0sM7NkwrTyOu44qw4w36LmvjNSRFO8IhnSNdxI7ZcU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtzGtOeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59453C4CEE7;
	Fri, 11 Apr 2025 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371330;
	bh=ZHpRmlxi0N8UYKKEPd33twsru7ukxPU6RRFGjJueWLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtzGtOeI6RXdDJWLkuG5+oLCHHjqqKyUaVr2+/eUUMUheu1SmJnT6/0CQ4pdeGN7f
	 8EWsWZniLDnUaLfdMuk3dovnwAJNuhDT6vw77iXrXgvt/gl9Dbjqkrx0fX2LHO/xYy
	 DbWJ+ZhoBUjskHCl+2X4/go5vHczuBFY/U78BDFyXArgnr6s85mq4R2r2A6BCOSGpI
	 CYJ2nY5E64Qb1NzaazPOLgk9DJ07KZw2+mclhd30BETTwy4kPfogwBg8cfwV7EtrNj
	 AMMq9TqDQpDP3i6Q16wZ+UgE1DGwLv7t8vWcZIZXjHn3bfywfB93OPxnBbJjqvuLUy
	 qrIYtHqYbF3Hg==
Date: Fri, 11 Apr 2025 17:05:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
Message-ID: <Z/j+fs6hCVhGKLcH@vaman>
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
 <Z/i+6k6VseihdQ69@vaman>
 <734cf70a-1d96-4a87-bc7e-c070c1e7dc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734cf70a-1d96-4a87-bc7e-c070c1e7dc8c@oss.qualcomm.com>

On 11-04-25, 14:29, Kathiravan Thirumoorthy wrote:
> 
> On 4/11/2025 12:34 PM, Vinod Koul wrote:
> > On 07-04-25, 19:51, Kathiravan Thirumoorthy wrote:
> > > Update the phy settings for IPQ5424 to meet compliance requirements.
> > Can you specify which requirements are these?
> 
> The eye diagram (Host High-speed Signal Quality) tests are failed with the
> current settings. So design team asked to revert.

That would be good to mention in changelog.. am sure you wont recall 6
months down the line, which requirement this triggered the change!

> > > The current settings do not meet the requirements, and the design team
> > > has requested to use the settings used for IPQ6018.
> > > 
> > > Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
> > > IPQ5424") and reuse the IPQ6018 settings.
> > Why not do revert first and then add the settings?
> 
> 
> I thought of submitting it separately. But what-if only the first patch
> merged and second one didn't due to some issue, it will break the USB
> feature. So, I thought it would be better to keep it in single commit.
> Please let me know, I can send V2 with 2 patches with the merging strategy
> (both patches should go together to avoid the USB breakage) in cover letter.

Series is applied together and you can mention the dependency on cover
letter

-- 
~Vinod

