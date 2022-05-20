Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2797552F445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbiETULr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbiETULq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:11:46 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34302185407
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:11:46 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f17f1acffeso11511302fac.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uCSJrMcblYtE68pI/o4aCmCDuyMBMTIK3XeFUPvOxus=;
        b=Aod2ILs1RijYKXW4aXOU2BMwT5hq9+n39aXCSNpVCSiKiV2mBseP2mnnLb2FxS2Mwt
         Q+miDEFv/E1MsuY0ay93RhZoZUTIMenvnIsznz8ZpLD8gyRukPy7eMXtndRB88hXyCzx
         I+KHm+DSXBvQFXaHFU7xEQJL28LCFHnGlgQ5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uCSJrMcblYtE68pI/o4aCmCDuyMBMTIK3XeFUPvOxus=;
        b=sa0Z5Asf6dWT4VsD0Y3XTuJTQOYtJAlTrr3KtD+I6R1+jKC4z7TwDgVrJv57I+pwBm
         NU13Ifz0fJtbO0c14lwhnkWJiQH9TP4QbEgy1YQw1pxM8RTzt02stqSIK1HO9O02mzE5
         y6px92kdxX7+4R53VrUgAqJkCb3q+5tDQ02XyXM4ZhurNvgfpN/dJ06LCPGqsaegZ2Lw
         ovVPJTJ0tJyBrhn+xaMO1SmrpBF9FXOOz25GQmA9lIafPEJnJboY93PJIp44fYihkRp4
         Ri8mnthNrUTllaz0kygheN1u2TPSBBzhMA9XQISphY2+QGazRGeNN3CStFG5T6U5NvWD
         4WYQ==
X-Gm-Message-State: AOAM531oNcVZ063wsvH/mL3gCAbtW/CpEm7tgs9P8SID2DLZQVrng4nm
        02ICYd1vQKLDLxCW5bJqdPr8RXlsLFGQvYQiSkuAIA==
X-Google-Smtp-Source: ABdhPJyZzp8Z8QM9GBZRwRI5IW+g6D1RrMyMk90vlJpNz5rkGtSO8wMKBpy5TYZYX78MlQGpAiU3hd3sIjiNZZb4lms=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr6766673oao.63.1653077504534; Fri, 20
 May 2022 13:11:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:11:43 -0700
MIME-Version: 1.0
In-Reply-To: <1652804494-19650-1-git-send-email-quic_khsieh@quicinc.com>
References: <1652804494-19650-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 13:11:43 -0700
Message-ID: <CAE-0n51_Bp50XbjvA7-4ZAf2ReXbRCWxt3wLe3tcqAeUKjE2kw@mail.gmail.com>
Subject: Re: [PATCH v7] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2022-05-17 09:21:34)
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller.
>
> At current implementation, dp_ctrl_reset_irq_ctrl() will software reset dp
> controller but did not call dp_catalog_ctrl_enable_irq(false) to clear hpd
> related interrupt mask bits to disable hpd related interrupts due to it
> mistakenly think hpd related interrupt mask bits will be cleared by software
> reset of dp controller automatically. This mistake may cause system to crash
> during suspending procedure due to unexpected irq fired and trigger event
> thread to access dp controller registers with controller clocks are disabled.
>
> This patch fixes system crash during suspending problem by removing "enable"
> flag condition checking at dp_ctrl_reset_irq_ctrl() so that hpd related
> interrupt mask bits are cleared to prevent unexpected from happening.
>
> Changes in v2:
> -- add more details commit text
>
> Changes in v3:
> -- add synchrons_irq()
> -- add atomic_t suspended
>
> Changes in v4:
> -- correct Fixes's commit ID
> -- remove synchrons_irq()
>
> Changes in v5:
> -- revise commit text
>
> Changes in v6:
> -- add event_lock to protect "suspended"
>
> Changes in v7:
> -- delete "suspended" flag
>
> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
