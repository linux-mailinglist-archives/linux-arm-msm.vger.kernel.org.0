Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C887D38E6EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 14:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhEXMuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 08:50:08 -0400
Received: from foss.arm.com ([217.140.110.172]:41900 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232371AbhEXMuB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 08:50:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B1B7113E;
        Mon, 24 May 2021 05:48:33 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43B153F719;
        Mon, 24 May 2021 05:48:31 -0700 (PDT)
Subject: Re: [PATCH 0/3] iommu/arm-smmu: Qualcomm bootsplash/efifb
To:     Lee Jones <lee.jones@linaro.org>, Will Deacon <will@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Thierry Reding <treding@nvidia.com>
References: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
 <20200108091641.GA15147@willie-the-truck>
 <CAF2Aj3iKk2LSA5XC76pNiLV8a76BkibUitof-dix8rqkc0qiow@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1a93ede6-7af5-dbc8-f655-8b96afa4a277@arm.com>
Date:   Mon, 24 May 2021 13:48:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAF2Aj3iKk2LSA5XC76pNiLV8a76BkibUitof-dix8rqkc0qiow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-24 13:03, Lee Jones wrote:
> On Wed, 8 Jan 2020 at 09:16, Will Deacon <will@kernel.org> wrote:
> 
>> On Thu, Dec 26, 2019 at 02:17:06PM -0800, Bjorn Andersson wrote:
>>> These patches implements the stream mapping inheritance that's necessary
>> in
>>> order to not hit a security violation as the display hardware looses its
>> stream
>>> mapping during initialization of arm-smmu in various Qualcomm platforms.
>>>
>>> This was previously posted as an RFC [1], changes since then involves the
>>> rebase and migration of the read-back code to the Qualcomm specific
>>> implementation, the mapping is maintained indefinitely - to handle probe
>>> deferring clients - and rewritten commit messages.
>>
>> I don't think we should solve this in a Qualcomm-specific manner. Please
>> can
>> you take a look at the proposal from Thierry [1] and see whether or not it
>> works for you?
>>
> 
> Did this or Thierry's solution ever gain traction?
> 
> Or are all the parties still 'solving' this downstream?

I think this particular series is what eventually ended up upstream as 
07a7f2caaa5a and f9081b8ff593 (plus a couple of tweaks later). Progress 
is slow on the more general solution, but still happening - I see there 
was a new version recently which I've not had time to properly look at yet.

Robin.
