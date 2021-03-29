Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5629934D2B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 16:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhC2Orm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 10:47:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231233AbhC2Orf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 10:47:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B735660295;
        Mon, 29 Mar 2021 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617029254;
        bh=QmIftYcSBB5/j37ikRpbaopMaPJQYPRqWGVN0N5sWFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tFhNX5fo7AsHwvq51sdRIDHwQybyYINTNq3/3EiYjmzRfe8orwPSfNlSIeyIBBtpx
         8R7GSjvjU7teEUghRvUzonKqpXFS0aSTUxMefyqv2iZCJ4PBCG7fkFWudLQGv5ZHBj
         S+HOPJ9kNO2wOfx+jjhEIsQPDM01f811bsOJBbNcrtv1394E07pFR7j3czTu1TBEju
         B+k25ajEQk5NDWmDLKo3PuGCEhUNT4iJ12TPzCFmlUW3yDjjDzhLrpxAaGnoStFYNW
         jn7MvkFREy7cxAHBBpKvspSP3heLGB3YM89OMZhggpSR9T3Pi5lTPe091nYsHseM/7
         4cJHGpsFuRPIQ==
Date:   Mon, 29 Mar 2021 15:47:29 +0100
From:   Will Deacon <will@kernel.org>
To:     Eric Anholt <eric@anholt.net>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
Message-ID: <20210329144729.GB4203@willie-the-truck>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> the GPU from wedging and then sometimes wedging the kernel after a
> page fault), but it doesn't have separate pagetables support yet in
> drm/msm so we can't go all the way to the TTBR1 path.

What do you mean by "doesn't have separate pagetables support yet"? The
compatible string doesn't feel like the right way to determine this.

Will
