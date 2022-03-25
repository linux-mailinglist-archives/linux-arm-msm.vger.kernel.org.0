Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CCA4E7C7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbiCYVXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 17:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbiCYVXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 17:23:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C6615AAE6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 14:21:32 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id o10so17769512ejd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sP4tT+y1Nyf2HgPARYD3SdiY0hWEX6wWyyCR4CgxXww=;
        b=O9IxCB0OBfJyAtquU8TmcdLzHhY1UHZ5SXDNc92sA5+18unsjh45n3YfSphgmmTTHS
         iR2eiVQfqj3IeM6+vxePvlDTcO1kymWAuNNNEV1C3PwG8eoIL7tmPM3GkOtQtd9e6DN8
         tsRQsINeLLgCuOqWci0bp2vvAgXQARjHe9y10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sP4tT+y1Nyf2HgPARYD3SdiY0hWEX6wWyyCR4CgxXww=;
        b=a0nNoWCqy+Be2mUQo6KUsC+lGSQO24WDv1x8BCvqIwj1X++RwOBdzs0eNrwZ42CLo1
         kYBa1AbCKe46GrgOTIY9+lH+0id3aObfoK2/OFMHD4hqLPlx4bcrh+e0NjMZdA+VH7LR
         Zp1Rys/u1zQAGhi1P6mf8tIeLYIPn2pMq/KZouFrMOi+mkVcK9G6kSe4YqNrB07B05i0
         04qz6vXPQ9dSIxkaPOfDGfjBHpkDqQsYfFoA3x78I2EBMDVGAGfHP1wWe6wHmPjFtPxA
         PY/ibkGdaB4HiprnoZGB8SISdxHJOsJvjfOot+cAuiYb+Rgn5RwAeBOUKT+aXb52pIub
         cWEw==
X-Gm-Message-State: AOAM53309LS+xddm5TWHKnlMAONWnkPC7qFYDSXKq5m0ItMfowfUq4Ke
        iNc/rh6n9G8w1V3BUQ2SX0gjSu/sCMrvYC5lPaE=
X-Google-Smtp-Source: ABdhPJzAx4igEPOLVUXtDm0ljFwwZEjJuDOOY1/ThIRTdP4LhWDiuYs5qN4/8hjLaE05CM1j17eXqA==
X-Received: by 2002:a17:906:c145:b0:6da:aaaf:770c with SMTP id dp5-20020a170906c14500b006daaaaf770cmr13902287ejc.504.1648243290624;
        Fri, 25 Mar 2022 14:21:30 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id by4-20020a0564021b0400b00418fc410299sm3261468edb.62.2022.03.25.14.21.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 14:21:29 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id v2-20020a7bcb42000000b0037b9d960079so9722606wmj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 14:21:29 -0700 (PDT)
X-Received: by 2002:a05:600c:4f10:b0:38c:ae36:d305 with SMTP id
 l16-20020a05600c4f1000b0038cae36d305mr21593082wmq.34.1648243289239; Fri, 25
 Mar 2022 14:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220325211640.54228-1-swboyd@chromium.org>
In-Reply-To: <20220325211640.54228-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Mar 2022 14:21:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WL+u5sQLiU4chNMnbxM2n7hgo+fWhHpK=BLOpFtSOW0Q@mail.gmail.com>
Message-ID: <CAD=FV=WL+u5sQLiU4chNMnbxM2n7hgo+fWhHpK=BLOpFtSOW0Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Simply SAR sensor enabling
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 25, 2022 at 2:16 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The SAR node, ap_sar_sensor, needs to be enabled in addition to the i2c
> bus it resides on. Let's simplify this by leaving the sensor node
> enabled by default while leaving the i2c bus disabled by default. On
> boards that use the sensor, we already enable the i2c bus so we can
> simply remove the extra bit that enables the sar sensor node. This saves
> some lines but is otherwise a non-functional change.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi             | 1 -
>  4 files changed, 13 deletions(-)

Makes sense to me and even saves a byte or two.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
