Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5D1FDC33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 12:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfKOLYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 06:24:11 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45288 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfKOLYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 06:24:10 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9926B60FCF; Fri, 15 Nov 2019 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573817049;
        bh=jhlsJfa/CIIKPDu4dgmeIauTYrE/caZ2o/tn2eCcBe0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ROuTp1LNy63IKm6kmUk3thTaxwTGxOSrvqGt2GSE2l7+9CyFBbQkbLldX5ujNlhJj
         zSYz9X70UrOxHxYyBZfzvZGFMdIVomFIGulj1vn4PUAeYtKx3TzTAaWCVWsfvIxPnq
         mx6kKQOcnV1mMoABn0cl8xVmGjnVOcO+/YXNOMTM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 727D260FCF;
        Fri, 15 Nov 2019 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573817048;
        bh=jhlsJfa/CIIKPDu4dgmeIauTYrE/caZ2o/tn2eCcBe0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=msJryt5hn5MPERKvMvZWQoBAWnONKUFt7c8OC3TVaXyGlZwxFXM2RHEUr5jeROvxk
         SJJKEAWWBagr739vq4UmUHFq68ZI8rJb/tjN8XgfzT3auExBPBAZciKXlE7Wvt0uvG
         momPPozBWI+0lZmyvtJl1QovRS9wTNZ35PzYk8M8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Nov 2019 16:54:08 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv2 0/3] Add LLCC support for SC7180 SoC
In-Reply-To: <5dcd8588.1c69fb81.2528a.3460@mx.google.com>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
 <20191021033220.GG4500@tuxbook-pro>
 <CAL_JsqLzRRQe8UZCxgXArVNhNry7PgMCthAR2aZNcm6CCEpvDA@mail.gmail.com>
 <2fbab8bc38be37fba976d34b2f89e720@codeaurora.org>
 <CAL_Jsq+5p7gQzDfGipNFr1ry-Pc3pDJpcXnAqdX9eo0HLETATQ@mail.gmail.com>
 <81f57dc623fe8705cea52b5cb2612b32@codeaurora.org>
 <1565197bda60573937453e95dcafbe68@codeaurora.org>
 <5dcd8588.1c69fb81.2528a.3460@mx.google.com>
Message-ID: <139c37cbf267fcc6b363f04c6b5d1256@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-14 22:19, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2019-11-13 07:00:40)
>> Hello Rob,
>> 
>> On 2019-10-25 13:24, Sai Prakash Ranjan wrote:
>> > On 2019-10-25 04:03, Rob Herring wrote:
>> >> On Thu, Oct 24, 2019 at 6:00 AM Sai Prakash Ranjan
>> >> <saiprakash.ranjan@codeaurora.org> wrote:
>> >>>
>> >>> Hi Rob,
>> >>>
>> >>> On 2019-10-24 01:19, Rob Herring wrote:
>> >>> > On Sun, Oct 20, 2019 at 10:32 PM Bjorn Andersson
>> >>> > <bjorn.andersson@linaro.org> wrote:
>> >>> >>
>> >>> >> On Sat 19 Oct 04:37 PDT 2019, Sai Prakash Ranjan wrote:
>> >>> >>
>> >>> >> > LLCC behaviour is controlled by the configuration data set
>> >>> >> > in the llcc-qcom driver, add the same for SC7180 SoC.
>> >>> >> > Also convert the existing bindings to json-schema and add
>> >>> >> > the compatible for SC7180 SoC.
>> >>> >> >
>> >>> >>
>> >>> >> Thanks for the patches and thanks for the review Stephen. Series
>> >>> >> applied
>> >>> >
>> >>> > And they break dt_binding_check. Please fix.
>> >>> >
>> >>>
>> >>> I did check this and think that the error log from dt_binding_check
>> >>> is
>> >>> not valid because it says cache-level is a required property [1], but
>> >>> there is no such property in LLCC bindings.
>> >>
>> >> Then you should point out the issue and not just submit stuff ignoring
>> >> it. It has to be resolved one way or another.
>> >>
>> >
>> > I did not ignore it. When I ran the dt-binding check locally, it did
>> > not
>> > error out and just passed on [1] and it was my bad that I did not check
>> > the entire build logs to see if llcc dt binding check had some warning
>> > or
>> > not. But this is the usual case where most of us don't look at the
>> > entire
>> > build logs to check if there is a warning or not. We notice if there is
>> > an
>> > immediate exit/fail in case of some warning/error. So it would be good
>> > if
>> > we fail the dt-binding check build if there is some warning/error or
>> > atleast
>> > provide some option to strict build to fail on warning, maybe there is
>> > already
>> > a flag to do this?
>> >
>> > After submitting the patch, I noticed this build failure on
>> > patchwork.ozlabs.org and was waiting for your reply.
>> >
>> > [1] https://paste.ubuntu.com/p/jNK8yfVkMG/
>> >
>> >> If you refer to the DT spec[1], cache-level is required. The schema is
>> >> just enforcing that now. It's keying off the node name of
>> >> 'cache-controller'.
>> >>
>> >
>> > This is not L2 or L3 cache, this is a system cache (last level cache)
>> > shared by
>> > clients other than just CPU. So I don't know how do we specify
>> > cache-level for
>> > this, let me know if you have some pointers.
>> >
>> 
>> Any ideas on specifying the cache-level for system cache? Does
>> dt-binding-check
>> needs to be updated for this case?
>> 
> 
> I don't see how 'cache-level' fits here. Maybe the node name should be
> changed to 'system-cache-controller' and then the schema checker can
> skip it?

Sounds good and correct. I made this change and ran the dt binding check
and no warning was observed.

Sent a patch - 
https://lore.kernel.org/lkml/cover.1573814758.git.saiprakash.ranjan@codeaurora.org/

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
