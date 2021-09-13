Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F18409DDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 22:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242952AbhIMUHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 16:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348082AbhIMUHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 16:07:48 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC3EC0613A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 13:06:10 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso15013407otv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8JlT5JO0f8nryHiaEll8oiHPpQCulxYXgviYtcuhVxo=;
        b=kQK19oR/tRPgDwwinGrctqV/cjYE/BHCVlg9i1sPNtvaHnhPTv6PufYg07FCpwujoz
         NPHcty65gIJY/rRoQASOYq4YAXjCzO8ruiwMNV9kLIGZIFClyOyZiPPiOchUbudJeN9e
         yM2gf18ELsJwMfLsUTHPc0WMwjAOJoTjBK2zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8JlT5JO0f8nryHiaEll8oiHPpQCulxYXgviYtcuhVxo=;
        b=umgOdzQh1TUJ7ra1mOBjVfmh3FvsE57/M8A4sjkQXPJ9L+7T7/r/XxjtnhBxpRk6S5
         4rUXbNHwPuh7fjfyMbtp5XCBqKuPKqwlsvg4s1XIRgvGumDY3+4d6cY4TsE35Vl1Irkf
         gdfgHR7ZcEfe+fFA5h99KnDZs/agYekNFd5ljnPcrAFc57EmoR9wbIoMPJ/kftWV4opB
         p5fqH+jl28XtsRP++K8xIdPdjlMZKUZ90/SIt7sH2eIRLkTeLsEh2NBJFnBTLz/GevMr
         RMXInkeGaGzJwEfOCaKvsfW6rn7PM4UGB36V7AMoNDv2CpXsX+5v0lSBQviAM0uQev8K
         8nOQ==
X-Gm-Message-State: AOAM531pNAN/qcTee4FPcHvmnYEW4GbmTRaA+sMxnXIrhsDYBuCVoAVK
        1O6Ol6ZZ4NVSTIPhTQs3mauFUcH6QLxtPBfW5fEZFA==
X-Google-Smtp-Source: ABdhPJxgxKme3xoUGCx5xyhrZPhc+XqJ9apKSj199UxcUSc8rkyCSP5ymrGxutXE0sY+CvdylfwFOBKRbqVanKrarNw=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr11195587ots.77.1631563569866;
 Mon, 13 Sep 2021 13:06:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 13:06:09 -0700
MIME-Version: 1.0
In-Reply-To: <1631223065-12607-1-git-send-email-khsieh@codeaurora.org>
References: <1631223065-12607-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 13:06:09 -0700
Message-ID: <CAE-0n50P2OR9CPku3qq7+xR56fpg2Y7JDinikkY+uX6y9XtcRA@mail.gmail.com>
Subject: Re: [PATCH v3] phy: qcom-qmp: add support for display port voltage
 and pre-emphasis swing
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-09-09 14:31:05)
> @@ -3757,16 +3796,14 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>
>  static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>  {
> -       /* Program default values before writing proper values */
> -       writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -       writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> -
> -       writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -       writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -
> -       qcom_qmp_phy_configure_dp_swing(qphy,
> +       if (__qcom_qmp_phy_configure_dp_swing(qphy,
>                         QSERDES_V4_TX_TX_DRV_LVL,
> -                       QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +                       QSERDES_V4_TX_TX_EMP_POST1_LVL,
> +                       (const u8 *)qmp_dp_v4_voltage_swing_hbr_rbr,

Surely we can pass a 2d-array to a function in C? We know the size of
the array is always a 4x4 so we could enforce that in the type so the
compiler complains if we try to pass something else.

> +                       (const u8 *)qmp_dp_v4_pre_emphasis_hbr_rbr,
> +                       (const u8 *)qmp_dp_v4_voltage_swing_hbr3_hbr2,
> +                       (const u8 *)qmp_dp_v4_pre_emphasis_hbr3_hbr2) < 0)
> +               return;

It's void and this is the end of the function. Why is there an if
condition and a return?

>  }
>
>  static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
