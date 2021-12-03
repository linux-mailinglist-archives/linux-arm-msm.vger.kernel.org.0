Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C2946701B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 03:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350764AbhLCCoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 21:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350245AbhLCCoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 21:44:32 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20035C061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 18:41:09 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso2360376otf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 18:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dixTX2RrlnwesW8iIjzk4nhy820PBObo86K/cFmNqMQ=;
        b=iM/D/ZJUqYaSokRA0yjzflf+/4LODWsu5gwGloRuNyTjAQEtTgoPcoOdA2I6kQ5lN2
         K5Ns7XaunKfXiHrNPHm+Dou+ZnKfnG3rzDHEE3TmxPiPcUrYMxYuh5Ad2c2DC4F+yclD
         hMNsUsZDl4ZPf68T1jHhUt9r91mbOjoLEGcTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dixTX2RrlnwesW8iIjzk4nhy820PBObo86K/cFmNqMQ=;
        b=Fv5VPOAT7DceExfVvSNt3TNOw+I9OTsz1/E8/jupDfD8hW7Ap4AVaMKZ93x9zl5CRR
         f5bxRkWXDUWfxKc3VmGky0/xyk62L6JDnX2c8NwQL/BHBFLJYaQYNjlWtcojXdQ4mQRM
         ppC87UsWwh0ceB9N9yqhi6th8OJuhGP8Qwria24bwtRKh2GqpoyN02M9S7EDf8tSxcEz
         xfu1iCylWHK5BCAfVU7LBTOmzIJxnN+PGCMbXKZh7dcA+jEoMJ/emK1oU4nhhqwDKVFm
         toSCKrmXrIrDEnSH7qppO10ZgJYT6hr05pmeJ4xbmw3NNVG6K/XF2olHWTCiujK3nhg9
         r6Ww==
X-Gm-Message-State: AOAM532K3p7McavGDFn0qsyGVKx1YKMg8PszV8eJs6xGDU6y2xzOEolK
        VSU/I8XGDysURX000cLhEKDQOgN6p0iNg+ugZWaA0A==
X-Google-Smtp-Source: ABdhPJyK/ETlxs8XkQxa+hn+epgPr+mfELlA+cPMYqrCB6QQHK9j+S0/zfXRebJ/od3mAwIQuxUU5KO7z684Wem2OaU=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr14174984ota.126.1638499268424;
 Thu, 02 Dec 2021 18:41:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 18:41:08 -0800
MIME-Version: 1.0
In-Reply-To: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
References: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 2 Dec 2021 18:41:07 -0800
Message-ID: <CAE-0n51-=qTWfBVPFEmpEb7md6cg5O__bhydXTUb+=8dRqCuqg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuogee Hsieh <khsieh@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-11-09 13:38:13)
> From: Kuogee Hsieh <khsieh@codeaurora.org>
>
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code scalability.
> This patch divided the driver life cycle of operation into four states,
> resume (including booting up), dongle plugin, dongle unplugged and suspend.
> Regulators, core clocks and irq are grouped together and enabled at resume
> (or booting up) so that the DP controller is armed and ready to receive HPD
> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
> into DUT (device under test). Once HPD plugin interrupt is received, DP
> controller will initialize phy so that dpcd read/write will function and
> following link training can be proceeded successfully. DP phy will be
> disabled after main link is teared down at end of unplugged HPD interrupt
> handle triggered by dongle unplugged out of DUT. Finally regulators, code
> clocks and irq are disabled at corresponding suspension.
>
> Changes in V2:
> -- removed unnecessary dp_ctrl NULL check
> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
> -- remove flip parameter out of dp_ctrl_irq_enable()
> -- add fixes tag
>
> Changes in V3:
> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
>         dp_display_host_init() for eDP
>
> Changes in V4:
> -- rewording commit text to match this commit changes
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Can you please resend this based on the msm-next branch[1]? It doesn't
apply now that other patches have been applied.

[1] https://gitlab.freedesktop.org/drm/msm.git msm-next

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 87 ++++++++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 83 ++++++++++++++++++++++++++---------
>  3 files changed, 105 insertions(+), 74 deletions(-)
>
