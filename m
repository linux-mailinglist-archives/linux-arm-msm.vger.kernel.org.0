Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D7426644A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgIKQev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:34:51 -0400
Received: from foss.arm.com ([217.140.110.172]:38960 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgIKQeV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:34:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 352DF113E;
        Fri, 11 Sep 2020 09:34:21 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4BC73F73C;
        Fri, 11 Sep 2020 09:34:19 -0700 (PDT)
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
 <010101747df8e9df-fad2f88d-e970-4753-a99a-2cfeeb1a29a9-000000@us-west-2.amazonses.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
Date:   Fri, 11 Sep 2020 17:34:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <010101747df8e9df-fad2f88d-e970-4753-a99a-2cfeeb1a29a9-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-11 17:21, Sai Prakash Ranjan wrote:
> On 2020-09-11 21:37, Will Deacon wrote:
>> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>>> BTW am I supposed to have received 3 copies of everything? Because I 
>>> did...
>>
>> Yeah, this seems to be happening for all of Sai's emails :/
>>
> 
> Sorry, I am not sure what went wrong as I only sent this once
> and there are no recent changes to any of my configs, I'll
> check it further.

Actually on closer inspection it appears to be "correct" behaviour. I'm 
still subscribed to LAKML and the IOMMU list on this account, but 
normally Office 365 deduplicates so aggressively that I have rules set 
up to copy list mails that I'm cc'ed on back to my inbox, in case they 
arrive first and cause the direct copy to get eaten - apparently there's 
something unique about your email setup that manages to defeat the 
deduplicator and make it deliver all 3 copies intact... :/

Robin.
