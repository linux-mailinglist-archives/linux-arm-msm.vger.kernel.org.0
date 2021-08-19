Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467A43F1C25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 17:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240638AbhHSPEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 11:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240652AbhHSPEK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 11:04:10 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16511C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 08:03:34 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id b5so4217290vsq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LxeIiFGzA9+nCXREKf+MuHrFXJ4KP6fo54AIdNxUpxk=;
        b=j2faza2Tjx8fcJI/p1fwwisw9XX4xAmB15S883aQsGplzkZKB3AW7MzbfVGTceKF4M
         F594aJpmxGFHj80os51sZOaE838Lt2pzaCang9q0ljhhPPvMU+GRJb/6sQ98aAGWzNx+
         HNlEUPXyDXhcy+Kle835ZsrOnEyjRlsCvOkTp+al88fVm1zoBBN9crOY61k7km734nRT
         OgRdzq76b40E5mXMUgoSMCXIFXvKCB5QjLVc6yo0A1L87EB+gGmAnnZmIFtMzgctyz7+
         JkLvLRasabd4yUovx0YJKxesCVKxMNY8ZqsGHF4bIUzncjocwPcp3ZRw+nvGIgzIQGY5
         0mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LxeIiFGzA9+nCXREKf+MuHrFXJ4KP6fo54AIdNxUpxk=;
        b=S5DFp/YUnxoHNe9e8oKr102YCv4cD8kYo2MEfOJpf/3ewksJRIVfldGRmHIEUeva/e
         AXvfO0k3IXXZsdqoML4ya55VAGuI/JOAtQxi/CeCHYTHK8QDmJ5yXI2a+3jCgsxjRs6L
         EkromPNJO+WHIrIe2hEtfxSUOYOr7f63HH2zGaNGVnzvsKZOPC3ywn91ydXfdrmp9cDH
         jLMjSLsYhRMkAG9EcLPi5ZzwlM0XTKNJgn5GtDgQb6mnyaBksLDPsAlarcFvLV9jh1/C
         Z2bJC3JY4l1YJ491ASMiJYO8pjzH19K9+LftNDtIALQMtWPiAO+enELbA21ySSkbVN9m
         Nh+A==
X-Gm-Message-State: AOAM530/Zjf8YkN+05KTrqEwRjQwyJ0JeBjpwBBcPtyIAxmeVF18Sz51
        BFs9ZJZZ1c+DwT8X9uQzu5wpf5TTiwUcJEygxSuIOA==
X-Google-Smtp-Source: ABdhPJwVrPaKisYbYhaQOFuZlYwQ+Wc4l/X1XXthUJ0v9p6pBtnY63AhF3f1HII6vMkrfq//cdj/N3/jUNV/EeeNNAQ=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr12966030vso.48.1629385413278;
 Thu, 19 Aug 2021 08:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <010101746fc98add-45e77496-d2d6-4bc1-a1ce-0692599a9a7a-000000@us-west-2.amazonses.com>
 <CAJZ5v0hJJxxb+J5UtyZe2S_Tn7ARoGvjwDjw4dq601VJrriH9g@mail.gmail.com>
 <20200922161215.GD30658@codeaurora.org> <CAJZ5v0ipDRkPe6N9B6RzvHyCBobz8B9EoBfPh4DANrL_e86+Ww@mail.gmail.com>
 <bd62ffea-9736-f8f7-6a48-13e81f802aea@linaro.org> <2fe42a4d-469a-0424-45d4-5d7027c88263@codeaurora.org>
In-Reply-To: <2fe42a4d-469a-0424-45d4-5d7027c88263@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 19 Aug 2021 17:02:57 +0200
Message-ID: <CAPDyKFqpQSaVG63UxK9iuRnnONVD6iY2+aHZCe=cbrfuuV+dwg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: governor: export cpuidle governor functions
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 17 Aug 2021 at 11:32, Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi Daniel/Rafael,
>
>  >> would it make sense to convert the governors into modules
>
> i am not aware if this was not pursued further due to any issue.
>
> Do you see any concerns to allow existing governors compiled as loadable
> module?
> if not i can work on same and post. please do let me know your thoughts
> on this.
>
> i have CCed Saravana and Todd for awareness.

I suggest you re-submit a new patch and put some arguments of why this
is useful for us in the commit message. Then we can discuss that
instead, rather than this old patch.

Kind regards
Uffe

>
> Thanks,
> Maulik
>
> On 10/10/2020 1:56 AM, Daniel Lezcano wrote:
> > Hi Rafael,
> >
> > On 22/09/2020 19:27, Rafael J. Wysocki wrote:
> >> Hi Lina,
> >>
> >> On Tue, Sep 22, 2020 at 6:12 PM Lina Iyer <ilina@codeaurora.org> wrote:
> >>> Hi Rafael,
> >>>
> >>> On Tue, Sep 22 2020 at 10:00 -0600, Rafael J. Wysocki wrote:
> >>>> Sorry for the delay.
> >>>>
> >>>> On Wed, Sep 9, 2020 at 12:15 AM Lina Iyer <ilina@codeaurora.org> wrote:
> >>>>> Commit 83788c0caed3 ("cpuidle: remove unused exports") removed
> >>>>> capability of registering cpuidle governors, which was unused at that
> >>>>> time. By exporting the symbol, let's allow platform specific modules to
> >>>>> register cpuidle governors and use cpuidle_governor_latency_req() to get
> >>>>> the QoS for the CPU.
> >>>> Which platform-specific modules may want to do that and why?
> >>>>
> >>> We are planning a custom cpuidle governor for QCOM SoCs. With Android,
> >>> the idea is to make them loadable modules so they can be in a separate
> >>> partition.
> >> Well, the $subject patch is not applicable without a mainline user
> >> requiring this, so it needs to be posted along with that user.
> > Putting apart the custom cpuidle governor mentioned above, would it make
> > sense to convert the governors into modules ? It is pointless to have
> > all of them compiled in, especially with distros doing make
> > allmodconfig, no?
> >
> >
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>
