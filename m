Return-Path: <linux-arm-msm+bounces-27867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CEB946FD5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 18:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34D421C208A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 16:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF86E558BB;
	Sun,  4 Aug 2024 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFaw/sNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF8A953;
	Sun,  4 Aug 2024 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722789553; cv=none; b=r7U4N1aRgiQWgYHuvGf+VTgzxGZFnhC1//r1CNVXxyDCgqTtFkK91f+IGOEo77of6J+5lYtEOGiDUDJdRyJXCr7FjUh8wejAVe9iWXHmHa7cGNmmrAlYc76SG3VeBRfC4SpkM1c+yV3hDE06uzB3BMtT3i+uXnQJAppamp7faRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722789553; c=relaxed/simple;
	bh=Hciw+IuSyLRYcNUz6qzbx45v8AyWImZRJsAyy0O3TqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp2rxdvU80nJDw7L/o39Q3tSh2mf3G6yBJp5bAvMYls13M8P6ywrOLlP7fpBr80eLq+Qhx2RXUpnUboR1ehB7ddqYhYJgQwQ4DbQDEQFKI732gGpX0cKAPxDrDDKFqPK8gnC4vPXxbFo4ZsTBacX5sKTy7VpzCrk+FC+WXyQdrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFaw/sNw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0EBC32786;
	Sun,  4 Aug 2024 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722789553;
	bh=Hciw+IuSyLRYcNUz6qzbx45v8AyWImZRJsAyy0O3TqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFaw/sNwksusBrHEIeqkxpEnPTdge5Y8zuNsjNcwK7ipNuHMva9X8Xe3Oo+CZbokC
	 r6x8KVjeLwzQyvAdObmIOSpGndDiHgoyYiDYOMhgIa9vaoye81JBVRvVTmXaCRsbHN
	 Qzzn0Izp4cMm1LXxacWHG5JVbUaQacPAmtHxglV6QeU6GUMDdKMzlYmjzB5AXU1NNP
	 Va5Y3rJv1VV60/0qZBOUWOnEC5gVGbsKFLUJqxhq1KWZjP04eVnhbycxrtIfpzNenD
	 zj+OiuFmg9+4VrdGeqXfFhFArj76/CtXRj0779ctSaWf4pfs1jzjOqFLc0ySoS9rAr
	 dA/O+IERNT/NA==
Date: Sun, 4 Aug 2024 22:09:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <Zq-ura3oYbhb8C9a@matsya>
References: <20240731152548.102987-1-manivannan.sadhasivam@linaro.org>
 <172249532035.256913.2685367794999812971.b4-ty@kernel.org>
 <20240801070026.GB3705@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801070026.GB3705@thinkpad>

On 01-08-24, 12:30, Manivannan Sadhasivam wrote:
> On Thu, Aug 01, 2024 at 12:25:20PM +0530, Vinod Koul wrote:
> > 
> > On Wed, 31 Jul 2024 20:55:48 +0530, Manivannan Sadhasivam wrote:
> > > These register prints are useful to validate the init sequence against the
> > > Qcom internal documentation and also to share with the Qcom hw engineers to
> > > debug issues related to PHY.
> > > 
> > > Sample debug prints:
> > > 
> > > qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
> > > qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] phy: qcom: qmp: Add debug prints for register writes
> >       commit: 4e92d504475ea5841716ad775f412342520a3d26
> > 
> 
> Thanks! Bjorn spotted that it is worth making 'char *name' a const. Can you
> please ammend the commit?

Send a patch please, I dont like to rebase

-- 
~Vinod

