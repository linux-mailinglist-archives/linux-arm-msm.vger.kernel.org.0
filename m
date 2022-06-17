Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA1E54FE9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383219AbiFQUst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381762AbiFQUss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:48:48 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0015DBE2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:48:47 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso6929344fac.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Y4XNPPOTHcGQua89ehLw74GJaEq7bj+hezmlX6AJcYE=;
        b=Oax+hb9jz11E80qid8APuomKpd1AiYADh5Zfb5n+Y6a/her9EiKju+LU3dKDEjr8lY
         YhYXxlHkYUMfxRzIzmOJT0EvN55leGg8E8A/L0+zVd5ny2ZP8DEsXr1aI88AF5zDhvzM
         DLkNe7+ayYWePHOAQW6WVD8xdAjTCgjqXOdqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Y4XNPPOTHcGQua89ehLw74GJaEq7bj+hezmlX6AJcYE=;
        b=nl7+ePspv21UTdH/ks9+K6ZIyiH17OYfe64OVQsJ8IyaY6IgGt7waW/Zidj/3n/4Xk
         Ha56bIFTcGh/AiuHOdQhFvbqL0H2VXZTJx1FBVC3PmC8k90ai2E69ecU9cIlM0DnqQnJ
         tgvNOumRNbhQAPRktd+vQ3v2TjlkiXc5YxlbbmvedT8jf5psU9lCcH/fMguSrPnprH76
         sU6+UX4Mezoi32rXKzyNXSBHEmDud0IZdIfq5lX25slGD/9soygE3HGCEM7W2BkPw5NC
         9BMTiMDifIwmuYNMsrZzDE3CoQIeHeTmskRut+MxOOg6m6snCBHjjFNrIFi25PZMURAE
         uoAQ==
X-Gm-Message-State: AJIora9Oevv+1TieO5vVwgpOq/bVV6cmgRXEtoEPVZz+X+ji6e+MLPwd
        KCu1VEz+jS+mkO+y494yTvXHhWt+MeJAd38auEh+sQ==
X-Google-Smtp-Source: AGRyM1sBdyafzJaFAWXzzdqzqbJCmm4BoflbCmCwm6csBW+c/DYUEooGn1aPbS1QG/DhTZ9CKV43uKNzGz9cffP+yjM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr6548394oap.63.1655498926376; Fri, 17 Jun
 2022 13:48:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:48:45 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org> <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:48:45 -0700
Message-ID: <CAE-0n51J5K_o=Mmt5aYiS6MMnHTfhPG28Pe6-9xZC0bn=zbK=A@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 12:14:27)
> Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
> instead.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
