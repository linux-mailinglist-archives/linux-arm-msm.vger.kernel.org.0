Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BA64C579E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 19:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiBZSle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 13:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbiBZSld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 13:41:33 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5600F1E64FA
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 10:40:58 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id ev16-20020a17090aead000b001bc3835fea8so7780735pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 10:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NhYp7rvNV+p3QtraK3mzi6k8+sTimZVZsYgYTKLgOjw=;
        b=ktI7wjlrlnHVlR7gidgss4RFsubYBAMmdP1LjboWTcwBtemI2uUEBev1G0JAAWHJrU
         gNvV5jaUhrlWBCeloQ8Wk6mFC8Ej9d7c1ejiXJHegJxc0J4W11egy3iFDUPOmtIB3jE0
         FXGzchdtuRILbMXxoKmnxDTub6qmaq+mXno9sBbppD/LCZleUgnZ2nNaW0GHT6pVCzCn
         UimUSDgRSQQcD7plCi78gRIo7cgbBKPYZa/WuHnpRNKLsOk5R9AQhcpESJIKBbRF3h9Q
         fmsq73BqZMlXS5Jiimc08PyCaTPxEZ1ixvKZVpvwjkqO1DIRKqbUsvLP/rMtb67SJAPJ
         X3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NhYp7rvNV+p3QtraK3mzi6k8+sTimZVZsYgYTKLgOjw=;
        b=jvg0Bjp2HV94hyOZKGOBiQZB+4PypnyRzt+CUG1uqRjRftC1BcllP1FSxxA7t6tfTf
         9p08smRq5hnmj2+n7BSrvKPkt5TGiPHrVEeZyPbvol7Mc47eyiXqijdnfoiLIt0miMZk
         Arlrec/Q5l/GJDSFZylxWOLUG8uLCVKeLC0tYyonP8P7ynio8Y4VvYlPjvymg5Eie2H3
         2Ook1OC8qZy5AJvsUafeQiraUBwLdx4VkKdaQw28WTBQrZec0SHYqCXQyIYvc1dg6W41
         yaRoixMDNkpmzsT+8zRunp7pNB5WB6LOIXbIFx/WlARXHwGD+cdSU5aw4F5iyqhdHrds
         R5WA==
X-Gm-Message-State: AOAM533M3OZfYhTI+bEkv2kHhChM6K9oeSKk+SxUoSLJUZqy8OUkl2UO
        PUvNqjt1bp0JADp+d5e3/KuxsZvSnrEyNA==
X-Google-Smtp-Source: ABdhPJww4jzPYcubElE8G9u93oVs9BTdT1cirgioMPIGfdOeCIk//dvrTS0HnJCnk/dhH+SNFhf7Ww==
X-Received: by 2002:a17:90b:1054:b0:1bb:fc13:73ab with SMTP id gq20-20020a17090b105400b001bbfc1373abmr8946775pjb.241.1645900857671;
        Sat, 26 Feb 2022 10:40:57 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id b187-20020a621bc4000000b004f3c8f3b560sm7049319pfb.129.2022.02.26.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 10:40:57 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/4] pinctrl: qcom: sm8150: Specify PDC map
Date:   Sun, 27 Feb 2022 00:10:26 +0530
Message-Id: <20220226184028.111566-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
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

Specify the PDC mapping for SM8150, so that gpio interrupts are
properly mapped to the wakeup IRQs of the PDC.

Cc: Maulik Shah <quic_mkshah@quicinc.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8150.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 7359bae68c69..1cc622694553 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1500,6 +1500,25 @@ static const struct msm_pingroup sm8150_groups[] = {
 	[178] = SDC_QDSD_PINGROUP(sdc2_data, 0xB2000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
+	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
+	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
+	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
+	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
+	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
+	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
+	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
+	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
+	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
+	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
+	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
+	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
+	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
+	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
+	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
+	{ 152, 108 }, { 153, 109 }
+};
+
 static const struct msm_pinctrl_soc_data sm8150_pinctrl = {
 	.pins = sm8150_pins,
 	.npins = ARRAY_SIZE(sm8150_pins),
@@ -1510,6 +1529,9 @@ static const struct msm_pinctrl_soc_data sm8150_pinctrl = {
 	.ngpios = 176,
 	.tiles = sm8150_tiles,
 	.ntiles = ARRAY_SIZE(sm8150_tiles),
+	.wakeirq_map = sm8150_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sm8150_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static int sm8150_pinctrl_probe(struct platform_device *pdev)
-- 
2.35.1

