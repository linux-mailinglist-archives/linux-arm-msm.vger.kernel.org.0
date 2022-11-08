Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADA96205BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiKHBXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233121AbiKHBXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:23:08 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0851C906
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 17:23:02 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a5so20262692edb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 17:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=huQuPYkl7U+LTfPaignW2xikp2tMlS/JRi7V+K6MHt8=;
        b=irTny37RkM+fGVHhNgcCBJ0iTlIIPXy+dgkSvu7tYO5TGRTQCbks4PWN65k63oXT+5
         jGRQHWb+zGLrTTmThs65Dup5b/mmNc7pV8yHJsJ/mw1/TVYWLGLi5wMvo294yHZ3Fct3
         wc3/hzieeFRLBlrXiJbqEFDE6P27lTrXB1lYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huQuPYkl7U+LTfPaignW2xikp2tMlS/JRi7V+K6MHt8=;
        b=BT4X9vLPp9pZZWSRICeK0RbthFe6PgCqlyr0xSYQhryooDvK1AOq04hwQQWJJDqn6t
         LautyrR1aTqzvyuqe6bYPmkv4nv/2lqCSFFdVzEWOkqM2/Zc9DLOXOFtRmnjgRcRJ0Z4
         C+p+vLyqxhkPDILUuyEXKRHUE6TcntcifKcT7j15oCFhe5p8JI+WfB2g/c1ZWXQ4Z4BQ
         lr/mQ12c47FhqGS7FeBgV2d/v5QX/t2kNQwWzxYgipcgbrqTheabJZIRRR8A/kDmPZVZ
         pLViS4I5wGFv3B1g+aT3OeGhLpsaMfG1Lg5N6ccE2NAnN4UhBmBpAM0oRQPbvYmk3T7I
         cxFw==
X-Gm-Message-State: ACrzQf1XIhKWZDrxw2JWK5Mfw6Fqlj5s0uDxoWbkjFnJpdeHF3X1AUL3
        rCts8jCTCfnRS18jjBaiX2qwG/sWVfhKxayN
X-Google-Smtp-Source: AMsMyM7Vr0pHfvwpKIA6rhtOoqRNcaqVI0YciOrual/sr3j+TXZoSuEkcSS3eMgx/jf963vg55GgjQ==
X-Received: by 2002:aa7:d40e:0:b0:463:3844:f160 with SMTP id z14-20020aa7d40e000000b004633844f160mr48223893edq.296.1667870580539;
        Mon, 07 Nov 2022 17:23:00 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0077016f4c6d4sm4044616ejb.55.2022.11.07.17.22.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 17:22:59 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id l14so18740501wrw.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 17:22:59 -0800 (PST)
X-Received: by 2002:a5d:4410:0:b0:236:a8f9:268f with SMTP id
 z16-20020a5d4410000000b00236a8f9268fmr33789345wrq.405.1667870578850; Mon, 07
 Nov 2022 17:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20221107191535.624371-1-swboyd@chromium.org> <20221107191535.624371-2-swboyd@chromium.org>
In-Reply-To: <20221107191535.624371-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Nov 2022 17:22:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJEkNcWWFExQsCD5SXvH_YvoK_K6mtFB0_ojDSNLP8Zg@mail.gmail.com>
Message-ID: <CAD=FV=UJEkNcWWFExQsCD5SXvH_YvoK_K6mtFB0_ojDSNLP8Zg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Fully describe fingerprint node
 on Herobrine
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 7, 2022 at 11:15 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Update the fingerprint node on Herobrine to match the fingerprint DT
> binding. This will allow us to drive the reset and boot gpios from the
> driver when it is re-attached after flashing. We'll also be able to boot
> the fingerprint processor if the BIOS isn't doing it for us.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

From Bjorn's recent comment [1], I think your subject needs modification to:

   arm64: dts: qcom: sc7280: Fully describe fingerprint node on Herobrine

Other than that this seems fine and is a better description of hardware, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I guess we're still leaving gpio77 alone (AKA not describing it in the
fingerprint regulator)?

[1] https://lore.kernel.org/r/20221017224853.stuy5qeqxjxntob4@builder.lan/
