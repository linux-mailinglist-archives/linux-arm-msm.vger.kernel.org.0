Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7575B1179
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 02:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiIHAmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 20:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiIHAmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 20:42:02 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EBFA6C1A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 17:42:01 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-11e9a7135easo40289054fac.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 17:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=6kh9ikwWaThXq4seCLNDajay+f1HdBOkIbkGH9umXJw=;
        b=kvBYxdrbSayvPbBqEk92BZ7Z8UmortMyc2HyEOsM/6KOEBt/U5Oo5+olLwauurChcT
         dWbN6R2iRtz19PlqNfH8x/NJxV/Rehv3/XPsPajdRvXc7+iUSk5Vx2JyIAvYcYlvMAjx
         2oc/JST9OpF8IBS4yY3vZ8SRdKgJKMVaO7KJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6kh9ikwWaThXq4seCLNDajay+f1HdBOkIbkGH9umXJw=;
        b=SRr40xdi1QWmp9pRGe1KRFG7IsVVqEWUzHmvMeC5CYJ2uCMmQjn9LxIpcr4fwCuYO3
         84fz25wzXf97dYzZY43NpohxnuPiOPpVP1GkI2u0dwvrhccWPwQ910yD02YcA/ghWYGU
         knDU4+CbEXxDBs1NEFwL+GMPWtXzNLF7KlgVKJG79/zZxhvPToUC/uCvDs+OTPC/J/Qo
         gNdCjPBfD5Zk+dM6zzigGjxduIO8psYBLQcebmxV6QK3kFwjPQ5UtZn+ziIBfg4UEb0k
         K1zIhra6QYXEQoZTXB/c4hq82D/bmRzOeup830eeaef9F+DSxeFzjeiIQzbD/1vwrmN+
         7W1A==
X-Gm-Message-State: ACgBeo0SthQJ9FrrJXIaoE6EtGxeer+JeiI2XgJLZoqBz2V51INw3sVq
        K9aX1RVvCceHNy9Ymq64F/488cxR+X5CTx2UmwrTow==
X-Google-Smtp-Source: AA6agR6GDd4jOsqjCzVR3yOFzs56YJqWoGpuOidx2GfpBymcQROdS9Bv7Prd4st7kf0kWSuZiyFu4xIeT7K6tYmo5N0=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr597166oao.44.1662597720814; Wed, 07 Sep
 2022 17:42:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:42:00 -0500
MIME-Version: 1.0
In-Reply-To: <20220901091527.1992208-4-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org> <20220901091527.1992208-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Sep 2022 19:42:00 -0500
Message-ID: <CAE-0n51Wh=pT4G=QRFNu_v5hMQRvS55sGWKT=zvrJS=nSB4Tng@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] drm/msm/dp: move dp_request_irq() call to dp_display_probe()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
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

Quoting Dmitry Baryshkov (2022-09-01 02:15:27)
> As the MDSS registers the IRQ domain before populating child devices,
> there is little point in deferring the IRQ request up to the
> msm_dp_modeset_init(). Following the 'get resources as early as
> possible' paradigm, move dp_request_irq() call to dp_display_probe().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
