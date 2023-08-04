Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DD8770110
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 15:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjHDNQ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 09:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjHDNQC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 09:16:02 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB605245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 06:14:35 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d0548cf861aso2260836276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691154874; x=1691759674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D4FGrRKKqr6fNENlJ4HUuscXPUM5XRYzhDK7WNtt/9c=;
        b=Mrg4Xr5v0lFTFocRyHHEc/zy5oeKvOxVeaf08lVJ7qOu9G25xP8Yl2opzmsjEGYjsW
         0Om3zPnCCY0EABOYWclpfzyb+ZiGjyUErocqO/LbH1SMmdC1cHvm0nefne0a4NwzTe3o
         ue082SJuCjExtQm7w3FilO5271WrroN8Tr/rEi0ohb4LtN6m69c3a2n96V8XNIyxBUx4
         tlauYnDu6Qi2QCQrDTUpc4Zi2ML5ZWE3rse4yDzvKi8Bn7tARoEZpjPHp9q1TR1d3WoE
         nkAXfDqMUV7FVUs6eeffv5TVKg9VO3vYmspm+FS25ZPGsZV5vLgpC6mPw4o9Th0llI1s
         HipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691154874; x=1691759674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4FGrRKKqr6fNENlJ4HUuscXPUM5XRYzhDK7WNtt/9c=;
        b=auLugcKJRJ9zQyM2wWAE+4afoVg0jCOVIW0mY+xn6gFdS/J4qb44GPzNvj0iIyOekU
         lCjnrGxdvVqty8YZrrh0532cc384usmZClD1J64kTfM+J9tAOeNR2V/ur5a4fbk6Utoj
         EUpdTi+gJ2tNFZ7FEg62oHkieCWkmtrPt6ZMD43sh2+f+h0gM8ruNEuJax2w0m95KZdr
         LJj2l9FgNlby7Wy/d2i+pCdMFrOJde/DLhB/NKNTxMBNQKhxeG+gEEZppPyPq6udYLUb
         8orMrKZ2iIeYJDdQJzp0Ke9N0FBBa/zxB1/YHTA9aY4DDJrSLgz8A1/e4dXHA/HcPypP
         /DDg==
X-Gm-Message-State: AOJu0Yzv4Rbd2U53qFF5v1UxByiJZZOkjDAXpbpl+BrYmhRuwEQcQyEE
        qt2+31GtpN32esT5A7wP4TjgBewJw80t5HJ4iLbapw==
X-Google-Smtp-Source: AGHT+IG/YtX9++/di3aekXINcH9r4zmIZn1VPvqr+jVi9AWhqoV2uRrOWWP2zNSUOl6v7/OqmARiYdzthQYNo4Bm61c=
X-Received: by 2002:a25:29c2:0:b0:c62:2320:2598 with SMTP id
 p185-20020a2529c2000000b00c6223202598mr1173682ybp.62.1691154874341; Fri, 04
 Aug 2023 06:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
In-Reply-To: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Aug 2023 16:14:23 +0300
Message-ID: <CAA8EJpp6mijmo2A5xn2aG2PwsAh9mr0v3+ruDgoqLKTawme-xA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Drop encoder vsync_event
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, 2 Aug 2023 at 20:01, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop vsync_event and vsync_event_work handlers as they are unnecessary.
> In addition drop the dpu_enc_ktime_template event class as it will be
> unused after the vsync_event handlers are dropped.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Dropped dpu_enc_early_kickoff event and dpu_enc_ktime_template event class
> - Link to v1: https://lore.kernel.org/r/20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 65 +----------------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 23 ----------
>  2 files changed, 1 insertion(+), 87 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
