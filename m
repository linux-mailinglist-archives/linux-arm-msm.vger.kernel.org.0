Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEE6402F2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 21:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346106AbhIGTzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 15:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346102AbhIGTzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 15:55:44 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3B0C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 12:54:37 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so508360otg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=eNsppomO2keBxhHRJ7cqRlPWMOENEgbNhprLa49KjSM=;
        b=YWKQpuDTWMbaSnr4MYGCvvYX0uC0P8bk55rrQDQuuTxwbve1htEfv+rNldGQGBFijR
         lTuL+tWvTOIU9bogyI7lhadaIhzVw4LkeAxdmOmmTD235DXvZdEBHuyW31GWRjgrmPDq
         ClYW2lZJFPY0cRtQVL6Nr8IeQDQzPNs0EmE44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=eNsppomO2keBxhHRJ7cqRlPWMOENEgbNhprLa49KjSM=;
        b=PQPYzgiLRN2+AZGTeuSb2cgFF5cfyaAJbf5Q0wvxbtVIW0I539T6jm5+uGSGBpx1wX
         /iO+Vk97UlmhY/6QciMw87fvWPEEEuc7RqpXaas+oCmR/axZIyMR6VAakqNOxtE+vVSz
         U8XKBbBnbGnP228BJ/OjzLw3pnRI4A3Y/rqPgjyuaaP5QbpgvZ5OWjtxIhYQhFtAqOdw
         XkFN9PkeGL2uXs2CiSZj9hkapc0gb3NnivKAPPtKkpD1v866kdqC8tf53q3+Gw2IViJV
         DqB47gIvhDfOYfm9lgtr9Bj9FCvZ2WLu+TH+eoCp16wOdfxpxDnJIBfYRU9f0y4lzHm3
         d84A==
X-Gm-Message-State: AOAM531taVoFNEbqzK++ikpDgfxkh1SiJQzeLHp0XYFI+BSwVRsjTcVq
        D0qb3iGDzNNX2Ry3Xi0GuTIrGtBBpP5GTeDbJcgeiA==
X-Google-Smtp-Source: ABdhPJyzr8qP5oUk1QZh/gt5W0hV8SHhW6pfNwmQGQwevcEdl4gAcrYQ1vaogwGyVNGWcD4XZl+Z04zpjOFAEiXA6aI=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr87159ots.77.1631044476816;
 Tue, 07 Sep 2021 12:54:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 19:54:36 +0000
MIME-Version: 1.0
In-Reply-To: <587ed6fd-0203-cb7d-338f-185185d88f76@codeaurora.org>
References: <20210903100153.9137-1-srivasam@codeaurora.org>
 <CAE-0n50=vL0MHHHkc22ahrqqD3DskFXZzFU8qjU8=EY1kZ+__Q@mail.gmail.com> <587ed6fd-0203-cb7d-338f-185185d88f76@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Sep 2021 19:54:36 +0000
Message-ID: <CAE-0n52cvV3yqaU0Ea50MYXMQa6Ot2z1_0NfUpDeZj9_M=joiQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-09-06 06:35:46)
> Thanks for Your time Stephen!!
>
> On 9/4/2021 12:10 AM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-09-03 03:01:53)
> >> Update interrupt clear register with reset value after addressing
> >> all interrupts. This is to fix playback or capture hanging issue in
> >> simultaneous playback and capture usecase.
> >>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> > Any Fixes tag?
> Actually it's incremental change. I will add base commit of this function.

Ok.

> >
> >>   sound/soc/qcom/lpass-platform.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> >> index f9df76d37858..1a0a4b0b1a03 100644
> >> --- a/sound/soc/qcom/lpass-platform.c
> >> +++ b/sound/soc/qcom/lpass-platform.c
> >> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
> >>                  }
> >>          }
> >>
> >> +       rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> >> +       if (rv) {
> >> +               pr_err("error writing to irqstat reg: %d\n", rv);
> >> +               return IRQ_NONE;
> > I was thinking we should return IRQ_HANDLED still, but then I guess
> > failing to clear the irq be treated as a spurious irq so that if we fail
> > enough times we'll shut off the irq at the irqchip. Things are going bad
> > if the write fails.
> Here bit confusing. Could You please suggest How to go ahead on this?

Sorry. I think it is fine as is.
