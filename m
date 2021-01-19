Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24532FC4B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 00:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbhASXVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 18:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730327AbhASXRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 18:17:54 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38141C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 15:17:14 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id v126so23653937qkd.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 15:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dB7F3Mtlu9hzcaH0arXRlX+sy8rlfc5xRtRuFS9rvVg=;
        b=SibYt1GVdrviyGqBHiuRdkDJ212F7mKHeGAGTB3L6VdvZ2tX3F1XaE6kRQ89HeDHwg
         ctZ9o3Y7tlLWqVfF7LjJMXmKGSrNa7VSowWHy5QAb8k8NxgbCOgJC1zipjomGEe3iJea
         5TUZlIHbOQHHZiG4nXdh4SABgjHW6NYYLnatBHGCtcOa1VU0mfaYrkyObMYi3FoyzCIS
         u9No6XJWWpJnuT3Yd0j9glu45Q1AoZ59LbenJHRMpv6VgZ3urxG+tii+h03WPMXVJeF0
         oYBrTIqMJDQYiiWTHVH+nvfZqnu+QcedayPLqgxAsYcqY9Mg7ssCkwU2X4lXf6mmRWne
         Q9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dB7F3Mtlu9hzcaH0arXRlX+sy8rlfc5xRtRuFS9rvVg=;
        b=RrbWdfK/BoxR3M4hVY+Y4xcgCjVGfAJJU8IiALXmeBuVJfrsQNsDuLwicCWu3UfT8L
         JNnjqJ84QGKsjnEJE0J3f5efNepQhbfhwwRdhzEVErVlVmIXdQr4LcnJBSvZcccJw2gV
         Q8aW1WALDZgT+/QmZqe/3TQQveDeZlq+4I9Or94coDcwIKzIZRuuPDIuzlLKl8ttWYyx
         ERuq8TnQHCFTOfWy99ZQOPD028CUWi4L8DRU6uIr9jGARn35zhnbBG+ep2xHkfmcMe/0
         M7/gUrbDfk8m0WKW09OWiOlTnDojLLR9EuRuLEhjR8s1Xi3MUHMWq4jWZfIVwf4yHKFY
         1DCQ==
X-Gm-Message-State: AOAM532UoU0o3wKdAj+Oz/gU96dBdv27vchPxJ6xLGwFM7O7wEIgRQGm
        +HDKXcSkBintjlDw0KzAKKKmAx9bo85QlkA3FJqu3Q==
X-Google-Smtp-Source: ABdhPJyGeUyg+YiDKqtN0x6dVvip4U9xb9aSUrHVlWP6pb2DIhbKAAN/SFc8tehaF+Bmf26mv1wmQWdcJ5xXSunbNtM=
X-Received: by 2002:a37:be84:: with SMTP id o126mr3005803qkf.138.1611098233468;
 Tue, 19 Jan 2021 15:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20210119054848.592329-1-dmitry.baryshkov@linaro.org> <078a7025-ce5c-a252-f8f4-694c56153b3a@linaro.org>
In-Reply-To: <078a7025-ce5c-a252-f8f4-694c56153b3a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 20 Jan 2021 02:17:02 +0300
Message-ID: <CAA8EJpr2bubGBtUGf=4+d4ZVT1nReTBzT25scGehdwKy2EepmQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] qcom: pm8150: add support for thermal monitoring
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Jan 2021 at 23:58, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 19/01/2021 06:48, Dmitry Baryshkov wrote:
> > This patch serie adds support for thermal monitoring block on Qualcomm's
> > PMIC5 chips. PM8150{,b,l}, qrb5165-rb5 board and sm8250-mtp board device
> > trees are extended to support thermal zones provided by this thermal
> > monitoring block.  Unlike the rest of PMIC thermal senses, these thermal
> > zones describe particular thermistors, which differ between from board
> > to board.
> >
> > Dependencies: https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/log/?h=ib-iio-thermal-5.11-rc1
>
> Shall I pick 3,4,5 also ?

I have no strong preference on this topic. It might be easier to get
3,4,5 through lk-qcom so that we won't face possible conflicts. Bjorn?


-- 
With best wishes
Dmitry
