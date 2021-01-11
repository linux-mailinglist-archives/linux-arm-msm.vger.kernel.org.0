Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A1D2F1A9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 17:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbhAKQM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 11:12:26 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:31659 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbhAKQM0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 11:12:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610381519; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=P5+Mis721Z6vZ3WqvVWUlOlPJxsnwl96h64oYHY/Qv4=; b=t9CTpmcfrGVlMEzF63YsOpnyBGQHlFUX6DAwrPNGAo/7VCcDYLmgzaRowXfB+xmLd5AyT3p+
 N66qbFXaDHQ5FG6yaW2obkOU96XoBWiF74le/aFzeSGVgPLABl+JHjkV6q+l+3f01wC01EmE
 vQA6PECAaWurKHgrUWiJPgTaxLY=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ffc78ab415a6293c5a395fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 16:11:23
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95A15C43466; Mon, 11 Jan 2021 16:11:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BAD3DC43463;
        Mon, 11 Jan 2021 16:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BAD3DC43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 11 Jan 2021 09:11:15 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>, Jonathan <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
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
Message-ID: <20210111161115.GB29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>, Jonathan <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        martin.botka@somainline.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Daniel Vetter <daniel@ffwll.ch>,
        angelogioacchino.delregno@somainline.org,
        Dave Airlie <airlied@redhat.com>, phone-devel@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
 <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
 <CAF6AEGsd5B0R7H1noO+=LByx4zkdVvu1LALZWnevGbMRj76m2w@mail.gmail.com>
 <73609df52188588bf7d023e16a706a7a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73609df52188588bf7d023e16a706a7a@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 11, 2021 at 09:54:12AM +0530, Sai Prakash Ranjan wrote:
> Hi Rob,
> 
> On 2021-01-08 22:16, Rob Clark wrote:
> >On Fri, Jan 8, 2021 at 6:05 AM Sai Prakash Ranjan
> ><saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >>On 2021-01-08 19:09, Konrad Dybcio wrote:
> >>>> Konrad, can you please test this below change without your change?
> >>>
> >>> This brings no difference, a BUG still happens. We're still calling
> >>> to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
> >>> into an A640..
> >>>
> >>> Also, relying on disabling LLCC in the config is out of question as it
> >>> makes the arm32 kernel not compile with DRM/MSM and it just removes
> >>> the functionality on devices with a6xx.. (unless somebody removes the
> >>> dependency on it, which in my opinion is even worse and will cause
> >>> more problems for developers!).
> >>>
> >>
> >>Disabling LLCC is not the suggestion, I was under the impression that
> >>was the cause here for the smmu bug. Anyways, the check for llc slice
> >>in case llcc is disabled is not correct as well. I will send a patch for
> >>that as well.
> >>
> >>> The bigger question is how and why did that piece of code ever make it
> >>> to adreno_gpu.c and not a6xx_gpu.c?
> >>>
> >>
> >>My mistake, I will move it.
> >
> >Thanks, since we don't have kernel-CI coverage for gpu, and there
> >probably isn't one person who has all the different devices supported
> >(or enough hours in the day to test them all), it is probably
> >better/safer to keep things in the backend code that is specific to a
> >given generation.
> >
> 
> Agreed, I will post this change soon and will introduce some feature
> check as well because we will need it for iommu prot flag as per discussion
> here - https://lore.kernel.org/lkml/20210108181830.GA5457@willie-the-truck/
> 
> >>> To solve it in a cleaner way I propose to move it to an a6xx-specific
> >>> file, or if it's going to be used with next-gen GPUs, perhaps manage
> >>> calling of this code via an adreno quirk/feature in adreno_device.c.
> >>> Now that I think about it, A5xx GPMU en/disable could probably managed
> >>> like that, instead of using tons of if-statements for each GPU model
> >>> that has it..
> >>>
> >>> While we're at it, do ALL (and I truly do mean ALL, including the
> >>> low-end ones, this will be important later on) A6xx GPUs make use of
> >>> that feature?
> >>>
> >>
> >>I do not have a list of all A6XX GPUs with me currently, but from what
> >>I know, A618, A630, A640, A650 has the support.
> >>
> >
> >From the PoV of bringing up new a6xx, we should probably consider that
> >some of them may not *yet* have LLCC enabled.  I have an 8cx laptop
> >and once I find time to get the display working, the next step would
> >be bringing up a680.. and I'd probably like to start without LLCC..
> >
> 
> Right, once I move the LLCC code to a6xx specific address space creation,
> without LLCC slices for GPU specified in qcom llcc driver, we will not
> be using it.

Right. The problem here was that we were assuming an a6xx container in generic
code. Testing the existence of LLCC or not is a different problem but it is my
understanding that if we set the attribute without LLCC enabled it just gets
ignored. Is that correct Sai?

Jordan

> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
