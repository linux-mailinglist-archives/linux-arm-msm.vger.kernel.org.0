Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA34628B22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 22:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235636AbiKNVLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 16:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236825AbiKNVLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 16:11:49 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D2DB56
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 13:11:47 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id e13so10185496edj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 13:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYM63RRvqlC+PbmanyesAjjHnH9NOqGbj+n/5jkMu0U=;
        b=f6dGIMl/KDjY03GU6eHJICav9uByHOVeuMW5WTXsr/PPVzAO2OVCrNu3ZCYaiWIXQC
         xddtEHYtvDDIjNVmfmQu7E8l8/gRZfKcaEjXgcRTZTgugEbXu+NbNtCF5jDwvbV1zA4B
         R8ogtQrLOKDOxW3o/ArmlL52u2IMNNZtB0amA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYM63RRvqlC+PbmanyesAjjHnH9NOqGbj+n/5jkMu0U=;
        b=XYmU2BXwoGC5hXs77u2bEKdVn2UoivYaMbbViVwnxXHyDqsNqhOOHcgq1mwdhoZmzh
         kMpMRMkfEjZvrN/V7N3uHVqMV6AKD2lZ1ICxtI7rli4929MDvNxmtYAqwjsaigQwxjVg
         7u39HvLkaHbnk3w2vq0n/tWysXLTVJb1Apx8r/0iZpyxktvBlHaFigSkjxpc6SQw3ui0
         QlRIb2YLrL54HKwcw/XT6nQo0pmQ8mPqc4/d2QDpujdCG69vHR3lXqwkxPE5ofrMkq1M
         EzH5aFApGkuhTD091gRTAzkw+aXM0nbl6YjISotWAxNQBaTomlqea0Xrlp3gyERowgEz
         xvPw==
X-Gm-Message-State: ANoB5pnjLeUrTexUVATQGQ9sJcCv1orYZbi6dypP6ZxRb5T91nzHOyKO
        O6fI5rR+42wxKIa8QkzLSUrmHuCZEDgki2Ws
X-Google-Smtp-Source: AA0mqf791XjUwTINGHr0Zl1I52wNg6Mqx1PQwhEgC1QSyE/57ZdcQY/ERlq2kwow5FSshACvALmbBw==
X-Received: by 2002:a05:6402:d64:b0:461:fe2b:3225 with SMTP id ec36-20020a0564020d6400b00461fe2b3225mr12876929edb.292.1668460305645;
        Mon, 14 Nov 2022 13:11:45 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id b16-20020a17090630d000b00795bb7d64d8sm4643182ejb.217.2022.11.14.13.11.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 13:11:44 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id o4so20566518wrq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 13:11:44 -0800 (PST)
X-Received: by 2002:a05:6000:1376:b0:236:7741:fa7b with SMTP id
 q22-20020a056000137600b002367741fa7bmr8968202wrz.138.1668460304144; Mon, 14
 Nov 2022 13:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20221114205055.1547497-1-robdclark@gmail.com>
In-Reply-To: <20221114205055.1547497-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Nov 2022 13:11:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbYYxP4kFBeGP3AGOwvbc8qNn746qpcZ8zVPc8re0o5Q@mail.gmail.com>
Message-ID: <CAD=FV=XbYYxP4kFBeGP3AGOwvbc8qNn746qpcZ8zVPc8re0o5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Chia-I Wu <olvaffe@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 14, 2022 at 12:50 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If we get an error (other than -ENOENT) we need to propagate that up the
> stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up
> end up claiming that we support all the OPPs which is not likely to be
> true (and on some generations impossible to be true, ie. if there are
> conflicting OPPs).
>
> v2: Update commit msg, gc unused label, etc
>
> Fixed: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7fe60c65a1eb..6ae77e88060f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1941,7 +1941,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>
>  static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>  {
> -       u32 supp_hw = UINT_MAX;
> +       u32 supp_hw;
>         u32 speedbin;
>         int ret;
>
> @@ -1953,15 +1953,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>         if (ret == -ENOENT) {
>                 return 0;
>         } else if (ret) {
> -               DRM_DEV_ERROR(dev,
> -                             "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
> -                             ret);
> -               goto done;
> +               dev_err_probe(dev, ret,
> +                             "failed to read speed-bin. Some OPPs may not be supported by hardware");
> +               return ret;

Both before and after this change, I think you're missing a "\n" at
the end of your error string?

If you want to get even fancier, dev_err_probe is designed to run
"braceless" and returns "ret" as its return value. This you could do:

if (ret == -ENOENT)
  return ret;
else if (ret)
  return dev_err_probe(dev, ret, ...)

After adding the "\n" then either with the extra fanciness or as you have it:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
