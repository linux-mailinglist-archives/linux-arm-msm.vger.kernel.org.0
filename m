Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E841754FF00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348606AbiFQUzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbiFQUzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:55:02 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F2D5D645
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:55:02 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l24-20020a0568301d7800b0060c1ebc6438so3926578oti.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=liQN5qtUNa2mM5mknDTOFWHHb8rU09mHks8H0tyK+vE=;
        b=J/KAuPGEsivDv33XuIq2xTcMGgDRqhWxAoD+Tzk+nDWGl9jDGTOWTx0nunPwD4byDk
         FaeETdidas6GwYYNf1qBFXlMcUPvUXBOHATyBbGzeOHRWh76uVa1SqUK1Kll7jRZIw75
         m1oOrl/2PfMWsQC460Gdx9AksE90kx/JDqn1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=liQN5qtUNa2mM5mknDTOFWHHb8rU09mHks8H0tyK+vE=;
        b=DzY7i72InlKpXaA2UPD9SD8lMqentMp3oiSUH41JU//pm+jScRAD8QmDjLHaNCflBa
         qs2tmr2UdICbeJMpD2woEwVOSLWzz+jdrNzCd3N2jqPvZo+buh35lNutvy7sT39wTrSE
         l1z/R2L1DMoJaUAYlUomji8D0QiNEq21Lm8wRJZAloZ9YtuW4ekcRwh/QnE+5iZb0S4j
         SmhTcOzyzxAp1McQxe+by7Osvx7Bvt3uhYMA/eAsCzhg9NLpVuwuUtO/htNtC0Tm/2ob
         5Bpyo5S4yCTJY4OebKf5tPPWgf7356YWu3/6nkPx7vtUwqOLd9hdE+4sgCfswhRZk1H1
         j+3g==
X-Gm-Message-State: AJIora98JAgy9yLqCpYre4J+oC6FG8WDQPWA+OlN8XOqsDeGieXd3Ssa
        yl24L+QJK+hCUrNLPpigH/AjD06G5CsRbpkYgyesDw==
X-Google-Smtp-Source: AGRyM1vP9nApPqYwQndj8FDnlRLdyc8637CAsZQ8w99xEFsa/MBvPzT9PmZCzFl4LEkTZBvNBWJiuG/QFQco0VTetAk=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr4957121otj.77.1655499301490; Fri, 17
 Jun 2022 13:55:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:55:01 -0700
MIME-Version: 1.0
In-Reply-To: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
References: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:55:01 -0700
Message-ID: <CAE-0n50Mrq=iwoEx60uyv7CKXWYJkjMZPgYtNnmfpKka_y3y5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: support attaching the "next" bridge
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

Quoting Dmitry Baryshkov (2022-06-16 01:50:57)
> There might be a chain of bridges attached to the HDMI node
> (including but not limited to the display-connector bridge). Add support
> for attaching them right to the HDMI bridge chain.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
