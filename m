Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C0D41D064
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 02:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346832AbhI3AEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 20:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346652AbhI3AEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 20:04:23 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E5AC061768
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so5068783otq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=sz4qPh2dIGtWybWIz2+FjL1xXs0xQ2gcPE6MG4pSh9s=;
        b=G5lm0rNGleMtnm89OwP5wrX1UP7DVgf1ffpI+keySiETKAx+04oGYa2qSV9N45Dae5
         4oSFDuhP7WYfWr4MFksVnueKfrzQ5VwNgoqGiHqwEFI9DEoNAs7RrciO/LQx4rFXBuY4
         WL/6osoaLWCDuTBcByfs5EdFt7hXSfiLPRyBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=sz4qPh2dIGtWybWIz2+FjL1xXs0xQ2gcPE6MG4pSh9s=;
        b=m9OXs2fjCPCCfkZLpAahd63xm+u8lQAog37DATtn7j7xBioF3hL4ulNH8ZK7weyR5p
         VU1omDAg/AhYPyj1iTf35DHTj9+JmEaOLjHBm8gFeBOHl02VlqlrRXVu3djtZC56ZbCT
         rXwKFUpNWg87KwGsmVDj3fxy3u7gSzOhVKMoQMKiLH+bqtHZIdDSlJ98GIwKo+ZkGW+X
         9D+U0J9utGAAbspmHkrBz8U93UZFQnrvZxV1Fxnx+VFEZG5drdNcY9PuCEuNmjnZSqEs
         dTA065sX1hR2FygQ+6yrB6+KPGLNdgUnMDtQrLneigwzW/frv53fVOhVjykgHVEebBD7
         pyRA==
X-Gm-Message-State: AOAM531h9ovpS1pDtu4K0MR7yNaDz16IWgxr6MM6lPTd0PY6XaSDLRgc
        tsWUpk56STi4HqhMRqKrSkdcYiuK7pRinmIydPQgiw==
X-Google-Smtp-Source: ABdhPJxnw99W4CrkwEhmaBpAMawQdJMBR5h0AmtsSMqnz3MManm3XK032vWPW2BVu2aphVCq7lnE3qq6RcZ6fDGC+FU=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr2543966otn.126.1632960161028;
 Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Sep 2021 17:02:40 -0700
MIME-Version: 1.0
In-Reply-To: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
References: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 29 Sep 2021 17:02:40 -0700
Message-ID: <CAE-0n52iO3rSE59OBOgJ1sZMckweoBxN5ih9fY2dg_ht9cctfw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: only signal audio when disconnected
 detected at dp_pm_resume
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

Quoting Kuogee Hsieh (2021-09-29 09:17:04)
> Currently there is audio not working problem after system resume from suspend
> if hdmi monitor stay plugged in at DUT. However this problem does not happen
> at normal operation but at a particular test case. The root cause is DP driver
> signal audio with connected state at resume which trigger audio trying to setup
> audio data path through DP main link but failed due to display port is not setup
> and enabled by upper layer framework yet. This patch only have DP driver signal
> audio only when DP is in disconnected state so that audio option shows correct
> state after system resume. DP driver will not signal audio with connected state
> until display enabled executed by upper layer framework where display port is
> setup completed and main link is running.
>
> Changes in V2:
> -- add details commit text
>
> Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_resume")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
