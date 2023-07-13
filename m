Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD47752B1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 21:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbjGMTk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 15:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbjGMTk1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 15:40:27 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A123269D
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:40:26 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b5d6a05b6dso868746a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689277225; x=1689882025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DX1Gj8EBXXoZzKq8yFIL6/gLwQcq/eP050VPNOLcr5k=;
        b=d+3IoseYtGQOjFRFOIFKJ45KID+DSbVNElMv9SN/sZUvkets/C0mMbJPNt2jEV+nqt
         8OSNRc8l1e30bLkl764W0+juLXJbCATuVKHzTRi5rEHQJGXBD0rPWCu9UCyWH5pC3dbP
         OH/0pO/+PJQzdX5aKdLJE7EovJ6J9GR5Kb2WfYPfWJkL+E6pKAwC8GTo2NiWw7mtdB4T
         feQuRxNNlhSpsHd2I66mlyU/xVgiwYE2bj/0MNxIycMqJG0M5kusYNwJgMihPICVbYBG
         924Oghoi3zDnaYR51nBWkfyMBk5YbwOkSPXYXYERRaHUA2wje7cR7NBnXP/DvVP+g53N
         62mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689277225; x=1689882025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DX1Gj8EBXXoZzKq8yFIL6/gLwQcq/eP050VPNOLcr5k=;
        b=eK+0UBnI55oZOB9Olr7ghUGXdXgkD4cKISrAGag7Ok5JOUHH+ImzohL/4Jks4JFozs
         qTvzpLocUVRmJV1LbVS2q2ijiLzzea1F4bIONmnf40UkBx18vKUCWu1TCgieQY0KJC8o
         y8ddSbidCyqFC0PYnaCItuEdMYrKprY0v9hWDbTOoZ/JLoF+1EDyTxArajmixlQVVhwJ
         qO8sGeBTHZA52UA7O57Q/mwq7q9EeCtmg6at62pzDFRyGMZcv6FNkEJRHDRQCBibg376
         udzhklslOKumoDOcGPeJcw0xOZnxglFG+hfcedJ93iribtnzZLd567gkeHt1q+B1lA+n
         fXjg==
X-Gm-Message-State: ABy/qLacdm0UtYy9/nbSiX3hauYIxofx5CfaEy7EqfN511rii80UhXhR
        upUHfQ29YODz9dt6GV4CLAdVLnwIWmQS0PsA8rgqTjyLLU8EzsWx
X-Google-Smtp-Source: APBJJlE4geAWgF/c1eSajBp9xhwr1InENP1uaHmvwsBe5xFcZ1TuvNARD6AuNScP0D+MkTip7O/mXlKTUD7UcVFFl1k=
X-Received: by 2002:a9d:6a50:0:b0:6b9:9288:613c with SMTP id
 h16-20020a9d6a50000000b006b99288613cmr3086600otn.13.1689277225502; Thu, 13
 Jul 2023 12:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-3-cuigaosheng1@huawei.com> <gk5ttqzmz6psggq6xybpsmad63gimlwj6bsbpkhvqfd3htcddc@zveituq6siwa>
In-Reply-To: <gk5ttqzmz6psggq6xybpsmad63gimlwj6bsbpkhvqfd3htcddc@zveituq6siwa>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 Jul 2023 22:40:14 +0300
Message-ID: <CAA8EJpou=nm54hETj3m3c75Vq9nhTdCKVviXi4C3-PGv7J8s6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm: Fix IS_ERR() vs NULL check in a5xx_submit_in_rb()
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        g@akhilpo-linux.qualcomm.com, liviu.dudau@arm.com,
        airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, neil.armstrong@linaro.org,
        sam@ravnborg.org, quic_eberman@quicinc.com, a39.skl@gmail.com,
        quic_gurus@quicinc.com, angelogioacchino.delregno@somainline.org,
        james.qian.wang@arm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jul 2023 at 22:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Thu, Jul 13, 2023 at 10:05:55AM +0800, Gaosheng Cui wrote:
> >
> > The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> > use IS_ERR() to check the return value.
> >
> > Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index a99310b68793..a499e3b350fc 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
> >                        * since we've already mapped it once in
> >                        * submit_reloc()
> >                        */
> > -                     if (WARN_ON(!ptr))
> > +                     if (WARN_ON(IS_ERR(ptr)))
> nit: can we make this IS_ERR_OR_NULL() check to retain the current
> validation? A null is catastrophic here. Yeah, I see that the current
> implementation of ...get_vaddr() doesn't return a NULL.

I generally dislike IS_ERR_OR_NULL, as it is always (incorrectly)
paired with PTR_ERR. But in the case of void return it would be a
perfect fit.

>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>
> -Akhil
>
> >                               return;
> >
> >                       for (i = 0; i < dwords; i++) {
> > --
> > 2.25.1
> >



-- 
With best wishes
Dmitry
