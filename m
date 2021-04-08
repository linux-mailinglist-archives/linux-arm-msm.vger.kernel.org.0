Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C107359063
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 01:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhDHXmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 19:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDHXmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 19:42:02 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADA9C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 16:41:50 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id q26so4164365qkm.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KRUudqQ7fiqiTO1h1nhjXIsFEoc1XK+L2rdZ1uxSAg=;
        b=yHH1TguXIOLaBlQty2FkN1++Ql1LbpqyhCP/Bi9XQjCI+iCfX3544SZzo5Y7gLXcrB
         c3vqh34BZjV/GX060haL1oSrlETmiX2GKL4Hc2D+QH2W7CTmlQuW06kq8qaVXqa3O+Ba
         pYybh9dAQ//7dOoGPTLu//LBK0EntAPRBYR4TLyK2RFNRHKJUVYs3r8MG5f4IwzI31vS
         WPlUBkat9NZq6QOv4mvJDKzSdfg7PV8sG1HwkXKR6Pa6TeNMlsplEoZLwPqcZWNYDYKP
         lmZdS6usMKm8ISMpRX0aWzPtDxGcV+oWwI54ScYD6OcXFo8KBfrQ09Mvey00ZhcR93nV
         myGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KRUudqQ7fiqiTO1h1nhjXIsFEoc1XK+L2rdZ1uxSAg=;
        b=DdvkaSzsy2u8e/SkOnaijX7pW8gqyqKvLcygjQsSfosGmLvTFBWD+L8ubMJnyaMlNC
         PC/hBNTdBNywS/PCXEw8aVACI0eVehnab3e5HunOPPClWWKq1IHeHkBesl8k79rkNSOM
         b6DyG8PhXdVYYI7pddSoIA26znVXG2QOjIrb17SQcVXedBFVoqX1L6rwN17QtOuynehH
         8AENy0fD1/bnHoEmMtXOhuq0+K4FV9aV3qYxg48Nkl1TCxwk0J8CdaobIlvA/idnBjXu
         2yQFZrCDgwwSE6m+6AtY0OOt6Tdo2643aa5W1tsG8Y/QTHFByXIJF68U4NF2Oy9p+r4W
         53yA==
X-Gm-Message-State: AOAM533HPSv7JOGyxxaKbLR/6ooD8Ntn/9tWiKdtlKitdXTcYZmqubJW
        +Lcxmzv3fD5s7rg/N7/j6Im/LxuS4C8HwdqhW71pvQ==
X-Google-Smtp-Source: ABdhPJyHPuE4navRPOijhLZmY/RoeCxFazCLQbKT5I8ozqsoCzXvOiMSY+ipZbh1hlP3lOdy4M8E0I0XN9PPmb1zcMM=
X-Received: by 2002:ae9:f312:: with SMTP id p18mr11406022qkg.162.1617925309436;
 Thu, 08 Apr 2021 16:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de> <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
 <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com> <20210408230522.GS904837@yoga>
In-Reply-To: <20210408230522.GS904837@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Apr 2021 02:41:38 +0300
Message-ID: <CAA8EJprO7jwqaKXXk70hzDJnTU6iX6i2Vk1OxkrwDKFFQQSyEw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Apr 2021 at 02:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 08 Apr 16:53 CDT 2021, Dmitry Baryshkov wrote:
>
> > On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > > > >
> > > >
> > > > I'm about to send you a another set of pull requests with some more
> > > > goodies that was lingering on the list. I will take a look to see if I
> > > > can follow up on that with some fixes for above warnings - and take
> > > > another look at incorporating dtbs_check in my workflow.
> > >
> > > Ok, sounds good. As I mentioned, I'm also just learning how to use
> > > dtbs_check properly. Unfortunately, it takes ages to run on a
> > > non-parallel build,
> > > and using 'make -j32' as I normally do means the output gets reordered
> > > with every run.
> > >
> > > It's probably ok if you figure out how to only run it for the files you
> > > actually change in the Qualcomm tree.
> >
> > Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
> > less painful.
> >
>
> Yes, this is a trick I'm applying as well.
>
> It would however be nice if one didn't have to disable CONFIG_ARCH_* to
> achieve this, or even better if one could run dtbs_check on a single
> .dtb. In particular since many of the warnings are resolved by fixing
> the bindings, which causes dtbs_check to recheck all files.

As a quick hack: add the following rule to the top-level Makefile:

%.dt.yaml: include/config/kernel.release scripts_dtc
        $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
Documentation/devicetree/bindings/processed-schema.json
        $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y

Now you can run checks for a single device tree by running 'make
ARCH=arm64 ...... sdm845-db845.dy.yaml'

I don't know if it's worth including this into the upstream source tree.

-- 
With best wishes
Dmitry
