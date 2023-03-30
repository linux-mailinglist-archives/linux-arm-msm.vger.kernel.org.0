Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97CD26D0084
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 12:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjC3KCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 06:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbjC3KCT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 06:02:19 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B038A54
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 03:02:00 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5445009c26bso344507227b3.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680170519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8iTlDRktk7xPf3zd3cdhXI99KacYIZjktSgd38eWGh4=;
        b=VBUDvaY+gQMis+XrqLFcoRH9kL39smZkNiSqzBsf6noF9V3KOhTIHKgXpbkSBuk6e/
         Exemc3VKrlJFmzUriNDOL+l4iNhEPk92A5pJDPNJoPC6QtDrBua09JY6BN6WyrD3hl3Y
         cYVlJZd04rFvdBe5lCttihIXzt/il9BFiwl2Qcw804KmZGfwqtOSR0ox3PAtfph+7Q36
         FsVGVuJUEQ/weeOvJlbfd+rYLz0GzAL/zb/ysE8sThC99ioc4oBmHMB1yvl8bUFhEbv4
         JOqywAsh4E+UFMi65bJK9JXFuFOZHypMdSi48ruY6IV5TN3h29TC2v2G5hAc23oufQg8
         xXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iTlDRktk7xPf3zd3cdhXI99KacYIZjktSgd38eWGh4=;
        b=MzoNjJUUM72FJwOBdFS/lbFX9qNNtrBq8d3/m0NucxAgxwVVC8+aFJ+aN8Ib+Vowv0
         FdBN96P9YSoowhkVfeG5xPX3sk0f3IH5GSO/wa0izp4xBHW/dCXpyMvlLNgcqQqQEXtV
         LhvToqRU/mq9S2No8tzxQUBPbbieYnoHHOfNjNb6VYDi1N7glOtoARxQRF6zg37hhDRq
         7P+dyNBaljjxtct18mh58yu47jBGmD4eoGFULVUxeAGL9+fHfZAvV4YpSWIl9WbStoCy
         ij762g0BR9hBbC+nn7oOx3zg/mNURa1wKsOz2CEw21oBDO0c8XCTfYLA2T4c+balKC0B
         uAGg==
X-Gm-Message-State: AAQBX9drL0e3GbkdFkWsdU5287YvGpD1gzHTZPxCt2W/RDm64mYPqHOA
        e4WmEAdy+SFONqyXq9iVqBFjgCx8JggWPmuXk9fd2g==
X-Google-Smtp-Source: AKy350YsrGQ5f85kNh7qDhc8gU+uPe2w56kbUSbAgFRAHEIfvV4RYH3ZsM8gUtI2flmvhIgLAG6NcUHhA8RaF92lwu4=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr7079275ywk.5.1680170519380; Thu, 30 Mar
 2023 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de> <20230330074150.7637-5-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-5-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 13:01:48 +0300
Message-ID: <CAA8EJpqpsoDDE2RvPHmQM=YDFFxHPW2YENNZzL8We78aQo_NPA@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm: Remove fbdev from struct msm_drm_private
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The DRM device stores a pointer to the fbdev helper. Remove struct
> msm_drm_private.fbdev, which contains the same value. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c | 5 ++---
>  drivers/gpu/drm/msm/msm_drv.c     | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.h     | 2 --
>  drivers/gpu/drm/msm/msm_fbdev.c   | 8 ++------
>  4 files changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
