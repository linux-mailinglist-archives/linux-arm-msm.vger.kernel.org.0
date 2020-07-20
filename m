Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EB3225AB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 11:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgGTJDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 05:03:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgGTJDo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 05:03:44 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC263208E4;
        Mon, 20 Jul 2020 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595235823;
        bh=KcQt2EOigF1ebrTQ7hvGmXwS8Ro1HrFCMeZYHFhnS7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2MQ1krqOi3hi5kU835rdrlryHLYqM1P79nmjhvl/68c5WzpyyCv+6MttAMk7f8ulC
         YeFKtEdgbAcBW1900hLCi6R7J7eTvWGEVT8fSsekUCI9pgNtzklh3LRlfN5Yzz1rlp
         QzmMdqjcenT2oFxV7+Mb/zf/kuE5sm2d2fy1q2pQ=
Date:   Mon, 20 Jul 2020 10:03:38 +0100
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, jcrouse@codeaurora.org
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu: Setup identity domain for boot
 mappings
Message-ID: <20200720090338.GB11189@willie-the-truck>
References: <20200717001619.325317-1-bjorn.andersson@linaro.org>
 <20200717001619.325317-6-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717001619.325317-6-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 05:16:19PM -0700, Bjorn Andersson wrote:
> With many Qualcomm platforms not having functional S2CR BYPASS a
> temporary IOMMU domain, without translation, needs to be allocated in
> order to allow these memory transactions.
> 
> Unfortunately the boot loader uses the first few context banks, so
> rather than overwriting a active bank the last context bank is used and
> streams are diverted here during initialization.
> 
> This also performs the readback of SMR registers for the Qualcomm
> platform, to trigger the mechanism.
> 
> This is based on prior work by Thierry Reding and Laurentiu Tudor.
> 
> Tested-by: John Stultz <john.stultz@linaro.org>
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Rebased to avoid conflict
> - Picked up tested-by
> 
>  drivers/iommu/arm-smmu-qcom.c | 11 +++++
>  drivers/iommu/arm-smmu.c      | 79 +++++++++++++++++++++++++++++++++--

Perhaps the CB allocator callback can help to reduce the changes to the core
driver here. What do you think?

Will
