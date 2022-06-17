Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488F354FDDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 21:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243737AbiFQTrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 15:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239118AbiFQTru (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 15:47:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FC512600
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:47:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kq6so10541937ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zwRRGT+7U6kcOm23L9Lh8UyJA5oTQ09EyApKVWspK0=;
        b=e2DlXCS6iKqa9GLoyvPsepDbCTXyGi98RLSEWodCnOkFJA74c2le7Q72NlLN0FGhO5
         pLm9bgB/9qGbnuSMzlu5tDFZQC7xuU1iUCExxn5Hdj3lzBHhFD5/Lsq6bU4kOJOvCjhU
         wm7pRl03A0DT+F2RuC3KT5SdOOfZiRlLmEhXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zwRRGT+7U6kcOm23L9Lh8UyJA5oTQ09EyApKVWspK0=;
        b=FuZX9iGzPg9GnrF0FY1T0WRQzZVthIraZqZZPe9r+rs4dePyK1KLDoGok/60NbPlEv
         DN9LXAz+zadQFFOHFCFYjfuoknjl7ACD4m2wNtmMC0F3fA0pF/NFCQRxESCUsJ3ECpwQ
         Bf58ywMqvA/BLkNQZvvAAFeu0TJgmy2WF3oX8sKEF5NMN/QeU45qnArgc732wKUlH+UL
         yVpwg0ebRSw+uQVTXaVvSbMAbeCNzTZztqCEIL9hujz/LrdpsPGJGsrH6jwZqiRYBtX1
         krdi/mX9OHa9f4i7doA7q6DA703ixR3XdYahua0KvnQMh+sAxovcoeOB/fzDWeUU3RhI
         qm8g==
X-Gm-Message-State: AJIora+2treM6yA5ny80XjzZoKimtxULo08JSBckAQ1Iec0/PN1Lzsmn
        RvvDsOXKEI6GUpCEu9n6x0ZlEXcfWZt6Wjcx0Is=
X-Google-Smtp-Source: AGRyM1spO9EVvbE42KyE0+QcNvRljQV1zsiGCNgXtUa5TveGwCBZUAR+TAerw8iw7qoH48FFogJEJA==
X-Received: by 2002:a17:907:868f:b0:702:f865:55de with SMTP id qa15-20020a170907868f00b00702f86555demr10982374ejc.24.1655495267420;
        Fri, 17 Jun 2022 12:47:47 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906304500b0070f7d1c5a18sm2537228ejd.55.2022.06.17.12.47.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 12:47:46 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id z9so2791427wmf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:47:46 -0700 (PDT)
X-Received: by 2002:a05:600c:2054:b0:39c:3f73:3552 with SMTP id
 p20-20020a05600c205400b0039c3f733552mr11938914wmg.15.1655495265869; Fri, 17
 Jun 2022 12:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
In-Reply-To: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 12:47:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wp=BMwkbXH+_cHyVP3_0Zh-KXO=N8Y7wg3SktEs7FEXQ@mail.gmail.com>
Message-ID: <CAD=FV=Wp=BMwkbXH+_cHyVP3_0Zh-KXO=N8Y7wg3SktEs7FEXQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] FROMLIST: arm64: dts: qcom: sc7180-trogdor: Split
 out keyboard node and describe detachables
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 11:12 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> From: Stephen Boyd <swboyd@chromium.org>
>
> Trogdor devices that have a detachable keyboard still have a
> non-detachable keyboard input device present because we include the
> cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
> that every variant board includes. We do this because the
> keyboard-controller node also provides some buttons like the power
> button and volume buttons. Unfortunately, this means we register a
> keyboard input device that doesn't do anything on boards with a
> detachable keyboard.
>
> Change the node's compatible on detachables to the newly introduced
> "google,cros-ec-keyb-switches" compatible to indicate that there are
> only switches and no keyboard to register. Similarly, move the keyboard
> include that defines the keyboard-controller node out of
> sc7180-trogdor.dtsi to boards that actually have a keyboard so that the
> matrix properties are not defined on boards with the switches
> compatible. Future boards can either use the include approach or the
> node definition approach to describe a keyboard with possible switches
> or just some switches.
>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> (am from https://lore.kernel.org/r/20220518172525.3319993-1-swboyd@chromium.org)
>
>      evtest shows no more cros_ec device
>
> Cq-Depend: chromium:3609017
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>

It's OK to re-post Stephen's patch with your series, but:

1. The subject shouldn't have FROMLIST. That's just for patches picked
back to a Chromium OS kernel.

2. You shouldn't have "(am from...)". Again, just for patches picked
back to a Chromium OS kernel.

3. No Cq-Depend. That's something for patches picked back to a
Chromium OS kernel.

4. You should remove tags that were added by the Chromium review
system, like Stephen's "Tested-by" and my "Reviewed-by".


Another alternative is to not post Stephen's patch but add a note that
your patch should be applied atop his, then point to his. AKA:

https://lore.kernel.org/r/20220518172525.3319993-1-swboyd@chromium.org

-Doug
