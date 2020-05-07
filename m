Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F5B1C8787
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 13:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgEGLGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 07:06:03 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29758 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgEGLGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 07:06:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588849563; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KUkv11UrsJT4bCOAv4o9yBeyPANsHJVXo3wLqp+3x3w=;
 b=ohl5ibJIZrusXwdN3xIjxiqErLs9AMzKuowN8jxzZQPfnOpQ/7ABO+4d0Y7gdtDWJi0B9v/b
 X3S7bqOWuBZBFeOQbpn2tXishsRnQzN7Nq1AT6YsONja2XlhhVJCf1n5gODoi5UlwoBnrFxC
 0v/B/GCZP1cItsKO9qw5LISJ7dc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb3eb8a.7f4612d8bed8-smtp-out-n04;
 Thu, 07 May 2020 11:05:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABF22C433D2; Thu,  7 May 2020 11:05:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D6E4C433F2;
        Thu,  7 May 2020 11:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 07 May 2020 16:35:44 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more
 informative
In-Reply-To: <2f3cd963-dffe-290b-02bf-819687713738@arm.com>
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
 <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
 <0b5098c28360d018f390a97155b9776c@codeaurora.org>
 <2f3cd963-dffe-290b-02bf-819687713738@arm.com>
Message-ID: <7c3fd8c1d5b26ac277b8729d59531474@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-07 16:03, Robin Murphy wrote:
> On 2020-05-07 11:04 am, Sai Prakash Ranjan wrote:
>> Hi,
>> 
>> On 2020-05-07 05:40, Doug Anderson wrote:
>>> Hi,
>>> 
>>> On Thu, Apr 23, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> 
>>> wrote:
>>>> 
>>>> Hi,
>>>> 
>>>> On Thu, Apr 23, 2020 at 2:55 AM Sai Prakash Ranjan
>>>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>> >
>>>> > Currently on reboot/shutdown, the following messages are
>>>> > displayed on the console as error messages before the
>>>> > system reboots/shutdown as part of remove callback.
>>>> >
>>>> > On SC7180:
>>>> >
>>>> >   arm-smmu 15000000.iommu: removing device with active domains!
>>>> >   arm-smmu 5040000.iommu: removing device with active domains!
>>>> >
>>>> > Make this error message more informative and less scary.
>>>> >
>>>> > Reported-by: Douglas Anderson <dianders@chromium.org>
>>>> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
>>>> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> > ---
>>>> >  drivers/iommu/arm-smmu.c | 2 +-
>>>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>>> 
>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> 
>>> Is this patch waiting on anything in particular now?  Do we need
>>> reviews from Robin and/or Will?
>>> 
>> 
>> Waiting for their reviews as they are the maintainers/reviewers :)
> 
> Sorry, this did register at the time, I just felt that it's a bit
> redundant to give a review tag to say "yes, this is exactly what I
> suggested" :)
> 
> That said, I do wish I hadn't forgotten about the dev_notice message
> level, but I think that lies over in the conceptual purity corner
> rather than making any practical difference, so I'm still OK with the
> patch as-is. Will?
> 

I can change to dev_notice if you have strong preference for that.
I chose dev_info since we see the messages on every reboot and that 
makes
it more informational than something to notice everytime.

> 
> p.s. whoever has this entry in their address book for the IOMMU list 
> (Doug?):
> 
> "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
> Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
> 
> it really messes up Thunderbird's ability to generate working headers
> for a reply ;)

Not me ;)

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
