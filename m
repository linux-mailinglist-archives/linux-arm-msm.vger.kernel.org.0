Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE532699A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 01:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgINXYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 19:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgINXYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 19:24:34 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C8AC061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 16:24:33 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e23so892911vsk.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 16:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X+7ayRJRVcL9E9FgaMmSHKBAwd3QZcH8/3SgPpQfdjs=;
        b=kwZbe8HoMejYOA2ogML+Pn1xAVwI02AXWR37EzjSYBVlQ7oo29ImB354b9HQnU7XSY
         ZTLs54/yF2Zn+vweEuWP86W3Kx1sFTeDFmm2EHHD2tMgRffqH6F6xCPoWAJSdjAsIUzw
         anRHI15T0f1Me495ok/562HIcQzrOtstQ/GAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+7ayRJRVcL9E9FgaMmSHKBAwd3QZcH8/3SgPpQfdjs=;
        b=luOY/w5OCsQru8wXs+ND7hkZHtvbe5kaq/ZiHmb4pmfCRZSNO8g7+tVWfk6NZpuVae
         N+cIjH55C/cDWR9FqRFo/e7BOHkFXn7D8g7zNTpLk8yDSQQSW1zxxpFSApwUEqRBD42E
         XpZ2dq5TZcgj6AIsz4sZlwAKeHhtnShHq/tHWbd4o1+Q+5wl4fPyWLGYF9yOUMqIEyhe
         cHn/pmMDhlGhZHlJpUfkeOY5TsjNuiIF90YR8Raq0THu83/LPqw+5unW8eGqpqNSYQu2
         9rswMtffBA3mf8Tb4Az4uQdw1cbWcQof9pp5Y4hQhEP78SGHPpYi2Roa88Nkchf562ox
         5wsg==
X-Gm-Message-State: AOAM531qXIjRnoeOAcBliAB3OUWuE+JlD7yfxVv3YJ+tJewrKb5s45FX
        U5CAofi9mSheKl0ka/UFhLgY4priT1GNYA==
X-Google-Smtp-Source: ABdhPJyCkMw3OH0QafgvIo3v+O9/yLf/NH+sP7iGkv7nlhEnk1KpDSuUn+biGMRTFQojQH+J5dgvsA==
X-Received: by 2002:a67:8a46:: with SMTP id m67mr9365349vsd.28.1600125872727;
        Mon, 14 Sep 2020 16:24:32 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id j76sm2016875vkc.50.2020.09.14.16.24.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 16:24:32 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id 77so431949uaj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 16:24:32 -0700 (PDT)
X-Received: by 2002:ab0:5905:: with SMTP id n5mr8232516uad.90.1600125871797;
 Mon, 14 Sep 2020 16:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200914232218.658664-1-swboyd@chromium.org>
In-Reply-To: <20200914232218.658664-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Sep 2020 16:24:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W8_ERtKWLQzC_1ZBDeUJPR1+S_3Mt=mA-RCuUB8t0uGg@mail.gmail.com>
Message-ID: <CAD=FV=W8_ERtKWLQzC_1ZBDeUJPR1+S_3Mt=mA-RCuUB8t0uGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: trogdor: Add labels for type-c ports
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 14, 2020 at 4:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some trogdor board variants only have one USB port, so add a couple
> labels to these ports so we can modify them later.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
