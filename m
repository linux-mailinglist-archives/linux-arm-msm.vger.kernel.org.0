Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF12570E3C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjEWQy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 12:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237601AbjEWQy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 12:54:28 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C31E6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:27 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2aeea823a5eso132861fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860865; x=1687452865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEVdSBl05HoD3jKmlqjtQqmkZDEcCVv5n8JBsOat61I=;
        b=hBAj9Wj7K+uW/BDjOGtQKuP5VOdvMYmOHD4EI2cXLyst0UcJMGbnBWeKyoEljG2VrN
         V0Wkg4njoabS+e1harAzZwFzWxHKxHYj4YkqWkS0v58XSkKHDxtQLXoHs8NjnnnYbWEU
         Tmlp6qg0a+6rUl9LscIAReCdBNz2uVAh/+UNlO5MItFc44MmLNhk4JBVMxxw/DWQdeP8
         auhH6w4EYzKYkFMgG7VzYmvPxrZ1RUFXCmqOCwG8XG2a/waYXMgoXPML1BSql7WAG725
         rgxO9GUwNLjqVw8LWxXq14hA4dZbE+1k0PVYGl7QfJIMop2DuW25IXFRTDbqhTJriBeJ
         bg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860865; x=1687452865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEVdSBl05HoD3jKmlqjtQqmkZDEcCVv5n8JBsOat61I=;
        b=LeSvvZrQpSc/+WmXWFja8yE/X8zZ/jfjfgFvuGaN6XHp3iJLlE6zXReoyPB+LZuLZk
         O1sBwADPxs14TTYvEBJ/y0sz7SQ3LoyjJtUCEWTGftclFQrdODmk+tAc0KZGkX+1QGFx
         +Os03KQXhrfjGGN2uJ8j+mgsqx0fNIzlKToiHLX5DVJixzz/7tvmLtEgZtOXCw8WLDN1
         EQj7ztJRhEMHAqHRgFBIzBl5UxCpC2lES02+BgCHVwDqvej4FTcln6AEUE2fbGNinvjR
         TYMfT693WRmRhxt4CTVxeuLOePF05UH1N2EGCT/t6fAvQ+Fm8qZtWMchSZAIsQ9FnqJ8
         IYtA==
X-Gm-Message-State: AC+VfDwx+G/ndJsx/OFL7haOpiksdIxeHS1QJ913HTAwiiwG8ji/8EY9
        cEahZemmvCYcNe8f+LKKXjxoGw==
X-Google-Smtp-Source: ACHHUZ6tdhUz4fTAhkihts16HSJpJS6Gm7CPkUB5T0GPXcJf+35nZnauKeNrtT49NsuS7l4sgU071g==
X-Received: by 2002:a05:651c:2ce:b0:2a8:cfa9:a2b7 with SMTP id f14-20020a05651c02ce00b002a8cfa9a2b7mr4733903ljo.1.1684860865377;
        Tue, 23 May 2023 09:54:25 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e84c2000000b002adbf24212esm1695245ljh.49.2023.05.23.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:24 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] arm64: defconfig: Build display clock controller driver for QCM2290
Date:   Tue, 23 May 2023 19:54:10 +0300
Message-Id: <20230523165411.1136102-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build display clock controller driver for Qualcomm QCM2290 platform.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ec9b828b14e2..3ec556cdfac3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1164,6 +1164,7 @@ CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_MMCC_8998=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCM_GCC_2290=y
+CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
-- 
2.33.0

