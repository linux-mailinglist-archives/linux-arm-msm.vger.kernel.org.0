Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 535436018D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiJQUKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiJQUJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:09:48 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312BF7B2A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:09 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id g11so8471034qts.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztJa1K860H5zPhNKhm+qSDjTU8mL8hngB9GKRKq9ZiI=;
        b=GGBQ5HKudQ2QVMdw3Melp+rDiWm+BJhTQFlDcVCo1cckCufzclE/TrKHrrXHJ/DviK
         v/rOJrhqB1lWkZvl01F44ZBnmxKzi+5bCnB9hGtRlm6ykPP4msFuVw9u4RbJn+7G7fUr
         nuXwlB2P3Og3ykulffsovW5oUrN3ik2gANvB3whaysXHWcRQAHuwx8l4OtFjc5TaRk4U
         XdbD5Jvdxww7nHMubU0kODsBZHUu0H3HkN8mk+I4ZkDIufi5Y8Mq/hNYSki+utrLDlsz
         EO8JG4KlXDJaumW4tGB+d1coIhLyjTG9GrSiAc9szPnx1dGyhFhcasNY2OTMTB7F7E7t
         4jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztJa1K860H5zPhNKhm+qSDjTU8mL8hngB9GKRKq9ZiI=;
        b=GSgggtY5SrA3MAW2oyvMRHp17m7B1pPOO0jCDNhhC0aLtSIoSPKOE8wUrSnLMZD6JV
         qNllkGElzZr3sOG0G3/iMb6fjQRJYK/Vb39+85WX5I0TZIgb6T6GpY3PAP5lMR8r0ciU
         N0BykQXBCkd71wt2Or+my8LCieHEngs/wMjL2bBU4M9HYdzNg0kAt3HiAYymZThCdwsI
         UNzcgOLIG84wcCdoHarl1GE375j9t8CbNERnUrZedbnh7A7Of0SH+I2WgFxWvXv+gXld
         3RsuFI0kgdXh+wtfS/6TKDjIeMASTV0SdR1DkcLk2fWOI5u0q9y+QrkNQpG8aqnCctew
         V7Bw==
X-Gm-Message-State: ACrzQf1sR4nBCokYCK9fw58gHC+J7anfJtz/mHfEo5jHJDdUFYkwAPd2
        YNYlzdRCVb7536SnDwTZa6RvUA==
X-Google-Smtp-Source: AMsMyM5C3dsbEm1y2nizVk2cFJWYJKT3N7rdwmws54TWP5M7/G6rmNqlc0L3zzCJVJ8QyCZ3mk6V3Q==
X-Received: by 2002:a05:622a:141:b0:38b:f43:60bf with SMTP id v1-20020a05622a014100b0038b0f4360bfmr10082513qtw.137.1666037341377;
        Mon, 17 Oct 2022 13:09:01 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 16/34] dt-bindings: pinctrl: qcom,msm8226: add functions and input-enable
Date:   Mon, 17 Oct 2022 16:07:57 -0400
Message-Id: <166603728601.4991.11883156782402115022.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-17-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-17-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:17 -0400, Krzysztof Kozlowski wrote:
> The MSM8226 pinctrl driver supports input-enable, blsp_i2c4, blsp_uart4
> and sdc3 functions and DTS already uses it:
> 
>   qcom-msm8226-samsung-s3ve3g.dtb: pinctrl@fd510000: 'blsp1-i2c1', 'blsp1-i2c2', 'blsp1-i2c3', 'blsp1-i2c4', 'blsp1-i2c5' ...
>   qcom-apq8026-lg-lenok.dtb: pinctrl@fd510000: touch-state: 'oneOf' conditional failed, one must be fixed:
>     'input-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> [...]

Applied, thanks!

[16/34] dt-bindings: pinctrl: qcom,msm8226: add functions and input-enable
        https://git.kernel.org/krzk/linux-dt/c/ca3a311c3a8db80ec3965d9ac02499f9536d3393

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
