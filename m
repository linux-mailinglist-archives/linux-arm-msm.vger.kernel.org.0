Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5421368BB2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 12:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjBFLU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 06:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjBFLU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 06:20:26 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2004FCDD8
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 03:20:25 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso10489336wmp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNtLw1Z1rXiQWn3Ln315Y/4zP8AlqV3WIrfHlJDWq5s=;
        b=ZFoHVKkKiQyszzqHFVrtzadeH9Atq2JOeW8tL9fxlcGm/dD32/ibF3G28+JIOFqgfn
         9l6la56wQ2jsx13fFOTbil96R2wA/wyLXKu+/PX6kyfB4kjjDBMLoJosdjYiAJiJtEoY
         zuJ8khhAxFl72nqXJSpZkRyeq68pvu3dpNQJyLIl9SDejfqlo7aMn12jg592kCQS+7Pd
         Xnv8zrrG+K/9bST/O8G1gsZrS2WAXNXTFvfjc1i/3aIgSGWPukiLn61rRh4eVhztNf0+
         TkhTdaAqGQAlu9DdJtbYsjam5fWrChScvd7htaKQbO+qXBsrMpbjKn11gmyIYd8RjXGY
         XnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNtLw1Z1rXiQWn3Ln315Y/4zP8AlqV3WIrfHlJDWq5s=;
        b=gI4R0YmU+8fDG/qA0OCVjrCu2DooFXBW+PLGmO27VMzdHplAkGGt8cpjs8rb3hmi8A
         I/DF9CfO1fkLeBo5OtWQpdFAFBKK5TOvSTHXLMX2g4Up006y5otKz++q6T4fSGIGh7Dr
         OhJwNrVN14txBCkA+NR9VFOmgs8p1GaWjmJEuqSqDrpHugwvcsGHeRMnW3tSxYK2ZeN5
         8Qu0HGFU0ADu5hm6zzcB0VMsCq29SVEXfdD21CsWzpx4duBZPc+uluDb7AurC0Mc+0Uc
         R8Buf8jMesZpirNMPRGVsE5O4nU7jZzBiYnygM+pkqdbyLuFKhCoOVzvaXGAh3KX540y
         J/dg==
X-Gm-Message-State: AO0yUKVQpgY1dMxxJFySZLuATrmXO0QnE0CuIRsZysV9dMGSWbxVUEXI
        VfafL7hFJfUEeekX5mNUHt8qzg==
X-Google-Smtp-Source: AK7set8Y9qDVz69JfJLVkhu9HPMJO1VqBMLvJeXTB7FftVgXh0YG54h8B+KZ9MxwF7fPp7tiVAenyw==
X-Received: by 2002:a05:600c:5389:b0:3dc:557f:6126 with SMTP id hg9-20020a05600c538900b003dc557f6126mr548834wmb.4.1675682423707;
        Mon, 06 Feb 2023 03:20:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u2-20020a7bc042000000b003dd8feea827sm15514587wmc.4.2023.02.06.03.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 03:20:23 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 3/5] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: correct GPIO name pattern
Date:   Mon,  6 Feb 2023 12:20:17 +0100
Message-Id: <167568224369.84151.16792417656176338982.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203164854.390080-3-krzysztof.kozlowski@linaro.org>
References: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org> <20230203164854.390080-3-krzysztof.kozlowski@linaro.org>
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

On Fri, 3 Feb 2023 17:48:52 +0100, Krzysztof Kozlowski wrote:
> The SM8450 LPASS pin controller has GPIOs 0-22, so narrow the pattern of
> possible GPIO names.
> 
> 

Applied, thanks!

[3/5] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: correct GPIO name pattern
      https://git.kernel.org/krzk/linux-dt/c/315dffb843f75cec4458714f4d151d5775e797de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
