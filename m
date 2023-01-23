Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977386777BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 10:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjAWJtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 04:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbjAWJtq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 04:49:46 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DB1126F9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 01:49:44 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id n7so10204041wrx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 01:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA6ku88Ui7cCR9woFlvNbfPun3e9l3CDKTSDDDWP3/4=;
        b=LsCsorQ8vromB8KvpcIxRMZT0Z7V97LcS9Bs3a4hheoymEkwXmbQPryo9EuMALU+6Z
         tfmVLi8Sjwt0CcUaxRuaEYMjjtZJGNXvZcvsVz+aHzrec4pFw5v64Tm+ch7Xnuw0N7h3
         wS48Tmz2BZzv0yVbZwxDRfwtXTLzg1QCXVlqlda/yOkWSsaAWn6TAnIlvC1K+eabsgMo
         38HSOgArVJvLgBW7w7TlvfAScH24yz0LR5Rvft9UG+LCX2g31AaC7LPEAJ33wgrZQ0MP
         OAVv3OokBOJNQlBWV6/1c9NC4LyhbGU9HUPyTLqZEKRdQTm6wiF3Xc1zOg2O2C43huaL
         UlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA6ku88Ui7cCR9woFlvNbfPun3e9l3CDKTSDDDWP3/4=;
        b=wmjDFblvdKVhrx7Rg8SrMcDnkN/OSDMu97H7l86WUEyPkx/3hGEJQYolTj4LmncPhb
         dQkK/00L78OCbv4F5DOtXLsVvMGGsXjt2hVagMyL1FYwWX00XGpQqW89wgwhj/zWGqk9
         EEphxQJ80i/XMQyr0aCJfaLTFaomqKsZRitQsdy6PKBwcsDNhYnNDfwNndyxb+xi8h54
         fs/KfHJZHyb1SJvZ1AIIzmLtNeNB7+g2tZZPVa5LuU7pbFUSdLlhbDBXUkNVh1eIHQ7K
         c1aYdT+t0/KBqIJquPO3W+gsyE+uK/j7Sd0ydjFcGD9ssIjNucej0k0cfjET2umuHawm
         k+Zw==
X-Gm-Message-State: AFqh2kqrgkz0nUGwmgjTuUELsdtCZt6tyNNdvTmfGJkOKlYhAkr8zjPr
        j1XTWmA/ibVSalDFy6YKMediWbSU85yTPIE1
X-Google-Smtp-Source: AMrXdXu2RwlhdXc+m4uvpkI3yuhcARYDAODF4PD8dpS3ovEJGvul2AvjIc8xPVeYi6ofcqJxljhLrg==
X-Received: by 2002:a5d:554f:0:b0:2be:14e:15f3 with SMTP id g15-20020a5d554f000000b002be014e15f3mr19345907wrw.53.1674467383034;
        Mon, 23 Jan 2023 01:49:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f2-20020adff982000000b002bde537721dsm23976864wrr.20.2023.01.23.01.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:49:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] clk: qcom: add compile test to MSM8996 CPU clocks
Date:   Mon, 23 Jan 2023 10:49:24 +0100
Message-Id: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Allow compile testing of MSM8996 CPU clocks for build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1b6615fe1dba..1c360eed72d7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -48,7 +48,7 @@ config QCOM_CLK_APCS_MSM8916
 config QCOM_CLK_APCC_MSM8996
 	tristate "MSM8996 CPU Clock Controller"
 	select QCOM_KRYO_L2_ACCESSORS
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
-- 
2.34.1

