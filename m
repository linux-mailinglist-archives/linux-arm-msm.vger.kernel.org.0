Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710436B7FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 19:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjCMSKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 14:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjCMSKD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 14:10:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDFC769E2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 11:09:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t11so16846268lfr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678730982;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AC1AaHI/M3K6sSup8LnZmTH6kmxrZ+Dj4Rlm4AMPhpQ=;
        b=COTEfSvudapDX7lS8HupLQXZEZLP2QFVLPLnooMKIJYpUI8l6Riqv3JH1vfGDRcx+p
         /4qcMRnz6I1AGrsL4x7vHaQ/6raLD55AYFpE9vJXNv8y0Fxj1HaCdiIs7ReHXiOg1Yzw
         76H5T46WIk3SUsj8jT3hXTtucESIqTcIlXEgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678730982;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AC1AaHI/M3K6sSup8LnZmTH6kmxrZ+Dj4Rlm4AMPhpQ=;
        b=Wi6Jel8zVGh/EbZ+o0gozYywTdp6YQO50j7dbRJDUBqlCypkZ3lVknnmdJVEchAnZY
         ifzbTZsGo6ZGsTehfMk0Xgym5u1EO33WRBb3EALpSIXJz2CQwcsxwJTZWRjhN/3cXqKa
         jscIKpIs2Twl5fpCRBPVnuzkLmGWKr5JMYMHFV4kIxBQ9si9hO5AH3lx6YHxcirJlksY
         QCeOEeRbAAhohQlSwUS6DDBiqyRorc/Fe5Qprmypla2VJAkOK8GLm9Ohz5PBCgpqFJC6
         1gD3fu3EPZ0qQyrC9yvih+u+SxJogpYhMMH4So3VlIbbs4JWyz8O/C1H399smF83G2IC
         4pbQ==
X-Gm-Message-State: AO0yUKVL/GPjr0Z7F0IemUfZqIErPabVZbPayz5X2+h/H5aH/kAG0CjL
        DcTu7FaWrgSSbP5yOI8ubmPqIVVoAq8k0Nqie4/esw==
X-Google-Smtp-Source: AK7set+tW6ZQlyVt2YCXoAN0jN9I43kwUHgLrWKfXdHTQeIr91lw69FgDzrH/nObkKwGiKfQvYqIrrW6ZNRdogR7vEY=
X-Received: by 2002:a19:f606:0:b0:4e7:ed3c:68ee with SMTP id
 x6-20020a19f606000000b004e7ed3c68eemr10188143lfe.4.1678730982538; Mon, 13 Mar
 2023 11:09:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Mar 2023 11:09:42 -0700
MIME-Version: 1.0
In-Reply-To: <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org> <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 13 Mar 2023 11:09:42 -0700
Message-ID: <CAE-0n50eJaw=ENqR71_5-L1kArey79snkoz_GQq4ufG1ZWu_Pg@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sc7180-trogdor-lazor: correct
 trackpad supply
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Krzysztof Kozlowski (2023-03-12 11:36:17)
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> boards which use elan,ekth3000 with valid VCC:
>
>   sc7180-trogdor-lazor-limozeen-nots-r4.dtb: trackpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: 2c26adb8dbab ("arm64: dts: qcom: Add sc7180-lazor-limozeen skus")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
