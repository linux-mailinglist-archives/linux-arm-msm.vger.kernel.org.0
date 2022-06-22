Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B35455485A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353782AbiFVIgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353931AbiFVIf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:35:57 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726BA38BD4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:47 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id t5so110244eje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F/hLw10VPO91osuq443lJcyKKYrTvVX/tDBUoayUs+E=;
        b=koYQmYVk+PfNmCQNz1y1UaJo5p8PBTMTJDB8ka/c5G/oD+wVWcRE4yQysoGGUpSYfn
         K4llGnIDmSmqPHx6b6nO0m+As+Tqd2LekGS6PXUaA22Q9rfyeTDh7b3LvmRIQ912NI9i
         2moRx3u3w+v9bwVUuj0n9G0Foz1Jw1p33cVyI2hUXEmZcUorTZ0vD+iExac7WvAc1pso
         GOeY3MKfTbSLmIWuetrlYvwxuenpEnhnAG7BPJIvUiU/aN/6lZoWJgYgfCoG+4afZCLb
         ELd2V/Slezj96PihsJv7PPejm8Npc8mK7NcZ+gQogaJkPQ4dHZ9vL557eWiHyjqQS4kl
         woFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/hLw10VPO91osuq443lJcyKKYrTvVX/tDBUoayUs+E=;
        b=mCeMTr/WI3QASCH+TPb4WWG0NCdt2MaD9VBt6J84KsCLNkOc3dc1RPvm/CJCwfaPMX
         igiavav1/akx8TJ5yChVJtzQF/6cwwP1LaWO8dh+iJlKJRSIUTQjVmDAUXKygFwrimXw
         EM47ev++3yJNTV4y9HH4DMk56OkOw2mV2w6Np73cXy7VsQ1ngfVd/4OHC+B5NzvZJgnX
         hLJ8Eq5r5QgV/s+DeK5jYa70EJGRtF/3XqejtlTZUvf7n+10c7pSBo9EvDNZ5b408wVz
         a5rjzmMQWpF7tutfGVPeZUaAuLmEKLRU8d5Ihi4b2oL3ZisbDxALbuuwG0TqmJGHOuLo
         gXEg==
X-Gm-Message-State: AJIora/yo0cqvrCIyATQdgyUE2prFp2Padx3NGrQsAoBkbqxLkl0A0PN
        1fZjyOdH98RhigwoGV0fgh2Clg==
X-Google-Smtp-Source: AGRyM1uUImJ/tIjrM0xGIYhl4KAd9nMt3w3I7YWD5FZGM2jymGTlRe9irKxqSkKJFy3t1Rdld6mGJA==
X-Received: by 2002:a17:906:6a0c:b0:711:d9d9:45ce with SMTP id qw12-20020a1709066a0c00b00711d9d945cemr2030582ejc.184.1655886945901;
        Wed, 22 Jun 2022 01:35:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        krzysztof.kozlowski@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH 10/12] ARM: dts: qcom: ipq4019: fix Micron SPI NOR compatible
Date:   Wed, 22 Jun 2022 10:35:32 +0200
Message-Id: <165588692598.15720.3558202512187171238.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521164550.91115-10-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org> <20220521164550.91115-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 18:45:48 +0200, Krzysztof Kozlowski wrote:
> The proper compatible for Micron n25q128a11 SPI NOR flash should include
> vendor-prefix and use jedec,spi-nor fallback.
> 
> 

Applied, thanks!

[10/12] ARM: dts: qcom: ipq4019: fix Micron SPI NOR compatible
        https://git.kernel.org/krzk/linux/c/b67569748cfc9409e01e9ff6243e2064f24d3cf8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
