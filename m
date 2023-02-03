Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC496689092
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjBCHRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjBCHRh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:17:37 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F3292198
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:17:33 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id o18so3807485wrj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APlauoD+cZCP9rrlAWdOSfuEUfUwxPR4mkC7tm9f2jw=;
        b=ZSmRfK3fmu69WSpHhaOJK9YyWllJdUaVAzTEOrOEZ2kF4VQoHU4ud9mdwqLa1YDBAL
         8oVXq3OMNh0iTjPl4V9nzBDa2Ne6UnwXc9YjWBvLx/Er1wL0jSciq19cD9Dd+Kgk+wx/
         gtPTBmBxbcFS871l9HYuT/XRfca3rHTqkbmJpDVd9EPv3W2pYUaB2mqLpu5yQMCovrKJ
         5ZCaEahqOylE0L4zlwNaAMpClZZh0y5KKe0th6JMqqY7ei41WgO2fncP0nK/1dzjnbYt
         zyGIuJoSKTpPT/1m7BXlG54wYW7ylJYCLJfyE3M6wzDa9DJ65Wt4wSH53qQDxNG9RSP+
         +iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APlauoD+cZCP9rrlAWdOSfuEUfUwxPR4mkC7tm9f2jw=;
        b=BAlPh7XaHqyBrI1eOacqlI5Is4aKae+rXlxT0TDfY4jRGgco8rBEW6n4XgTqoazy07
         fLnhpE65a97CVnVSqZYMZayXBzMoFahRiP1iHUNWDJHly36nSLZVnH8afCpA4nBvFOhU
         WBCMG0C3hugW2lYFNWyGj6yzA5pxWewytIJbZ2riEsRXKJjqIP60E/+ONFaSKx7/370f
         Cx/ScJlCBhwAMqN77GitSKAWzy6YlEyq0W94Cf4+Ng8Htn7+MDm/L5Ysh7571AV+yZbr
         j+wpCuMNomWo52mTEkN7cihuMfJam3R9hMhY9VfSDeBUar+IFv4Zdf271K7WxQodfuwb
         BzHg==
X-Gm-Message-State: AO0yUKVhceXKcHvnpzGrj/pYhQK4UGRUSoGrPT2qHmaR+MPRf8QwhLi4
        aHaiPDaLZrT9ucpcNPqtCPL1Eg==
X-Google-Smtp-Source: AK7set9U+UnCZOVfPrI8/GftqDWywa9Rn3Eo57WxeJM9YDcXIm1EJKV/tPyXhVeoXyoxPt+5rOGDSw==
X-Received: by 2002:adf:d083:0:b0:2c3:d847:c87d with SMTP id y3-20020adfd083000000b002c3d847c87dmr551950wrh.44.1675408652044;
        Thu, 02 Feb 2023 23:17:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Iskren Chernev <me@iskren.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>, Vinod Koul <vkoul@kernel.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: (subset) [PATCH v2 01/10] dt-bindings: pinctrl: qcom,msm8226: correct GPIO name pattern
Date:   Fri,  3 Feb 2023 08:17:21 +0100
Message-Id: <167540864401.6835.2390675203030650547.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-2-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-2-krzysztof.kozlowski@linaro.org>
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

On Thu, 2 Feb 2023 11:44:43 +0100, Krzysztof Kozlowski wrote:
> The MSM8226 TLMM pin controller has GPIOs 0-116, so correct the pattern
> to bring back missing 107-109.
> 
> 

Applied, thanks!

[01/10] dt-bindings: pinctrl: qcom,msm8226: correct GPIO name pattern
        https://git.kernel.org/krzk/linux-dt/c/792349083a7307bf34de26516bc047cfd5c6296b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
