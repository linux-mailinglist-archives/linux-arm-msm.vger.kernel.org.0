Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B860E6D2345
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 16:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjCaO60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 10:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbjCaO6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 10:58:25 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370FC2121
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:58:24 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id p204so27687969ybc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680274703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+9vywVkizA1/BL+IoFGg5oSdyRUHG9JaCTPgm6cyxaI=;
        b=RiEUbASd4Nv2bK5U0NfdCxz+zGU9jvca9t9L9dX8WOCA+TKl2+UavAzbHhwokVPtii
         Ns/nmgxsMfcFREXylGBnoQNH6yVWzO9I2/Lr3fBUhDBuQ1B02+IPW9wI7Go+UeQ767GJ
         EhsoUgCVLsyu3PM+cZRxuOjp9fXxG+208DkvZObKFf5+Y4mixJ7fwrqXVbbPt7cvcmzD
         GgRTzUc4OrI0bZSmug8TxFMTjUjrbMYcNWhYjrwVdDTxEPvyavmLqideHlzGIoFLPTw+
         WE795LitI1h0crKga2+zmrGOIs39+D7z1ih/3NIVqwwwnnbEjuSYrYJrTMzC7ozAKF+L
         5z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9vywVkizA1/BL+IoFGg5oSdyRUHG9JaCTPgm6cyxaI=;
        b=281mAh8WlsLT/hRBNObUWm6DVpEeFFKuouDn7zDhdL6Izaq1eNPK70+rBXJvsWiOc1
         5f6xwdtB16WdBb03iPjgryQJC+ACHmwx8ps1Jj1qbKg7sUtA8E4d+tPCqULG7Rj5G/Qx
         BHr1rWfrq+D8+hY1j0xvoYjFXs8emcLZI7n+FoG40SmZam1IoevJ1pA8InVP2oQrvj68
         PidITL8a+Tkm1rSGv1NkI/5sizJQhlVct0IBifklJODDPfUj4oY9OYUb7EnxaW4vMM1Z
         DOo7JWcVOr5zUlGUwK9dFGJ5JEO0A6qB9uNHqMln0LD64M/x6wtM+xUPD0JfZxdw+eFf
         02ew==
X-Gm-Message-State: AAQBX9e3xKTNzIdBQoCXiWiDg5+/YXPMcyW+obsv/nC7NUaJxUWcySNK
        g190qVZQVASEbT9A1zTDg+2uOlUMON6Wm0HRiFrHxw==
X-Google-Smtp-Source: AKy350asvDklS51ndeBMVx+J7/M6JaGcY9r/+cXahsDugorB/yziYIP20bAOPlDlUaFmd1YvBHiWeGw991/U9/QIB18=
X-Received: by 2002:a25:d747:0:b0:b82:410e:daae with SMTP id
 o68-20020a25d747000000b00b82410edaaemr211714ybg.9.1680274703429; Fri, 31 Mar
 2023 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com> <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 31 Mar 2023 17:58:12 +0300
Message-ID: <CAA8EJppc3LDQy2RgVZbWki4Y-_FOTK67Y8RfK5Bm9gqdfqMjqQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> In certain CPU stress conditions, there can be a delay in scheduling commit
> work and it was observed that PSR commit from a different work queue was
> scheduled. Avoid these commits as display is already in PSR mode.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 645fe53..f8141bb 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                         new_crtc_state->mode_changed = true;
>                         state->allow_modeset = true;
>                 }
> +
> +               if (old_crtc_state->self_refresh_active && new_crtc_state->self_refresh_active)
> +                       return -EINVAL;

EINVAL here means that atomic_check will fail if both old and new
states are in SR mode. For example, there might be a mode set for
another CRTC (while keeping this one in SR mode). I don't think this
is correct. We should skip/shortcut the commit, that's true. But I
doubt that returning an error here is a proper way to do this. Please
correct me if I'm wrong.

>         }
>
>         return drm_atomic_helper_check(dev, state);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
