Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018E637251D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 06:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhEDEdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 00:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhEDEdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 00:33:35 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4DBC061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 21:32:39 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u16so7595754oiu.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 21:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=a37uZcs6HgM1/vP3znI4pHBE2+32UeBTKsWjif6oY20=;
        b=bMJ1UxfO8SLLcF5VTUyHFMK6yyvLdYtQ0+rOu6/p/CMzJ3IUKOip7iTYuaSfoB9zTt
         Le4Vxr9JFqv/14dflPJkUPSE3NC4BwMvFEMvRrOOC5Aiid0aUh0DhEOQquSbuD0SELUz
         J+EjSurLkZGwqtJHC/vk9B7NvTv13FibmmtdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=a37uZcs6HgM1/vP3znI4pHBE2+32UeBTKsWjif6oY20=;
        b=mVb2qfiDm1ZDPLCA0ePXo0o4uktXGw98uCjQkc5psdhN7zRsLktguaPzkuyy37IxTz
         nFjMP5zFmq6iowFffNe5u1nC4sCvnYAZRjyoh40MQls+UhhvStbXaPAYYxR4eOYhhspI
         qbTD3Qeh5aKDT5gg4RnbFe30EKZ+kTzr24uiZ2xB4TPUhMIygYsojQyhfRuzdzJYFXEh
         +clg9B2UBI/K5s8I4XKzc+vy7/aw3j9UGwqgtXowr0McYlGTaQlX5M4suX6jNFcpLwQ1
         4+DeQIVB5qYOX2Ni8a4I+iVIlOSB52iceGYEAd0e042gd9uuwFRpT0I5Bx208oqAPbaO
         6goQ==
X-Gm-Message-State: AOAM532vVt8FBO0GVpL9zEW80KWXQVP6etFTQ6YRdpVDeBa5i4nq1ssd
        u/fsATezuc7kS0LeLRKK2WSRDFOPBszWuMKDALPTLw==
X-Google-Smtp-Source: ABdhPJwxC4sqafnYqb5HJOdhvJmLXHvqL+OU/If/hOekFCKccr6eGMJfx7S38QhGYX+BQMD+ABjT7LsntzFbiFW0+Kc=
X-Received: by 2002:aca:2311:: with SMTP id e17mr4215692oie.160.1620102759239;
 Mon, 03 May 2021 21:32:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:32:38 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-3-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org> <1619048258-8717-3-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 3 May 2021 21:32:38 -0700
Message-ID: <CAE-0n53Qb6+Epzf=1MfbqphApos+bMpi+OSDYfdVXPbyfMCMQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dp: initialize audio_comp when audio starts
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-21 16:37:36)
> Initialize audio_comp when audio starts and wait for audio_comp at
> dp_display_disable(). This will take care of both dongle unplugged
> and display off (suspend) cases.
>
> Changes in v2:
> -- add dp_display_signal_audio_start()
>
> Changes in v3:
> -- restore dp_display_handle_plugged_change() at dp_hpd_unplug_handle().
>
> Changes in v4:
> -- none
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Fixes: c703d5789590 ("drm/msm/dp: trigger unplug event in
msm_dp_display_disable")
