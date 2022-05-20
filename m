Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37F952F4A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353536AbiETUvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353543AbiETUvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:51:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72419AE76
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:50:59 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id wh22so17534223ejb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCvNUzoNJgliggAjbNOVF+e73ln10qSAqagPa48fyAw=;
        b=hlkKiLZ74U8oZ5crxOdHHzyWx5PrDTiFFFh7Zv05xV8i3b0J8CW8fv4Woq7QPCoOVE
         7ADjNRKYYmxsp7KiN052EgelmGfHN+etwMZakEHNvP/mGUk7IbM1uDt4foMCxao8j/TZ
         8zn/OYgfIanRUj2Y+H+t/Ww6LCVKamBwBlssM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCvNUzoNJgliggAjbNOVF+e73ln10qSAqagPa48fyAw=;
        b=LspCr3foDg+me3RXY+JH41sDJvxUI1Qc+SEOFUM97i7HXNDm6GRuZbnF5SA+uVoUe6
         ceF3JTEDLYlImS7PCXE3sgN7xtUPouLkECu6KCDkXXUGIa71A3fO+YkOY5N1YxEdC2u0
         c0K9E2XZG6MFKtdl03pLnGzvQpRgI5UMbX/mDG+au3U3c4qwpKzetVV17kRxxp2feZwf
         Xhckf54mw/mSaQCh7qle4Uanh/jHY0hFo5cvERisCPbcd3UHZfydAseojI7r5lUeWJBJ
         LGE6Rl98Qc6HAItRnHKrmb/3EulxfWjWhZVRIMRBubZXtQ7kt9uW2MnbFlOl+odWBQTI
         xElA==
X-Gm-Message-State: AOAM531QgOcOJKP8+NdLpgSV02AFKkr8HxSlHVv559KkxU5c9WXz53a+
        9L53qz13faR2/iO8dJMTusg7rXeX07Od5/Forx8=
X-Google-Smtp-Source: ABdhPJxxAnLIZqFl1bWAr2qQbjDMyBfvGeUC4LvHmbN2C4oigxABhV1Ht/yWPpnj/9yo3c5s/Xv5cA==
X-Received: by 2002:a17:906:5ad3:b0:6fe:9f29:5ca6 with SMTP id x19-20020a1709065ad300b006fe9f295ca6mr7849175ejs.401.1653079857694;
        Fri, 20 May 2022 13:50:57 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090612cf00b006f3ef214ddesm3491359ejb.68.2022.05.20.13.50.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:50:55 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id ay35so3528557wmb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:50:54 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr10079039wmb.29.1653079854130; Fri, 20
 May 2022 13:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220520161004.1141554-1-judyhsiao@chromium.org> <20220520161004.1141554-4-judyhsiao@chromium.org>
In-Reply-To: <20220520161004.1141554-4-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 13:50:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vpds9p7LLfxiwhNdDTdxb=CffcMjgxRva5EHc9VJ4LDg@mail.gmail.com>
Message-ID: <CAD=FV=Vpds9p7LLfxiwhNdDTdxb=CffcMjgxRva5EHc9VJ4LDg@mail.gmail.com>
Subject: Re: [v2 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi
 in villager and herobrine-r1
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 9:10 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
> these boards use rt5682 codec.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
