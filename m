Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDCD682028
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 00:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjA3X7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 18:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjA3X7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 18:59:38 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4408E6EB0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:37 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f7so5553206edw.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK0SKG71RZ4dw+5nnEyn5ShqdhAamRvl2RaxLYeTyWM=;
        b=Ds+Afxgf+WLba6Gy2WOS4g51/bZH2b9Kx8axvdSVrcpQPKh8wQ3Ksk1rrnyBtljdgO
         IZg0o6WMPPeylVznB8LufOQpUTYXnQ63/cCNM81XuWkrnQdDXALUyqVDbL+XAHluK7Dd
         aX4AaCq4VT+vm3o+p+BF1zjxTzD04w4smD/zhjSGznBdSm4fqO8k5r8i+0v0HLAzDESP
         XBqZOmxuUPEPydiRltZcChObSQJYZjd2qkYQzMuQsJRyGgiImbfzl3p6sKAhwtu1lArP
         lQTYAjUibT/mD9BelgSmYXwseWDWZfHWbXMc3AVxBISapFP8XKxzrTBuCaAMRxqNC6nq
         rzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK0SKG71RZ4dw+5nnEyn5ShqdhAamRvl2RaxLYeTyWM=;
        b=dN1nnRUiLWBNtcaVtpSOWtPlEEZXML/dgrbdSFHLNEOZhtIexDRZNK4HF9s3xQo3wb
         gDj+2XqG2WLoHgtfsnF88Ya8FyX7YddqX4Fcc3UOxLYbDM39iKhdWy3n5wDv+D2K8RPg
         38mGU2VCwUgmCxGcuh+w7wIAxzJA/KuOp5OGtMUvRojHY+FnRsoTVUuSdEPubPOlOkeZ
         S6PYaIJQjN5T9NdnTFRHXPoY+MNwIrzlIcMVfIJlijO/273zqUXxRWRgLWFrLVSucW8d
         HNOskWZ+rLlhWqjpLS51VQVptpW6JDIzDY7ddCSBL4iSASuvsnPd4aUYZ3Ex7BoJvICZ
         gEYw==
X-Gm-Message-State: AO0yUKUFo4kJ9Zx3lNo433XXfzDxlgQINA/XeFqiPRUgldpd0hz5y1Om
        875K+bknNEYsoOsMvZE/44XafAifmxQOYf9o
X-Google-Smtp-Source: AK7set+DvD1f/qWBDXWGJGHc67MGaPFe4rogyFsOqW1NG9bIpzvB/w9olBYGTMXIDNGL09aPRx2//Q==
X-Received: by 2002:aa7:d858:0:b0:4a0:b7d6:57db with SMTP id f24-20020aa7d858000000b004a0b7d657dbmr21224156eds.33.1675123175668;
        Mon, 30 Jan 2023 15:59:35 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id jr23-20020a170906515700b0086f4b8f9e42sm7577751ejc.65.2023.01.30.15.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:59:35 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/8] clk: qcom: branch: Add helper functions for setting retain bits
Date:   Tue, 31 Jan 2023 00:59:19 +0100
Message-Id: <20230130235926.2419776-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
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

Most Qualcomm branch clocks come with a pretty usual set of bits that
can enable memory retention by means of not turning off parts of the
memory logic. Add them to the common header file and introduce helper
functions for setting them instead of using magic writes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 17a58119165e..d8fc7b93ef6d 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -37,6 +37,29 @@ struct clk_branch {
 	struct clk_regmap clkr;
 };
 
+/* Branch clock common bits for HLOS-owned clocks */
+#define CBCR_FORCE_MEM_CORE_ON		BIT(14)
+#define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
+#define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+
+static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_CORE_ON,
+			   on ? CBCR_FORCE_MEM_CORE_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_on(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_PERIPH_ON,
+			   on ? CBCR_FORCE_MEM_PERIPH_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_off(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_PERIPH_OFF,
+			   on ? CBCR_FORCE_MEM_PERIPH_OFF : 0);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.39.1

