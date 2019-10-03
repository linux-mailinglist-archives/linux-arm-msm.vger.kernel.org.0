Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE91CB050
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 22:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730644AbfJCUm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 16:42:27 -0400
Received: from foss.arm.com ([217.140.110.172]:56256 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbfJCUm0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 16:42:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF79F337;
        Thu,  3 Oct 2019 13:42:25 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E00273F739;
        Thu,  3 Oct 2019 13:42:23 -0700 (PDT)
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
To:     Tim Harvey <tharvey@gateworks.com>,
        Douglas Anderson <dianders@chromium.org>,
        Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
        linux-arm-msm@vger.kernel.org, evgreen@chromium.org,
        tfiga@chromium.org, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190301192017.39770-1-dianders@chromium.org>
 <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com>
Date:   Thu, 3 Oct 2019 21:42:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

On 2019-10-03 7:27 pm, Tim Harvey wrote:
> On Fri, Mar 1, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> If you're bisecting why your peripherals stopped working, it's
>> probably this CL.  Specifically if you see this in your dmesg:
>>    Unexpected global fault, this could be serious
>> ...then it's almost certainly this CL.
>>
>> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
>> is insecure and effectively disables the protection they provide.
>> There are few reasons to allow unmatched stream bypass, and even fewer
>> good ones.
>>
>> This patch starts the transition over to make it much harder to run
>> your system insecurely.  Expected steps:
>>
>> 1. By default disable bypass (so anyone insecure will notice) but make
>>     it easy for someone to re-enable bypass with just a KConfig change.
>>     That's this patch.
>>
>> 2. After people have had a little time to come to grips with the fact
>>     that they need to set their IOMMUs properly and have had time to
>>     dig into how to do this, the KConfig will be eliminated and bypass
>>     will simply be disabled.  Folks who are truly upset and still
>>     haven't fixed their system can either figure out how to add
>>     'arm-smmu.disable_bypass=n' to their command line or revert the
>>     patch in their own private kernel.  Of course these folks will be
>>     less secure.
>>
>> Suggested-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
> 
> Hi Doug / Robin,
> 
> I ran into this breaking things on OcteonTx boards based on CN80XX
> CPU. The IOMMU configuration is a bit beyond me and I'm hoping you can
> offer some advice. The IOMMU here is cavium,smmu-v2 as defined in
> https://github.com/Gateworks/dts-newport/blob/master/cn81xx-linux.dtsi
> 
> Booting with 'arm-smmu.disable_bypass=n' does indeed work around the
> breakage as the commit suggests.
> 
> Any suggestions for a proper fix?

Ah, you're using the old "mmu-masters" binding (and in a way which isn't 
well-defined - it's never been specified what the stream ID argument(s) 
would mean for a PCI host bridge, and Linux just ignores them). The 
ideal thing would be to update the DT to generic "iommu-map" properties 
- it's been a long time since I last played with a ThunderX, but I 
believe the SMMU stream IDs should just be the same as the ITS device 
IDs (which is how the "mmu-masters" mapping would have played out anyway).

The arm-smmu driver support for the old binding has always relied on 
implicit bypass - there are technical reasons why we can't realistically 
support the full functionality offered to the generic bindings, but it 
would be possible to add some degree of workaround to prevent it 
interacting quite so poorly with disable_bypass, if necessary. Do you 
have deployed systems with DTs that can't be updated, but still might 
need to run new kernels?

Robin.
