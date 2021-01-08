Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30102EF3AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 15:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbhAHOG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 09:06:26 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:28885 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbhAHOG0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 09:06:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610114766; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NolXsxXc4LnP1hy9iZM7qEDax7wxHeKW7dI9mmmMmqw=;
 b=MMYicWq2rH34P5q0rcq8ez8SKY88Dcly9fZn88IrEHZfW6YQpzBJAONLWOYBpp3/RNqRsYvs
 NS/ekjZYaWVfpUgKV+J3E8e9dVv1bgO3IQKybQhaqVMITgBcXEfYRVauMrjcQwHD1+PhPbtF
 F3WImDzL4daBw0VM+eQ439d97gY=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ff866ae4c4e6d4a2bc86c63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 14:05:34
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78D35C43465; Fri,  8 Jan 2021 14:05:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 726EDC433C6;
        Fri,  8 Jan 2021 14:05:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Jan 2021 19:35:33 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     robdclark@gmail.com, airlied@linux.ie, airlied@redhat.com,
        akhilpo@codeaurora.org, angelogioacchino.delregno@somainline.org,
        bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jcrouse@codeaurora.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, sean@poorly.run, shawn.guo@linaro.org,
        smasetty@codeaurora.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
In-Reply-To: <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
Message-ID: <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-08 19:09, Konrad Dybcio wrote:
>> Konrad, can you please test this below change without your change?
> 
> This brings no difference, a BUG still happens. We're still calling
> to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
> into an A640..
> 
> Also, relying on disabling LLCC in the config is out of question as it
> makes the arm32 kernel not compile with DRM/MSM and it just removes
> the functionality on devices with a6xx.. (unless somebody removes the
> dependency on it, which in my opinion is even worse and will cause
> more problems for developers!).
> 

Disabling LLCC is not the suggestion, I was under the impression that
was the cause here for the smmu bug. Anyways, the check for llc slice
in case llcc is disabled is not correct as well. I will send a patch for
that as well.

> The bigger question is how and why did that piece of code ever make it
> to adreno_gpu.c and not a6xx_gpu.c?
> 

My mistake, I will move it.

> To solve it in a cleaner way I propose to move it to an a6xx-specific
> file, or if it's going to be used with next-gen GPUs, perhaps manage
> calling of this code via an adreno quirk/feature in adreno_device.c.
> Now that I think about it, A5xx GPMU en/disable could probably managed
> like that, instead of using tons of if-statements for each GPU model
> that has it..
> 
> While we're at it, do ALL (and I truly do mean ALL, including the
> low-end ones, this will be important later on) A6xx GPUs make use of
> that feature?
> 

I do not have a list of all A6XX GPUs with me currently, but from what
I know, A618, A630, A640, A650 has the support.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
