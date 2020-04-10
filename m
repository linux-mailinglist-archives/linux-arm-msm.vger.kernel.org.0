Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D48FD1A47A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 16:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgDJOxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 10:53:06 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34343 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgDJOxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 10:53:06 -0400
Received: by mail-ua1-f67.google.com with SMTP id d23so701800uak.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sXbs2eSo2cip0Bhx0gise5pTsMBWhGiPepQWudlrrKs=;
        b=IQaN9KussGunjaHK0pdxgBSCx4RVNoghmD135k0hs2w75kdaoTKcoRE1PJ5lbo93ww
         lGQAaiETFOrzVMXrOQGyjT5Xw7dQCwQsxq8RN1dcYWo8GLAEt4ygV3NHbzzeGeRNmO1k
         cewZcsSAJHMTeay1xQEeMe5Po0m1DEfvIB4yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sXbs2eSo2cip0Bhx0gise5pTsMBWhGiPepQWudlrrKs=;
        b=mCgvJRq7Tckb5zHUg77Ed475n1nim8oGy7rb4svt14SifCMgM6PMccboSk1L/Sqqm4
         2nY4aZHvILwrCA/re8Hs79GMof6a/IqePKQdyrk54TNdgWSb+iUn9jSCadKevAwbWyBT
         TJudRTo129jlP+MziOf5SH1kRZj+jBXa+/s/m2/JyDIvD7l69tNEk+wTXkyNKV4UE3Dd
         AA4YQLpJs1/JBteqIs6w95YG1hSWAh3YkH1kfIq9LZIf35/Nje8vp5PQ5CTLqaXBEhyg
         mulm0sUYRtgPOAqHW4Ln3KknWFsfeWvAUYpoJWq8ZI1QcEXTtqhPC2lRseU39grTlxfh
         3aJQ==
X-Gm-Message-State: AGi0PuaKdxnE3tunPf7uWPBVASv/VUQXPJ5dTNSEvEp3A/vLLpAYwuLa
        pgdf8EgvCWVU8/eMDR575r8xEG8RPKM=
X-Google-Smtp-Source: APiQypIm9w4oMAMLjtADx6o5Ifdd2xoMePB51ScsSufYGzeoCOio/cuyPSVZvbNxmyeWb1EgsmTWJw==
X-Received: by 2002:ab0:1869:: with SMTP id j41mr3109040uag.99.1586530385541;
        Fri, 10 Apr 2020 07:53:05 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id c12sm173677uaj.11.2020.04.10.07.53.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 07:53:04 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id v24so692348uaj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 07:53:04 -0700 (PDT)
X-Received: by 2002:a9f:27ca:: with SMTP id b68mr1030762uab.8.1586530383958;
 Fri, 10 Apr 2020 07:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
 <1586154741-8293-5-git-send-email-mkshah@codeaurora.org> <158649213142.77611.5740203322498170248@swboyd.mtv.corp.google.com>
In-Reply-To: <158649213142.77611.5740203322498170248@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 10 Apr 2020 07:52:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkiR+xLeowOT+H3ZKNCesf84AJi6mHiHNpJ2P9-DiXaQ@mail.gmail.com>
Message-ID: <CAD=FV=UkiR+xLeowOT+H3ZKNCesf84AJi6mHiHNpJ2P9-DiXaQ@mail.gmail.com>
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 9, 2020 at 9:15 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> >  int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>
> This function name keeps throwing me off. Can we please call it
> something like rpmh_configure_tcs_sleep_wake()? The word "flush" seems
> to imply there's some sort of cache going on, but that's not really the
> case. We're programming a couple TCS FIFOs so that they can be used
> across deep CPU sleep states.

I'm hoping this rename can be deferred until Maulik's series and my
cleanup series land.  While I agree that rpmh_flush() is a bit of a
confusing name, it's not a new name and renaming it midway through
when there are a bunch of patches in-flight is going to be a hassle.

Assuming others agree, my thought is that Maulik will do one more v17
spin with small nits fixed up, then his series can land early next
week when (presumably) -rc1 comes out.  If my current cleanup doesn't
apply cleanly (or if Bjorn/Andy don't want to fix the two nits in
commit messages when applying) I can repost my series and that can
land in short order.  Once those land:

* Maulik can post this rpmh_flush() rename atop.

* I can post the patch to remove the "pm_lock" that was introduced in
this series.  A preview at <https://crrev.com/c/2142823>.

* Maulik can post some of the cleanups that Maulik wanted to do in
rpmh.c with regards to __fill_rpmh_msg()

...assuming those are not controversial perhaps they can be reviewed
quickly and land quickly?  I suppose I can always dream...


-Doug
