Return-Path: <linux-arm-msm+bounces-4197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65380C618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 11:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BA571C20D34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF8F22338;
	Mon, 11 Dec 2023 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/d66fRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4F22321;
	Mon, 11 Dec 2023 10:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65093C433C7;
	Mon, 11 Dec 2023 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702289443;
	bh=xegFE43EsxyDEc3X4/P6wFMt65swkGo0cmYpTfXFMNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/d66fRvTIHZc+1tPtr4CYU+RquwqoOlqN2HfoxjeD6nhSx7Tr7hAznWzqWfOPFcP
	 +VuZz1oSq9AmKmlRe0ZPBOfq/se1RO2d7wKCOmsqjHO5x4hLNXuitHBXfhJYsNdduA
	 6v5lfqbLkyCb31oVZr7l936XUXZFQPYlBPDvexlsHpOTzeKtsQLxnF4Kkrk4MAG59x
	 u90ynnHr5nQDPeqo9bKNGmReO9cYIL4W9vJLGlPu55BmQA9b9RtCqtrSfA2L2sKG1i
	 7di11AS03a/4c7oIoqgbtr3+0B6RsQkgo98fRmItwkJTUgFvt7NlGV8u1366zKLZqr
	 sjfDAjQv4J0SA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rCdG5-0005bi-0v;
	Mon, 11 Dec 2023 11:11:29 +0100
Date: Mon, 11 Dec 2023 11:11:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, stable@vger.kernel.org,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add missing GMU entry to match
 table
Message-ID: <ZXbgUeuf0-dYBOYV@hovoldconsulting.com>
References: <20231210180655.75542-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210180655.75542-1-robdclark@gmail.com>

On Sun, Dec 10, 2023 at 10:06:53AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In some cases the firmware expects cbndx 1 to be assigned to the GMU,
> so we also want the default domain for the GMU to be an identy domain.
> This way it does not get a context bank assigned.  Without this, both
> of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
> allocating and configuring a context bank.  So GMU ends up attached to
> both cbndx 1 and later cbndx 2.  This arrangement seemingly confounds
> and surprises the firmware if the GPU later triggers a translation
> fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
> getting wedged and the GPU stuck without memory access.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Tested-by: Johan Hovold <johan+linaro@kernel.org>

