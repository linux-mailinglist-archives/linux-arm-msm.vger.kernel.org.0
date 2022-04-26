Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E4851035E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 18:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348473AbiDZQgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 12:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbiDZQgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 12:36:09 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3805162240
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 09:33:01 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id a1so17388969edt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w/xT8OEkfJiGdCpQNvW6rWuFI33EcUc9l2oRZJTJYjo=;
        b=ZXI0iF4XwaUFS2CouqYpBm2HJAhUUGwHxnsr7S2MSxFudHfTpPeqryiZimuBmutRWo
         TsT6M4xRhARlro2JR1B8K/eQ6hylzrhd86UEkByLWqmwxNlHG/s37h2blq4q1OD33gZF
         29E8BhrAcQUhpmm7vN/VPGIdlIGL3boPkA88msmg+zVtWou8S+8a47CVvMXvqFLfL+lq
         0Oo4dFTGdQZwhgZ+/9elASV3BTTyQF1b6XpQA0Nz0zmvyp+CJW6By+W5oYx2XRlqO8yF
         zNDP5FvK4w/5toz477GonMovhzlQzeqk+knnHsplHf+6BiqBmfBhJLQ2y2rL5XxlRys9
         2Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w/xT8OEkfJiGdCpQNvW6rWuFI33EcUc9l2oRZJTJYjo=;
        b=Czs9TadnDJHUNVUNWyGb5sx+k+BqIeJAPP3EGbSAmSwXEgS6LBJqve5Tj8ZqYdpi7T
         MZVdV0lh2PTzMnaTOqdbuG07eWbV2htUE3X/OW3WDgnNcsuzbcUibiUiaJn7Ihfv3vVk
         Fn7D97bWgp5G6Cr8bUgOYo3RqWtUz/4hopmYqt/K+gQ5eXdJwneCe126Y1+/8VRNKGqX
         9eeimUardPyppnDATEL25/aceEDePJ3M1gnK+l7b432zVq7eQu8OXXHtA4U4M4o+HNkK
         Fx5i6c8MTEAZJ4RxU/wqKc2u+5Ma7D9v9rIZnsOs/kYu3SDT72cj3zzdM7L8GRAPndvs
         BXqA==
X-Gm-Message-State: AOAM533UMPwLcPaOyzBzBOczbBV2VaOYNzdt0ijgMLQCklq/YgjVU5iE
        YbzjMmOAw0J7UCVVcvUckFl3b0kORufNvDeGDDY=
X-Google-Smtp-Source: ABdhPJx6lZ71etdNvL3om3gG1H+ABaor8IdKN7EbPOe9Uld7J830690y1KAzBkXOU3RQgxtTSIBsZNV0uxb2ZnuOEn0=
X-Received: by 2002:aa7:d407:0:b0:425:f57e:7ae5 with SMTP id
 z7-20020aa7d407000000b00425f57e7ae5mr7803138edq.393.1650990780317; Tue, 26
 Apr 2022 09:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
In-Reply-To: <20220412212558.827289-1-olvaffe@gmail.com>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Tue, 26 Apr 2022 09:32:49 -0700
Message-ID: <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     freedreno@lists.freedesktop.org
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> In practice, trace_dma_fence_init called from dma_fence_init is good
> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
> and virtio both have cases where trace_dma_fence_init and
> trace_dma_fence_emit can be apart.  It is easier for visualization tools
> to always use the more correct trace_dma_fence_emit when visualizing
> fence timelines.
>
> v2: improve commit message (Dmitry)
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
This has been reviewed.  Should we land it?

(Or, how do I check if it has landed?)
