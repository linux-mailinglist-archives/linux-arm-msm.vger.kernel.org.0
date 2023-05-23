Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3945670D4CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 09:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbjEWHVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 03:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbjEWHUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 03:20:37 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64DA10DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:20:12 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-56190515833so67098537b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684826412; x=1687418412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ms2Z+39mDMVo35dL1mx9T/boJmFobIlJgfkKwKncnys=;
        b=DS1T6leVnIRLikXL4zCbd0GhmmcuSC4fDJJ0eZBApkEzBPC+fMOUS/WE5w9+UZj6JW
         +qjbSE9CDqdfhUMwIBrvrwzEOUOkYYUrwJ+jyummdkBBiGuFUgNK7hDY/QXa9H+vTX79
         XYxfHoC668JBQvb7RXu9kc342ihnygBj1bHI4CMGU2GgqoAd1sDTWZ+05aU/92mtMfpK
         /AVpXziqW+bKvZ8dT0+ahO1uBdmadXYqSp0hrLemJJBnFuQ+B5XLWjZKVm11roeFeEjy
         YiPGMulbh+pgsTaBuzJqBQ3a/r2X1yLqxJ84ENvk+xDntYbiJKEw6WZl/JoU3zBII5dQ
         gZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684826412; x=1687418412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms2Z+39mDMVo35dL1mx9T/boJmFobIlJgfkKwKncnys=;
        b=UEiBhbURoEAUlRhN7h1xYl3VTrmWaeD9UJUJEiLtPX6AsR0//cRHtP+nhlmjOfdj9z
         iQJOolEHOD9js7ADSldO//vcVkwFBCR1ynxunbtGNzKjVN4gbocK5pW060ixv6sAu5Yi
         iTTij62s1H9M88yGxUt9YNHpCuREtwD2dCnfDziPiCE7EqASRc7/8vxl8YhPxYNLg2Zr
         TzdM2uIVcyzq09rXP49dMXl1EcMJWtVx58TeWQFQQU85V06P0MFqJhXTQNYQT1Bnu0hG
         U9o7eUU0MyFgpzFPQfINWPfcMBTMe5SRMWgr188Va4yoHHW/2vT6F9bhnMxogw6s5wB5
         /lKg==
X-Gm-Message-State: AC+VfDxN8TL+Nq5ADua5Tc6MvaQIXYmhrkyKPvOpJ4mq3r3u9cnGQNiR
        2BGc3fk40I3A65EXGMtb+rlK6I2DuxxwdEQMojGyjmycGO5JYo8e
X-Google-Smtp-Source: ACHHUZ4dVDuvZbgczwrU9xuM2MLuDG609rhoPRz3LEihgVs/v2KsXLh237BeTMSa0tknVxyLC8UQ4A0t8g58et1DB1U=
X-Received: by 2002:a81:788f:0:b0:55d:9f32:f6c with SMTP id
 t137-20020a81788f000000b0055d9f320f6cmr13731962ywc.15.1684826411847; Tue, 23
 May 2023 00:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org> <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
In-Reply-To: <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 23 May 2023 10:20:00 +0300
Message-ID: <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 May 2023 at 04:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
> > Rework dpu_encoder initialization code, simplifying calling sequences
> > and separating common init parts.
> >
> > Changes since v1:
> > - Withdrawn two pathes for a later consideration
> > - Changed dpu_encoder_phys_init() to return void (Abhinav)
> > - Added small simplifications of dpu_encoder_phys_cmd_init() and
> >    dpu_encoder_phys_wb_init()
> >
>
> I had previously given these comments on the cover letter of v1, so
> giving it again.
>
> Please mention that your series was made on top of
> https://patchwork.freedesktop.org/series/116530/.
>
> Figured it out when I tried to apply it to my branch to test.
>
> I had tested v1, and between v1 and v2 i only see very trivial change,
> so i think its okay to retain:
>
> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

Unfortunately patchwork ignores tags sent in the cover letter thread.

>
> > Dmitry Baryshkov (7):
> >    drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
> >    drm/msm/dpu: separate common function to init physical encoder
> >    drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
> >    drm/msm/dpu: inline dpu_encoder_get_wb()
> >    drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
> >    drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
> >    drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
> >
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
> >   7 files changed, 140 insertions(+), 243 deletions(-)
> >



-- 
With best wishes
Dmitry
