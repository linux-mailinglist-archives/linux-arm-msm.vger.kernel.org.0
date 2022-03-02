Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5481A4CA25D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 11:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241070AbiCBKkt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 05:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241068AbiCBKks (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 05:40:48 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B747FBF506
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 02:40:02 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id mg21-20020a17090b371500b001bef9e4657cso1060093pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 02:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pq6jKLtGHQsUT6iafR8v8xBWK/Sf/g1/dX36fql3M4I=;
        b=EVYKZ1nXdOBRMVBEuZ0vUSAHriHHBiRo7e2sw7KOvF3JmJh/+iRWyb0PnKDK/paOUa
         +QbxooHCgR6BLMR+Qjf5y3owxxUpoKVqK7aev4IjD3vWYIaCBnE4/n1MPjUpqSrHBFca
         2PoeBHGJ80zEnH15/eSbjdjsqc7kv2nle7Y4B6STd0/pY5/S+1aii+RjcxEURp6tHOrV
         XgSnpetupAWNzGAAUuQD4/5+iVPS4Ry470EV75Y60sFn07HUv6ssKcK08wG/zBzxpFzQ
         9gAnB0Bk7Ip+S5G6MB2qyx9Bp4L91yqr/YDuHBdY9yNCb39DNB4IpTvqr2BT3epWbGDR
         Zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pq6jKLtGHQsUT6iafR8v8xBWK/Sf/g1/dX36fql3M4I=;
        b=eFOHl7WKF3hrT4HDgf4flHRY7ANZOoegsMEFiMzz9oUZMaH9W+bgRYMt/ozee5GCJP
         zRav1kL53BIJC19RhjZd0IMORuPFpSWVvR8MUoyRYXZDAm46kFbSJVnTotvH003qtm5N
         jKqM1UaK4lTu0sRBCycf/u3PjM+E573aXaqY15uKqiVZ2J5BO2EXS1+Zxsb82VnHMLwQ
         a4gNxQ01CqHSOuP5fTbFg9GCDgquX7i33i73ft3qytk+7d0QpRfcEmfNtNv3+m5DeR/J
         k5V05sefhOTEwGamRFfQPOzDBpf4n6TwRXnhAnW8j7/iAAHe3WDUVGbqufuhVxBiY3P0
         Yryw==
X-Gm-Message-State: AOAM531rjbTCTOkFeU6C3GpxtwxMQc7Ec2LrIWxXrcw9cRYAZ0eVRJko
        jgpLdYEEzIqTrt+69REx+/UyKi+pbnCeRQ==
X-Google-Smtp-Source: ABdhPJwQUPKAnnn9iLIXF/B8bDN6A7uOJd4C0X1jTMj3JNqZd4rykY8pvF/ArLHTfHAmPPXS+8ye0A==
X-Received: by 2002:a17:902:e943:b0:14f:4a2b:203 with SMTP id b3-20020a170902e94300b0014f4a2b0203mr30121444pll.113.1646217602135;
        Wed, 02 Mar 2022 02:40:02 -0800 (PST)
Received: from localhost.localdomain ([171.50.175.145])
        by smtp.gmail.com with ESMTPSA id m20-20020a634c54000000b003739af127c9sm15612308pgl.70.2022.03.02.02.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 02:40:01 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     netdev@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        davem@davemloft.net, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: [PATCH v2 1/2 net-next] net: stmmac: Add support for SM8150
Date:   Wed,  2 Mar 2022 16:09:49 +0530
Message-Id: <20220302103950.30356-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302103950.30356-1-bhupesh.sharma@linaro.org>
References: <20220302103950.30356-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
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

From: Vinod Koul <vkoul@kernel.org>

This adds compatible, POR config & driver data for ethernet controller
found in SM8150 SoC.

Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[bhsharma: Massage the commit log and other cosmetic changes]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2ffa0a11eea5..8cdba9d521ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -183,6 +183,20 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
 };
 
+static const struct ethqos_emac_por emac_v2_1_0_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
+	.por = emac_v2_1_0_por,
+	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	unsigned int val;
@@ -558,6 +572,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
-- 
2.35.1

