Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8B1789B35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 05:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjH0D2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 23:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjH0D2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 23:28:11 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF46ACD5
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 20:28:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9338e4695so32462031fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 20:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693106887; x=1693711687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jEwHJKZuaMJ1K+mHgMlvEIYS1NT0o5IAPoON35Oxpc=;
        b=G8C02m3kw8TgefxEn0rp9pofAWcoofE2gqf6N5A6CTM6HRTUgun1ahmqeMfMZRGtWn
         oMg6Qs6QeCHezMMo8Pz9uyR26iHmsQ8hIfZd51nvGwDO0RMukfF75NBsv1CETMtxeYcW
         4WXJR4qGP3EYBwiXnIyPSbcycKqyvnzoClL1jya5uR7iBdORndvz36sMPhbB6Mb2e+Gs
         5hlkM1EjPfAPbMg0RfOUXy0p2EIJ0X5BBvGuRRm5ulFa83g0XWUh14luoChD9XCkxGWa
         rl2nK5odSXp5nGj5EDDL55NlkJqs+F/WHUfe5W/G+YPEJSBvArmzYoW0Vnssb8WzpAZ2
         mpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693106887; x=1693711687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jEwHJKZuaMJ1K+mHgMlvEIYS1NT0o5IAPoON35Oxpc=;
        b=GMsRygy2IKfGZCqZjNZQP8nadvIrP+80nN6JKHQJWmZcys5/pStAsQrjD/NPybLWeD
         xtDUkSdy2miW92i1V1WXKGfWz+oZDPfOYUVbZD3RHlSpQQCxyCwpucVsZ5A2qSgZtfmU
         P5mjPHDiWSy0icGNTlAV3Fy2IDhAmkGkvO6nl74bz/RamJSkJrFsFE/Xb5BJci8/n82Z
         UcUAuAe9y72nGihJ0XLHJZ0AiUR+hycl4iogVBtUTMIAyTNP/wbqEUzboZaQRI02s5HL
         L8LmvgqzpJZEflFs3sdJEaufg7Zm9IoIL04tGmpAOtw+DJ/bQSu60RZP1NFkAPUZpI0a
         Yi/Q==
X-Gm-Message-State: AOJu0Yzi4HcOxaXOQ291UGHld0AhyhDj6omJtGdW4Wf/EfYqPxjS59yn
        mbRdl5VLcTMWloIBXMV3fM15ug==
X-Google-Smtp-Source: AGHT+IFW3Tnvq+titUDJOIoT8z7qbYZWW3LCEn3XipfERJO5Ybc4sUWphJslLk5OFk1zLoOka3N2vA==
X-Received: by 2002:a05:6512:3c96:b0:500:a092:d085 with SMTP id h22-20020a0565123c9600b00500a092d085mr7773135lfv.68.1693106887008;
        Sat, 26 Aug 2023 20:28:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w7-20020ac254a7000000b004fb99da37e3sm955709lfk.220.2023.08.26.20.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 20:28:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 3/6] cpufreq: qcom-nvmem: also accept operating-points-v2-krait-cpu
Date:   Sun, 27 Aug 2023 06:28:00 +0300
Message-Id: <20230827032803.934819-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827032803.934819-1-dmitry.baryshkov@linaro.org>
References: <20230827032803.934819-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

the qcom-cpufreq-nvmem driver attempts to support both Qualcomm Kryo
(newer 64-bit ARMv8 cores) and Krait (older 32-bit ARMv7 cores). It
makes no sense to use 'operating-points-v2-kryo-cpu' compatibility node
for the Krait cores. Add support for 'operating-points-v2-krait-cpu'
compatibility string.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index f4c196ba4432..04329ef61150 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -238,7 +238,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENOENT;
 
-	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
+	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu") ||
+	      of_device_is_compatible(np, "operating-points-v2-krait-cpu");
 	if (!ret) {
 		of_node_put(np);
 		return -ENOENT;
-- 
2.39.2

