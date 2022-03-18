Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B194DE2DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 21:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbiCRUwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 16:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239991AbiCRUw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 16:52:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BACB1107F7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 13:51:10 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id m12so11558745edc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1qM/WmTAXskaF+yjSfV1y7KJpm/uUXfuoW9PJStJes=;
        b=VZWZ0IzAl1rOPM/z/xPexnHEnRbP829O+gSjjudc/IoKBdhcgQ5ifOZ8tWROZHiH5W
         q/7uP7NMyRTkfS8VYLjs0FCwhzGBx92LSOB+VlbawpNo99xryRkqiwgs3scnW+4ck7y8
         37fv7JFN2lAqn2m/eDQCxzp3ipxCejSClREu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1qM/WmTAXskaF+yjSfV1y7KJpm/uUXfuoW9PJStJes=;
        b=lXGVWaHcbFx3AWwb7MYv3rhr9Inrsel82U4J8+46Ff8GbQLcVA+lTdFtS/dF3pI8st
         8llHMLtvK/hPnmBdhneTaIYRoxsSG5s4Qtu9h3PRXyZxtFR1m5OU8THnpjpnC95hcMEU
         Pkczq0jUbBwF05M7J1vLi6GLpfLD35TECacIy5yc2X7yEGL9dy+2AFTBvOPlozUOurQb
         oyxHr9WA+sPPZn8kkXGcndI17c8Rntcm9cBmbZ/d8r2k/YQajfCzgfQmwhg+OJo+9pr2
         ULfxGQiJ8nng1SAxyyMGpkCF0w3BIrKem6L2hyR5GbyxLl2P/NawDuKYphpmLqPyDx/m
         NnBg==
X-Gm-Message-State: AOAM533l9KdaeXI3rmDhg3yrvCPDq/vUnkol9add/fzk9ppQidMcuHwh
        gzM+r4UhuRsgcRuw0KexwsXo3dyghkiueYeM5JE=
X-Google-Smtp-Source: ABdhPJwsmDFkRlctzvSQLXGoCsyZGaHbJ4/r7/tJ87qeMMMB0+2aDjBhYqD5QDRhoFHVHEkjofp5lw==
X-Received: by 2002:a05:6402:221b:b0:418:eb30:47ff with SMTP id cq27-20020a056402221b00b00418eb3047ffmr11540081edb.68.1647636668815;
        Fri, 18 Mar 2022 13:51:08 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id sa13-20020a1709076d0d00b006ce3ef8e1d4sm3985204ejc.31.2022.03.18.13.51.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 13:51:07 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id u16so12194944wru.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 13:51:07 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr3997914wrq.342.1647636667105; Fri, 18
 Mar 2022 13:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220317010640.2498502-1-swboyd@chromium.org> <20220317010640.2498502-2-swboyd@chromium.org>
In-Reply-To: <20220317010640.2498502-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Mar 2022 13:50:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UF3E=4YFRLKZjY3Dp+xzR9rg5FK=Ovq+a=VrcSvwU=8g@mail.gmail.com>
Message-ID: <CAD=FV=UF3E=4YFRLKZjY3Dp+xzR9rg5FK=Ovq+a=VrcSvwU=8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7280-herobrine: Drop outputs on
 fpmcu pins
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 16, 2022 at 6:06 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Having these pins with outputs is good on a fresh boot because it puts
> the boot and reset pins in a known "good" state. Unfortunately, that
> conflicts with the fingerprint firmware flashing code. The firmware
> flashing process binds and unbinds the cros-ec and spidev drivers and
> that reapplies the pin output values after the flashing code has
> overridden the gpio values. This causes a problem because we try to put
> the device into bootloader mode, bind the spidev driver and that
> inadvertently puts it right back into normal boot mode, breaking the
> flashing process.
>
> Fix this by removing the outputs. We'll introduce a binding for
> fingerprint cros-ec specifically to set the gpios properly via gpio APIs
> during cros-ec driver probe instead.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Fixes: 116f7cc43d28 ("arm64: dts: qcom: sc7280: Add herobrine-r1")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
