Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58771188DC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 20:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCQTJk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 15:09:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38123 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgCQTJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 15:09:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id n13so16382235lfh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HslPcJIo3S/gfJwOLWKAp+bbJPCMegwoA4gAtpRTBpw=;
        b=WBBI5+Fk6wbTGUQap4Fu6dRsazuD8ff8Gu5e+6AmXv7XDo742Zy9lrXGtOEjOpQ/7s
         Cip6Ty0dP3Ku+FzFfqT1DYN7Wr/tDh0ULC5Me0NCdG0TvwtkKB+CXrk5SN4IYPafjx2N
         fbbtkOKGR7y/cFKVvyGFODV5onhx7IGXNfDCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HslPcJIo3S/gfJwOLWKAp+bbJPCMegwoA4gAtpRTBpw=;
        b=QcBThFK8SXh/1yrn5lRSYAkGZDJEpSY7jxzlBF+jb7M6/7/p0nJstKR3/jT+hFnK0j
         tYpWx9LLq4w3IYi8UfgLWtwqiFc2NKz0VWcWO8dmMEbpHj1gQQ+s/w/3jTDQ0yDqoOsl
         ej18mCYJ12uGIy/KCKfpLNkHq7npi8xneHfuv/9lwy5KBlkITtRMwkDQP62GxZmpn9pu
         RmI2hlvNWjDUKjlSvGcELJX3iM2rgJKEhSr6O8kkH17UJRhnBN5IfpE9aMPKs+tO215m
         zXi/5hYqZqef95fnuozQUTPvKY55xO+pvNmfbtZRhg5varDq7VxoA4Yft57AePfQKmlK
         e5og==
X-Gm-Message-State: ANhLgQ0ZDaeOc/e+2d6uhbRI0LBZoG9GMwrOpPYu3+3MGOMtP8voTqio
        HvuL1XntTaNAgJHJo+UGapSMQmXKM8Q=
X-Google-Smtp-Source: ADFU+vssugDuZ0MOjrhVAsy9QLTJTHdU/Gt+Mi0pDG9S7gDa84e6fwhX9AgFmr0CJfktBAVH8h5CCA==
X-Received: by 2002:ac2:5473:: with SMTP id e19mr534105lfn.24.1584472177440;
        Tue, 17 Mar 2020 12:09:37 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id h5sm2984736ljl.66.2020.03.17.12.09.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:09:35 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id a28so6374211lfr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 12:09:35 -0700 (PDT)
X-Received: by 2002:a19:ec08:: with SMTP id b8mr536794lfa.34.1584472174941;
 Tue, 17 Mar 2020 12:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com> <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
In-Reply-To: <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 17 Mar 2020 12:08:56 -0700
X-Gmail-Original-Message-ID: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Message-ID: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 17, 2020 at 5:13 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Matthias,
>
> On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
> > Hi,
> >
> > On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
> >> Get the interconnect paths for QSPI device and vote according to the
> >> current bus speed of the driver.
> >>
> >> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> >> ---
> >>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
> >>     path handle
> >>   - As per Matthias comment, added error handling for icc_set_bw call
> >>
> >>   drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 45 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> >> index 3c4f83b..ad48f43 100644
> >> --- a/drivers/spi/spi-qcom-qspi.c
> >> +++ b/drivers/spi/spi-qcom-qspi.c
> >> @@ -2,6 +2,7 @@
> >>   // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
> >>
> >>   #include <linux/clk.h>
> >> +#include <linux/interconnect.h>
> >>   #include <linux/interrupt.h>
> >>   #include <linux/io.h>
> >>   #include <linux/module.h>
> >> @@ -139,7 +140,10 @@ struct qcom_qspi {
> >>      struct device *dev;
> >>      struct clk_bulk_data *clks;
> >>      struct qspi_xfer xfer;
> >> -    /* Lock to protect xfer and IRQ accessed registers */
> >> +    struct icc_path *icc_path_cpu_to_qspi;
> >> +    unsigned int avg_bw_cpu;
> >> +    unsigned int peak_bw_cpu;
> > This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
> > On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
> > of a geni SE specific struct, however adding a generic convenience struct to
> > 'linux/interconnect.h' might be the better solution:
> >
> > struct icc_client {
> >       struct icc_path *path;
> >       unsigned int avg_bw;
> >       unsigned int peak_bw;
> > };
> >
> > I'm sure there are better names for it, but this would be the idea.
>
> Yeah, I think introducing this to ICC header would be better solution.

+Georgi

I'm not as convinced this structure is generally useful and belongs in
the interconnect core. The thing that strikes me as weird with putting
it in the core is now we're saving these values both inside and
outside the interconnect core. In the GENI case here, we only really
need them to undo the 0 votes we cast during suspend. If "vote for 0
in suspend and whatever it was before at resume" is a recurring theme,
maybe the core should give us path_disable() and path_enable() calls
instead. I'm thinking out loud, maybe Georgi has some thoughts.

Akash, for now if you want to avoid wading into a larger discussion
maybe just refactor to a common structure local to GENI.


-Evan
