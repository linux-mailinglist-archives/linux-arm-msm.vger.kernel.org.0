Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE2B192874
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 13:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgCYMbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 08:31:50 -0400
Received: from foss.arm.com ([217.140.110.172]:47762 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727286AbgCYMbu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 08:31:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A3D31B;
        Wed, 25 Mar 2020 05:31:49 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8983F71F;
        Wed, 25 Mar 2020 05:31:47 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
To:     Joerg Roedel <joro@8bytes.org>
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
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
 <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
 <20200324100819.GA4038@8bytes.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <d69dad81-d025-96ef-863c-553b5ed2dd8e@arm.com>
Date:   Wed, 25 Mar 2020 12:31:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324100819.GA4038@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-24 10:08 am, Joerg Roedel wrote:
> Hey Robin,
> 
> On Mon, Mar 23, 2020 at 04:02:33PM +0000, Robin Murphy wrote:
>> Yikes, this ends up pretty ugly, and I'd prefer not have this much
>> complexity hidden in macros that were intended just to be convenient
>> shorthand. Would you mind pulling in the patch below as a precursor?
> 
> Sure thing, but your mail-client seemed to have fiddled with the patch
> so that is is unusable to me. I tried to fix it up, but it still doesn't
> apply. Can you please re-send it to me either via git-send-email or just
> as a mime-attachement?

Oops, sorry - as you might imagine I'm not in my normal workflow :)

Let me rebase that onto something actually in your tree (rather than 
whatever detached HEAD this is checked out out on my laptop...) and try 
resending it properly.

>> Other than that, the rest of the series looks OK at a glance. We should also
>> move fwspec->ops to dev_iommu, as those are "IOMMU API" data rather than
>> "firmware" data, but let's consider that separately as this series is
>> already long enough.
> 
> Yes, moving ops out of fwspec is next on the list, and moving the
> iommu_group pointer into dev_iommu.

Cool, let me know if you need a hand with all the *_iommu_configure() 
stuff - I still have plans for overhauling that lot anyway, but not 
imminently, so it probably is worthwhile to do the straightforward 
housekeeping first.

Thanks,
Robin.
