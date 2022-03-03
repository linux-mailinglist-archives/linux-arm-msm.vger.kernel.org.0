Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980674CB3FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 02:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiCCAvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 19:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbiCCAvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 19:51:12 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2532D606D7
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 16:50:28 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id h16-20020a4a6f10000000b00320507b9ccfso4043426ooc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 16:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/2EC8zNvMiYjPaYg70TgRdx3fCegP4HpnaEb1DNrlZA=;
        b=OBFuGz0Ovh0fRb/PVgoG+6iRhtp4Lo5PnJTLPVBDsK3SbG51eTCV9I4bToYGWzzQwQ
         uLhWFAuGVtEUu6Ssk8Uzo1ocqlJ05rCzZpWp6izZ5LzLEP1Ww01xvVoGmkOtrQ219h/u
         wCjoAYhfJqyZV9e8VwkWp+RUhZkYyr03XT89c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/2EC8zNvMiYjPaYg70TgRdx3fCegP4HpnaEb1DNrlZA=;
        b=5PuDieSuW2Sh8nkXAdpXrv4xMQtnLE++6XGy3LRRkjwxBvhfOIaFNg/SiDp3nyFWXQ
         5+3TRJndNJcXC1y2E/V2XjKENQ4gOBhS29fefYaCg21r6nmfvjk/UaKdRkMoytA3APoO
         45fzJd45MQ46cSduCveRG2fg7EMcaKStUWnAv7PVIevwSREHQgPIDrmTQ8ipGc0qHUlR
         xLnFNWkNSRTzLd0HKFwfcU6K21PWiJIeMhmKV7jYLFpn4x8IZ33c/ulOESNm+bLG4jyF
         XQDkzkg2LkpRosuTppN/jC67PTrZAKgKfgwrtnUQtY8I6NpfOUjz23Q5e899dqtel3qZ
         1Odw==
X-Gm-Message-State: AOAM532sOl1EsmVJhGbWxtdEmsIIvOVh5gCcVWTRITjUhbghBxuRgg94
        AEi6pMHPS08NEQDW+YPOlQzpk60xZpgUilSBj7cvyw==
X-Google-Smtp-Source: ABdhPJymMjnJcBkJ90VOhI42XO7hU17YKFFFlRx1RXjtrukwo8gQVLyOc3QdIvx9eR+49WHllUiLCYVPLyMyMvHI2gg=
X-Received: by 2002:a05:6870:14cf:b0:d9:a9ce:92a9 with SMTP id
 l15-20020a05687014cf00b000d9a9ce92a9mr2104667oab.64.1646268627242; Wed, 02
 Mar 2022 16:50:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Mar 2022 16:50:26 -0800
MIME-Version: 1.0
In-Reply-To: <20220302225411.2456001-6-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org> <20220302225411.2456001-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 2 Mar 2022 16:50:26 -0800
Message-ID: <CAE-0n52WNiinbFSaKJKQ7sPwD6SNH_o9tyyw5ig-m0v8svsumg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm: dts: qcom-msm8974: Drop flags for mdss irqs
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Maybe the subject should say "mdp" because there isn't an "mdss" but
this isn't a big deal.

Quoting Dmitry Baryshkov (2022-03-02 14:54:11)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
