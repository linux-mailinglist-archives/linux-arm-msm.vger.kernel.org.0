Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47A04B7CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 02:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiBPB4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 20:56:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245713AbiBPB4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 20:56:08 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F30FABE1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:55:58 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so866377ooi.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=CJhjoTRvxQH3Sl2Ij3V6tCniMMQykN5CyDZxRb/sirI=;
        b=fdq+cchaNAWoAoifG+2eAVbbV+7J+Hi41i2WNBc1VFeC58pjfsH5M1gUHvEDo5Y360
         yXAO3GT0lQDVwTVJW4z1oZzQTVdlBLjnhWSmW32+Euizxmo4/f1RzuZbMnBJslRmZeWB
         L+7DjOS9YTcC5ZuLnFUKxTR/DHGZa98dJXoEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=CJhjoTRvxQH3Sl2Ij3V6tCniMMQykN5CyDZxRb/sirI=;
        b=XBfBEL6ZcqFKiD/gpQ0DZNjF2zB9gCkvKYskQzIRNmknnUMGHwgJJQ5E+q5uOPZhBD
         KzBlQ2aqE2mFB1/HF55ZK0We/QNo8sN/D1JiuAoH1fbNcqnm+amZUgO3dk3nAQ+zo8+8
         zCY/LyovLYtFTSVz/w4WjNYSaeRSRkMM/60KLCZsPiUxKjesAQtgpg6r2q4QyAchqqt/
         bCH+LlLHukn8DJNe++ddcQTvO9FJGdbOd8uobABaP8o/lMscgX0B28GqKd25sZL4FsTg
         RyUFR7aGduU0tVKZvbU1bIxw8KUNJaWNJbAPJ8uuvZAcJKLrP9YsQzHyjwdckKwRiaao
         kYsA==
X-Gm-Message-State: AOAM5334yvQYXJ+F04JZj26QzgtVKkn8Nfg5HmABiUasMkGIGGANn+3i
        AgT1qJE18fJ8VChrunHOutnK7J0ZSCeFKFz39dpxLg==
X-Google-Smtp-Source: ABdhPJyF5QYowjU/VMhTob8LvbXIC/88vksqTiwGpPS2fwzuECy1aS/luIlww3Ts6x7SDjX/hk5y30nQU7ratUWjRBk=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr276529oap.54.1644976557620; Tue, 15 Feb
 2022 17:55:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:55:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 17:55:56 -0800
Message-ID: <CAE-0n51AZ4Phzkw_rmbxApSGZRUFyp8wuy7=EgMiM_eFkjeJRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

Quoting Dmitry Baryshkov (2022-02-15 06:16:36)
> DP audio enablement code which is comparing intf_type,
> DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
> Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.
>
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
