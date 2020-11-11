Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141B42AFD08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 02:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgKLBcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 20:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgKKWvq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 17:51:46 -0500
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD22C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 14:23:40 -0800 (PST)
Received: by mail-vk1-xa42.google.com with SMTP id d191so858682vka.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 14:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DnpRf3DpQZWPCc8K1L4I004+4MFqzM2ZdFbLNwwHnYw=;
        b=C9k51AwCxEhPRdeOTRakEQTuFFOQh4UZkwHCz1URxF01p2AOtXY84wjFUBZ43stsfn
         LYvn0PUhMDdNs4dwckpA3Hg6lINDOc2zIzXRILApPx9B4pT1moEvZ7weshsWRZf1CUEq
         W+7naCTDF4POLE2bhgaEEUARcAhnDvxf7N3Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DnpRf3DpQZWPCc8K1L4I004+4MFqzM2ZdFbLNwwHnYw=;
        b=uIHSK9B1Ffqa6zrNnb+jpiU4q0gQud9hdtc2TJY43SbcgsMLUfQCodFonCOt32YvtB
         ticzquEYA+NCRTEYB1TkohbyIaRfEV4fAzmjef7o9aBsA428m6MNKQrMLT9jsU6neMXG
         jWe9IzffrP9Cf4Z4AUwgfJo+rIYCPQwKt1Z0hR9eEvAsh2XMVNKxrwEcxt97phhlTIgn
         +a12fh6515w3lTHDq/qVXWDWKlVGZ1mb2QPGvElNMVTdGmZIxN2WvUNClhZae9pmgh3x
         7GG5fBhdWzyoiQUdVackTx3d37uHbctWngUSMdlMV30aqeiblRGluwpjebbe2R2H9QDn
         wphg==
X-Gm-Message-State: AOAM532EUiqBBcW1uRO6TtKbSB9Sz0Wc7Vdxvf+5V69HglAQ5gOhqOsK
        1LNgiX0odiTcZz+vhF+V9PVhNS5vT+iF7g==
X-Google-Smtp-Source: ABdhPJxfCNrcaWwGmKvz7W5iBxLRoobByaZPt6TdG009n4qFOB2BIwG9Zm8gDjwQqpQw00tvoui7iw==
X-Received: by 2002:a1f:c8c2:: with SMTP id y185mr15968465vkf.4.1605133419231;
        Wed, 11 Nov 2020 14:23:39 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id x131sm423013vkx.39.2020.11.11.14.23.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 14:23:38 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a10so1221174uan.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 14:23:37 -0800 (PST)
X-Received: by 2002:a9f:24eb:: with SMTP id 98mr14362417uar.90.1605133417432;
 Wed, 11 Nov 2020 14:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20201111120334.1.Ifc04ea235c3c370e3b21ec3b4d5dead83cc403b4@changeid>
In-Reply-To: <20201111120334.1.Ifc04ea235c3c370e3b21ec3b4d5dead83cc403b4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Nov 2020 14:23:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6fFoEdj8bSQmz4fAJwLvzY0o8Vd+E0fknZaLTq4ZQnA@mail.gmail.com>
Message-ID: <CAD=FV=V6fFoEdj8bSQmz4fAJwLvzY0o8Vd+E0fknZaLTq4ZQnA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Set 'polling-delay-passive' for
 thermal zones back to 250 ms
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rajeshwari <rkambl@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 11, 2020 at 12:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Commit 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode
> in Thermal-zones node") sets both 'polling-delay' and
> 'polling-delay-passive' to zero with the rationale that TSENS interrupts
> are enabled. A TSENS interrupt fires when the temperature of a thermal
> zone reaches a trip point, which makes regular polling below the passive
> trip point temperature unnecessary. However the situation is different
> when passive cooling is active, regular polling is still needed to
> trigger a periodic evaluation of the thermal zone by the thermal governor.
>
> Change 'polling-delay-passive' back to the original value of 250 ms.
> Commit 2315ae70af95 ("arm64: dts: qcom: sc7180: Add gpu cooling
> support") recently changed the value for the GPU thermal zones from
> zero to 100 ms, also set it to 250 ms for uniformity. If some zones
> really need different values these can be changed in dedicated patches.
>
> Fixes: 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in Thermal-zones node")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 50 ++++++++++++++--------------
>  1 file changed, 25 insertions(+), 25 deletions(-)

For further context:

https://lore.kernel.org/r/a4be2cf9e51e4f40aae3f9a56989a42f@codeaurora.org
https://lore.kernel.org/r/20201015221920.GA1657396@google.com

I didn't personally go dig through the code, but what's said in those
emails seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
