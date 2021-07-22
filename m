Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE3B3D2C91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhGVSfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhGVSfQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:35:16 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCD2C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:15:50 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 42-20020a9d012d0000b02904b98d90c82cso1519738otu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EusEYbQ13bFWsLQf0HYpb/wdiNyPX9L+F2ViR+RO33Y=;
        b=D+iysSmfAuVRkVd1YCYohemSgnbS7Iy5ZzkvKR3YyklHA+zasDTCgz+zlrYctzR1wL
         XdFzJdjD60jMBjjnHX03lBmHM5x+f8uWfK8s2/CYBx5lCppC463LwBRMfxza0K3f/wWy
         UfdzO0P+5ciJiKjBzO/O61wwUDVvT2F8Pd+xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EusEYbQ13bFWsLQf0HYpb/wdiNyPX9L+F2ViR+RO33Y=;
        b=S8diVq4ZYERSELEmoGlSrVq9yJedezXi9jV96UTPf2lKYcr3Jdj2t7ftuyBiwseV28
         HMjZJIIl4Ogf5Io2jOYk9MHqemLeEGKv/rU18okg3h13vVGTeaMRovAXHKavq3OraSKG
         +/WFct++T9hz7VgvR5vXfO70aZeE9O2MXUCW1PXivfbReMFM3sF9FjL8lmFkYYnckglk
         2TxnS03KhgbpjhCeXXEYZHDg/8VLwfxCrpKKufJhDFSTOJ5SF87VIhiOQvjv0BDEZ5Ki
         qsN28PZ9g8ut6Me0j3a3y0XOOqMLzx3oU7Kt+jrjzYJl5fNFSY9VCKG6eE3vvWOzj07q
         zVMQ==
X-Gm-Message-State: AOAM531ul1RzNS+LhdrIoLmX8C9UH7THT3Jfq8jqMQ/coHnEtbnlJHTr
        kmSMhhV29ZUPwx65GALPRciOncHZn02b2S2F5X00XQ==
X-Google-Smtp-Source: ABdhPJxZi6ghcXO9BFFOzhyS7XDAHh9cxgA1qHQYoljh9jZDXj31sg2BDKAeSnxi1yD6Oc1FE7A9cj0f1/F2ivB0p2U=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr859418otl.233.1626981350381;
 Thu, 22 Jul 2021 12:15:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:15:50 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org> <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:15:49 +0000
Message-ID: <CAE-0n53e0cM2dFxwOGwUTW+u-X8yTPka1HyzAPPcuwq43zBh4w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/msm/dp: do not end dp link training until
 video is ready
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-13 08:54:06)
> Initialize both pre-emphasis and voltage swing level to 0 before
> start link training and do not end link training until video is
> ready to reduce the period between end of link training and video
> start to meet Link Layer CTS requirement.  This fixes Link Layer
> CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3 and 4.3.2.4.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any fixes tag?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
