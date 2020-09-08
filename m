Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003222620DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgIHUQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbgIHPKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:10:01 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32662C0076D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 08:00:17 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id b123so9154484vsd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJRPLo+J0AriJzHTz4tB+cqM6v8af2cuqs5qOTFB1iE=;
        b=XIEgSW1KV88kuUzhoRuadz6lGFrG4VliZ7auCmMMAlPJEGo9Fv+rD3RcpZVWzKa/jC
         Hc4MsaNyKgjUL9Gn6+/+FjrCQay1ygjM05S2Fmb4xe4LHoXfPt9CFBa2hoBZZIA4/sCO
         Um5z7+bxy8muKu9ywGVyDQe/KVjKJh+B916q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJRPLo+J0AriJzHTz4tB+cqM6v8af2cuqs5qOTFB1iE=;
        b=cctbE27DAkZPctF2VN/2C3+Yh+TkvqwO08xCScUwhP7CvUgJlXTLZksZ00XpMnZg1W
         mPnNpDcmFX5jq40NyzH19OcO19tGU9Gwv7ZTDK56xISX098cgXkqEvpACxBt6ToGWKza
         xgHGUuKhSEpUluYqqIuppA5ZElfmXmh/7H0K3ywXUpzxzIU6QMtjSq+U0Xn0iDd2pKHL
         esB1BZrYKxqedicZgB7Zr4zFI5ZHUIPqjrC5Q0hS4r5K4piQ5wvp6o0ozRfDQxZjBWF+
         JRXwXOtdfVbliAPgzxVvJYDnQqkd7V64zEF3Nk5gwO8cYyyIw+QwsAKMqV0snQjC/b/g
         PyJw==
X-Gm-Message-State: AOAM530HP8YFWqzwGelloTWAW8WELuaDMBMAgVxsfDinImqS4TT0an/i
        x29US1SbroMvXq66XXm8wI5r5PbgPm8TFg==
X-Google-Smtp-Source: ABdhPJwjwAFlZHG8D+Stdwih5Tj40pdqNJCiE0Axe4Gu6fJyf0luL2b0DPLfiPerTLbuOGN3Q9jViA==
X-Received: by 2002:a67:bd19:: with SMTP id y25mr14759969vsq.14.1599577216137;
        Tue, 08 Sep 2020 08:00:16 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id b17sm1289744vsr.17.2020.09.08.08.00.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 08:00:15 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id q200so4123002vke.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 08:00:15 -0700 (PDT)
X-Received: by 2002:a1f:e641:: with SMTP id d62mr15027301vkh.30.1599577214628;
 Tue, 08 Sep 2020 08:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <010101746c377537-ce93e925-598b-4dce-bb16-4cda020f4d6f-000000@us-west-2.amazonses.com>
In-Reply-To: <010101746c377537-ce93e925-598b-4dce-bb16-4cda020f4d6f-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 8 Sep 2020 08:00:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsUopZPHJzHe1+pa=pzKQda0yQKUCtnPrni3Dmx7aV3g@mail.gmail.com>
Message-ID: <CAD=FV=WsUopZPHJzHe1+pa=pzKQda0yQKUCtnPrni3Dmx7aV3g@mail.gmail.com>
Subject: Re: [PATCHv3] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 7, 2020 at 10:36 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -73,6 +73,7 @@ struct llcc_edac_reg_data {
>   * @bitmap: Bit map to track the active slice ids
>   * @offsets: Pointer to the bank offsets array
>   * @ecc_irq: interrupt for llcc cache error detection and reporting
> + * @need_llcc_config: check if llcc configuration is required
>   */
>  struct llcc_drv_data {
>         struct regmap *regmap;
> @@ -85,6 +86,7 @@ struct llcc_drv_data {
>         unsigned long *bitmap;
>         u32 *offsets;
>         int ecc_irq;
> +       bool need_llcc_config;

Do you really need to add this into "struct llcc_drv_data"?  You use
it once at probe time and you could just pass it in to
qcom_llcc_cfg_program(), or just pass the "struct qcom_llcc_config" to
qcom_llcc_cfg_program()?  It's not a huge deal, but it would make your
patch simpler and keep an extra element out of the include file.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
