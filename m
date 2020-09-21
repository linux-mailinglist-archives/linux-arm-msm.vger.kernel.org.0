Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D9227356D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 00:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgIUWDv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 18:03:51 -0400
Received: from foss.arm.com ([217.140.110.172]:59192 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgIUWDv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 18:03:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A75E147A;
        Mon, 21 Sep 2020 15:03:51 -0700 (PDT)
Received: from [10.57.50.108] (unknown [10.57.50.108])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300193F73B;
        Mon, 21 Sep 2020 15:03:49 -0700 (PDT)
Subject: Re: [PATCHv4 1/6] iommu/io-pgtable-arm: Add support to use system
 cache
To:     Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <3b1beb6cf6a34a44b0ecff9ec5a2105b5ff91bd4.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <20200921180318.GG3141@willie-the-truck>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <9646dd4f-f1e6-992d-b8a0-0f2c14fa9fe8@arm.com>
Date:   Mon, 21 Sep 2020 23:03:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921180318.GG3141@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-21 19:03, Will Deacon wrote:
> On Fri, Sep 11, 2020 at 07:57:18PM +0530, Sai Prakash Ranjan wrote:
>> Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
>> attributes set in TCR for the page table walker when
>> using system cache.
> 
> I wonder if the panfrost folks can reuse this for the issue discussed
> over at:
> 
> https://lore.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com

Isn't this all hinged around the outer cacheability attribute, rather 
than shareability (since these are nominally NC mappings and thus 
already properly Osh)? The Panfrost issue is just about shareability 
domains being a bit wonky; the cacheability attributes there are 
actually reasonably normal (other than not having a non-cacheable type 
at all, only a choice of allocation policies...)

Robin.

> However, Sai, your email setup went wrong when you posted this so you
> probably need to repost now that you have that fixed.
> 
> Will
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
