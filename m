Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B87431F377
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 01:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhBSA4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 19:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhBSA42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 19:56:28 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4006EC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 16:55:48 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id v206so4148497qkb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 16:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=apjhumUat3NAbjLhxDf0sfvDj5HYfNoWzUP7Ib3pj2w=;
        b=NNzBm8KEm527LO5xCGrc89inWBErH3vti2O/scd9JQfr4RVY/LeJBzHUByDjYNxzoi
         e23cAEeErnY5SK0FknxEM28oWILkuJpsMX6f5Npqea6xND5MUOrdisuDmS4rOzLeQCUW
         T9E6YAI9b5Qi3FPkXPoV/fakGz/MDW5PFv+QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=apjhumUat3NAbjLhxDf0sfvDj5HYfNoWzUP7Ib3pj2w=;
        b=mFpK+d2S+DNq8wfhMXJQ4c/Gjkj5CGjsLruItOum74a1Y+duCWp5iQUWzbHNqe4LYu
         b79Y4Uh2CLfmElEFOU7rTjIa6asZFjSU7RurZjsk2sScoc804lnH+Ozy6PIwpzIMCT/g
         XgPF0N1v4U9CAMczVrxFp/tTFVpeK/s2NAVbwvrIC1a6Nj412e238unnGVHuysVJ+/qM
         yCcOFnRvOYuwgv9j7IYGRn5ParpwlTR+INqCS2+ig19yWNzw6z+TEDtG5vFo7jw/DuRI
         5ShhsgDVO68EPIWfmaaXzAX7/y/TF8DzuoCEi+SuEckPzBpnJxyVmxbWUi+X/0XXkrsK
         vGow==
X-Gm-Message-State: AOAM531DaXdi0mx7gshZxb2YOJVkrBhFbzfctsQHUKj7Njyy0GcXvhRM
        O7oCQtsd3z+b/XYrGRuPKLN0GPubMyHVAw==
X-Google-Smtp-Source: ABdhPJzOBxqWr/diJHmSRLyVrsOBg+W5gGqxdEOWt08UkK/bOXnPcuGgzoSUh6Pp3eoTxqJd+6z5WA==
X-Received: by 2002:a05:620a:14af:: with SMTP id x15mr7490709qkj.392.1613696147329;
        Thu, 18 Feb 2021 16:55:47 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id q12sm4982377qki.91.2021.02.18.16.55.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 16:55:46 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id m9so4006322ybk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 16:55:46 -0800 (PST)
X-Received: by 2002:a25:b74d:: with SMTP id e13mr10284347ybm.405.1613696146315;
 Thu, 18 Feb 2021 16:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
In-Reply-To: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Feb 2021 16:55:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xh5foM_RYCneVUJZmX39KPt22guopVyZpzLWHSt4T+Ww@mail.gmail.com>
Message-ID: <CAD=FV=Xh5foM_RYCneVUJZmX39KPt22guopVyZpzLWHSt4T+Ww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Avoid glitching SPI CS at
 bootup on trogdor
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
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

On Thu, Feb 18, 2021 at 2:55 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> it's believed
> that, under certain timing conditions, it could be getting the EC into
> a confused state causing the EC driver to fail to probe.

Believed => confirmed

I _think_ <https://issuetracker.google.com/180655198> is public.  It
explains why this was causing the EC driver to fail to prove.  In
short: it turns out that when we glitched the EC it printed to its
console.  If the EC's uptime was long enough then it would spend
enough time printing the timestamp for this error message (a bunch of
64-bit divide by 10) that it wouldn't be ready for the message we sent
to it.  Doh!

-Doug
