Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE4F1ECE81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 13:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgFCLhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 07:37:18 -0400
Received: from foss.arm.com ([217.140.110.172]:60264 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbgFCLhR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 07:37:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1859631B;
        Wed,  3 Jun 2020 04:37:17 -0700 (PDT)
Received: from [10.57.0.45] (unknown [10.57.0.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E3693F305;
        Wed,  3 Jun 2020 04:37:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <bf7e8ac2-51b2-d9cb-9c4f-c311297accac@arm.com>
Date:   Wed, 3 Jun 2020 12:37:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601212858.GB24287@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-01 22:28, Mathieu Poirier wrote:
> That being said I'm sure that dependencies on an IOMMU isn't a problem confined
> to coresight. I am adding Robin Murphy, who added this commit [1], to the thread
> in the hope that he can provide guidance on the right way to do this.

Right, it's not specific to CoreSight, and it's not even specific to 
IOMMUs really. In short, blame kexec ;)

The fundamental thing is that devices should stop any DMA activity at 
shutdown. For a normal poweroff you can typically get away without doing 
so, but over kexec, ongoing DMA traffic may corrupt memory in the new 
kernel (at worst, I think even DMA reads could potentially cause 
unexpected cache behaviour that might lead to mishaps, given the right 
combination of memory attributes).

IOMMUs merely help to make the situation more serious. For similar kexec 
reasons, they need to disable any existing translations at shutdown 
(imagine if the second kernel didn't have an IOMMU driver). And at that 
point, even the normal poweroff case becomes problematic, because any 
device DMA that hasn't been shut down beforehand is now not necessarily 
going benignly to memory as it would in the no-IOMMU case above, but 
potentially to random physical addresses, with all the hilarity ensuing 
that you would expect from that.

Robin.
