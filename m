Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D899505C68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346117AbiDRQZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346136AbiDRQZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:25:14 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4DE2ED63
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:35 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b19so19083816wrh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Guk/XiaMb056o/bqH2RFfnQtcE8TLfbDrVIkvwB6Njk=;
        b=rbAeUD5/Nw0A/pgqqGwmyBZ0WG+gv/kjuUhuJou3I8yht5JCqaY9uufoqmi++lya5x
         WvHU+cra7lzelnh5vB0l15d6UHNOCRDqnWX9AhTowh1oetLi/J243WD6dI/xWlEyCjMC
         IQfD/SpLnf5s7h83qFipT95+klm8UvqyqrnTwvMBgawc5xAuLtQAerx4vH7i6qul7JgL
         8x36x65t44tbnN/PAikzH7tf3fN80MjGrMTpsVoK9qNxgoa783pbFLIxC76YlAfGH8Bn
         LJp8BUk0Y6alpFZTd/rzOohwxWlrjw+XTrl6NtAmQ7H61is1Nz7ocVUn6F5R5MrTWRV5
         gN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Guk/XiaMb056o/bqH2RFfnQtcE8TLfbDrVIkvwB6Njk=;
        b=JkIBRc/1HhVPZc3qk92/yRqqpCsBDT889HWJvKw24GITD7OpGHCWNk3xT1x//TR7rf
         Tmiee1F4sMr8gSzGSsfGEu/ZP/XNFwwFVS5AN4YwJGSxW8XOrMm/SeX+Xg3Y/FwTId75
         qGGDemN+KlRp45EerA/rO7wpZPxsWm0mCCyiDAOh+xXpfh+hj3gJ8+VBHPFmv7L5UNUz
         U7TNZoI7L0uQnTjbB8LX984FEn5dGuDCQ0DhRv0x3AHkxTNdF9jNXxNzND+5iTey3Wwe
         +ANhN6pygpepvFBN3khwpnMvNSkNEI8Ez1LiGKaFpMjr0ycQBHUv0Xgb0kAloSlUqiTl
         ylOg==
X-Gm-Message-State: AOAM532+BrROnSr5fYaghLrBDxC8RuX61RiBzSbcATbR6VcQjuK2QSJX
        P+xIhK5fVniqvMxD7q/jk6UQIg==
X-Google-Smtp-Source: ABdhPJywo6R6LICfog1lm6qQ4PBWYcyY4lTz9BwePxkRdynxe0oxhw7HmbFCVIN0muzcIEDBXFf56w==
X-Received: by 2002:a05:6000:1f91:b0:207:b6b1:64a9 with SMTP id bw17-20020a0560001f9100b00207b6b164a9mr8556931wrb.286.1650298953655;
        Mon, 18 Apr 2022 09:22:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 205-20020a1c02d6000000b003928c42d02asm8460853wmc.23.2022.04.18.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:22:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ilia.lin@kernel.org,
        rafael@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 5/5] cpufreq: qcom-cpufreq-nvmem: Add msm8939 as cpr_genpd
Date:   Mon, 18 Apr 2022 17:22:26 +0100
Message-Id: <20220418162226.2983117-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
References: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
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

Add in msm8939 as a CPR genpd cpufreq SoC.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 355c8b99e974..63cbb6b57e64 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -453,6 +453,7 @@ static struct platform_driver qcom_cpufreq_driver = {
 
 static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,apq8096", .data = &match_data_kryo },
+	{ .compatible = "qcom,msm8939", .data = &match_data_cpr_genpd },
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
 	{ .compatible = "qcom,qcs404", .data = &match_data_cpr_genpd },
 	{ .compatible = "qcom,ipq8064", .data = &match_data_krait },
-- 
2.35.1

