Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBF31AAC6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 17:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415005AbgDOP4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 11:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1415006AbgDOP4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 11:56:43 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2030C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:56:43 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id f2so3780242ilq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B9MXhYCYetRAbTwmXzTq/cHtzrXsP07P1r9YbCMxRJ0=;
        b=RHXjl4nb/Oy28ie0zxV0vpLR6hc/Jq5ukBL/OcMix0dK3AqfaHCMr7TrVeSh2Ax14w
         bwM9eSAn98iU6hfOOjgyjHxAGs5atXlzY3xr9INwhtogNgLo0DPaPaeKFIZ9zrPBABpH
         au8zhHmONlmXyZf0MP6OblRKfls0mlkIY8oASo9BToM/Fja5/mLKmlY4YJ0b8dbeS6W2
         4FEb+/IZhvRRYARXtF1R0/MTMHdrlPKsL5UslgnKVPzhaHiDq0R1ZbfLOsOg7U38h15a
         aZza/MZHr329GSPMMY1HLeDxOdn66J8qUtE0DAmmkWATGa/TS7WfwfR/IRU0ZwAKz/Vh
         o7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B9MXhYCYetRAbTwmXzTq/cHtzrXsP07P1r9YbCMxRJ0=;
        b=gs0HjERFytWYY0mLy9jhjvrBhxmGvWPvhH32FmLRpKxdO14eHsEXxg4xOWA66xFddY
         IyEC3tWgkYtgo1eX2TlFpWJKCrekolpfI5VMcaFf+/LotnCETp/tFy2iirHtl7LWmQBD
         F7fr2nJqfFGPWKMDVeXekzzftatwJrBej18sPT1QhmKLQXY3DScbLUYHiyepsyUz13/D
         Pmk12OXfRUIL3PgpvKwq652kOTtJ+ozrzFTQfwIkgAFGRKt2mUeBj3m2pOjjBipqwoM4
         ddhZc9MRAETBkTVcwRGddjdztieoO3neNjPafSd84P2Xxzj6LZ5vGU+kWVObehuJGDns
         jjow==
X-Gm-Message-State: AGi0PuY4tuMTWii2asWb7J3WhoY8pfdowODSJdtiRBTIGqKcDA4AS9zu
        ayx09OPR6qsBJSZHo70kGk7JRU7+D2ag15f2y9q4VnuIMOE=
X-Google-Smtp-Source: APiQypKVzyuJcbicWAEIxRgg1A+gem0GWiCs2bZOAaL/EVmkJ0g+4v6HC8k/rcGL2d2Zuq9Nzb/jrRrpvcn69U+xglY=
X-Received: by 2002:a92:158c:: with SMTP id 12mr5984810ilv.58.1586966202755;
 Wed, 15 Apr 2020 08:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200409113538.5008-1-saiprakash.ranjan@codeaurora.org>
 <9a792e3e-5a17-156d-4b59-4a3ec8f9993e@arm.com> <1751aeabd22bee18d2eef0f643883265@codeaurora.org>
 <20200413171418.GB28804@xps15> <75ef334a7e2cc6d87deecadd12c74f59@codeaurora.org>
In-Reply-To: <75ef334a7e2cc6d87deecadd12c74f59@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 15 Apr 2020 09:56:31 -0600
Message-ID: <CANLsYkxVFMrAOtZhNgQ+uPE5mgt1z8RNa_yAxX2ju7DYrbvBZw@mail.gmail.com>
Subject: Re: [PATCH] coresight: tmc: Read TMC mode only when TMC hw is enabled
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Apr 2020 at 09:47, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu,
>
> On 2020-04-13 22:44, Mathieu Poirier wrote:
> > On Mon, Apr 13, 2020 at 01:55:30PM +0530, Sai Prakash Ranjan wrote:
> >> Hi Suzuki,
> >>
> >> On 2020-04-13 04:47, Suzuki K Poulose wrote:
> >> > Hi Sai,
> >> >
> >> > On 04/09/2020 12:35 PM, Sai Prakash Ranjan wrote:
> >> > > Reading TMC mode register in tmc_read_prepare_etb without
> >> > > enabling the TMC hardware leads to async exceptions like
> >> > > the one in the call trace below. This can happen if the
> >> > > user tries to read the TMC etf data via device node without
> >> > > setting up source and the sink first which enables the TMC
> >> > > hardware in the path. So make sure that the TMC is enabled
> >> > > before we try to read TMC data.
> >> >
> >> > So, one can trigger the same SError by simply :
> >> >
> >> > $ cat /sys/bus/coresight/device/tmc_etb0/mgmt/mode
> >> >
> >>
> >> I do not see any SError when I run the above command.
> >>
> >> localhost ~ # cat /sys/bus/coresight/devices/tmc_etf0/mgmt/mode
> >> 0x0
> >>
> >> And this is most likely due to
> >>
> >> commit cd9e3474bb793dc ("coresight: add PM runtime calls to
> >> coresight_simple_func()")
> >
> > Ok, so this is related to power management (you can ignore my question
> > in the
> > previous email).
> >
> > Regarding function tmc_read_prepare_etb(), the best way to deal with
> > this is
> > probably make sure drvdata->mode != CS_MODE_DISABLED before reading
> > TMC_MODE.
> > If there is a buffer to read it will have been copied when the ETB was
> > disabled
> > and there won't be a need to access the HW.
> >
>
> This works as well, thanks.
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d0cc3985b72a..7ffe05930984 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -596,6 +596,11 @@ int tmc_read_prepare_etb(struct tmc_drvdata
> *drvdata)
>                  goto out;
>          }
>
> +       if (drvdata->mode == CS_MODE_DISABLED) {
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +

We are back to your original solution where the ETB buffer can't be
read if the ETB itself is not enabled.  It _is_ possible to read the
buffer of an ETB that has been disabled.

To fix this consider the following [1].  Take the block at line 607
and move it to line 598.  As part of the if() condition at line 619,
read the value of the TMC_MODE register and exit if not in circular
mode.  If it is in circular mode continue with disabling the hardware.

[1]. https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/hwtracing/coresight/coresight-tmc-etf.c

>          /* There is no point in reading a TMC in HW FIFO mode */
>          mode = readl_relaxed(drvdata->base + TMC_MODE);
>          if (mode != TMC_MODE_CIRCULAR_BUFFER) {
>
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
