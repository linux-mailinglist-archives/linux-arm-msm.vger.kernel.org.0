Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19D7B4BC37A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 01:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbiBSAeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 19:34:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236378AbiBSAeT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 19:34:19 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E39B177E76
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:34:02 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id p15so4880009oip.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vKhJiLpJMNrNDVVoSI5LLnimpnVQVH6BtXENhzvuHFA=;
        b=HfSALada/6cdeAWOKMWVGJzL12lUov2M6fbxXPfW2tmBWRqARWU+NKd3/1Vy/kDmRb
         3p/eOHoOWPVhINTFz7+naFVDuNjT5wcLMkNyAt/SGqPvvJ7MXFxlsUxHTMT+UmgnGGDk
         qHyGd4NQRt6w1lA1Q0iPNMVDQadOxp/FbcvMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vKhJiLpJMNrNDVVoSI5LLnimpnVQVH6BtXENhzvuHFA=;
        b=Q7t1Mg95NvRBWL6ZUI9idmGFXVLnMTa2IaMdC7Q9B3oHVN2uClSj6Ik2PE8kWsFLSP
         Hchf2szHFItpVmBemD+rV25AxGK2Ri08mR2+NbB/qHqEpq2zo1ESewWY+cm+vbp+QWJC
         lJRJRXlw9Jq7/kxTN1AP37DOlHHMeIK3p63Xcmme4xOPOGtOs8RvbxXU2PkhUI/lvUGj
         lHtrU/Pc/Z2pFuO2hcCcup+UScBpmItzcjKHoGsLr4kzDpP1/GQZ0U09oW2NlwD5kQwm
         9zFJSMl6fXuwCVn1hKdQ+rtzHHLoHVN/EaALjXDdv9YkfkhsQF0KcXsrYoeMXyvgLK3u
         Vxpw==
X-Gm-Message-State: AOAM530v/KxBHrNRTDzerj/D+mzdgcyQJw0WCZake3scN7ISjj9RvOdz
        ey6hkr5xgMXtngt48dmuTZDNrkDdN3j7XjMH1LG+dA==
X-Google-Smtp-Source: ABdhPJyLUHKLgsnFWoq7fgkInpdSdDIj0KpGrczwZENMDX/brDIe6HYXp+lshMaGOJ+HdFljHgy4t77LBqEvf2IZHBM=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr445075oiw.112.1645230841936; Fri, 18 Feb
 2022 16:34:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 16:34:01 -0800
MIME-Version: 1.0
In-Reply-To: <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org> <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 16:34:01 -0800
Message-ID: <CAE-0n52NCAMXjEWtt_L-KcW0=FRw3o=fQOMBzX+9SkjH8BVhwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even
 for DP interfaces
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-11 14:40:04)
> It is possible to supply display-connector (bridge) to the DP interface,
> add support for parsing it too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
