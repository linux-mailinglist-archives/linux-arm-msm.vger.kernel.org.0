Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA4368202D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 01:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjA3X7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 18:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjA3X7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 18:59:40 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C0D23DA2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:38 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id dr8so15318527ejc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWGy+d1x41QAHpHzB5Mf6KI/uH3br8ARPCTrkb+qZ2A=;
        b=HwHIHYZ51hTrApQCxcPqlwjpY/C4bkSm1evdoWD0HfowfZl3UFnwuC8bP3nNMPAgCQ
         0tD6Y291TuLrYBKVkrHcxZC+gVy3LCh2PjYgZreqhoEVvLZ5dZUJyNPMtSSs5Yy1LOe4
         ghD/82FNbm/LWQZN/5yIOXEfIJXGEzi/0/aPk6wth3dmggXQu3HYXFISNNdIKQtFEt7F
         rRTlJmx1DZz6ftOoCO5XNhA/Dw3y2LMCyWL5VFGjESIPObwFN6Rr11zj1peSRrD1I/m6
         Hkiy1BfWnCPMRlVumPy9lb7LHX/C4HB6CXDCvW/POXakY8bNbnDm+GyAGegdZtSb42cM
         KsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWGy+d1x41QAHpHzB5Mf6KI/uH3br8ARPCTrkb+qZ2A=;
        b=6A+AZy4Kq+XkXEmv06ti/BPXDRjcTp8eiP/rRgtTNsn2l1XzoZtff1/hn0iHxXu4Nt
         ZMxNhN6oKC9EvGsY7393wtgPQwbsMHGDWvWhOUlp6kZdCfFIG50CmC51Bff22jPY7Yl8
         AlbnbWWn2uarYEJ0BAal3MHcaeKBOMqurWGpwXcoFDkFDl9GEuE28nLJauXcQVnKapO6
         P98ylB6gZhTWCQUgFX1AaKk0WnatNj9j/ymb1jcS9nKWYQsgclY4k5ksqe504Rus1ygC
         AAF/gKIyatZuKJUalMHkDZp1BRnMdwapGd14FzWbZ6Wrqcu6LbSeQm048iB5GrlAjiN6
         ioiQ==
X-Gm-Message-State: AO0yUKXsp2OqDe/kkWqmoUQ6nQJdqMqVXy3eLVz+0wXHOpZeebeUllDq
        e7HK6onTa5wpY0nIZvi1AfX64ORjSd6yeU7A
X-Google-Smtp-Source: AK7set+qvO4ZJPpcreCNkzu66bniCosBFysoLXXQm0cL+NiQKVRH/XnINxwtF8VCR8zqZlSsB5xSTw==
X-Received: by 2002:a17:907:728d:b0:88b:bf70:2e79 with SMTP id dt13-20020a170907728d00b0088bbf702e79mr1288223ejc.30.1675123177051;
        Mon, 30 Jan 2023 15:59:37 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id jr23-20020a170906515700b0086f4b8f9e42sm7577751ejc.65.2023.01.30.15.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:59:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] clk: qcom: branch: Add SLEEP/WAKE fields definitions
Date:   Tue, 31 Jan 2023 00:59:20 +0100
Message-Id: <20230130235926.2419776-3-konrad.dybcio@linaro.org>
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

HLOS-controlled branch clocks on non-ancient Qualcomm platforms
feature SLEEP and WAKE fields which can be written to to configure
how long the clock hardware should wait internally before being
(un)gated. Some very sensitive clocks need to have these values
programmed to prevent putting the hardware in a not-exactly-good
state.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index d8fc7b93ef6d..773f760a4590 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -41,6 +41,8 @@ struct clk_branch {
 #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
 #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+#define CBCR_WAKEUP			GENMASK(11, 8)
+#define CBCR_SLEEP			GENMASK(7, 4)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
 {
-- 
2.39.1

