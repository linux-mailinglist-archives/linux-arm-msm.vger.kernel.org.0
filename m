Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6ED654FEFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346458AbiFQUxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383572AbiFQUxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:53:09 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EC5193DF
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:53:08 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-100eb6f7782so6942033fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pOJ0w1fx8TDvU6Wqqk+kju4f/j2XWysLUuPMKoQ93WQ=;
        b=BCibZwkwaWdmHbyckK1itupaySjS2gpljASTEwZsgmFNvWfcv7hFIh0Q6nCCPGNLjx
         /i/TFOrHBgEmtJlicNOVI2xEFcbx0/J45Y/oeZcqipsroldorlI8/h02GBcyDQ/k7b5d
         a019+LDOh4MT5bMtUHPCY/jUDuG4Zea/gCL30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pOJ0w1fx8TDvU6Wqqk+kju4f/j2XWysLUuPMKoQ93WQ=;
        b=bTdyjLV7x+oy+4E8MVhwd5mQ6FU2FZClbupu6eRak3eizzskejeHwudoYvQtdVuhdB
         0UfZD2cycVCHblG7gQYJGkajaeAXQwl0LMV6i2puba6GYK0LWtazFFZIWQ6WWlF/ASJV
         8xjlDY729CHYcvykj0xRAL/66JpvaSBaEAQVZe3yduggS5D/6Kn1YLV+o5/P1PGz+M1P
         mWpUKAjScP7fC5eGEmglxS6zqPJlaAbPXc0NPaRsfPPfdnJgHU0EErpKmCeweb2I0Vbq
         bPJuAMUX+74vqPS/AQawYp4/IFrHvbrw2grpwRPTpgecoHwkoJQPF5yeJTaVbL/+3hxv
         R7xQ==
X-Gm-Message-State: AJIora+qxV9nW/5oyK3FuHuh7cAZCNLIQDLfZ8kUUDLFi5XZfQVgBz9U
        jeGzCF7yKd1XZZ0nhzo5y+2C2bZu46LW2frV1EClog==
X-Google-Smtp-Source: AGRyM1tHrKeZbF6x4Ph4v2TGhIyG5/H7CB4DpNOnp0o8Y+JdhKEu01LNai/uLjNuxsjXcEVC20rNgdoz+JZY07qm7Bc=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr6279169oap.193.1655499187407; Fri, 17
 Jun 2022 13:53:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:53:07 -0700
MIME-Version: 1.0
In-Reply-To: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
References: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:53:06 -0700
Message-ID: <CAE-0n507ro+ZDAi8eoYbXjuxeT8SB-viCbr3Fh3x9QN56UTLrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: drop empty bridge callbacks
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

Quoting Dmitry Baryshkov (2022-06-16 01:50:54)
> Drop empty callbacks msm_hdmi_bridge_enable() and
> msm_hdmi_bridge_disable().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
