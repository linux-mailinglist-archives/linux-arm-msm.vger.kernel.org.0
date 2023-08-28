Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F05578B856
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbjH1T2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbjH1T1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:33 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525B51A5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:13 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fea0640d7aso34115115e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250832; x=1693855632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5UUEotKM3KPlt75iPa8nyLWoLcrw4bhDYA2GP/3CkM=;
        b=Lp3+/vZEdk1adx7vtq1BnepUYuSHIxLzsE7TOETlCJv+KHKzzWc/PEKZK3dimcfIsN
         bN7K01zSTB+hfS2i3EsL9JQsvaIpTI1e8v3N5W26Y+FtkAoTUSG/xxLNB/pSzmmZp0oH
         xc8EZK9Pijy4WDWTNPvoqY7pPJhXZZ3PH/Q3RZn/YCVrLwEd1HX8x6POdo0Ibs5ZhFJH
         XxBawl9w5Ha2by7sr+qGcoDYI+rUFRdixvecdQ2+XPlM7V9GWEnJgIOcY6kkqsvEUkml
         Xgbz4lnheXMjGyxSS+M5BHDwcRRC3r/RZkZHESd6/3EACCw2B2K4jE1HCU/5G+jvyiNp
         87SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250832; x=1693855632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5UUEotKM3KPlt75iPa8nyLWoLcrw4bhDYA2GP/3CkM=;
        b=I7daFCKTlSmeKli/M7qwrZcHDgxEJEICtwzvQ1PeO70EZWdrFdSBoOleUWhtjWI3Mu
         JAidpzSj46YE8WbL5QiN1yI964eGUTGYWg1ED9QUb4xkxEPDtaXZnigkUGyJpYR1x/9K
         YiyVLcumiR9C8dghS6lujbJCf/cCX9rMkzMKMCjAlGIypXaDKO2bY1RBO7UmnNcOEs6p
         oahrh/AV3kTlC6Jt1+gdsqXVbM9TmDSeK7a1oMZsVP2AaICxxeWQ8Q05E/pzM5VL8OAJ
         iMinPV+xmyqwIGXTpk1+U+MrVZrJX6VHXJsTORHdexhPhg/SCjj6/3PdUqNKtlm5yCKj
         dr/A==
X-Gm-Message-State: AOJu0YxYES/VMrktpNHrhGjkjXIRNVbg6pvOMl/9XJCO1cS4NZ5D6p1E
        OrAroqpzYZJtlW6E4pTAdRmiTw==
X-Google-Smtp-Source: AGHT+IGjgJy2rlEGsYdV6I6xyuANjKsdskic1BzqqdpwjuKQOjfX2n/VBEmdO4XGEgxS+FxXRwG0pA==
X-Received: by 2002:adf:ce82:0:b0:317:43de:4c0a with SMTP id r2-20020adfce82000000b0031743de4c0amr18604895wrn.20.1693250831938;
        Mon, 28 Aug 2023 12:27:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:11 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 08/11] arm64: defconfig: enable Qualcomm SHM bridge module
Date:   Mon, 28 Aug 2023 21:25:04 +0200
Message-Id: <20230828192507.117334-9-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most Qualcomm architectures support SHM bridge. Enable it as a built-in
module in arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a25d783dfb95..7f982d9966e3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -248,6 +248,7 @@ CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
+CONFIG_QCOM_SHM_BRIDGE=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_IMX_SCU_PD=y
-- 
2.39.2

