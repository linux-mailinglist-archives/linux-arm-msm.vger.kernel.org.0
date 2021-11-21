Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEEF458728
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 00:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhKUXcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Nov 2021 18:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhKUXcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Nov 2021 18:32:10 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0425FC06173E
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:29:05 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so26169040otm.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uawdrL9VOMlIqlvJ0mj5tyfriQh05XU0vtoIzgfnGzw=;
        b=B3a6gp5YyLEyWRk2RBPz4+9gEODV95HoQcpiVwp6PIKpBPC/dm0wRZAqBydbs0IUtU
         Vy4ud2krF6fE1+/NDYoGjMeVbCEMVPFMS+lZe1tnZf0G6ZKVcJIa2NbD5l2qCkWjzXrG
         MFX5m/l9RoOdGEyiASjFLLyM/tAHysbmS8VsgJrTxpRGkFWKfAWx3kVd0zVZ2aL+i9gm
         2gc4cjD8y8eO23vdCs0mblQp9p7KaUMIeFNFCJkY5zP8judtj+sYkv+8cJf+ewNbkyCH
         IYH2El+UGJ8h219SYHJMdsFyBAtcglqPkMJ1pOQ4Vv5tfkq93ysVx+7V4S6x5f65eWAo
         XjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uawdrL9VOMlIqlvJ0mj5tyfriQh05XU0vtoIzgfnGzw=;
        b=lWTleNtj5DrAT9IBJSJxAVghtE2Nj4+yPEcf8BC5eAX3HyLd6haHyBb6RmrlIscnLP
         fcJZlfD1qhRbgKzytxyK4yqxlswjCcVpdStw/KLU08nIkE1Zho7eTjvFv27mQ/vofods
         k4kjv5Whia0dLxcMaVaTpCOapM6gd8gyKjoXS8BvjViOd8l2qBfiQpZ68CUXuBm6/Dsn
         tfhSsyBCWG2c3zs7ywApovxc6qYwCFyjX/dP6vdobRp1hwxrWKHDWLVUBlPkg0TwXxq9
         unfOUk+lHZ7ZlAT0Q6eay9VqO8iF8l30SbrqFx+uixt64wxMUj+OumQSbRg54UI5GrRt
         vdMQ==
X-Gm-Message-State: AOAM532E0Fqg824YMlhSvlA5cUDP9uEf6jbIQeoo7EYshdBO4SVh5CH+
        tExq8MHQ8KHIwsNuNPXTUm+oi9pKgcsjpkIwQj63V65RGiY=
X-Google-Smtp-Source: ABdhPJzaxxQYv3+ed3jVIfR+ikdBi3My7RqP2nQArMaBHdQPUz2wbnV0Ic/1oih14zYbo/y3Ko52yHuTC+/gee84Dm8=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21445284otg.179.1637537344362;
 Sun, 21 Nov 2021 15:29:04 -0800 (PST)
MIME-Version: 1.0
References: <1637041084-3299-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1637041084-3299-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:28:53 +0100
Message-ID: <CACRpkdY8Vw-UGGmFEGzXYd_tVf7Sv252UPrBhd_jmrmW0T7uWg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 16, 2021 at 6:38 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> egpio is a scheme which allows special power Island Domain IOs
> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> TLMM functions with Island Domain functions.
> With this scheme, an IO can be controlled both by the cpu running
> linux and the Island processor. This provides great flexibility to
> re-purpose the Island IOs for regular TLMM usecases.
>
> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> which shows if egpio feature is available or not on a given gpio.
> egpio_enable is the read/write bit and only effective if egpio_present
> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>
> To support this we add a new function 'egpio' which can be used to
> set the egpio_enable to 0, for any other TLMM controlled functions
> we set the egpio_enable to 1.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

This patch 1/2 does not have Bjorn's ACK but since he acked
patch 2 I just applied both anyway, Bjorn if you don't like this
just tell me and I pull them out again.

Yours,
Linus Walleij
