Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE4C47B64A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 00:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhLTXxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 18:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhLTXxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 18:53:17 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AF7C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 15:53:17 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id l25so10982662qkl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 15:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NcXgqI6cxpe0e91iQv5hDRD0JOXrVC93a0bIwF8hPSM=;
        b=Ws1YkYkUr9UQiyjkjzcDfhUOL2xPU099pRZc/DVWPUqgSkTISCxkmbTnZUDKAzLfWA
         rXurwah7hW92RHgf4AfGporMV6jEGkWvykl1RhJbiY6Z31s88Vn+zEc35OMnbIZYeSP4
         CepC8EGG3Wii+57keP6eq1lsupwPUR+cgohunTTfdwPD7cZEJd2p0zmSqtyvcRd+Rpae
         +WIcvTi7P1Ey8W9eCBHQCRtVsuIwp70EIDu8b0sTFvy1ELF5TKrMhG3WZSojc0zMFxzX
         x54Z6g9bakthG8guJwl5gMXlk17VPKWIXt+cBnzITS6vFSkkMqmhoLdoJ5CfEU0dYCJS
         xChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NcXgqI6cxpe0e91iQv5hDRD0JOXrVC93a0bIwF8hPSM=;
        b=cNw8g7THuUa0d8eNyEvW5HS4k/GgxvnQAmd+R8i+EdnhviyqnsM1y/CmWa75D0nvXL
         quEnUjmDbj8q+69s/G+MR4d/06tEQXBOL4Kze0NLZiiFdnSBOHBekhOv6kZ27kfZymF6
         NTmWO2tSjlfRucDBuS6pEmUMzNz7zSn21RltWXQxMMbUpOYMO83Kby0aeRkO5QDhRUBq
         wlS7eU3WBJwAP4gAzbyMjtwhf3CUSoKQ0TU2iJ1JZoqcSTc/0N6fysQnlU6Qg8Ko/Rqs
         sBnhcuSh6wgRKbELciasBlO41YtH8mCFRG1olPH4KjrvIkbjMeM79V/GVfWO24JYo3Pw
         NTEQ==
X-Gm-Message-State: AOAM531CCOvbkRYqESh7Nd6RCbhFg29nGr0J9HDYQMKZcdnwURhGoxtk
        IPjPVlZ5sZH9HzD0KpjZCT2hrGVKcYFsHE0kHjrFSg==
X-Google-Smtp-Source: ABdhPJzFnDz2W0GHUrVIingh+4j+ON9BLU7ywtLTtBYgCoWWu0JGYwbykopD9mXXSuORzJrQ8/OZ1svpmcADUPTh3JU=
X-Received: by 2002:a05:620a:13ea:: with SMTP id h10mr476112qkl.30.1640044396450;
 Mon, 20 Dec 2021 15:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Dec 2021 02:53:05 +0300
Message-ID: <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Only create debugfs for PRIMARY minor
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Dec 2021 at 03:19, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> of the files created are unrelated to the minor, so there's no reason to
> present them per minor.
> The exception to this is the DisplayPort code, which ends up invoking
> dp_debug_get() for each minor, each time associate the allocated object
> with dp->debug.
>
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
>
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create debugfs files for the PRIMARY
> minor.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Moved the check up from msm_dp_debugfs_init() to dpu_kms_debugfs_init()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2ee70072a1b4..a54f7d373f14 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -193,6 +193,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>         if (!p)
>                 return -EINVAL;
>
> +       /* Only create one set of debugfs per DP instance */

The comment is misleading. Could you please fix it?

> +       if (minor->type != DRM_MINOR_PRIMARY)
> +               return 0;
> +
>         dev = dpu_kms->dev;
>         priv = dev->dev_private;
>
> --
> 2.33.1
>


-- 
With best wishes
Dmitry
