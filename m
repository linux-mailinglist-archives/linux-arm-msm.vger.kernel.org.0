Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D0947617F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbhLOTS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239096AbhLOTSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:18:25 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C957C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:18:25 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id d21so13772596qkl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lupv2Y8caxWSPo/yUIpJfaEyopRdwsl8zpftq2TZo8c=;
        b=JeUquh9xs0mAhV646mX1fPpTfEWDBFm4VpV2DzQrI7hCt0URfzBNzPsqmp+Xcqga0n
         +MLIN75Prpx1MOT0sRYpZ1ckgt2UIU9Uly3dvMbUd+LgfWr+nu6ndecT3/1r9wmeg8p8
         sVaeU9BJcpoaRYpkyKjQcsfqQfakqh3Le8i/34X9IKrCmTEqU88aNYXxQcQAROakjvV0
         2pue5P3G7sATp3CiU51ut2qCjCvKB0u2H0um0qcQ26PDbW5o8hr55KWust5VfocLUuLJ
         x1sSIItAq9vS/jenmboVqsQ64XvKvwW4MvWXZxtLxKI7owqbjC6RuCuDWYNAMHinWcvI
         HPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lupv2Y8caxWSPo/yUIpJfaEyopRdwsl8zpftq2TZo8c=;
        b=mP7/4dZ8K2PkE+A+GS6suPrwOVkJoDUqnoEGjLiuFSJCSviXc+JN8SRQMAWsMapCvb
         E7/eZ02v9ulgTk3ekpXWBhurWgCTS2lnBCNJgqLavdqdiwVBBvePVoSACsQrc89T/uMQ
         8cBEqrnQELjziB6JA5Ovkupci+gxPNN5/5jU/Uwqah64PN9DcZj94a94ipUrybcu+DLy
         064pBLk+9QtMbR14Rloe0ubqo5fB++tDQGDiz9yUC9jgN6mDzZrwS5QTA2gE18ESaCI8
         kvHLHhQhyWlWFuupooF2OytRmV1fVfVktCDKLqEsub2xKx+Cskvn9Twowoy5tISxrWW+
         hy6g==
X-Gm-Message-State: AOAM532Yd3/0oFBHRiC/e/3OzwxSyEydKjNawS37iIaZ+XfT6LRIa6Cr
        GrNiP6GdL6CC2LFOeTSCIl8nHm9gwbPO39z0xibTOg==
X-Google-Smtp-Source: ABdhPJzmCzYw51IcVPfPmlbc4eeB5qwnEMYGJDj12g7Z7Wts0i2C3Tw6O2uiNZd87jJ7F7AWfQ2H8EeM1UL3meIYKTU=
X-Received: by 2002:a05:620a:13ea:: with SMTP id h10mr9971617qkl.30.1639595904803;
 Wed, 15 Dec 2021 11:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com> <20211215174524.1742389-3-robdclark@gmail.com>
In-Reply-To: <20211215174524.1742389-3-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Dec 2021 22:18:14 +0300
Message-ID: <CAA8EJpruB5kiynfJU93RzrmEiEZLYUyw+qEJoNgfcu4HK+7xFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/disp: Export helper for capturing snapshot
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We'll re-use this for debugfs.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 28 +++++++++++++++-----
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h | 10 +++++++
>  2 files changed, 31 insertions(+), 7 deletions(-)
>


-- 
With best wishes
Dmitry
