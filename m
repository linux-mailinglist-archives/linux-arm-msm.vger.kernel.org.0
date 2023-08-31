Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F05D78E3EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 02:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242407AbjHaA1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 20:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239259AbjHaA1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 20:27:22 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB6DBE
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:27:19 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso108522276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693441639; x=1694046439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6XFUVRQ182BzKxaOieUisigxEXwKIxFTn7N8wbJlC7c=;
        b=vuH9oMvARW6HAGeF4RRHgybC1AUHh8Gv9CJX4eqeX6Huy3NiDWsO1RTU6MDF3JnrLB
         G+/ePDOsAtQh/5HkxHcNZ5Mc+7hB0yjq/Lxn3q7krFakNYrPqlCUGdhJrA/WFzSe6HH0
         mWMnlDVFhpAb8jBiu1Uwau+EJV27Ro+BRR82G/KkNhKs0MOmfC1HrTyuph3ddvJLnjG9
         zXsp2r7WeKbhQclz5qiRrQGYBW9ij0UJnexXOgXQGznLX3+WDNinH/xJLlMvUbFNi6L4
         E4Z9xzBRKzzJN6M2ayMnOm+wlYJN5yxOhUFuViqZSjrocJ9GaV/y+Y6UVE6S32/5vqkY
         6Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693441639; x=1694046439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XFUVRQ182BzKxaOieUisigxEXwKIxFTn7N8wbJlC7c=;
        b=MVFKx9VTZNafpCmrXtX08tdh0RWThp9F+g8FqpvgzuiGmbXHBjlaGL7oww4eN4BOsH
         DQHK0f8rHhEzoB3pRy4cBhVcB2WwsEb20wgPcwBq7qICF5ssMnPnmirzmfYLWBhELa2X
         ZQXTPGvKVGgaF5d5p1TxBRRDmuNauR3g628/ep5HT4yN4LfjcQiajK+PNdWGBlg7uKTb
         DHYsEPVyLnrEHNwHlZPgyQZm3jFuSunxbZVe9ZFCKSNQ4uRnXg5FlWYVUjR5AiKsYZs7
         Ufe0ov6kz6ltW3eZhmw2r1AqdUh5kgw3Wrz9iI70Y+M6DJuP1aGeZ5eVNLO/DJdEYuot
         vJNg==
X-Gm-Message-State: AOJu0YyI5t39Svxt0bXbWZt4aVzeulGNBDNPYioOEln/H1lHyx4Z1azE
        wjiykIOqXa48vxMZN6kvRm0Kw7uq65k5fZvwYNrLtg==
X-Google-Smtp-Source: AGHT+IHknU6BC0qcHumWwJIB4jFHAfeTNSsm6jtFd9ikSrfRePOl4XXsKx1ygwxm0Sd1L8EI6HuBz53qqJL+YdpvGZ8=
X-Received: by 2002:a25:e7d1:0:b0:bcb:9b43:5a89 with SMTP id
 e200-20020a25e7d1000000b00bcb9b435a89mr3433973ybh.61.1693441639229; Wed, 30
 Aug 2023 17:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-17-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-17-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 03:27:08 +0300
Message-ID: <CAA8EJpqwzbBA6HPfW_ruAUxAv88AZwS4hSuCU47qydM8H+Qsyg@mail.gmail.com>
Subject: Re: [PATCH 16/16] drm/msm/dpu: add cdm blocks to dpu snapshot
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Now that CDM block support has been added to DPU lets also add its
> entry to the DPU snapshot to help debugging.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)


-- 
With best wishes
Dmitry
