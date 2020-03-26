Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C84194669
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 19:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgCZSVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 14:21:02 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37081 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCZSVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 14:21:02 -0400
Received: by mail-vs1-f68.google.com with SMTP id o3so4534468vsd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ohjyYv73OFKplmBSM5tbGvwFGemqZp6n5SDqqDBghU=;
        b=HMIxrbK1VCB2JxiQem4/MeacZoLlMIbT6Oaise1EYREq3Npjbn+u7cn+w3g/xFl3K/
         3eeKrOIKuUnSMHwY6GxEXl1EPlDU6KUdFBMueFiFO2KlaCccAiLgmOa2cFUWt6fYhoa7
         oEDNm5IU3L+Q3TA9eizBtP3dpLIi8HZV3yn1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ohjyYv73OFKplmBSM5tbGvwFGemqZp6n5SDqqDBghU=;
        b=tfuCnwcv0uSqmDVcm1tbmqdL3AsPn9ni+9JHwz8jGjDJagkq9LbNo6t4x9oZhnToA2
         EVkaRXUR/eHhI1Kbwguwz5UCdlxRT4CBG1GG8Tm8nxnLUp5LFBvQBwu6b4/xvgbFhfic
         KTCxMZY/jOVddy6lIYXqgFqaShn/pE5BZX7F/rU83LmpFj6k24wjXBVuRRomUw58yi9i
         j0OqYdNGYY9eAXXtvqzuEGZwu5iUPP+z4FIIoR8BTzKzBJ+NBwbfsQgjZB2THIwreYWW
         bvBpwvetQVg0nKzNBmNNAwv74yENwKwGae36d/dUzc1/a3XX+d0DjQUMyhSw6O9cQ1N3
         tNRw==
X-Gm-Message-State: ANhLgQ3//faR0JLALqiN4e7XHbmEWvls8I+qeoxhvVpAliStHNlnExKc
        2YjesnhzFstqwLMkPlC6fUuX7xiFBSA=
X-Google-Smtp-Source: ADFU+vsr5vwx8sJ5qfMjBP36FOj52PZ6BV166FJPVY5GywnHaA8rFwBrOLfsrbAFmti7YhZBvyttHA==
X-Received: by 2002:a67:eb81:: with SMTP id e1mr8309523vso.27.1585246859525;
        Thu, 26 Mar 2020 11:20:59 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id w131sm1380793vke.8.2020.03.26.11.20.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 11:20:58 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id s10so4511722vsi.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 11:20:57 -0700 (PDT)
X-Received: by 2002:a67:2c81:: with SMTP id s123mr7183988vss.198.1585246857424;
 Thu, 26 Mar 2020 11:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org> <1585244270-637-6-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585244270-637-6-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Mar 2020 11:20:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvMe4xqGTH=pU8TL1FWN9BBkp0EOkxasdBsC51299fJA@mail.gmail.com>
Message-ID: <CAD=FV=WvMe4xqGTH=pU8TL1FWN9BBkp0EOkxasdBsC51299fJA@mail.gmail.com>
Subject: Re: [PATCH v14 5/6] soc: qcom: rpmh-rsc: Clear active mode
 configuration for wake TCS
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 26, 2020 at 10:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
>
> For RSCs that have sleep & wake TCS but no dedicated active TCS, wake
> TCS can be re-purposed to send active requests. Once the active requests
> are sent and response is received, the active mode configuration needs
> to be cleared so that controller can use wake TCS for sending wake
> requests.
>
> Introduce enable_tcs_irq() to enable completion IRQ for repurposed TCSes.
>
> Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from wake TCS)
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> [mkshah: call enable_tcs_irq() within drv->lock, update commit message]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 77 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 54 insertions(+), 23 deletions(-)

I was writing my review of v1 at the same time you sent this.  Looks
like your patch does address the most important piece of feedback I
had (adjusting the interrupt enable under spinlock), but some of the
other feedback might be nice to incorporate:

https://lore.kernel.org/r/CAD=FV=XmBQb8yfx14T-tMQ68F-h=3UHog744b3X3JZViu15+4g@mail.gmail.com

-Doug
