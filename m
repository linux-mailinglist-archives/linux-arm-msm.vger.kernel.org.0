Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22283683646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 20:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjAaTT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 14:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbjAaTTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 14:19:48 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B11144AD
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:19:46 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id n6so12820496edo.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TknF9ez1i9mYFjSeMX9CHkG5E9Ti+NVIIB/8UZbo7kI=;
        b=c79OJQMbJ6jYG0JsqF9libOA2r6DD/9K7H1yJTHROa1tyM0EW9mr0IZf6P1/v2po0D
         Lt3qQ6cRLCU8BL44l5kMefi9fC4UA/29TRKKBwSjyg6RXiiRh0QhnA+UzC988J/rO9/4
         BxgtkYCyVry9H2A9LZ8rC9dirmbvbSxwNrAwVlGbo9DvzBbTaFL+M9Hlhz006XH2Jkpx
         TO0bvscxhROjoNK0R/nyA+8lDIDOxd3sdObC9npKVvUoj/ek8s02u/zXay3G409VuSqO
         9mOfJHagVwJLYFpXcv/Rl51lXq0cIvsur4JMjqmH7uYpBaFfjkG8Hv6/abnmtAvmH4eD
         5Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TknF9ez1i9mYFjSeMX9CHkG5E9Ti+NVIIB/8UZbo7kI=;
        b=VRZLx+bX+tMwb/MUYE4TIv5VVgwFZnmPdDKm6H2a0j2IdkDG3tqDckI1kRHgWgRzrA
         JkVVjiE2XSX65yONtLqZGM1Ri5T1jYPDTcSKMyqZvB02Tn9R3ZIIpPvXnfbGSoyReVOx
         MTYpOvOx6wluUd9yNO9WE33ZuC+T1yG5L73nMIrvL8a7gO51vnLJp67Ut3Upju5NS0pn
         TwA3M/9xyPlJpLHbqqZ8oU7nRkcGHizmyKJGpq8mlk1Szni4wZn38bFDdkndllmdBQEN
         Wu1+iGYI6a0SZ/y6gPmjlxaqwOKlwwUyzLe1oGdLF4m5ls/q/AUFxQxwwsDmRP/HoutE
         2n7A==
X-Gm-Message-State: AO0yUKV6cB9RTrbOi4uU22EBd+RxvhWbu/oXD6wA0IIejB/IrfOaWzuc
        5WB7llIgbkKP8AP7Nr1hkF6nIL82nKOnR4du
X-Google-Smtp-Source: AK7set97AdQmeSZfU9qeHJgvw6OEfqdFyxEugOOiZbJsMALb91xFzkfXbgZyeKYOsJdq6/Dyi6fUvw==
X-Received: by 2002:a05:6402:3814:b0:499:d374:e18b with SMTP id es20-20020a056402381400b00499d374e18bmr153459edb.35.1675192784991;
        Tue, 31 Jan 2023 11:19:44 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id f9-20020a056402354900b0049e9e9204basm8642344edd.21.2023.01.31.11.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:19:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        D Scott Phillips <scott@os.amperecomputing.com>,
        James Morse <james.morse@arm.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Linu Cherian <lcherian@marvell.com>,
        Michal Orzel <michal.orzel@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: Add a couple of missing part numbers
Date:   Tue, 31 Jan 2023 20:19:40 +0100
Message-Id: <20230131191940.2903908-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Cortex X1C and add/clarify various recent Qualcomm Kryo cores,
which almost exclusively mimic ARM IDs nowadays.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/include/asm/cputype.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 683ca3af4084..4b79a0d44c65 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -84,6 +84,7 @@
 #define ARM_CPU_PART_CORTEX_X2		0xD48
 #define ARM_CPU_PART_NEOVERSE_N2	0xD49
 #define ARM_CPU_PART_CORTEX_A78C	0xD4B
+#define ARM_CPU_PART_CORTEX_X1C		0xD4C
 
 #define APM_CPU_PART_POTENZA		0x000
 
@@ -107,9 +108,17 @@
 #define QCOM_CPU_PART_KRYO		0x200
 #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
 #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
+#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
 #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
 #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
-#define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
+#define QCOM_CPU_PART_KRYO_4XX_SILVER_V2	0x805
+#define QCOM_CPU_PART_KRYO_5XX_GOLD	ARM_CPU_PART_CORTEX_A77
+#define QCOM_CPU_PART_KRYO_6XX_GOLD	ARM_CPU_PART_CORTEX_A78
+#define QCOM_CPU_PART_KRYO_6XX_GOLDPLUS	ARM_CPU_PART_CORTEX_X1
+#define QCOM_CPU_PART_KRYO_6XX_SILVER_V1	ARM_CPU_PART_CORTEX_A55
+#define QCOM_CPU_PART_KRYO_7XX_GOLD	ARM_CPU_PART_CORTEX_A710
+#define QCOM_CPU_PART_KRYO_7XX_GOLDPLUS	ARM_CPU_PART_CORTEX_X2
+#define QCOM_CPU_PART_KRYO_7XX_SILVER	ARM_CPU_PART_CORTEX_A510
 
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
-- 
2.39.1

