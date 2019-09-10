Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDA1FAEFF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 18:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436687AbfIJQwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 12:52:06 -0400
Received: from foss.arm.com ([217.140.110.172]:38308 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436473AbfIJQwF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 12:52:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13301000;
        Tue, 10 Sep 2019 09:52:04 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2D733F71F;
        Tue, 10 Sep 2019 09:52:00 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
 explicitly
To:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc:     "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>
References: <20190906214409.26677-1-robdclark@gmail.com>
 <20190906214409.26677-2-robdclark@gmail.com>
 <20190910081415.GB3247@8bytes.org>
 <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <4b5b59bb-39a4-0757-e2bb-0961cfc7e4c1@arm.com>
Date:   Tue, 10 Sep 2019 17:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2019 16:34, Rob Clark wrote:
> On Tue, Sep 10, 2019 at 1:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>>
>> On Fri, Sep 06, 2019 at 02:44:01PM -0700, Rob Clark wrote:
>>> @@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>>>
>>>        mutex_lock(&group->mutex);
>>>        list_add_tail(&device->list, &group->devices);
>>> -     if (group->domain)
>>> +     if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))
>>
>> Hmm, this code usually runs at enumeration time when no driver is
>> attached to the device. Actually it would be pretty dangerous when this
>> code runs while a driver is attached to the device. How does that change
>> make things work for you?
>>
> 
> I was seeing this get called via the path driver_probe_device() ->
> platform_dma_configure() -> of_dma_configure() -> of_iommu_configure()
> -> iommu_probe_device() -> ...
> 
> The only cases I was seeing where dev->driver is NULL where a few
> places that drivers call of_dma_configure() on their own sub-devices.
> But maybe there are some other paths that I did not notice?

For the of_iommu flow, it very much depends on your DT layout and driver 
probe order as to whether you catch the "proper" call from 
iommu_bus_notifier()/iommu_bus_init() or the late "replay" from 
of_iommu_configure(). I wouldn't make any assumptions of consistency.

Robin.
