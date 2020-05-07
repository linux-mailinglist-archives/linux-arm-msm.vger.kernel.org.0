Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FDE1C86F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 12:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgEGKdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 06:33:42 -0400
Received: from foss.arm.com ([217.140.110.172]:56020 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727849AbgEGKdl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 06:33:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98D8ED6E;
        Thu,  7 May 2020 03:33:40 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58E6F3F71F;
        Thu,  7 May 2020 03:33:39 -0700 (PDT)
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more
 informative
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
 <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
 <0b5098c28360d018f390a97155b9776c@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <2f3cd963-dffe-290b-02bf-819687713738@arm.com>
Date:   Thu, 7 May 2020 11:33:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0b5098c28360d018f390a97155b9776c@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-07 11:04 am, Sai Prakash Ranjan wrote:
> Hi,
> 
> On 2020-05-07 05:40, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Apr 23, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> 
>> wrote:
>>>
>>> Hi,
>>>
>>> On Thu, Apr 23, 2020 at 2:55 AM Sai Prakash Ranjan
>>> <saiprakash.ranjan@codeaurora.org> wrote:
>>> >
>>> > Currently on reboot/shutdown, the following messages are
>>> > displayed on the console as error messages before the
>>> > system reboots/shutdown as part of remove callback.
>>> >
>>> > On SC7180:
>>> >
>>> >   arm-smmu 15000000.iommu: removing device with active domains!
>>> >   arm-smmu 5040000.iommu: removing device with active domains!
>>> >
>>> > Make this error message more informative and less scary.
>>> >
>>> > Reported-by: Douglas Anderson <dianders@chromium.org>
>>> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
>>> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> > ---
>>> >  drivers/iommu/arm-smmu.c | 2 +-
>>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> Is this patch waiting on anything in particular now?  Do we need
>> reviews from Robin and/or Will?
>>
> 
> Waiting for their reviews as they are the maintainers/reviewers :)

Sorry, this did register at the time, I just felt that it's a bit 
redundant to give a review tag to say "yes, this is exactly what I 
suggested" :)

That said, I do wish I hadn't forgotten about the dev_notice message 
level, but I think that lies over in the conceptual purity corner rather 
than making any practical difference, so I'm still OK with the patch 
as-is. Will?

Robin.


p.s. whoever has this entry in their address book for the IOMMU list 
(Doug?):

"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>

it really messes up Thunderbird's ability to generate working headers 
for a reply ;)
