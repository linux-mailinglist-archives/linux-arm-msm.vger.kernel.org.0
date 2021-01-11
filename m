Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947EC2F0BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 05:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbhAKEZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jan 2021 23:25:14 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:31920 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbhAKEZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jan 2021 23:25:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610339090; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YjLVjY//RNNWhBt038pBhnPhk7W2XO47G1a0lqsYg4I=;
 b=U0Nrt72BxfhFKJYwnAZ4JQ7hIQ1Er04eYgXfu8m5M4TdSd2uQWJM5yO0C4DboBNgh2kLWqpr
 EJv4ILoofN2iQWmSo16+oPcQXSwzZ1CJiZE55QgXHinbgy+8oEULBseIWolpqtTIpHMse1tB
 6sSk1VDtyY5BJU/icAFQL5tiXLE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ffbd2eec88af06107b8d303 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 04:24:14
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DDC15C433CA; Mon, 11 Jan 2021 04:24:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8D5CC433C6;
        Mon, 11 Jan 2021 04:24:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Jan 2021 09:54:12 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        martin.botka@somainline.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Daniel Vetter <daniel@ffwll.ch>,
        angelogioacchino.delregno@somainline.org,
        Dave Airlie <airlied@redhat.com>, phone-devel@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
In-Reply-To: <CAF6AEGsd5B0R7H1noO+=LByx4zkdVvu1LALZWnevGbMRj76m2w@mail.gmail.com>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
 <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
 <CAF6AEGsd5B0R7H1noO+=LByx4zkdVvu1LALZWnevGbMRj76m2w@mail.gmail.com>
Message-ID: <73609df52188588bf7d023e16a706a7a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2021-01-08 22:16, Rob Clark wrote:
> On Fri, Jan 8, 2021 at 6:05 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On 2021-01-08 19:09, Konrad Dybcio wrote:
>> >> Konrad, can you please test this below change without your change?
>> >
>> > This brings no difference, a BUG still happens. We're still calling
>> > to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
>> > into an A640..
>> >
>> > Also, relying on disabling LLCC in the config is out of question as it
>> > makes the arm32 kernel not compile with DRM/MSM and it just removes
>> > the functionality on devices with a6xx.. (unless somebody removes the
>> > dependency on it, which in my opinion is even worse and will cause
>> > more problems for developers!).
>> >
>> 
>> Disabling LLCC is not the suggestion, I was under the impression that
>> was the cause here for the smmu bug. Anyways, the check for llc slice
>> in case llcc is disabled is not correct as well. I will send a patch 
>> for
>> that as well.
>> 
>> > The bigger question is how and why did that piece of code ever make it
>> > to adreno_gpu.c and not a6xx_gpu.c?
>> >
>> 
>> My mistake, I will move it.
> 
> Thanks, since we don't have kernel-CI coverage for gpu, and there
> probably isn't one person who has all the different devices supported
> (or enough hours in the day to test them all), it is probably
> better/safer to keep things in the backend code that is specific to a
> given generation.
> 

Agreed, I will post this change soon and will introduce some feature
check as well because we will need it for iommu prot flag as per 
discussion
here - 
https://lore.kernel.org/lkml/20210108181830.GA5457@willie-the-truck/

>> > To solve it in a cleaner way I propose to move it to an a6xx-specific
>> > file, or if it's going to be used with next-gen GPUs, perhaps manage
>> > calling of this code via an adreno quirk/feature in adreno_device.c.
>> > Now that I think about it, A5xx GPMU en/disable could probably managed
>> > like that, instead of using tons of if-statements for each GPU model
>> > that has it..
>> >
>> > While we're at it, do ALL (and I truly do mean ALL, including the
>> > low-end ones, this will be important later on) A6xx GPUs make use of
>> > that feature?
>> >
>> 
>> I do not have a list of all A6XX GPUs with me currently, but from what
>> I know, A618, A630, A640, A650 has the support.
>> 
> 
> From the PoV of bringing up new a6xx, we should probably consider that
> some of them may not *yet* have LLCC enabled.  I have an 8cx laptop
> and once I find time to get the display working, the next step would
> be bringing up a680.. and I'd probably like to start without LLCC..
> 

Right, once I move the LLCC code to a6xx specific address space 
creation,
without LLCC slices for GPU specified in qcom llcc driver, we will not
be using it.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
