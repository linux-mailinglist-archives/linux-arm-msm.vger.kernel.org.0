Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6825FB7CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 17:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJKP4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 11:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiJKP4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 11:56:46 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE3E30549
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 08:56:45 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id x20so5166808ual.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wH1Bl8itt96KxBsAlutBeKuPO2AccjwjUzu7pu+C0go=;
        b=cHQS7SWHH1gASscavrPWCc246E7BVCVrvaxgOLz953W9ZYcFihTNZv8KTxGIoPE6VO
         oxondL9qq+lJt4+IbHPqqpuaTIVC17a3n1VJ1GNQMzW5Pm1mS57FLx+5CAdHEkcfl7wu
         Wwm66Rp6rTnBPjtVSfACGBqcakSKTvYQ47tmUJBN0sqjUjgLWyAS3SJ/fPNfhEGngrt2
         0ZoJeZbPXX2MoCGE4SpvxUHGHv/Ovju656QRtnZJsqWpbYmlQ7pygRvr4N6pOUPceDQl
         dwHTSyp+zflFhfPwKszINz4PuTsGqtK2Jefl0RHElZbs7PwM+DjGcWnKFSSCX9OIqkfU
         4q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wH1Bl8itt96KxBsAlutBeKuPO2AccjwjUzu7pu+C0go=;
        b=HrB0eTWzymVZNkvhCSJ4l4oERvSKU63tM7D//QUipUii3NJwWyBZJ7mO5XkjcfAf1F
         XU/AOMdJeFoSEoFiwkuyy3faHuq/3HslU3GP0p6MGkuLo6CFOU9pHA8X3mWGuEXHEJ7E
         8yHiWpzCQIWA8vbJb5BoOofa+FyKPO8MqSceGL60BOrtx2dlswSX6lklFnh27kApWhJb
         REPfhSL835ktPRneXuVzFQTrWr9ysHuS/zZXDLfuiwQrLCw/+ADdn+SwGkXYwVv+KOlR
         MDQHTQgwYNtx7x6K8fYgZuY4/+Jsw6a6DhOK8BVjJTFzV8ddVlsEW2Zst/picNyy8ndc
         R5YA==
X-Gm-Message-State: ACrzQf0F5qNGK8ZRIBsi9SwbHlfbyncsepiWrA/385uKTFcia7xjcVEI
        0hQgk3fgYRgN1nTY2r7KM7btWLxs/XX3l2X93d3joQ==
X-Google-Smtp-Source: AMsMyM7hO86TNlZ7RU1O5BbKxgzcrBU9iEjAHsEU8uEo45EdTTocB+iB/ZslSLRzKUzF+PENEMSkZ/nzKg+/gEiZ/rg=
X-Received: by 2002:ab0:7a5b:0:b0:3b3:8eb9:5a25 with SMTP id
 a27-20020ab07a5b000000b003b38eb95a25mr11832841uat.55.1665503804335; Tue, 11
 Oct 2022 08:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221011075519.3111928-1-shraash@google.com>
In-Reply-To: <20221011075519.3111928-1-shraash@google.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 11 Oct 2022 08:56:33 -0700
Message-ID: <CABXOdTdum0q=2Fy3yM3OnGmHM9ZkNyEURx6C08879ND7ye=vxg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove redundant check for 'submit'
To:     Aashish Sharma <shraash@google.com>
Cc:     Guenter Roeck <groeck@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 11, 2022 at 12:55 AM Aashish Sharma <shraash@google.com> wrote:
>
> Rectify the below smatch warning:
> drivers/gpu/drm/msm/msm_gem_submit.c:963 msm_ioctl_gem_submit() warn:
> variable dereferenced before check 'submit'
>
> 'submit' is normally error pointer or valid, so remove its NULL
> initializer as it's confusing and also remove a redundant check for it's
> value.
>
> Signed-off-by: Aashish Sharma <shraash@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5599d93ec0d2..74fe1c56cd65 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -706,7 +706,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         struct msm_drm_private *priv = dev->dev_private;
>         struct drm_msm_gem_submit *args = data;
>         struct msm_file_private *ctx = file->driver_priv;
> -       struct msm_gem_submit *submit = NULL;
> +       struct msm_gem_submit *submit;
>         struct msm_gpu *gpu = priv->gpu;
>         struct msm_gpu_submitqueue *queue;
>         struct msm_ringbuffer *ring;
> @@ -946,8 +946,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 put_unused_fd(out_fence_fd);
>         mutex_unlock(&queue->lock);
>  out_post_unlock:
> -       if (submit)
> -               msm_gem_submit_put(submit);
> +       msm_gem_submit_put(submit);
>         if (!IS_ERR_OR_NULL(post_deps)) {
>                 for (i = 0; i < args->nr_out_syncobjs; ++i) {
>                         kfree(post_deps[i].chain);
> --
> 2.38.0.rc2.412.g84df46c1b4-goog
>
