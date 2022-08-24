Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1588B5A0370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 23:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiHXVx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 17:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239586AbiHXVxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 17:53:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2985754B0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 14:53:54 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u15so27382187ejt.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=e0BBD5TlKOKblZMGz0uca2eTu4Q7+zmoU/TJNY6Fw4M=;
        b=kbg01HmT3sDmroGWqlHtDMn6Q1s0LnzIIPuPdtBFLvMNwsL0ULIs7afs/n/byMDq/J
         Fgd3oMzq7tnWcK71oLPxAFSc/DBJYZfeyQzjaztKzH9qCEqwfF7BPtnc17KjdxK1Arie
         rSaziN52MxfLVXBKGlzcX3z3PP1cuaYr7+3bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=e0BBD5TlKOKblZMGz0uca2eTu4Q7+zmoU/TJNY6Fw4M=;
        b=dMwcOieGM0+VAuJX+/NK/74zjMSZoOsQpNJoO3Ek/mOYg/MHWDMon2UsSkZigQ8dRN
         /EKUFbbQpWvE7FeidPinjl94IjrS5Tbcj1oYDaK8U1V3t16ZrksOk5DFfj0ccwiIXm9V
         scDBLOvDdVhHCkwEE1GQee2bMEu/RlfUWwZ9nHBmBBUKbd7SeRi5WgUcxBNK2cZ2OGkS
         DvI0u4bBnZ3W8jKHV3eK7ylaEisSxHPbcBgBGkBMdgXHqbEQBuH40to5lY9fEzOabU4a
         qieJXyEV0XMZ1QAf2a6OQjgh7TMZIoIv2b95y+Gwyyee32hS4T1uCSu7WyFPZtRbt+Sf
         XbyQ==
X-Gm-Message-State: ACgBeo1Wl/9Zs0wLIZWjl7sq3J3tO6DCVdteILvgud9eZwTLu33O8hEV
        ytv/Skljkisor69Bw42NzLZyAuxVlRJGY9xv
X-Google-Smtp-Source: AA6agR4/S5CDrWmx/YPDCzntBlMLIJEhKJkTOQNwc7/BF/zHfSmxeq9gAG/9IL5qTE+GGXYUbTiI1w==
X-Received: by 2002:a17:907:86aa:b0:73d:670d:3f8f with SMTP id qa42-20020a17090786aa00b0073d670d3f8fmr539248ejc.723.1661378033523;
        Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id lb20-20020a170907785400b007300d771a98sm1618367ejc.175.2022.08.24.14.53.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h5so21541814wru.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
X-Received: by 2002:a05:6000:507:b0:225:5019:803b with SMTP id
 a7-20020a056000050700b002255019803bmr564865wrf.617.1661378032767; Wed, 24 Aug
 2022 14:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Aug 2022 14:53:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWP1hgvpGN=62d585GOsT7+399N9DSbne_7XNwza00Uw@mail.gmail.com>
Message-ID: <CAD=FV=WWP1hgvpGN=62d585GOsT7+399N9DSbne_7XNwza00Uw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 24, 2022 at 1:16 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Changes in v2:
> -- fix Fixes tag's text
>
> Changes in v3:
> -- fix misspelling of "Reviewed-by"
>
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
