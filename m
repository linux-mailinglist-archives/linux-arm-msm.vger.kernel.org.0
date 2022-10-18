Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636D6603006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 17:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiJRPt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 11:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbiJRPtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 11:49:21 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36061C786F
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:49:15 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id a5so8893480qkl.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8dAwQHU7xgTYv9Rziy/VTcg+DNaHPwkpnAlDKwdkMA=;
        b=KXyNexrdjlkNpJgmw+V7kE+luv3Th3zE5+MDf66JucUL8GeyPrAeEq0X+PcdRH/0eP
         AlxhP5mjT0K30zRrsQ0DFXAN8rJCJx1mcnooFUv6v1fmfqt+tN0oBiyTOa4trbXM6S9U
         I+Ts6bCt4UYRrII+ZK/S1FQE3eYHh4qbZdQKRPDMGYgWQs9cBZFAKccGYSPpolLO+IFx
         YHO37oyUwbatcFMZX65pL2ZDS5cQtcVwAWNyMLKXUJnC39Q8GYszzABOI0gMaxh/Grm2
         vWtlwPBvu65tGHFdEwL37+vmOVGMSN4xzokfR116ssR1bjxwHbI3Pu7Y67sU1ukVJoWT
         8s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8dAwQHU7xgTYv9Rziy/VTcg+DNaHPwkpnAlDKwdkMA=;
        b=Jccs+D4J+Z6pAvhWWuLgQnzXlXQ46uAsAT9qQwqEwIN76VtJwDnmAQFJgi3uEgA7dT
         Q1Vm/VLMvKgPeSJIxdGcH/7jLyFWY4T5d413aHOz/F8gxgUBxh6TA2ElGQWVaKLOFYmv
         dheVwOpjqiZ64vQJld/psWKchm8fiDG/LemF81PF2kUm5I/5G2u9L6nptjfdajQrc77G
         H9n4IcFFjdmJjgoXsRBIGaw/3ZAbdtosQ7PAgvIuiNufoRwOyIdSyC71k0V2zJcOtUT3
         skcpRDyQeIToieQZ+m3E8QDy6FKsRMGIwjvn6pJieTztY3NWcsL5ba0gZjEYsTx8Cgzc
         ED0g==
X-Gm-Message-State: ACrzQf12Df+nbgkUOt5h9IyhZOPoZ/CWJcv0yIv012cg5lGn+hZ3xIg3
        B7KKY0ATALXHO+uufVZ6bbYTKw==
X-Google-Smtp-Source: AMsMyM71RZ3+irp4CxLUwkcuzK3Shhw1dIi493BDGQfQwvs4UZWzQPKKAyvADZBIKDSSKonBjXsUHg==
X-Received: by 2002:a05:620a:28d3:b0:6ee:cffb:21ef with SMTP id l19-20020a05620a28d300b006eecffb21efmr2277314qkp.123.1666108154295;
        Tue, 18 Oct 2022 08:49:14 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id c25-20020ac86619000000b0039543f89109sm2029202qtp.96.2022.10.18.08.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:49:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 11/17] dt-bindings: pinctrl: qcom,sm8250: add gpio-reserved-ranges and gpio-line-names
Date:   Tue, 18 Oct 2022 11:49:03 -0400
Message-Id: <166610814671.37912.8338678097006973773.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-12-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org> <20221016172212.49105-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 16 Oct 2022 13:22:06 -0400, Krzysztof Kozlowski wrote:
> Document common GPIO properties (gpio-reserved-ranges and
> gpio-line-names), already used on qrb5165-rb5 board.
> 
> 

Applied, thanks!

[11/17] dt-bindings: pinctrl: qcom,sm8250: add gpio-reserved-ranges and gpio-line-names
        https://git.kernel.org/krzk/linux-dt/c/a094b8d8790df774354c36c60017151c3a112e43

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
