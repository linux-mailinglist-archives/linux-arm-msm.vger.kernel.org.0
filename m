Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749DD7DC803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Oct 2023 09:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbjJaIRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Oct 2023 04:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbjJaIRG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Oct 2023 04:17:06 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD272BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 01:17:03 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d81d09d883dso4698045276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698740223; x=1699345023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Smwqa/VxxxvV+NAJpecN+RuY1E+JDILev1nYuilsBMI=;
        b=KDTKAyrKdarIR50y89fJ4ABPh8Gz5pgcNqBlUTR+77+O41HtM8GDj7ycBaElP5RnLi
         sh0ZXrRXUTiDcFfjMDLf6bDj1fWv32Xez629u4x0zTI9nfYETdDpHPxHe1JJYkZi1Fcb
         YX+9Yo95LWQO1b8QNO8ytfPq1p+flmr7tudAaOG06vSXneDK9uRVT7eDJwJ4i46VhKU/
         /6p84Gg4C6uep0MtZ/StuEoNS96InvQQJoFSuI+meF9VXDwMWPkBijiCbphjHyU3Dsd3
         jafMhWdw1kWJno84/qcYTKy/9fDse+3uczBTjH120EprvTRh4Qo5BNC0IcaSISNDxPEp
         qB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698740223; x=1699345023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smwqa/VxxxvV+NAJpecN+RuY1E+JDILev1nYuilsBMI=;
        b=kEXxlGnLXt3nl62gx4LXoJaWvuvl0JFFunwyKW7x9hqBf9JiNUFCxyiicy4ReFKKDy
         MyVUx2/h03fduenfcwHqWmIznebunctPCUkOQuEMXqs0a0BWKjdaIr+FlIYFEY+dULQG
         YVi4PaHlrFH7tOkG4+qUMAJR5vwKNQuGfbCanhaziGVdIJMIaSqEYsfdkNuQweQ1gn8g
         mlTHdAAMsRbdjb4THnsCP2GLjuvzNyQuoCVly6SX7PWHYBuoOfnZAnjAL+j7vJ6JJ0sU
         a06qcYyGegzlcyxpyzY2uHNuuS3AeK4tB7GMOIJalsKxCSGqkBlLHmVcPnec8q3+TQTL
         6u+A==
X-Gm-Message-State: AOJu0YwEDLjrbHMoW0uk2k/SejzHOU/NSXLlc9JwQTIkA2hcYpK11Jb2
        kwYPdm7HQd6IW48uMShQcVR5mWbTIziy39Ll1kCmWg==
X-Google-Smtp-Source: AGHT+IHWifJqXC6H9D9kHYHXl1DQa3F7wXkSKAOFkAJmE2UoxCTGIcCFzuVkIhkNunb7Tg2gq9HFmGzJe/dab3ccdIE=
X-Received: by 2002:a25:238e:0:b0:da1:2a2b:4c5b with SMTP id
 j136-20020a25238e000000b00da12a2b4c5bmr9488785ybj.41.1698740222839; Tue, 31
 Oct 2023 01:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-7-dmitry.baryshkov@linaro.org> <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
In-Reply-To: <8785c8bd-1f07-b94f-d002-a3228b791a8a@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 31 Oct 2023 10:16:51 +0200
Message-ID: <CAA8EJppLGU1ZUCNxkb5TxzMyHGB1CsqhLSxrhrN0L9JDPRQnQg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

On Mon, 30 Oct 2023 at 21:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> > As we have dropped the variadic parts of SSPP sub-blocks declarations,
> > deduplicate them now, reducing memory cruft.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
> >   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +-
> >   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +--
> >   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++--
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 97 +++++--------------
> >   17 files changed, 120 insertions(+), 167 deletions(-)
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > index e60427f54b27..860feb9c54e6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > @@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
> >               .name = "sspp_0", .id = SSPP_VIG0,
> >               .base = 0x4000, .len = 0x344,
> >               .features = VIG_SC7180_MASK,
> > -             .sblk = &sm8550_vig_sblk_0,
> > +             .sblk = &dpu_vig_sblk_qseed3_3_2,
>
> Some of this naming doesnt sound right to me. What I had suggested was
> just dpu_vig_sblk_scaler_x_y but what is used is dpu_vig_sblk_qseedx_x_y
>
> This is not correct because technically sm8550 was qseed4 as its scaler
> version is > 0x3000
>
> So this adds some discrepancy in the naming.

And as I wrote, scaler is also not correct. We know qseed2 and rgb
scalers, which use different versioning (if they have versions at
all). I used qseed3, as it is the base version of the qseed3 / 3lite /
4 scalers. Of course we can switch back to 3/3lite/4, but I thought
that it was not that related to the hardware.

-- 
With best wishes
Dmitry
