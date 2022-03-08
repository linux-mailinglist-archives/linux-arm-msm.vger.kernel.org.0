Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF3C4D22BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236137AbiCHUhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbiCHUhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:37:06 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890AA50E32
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:36:08 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so482663ooi.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qVaJCfxjsUXAyjD9fhWkvYzGM86k2JdETPIA3qn9/JY=;
        b=kilFiNI5uz22iSJPK1Gt8KB1l705LrDfOOJTBrWLBRjWLsOv9Vx0dmkSuJDHS8YUR4
         nj6Cgp99iN79rUXo3IbjsynDHsneQ2aM2fN8+C5qTK/Zxryr437+/N8aV9hz+KVWy5Ex
         dypcGDKJ1gAJcXM4b5HIFVedOF0n22V06x7BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qVaJCfxjsUXAyjD9fhWkvYzGM86k2JdETPIA3qn9/JY=;
        b=KUNwmYBBwaya39itkjSn9ZjRwwlN/UqrOj8vuxo4pV7T94OYWpePSVKbYPoeMQwag7
         rwQ4BVCkpb8OvU+Q0vKEuRPTyEeYogDbaeZuLhW+yxYK7qRGzbo6SF6zoa/z9PY2zsrB
         E53/ZhwzJg+UN9nesM1gycUiN8sha2TXsg72DrJNI8UvC7jU23kig97VE2uIXZIzlJh7
         sdshOsa7fp8uasHwR1D/sTEz2RKrCp+txuqdir+WM9lPCZ62F8ymToaR8d0LeO9BTvgQ
         K4Udf8x5B14VfLTcFSAXYcSBwyoAA56u4RZIpbhqAyAChLTeIcDebLTI8x3zRJ4O8+gJ
         f6gQ==
X-Gm-Message-State: AOAM533R0DCMaWr6sWIt66GymsZH0oogIdUR4qiO+3G7fjIWQcdQnjv+
        QVyJ679VNO3jBaW+wB8AI6+PQbHH0AscwQcT5jCaUg==
X-Google-Smtp-Source: ABdhPJxx/oEwjmfSR8atG/+Wq8RQXmGfnslvHo7Kqa54uPuTrLx6bcwyb6JqhK/QYSqu5rmC2ZrOkU7VXX3UHlgihBY=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3492462oac.193.1646771767902; Tue, 08
 Mar 2022 12:36:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:36:07 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org> <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:36:07 -0800
Message-ID: <CAE-0n50jrtvunQgj40nrwOjrZrsKunOixnHGjMCvu+wEHG2nLg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/msm: allow compile time selection of driver components
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 19:21:06)
> MSM DRM driver already allows one to compile out the DP or DSI support.
> Add support for disabling other features like MDP4/MDP5/DPU drivers or
> direct HDMI output support.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
