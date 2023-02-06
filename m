Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB11768BB2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 12:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjBFLUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 06:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjBFLUY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 06:20:24 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBD3CC07
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 03:20:22 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so3205818wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 03:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xs4R0aaeN/FbhbM2Saelm/gzclOCSfp0utp2eX32l8=;
        b=olLn8FEfyLxERk5EXnD2rHs/mKncXnQR5KwlbG3AmNhaG9wkmf2iLNNs4hv/FbDuhP
         uv7IP1YtuDqjePJ9V2EeVHtbXeI4wGb3c/pT65J1Iiz/CdSNcamgG+MByhEMeFKxjove
         4d2Ur+rRhBqgwiz9cp97zpBuZLX7r4ZTgLl1yi8hfgtDTdB8MXQFdHuyJ4XvbzRY5g4R
         HDQizOxiSsMn8xNcU8aXcw0bJRgwYFhs9CQsP316TCtao1ZHi1yRi2y3VA9M8M+JPfAc
         s2cZlMP/gfLvvWJz4be19FjaSfk74TmSwsi9MeF5F5m7NZvk4UKiSy+SL2ARxPdGHSQO
         A9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xs4R0aaeN/FbhbM2Saelm/gzclOCSfp0utp2eX32l8=;
        b=lY19cq20gcN1q+ZP2996BpNNqTlObDm99FRF0K9xAfZHjcN83PAmX44upzuSstX26v
         nq+8vHDCWVa6InZSJnHOXg7DUjq/0KeU6OaOO1VvK15CjH93veqa/VE/1TgmJRArXiZj
         qWlMTDkNI5SEZbnBuFeH9tKE8dTd19b/r4wQz7WGhw9UM+DWteECNdpxrYLl/H72UbnM
         XdDnXFYWc0RdLklT31zBq7JxcwH/Vvk0pHwl3MM//zUfUNQvrj2dOVoOct47Ka2FV4km
         pTWNT/4E0Kpo6VFm9DN3SVHwPAWqeFY1Dgr1WYzrr79kEomO0+OnIyBoW3h27WrnIrpd
         mqkw==
X-Gm-Message-State: AO0yUKXKXksAafTz5ITEe/vsVANof8a7Hm+Gvh3cz9rX4YzNgEdjfMCm
        XTbhzNNZxi2J8YWXAUXdqvP4tA==
X-Google-Smtp-Source: AK7set+qZ/D1Yyv78YQ/UtulPtsQ+y+DIXibRBCbVQT1zCboGEzsoNBgw9oviIxePq80k4j8dquZEw==
X-Received: by 2002:a05:600c:601f:b0:3d9:fb59:c16b with SMTP id az31-20020a05600c601f00b003d9fb59c16bmr18727165wmb.36.1675682421342;
        Mon, 06 Feb 2023 03:20:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u2-20020a7bc042000000b003dd8feea827sm15514587wmc.4.2023.02.06.03.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 03:20:21 -0800 (PST)
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
Subject: Re: (subset) [PATCH 1/5] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: correct GPIO name pattern
Date:   Mon,  6 Feb 2023 12:20:15 +0100
Message-Id: <167568224369.84151.11541224379812676845.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
References: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
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

On Fri, 3 Feb 2023 17:48:50 +0100, Krzysztof Kozlowski wrote:
> The SC7280 LPASS pin controller has GPIOs 0-14, so narrow the pattern of
> possible GPIO names.
> 
> 

Applied, thanks!

[1/5] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: correct GPIO name pattern
      https://git.kernel.org/krzk/linux-dt/c/315dffb843f75cec4458714f4d151d5775e797de

(all patches squashed into one)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
