Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E5C5FC9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 19:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJLRmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 13:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiJLRmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 13:42:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45AEF87DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 10:42:35 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id s2so25505276edd.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+/oGLzREG21Yj0uftDYL1IyCwSjsexCNfPmeCYYK5U=;
        b=j7mlJDdtav9g6vWHhzB0NwAdum8QysC2za2V7GrivI/Px5eW1urR25/m6DIOgTwa2z
         N7Do86PkEu10oKl5S4Dl/HsMgMoPZmu1QdafheG/q9BqAeH/4gWGmms7wQNlGqFWSZMr
         xCP/NgrU2d8KsGwj/W4HbnB42/mUWL68QTz2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+/oGLzREG21Yj0uftDYL1IyCwSjsexCNfPmeCYYK5U=;
        b=2N5r/c+PgnriZx2OuFszI/UOA2B6Ik03Siynuqp4zCFht+1FX171iog3M4LQstpjSM
         /CIN0veiD3B0b8wGxTgAgvG8rnOE5T3+cPNBBsFsJwfEhaXJqRwLioaNggTn+pYZ5sPp
         AM/nZf/awF6t++28km4fzdUHAP02s9lQJQVqz6GrBTY/b6gsmQAEdYX/wAdKWIO+UVQw
         RYlFcmF1LvjBZVqt+pfDRLFxhxTmUgOu0qlxQu3lggz9suh2Xu9k0nwmpco2W1P28wRa
         A6al1nY4JETwIyssWgwUlvrp88mBZ+6rzkluE6gazcCAO39zbgnM6z4IA/TeQg+UPF3x
         PhEA==
X-Gm-Message-State: ACrzQf3vSs03XCq1CUJYVFnvutxfgTLS0CRYY4aDNgOIZ56BD4AcRf21
        lZ+MnHE1/JW/vP4TQq0bvTaLcrFHdn2W/mQD
X-Google-Smtp-Source: AMsMyM6SgkTYGywxLpFuyBflHeydCATR1sg6ZbIwr0frhnAtw/otRKfOjcoJ4RO828+qlDx0O5rXrA==
X-Received: by 2002:a05:6402:ea0:b0:454:38bf:aa3d with SMTP id h32-20020a0564020ea000b0045438bfaa3dmr28435374eda.291.1665596554247;
        Wed, 12 Oct 2022 10:42:34 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7d3c8000000b0045769dee1fdsm11684567edr.29.2022.10.12.10.42.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 10:42:32 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id bp11so14543574wrb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 10:42:31 -0700 (PDT)
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id
 a12-20020adfdd0c000000b0022e4bf66c08mr19368307wrm.617.1665596551460; Wed, 12
 Oct 2022 10:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145116.46554-1-krzysztof.kozlowski@linaro.org> <20221007145116.46554-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007145116.46554-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Oct 2022 10:42:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WN+9DJp-3Ny04NmOLau2RYibeJayEtB7x0uT-YoizFQA@mail.gmail.com>
Message-ID: <CAD=FV=WN+9DJp-3Ny04NmOLau2RYibeJayEtB7x0uT-YoizFQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom,sc7180: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 7, 2022 at 7:51 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.

The "default" of 2 is not correct. Please see commit 768f8d8e45f9
("dt-bindings: pinctrl: drive-strength doesn't default to 2 if
unspecified")

In fact, are you sure this even needs to be replicated here? This is
part of the common "qcom,tlmm-common.yaml" bindings file, isn't it?

-Doug
