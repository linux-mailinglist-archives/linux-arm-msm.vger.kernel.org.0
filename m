Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5051F3E503B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 02:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbhHJAHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 20:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhHJAHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 20:07:10 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DD6C061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 17:06:49 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso5797508oth.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=z7lFn/OgIbozxfPpWIL41tqWAyoo1c25CUhE+wVHy2E=;
        b=YhtgTTL24J2Q901pxxraRzr2e6aEAsvLQkHaiYTevOHYcVNNb70cjDiaEwdsIq8BXN
         wpYvPIjDyag/iyLToGVOJkKLG7uJdWDBeQ0RrSjIpGoUS+WRXWr4Uuc+9lFlSBwQdix3
         ZJi1BJJhihwUbTrgXthbzJEm8hOQtXIW2ldEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=z7lFn/OgIbozxfPpWIL41tqWAyoo1c25CUhE+wVHy2E=;
        b=BzS+Ci5HQiRSctu6oFMtaDvz30AHulY4QIUx4fMySFWyO0l+9lcHsMfFpBXS6W/n/T
         Zlnlq9BotjZi03CIDxf1i97dW1LxWIap8IVKejAs7wy6H77VqI3CvD6zJcUfSsraB2sy
         f+HF/6Eh5l+luGIrfkI18HMatqq64Un/mXfJnWKzWvNil1/YTN9+2Ia/izNvqJl0hBmS
         7yqdn6OSCpR0AZW65uQ1WA2p7Q/QI7CkX/4LbxhI2x9rIYAW6aRVsdgmuOqGcdHFNzXq
         FhIen/VOiCS1gspLS2+2INR+oBvcm/muFMKcD3D7V7Hk7/9W2RmFDlayNnm+PFmu+AWc
         eeZg==
X-Gm-Message-State: AOAM530YJkK6qeVkfLj4oDnOHMF2JnlW0MCD06VQadk3e28G+epff2Ti
        uoHuSkg6ZQsGS6XWdD1tvF4JlokI/m+JeRBL2sPEmw==
X-Google-Smtp-Source: ABdhPJyHxPiz+4jZdua08WndVHVUUZwOp93vnlfR/lihn4zZ0NeOwGKE8URDZ20NU/NwrBeRkck27YsGd7/EAhlLU98=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr18959569otq.233.1628554009313;
 Mon, 09 Aug 2021 17:06:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 17:06:48 -0700
MIME-Version: 1.0
In-Reply-To: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
References: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 9 Aug 2021 17:06:48 -0700
Message-ID: <CAE-0n52+DWvcO54WJEJUaFQ9y=4sb4SeuVzQ5LSXGm24bJ-16w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-09 14:58:57)
> Add drm debug logs to dp_pm_resume and dp_pm_suspend to help
> debug suspend/resume issues.
>
> Fixes: 355ab7428f09 ("drm/msm/dp: add debug logs to dp_pm_resume/suspend")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
