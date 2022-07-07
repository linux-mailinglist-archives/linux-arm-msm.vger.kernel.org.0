Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B883456AF2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 02:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbiGGXzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 19:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236449AbiGGXzH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 19:55:07 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11DC6D56C
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 16:55:06 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id g8-20020a4ac4c8000000b00425a0f2b493so3765382ooq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9ntP1WDLnC6Yx7jFk7jZStLEDziwDqk+ZlwPsvE1xWs=;
        b=bXuaYmps3SO/5Gg3nxuV379NqM1hoHcyQbvWn/KnsI4akOLpYz+plOpnE5dn9mRH7Z
         Ba4pUy+ktATqZI/NUhKueHyeRHspJaPiUIEewUlCm9RQVmwSizU1Qt7YSZVn+1svIEIs
         iVy1O+bxNmKs1ULMXdsz6tbhueBjHT39Ggtcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9ntP1WDLnC6Yx7jFk7jZStLEDziwDqk+ZlwPsvE1xWs=;
        b=lMvYRoy6u9c5PxijKJczysr2CTMfQ/tJjxPS0KsFerdH0RKo3jwSjN+UwO5YNvsOdR
         PHxNzNjYIKovfKgN+4CdHjGU6UgpQqbOGeUFwRNGe3lCoVrlJEX5dJvp8IuZA3EzmURB
         lnNNlHrwJjHPAiQbGLzkeyReI9fjOZ7AGa1zKy3x5tNoxqOSGlRnGmcBFcL72jfxRy1a
         MAQ5TYCm1Y8CD2TjWTWYBEylA4oj+oUNeFunTozik5BGrFNBrGyTy4pTe+Ncvxek/G7q
         szZxoJxzmDPSIUxmU8e4GTRwWS9V7zw/uCxCLwSD0Ag2WBsYHcHXDvPSce1oC7hxLnLX
         S/jQ==
X-Gm-Message-State: AJIora9T6CXmVKRTvIlH/tUqIu1H55IPewNAYeqjsn3OCcjiwIxmgHs6
        QHxG/USPFbO+3tWmuzBw0OBlckH2vGhs/6kkdUeoqg==
X-Google-Smtp-Source: AGRyM1s5aRJwu3pF2TR9+JflN9Xt6rSHUQxPIdyIsKnn5I3uBjzRJFONFzrC6JiOmFqLVKBgHodXNbkvtUIvE0e4ebU=
X-Received: by 2002:a4a:81c1:0:b0:425:b01b:f757 with SMTP id
 s1-20020a4a81c1000000b00425b01bf757mr305054oog.1.1657238106090; Thu, 07 Jul
 2022 16:55:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 16:55:05 -0700
MIME-Version: 1.0
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Jul 2022 16:55:05 -0700
Message-ID: <CAE-0n506RwOi8xqVEAaLjfhb3vey7R2FF_72_F-nmgrXrP6RWQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: make eDP panel as the first connected connector
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-07-06 12:32:08)
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
