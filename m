Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B50569068
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 19:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbiGFROT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 13:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiGFROS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 13:14:18 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEFBB7FC
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 10:14:17 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id k14so19152764qtm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gdl58Y6eruxO/UF9iHebd7iAX1fPwcfZcdGK1G6I67A=;
        b=NcYmRAhNkr+Sej+dUBW/rUemcu4qhrB0eGXwYx5FTFmtQ8tKRufDlwJ/lkS7wER2zJ
         jV6wRoRmAMNdAQSXMkcvIOLC2e60hR5mw9xUwmncmRINM3JFeYMHnzmNaXHfIjFlbf7S
         LDX+d7jVDzt3eROD00YFUpwlzzpN+FGYYubdZ94XUT/jDUnTLGCPskgT+K5yZnTAH4nR
         9KN4M7fzv63p/y1wtxjpDfTTuC85SufMiPGqenPoHFa91gprzBOo9A8iG+THujkecbCy
         fhtfwsTjXDPXOWFw8PTjz5echkBOFR7P9QzIipHzfLD0oVava1d+90rXJYk2Old6RtK3
         GuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gdl58Y6eruxO/UF9iHebd7iAX1fPwcfZcdGK1G6I67A=;
        b=gsnnmnZBCPsMXUSK1+RdkmHKRIa9xZAXnGYKB6n05XQKFu9h7zFQhVbgowNCAXhPc3
         Y58uNc2ExjVJ2Q5KdaLvaQBIsZ8WOaoXjGtphipsli6DftnPbEAaJ4Fj5pWazyYzKIeP
         hbeTeVgOItElo+n+xfcoFsyA6D1/PLWjPP/9RWn2mnsN5zw1AtlqQRv0vtaB6+X7C8oB
         YvqMGTSD014kplR8EMDyJ9B+zClFVeSWPFVWuD34/2u0bU9iTwd0B66zjGmFOndolQpx
         yD2luTi6B+6m5Zr1UoSAo78p9Wd+D089XIvQ4KKRDtGOLlJgwNDZCiFbbtEPO13KL0jI
         ROEg==
X-Gm-Message-State: AJIora82ti4f0LCJB8oZm+/cjV1zZkRaA5iVbsvQCBBnl8CUZSOswzcR
        1524QTjXYng5ZjOvof0NHwcAfnhqxSeJor2Gjdnlag==
X-Google-Smtp-Source: AGRyM1siyHqhjYbCijMakD/a+R1/ORAjQrKAxonXg7rZEccsGYIKNljc2HpasXRM2tM13BML+/t+aFxBEkjO+7fgSBU=
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id
 r22-20020ac85c96000000b0031ac19a7da1mr33974182qta.62.1657127656137; Wed, 06
 Jul 2022 10:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <0083bc7e23753c19902580b902582ae499b44dbf.1657113388.git.geert@linux-m68k.org>
In-Reply-To: <0083bc7e23753c19902580b902582ae499b44dbf.1657113388.git.geert@linux-m68k.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 20:14:05 +0300
Message-ID: <CAA8EJpp2u4NuimhvkXwcO2kPQCopgbDV5x=B+LEkyqoQrSW5rg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Do not propagate void return values
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Jul 2022 at 16:18, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> With sparse ("make C=2"), lots of
>
>   error: return expression in void function
>
> messages are seen.
>
> Fix this by removing the return statements to propagate void return
> values.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2:
>   - Add Reviewed-by.

-- 
With best wishes
Dmitry
