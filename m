Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D87689099
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbjBCHRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbjBCHRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:17:44 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62368E698
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:17:42 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id y1so3812473wru.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AIgxCweWs4+DnxABoHv8HSYkYCkBtQd6RKyyeXAI4o=;
        b=hGVzxC6EWGSen7yIJrc27Vu0co0n3zGYIxJm6/ZvKpEHu4xXqXrn2jaWb8XYSI+w9a
         fpzN1wSy9EnL+biWpukc3T7bFFfwi3pvq/Yl1egkmre2acTVXWmlLIuNIqPX5mg+kLFs
         gCe24kzyKsvpC4P47r9oDhKka+8c7BMEYaZQwRiA1usqjUXWDDDmnF0a4GpXNKxeiHzK
         YTRaf7g6op8gIk0P+TcjUNwunnQegnrS898aIT3Ys2dVO85DdsgWxTrhgaaY8QaFts7S
         48ju5jSbYTD8P0MV4rEIHxByDMwSTzdN/fqxfslLfqsykHCr8XEEI0JG6keXQHRtBDjP
         nGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AIgxCweWs4+DnxABoHv8HSYkYCkBtQd6RKyyeXAI4o=;
        b=aC2bO2aTlC/K5hzCBa3dqjLUEqnWeZFzU3XZIWWoUtuY/TP6ONj3gPJLIUCOk6LaKM
         zfEgUHAVuw5BHg/Hbo9OfddQf95YCpNFA41RQg5AJm0D5xPVmRp/rDTlcUnij0nCkZ2F
         jigGBjpmp3F6i11I2VdtS+/EQtpC7ywcYYBRlF6xUWHB4jEBzqLB8u59O9n4VnsMFMd+
         1aUSiIfFCG8NAZu1QDLHPosEwBpI6JZjjXKYuSWae7ldvq+H165L7YT6i+sCTFzOKxek
         Np1V9FVQdII61WXIBpBEmPKQdvlVMuHO8b8EvZeSlVpgwxZofT4daz5D0yw5oitl27EK
         Qh0w==
X-Gm-Message-State: AO0yUKXqk1zaKZ6MDwzlGL0xT/Ogj4kdSQzk9EEtnuQUUPaNq6z0ZAnF
        0jPFI7JGG31vKbRlMokkNFroqQ==
X-Google-Smtp-Source: AK7set+e8woENYsUqYAhyzTz/ne5s8s2T6I/2mq2Ioe8we0VVJyKEUc6koF8sPz1v08iVWL9pCM0/A==
X-Received: by 2002:a5d:610c:0:b0:2c2:6541:7af7 with SMTP id v12-20020a5d610c000000b002c265417af7mr7151784wrt.66.1675408662307;
        Thu, 02 Feb 2023 23:17:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Iskren Chernev <me@iskren.info>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH v2 07/10] dt-bindings: pinctrl: qcom: correct gpio-ranges in examples
Date:   Fri,  3 Feb 2023 08:17:27 +0100
Message-Id: <167540864401.6835.15877953602860075826.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-8-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Feb 2023 11:44:49 +0100, Krzysztof Kozlowski wrote:
> Correct the number of GPIOs in gpio-ranges to match reality.
> 
> 

Applied, thanks!

[07/10] dt-bindings: pinctrl: qcom: correct gpio-ranges in examples
        https://git.kernel.org/krzk/linux-dt/c/6f4e10ffa8fbccf220f7c5c869e8373065b9ef7d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
