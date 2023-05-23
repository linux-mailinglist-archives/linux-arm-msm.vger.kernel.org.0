Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140A470E54F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjEWTXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 15:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbjEWTXe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 15:23:34 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BBB119
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 12:23:32 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so7620472276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 12:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684869812; x=1687461812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=73sPqfTcyZtojDKaauDzGux/K4lPFkochPRB3T3m4c4=;
        b=MXT5Wwc/r/cnG0/CzuMwe4xv9aci8F88e2rKxFLTGkYWKktW0bdDwChp7bUCzk++lP
         ggCeYEb32k4bsoEtzhINii8b8ZyhxpcqFEOi9G1NZzNXl2afTlZjqcIXOTcvc0GS3PLZ
         aPsa74up78M27jV/ousMs5AUlcKk1ERVaaimXsZCeydng9GYVnUskQ5yMbu+X5tMNfWk
         2YK+L2uDOP9LEFgumXBIYI855r0xAb1PUwgnPKATRKZi2pH2zdrUsCdUg7zS1PJNwVxZ
         TshwsnQUpE/LTAR4LFYxBiexENHOntw5LKu7oZ4NaGNcY5tVmDjQL1bH5h+ChVJdtcl3
         1Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684869812; x=1687461812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73sPqfTcyZtojDKaauDzGux/K4lPFkochPRB3T3m4c4=;
        b=Lh1PZ5RbIMULt+gce/F6NDzNz8EGBfW9yuxcvzR2P9C6++cpqUX6C71fLqEA/2+oS3
         SOEUaIeMJ7fArCoj6+78nvqbQRgrrqkH1g9hxamojgGQOtyNp1fkdFtZ0uYe+Udsg3Ai
         Ua8S+b5YJr1BGL8/dJmkBJPDUhg9u1vpZDDZjYrrT+uc0L+ELtsdscR6yPkXzZWjd/xI
         7sUxxymqnjNqIF7bHY6yOOfwe8E3Wv8241qqAFGxjurXUeFaVAFHiNJ5CArPIuF2Osqb
         gGR0KxHwcomUEHZ/IU5bt9pJXqb+C53+kzJPzbCgAcHvZrbsfGFHnYhYyGh7HNzj2nan
         bkdg==
X-Gm-Message-State: AC+VfDxB3ts/cXs8n8CdEZj0UQXDNcta5sdl5cG3qu27S34qtsi9R6KP
        sYmt5C7irOHKWTTUR35xNLe6YEq9vh2h6tYeugaT1g==
X-Google-Smtp-Source: ACHHUZ53NFcpER0X5ytxRDrWS9Je0b0e9mlg/Nh8HnDOBA1RvHbCTT3Vsi7IL3Bnv05mGvV9/LP+l+vZ/ddFRnwdoQI=
X-Received: by 2002:a81:48cc:0:b0:55a:416d:5202 with SMTP id
 v195-20020a8148cc000000b0055a416d5202mr15375329ywa.26.1684869812171; Tue, 23
 May 2023 12:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com> <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
 <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org> <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
 <249baf98-5264-b2cb-4213-5bcd00a670c9@quicinc.com>
In-Reply-To: <249baf98-5264-b2cb-4213-5bcd00a670c9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 23 May 2023 22:23:21 +0300
Message-ID: <CAA8EJpp4m85ubkfs7erLVxydHi_S7Xp7neNjh22z=tMnvrWsQA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
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

On Tue, 23 May 2023 at 22:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/23/2023 7:36 AM, Dmitry Baryshkov wrote:
> > On 23/05/2023 10:31, Neil Armstrong wrote:
> >> On 23/05/2023 09:20, Dmitry Baryshkov wrote:
> >>> On Tue, 23 May 2023 at 04:58, Abhinav Kumar
> >>> <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
> >>>>> Rework dpu_encoder initialization code, simplifying calling sequences
> >>>>> and separating common init parts.
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Withdrawn two pathes for a later consideration
> >>>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
> >>>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
> >>>>>     dpu_encoder_phys_wb_init()
> >>>>>
> >>>>
> >>>> I had previously given these comments on the cover letter of v1, so
> >>>> giving it again.
> >>>>
> >>>> Please mention that your series was made on top of
> >>>> https://patchwork.freedesktop.org/series/116530/.
> >>>>
> >>>> Figured it out when I tried to apply it to my branch to test.
> >>>>
> >>>> I had tested v1, and between v1 and v2 i only see very trivial change,
> >>>> so i think its okay to retain:
> >>>>
> >>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
> >>>
> >>> Unfortunately patchwork ignores tags sent in the cover letter thread.
> >>
> >> But b4 does with -t option to b4 shazam or b4 am
> >
> > Yes. But b4 doesn't append Patchwork headers.
> >
>
> If thats the case, either the author can add them to the patches
> manually like we do sometimes for R-b tags OR I will go ahead and add it
> one by one for every patch now.

I'd prefer either to have a single T-B on the latest patch on the
series, or a pile of replies with T-B tags. Thank you (for the testing
and for providing the feedback).
If we ever switch from git-pw to b4, this requirement will be lifted.

>
> Let me know what you prefer.
>
> >>
> >> Neil
> >>
> >>>
> >>>>
> >>>>> Dmitry Baryshkov (7):
> >>>>>     drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
> >>>>>     drm/msm/dpu: separate common function to init physical encoder
> >>>>>     drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
> >>>>>     drm/msm/dpu: inline dpu_encoder_get_wb()
> >>>>>     drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
> >>>>>     drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
> >>>>>     drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
> >>>>>
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178
> >>>>> ++++++++----------
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
> >>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
> >>>>>    7 files changed, 140 insertions(+), 243 deletions(-)
> >>>>>
> >>>
> >>>
> >>>
> >>
> >



-- 
With best wishes
Dmitry
