Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEAB54F617C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 16:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbiDFORO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 10:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbiDFOQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 10:16:56 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EC246653D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 18:58:44 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-de48295467so1447613fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 18:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DIVGMsVz0TJ2gV9WgOfFFiA5gprB53tRsUuj8i64WaE=;
        b=IVl44d/QhSPb+vA65mjFI4QChRvBC65acN6oulekqU11IURJUXLWGepW0IbWIkETJy
         +WrVrlZdgkcjdpCGWe5Ypk8BbFo4Srsdx5lGVYum8opBfgNK1ukiEaUzavcB9V0i23rJ
         iGmIv0l4Ztmr9owj6F0mBxOG9orcs5peuCsOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DIVGMsVz0TJ2gV9WgOfFFiA5gprB53tRsUuj8i64WaE=;
        b=mCuAeD4kyGtl/gruklpkpvJlsWfgO2eJRXg/TCooDks0uIe3IPfNUNiZWMXYbG3Cws
         wZ3t9yevX6Jgd/SdOsndbD8sh6wheqqR5yFzRIpq7FfO+JaxgfBvheH0AgzjFVUCxgkn
         NTgIk4iVPpP7KrQ6XDk2eowZ1i9OFAm8tYIZfZxevCXy/RaWilDzzRPRvSyrarIDlqH4
         kKR1ccv7U2mAQ3nC0qdIxddQJQ8oOE2/k2bihSvQri23hYq8nlw+6f2f/cOzkUihdldN
         Dgqo8OL/m7uWSYwfGT4PpGP2Nbgb1uIwIUUIRdw4dENRXNCchNrQIG8C/ECj3oUC0tNk
         VfdA==
X-Gm-Message-State: AOAM5324C7T8I//KzBk32hajycGtPeTRA9gRcumlABUJYBs513nMIcad
        s9KTZ0+v6DQXoI+F47Hxq8Bu4XiXb8lRzrN8lfSvFXEToF4=
X-Google-Smtp-Source: ABdhPJygRyk6aXcwBIkmW3sXOMOwd//3/kqvY2L6PMY2iOeU+lK9xBLITJ+JWL6zDwHPOXhk4dBea47tvccNlzGqjpY=
X-Received: by 2002:a05:6870:e314:b0:e1:e5f0:d777 with SMTP id
 z20-20020a056870e31400b000e1e5f0d777mr2777654oad.193.1649210324223; Tue, 05
 Apr 2022 18:58:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 18:58:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org> <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 18:58:43 -0700
Message-ID: <CAE-0n50gmcGrqj5p92tdTe4cyqhT4kiucRahnuLAuNtbZmXWDQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: make dp_connector_mode_valid() more precise
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

Quoting Dmitry Baryshkov (2022-03-30 15:30:08)
> Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
> than generic MODE_BAD in case the mode clock is higher than
> DP_MAX_PIXEL_CLK_KHZ (675 MHz).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
