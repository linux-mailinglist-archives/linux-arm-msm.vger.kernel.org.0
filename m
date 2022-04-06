Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBDB4F659B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 18:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237874AbiDFQf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 12:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbiDFQfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 12:35:19 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F913A512B
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 08:10:36 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k25-20020a056830151900b005b25d8588dbso1910384otp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EW64PsFO/oRdWsOjfEcx3qDN++rt+wfe2o19U6WLL8w=;
        b=OuP7pmKSNZDGrcIzCwJpg2/t9nw1/WFVenZlPZZPYYqR3ddx27AM1BdClVJBzRLnM/
         XzyRxX5oW18V+chqRFu7GaSf6OPLzLbij/YLJdjj44ZV17xQdIINEj7ednClXRZGPfWk
         yoK5NuZk4gawap5VuGW2wqbV+SL+0xGTL7UXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EW64PsFO/oRdWsOjfEcx3qDN++rt+wfe2o19U6WLL8w=;
        b=S4GCV142SnibuIRN9zDzUSBI0OYB/NjFqeR2YwIuWCZf+/Xqm/Di1CiB6s71zHaB0n
         oc6r97UyH7AzRBFrBTONj+vuTiNLSgikQz5YCqL1pmWjbjwz6tkm0QWYutfa32yDFSu0
         NcwcBbgc2WsCPvUeivlu6h0FSCU9fd3bjiA1y+ugxX12+RR0sjAzcpA/A8+kbr33KxrF
         aSJRqEw1G2I3xd60gQ6HQ+uhnAVtuEtlGbArndLBc98fAsfylpPW8cL07ktCNKYlerZV
         2PrgZdU/bHTbuagSaWWeCpvntGg93ZFIMdMqCJ4rhbAgKWyiuqlhq799WDigfA7TNDLb
         m2vQ==
X-Gm-Message-State: AOAM533G7W60aWlrErlZYYTkBVfttHeKCtdIgpk5e46Lza/etrUE29HZ
        4DkBZisOH0/SyFYDuXiZgfRl0cULQaMbwOoz54i9og==
X-Google-Smtp-Source: ABdhPJw6NpBjiEJqSqfKLXHGIB0nJEtoJYa4P3HUoNxUv5I2kNi8OGPCno72muKbEi3n2T76pqYyndvLaE5nenHEEhY=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr3145467oth.77.1649257835830; Wed, 06 Apr
 2022 08:10:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:10:35 -0700
MIME-Version: 1.0
In-Reply-To: <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org> <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Apr 2022 08:10:35 -0700
Message-ID: <CAE-0n50FBpNy=Hmfz8+MKziPY=Z9079jFm-ZHrBD-hd_TMv37w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: don't store created planes, connectors
 and encoders
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-06 03:12:47)
> There is no point now in storing arrays of creates planes, connectors
> and encoders. Remove them from struct msm_drm_private.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
