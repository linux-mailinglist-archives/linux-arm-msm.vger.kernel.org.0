Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 555CE56441F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiGCD6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbiGCD5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:49 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D05DB849
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:22 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10be0d7476aso1955521fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QeMYTQee43CPE+lyq9lDuEr9WoYtQG0AVh8WQgK6jrc=;
        b=tjkpbaUtd4Iyf1G5iukngfm5O3fKBtLsKbtSSgdPehNwDjMKBuQQR7i0Yk1M8uc7N+
         FkrgyS5PfIqjmPIQP5CtECwKQfrT5F9rV/OWs8wOBoM70PDiCVYgoAN9BYOMeS/mYzZc
         9ZBrA28nYwMVuBHNjv4YLCjkz1Fm9TSktGmE/CCxbGAjW5z+6HL8QmoUL/EpJSLzoTji
         ywxC5JiDOgpd9ghfoYzk1yLMzskdWyTibFe6LsGfZ+dttVM+GU+hAiFuvpfziLvLWXVD
         2M5LMUVsFdmm2PN38MCqpmRnd7SheX9p8yoIYCuJZR+0KLfJwQi5N1BVINY4v6DeGAg0
         JrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QeMYTQee43CPE+lyq9lDuEr9WoYtQG0AVh8WQgK6jrc=;
        b=ZNDOuccO86rZZcDH3izW+69ctszo25o15UoZ1MqIsic9TBuhCzSYsmYTT98WFefxQ5
         ivo7h1hLFi8iZIhegXKVx24yjoKVtKOLxXaLt8GPqeF5yU8pPaJRNT2oqNrfnWKiszot
         1t63Rw2Ao4hbLjqvgkVS4hW7J46AFGlYmUYBGVHaq3Tdxvdca7Ok0EayGORefXgnaETv
         twSnDoMt+gQYfW2bKEaJ0zQWAj9889LW7GNa6a+8lhdvU/+oqkjQf7AxKCUItIVMn+rq
         7CUNqV8BbUg8kpN+YXDq9rNMEDvv3xGRJIXcDmgs6ISyCKiE7Urx6/b2SIWhFQx9Rv1N
         R3ng==
X-Gm-Message-State: AJIora8QlSORPBzkCCvNu97I9ETVHGg0z4ZAO3+S5H85FjEfS5RrfbQm
        5oJY04JHVFod17OJD3kt5zYg8QVtQqrXIw==
X-Google-Smtp-Source: AGRyM1tI7JZsyB7A+5rq7qIzhfRVKp2IKNAORDrQG4rln5D7uFiR0yWiDqFPHXQsQwwW2MMZJDIXOw==
X-Received: by 2002:a05:6870:2482:b0:101:52cf:d099 with SMTP id s2-20020a056870248200b0010152cfd099mr14525774oaq.44.1656820642102;
        Sat, 02 Jul 2022 20:57:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 11/12] arm64: dts: qcom: ipq6018-cp01-c1: fix Micron SPI NOR compatible
Date:   Sat,  2 Jul 2022 22:56:18 -0500
Message-Id: <165682055968.445910.715276604065969931.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521164550.91115-11-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org> <20220521164550.91115-11-krzysztof.kozlowski@linaro.org>
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

On Sat, 21 May 2022 18:45:49 +0200, Krzysztof Kozlowski wrote:
> The proper compatible for Micron n25q128a11 SPI NOR flash should include
> vendor-prefix.
> 
> 

Applied, thanks!

[11/12] arm64: dts: qcom: ipq6018-cp01-c1: fix Micron SPI NOR compatible
        commit: 693b6207fc7fbfe81aa9759ef82c3953245641d9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
