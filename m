Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837321C86B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 12:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgEGKbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 06:31:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEGKbg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 06:31:36 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EE15207DD;
        Thu,  7 May 2020 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588847495;
        bh=RTSm4kdRgeWc+RyZlG1E78GC90cFNav4NdQnUzi52rQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zrL54q9y/iG40sCchowlpbj1cSUFUrH4BmLWyfzvLXO5aO9nI4q/SkI51IEcOqNP3
         REymdcG4+Skc3w+VdctU0Dns+1uaZrLY+de4e0oZemLRLd6awdttfqf2n8kml7QTan
         ELNMyjNlcCI1CWldZ/TGq3q7px8vHbuEk/VTjnJA=
Date:   Thu, 7 May 2020 11:31:29 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, jroedel@suse.de,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv4 0/6] iommu/arm-smmu: Allow client devices to select
 identity mapping
Message-ID: <20200507103129.GA29541@willie-the-truck>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <aa54fd00a6d353c72664e41b7a4a4e3d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa54fd00a6d353c72664e41b7a4a4e3d@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 03:58:06PM +0530, Sai Prakash Ranjan wrote:
> Hi Will, Joerg
> 
> On 2020-04-21 00:03, Sai Prakash Ranjan wrote:
> > This series allows DRM, Modem devices to set a default
> > identity mapping in qcom smmu implementation.
> > 
> > Patch 1 is cleanup to support other SoCs to call into
> > QCOM specific  implementation.
> > Patch 2 sets the default identity domain for DRM devices.
> > Patch 3 implements def_domain_type callback for arm-smmu.
> > Patch 4 sets the default identity domain for modem device.
> > Patch 5-6 adds the iommus property for mss pil.
> > 
> > This is based on Joerg's tree:
> >  -
> > https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2
> > 
> > v4:
> >  * Updated commit msg for mss pil requesting direct mapping
> > 
> > v3:
> >  * Use arm_smmu_master_cfg to get impl instead of long way as per Robin.
> >  * Use def_domain_type name for the callback in arm_smmu_imp as per
> > Robin
> > 
> > Jordan Crouse (1):
> >   iommu/arm-smmu: Allow client devices to select direct mapping
> > 
> > Sai Prakash Ranjan (2):
> >   iommu: arm-smmu-impl: Convert to a generic reset implementation
> >   iommu/arm-smmu: Implement iommu_ops->def_domain_type call-back
> > 
> > Sibi Sankar (3):
> >   iommu/arm-smmu-qcom: Request direct mapping for modem device
> >   dt-bindings: remoteproc: qcom: Add iommus property
> >   arm64: dts: qcom: sdm845-cheza: Add iommus property
> > 
> >  .../bindings/remoteproc/qcom,q6v5.txt         |  3 ++
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  5 +++
> >  drivers/iommu/arm-smmu-impl.c                 |  8 ++--
> >  drivers/iommu/arm-smmu-qcom.c                 | 37 +++++++++++++++++--
> >  drivers/iommu/arm-smmu.c                      | 12 ++++++
> >  drivers/iommu/arm-smmu.h                      |  1 +
> >  6 files changed, 60 insertions(+), 6 deletions(-)
> 
> This series is reviewed by Robin.
> Any chance this series can make it to 5.8?

I'm planning to queue smmu stuff next week, been busy with arm64 stuff
so far, sorry.

Will
