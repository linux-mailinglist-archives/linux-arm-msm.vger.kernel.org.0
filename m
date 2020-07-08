Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2321924B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 23:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgGHVTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 17:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGHVTf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 17:19:35 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C73C061A0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 14:19:35 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id k7so23955072vso.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/y9ZwmNn+oHS/YG99lAA1vbL+yYfWBpKvPtygJNnx1Y=;
        b=RbdOVmNLjU1dmqCFDkewrU07toCP6wp5eolc5J+eZG1aV0cymd0po74ugeBqP50Ln5
         mAerEGGHvwIPfsv/GD4tVXPwsYeKgvvwwJdzSeEtH5wxNt2BIMmDwhaxXREjc6ohOSRe
         oPjk2ZFYEIOsgoY5s+WuADTF1hRrBpUNm5+WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/y9ZwmNn+oHS/YG99lAA1vbL+yYfWBpKvPtygJNnx1Y=;
        b=SeAorMbk/REogV7+hZYYPXKyhMZBIw/KqAnrimzHbAMy6bb3fgxuZvv7wbA/vRqBpm
         RTdwuzzUMDnBkn4vNW9udzo/qsUX95+1HSDUbmQQagEQLe2vVEUA2hKmLguEk+W0Oa9w
         ELXk0PgEDsjJv2pqJwXciF0wubEUinnpc9sZWtxUC8AtN/ooqfSSq3r25uqy5YlVZeHZ
         HzvKP6YJBRsrLO0pIURQDeqkZhj2dSSgE5G1EKQQWnLvh8YdXfqMw16hHHPgZhztzxoI
         AM9DwPQJzRx1lkW0F+lorkrXD/hmnCzjtnyoGFhiIGE8hkflqrw265oYqBsbBKXrmgyK
         rsSg==
X-Gm-Message-State: AOAM533L/Af3FewNuQiuDgU/8IyEvIy/0SlBLGmiUyNi29+VpFoplouo
        uSn5wYWKcECw18RKuFkHfBa1RBPILh0=
X-Google-Smtp-Source: ABdhPJwySgIU3SqSWW8+EOFCuios6IpdjMtUFftSzy9lQGTVTjMkjpWBUa3CXm8OnOsdQk++fzFGpg==
X-Received: by 2002:a67:f856:: with SMTP id b22mr30147281vsp.123.1594243174525;
        Wed, 08 Jul 2020 14:19:34 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id v10sm147929vkv.41.2020.07.08.14.19.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 14:19:32 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id a17so14394135vsq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 14:19:32 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr13796424vsc.119.1594243172403;
 Wed, 08 Jul 2020 14:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
 <20200706203805.GS388985@builder.lan> <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
 <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
 <56fb02df-372d-935a-cc39-c13289d65c0d@codeaurora.org> <CAD=FV=VcBK02CS+ms0HtV0f_t7G7-0rzJ11xDKWdLanGVrx0QA@mail.gmail.com>
In-Reply-To: <CAD=FV=VcBK02CS+ms0HtV0f_t7G7-0rzJ11xDKWdLanGVrx0QA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jul 2020 14:19:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeXKAfWTK9q9u4m7=OU51rqQ975B+NBQDJT_sedPFOfQ@mail.gmail.com>
Message-ID: <CAD=FV=WeXKAfWTK9q9u4m7=OU51rqQ975B+NBQDJT_sedPFOfQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 8, 2020 at 6:42 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Was there something wrong with my proof of concept patch?  Unless I
> get swamped with other things, my plan was to try to make that more
> real and post it unless someone told me why it was wrong...

OK, I spent a bit of time poking at it and cleaning it.  I _think_
this is right now:

https://lore.kernel.org/r/20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid

Please test and/or review.

-Doug
