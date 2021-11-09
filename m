Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DCC44B3DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 21:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244245AbhKIUYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 15:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244236AbhKIUYV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 15:24:21 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3A4C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 12:21:35 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id bk22so317417qkb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 12:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=koMbe5cQdoL2M8hKeOCX2QG0+PW4fTs1S2rI3yitKSg=;
        b=SkkdRpJnHAc1qzpwx2VCb0Qh3XyD5q9N5PtJZX9ApO42i/mTDOEgJMo3iJfr1Xbtv5
         465aoxNQxAzlbccacMD2ryImwfYujP/zS0X05LGtUZ6opNcS6aHCdk4EgsDYpEuhgxrv
         397+siHcO3UvqrYpVBOxyBO9v1CLfWf18aZM7xivy4QioWIjiEmoj6aG+KV5oG1aDSo5
         /SsQ9eg6RWg2Bva4/ivsB937S3r8/PuIeAgTS8G+yqrwtR5MWoh/+w5es0xL/8o3Og7+
         /X1ADPUuYptCRWj0wJh4reGGcgot7Ftr/MGmmVBC0acZap6omdtVtowjx/mqu6BRosTZ
         5EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=koMbe5cQdoL2M8hKeOCX2QG0+PW4fTs1S2rI3yitKSg=;
        b=SrMluh/8kF0TByuH5HjpJyQhzC0hBXOtjeqVJXgMyJDdwJ3+2/X6hUsHOu6gAniNkt
         SCZshJlboZmZ6fwbn4cjHEsoLM0xdyrt0ujCWG7ywHGV8SUN7oNIO+sjRZFPKrY94sgl
         HeeKjevPMiFHtpXWL5mZC+C+lWR7DOzE5qNTpKD5++m/RhrrlJgD4n2OAnDWiyoE5tXS
         pg6mba/s+UOhyzjz7nd83oR1P1b3wX7on76IsqWFGQ19fW2HEnrXj7Yh6IFRHqy83JBW
         r3hwjSyC6cEKdgL1fE6gLWQ2iFFjMzU6ex32huW2PbiiqMi8LKKTUMmeiQ8gJkPax4m/
         ELjQ==
X-Gm-Message-State: AOAM532+vZnors2dL5sRiUXqnkW1bWJVl6zv/fUS05pRk7LWw2hJVrOr
        h14sFtrPLSiOMNlHLkre1AA18V076NqfM1tErtsFvg==
X-Google-Smtp-Source: ABdhPJxkEYFDHFdvCi0LFtrUlgQyV5/BYKVCtZlrc+EZt+YNcBcc9bsqXLFA6YLOsvEP4AmllcJybt8MqYFUkydLM28=
X-Received: by 2002:a05:620a:3197:: with SMTP id bi23mr8132296qkb.478.1636489294644;
 Tue, 09 Nov 2021 12:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-17-dmitry.baryshkov@linaro.org> <3a48e580272ceb9d5d499455d8f35630@codeaurora.org>
In-Reply-To: <3a48e580272ceb9d5d499455d8f35630@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 Nov 2021 23:21:23 +0300
Message-ID: <CAA8EJpoKiu32oqGLpus-W8Z1ifKKVyAyOOp9kPF6NnxRLS6+fw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 16/22] drm/msm/dpu: do not limit the zpos property
To:     abhinavk@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Nov 2021 at 23:15, <abhinavk@codeaurora.org> wrote:
>
> On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> > Stop limiting zpos property values, we use normalized_zpos anyway. And
> > nothing stops userspace from assigning several planes to a single zpos
> > (it is a userspace bug, but the kernel is forgiving about it).
>
> Userspace assigning several planes to a single zpos was intended to
> identify
> cases where src split can be used. Downstream does not use normalized
> zpos,
> hence it did not come across as a bug but mostly as a way to identify
> when
> usermode needs src split to be enabled based on the composition
> strategy.
>
> We can talk about that more in the rest of the patches of this series.
>
> For this one, I only have a couple of questions:
>
> 1) Across different vendors, some have gone with limiting the zpos and
> some have gone with
> the max, so is there an issue with sticking with the max_blend_stages
> limit?
>
> 2) If there is no hard reason to make this change, I think its better to
> keep it the way it is.

Short answer to both questions: we want to have more planes than the
max_blend_stages. So we should remove the limit.

Consider this to be a unification with MDP5, which uses 255 here.

>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 8ed7b8f0db69..3850f2714bf3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -44,7 +44,6 @@
> >  #define DPU_NAME_SIZE  12
> >
> >  #define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
> > -#define DPU_ZPOS_MAX 255
> >
> >  /* multirect rect index */
> >  enum {
> > @@ -1374,7 +1373,6 @@ struct drm_plane *dpu_plane_init(struct
> > drm_device *dev,
> >       struct dpu_plane *pdpu;
> >       struct msm_drm_private *priv = dev->dev_private;
> >       struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > -     int zpos_max = DPU_ZPOS_MAX;
> >       uint32_t num_formats;
> >       int ret = -EINVAL;
> >
> > @@ -1412,14 +1410,7 @@ struct drm_plane *dpu_plane_init(struct
> > drm_device *dev,
> >
> >       pdpu->catalog = kms->catalog;
> >
> > -     if (kms->catalog->mixer_count &&
> > -             kms->catalog->mixer[0].sblk->maxblendstages) {
> > -             zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
> > -             if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
> > -                     zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
> > -     }
> > -
> > -     ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
> > +     ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
> >       if (ret)
> >               DPU_ERROR("failed to install zpos property, rc = %d\n", ret);



-- 
With best wishes
Dmitry
