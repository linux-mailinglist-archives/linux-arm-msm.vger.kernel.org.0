Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89346DCB8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 21:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDJT2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 15:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjDJT2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 15:28:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF5719B3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 12:28:34 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y4so6031916ljq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 12:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681154913;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cV7iHlDSCkwR3Z86lazv55Ruacc6OCgU/OMjDSnBLGA=;
        b=lmMtmMZYSPau5HIiRuvkaPYnLQadTiUc8bYELRlQYBN/6UsWZoNLmz+hsApbhEmaNJ
         rt3P9DWoya5zNZhEg8f6onN7v7cpTwYGWY/7VQk4RL9aVM9T1w6FMR642KNDTrR/DjZz
         IYjZnIcz4cf+6qeXWblu/JVVdkd2sfUWA6wks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154913;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV7iHlDSCkwR3Z86lazv55Ruacc6OCgU/OMjDSnBLGA=;
        b=K2oUF9IrVActEEmODCvl47l+tw7XssEIUQsxgLuOCdJdvsMHx8AqQ9KOIzsK9B+Vtw
         vsk+e2ZlfRFAx6zgGgKyLtDVvhoKbrcYGQdefQa1VjmXyOzoAxpUvZKoU4Uicnewu5yq
         hOaurDMb602V1ED20EA/cYDY3Iqh088Ymy8LfuufsylZUMfKJNjFE4Yg6ceyo/jJ2G63
         zhlauyNrcnrC9gPvw8STwKbC8z2s+alYR4qVANIrEfLQeAl3gevgb4ACOGI60qUsDE9D
         q8zVPNHoAPOv1sPECT6HQlBjl+ZxfzeYIq80JV08SVxT1qsP/C2+D+Mmo4OdvYz2llP2
         o1IQ==
X-Gm-Message-State: AAQBX9ccMzw2FKgdhBd9+pbX2VAMMja0J+6BkMy8zxfI6ytqGsX1P1JA
        dSCe18e1tA05RDX0AXYOZjsmlhtDo3i8JYkU5KmkdQ==
X-Google-Smtp-Source: AKy350alTOxLOMLHu6EdCkF/pTKW48gCDfBI3KpxJaXbdN8LaZEHWn9jGZb5m808HwS5cTn3lAVhtWfPsMYChQpj/0k=
X-Received: by 2002:a2e:9842:0:b0:2a7:828c:591b with SMTP id
 e2-20020a2e9842000000b002a7828c591bmr702366ljj.10.1681154913050; Mon, 10 Apr
 2023 12:28:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Apr 2023 12:28:32 -0700
MIME-Version: 1.0
In-Reply-To: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
References: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 10 Apr 2023 12:28:32 -0700
Message-ID: <CAE-0n51mkvb0nmF19NTXeLegzJJU=53ywUOqEP0skMtU3Oh3xA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Adam Skladowski <a39.skl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-04-08 18:13:29)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") added special handling for a510 (this SKU doesn't seem to support
> preemption, so the driver should clamp nr_rings to 1). However the
> gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
> thus the condition is always false. Check config->rev instead.
>
> Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
> Reported-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Maybe as a followup you can put a WARN_ON_ONCE() inside a new function
that gets gpu->revn and warns if the value is 0?
