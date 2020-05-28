Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93511E6490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbgE1OvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728637AbgE1OvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:51:18 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3809DC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 07:51:18 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id t4so14000518vsq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ps973uR8lunIoKwykKoQXnDQqkoCFXXUfBJCCsrchr0=;
        b=gObEdTFtoIohbbXUidGmBxpcoxQBs9V4kLQLJAksfxwwA0CbdEe0Ya72vYFDJCixuf
         IPhL1NfiNcTN8UJIQCCYYsGiOzI6fyqWDhKhEeymcBNr4I/lMAV/BIGuqnrvpMZUE8vQ
         cMHgj7hlNOCvxI9lsii91xDWgAzQDQsv2pBCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ps973uR8lunIoKwykKoQXnDQqkoCFXXUfBJCCsrchr0=;
        b=ejN3/X8dmHs9U6yPf+IGzCRF8xBnfM04+YLAYAXL5bINFrS7onkr0alTtgpaudL/Su
         SUqcvZE6hp5M04S8075nxXBUKfsaU4XABxrySOztZlolFwdnQCskPJvKwq54aDPGYKzx
         U7TLWGAJX8svIxQ2fhB2K34wc9HXfcVtIMTuLsO9cNI/qlpG4ghVvuJOeK/QebUvbCMv
         WxivyDw7m1dPBFf0O1Qouml0yPOTtIuPXG8JoScMCKIaQfEJ/mB8uEuZelGUrdf7fF0/
         1SY2z+QUuLt6RAV92f2hfuYuFfBoFepA7ZnL68NafH3/lJILD/9IczpXq7BanHCG7m7D
         7izA==
X-Gm-Message-State: AOAM532dO9RGL+vRmJDC7eRZQpAiBBlAsXYsCozqEwCEJs8YRdDK3FJr
        EWsjH36+BI8t32rkWYWbFJABZkht1gU=
X-Google-Smtp-Source: ABdhPJzclUBs0yC8C642dT2Ds1bJp5St298ZnlsL3m9hyMVmXNJoozl7ftLu4UfLYiwcKCPLZ/Y+fA==
X-Received: by 2002:a67:efce:: with SMTP id s14mr2370057vsp.61.1590677476984;
        Thu, 28 May 2020 07:51:16 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 107sm422515uac.10.2020.05.28.07.51.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:51:16 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id c17so9745632uaq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 07:51:15 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr2129380uaf.22.1590677475235;
 Thu, 28 May 2020 07:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200415095953.v3.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
 <20200415095953.v3.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid> <ff140959-98f9-7a67-e3de-f543e4ff3ac0@codeaurora.org>
In-Reply-To: <ff140959-98f9-7a67-e3de-f543e4ff3ac0@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 May 2020 07:51:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwMggCMntyjOcms68Jm223_sHjBHUoc8qfG7D_QcAjxA@mail.gmail.com>
Message-ID: <CAD=FV=WwMggCMntyjOcms68Jm223_sHjBHUoc8qfG7D_QcAjxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Joe Perches <joe@perches.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 28, 2020 at 4:44 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi Doug,
>
> During suspend-resume with this change on sc7180 using latest
> linux-next, below warning was reported.
>
> WARNING: CPU: 0 PID: 5324 at kernel/time/timekeeping.c:754
> ktime_get+0x94/0x9c
>   ktime_get+0x94/0x9c
>   write_tcs_reg_sync+0x4c/0x130
>   tcs_invalidate+0x64/0xa4
>   rpmh_rsc_invalidate+0x20/0x38
>   rpmh_flush+0x58/0x1ec
>   rpmh_rsc_cpu_pm_callback+0xe4/0x144
>   notifier_call_chain+0x58/0x90
>   __atomic_notifier_call_chain+0x48/
>   cpu_pm_notify+0x40/0x6c
>   cpu_pm_enter+0x34/0x7c
>   cpu_pm_suspend+0x10/0x20
>   syscore_suspend+0x128/0x2a4
>   suspend_devices_and_enter+0x5e0/0x8a0
>
> This seems to be because timekeeping is already suspend by this time.

Thanks for the report.  I posted:

https://lore.kernel.org/r/20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid

I think there are still a bunch of not-yet-landed patches needed for
suspend-resume so I only confirmed that the code still works OK for
the idle case.  Hopefully you can confirm s2r is good, though I'd
believe it should be exactly the same.  I'm 99% sure that udelay()
still works fine even when timekeeping is suspended.

-Doug
