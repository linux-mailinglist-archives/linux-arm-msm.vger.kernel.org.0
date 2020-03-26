Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6AA194262
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 16:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgCZPIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 11:08:37 -0400
Received: from 8bytes.org ([81.169.241.247]:55756 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgCZPIh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 11:08:37 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id D5F5329A; Thu, 26 Mar 2020 16:08:35 +0100 (CET)
Date:   Thu, 26 Mar 2020 16:08:34 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "guohanjun@huawei.com" <guohanjun@huawei.com>,
        Sudeep Holla <Sudeep.Holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for
 iommu private data
Message-ID: <20200326150834.GA6937@8bytes.org>
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
 <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
 <20200324100819.GA4038@8bytes.org>
 <d69dad81-d025-96ef-863c-553b5ed2dd8e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d69dad81-d025-96ef-863c-553b5ed2dd8e@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On Wed, Mar 25, 2020 at 12:31:46PM +0000, Robin Murphy wrote:
> Oops, sorry - as you might imagine I'm not in my normal workflow :)

No problem, nobody is right now :)

> Let me rebase that onto something actually in your tree (rather than
> whatever detached HEAD this is checked out out on my laptop...) and try
> resending it properly.

Got it, thanks. Added to the next version of the patch-set which I will
send out shortly.

> Cool, let me know if you need a hand with all the *_iommu_configure() stuff
> - I still have plans for overhauling that lot anyway, but not imminently, so
> it probably is worthwhile to do the straightforward housekeeping first.

Okay, I'll get back to you if I need help with the conversion.

Thanks,

	Joerg
