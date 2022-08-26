Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934F75A2C1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 18:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344114AbiHZQQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 12:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343996AbiHZQQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 12:16:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC20D8E1B
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 09:16:43 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id h22so4075752ejk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KGLrHWIlQkkcGAYUa/2yGh2hQoX6jmYun770U+54jAw=;
        b=cxz0/t2rB1fyMtx/h4P5N1RTo7JQXkfoidhaIHDxpHnV6nbuvzSUAMKDk9qjHlr6vP
         sq5QfqwyT3JKzLcYr8qoJNE3PqSsGL1vXZvfqPEFoe0vLZ8Q6nMr3lNADWmO0oVLr8gi
         INR7ioc1nZg98YbN0WNHwsg7R13yRBf4FcA0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KGLrHWIlQkkcGAYUa/2yGh2hQoX6jmYun770U+54jAw=;
        b=ZFxKHjhECoivc08eP9RFj8hhDMLMLdt5S5Oj7GX3WDxhZYEluymqrR1aB6o5EGHbad
         OaKzx96N9R8/8J8oxFVMl+JuEN2oITV8lI0VflMtQMPcrOiSQAVkN+hT/DtoJVTDPrP+
         M4SxGZxr20yuwWdnuCg8ynu0TxGcFdZIdnIAhajzfOqCz/FeNbXXWlhOmVw+J4FrJoMj
         8oMKCFmPSAF8W4Bmr8RNOcRv1cEkbPHGwnhJq3H0nSKZrIJLV/nn5qF/bNtQ8cfnlAPq
         E+vSYND73s0FOmd5R6/dr9j1ZZ8XB6rQwynKw03E+z3M1O917/eXR3shJ7p02tkIFBW2
         dtIw==
X-Gm-Message-State: ACgBeo3u4FZLXopCusK8tRMgd6+GAEpyKQVozW9+1mP1GMOtFTvBvADr
        1JU0TRbcHlw0mviEwBs09cfdTJqHa45cQIJU
X-Google-Smtp-Source: AA6agR6mov3g2K348jkTDAmsa+6MOE2frLQEK3Ya30VCQla6+V3QERl4x7JXf7kIQWM4hNiFRgi2AQ==
X-Received: by 2002:a17:907:a410:b0:741:386b:17e4 with SMTP id sg16-20020a170907a41000b00741386b17e4mr1222450ejc.46.1661530601617;
        Fri, 26 Aug 2022 09:16:41 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906301600b0073ae9ba9ba9sm1088417ejz.9.2022.08.26.09.16.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 09:16:39 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id n17so2371784wrm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 09:16:39 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr207547wrr.583.1661530599315; Fri, 26
 Aug 2022 09:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220826084813.1.I8c9a771fcf4d1cfb6e8e0ef17a153143af9a644d@changeid>
In-Reply-To: <20220826084813.1.I8c9a771fcf4d1cfb6e8e0ef17a153143af9a644d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Aug 2022 09:16:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0FVeEKS9OLXrsK+S==BvxrnG8wZ-fjasJ-=kOPr=-=Q@mail.gmail.com>
Message-ID: <CAD=FV=X0FVeEKS9OLXrsK+S==BvxrnG8wZ-fjasJ-=kOPr=-=Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-herobrine: Don't enable the USB
 2.0 port
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

 Hi,

On Fri, Aug 26, 2022 at 8:48 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The USB 2.0 port of sc7280 is currently not used by any herobrine
> board. Delete the device tree entries that enable it.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> I was also told that the 2.0 port is for the Embedded USB Debugger
> (EUD) only, but I'm not sure if that's true. From the Linux side
> it looks like a regular dwc3 controller.
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 12 ------------
>  1 file changed, 12 deletions(-)

I can confirm it's not hooked up anywhere on herobrine-class boards.
Disabling looks good to me. If we later have a herobrine variant where
this is enabled we can enable it just for that variant.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
