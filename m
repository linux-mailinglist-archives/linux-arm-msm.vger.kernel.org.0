Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EAF5F3889
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 00:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiJCWCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 18:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiJCWCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 18:02:05 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E164F32042
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 15:02:01 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a26so25056950ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=HV8KUZ4GPFpWtPFVlTgVXPYpTAfZV/oMcB7Ni0y1cJo=;
        b=RGdIZ/Z08zcTidBpIfZ0fUtwIMOXTxw+d9f8ATQtx5bqfwijqOxlO3TmILLjGojEI2
         0/C5o5myNt1Z+AoGNzL0GIChH3w8BxEM7gjOO7emlAUCGpXQRh9i0w9hwJ7T+VyNVHxA
         zom+NkFhWHw2lZYpCC0XaUpZ4OM8cvk5uBToPmMKKfqm/+d+WaBKU+5XnTXoDE86DL6k
         /6ZO0lICunGPOsrQiBGGlXMpj364fioMKCSrUHFaHPYQzlC01cczqHltiEGI2X/tTZ8V
         bjQzktzxjHpcn0+BEoYXCVjcxVlqrCQaL+d1wg6/pNMxX8nsi5O6ZzQ05V50eTC6I1B5
         Y+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HV8KUZ4GPFpWtPFVlTgVXPYpTAfZV/oMcB7Ni0y1cJo=;
        b=xA4OFjjgr8cmmOZFN+AQQVn/E9FF1lBnmJG5amT3h8oGrfkAwBMgnQkUd91avWKNCV
         wIWV4U82GIKErbtKbKQdiosbJMV2II5wWvo4KMk4RmYBBj7u4O9roKpxN6+TZQmf2FyN
         lXQQk0BxK+bzmy1fCAemSugInUVBbj8j0VDyBUCA6FIaBiGGS9hKhlnfbcYNPzOuRSqQ
         +KbKDKpQDEmHpkYjT7zJTIhfpWqvHVOXotn/NIDVaJpqfqcnTriidFlk4571ZgY0BOZC
         vxI1PoT4HRnxq+txWnpxzW+3vUy4YPCfxxFdH0fWS1M0rI+q86BdYapGXhVoWZKrSTXp
         B22w==
X-Gm-Message-State: ACrzQf2qQhjnDPcikU8lY41/atGkLR7nyBgk+BwAcW496vgKUZYI22f4
        TO2JlivhYEEvav8j1+6mY1lajVjMQx+uyVnQqoNNwD85K3I=
X-Google-Smtp-Source: AMsMyM72H+D6z11aPXLsbrptZmRmrhUBp1HI9zRSIGSONqexAiHHRxKlnMat4VIWoHNajB1Qjvswtq1P9D6cs4Gf/nY=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr17295191ejt.526.1664834520528; Mon, 03
 Oct 2022 15:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 00:01:49 +0200
Message-ID: <CACRpkdZpCshxrLtHfnYOD2=Ua8Te1X1MEfJuaoH4QFLayYxoUA@mail.gmail.com>
Subject: Re: [PATCH 00/32] pinctrl/arm64: qcom: continued - fix Qualcomm TLMM
 pinctrl schema warnings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 24, 2022 at 10:05 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> This is the third patchset around Qualcomm pinctrl in recent days:
> 1. First round of TLMM fixes: merged
> 2. LPASS fixes: https://lore.kernel.org/linux-devicetree/20220922195651.345369-1-krzysztof.kozlowski@linaro.org/T/#t
> 3. Second round of TLMM fixes: THIS PATCHSET

Same thing with TLMM as LPASS! Stack up the bindings, send me pull
requests, because I trust you.

Yours,
Linus Walleij
