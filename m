Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939B3589251
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 20:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbiHCSdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 14:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237795AbiHCSdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 14:33:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFA55A3C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 11:33:34 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id tk8so32950641ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZCzsgK5M5q8NHzi6xmbpn9gZoRddz3iFPlOf7axKvY=;
        b=YsMk8HXIgSnPt5mzM6iWp0him4MjXKkA/oabwfudv/iVdDck0f5XFcrhAHm94TLKaa
         FVmrXILtDZhQR2QGQa3natCmZCcPto2ksYOM/B2ofRhAbbhUmjRM583QE3TdcU/MWrVh
         MkP+MuKuFgupQuaZp7A/GlNgGuyXOf3Ob+AfNI92aqnCYZ85AvcdPc4iwkdshnhSH7GX
         K227BeQFZPX0fZMjCvgarbyKz0Lp/kL60YHyNP6xu/kDY/7tZgHwhq0+P5pi23ukZ52/
         gBZRLOw/mSh3TTv4TAgEzvbHCR1wlz00w+aqA9xg61GuUWyTtQsHBfCxnjoN0SeX+TIn
         JUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZCzsgK5M5q8NHzi6xmbpn9gZoRddz3iFPlOf7axKvY=;
        b=BkMARzIg69l7AU/Fn3aSQDrgY60QVhTGlFY2N+Se82yHGmUbbri08lBYAUTd6KhIYq
         ZyN9vO2tKG/3k7XkOz9L5ewtvQk9JbxCP791LU8zO+BnYHkxS02T13yLQqhANXOZVuTr
         avUVl4v+TYfmRgexE0LPiA4yyx1ojS1v+ibjHJNgs9hqycXsH7C2JIxcsGlyhHMFM7uS
         KZG8I/k7ccTZVfa3CA1HBNffQUMBVeRTnVmzhTsJvArpgk+LZhCZqa9+qpvguvP8348u
         iU3eUqyypF5KdlsZLIHoX3P2Mhq2dmFupTGbf+7fgl+LDgPb/jgoK8PduVpZew/mj34z
         x3oA==
X-Gm-Message-State: ACgBeo2XAoGqV10YjTrXdXy/bOkgIqV25pPNnAS47r4ZmI0x/2HBl3Cy
        L63Y9NUoxtKmpNBLlBQs2JXuI7Yi1tA0h0QsjU2odw==
X-Google-Smtp-Source: AA6agR4OstbR2Blalqyf5WPQMnigPvrCXTR7+IxtC9eyJeScjSiiGyZ90qL+i68vNdVIhdN0pk0iNNMFEQPaH/XqO5c=
X-Received: by 2002:a17:907:6890:b0:730:ba11:3bda with SMTP id
 qy16-20020a170907689000b00730ba113bdamr1975386ejc.208.1659551613320; Wed, 03
 Aug 2022 11:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220726115202.99108-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726115202.99108-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Aug 2022 20:33:22 +0200
Message-ID: <CACRpkdaba9QoMi0J2icp91hBYC6x7VAi=Dh9fjOVHuLnNUmzwA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: add PM8226 constraints
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

On Tue, Jul 26, 2022 at 1:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Document the constraints (number of GPIOs) for PM8226 variant.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij
