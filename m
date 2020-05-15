Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5BF1D5283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 16:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgEOOwh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 10:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 10:52:36 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3D8C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 07:52:35 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id k18so3066680ion.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vydHQTzj3c686TmTMHL1QqAtMRNRd4XB3MteF3kHgAs=;
        b=UZ8+sJI+p0f3is3kkpc69G6irKX6PH1tH/sgzavBs66A67D3Q6q/lwNTuPV3zb6U68
         kqyrxtvEIkD7xcxvxSbLBvuowF52WJLwD3Ss7hSzlm66kdDyGCH1rpB63yzx+J5uHGcT
         ZEo3HnRA6MgTbSPk0O2J8ZLHIDgWLFLcxrCJLMU7oRNLQNXO9B9bgaIzsaINvzb92+2e
         HYHMjemU7Or55Oo6WkBlhT7O8JQd5nisDmoJ4k31ZH8J+2mulyDIfylPXwIxqZF1t8db
         +k+i08xW0fNlzPv6B0FXdlzkwrIobKrR06ywlxbxIX+C4SkvQTd0iuquFfGoKywD3Mmg
         6wiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vydHQTzj3c686TmTMHL1QqAtMRNRd4XB3MteF3kHgAs=;
        b=idCNKpMO9pzCH7Dg+0LHCcxISafJqaSONfSlbGV0tUmYMv0rQy/ERfYJJ6vCVTOTTk
         ZTpuTssep7xDpPqXQCUXu/3lX5kNWlk7MsTupiYmfIhZ3eKxp4H4Soj/Wb7DLicv0hwT
         4Fdwkz7FCawkA8+wT98MxzxbhNCFWWdlSm7TyhK0Z6MfQMSxwyggqPMH+Go1wH4AK6vR
         xF7cSezxHWiNUAtWIp5WJDqc4qYOpd8AMnRJuNgLFmwLt5x6CM6S/BmnEL6+az3qEn25
         9WB2889Pa2lArl0pmi5J9UH5ZGjoOMYoUaaoBxxpx6F2wm/FSUkBgjUTKtxma8I/7Map
         /Z6A==
X-Gm-Message-State: AOAM531xb+9XppwFkn4E8VqBOzlhsdxgYbrzUI76sm+G8HgTnhQ4l62m
        VRMZGTURQA8Eg0vqm+rCBxHGxKMnJRE+kWcbFpd4Nw==
X-Google-Smtp-Source: ABdhPJyzKkiEkV8gyGv78TG2faQUaA8S/y2Gi7ZBEVgHXbh3X8djjspFmWdU7Sbf0WvFrTABd+a2aIxBe6daar4yk9U=
X-Received: by 2002:a02:2708:: with SMTP id g8mr3682319jaa.52.1589554354623;
 Fri, 15 May 2020 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200514105915.27516-1-saiprakash.ranjan@codeaurora.org>
 <20200514180055.GA29384@xps15> <2c932d57288508cc72a6ee323cf5595e@codeaurora.org>
In-Reply-To: <2c932d57288508cc72a6ee323cf5595e@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 15 May 2020 08:52:23 -0600
Message-ID: <CANLsYkxun2EWGeLU42ShbqkJMtCTh+Q9L3t=CXQR+-2zVuuJYg@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm4x: Add support to disable trace unit power up
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Tingwei Zhang <tingwei@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 May 2020 at 12:39, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu,
>
> On 2020-05-14 23:30, Mathieu Poirier wrote:
> > Good morning Sai,
> >
> > On Thu, May 14, 2020 at 04:29:15PM +0530, Sai Prakash Ranjan wrote:
> >> From: Tingwei Zhang <tingwei@codeaurora.org>
> >>
> >> On some Qualcomm Technologies Inc. SoCs like SC7180, there
> >> exists a hardware errata where the APSS (Application Processor
> >> SubSystem)/CPU watchdog counter is stopped when ETM register
> >> TRCPDCR.PU=1.
> >
> > Fun stuff...
> >
>
> Yes :)
>
> >> Since the ETMs share the same power domain as
> >> that of respective CPU cores, they are powered on when the
> >> CPU core is powered on. So we can disable powering up of the
> >> trace unit after checking for this errata via new property
> >> called "qcom,tupwr-disable".
> >>
> >> Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
> >> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >
> > Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
> >
>
> Tingwei is the author, so if I understand correctly, his signed-off-by
> should appear first, am I wrong?

It's a gray area and depends on who's code is more prevalent in the
patch.  If Tingwei wrote the most of the code then his name is in the
"from:" section, yours as co-developer and he signs off on it (as I
suggested).  If you did most of the work then it is the opposite.
Adding a Co-developed and a signed-off with the same name doesn't make
sense.

>
> >> ---
> >>  .../devicetree/bindings/arm/coresight.txt     |  6 ++++
> >>  drivers/hwtracing/coresight/coresight-etm4x.c | 29
> >> ++++++++++++-------
> >
> > Please split in two patches.
> >
>
> Sure, I will split the dt-binding into separate patch, checkpatch did
> warn.

And you still sent me the patch...  I usually run checkpatch before
all the submissions I review and flatly ignore patches that return
errors.  You got lucky...

>
> >>  2 files changed, 25 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt
> >> b/Documentation/devicetree/bindings/arm/coresight.txt
> >> index 846f6daae71b..d2030128fe46 100644
> >> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> >> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> >> @@ -108,6 +108,12 @@ its hardware characteristcs.
> >>      * arm,cp14: must be present if the system accesses ETM/PTM
> >> management
> >>        registers via co-processor 14.
> >>
> >> +    * qcom,tupwr-disable: boolean. Indicates that trace unit power up
> >> can
> >> +      be disabled on Qualcomm Technologies Inc. systems where ETMs are
> >> in
> >> +      the same power domain as their CPU cores. This property is
> >> required
> >> +      to identify such systems with hardware errata where the CPU
> >> watchdog
> >> +      counter is stopped when TRCPDCR.PU=1.
> >> +
> >
> > I think something like "qcom,skip-power-up" would be clearer.
> >
> > Also, a better choice of words is that TRCPDCR.PU does not have to be
> > set on
> > Qualcomm...
> >
>
> Yes "qcom,skip-power-up" is a lot better, thanks. Also will use
> something as
> you suggested for description.
>
> >>  * Optional property for TMC:
> >>
> >>      * arm,buffer-size: size of contiguous buffer space for TMC ETR
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
> >> b/drivers/hwtracing/coresight/coresight-etm4x.c
> >> index fb0f5f4f3a91..6886b44f6947 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> >> @@ -104,6 +104,11 @@ struct etm4_enable_arg {
> >>      int rc;
> >>  };
> >>
> >> +static inline bool etm4_can_disable_tupwr(struct device *dev)
> >> +{
> >> +    return fwnode_property_present(dev_fwnode(dev),
> >> "qcom,tupwr-disable");
> >> +}
> >> +
> >
> > Please call fwnode_property_present() at initialisation time to set a
> > new
> > drvdata::skip_power_up variable.  From there just switch on that in
> > etm4_enable/disable_hw().
> >
>
> Will do, thanks.
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
