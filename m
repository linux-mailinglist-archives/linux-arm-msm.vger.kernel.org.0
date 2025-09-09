Return-Path: <linux-arm-msm+bounces-72771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D647B4FBE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86D557A7C66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272DA32CF97;
	Tue,  9 Sep 2025 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rqaubvdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A142FB606;
	Tue,  9 Sep 2025 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422638; cv=none; b=Rdd/2GN3XxJk2b0QZZwqvWIo2W52VAWt8YvbuCPkZVqgoQek6c7299G8tPPTyV6MvzhNnw8LUtcYGrW94jNxz39rafqqIiKkcl3V5qCqsIDD2mMlnNK9YNYXnfwsj9UjGJUtvkfP6fTMpsZ82jUn6yEDGF13i96hMw+jzESduUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422638; c=relaxed/simple;
	bh=8QS4xAENwRAuWHx2PONshZzPg+6Wl4OLWnziKlPHJOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4d/jj3QYA9DHvGAS17rmut/Lox5ggZuFZzg6PCTIHsnAMH/ncbRHe8UN8C/VVouKe8kWipt82aKGfa94g4uziE8uAvkjaPdxihme66c7Pp/0UBEseFfeL3TMke+ksjzzhkQJ8yOwhGAsrlo3HEZNb86xuFmIief1dm3Nn8aAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rqaubvdz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644BCC4CEF4;
	Tue,  9 Sep 2025 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757422637;
	bh=8QS4xAENwRAuWHx2PONshZzPg+6Wl4OLWnziKlPHJOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rqaubvdzpt2E6sZzI6ANiROrCU6b9g7XHQlhQCE4MqlOYTpA+ei6nIaFbE4YQrIMA
	 rWiZ/wvrGy9aGk/ShRg9FlPR0JrG/bODYU1oCMj+z+WiPd8bwizMxKnYTeGbXywy4d
	 K/eUscOPuhowcdbLXS6N1L/D/AydnLKWd/3/QkENlL0VGL62UeYhF9rbWTw+HCmuOF
	 TZy4kiM5B1Hw6nK6LBC1az//u057HvVYhBhWfr2/mSuBERBiiqgktiP6fJL2VE+67+
	 z3hkG7OszNU53Z2BhAD1PTvTvcl1no4q6uqh8fs/p6xcEIYBcbzqtmPaIyHz7D7Iis
	 /zV6Xz4tSi2sg==
Date: Tue, 9 Sep 2025 13:57:11 +0100
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
Message-ID: <aMAkJ7CfPQuhvhfm@willie-the-truck>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>

On Thu, Aug 21, 2025 at 10:33:53AM +0200, Stephan Gerhold wrote:
> Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
> matching groups. This is more than what is defined as maximum by the ARM
> SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
> Limit the SMR groups to 128") disabled use of the additional groups because
> they don't exhibit the same behavior as the architecture supported ones.
> 
> It seems like this is just another quirk of the hypervisor: When running
> bare-metal without the hypervisor, the additional groups appear to behave
> just like all others. The boot firmware uses some of the additional groups,
> so ignoring them in this situation leads to stream match conflicts whenever
> we allocate a new SMR group for the same SID.
> 
> The workaround exists primarily because the bypass quirk detection fails
> when using a S2CR register from the additional matching groups, so let's
> perform the test with the last reliable S2CR (127) and then limit the
> number of SMR groups only if we detect that we are running below the
> hypervisor (because of the bypass quirk).
> 
> Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
> above 128 (until they are all used). I did not see any issues, so I don't
> see any indication that they behave any different from the others.
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)

Is the existing workaround causing you problems somehow? Limiting the SMR
groups to what the architecture allows still seems like the best bet to
me unless there's a compelling reason to do something else.

Will

