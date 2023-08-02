Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8546F76CF44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 15:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbjHBNz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 09:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234313AbjHBNzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 09:55:25 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3262114
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 06:55:24 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so7042135276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690984523; x=1691589323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0l+1x6y6SlbQz0ZIE/2173DpY2Qrcda4Hwn59iq0PMo=;
        b=dXkIeO7gkVyF62wsdR0cMYk0zBzmZhu7GagBplHzhXKz01U92E8gxeSuJJamWAuYCX
         mk2UFZ5zWthSjQPualn7CwT8qrwki4yTyO1u5JE3WZJUxXJp5N7qfycCcuPxbwGFMRYM
         dfJbaGCREHAMnAfmX/eFDyWp1AlID4gpyY+FPgtl8D8iz5yFtsQCNyeTbRzsZpXIJonv
         A3y37/fYeDpM9hdpxEPv3XmozuLkJ168iGm/Cgi2gQOyg3nLKOK4KLCQD5h+k3PSs4nb
         WgLfwgk9b/doZaaFFyMxLkN13iRboV9j0J7K2mavIKPAsdEuXwaK/7ot2jPpqfA4j5D+
         mwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690984523; x=1691589323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l+1x6y6SlbQz0ZIE/2173DpY2Qrcda4Hwn59iq0PMo=;
        b=NhWdK7uF+thjgn6AEWmeLwdd0N0ULpvS6ZP7wBWf2oPJt3tXM8UJRfiaqtT7bt5FgE
         o7spt78dNFib0EB34/+5ORjlDK/MPMw1+g4Kwpx6i1JDtRe/IDiVGdfCwf5er0mrfUtc
         cfArsSqzz97FUSNR3v1ccw8QLZ0++W9ru+N+lx/YWBlNKizOy0YP8muMrz1lmU28SRln
         SdRCeJJFK4RW99uAJknTIFW4Hb7tOtUl4GDF90RJYeT0gMMUbFSYFWX0Grvuf0Lrq3Ld
         V4JhyuvyHgFQOnmKEuYRQjH0J6nJr1Lm06CZxEkxOFGEKBm+ockMiZI5jL56ypAxRQX1
         zXXw==
X-Gm-Message-State: ABy/qLal5pNmfh8aRs/NBUuOP1YqmSHejJ7Qea2P9vt64Hkaw/HMTdE8
        tpV4fBJ31IP/1cnpZduzSAvTbyWeP26G0BJf1bjVYA==
X-Google-Smtp-Source: APBJJlHy3baV7qerO928qPmdbPqm5oivM1YoS7WHoTdeQ2XpwejyhZi1QTTp65m9Jfs0ry5oerZeSO5HesVrAlx0qXM=
X-Received: by 2002:a25:d84a:0:b0:d11:c89:4256 with SMTP id
 p71-20020a25d84a000000b00d110c894256mr14190350ybg.31.1690984523733; Wed, 02
 Aug 2023 06:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230802134900.30435-1-jonathan@marek.ca>
In-Reply-To: <20230802134900.30435-1-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Aug 2023 16:55:12 +0300
Message-ID: <CAA8EJpoKj0UNbuv_vGBLsv9JK9qR7rD+OTSC1ujhsR53N9jOBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: increase memtype count to 16 for sm8550
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Aug 2023 at 16:51, Jonathan Marek <jonathan@marek.ca> wrote:
>
> sm8550 has 16 vbif clients.
>
> This fixes the extra 2 clients (DMA4/DMA5) not having their memtype
> initialized. This fixes DMA4/DMA5 planes not displaying correctly.
>
> Fixes: efcd0107 ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Thanks!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 ++--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
