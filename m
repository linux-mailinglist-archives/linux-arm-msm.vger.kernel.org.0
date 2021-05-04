Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9632F37252D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 06:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhEDEnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 00:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhEDEnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 00:43:20 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D57C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 21:42:26 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id b5-20020a9d5d050000b02902a5883b0f4bso7184127oti.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 21:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=11Nzt21PGgG7EY1Zm8LPZ6J+bFs0Dr0fBy2u4R0XE/M=;
        b=eMDxI/J5JXLmmKxTyVqOM4RrALRwtyMIm7+ZVgBG5CshybG7FGuLkpX5f0siwUVD/Y
         HoFLI68bUSlqWKu34+h4BOf+B3SG6I0D93xctqrZUs8i1JCfWEqKvdEQ8AyQH2KDklLw
         8hkXj1MLvgoLX3BWvOfcXqJ54hj5dHndfr7ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=11Nzt21PGgG7EY1Zm8LPZ6J+bFs0Dr0fBy2u4R0XE/M=;
        b=p1A3Mp7nDlVtnw1trjYZ5AfLEe+5qbUrkpxdiOnMLiJfD36o/+kWv8EqnE81zDkwE5
         IPZ6H8GVKD+81eMPMSR6iQMJkEdzi1T/54IOTKbpsRKodnUpTGOuaXRZXeKiXux1auvO
         7xn9Ow33+6Lt+ju7Ku9wqFB7c1xgajtRin01Jr4Y4p9nhAbmr1J90TeIC7M5OnjnDV+s
         ODRgQGUfooRclINe3K75wnjHu5y2AMLXvhSvcm8Uypgs02cLViMpw/EBfPgdz/RVJtYw
         ohsZIfdpjw2uosOymXC4fqYfKfxPeFBDSiAGP+B0/T97b+r4zPd+MkGAM087joXj+CQN
         2W7Q==
X-Gm-Message-State: AOAM532jBHrIvr+x/xpAst/ZHmgCBv7lbVyyN1A+RaKhL7cmUOBttRCv
        ioHTg+zguc39m6tbqDxURl4rOPKUCFdMwPF0pyFkL/G9VyE=
X-Google-Smtp-Source: ABdhPJxCezCWHhNH1naSml5SlQdlnfQJrJxORDMFSaHhNEWOV1BLyNy+3WNmkZObBEETMxJdHv/XU00MVUB6ixxxRwc=
X-Received: by 2002:a9d:5e19:: with SMTP id d25mr17278425oti.308.1620103346067;
 Mon, 03 May 2021 21:42:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:42:25 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-4-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org> <1619048258-8717-4-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 3 May 2021 21:42:25 -0700
Message-ID: <CAE-0n50EW8evqt1NtbjEbSS71CzSAzXR21-FvCrTmvsaj+GGHQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/msm/dp: check main link status before start
 aux read
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

Quoting Kuogee Hsieh (2021-04-21 16:37:37)
> Maybe when the cable is disconnected the DP phy should be shutdown and
> some bit in the phy could effectively "cut off" the aux channel and then
> NAKs would start coming through here in the DP controller I/O register
> space. This patch have DP aux channel read/write to return NAK immediately
> if DP controller connection status is in unplugged state.
>
> Changes in V4:
> -- split this patch as stand alone patch
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 7c22bfe..fae3806 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>
>         mutex_lock(&aux->mutex);
>
> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> +               ret = -ETIMEDOUT;
> +               goto unlock_exit;
> +       }
> +
>         aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
>
>         /* Ignore address only message */

Can the code check for aux timeouts? So instead of blindly completing
'aux->comp' we would do the transfer, and then dp_aux_cmd_fifo_tx()
would check to see if the completion was completed from the irq
handler because of a timeout or a nack, etc. I think the code is
probably racy, given that dp_aux_isr() is called from irq context, and
aux_error_num is set from the irq context and tested in non-irq context.
This code needs a spinlock and then to check the isr bits to figure out
if it should tell the upper layers that the address was wrong, or there
was a nack or a timeout, etc.

I don't think we need to check the link to see if it is connected, just
look at the irq bits to see if the response was bad and letting higher
layers know that should quickly cut off the transactions.
