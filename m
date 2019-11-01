Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D84FEC6D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 17:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbfKAQbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 12:31:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbfKAQbm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 12:31:42 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0798621855;
        Fri,  1 Nov 2019 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572625902;
        bh=lcwuDtMMVht6znRRW2+vxRC911paPSnMy5ommgfPMo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WyGXyw2KNWgeMv/p+9wB4TlQogOYBPuCDvs/wMc3yEFpca+YjfRX24yiOHCWwrYhy
         SGS8W7od9h4yQTvj9ZgCLshp3CPe6la+7U/LLWOsZJWI+9JXZXqE2YacivSJfSoilJ
         MXowa3plebKou/xRmn1lhQyUCPFqgoseP/v/s2GU=
Date:   Fri, 1 Nov 2019 16:31:36 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        agross@kernel.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCHv7 0/3] QCOM smmu-500 wait-for-safe handling for sdm845
Message-ID: <20191101163136.GC3603@willie-the-truck>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 20, 2019 at 01:34:26PM +0530, Sai Prakash Ranjan wrote:
> Previous version of the patches are at [1]:
> 
> QCOM's implementation of smmu-500 on sdm845 adds a hardware logic called
> wait-for-safe. This logic helps in meeting the invalidation requirements
> from 'real-time clients', such as display and camera. This wait-for-safe
> logic ensures that the invalidations happen after getting an ack from these
> devices.
> In this patch-series we are disabling this wait-for-safe logic from the
> arm-smmu driver's probe as with this enabled the hardware tries to
> throttle invalidations from 'non-real-time clients', such as USB and UFS.
> 
> For detailed information please refer to patch [3/4] in this series.
> I have included the device tree patch too in this series for someone who
> would like to test out this. Here's a branch [2] that gets display on MTP
> SDM845 device.
> 
> This patch series is inspired from downstream work to handle under-performance
> issues on real-time clients on sdm845. In downstream we add separate page table
> ops to handle TLB maintenance and toggle wait-for-safe in tlb_sync call so that
> achieve required performance for display and camera [3, 4].

What's the plan for getting this merged? I'm not happy taking the firmware
bits without Andy's ack, but I also think the SMMU changes should go via
the IOMMU tree to avoid conflicts.

Andy?

Will
