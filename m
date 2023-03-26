Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079056C93AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 12:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjCZKDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 06:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjCZKDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 06:03:20 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B09A26AD
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 03:03:15 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5416698e889so118065757b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 03:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679824994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X54UJPGeK4IGLr17wnsJdrPT2D0HyEvf0ORw+55QQdY=;
        b=PAtYZ4Cl+eYSlr3YYO5sd8vOwStIIBytiB6BKmsr5oYTCqLNXVFAAXaXQNA+RWh1SN
         w07z6VtfHQ3TnBoPDeZ2M3rfGyHhZKv/YwjWknaD6tLiKxOjsj6zxV4Y55frK6SoOKhV
         KwMsjDWdc1AymtWNbKozbz3BN0INPdR+baRyO72xrHdu/xsUU8W4uRtujE64KuptBOcD
         LlJXtUuPubcw8PfhpKA0lIl4yGaUlGXS5upCAFnhfxlPoSnf/j15ArSwjryW2uRAgHix
         Dx5G5ywcJk0y46YiehcBq9GigHfmCffGuk4eZOJ7Wo03azmHhDo+dJg+gjAZ2jwMfvRB
         xA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679824994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X54UJPGeK4IGLr17wnsJdrPT2D0HyEvf0ORw+55QQdY=;
        b=ZnoW2q0NaShE4xE1pvZuDTrPNeJpddbnqFdFg//52ftI11hZKOLhrmPmKv8BPAg3za
         2LqbPG6S60ytSsFgXWmmtBBCbxvZ0Ov+OFiaBbgXAzDr/vzAeWlBSjW9esXmR+ViEupU
         th9CTQTknBV8hhN0H0ByeMrgpnfQ7sP60pjWuKGLGkDgfOn3PH8Lrciv2WfAQGYZjD8B
         SqQDdVxET174nWiktFpvn4RjZnwgv3Q/GKMPQ80UPYDx1d/Fp50xsb9yi+dji1eeDi4C
         ORLqtt7o0mGYM4qOpJSUnSwLywV3uSmUoRZ0I1WKD1v/FikjmZW7zSkz4xtLWVoa7atY
         vN7Q==
X-Gm-Message-State: AAQBX9eYy5Y//Td7Fe+l+IPhJ1Hh9ROp3zhTGnysanLONVN6Q8jaS4YP
        KSb686ZuCPXmlzdfO19vPrqnlCMxWZ35yDZs/CBOng==
X-Google-Smtp-Source: AKy350YkYqLubvOtsGf5NRYVIiI7kELC2GTIpY8o/J7IFJRllBOQxeD/FFoYp12DlsocF2oHLB0kA6kMuelghQFs164=
X-Received: by 2002:a81:b617:0:b0:541:7f69:aa8b with SMTP id
 u23-20020a81b617000000b005417f69aa8bmr3486734ywh.5.1679824994679; Sun, 26 Mar
 2023 03:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230326091605.18908-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJpqR-QisyWEHE83oFbXt8wUcn2Ofd4W6UwFmkYzGD18N9Q@mail.gmail.com> <c6429b89-bdf1-a601-7cc2-a6cbb566fecd@linaro.org>
In-Reply-To: <c6429b89-bdf1-a601-7cc2-a6cbb566fecd@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 26 Mar 2023 13:03:03 +0300
Message-ID: <CAA8EJppPHVZbseXFx8g+m9PxgODuenLEBHeDT3z6MojzVALKqA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm630: move DSI opp-table out of
 soc node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Mar 2023 at 12:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/03/2023 11:21, Dmitry Baryshkov wrote:
> > On Sun, 26 Mar 2023 at 12:16, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> The soc node is supposed to have only device nodes with MMIO addresses,
> >> so move the DSI OPP out of it (it is used also by second DSI1 on
> >> SDM660):
> >
> > This raises a question: would it make sense to add /opps to handle all
> > opp tables?
>
> We didn't add it to any other cases like this (and we already fixed all
> other boards), so why now? We can but it is a bit late for it.

Because nobody expressed this idea beforehand? I'm not insisting here,
you have a better understanding of DT. Just wondering if it makes
sense.

-- 
With best wishes
Dmitry
