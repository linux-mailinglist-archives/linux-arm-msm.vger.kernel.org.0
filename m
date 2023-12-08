Return-Path: <linux-arm-msm+bounces-3890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F2809E00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301401F21095
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8355110A3F;
	Fri,  8 Dec 2023 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tm2W3sFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB01094B;
	Fri,  8 Dec 2023 08:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8FEC433C7;
	Fri,  8 Dec 2023 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702023514;
	bh=85cnqYAPP8hKzPB4QuuMegY8qDFlijd/F4k4kPybf3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tm2W3sFTrdPwgFXfQ0kjCMqNCQivTotVWHI8wacQElTC6famiPCWqVVWsk7bln4vp
	 tUL7BJzSCSqgK444YJtm50jydcW0s13t8tAhLD7DDXAQFjlBArujRsBSrzFlNjBcM4
	 5+ZCLAc3hCHUkVhC7KHLOh43Jc+k97r71e3aR+cF4P7oV3kRhd+Hq/+XLzx+49T9Cz
	 vT5sJSQNI9qoVQSUlcD0ky8FqwYNpbFZ56uVbZ9k24humMK4PCDGc8/03fI3di/E8C
	 N+mLtBN4kt/YNG/89mmkzzMhuBPMPUDei6bILv7l2gfKwvYuHn1l0O8a+R8y3rpjnZ
	 3+u4Vx4cimnZA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBW4y-0001eK-11;
	Fri, 08 Dec 2023 09:19:24 +0100
Date: Fri, 8 Dec 2023 09:19:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add missing GMU entry to match table
Message-ID: <ZXLRjDZn9bgiREPf@hovoldconsulting.com>
References: <20231207212441.6199-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207212441.6199-1-robdclark@gmail.com>

On Thu, Dec 07, 2023 at 01:24:39PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We also want the default domain for the GMU to be an identy domain,
> so it does not get a context bank assigned.  Without this, both
> of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
> allocating and configuring a context bank.  So GMU ends up attached
> to both cbndx 1 and cbndx 2.  This arrangement seemingly confounds
> and surprises the firmware if the GPU later triggers a translation
> fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
> getting wedged and the GPU stuck without memory access.

This sounds like something that should be backported. Should you add a
Fixes and CC-stable tag?
 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Johan

