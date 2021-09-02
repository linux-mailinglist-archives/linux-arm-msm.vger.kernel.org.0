Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9FC3FF560
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 23:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239449AbhIBVKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 17:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344026AbhIBVKj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 17:10:39 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D315C061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Sep 2021 14:09:40 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id z2so3271751iln.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=isVCJ0v0N6GlMHHCuW/CxpgqqWw2Wb074FuKnn5+768=;
        b=ILmAiJ6ZStsAqGI49ZT5Oe+mQahwEU3D1mgGAqGhJRYr96ocX678iH1Jksyw4YZE8m
         Bjw5vTnVtAJPyyQs4tGS70j4g1nSv8PJtn8B7gvAABTmeW8O40TaXjkbskAnRgxbzRBP
         ssVIhQC+Zwhg4zEuZvH17fy5uhJyY2/ywv9wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=isVCJ0v0N6GlMHHCuW/CxpgqqWw2Wb074FuKnn5+768=;
        b=S89yTnYwY+LXIr4ZLTcErbvch7MH6lXjthbDBEzj5CF0FL9aXUPn0htc6Q51Oy/PRb
         mycE07ocPWs4vjg3n8f6txLJPhlkb5QadGxpNGvrFEq1G7MiP0UShtdNj7H/c7HP/3M5
         yXTysBupbQYi1ArZZ2gXtTXQ057m3vUiW6B0vrjsgUUL85YQyNDsiRU7a0bPF7EZQ6h3
         7CBLWSF7VWjDsGNbuOS1x//A4fb71fAKHR7/ZqDsdGZhHctfYo/jH7TwgY7IGt7aYrW5
         Zkj9u7J2uvkDjTSUr76olwjib8S1J7BlBqLTz4nX5SIL60SnXlaU9zLCfKZmR36bOcAX
         g8rg==
X-Gm-Message-State: AOAM530RunAOulH6lKPQrcZ+660lDwqt3F1z7deXjG315xmoMUEXD8od
        83yCs8UXaAGg+9CX08nXvgUyRjVLsNUKSw==
X-Google-Smtp-Source: ABdhPJx9UHEyLAEpo8in5Cn+YO/oWu5MtJCTnhUAJvSrQAtOAoxQyq631yohKoF9ae2yDS5t65wwpA==
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr125454ilv.276.1630616979703;
        Thu, 02 Sep 2021 14:09:39 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id k7sm1541014iok.22.2021.09.02.14.09.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 14:09:38 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id a13so4295081iol.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 14:09:38 -0700 (PDT)
X-Received: by 2002:a02:ca0b:: with SMTP id i11mr237677jak.84.1630616978187;
 Thu, 02 Sep 2021 14:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210830135904.1.I049b30065f3c715234b6303f55d72c059c8625eb@changeid>
 <0a865b6e-be34-6371-f9f2-9913ee1c5608@codeaurora.org>
