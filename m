Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD14C3F07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 19:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730348AbfJARwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 13:52:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37462 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfJARwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 13:52:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 233ED61156; Tue,  1 Oct 2019 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569952336;
        bh=EqX6F8UDW8JnIw6Hk7q7L1dvCzSEMNOpUg0sXKY32yA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oj2/PZIWdgJsjvx+7sB/HBZhXwlRP+/bp7ky6LvLjqD4g9BiNDvcglCZ62SjD1tBq
         QAgX6+g9hprx8wVBP7v9QVjcT7vKvuZQPgA01lEQC46BDaHrF+QmyochFDLUPJwYM0
         4m7xO8XStOzyEZlV7qC04Ce1g/yklG9gIRkBlQgg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 104336083C;
        Tue,  1 Oct 2019 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569952335;
        bh=EqX6F8UDW8JnIw6Hk7q7L1dvCzSEMNOpUg0sXKY32yA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lTkHXHKunAsS8EWDCTk+X0f1W5i2eyWsNoTkfA4JrXjUWLAdpwvRUvZwQy/sqsCha
         kE/4opxhjU4rATlKtRc59y0kRLw3/N3qA8EqPvRggNEEkhrNsP+u2hClns35iEAvhg
         rCNeqT75U1nPhoOrRrPqkFZOS/g7yYIjD6ij5xpI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Oct 2019 10:52:15 -0700
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
In-Reply-To: <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
Message-ID: <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-01 10:14, Jeffrey Hugo wrote:
> On Tue, Oct 1, 2019 at 11:04 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On 2019-10-01 09:13, Jeffrey Hugo wrote:
>> > Sai,
>> >
>> > This patch breaks boot on the 835 laptops.  However, I haven't seen
>> > the same issue on the MTP.  I wonder, is coresight expected to work
>> > with production fused devices?  I wonder if thats the difference
>> > between the laptop and MTP that is causing the issue.
>> >
>> > Let me know what I can do to help debug.
>> >
>> 
>> I did test on MSM8998 MTP and didn't face any issue. I am guessing 
>> this
>> is the same issue which you reported regarding cpuidle? Coresight ETM
> 
> Yes, its the same issue.  Right now, I need both patches reverted to 
> boot.
> 
>> and cpuidle do not work well together since ETMs share the same power
>> domain as CPU and they might get turned off when CPU enters idle 
>> states.
>> Can you try with cpuidle.off=1 cmdline or just remove idle states from
>> DT to confirm? If this is the issue, then we can try the below patch
>> from Andrew Murray for ETM save and restore:
>> 
>> https://patchwork.kernel.org/patch/11097893/
> 
> Is there still value in testing this if the idle states are removed,
> yet the coresight nodes still cause issues?
> 
> Funny enough, I'm using the arm64 defconfig which doesn't seem to
> select CONFIG_CORESIGHT, so I'm not even sure what would be binding to
> the DT devices...
> 

Haan then likely it's the firmware issue.
We should probably disable coresight in soc dtsi and enable only for 
MTP. For now you can add a status=disabled for all coresight nodes in 
msm8998.dtsi and I will send the patch doing the same in a day or 
two(sorry I am travelling currently).

Thanks,
Sai

