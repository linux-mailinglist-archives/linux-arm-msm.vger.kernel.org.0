Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16CAC68908A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjBCHRk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjBCHRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:17:38 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125818F51D
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:17:37 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j25so261292wrc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBmsftP+GAWmlAquXkMScqMcMqKunjRFUolMRfLIvDc=;
        b=qTglfR1djf1Iq65IprsCKWWaIgWuZB5B1LbqZjdS1nSqcgFYnlrZsatht1iNn27QVQ
         rc7pg5EZR40t6W5YtgBDJevhSdhWr6E8kVJjI5Xzmqy8J7tBx0/K8nzNZaP25FTg9sp7
         N3Mj6i76FrCKlJVDJdaQo/0+ADhqeLafFmFtUte6Jk8J5kYIoUasuqQrUREeaoJiAgF7
         nFO0PGwR3IkiUMpS0gtMWf9TTadqktJL/H1i3zLYzpM/6PiV+Z6ZxfM9blUSTpPI0xSu
         Hn8YbqNMos1ky5zEnhAFyN/QzkyhDuLcNDjLBQj7pRZ32oLXTUmCcDgttX2dPD3Mt9+8
         r1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBmsftP+GAWmlAquXkMScqMcMqKunjRFUolMRfLIvDc=;
        b=VrN2BU5iRzhRmWhrIpm5jrs3vcziAvPXIyz9QOtNyFWWoFYiuCh8PZLDDZz6FPsN/s
         Sx3mNMHOlbHB/u15c3Kv9+00P2en6z3LYqbVoZw9juuoSGVpgbkhHxG6WDVi8XMoqTR0
         lW+MTKzK0taSugdSM1DHVFWiKPZ5CTmvt1BzJX72dKwGOFVd0zfPZUXCAe5mvqu4Y/oB
         KiqfEhmPoXaMq2N4uH5X8kB7d8Ve28djC02LToLbBGWRmXGE0gCkfzBE4Bnep42IG6qF
         A+PBdYh0ADROTIejamfKVjf/ijqkxhZ2HfP3ZKdpPVHqiDb8WF3yPt/5kts3I04uXdqO
         2x8g==
X-Gm-Message-State: AO0yUKXPXtTd2fJwaCFSUheAsYFntqEQ6bBocoGkHj/nSnAgJN1RrnDP
        tDzucAZCqtstgimf6/0/aTDmoA==
X-Google-Smtp-Source: AK7set/NehtmqA2e9h0V97neCJ/DT85nXS+R82ROQ/ZB16Ub77etI/id23JuEAPcvSwB6AXtoApVqw==
X-Received: by 2002:a05:6000:182:b0:2c3:57c5:d17d with SMTP id p2-20020a056000018200b002c357c5d17dmr7525537wrx.49.1675408655558;
        Thu, 02 Feb 2023 23:17:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:35 -0800 (PST)
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
Subject: Re: (subset) [PATCH v2 03/10] dt-bindings: pinctrl: qcom,sm6375: correct GPIO name pattern and example
Date:   Fri,  3 Feb 2023 08:17:23 +0100
Message-Id: <167540864401.6835.2298221420493281083.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-4-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-4-krzysztof.kozlowski@linaro.org>
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

On Thu, 2 Feb 2023 11:44:45 +0100, Krzysztof Kozlowski wrote:
> The SM6375 TLMM pin controller has GPIOs 0-155, so narrow the pattern
> and gpio-ranges in the example.
> 
> 

Applied, thanks!

[03/10] dt-bindings: pinctrl: qcom,sm6375: correct GPIO name pattern and example
        https://git.kernel.org/krzk/linux-dt/c/a51c1f0244c84e482f1ceb4701c38aaa4b224baf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
