Return-Path: <linux-arm-msm+bounces-74131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEEB88439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 09:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96D41BC139B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 07:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5939E2EAB8E;
	Fri, 19 Sep 2025 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsuprpiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0332E972A;
	Fri, 19 Sep 2025 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268267; cv=none; b=rTVyFDQIfgJFpo0CKWHz+9ZQ1IfNARokhXxc5P+PLGIDlTtvAAlfuSis9Rl2Ze3FvjYD9Jd554nseGmjovljhNRB6lw1GIpQFOgRmTXYU5f3OWcbhcKSZjP6C7V32ls3Vrwh5zftFuFjWgluw8lqFvcny4vBe+CdZaOCnlaMtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268267; c=relaxed/simple;
	bh=APlp1xW8NAQ7jnrv9E9kYLn5pnd6JDt9VpE5agdknts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cdfmvr/iZjGz1g82DoamFL3SWXxhEKtS7b0e9xHCS5sv0hbyJ5GpRW/pEuyhiihGGmYj3Frq1eyat2FWWVXewB5s35L4qHJifD4iSq+JtnLZvdALahQ2TFhpHev4og4di1MPNXhxetdi7waHgjWqEdKYj+pLRsf1tmbMBIOnsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsuprpiX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAC2C4CEF0;
	Fri, 19 Sep 2025 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758268266;
	bh=APlp1xW8NAQ7jnrv9E9kYLn5pnd6JDt9VpE5agdknts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsuprpiX71oIEYiECpyW0yByyMrzhbYxUz9A9iK3O7JiF9onfLY+F1SwFA8fZ9P/q
	 ZNW23CMx1Pfs38eVSMGiime8p1dlB+D6Mb0N5i5YHQzk4a14dRGCvI5m8Iid1rUmgg
	 z+s475OhyCB9HbaRIzO/zmFGw9J5dOJs7gBVaSHgGv4DMzjhW++UuwW4PS8hi4lSGb
	 5m4bNRDjOZbuvcdY8/z27UrCwMcN3IWRRm2nZQlXKuvGkfjkHwjGEG0rny0z9Tszyb
	 Cg+e54F5vglpH0kzMVJc2oDTbrr0Y+470SkQ75W6omut85fG12VUCAOcAx8g1ewBZf
	 n8S2C0KxODPig==
Date: Fri, 19 Sep 2025 08:51:01 +0100
From: Will Deacon <will@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aM0LZVudBKjWuVrT@willie-the-truck>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
 <aMBJNzXpQTMg4Ncs@linaro.org>
 <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
 <aMsJHheI6Y1V5q74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMsJHheI6Y1V5q74@linaro.org>

On Wed, Sep 17, 2025 at 09:16:46PM +0200, Stephan Gerhold wrote:
> I realize it is weird to allow non-architectural features like this, but
> I haven't found any indication that the additional SMRs work any
> different from the standard ones. The SMMU spec seems to reserve space
> for up to 256 SMRs in the address space and the register bits, as if it
> was intended to be extended like this later. That's also why it works
> correctly without any changes in arm-smmu.c: the bit masks used there
> already allow up to 256 SMRs.
> 
> What do you think?

Although it's all pretty ugly, I think we really only have two choices:

  - Teach the core driver code about all this and use an rmr-like scheme
    to leave the upper SMRs in bypass

  - Hack it in the impl code as per your patch

The latter option is probably the most pragmatic (especially considering
the need to handle the virtualised case differently) but I'd like to see
what Robin thinks.

Will