In-Reply-To: <0a865b6e-be34-6371-f9f2-9913ee1c5608@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Sep 2021 14:09:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9x57XsOidc3rFGCUZXJOkQgK6=mihZtOA6KfQ=0SnHQ@mail.gmail.com>
Message-ID: <CAD=FV=X9x57XsOidc3rFGCUZXJOkQgK6=mihZtOA6KfQ=0SnHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Base dynamic CPU power
 coefficients in reality
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 1, 2021 at 9:25 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Hey Doug,
>
> On 8/31/2021 2:29 AM, Douglas Anderson wrote:
> > The sc7180's dynamic-power-coefficient violates the device tree bindings.
> > The bindings (arm/cpus.yaml) say that the units for the
> > dynamic-power-coefficient are supposed to be "uW/MHz/V^2". The ones for
> > sc7180 aren't this. Qualcomm arbitrarily picked 100 for the "little" CPUs
> > and then picked a number for the big CPU based on this.
> >
> > At the time, there was a giant dicussion about this. Apparently Qualcomm
> > Engineers were instructed not to share the actual numbers here. As part
> > of the discussion, I pointed out [1] that these numbers shouldn't really
> > be secret since once a device is shipping anyone can just run a script
> > and produce them. This patch is the result of running the script I posted
> > in that discussion on sc7180-trogdor-coachz, which is currently available
> > for purchase by consumers.
> >
> > [1] https://lore.kernel.org/r/CAD=FV=U1FP0e3_AVHpauUUZtD-5X3XCwh5aT9fH_8S_FFML2Uw@mail.gmail.com/
> >
> > I ran the script four times, measuring little, big, little, big. I used
> > the 64-bit version of dhrystone 2.2 in my test. I got these results:
> >
> > 576 kHz, 596 mV, 20 mW, 88 Cx
> > 768 kHz, 596 mV, 32 mW, 122 Cx
> > 1017 kHz, 660 mV, 45 mW, 97 Cx
> > 1248 kHz, 720 mV, 87 mW, 139 Cx
> > 1324 kHz, 756 mV, 109 mW, 148 Cx
> > 1516 kHz, 828 mV, 150 mW, 148 Cx
> > 1612 kHz, 884 mV, 182 mW, 147 Cx
> > 1708 kHz, 884 mV, 192 mW, 146 Cx
> > 1804 kHz, 884 mV, 207 mW, 149 Cx
> > Your dynamic-power-coefficient for cpu 0: 132
> >
> > 825 kHz, 596 mV, 142 mW, 401 Cx
> > 979 kHz, 628 mV, 183 mW, 427 Cx
> > 1113 kHz, 656 mV, 224 mW, 433 Cx
> > 1267 kHz, 688 mV, 282 mW, 449 Cx
> > 1555 kHz, 812 mV, 475 mW, 450 Cx
> > 1708 kHz, 828 mV, 566 mW, 478 Cx
> > 1843 kHz, 884 mV, 692 mW, 476 Cx
> > 1900 kHz, 884 mV, 722 mW, 482 Cx
> > 1996 kHz, 916 mV, 814 mW, 482 Cx
> > 2112 kHz, 916 mV, 862 mW, 483 Cx
> > 2208 kHz, 916 mV, 962 mW, 521 Cx
> > 2323 kHz, 940 mV, 1060 mW, 517 Cx
> > 2400 kHz, 956 mV, 1133 mW, 518 Cx
> > Your dynamic-power-coefficient for cpu 6: 471
> >
> > 576 kHz, 596 mV, 26 mW, 103 Cx
> > 768 kHz, 596 mV, 40 mW, 147 Cx
> > 1017 kHz, 660 mV, 54 mW, 114 Cx
> > 1248 kHz, 720 mV, 97 mW, 151 Cx
> > 1324 kHz, 756 mV, 113 mW, 150 Cx
> > 1516 kHz, 828 mV, 154 mW, 148 Cx
> > 1612 kHz, 884 mV, 194 mW, 155 Cx
> > 1708 kHz, 884 mV, 203 mW, 152 Cx
> > 1804 kHz, 884 mV, 219 mW, 155 Cx
> > Your dynamic-power-coefficient for cpu 0: 142
> >
> > 825 kHz, 596 mV, 148 mW, 530 Cx
> > 979 kHz, 628 mV, 189 mW, 475 Cx
> > 1113 kHz, 656 mV, 230 mW, 461 Cx
> > 1267 kHz, 688 mV, 287 mW, 466 Cx
> > 1555 kHz, 812 mV, 469 mW, 445 Cx
> > 1708 kHz, 828 mV, 567 mW, 480 Cx
> > 1843 kHz, 884 mV, 699 mW, 482 Cx
> > 1900 kHz, 884 mV, 719 mW, 480 Cx
> > 1996 kHz, 916 mV, 814 mW, 484 Cx
> > 2112 kHz, 916 mV, 861 mW, 483 Cx
> > 2208 kHz, 916 mV, 963 mW, 522 Cx
> > 2323 kHz, 940 mV, 1063 mW, 520 Cx
> > 2400 kHz, 956 mV, 1135 mW, 519 Cx
> > Your dynamic-power-coefficient for cpu 6: 489
> >
> > As you can see, the calculations aren't perfectly consistent but
> > roughly you could say about 480 for big and 137 for little.
> >
> > The ratio between these numbers isn't quite the same as the
> > ratio between the two numbers that Qualcomm used. Presumably
> > this is because Qualcomm measured something slightly different
> > than the 64-bit version of dhrystone 2.2, though it might also
> > be that they fudged the numbers a little. In any case, these
> > numbers don't need to be perfectly exact. In fact, they can't
> > be since the CPU power depends a lot on what's being run on
> > the CPU and the big/little CPUs are each more or less efficient
> > in different operations. Historically running the 32-bit vs.
> > 64-bit versions of dhrystone produced notably different numbers,
> > though I didn't test this time. In any case, let's keep the
> > existing ratio but scale it based on the above so we're at
>
> I am not sure that's really needed, we could perhaps go with the
> new ratios that you got, since the existing ratios are perhaps
> tuned (more usecases run than just dhrystone) for the downstream
> Android scheduler.
> One other thing that's perhaps tuned is the capacity-dmips-mhz,
> and if the same argument applies to that (that they can't be
> scaled and need to be measured with just dhrystone)
> then those might need an update along with this as well, else it
> just throws the power/perf balance out.

OK. So if I run a script to try to measure `capacity-dmips-mhz` and
scale little to 1024 then I get this (I had to throw out strangely low
numbers from 1017 MHz on the little CPU--that needs to be a separate
investigation):

little = 1024
big = 2527

...as opposed to the big CPU being 1740 in the current dts. Actually,
though, it seems like the big is supposed to be 1024 and the little
scaled to it, so I guess that would mean:

little = 415
big = 1024

...so sure, I'll post up that. I guess we'll have to get some folks to
confirm that this doesn't mess too badly with any other tuning we've
done.

===

For reference, this script was all just in bash (seemed easier):

cd /sys/devices/system/cpu/cpufreq/
for policy in policy*; do
  total=0
  count=0
  echo ${policy}
  cd /sys/devices/system/cpu/cpufreq/${policy}
  cpu=$(cat affected_cpus | cut -d ' ' -f1)
  echo userspace > scaling_governor
  for freq in $(cat scaling_available_frequencies); do
    echo ${freq} > scaling_setspeed
    result=$(taskset -c ${cpu} dry2 2>/dev/null | grep 'Dhrystones per
Second:' | cut -d ':' -f2)
    result_per_mhz=$((result * 1000 / freq))
    echo "${policy} at ${freq}: capacity-dmips-mhz = ${result_per_mhz}"
    total=$((total + result_per_mhz))
    count=$((count + 1))
  done
  echo "Averge for ${policy} is $((total / count))"
done
