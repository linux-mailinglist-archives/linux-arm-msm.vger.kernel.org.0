Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8631970E66B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 22:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbjEWU1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 16:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjEWU1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 16:27:39 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3AF130
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 13:27:38 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-561c1768bacso1218657b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684873657; x=1687465657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P4zhdFMMFweNQjmQzA41UGsWmlCSqKzpzycx7+iVS7A=;
        b=fDtpR5bYRVSCUwJDVAyWboPY+JdRGy0K4KFzM+mm4bi0GIkXlvypRgGdw/mbiKiAd9
         qU++VSmcOgWjna2PlbW606CGM5eAPgaiQrAic6cABd3eMYrSukjFLLG1u6XffjbmwaiM
         /VDfRzNctQWfN8olq6nOJ9eOfCKfAUen2RlfanwaV0T55oxkWMJVGk0mPMNuZB9tAXWh
         BwbjVkeQeA+lNMvG8ShcXRC1uCONL4syOdUrzcJryCWwryQIUJaw10e7dKrQYer3MVFF
         QX7tVj4bilwR2G52phZ6bMXMpXpO+Ur2umF3L7BZi3qngUSMaadzoBuQHWuKvrfpQ024
         65qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684873657; x=1687465657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4zhdFMMFweNQjmQzA41UGsWmlCSqKzpzycx7+iVS7A=;
        b=MDVU6Wzp/BOn6grlGRIl6u9btZRM2EbXSu5AdiZLO7RYctt8m79Q/oonqoGQdbHRW/
         eGF+CuFHqc2tzl3mvWb9+uZDG8NKtdEs/eQ9CwJd9SjJbgEuOdTo9XlX9HKvwF+OSosG
         gcpbJEUlNYEGTTY4A7i1fNXK71y+bq56p8wuZRAlQRjBl9xE8AddH8HVH6Vvq91wm5bV
         ioRF++cfFNho2zxYUhXLQrCck3rsCJyFdGGGXmlpAwLoF69NhXBM6D95JyWV1g6z9c3Y
         Jy0xPQcdiYeUYw9gvXj7VBrjPHOwSC4YkLso5deEX4dJcw4Gb4UR3iCWU5iXjHY/4cBU
         NQag==
X-Gm-Message-State: AC+VfDxQV8+8OY3chLryBBbByBrYEnf/IupTpo3A1xFLhY/dm8LL34NH
        KPUNU//up3dp+wvOiXhj5oqMtoVaq3zIfhbtgOteBx/aVfrxmaKK
X-Google-Smtp-Source: ACHHUZ5dsaAmJeAPGWQj1PMa6KvCSz/ESzcoCqojES3xKY2lidhpDE6B1Numzio7gc+OYpyBK0255R1DeS0u0zoQyeU=
X-Received: by 2002:a0d:ca0b:0:b0:561:bb2a:5d88 with SMTP id
 m11-20020a0dca0b000000b00561bb2a5d88mr17220176ywd.7.1684873655780; Tue, 23
 May 2023 13:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org> <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
In-Reply-To: <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 23 May 2023 23:27:24 +0300
Message-ID: <CAA8EJprPuwo4z=WoRJOzg2WMWdEkuXwgzoAe6X+Dv_Wgi1X9nQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
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

On Tue, 23 May 2023 at 23:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Drop SSPP-specifig debugfs register dumps in favour of using
> > debugfs/dri/0/kms or devcoredump.
> >
>
> I did see another series which removes src_blk from the catalog (I am
> yet to review that one) . Lets assume that one is fine and this change
> will be going on top of that one right?
>
> The concern I have with this change is that although I do agree that we
> should be in favor of using debugfs/dri/0/kms ( i have used it a few
> times and it works pretty well ), devcoredump does not have the support
> to dump sub-blocks . Something which we should add with priority because
> even with DSC blocks with the separation of enc/ctl blocks we need that
> like I wrote in one of the responses.
>
> So the "len" of the blocks having sub-blocks will be ignored in favor of
> the len of the sub-blocks.
>
> If we remove this without adding that support first, its a loss of debug
> functionality.
>
> Can we retain these blocks and remove dpu_debugfs_create_regset32 in a
> different way?

Let's add subblocks dumping. This sounds like a good idea. I'll take a
look closer to the weekend.

>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
> >   1 file changed, 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index bfd82c2921af..6c5ebee2f7cd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >       debugfs_create_xul("features", 0600,
> >                       debugfs_root, (unsigned long *)&hw_pipe->cap->features);
> >
> > -     /* add register dump support */
> > -     dpu_debugfs_create_regset32("src_blk", 0400,
> > -                     debugfs_root,
> > -                     sblk->src_blk.base + cfg->base,
> > -                     sblk->src_blk.len,
> > -                     kms);
> > -
> > -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> > -             dpu_debugfs_create_regset32("scaler_blk", 0400,
> > -                             debugfs_root,
> > -                             sblk->scaler_blk.base + cfg->base,
> > -                             sblk->scaler_blk.len,
> > -                             kms);
> > -
> > -     if (cfg->features & BIT(DPU_SSPP_CSC) ||
> > -                     cfg->features & BIT(DPU_SSPP_CSC_10BIT))
> > -             dpu_debugfs_create_regset32("csc_blk", 0400,
> > -                             debugfs_root,
> > -                             sblk->csc_blk.base + cfg->base,
> > -                             sblk->csc_blk.len,
> > -                             kms);
> > -
> >       debugfs_create_u32("xin_id",
> >                       0400,
> >                       debugfs_root,



-- 
With best wishes
Dmitry
