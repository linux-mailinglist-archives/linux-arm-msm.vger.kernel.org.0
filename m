Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DB21D55DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 18:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgEOQZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 12:25:30 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:30124 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726188AbgEOQZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 12:25:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589559929; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3snPa8PcNFz7GP9EFRf4ot7oj2RCpdq3CG7XU0T81c0=;
 b=mywKDQ+/RcLNq0GSbv74jhPoWRA0OD0OyA6O0WdgzmAk2ox0v4L3J8DA44JYLxcy3O0YPk2f
 ezUmCBy+cXNxYClDTnTSQkEbsLFt9ZZiBJrYPTlQtdIjOzzFN1L2zjluoBfmqx0ulm5bliw3
 4jVGoRHhsIW1EAEdIL7l8UidtTI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebec274.7fda28651688-smtp-out-n03;
 Fri, 15 May 2020 16:25:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 305C2C43636; Fri, 15 May 2020 16:25:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D897C433F2;
        Fri, 15 May 2020 16:25:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 May 2020 21:55:23 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Tingwei Zhang <tingwei@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH] coresight: etm4x: Add support to disable trace unit power
 up
In-Reply-To: <89be7790b7fdd4b0268919e060198926@codeaurora.org>
References: <20200514105915.27516-1-saiprakash.ranjan@codeaurora.org>
 <20200514180055.GA29384@xps15>
 <2c932d57288508cc72a6ee323cf5595e@codeaurora.org>
 <CANLsYkxun2EWGeLU42ShbqkJMtCTh+Q9L3t=CXQR+-2zVuuJYg@mail.gmail.com>
 <a0f8f01f28506e10001885e387d3cb4f@codeaurora.org>
 <20200515155144.GA7085@xps15>
 <89be7790b7fdd4b0268919e060198926@codeaurora.org>
Message-ID: <6cccfa9d18ce86c929da4ec042b4194d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-15 21:28, Sai Prakash Ranjan wrote:
> Hi Mathieu,
> 
> On 2020-05-15 21:21, Mathieu Poirier wrote:
>> On Fri, May 15, 2020 at 08:37:13PM +0530, Sai Prakash Ranjan wrote:
>>> Hi Mathieu,
>>> 
>>> On 2020-05-15 20:22, Mathieu Poirier wrote:
>>> > On Thu, 14 May 2020 at 12:39, Sai Prakash Ranjan
>>> > <saiprakash.ranjan@codeaurora.org> wrote:
>>> > >
>>> > > Hi Mathieu,
>>> > >
>>> > > On 2020-05-14 23:30, Mathieu Poirier wrote:
>>> > > > Good morning Sai,
>>> > > >
>>> > > > On Thu, May 14, 2020 at 04:29:15PM +0530, Sai Prakash Ranjan wrote:
>>> > > >> From: Tingwei Zhang <tingwei@codeaurora.org>
>>> > > >>
>>> > > >> On some Qualcomm Technologies Inc. SoCs like SC7180, there
>>> > > >> exists a hardware errata where the APSS (Application Processor
>>> > > >> SubSystem)/CPU watchdog counter is stopped when ETM register
>>> > > >> TRCPDCR.PU=1.
>>> > > >
>>> > > > Fun stuff...
>>> > > >
>>> > >
>>> > > Yes :)
>>> > >
>>> > > >> Since the ETMs share the same power domain as
>>> > > >> that of respective CPU cores, they are powered on when the
>>> > > >> CPU core is powered on. So we can disable powering up of the
>>> > > >> trace unit after checking for this errata via new property
>>> > > >> called "qcom,tupwr-disable".
>>> > > >>
>>> > > >> Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
>>> > > >> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> > > >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> > > >
>>> > > > Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> > > > Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
>>> > > >
>>> > >
>>> > > Tingwei is the author, so if I understand correctly, his signed-off-by
>>> > > should appear first, am I wrong?
>>> >
>>> > It's a gray area and depends on who's code is more prevalent in the
>>> > patch.  If Tingwei wrote the most of the code then his name is in the
>>> > "from:" section, yours as co-developer and he signs off on it (as I
>>> > suggested).  If you did most of the work then it is the opposite.
>>> > Adding a Co-developed and a signed-off with the same name doesn't make
>>> > sense.
>>> >
>>> 
>>> I did check the documentation for submitting patches:
>>> Documentation/process/submitting-patches.rst. And it clearly states
>>> that "Co-developed-by must be followed by Signed-off by the co-author
>>> and the last Signed-off-by: must always be that of the developer
>>> submitting the patch".
>>> 
>>> Quoting below from the doc:
>>> 
>>> Co-developed-by: <snip> ...Since
>>> Co-developed-by: denotes authorship, every Co-developed-by: must be
>>> immediately
>>> followed by a Signed-off-by: of the associated co-author.  Standard 
>>> sign-off
>>> procedure applies, i.e. the ordering of Signed-off-by: tags should 
>>> reflect
>>> the
>>> chronological history of the patch insofar as possible, regardless of
>>> whether
>>> the author is attributed via From: or Co-developed-by:.  Notably, the 
>>> last
>>> Signed-off-by: must always be that of the developer submitting the 
>>> patch.
>> 
>> Ah yes, glad to see that got clarified.  You can ignore my 
>> recommendation on
>> that snippet.
>> 
>>> 
>>> > >
>>> > > >> ---
>>> > > >>  .../devicetree/bindings/arm/coresight.txt     |  6 ++++
>>> > > >>  drivers/hwtracing/coresight/coresight-etm4x.c | 29
>>> > > >> ++++++++++++-------
>>> > > >
>>> > > > Please split in two patches.
>>> > > >
>>> > >
>>> > > Sure, I will split the dt-binding into separate patch, checkpatch did
>>> > > warn.
>>> >
>>> > And you still sent me the patch...  I usually run checkpatch before
>>> > all the submissions I review and flatly ignore patches that return
>>> > errors.  You got lucky...
>>> >
>>> 
>>> I did not mean to ignore it or else I wouldn't have run checkpatch 
>>> itself.
>>> I checked other cases like "arm,scatter-gather" where the binding and 
>>> the
>>> driver change was in a single patch, hence I thought it's not a very 
>>> strict
>>> rule.
>> 
>> The patch has another warning for a line over 80 characters, that 
>> should have
>> been fixed before sending.  Putting DT changes in a separate patch is 
>> always
>> better for the DT people.  They review tons of patches and making 
>> their life
>> easier is always a good thing.
>> 
> 
> Ok, I will fix this and resend. I did not want to change it in case if
> it affects
> readability since most maintainers prefer to ignore this 80 characters
> warning if
> it affects readability. I will keep this in mind for future patches as 
> well.
> 

Now fixed all checkpatch warnings and addressed other review comments.
Posted v3 - https://lore.kernel.org/patchwork/cover/1242572/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
