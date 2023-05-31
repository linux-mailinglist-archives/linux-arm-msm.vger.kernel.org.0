Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA447184F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 16:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjEaO3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 10:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236084AbjEaO3Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 10:29:16 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29C41B1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 07:28:54 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2568befcf1dso800744a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 07:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685543334; x=1688135334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEeMcGwsmQcWXT4vssRRefgYUtAVUNcH/IZjc9KyPZo=;
        b=CjdqfrrbYCWvmKSQQuDohOUAkm+PE6FOwEZMF7GiEk31XlDRzQ+TvYVIF1uGioyw0p
         QpxOOUd1fqtJcehvW+5RZ7jjM1wkD14QdYG+BaFqgKdDKHNtAv10Lef5idxCf2vSf8Vp
         1fCc78gj2ime2AgCKJOYAEmVT7cW1hKVJHGtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543334; x=1688135334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEeMcGwsmQcWXT4vssRRefgYUtAVUNcH/IZjc9KyPZo=;
        b=OJvY8RKIU4a67Rk2qZQ3T8J88UqKbt3t1cQpLG6L54xbY7Ga4HS1Aa2GgeTPwSk78y
         kAE7vb89ltrdomniVVNvVKuC66osqzdFvOv9GpYGUuFhSMkysuGO7bXuD1tpyzSYrC18
         rlJ/0N/FYn3bcznqDqXs5ey78e1ecvl3c2oPNY+KCKGqZNOqZHAxzjwQ1v7JVE8utM8W
         adXGrd0zAeOHZyCLBM87DzybMfMaKQRzZQWnBa6k8Eb3HfG+rsKynJV9XXkG2bhJeiUY
         4TN/gspa4ifZtXR8wS+TkJFXyFH9qWMswVDfz2Hi/Mua8ZUjCs/29Hq00+xa2Ibai3rn
         vtZA==
X-Gm-Message-State: AC+VfDxGsRU4aDHpAemBG7Vt0/eaXYeTKJbHqyWC/9xbrSNcDROlas7J
        W8RrgDxiU7Ne/qSHqBAFw2jHRPpVb3wpVki+72A=
X-Google-Smtp-Source: ACHHUZ4BVIzAgAXHSSWM4+ax7UGzoM6TU05X/7EVJS2C7yRU/31PKQ4crGkwl8kNYGv21QHSQFHFVQ==
X-Received: by 2002:a17:90a:8997:b0:253:510e:130a with SMTP id v23-20020a17090a899700b00253510e130amr6332285pjn.19.1685543333880;
        Wed, 31 May 2023 07:28:53 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090a498700b0024de39e8746sm1313478pjh.11.2023.05.31.07.28.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 07:28:53 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ae64580e9fso134475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 07:28:52 -0700 (PDT)
X-Received: by 2002:a05:6e02:2196:b0:331:4d3c:db55 with SMTP id
 j22-20020a056e02219600b003314d3cdb55mr209123ila.4.1685542980288; Wed, 31 May
 2023 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075854.703-1-johan+linaro@kernel.org>
In-Reply-To: <20230531075854.703-1-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 May 2023 07:22:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtyMSekPYfamMkswC=mSRnBpQUygMxZ+Wgf6Y2dB2Qhw@mail.gmail.com>
Message-ID: <CAD=FV=UtyMSekPYfamMkswC=mSRnBpQUygMxZ+Wgf6Y2dB2Qhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix uninitialised lock in init error path
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 31, 2023 at 1:00=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> A recent commit started taking the GMU lock in the GPU destroy path,
> which on GPU initialisation failure is called before the GMU and its
> lock have been initialised.
>
> Make sure that the GMU has been initialised before taking the lock in
> a6xx_destroy() and drop the now redundant check from a6xx_gmu_remove().
>
> Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++++++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

I think Dmitry already posted a patch 1.5 months ago to fix this.

https://lore.kernel.org/r/20230410165908.3094626-1-dmitry.baryshkov@linaro.=
org

Can you confirm that works for you?

-Doug
