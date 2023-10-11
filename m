Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB8E7C5491
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 14:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbjJKM4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 08:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235028AbjJKMz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 08:55:59 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9EEED
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 05:55:56 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59b5484fbe6so83786397b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 05:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697028955; x=1697633755; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EMpanbuMcLckus9ZARSZ53Uwja0e50NWNJtv+xhA5TM=;
        b=WdzkZc1hao2Z9FDSRZaB/L2m8F+c5snn1vCpzZBilplrG1r76Nj5ECmHHn1x2pGGsj
         5SkFtUMXF2M9PHf8uw1FA99MMi0+RYLCPqUict4vb5G6QQn2m4/NkrJb/dUqpmPyplYB
         5DOXas2WjvMqFWCHEfcsbQxQCSkyEQ6VhKf2FFffjil2QChASg9vTo9t2D/pW5MgZtyN
         MTj5xkrLLykE3wtFe1eftBzPqO+iRs8Hfq7FcmrQpJsYOnTxUxxAAWTPbgB6X/BNAdZ0
         gJfNPhfxpNMRQnFcSU7ZMxpSxoAmGaboMM3f0HqIpVJ1faIIW2bR3LlbQfQTMGEnLQ63
         p5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697028955; x=1697633755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMpanbuMcLckus9ZARSZ53Uwja0e50NWNJtv+xhA5TM=;
        b=kxxv4FBPrf/z8sc5r8i9s4aGl6Z3Q5cSanSfZXI0TyssoR3/gChRaDi5kI0t4HOtpu
         XklrMbgGeoBNuP9DkMPRP3hOaV3ahsh/knwHcGHOQvISLGV3aE6j+jpyv4ECOFWue1X0
         9dpwBF0AYvapgBNh0chF1FfuMJgjSbfO1eRjbSLElYhN25ilz5SbmNxfu0ajNReNHigj
         aiv4v6SNSs0oZQhxf3M6jBmIA2rvmukmQP7qaKCa+TCtJr40TMJwn09jTtPNEgXGRObe
         bMcQ0LA+VfwhFDpWsnPCiC44v8p3A5EZSM0A7FXkQkkUswczgv0it9WAOapsw9VfS08Y
         UXRA==
X-Gm-Message-State: AOJu0YxrxD2BdL/mi4nEGLkS6TKxB/3OS2MYlr+ft+5p2XIVLEMkYjir
        KpfCwZDQDVwa0Vdhu6oxGuCCVItavCAh5g7TPN/DSw==
X-Google-Smtp-Source: AGHT+IEIo1rpWm9ozb2LC8BBsWDuwXIWlIvdWVu7bjYXOoAjwOwLrnyyqhLenYE18qjjRDtzEBTv1V0bMC53GjFv++k=
X-Received: by 2002:a81:9149:0:b0:5a7:b782:6dd9 with SMTP id
 i70-20020a819149000000b005a7b7826dd9mr6553527ywg.26.1697028955491; Wed, 11
 Oct 2023 05:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-4-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-4-b219c945df53@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 Oct 2023 15:55:44 +0300
Message-ID: <CAA8EJpq_DnKseY_CGJ36V1v_vc2dsCS4UCiEYWnbfz4Cp5vtfQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: sm8550: remove unused VIG and DMA
 clock controls entries
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The SM8550 has the SSPP clk_ctrl in the SSPP registers, remove the
> duplicate clock controls from the MDP top.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
