Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D8852C542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 23:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242836AbiERUxn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 16:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242788AbiERUxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 16:53:42 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0681620AE6D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 13:53:41 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id m25so4187869oih.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UNqWZZ/W5ko5bopxO2cXE64dq+vAay+pJVcB9JPEK7k=;
        b=MZU6ZApL+VJ2nR/SOYL+8sNV8dz7t8gWj15O7ujNs2F9Fz+Vn9RCogVeN1vvAnRWRS
         ilsC9DGDD64NEGVFzpPB1wzxKAVfzks8J0UC+0ZH1/CCa+nGcAPbTMg0RH+kWk0nCnip
         XhfMZL6B6uOhpLcXD57lGxIbgFNNO8i1wISrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UNqWZZ/W5ko5bopxO2cXE64dq+vAay+pJVcB9JPEK7k=;
        b=0UpOWf3eXFpats5VyW7+4ffM6LMjBKYXhxZgQLR93TUEeajfsjabVEMaxfsRah67Th
         NyQYdjvH/P4WFKNmyU+vc0B6NKuO3YZCz4d/UF6zcOdtGSDHDQjIVajNlfwXMHvoZcuV
         rP4dlwz6m3tUrlk6ZgyojUGcdI/rMLKvtmBrA+em/V9rBvQJRya6WJPazkxd6WZtTF0p
         YRCcxS8cOdE8CatlaaQCuurxTsErKFPZ1pzRG0TC48FtTn0tqqzcG91ZygIgsfJFp2sV
         UqJfx27C9gn7TnLGs8tNr7FgYbJHQfZm25Mq8jgAITYw3w499nkogKcud1gasIC0rSbH
         dJsQ==
X-Gm-Message-State: AOAM530NII+UiufeBHf3m6Ah5rRzN4gN8sMo6emYsyFBNy31zJfGLiDd
        c7X3jUKMJidt5g81Ncl2eLko/6N/Sy1uafP5Xo+bqQ==
X-Google-Smtp-Source: ABdhPJydobKed7t7rxB1Dk5wydK9YkQwNJ01ZtS6wCryK3YwFULkGDQ1slIBbwUS+XCTTygMr92gMAt/aKu+AoKQ+Hw=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr892931oib.63.1652907220416; Wed, 18 May
 2022 13:53:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:53:40 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-3-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com> <1652905444-10130-3-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 18 May 2022 13:53:39 -0700
Message-ID: <CAE-0n53o234QGNiDZ20Bmtrxcr03wUEbTgM82i1-sF4VhT=JsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] phy/qualcomm: add regulator_set_load to dp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-18 13:24:03)
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Changes in v2:
> -- no regulator_set_load() before disable regulator
>
> Changes in v3:
> --  split into two patches

Same changelog comment

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
