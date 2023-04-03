Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883056D45B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 15:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbjDCNZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 09:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbjDCNZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 09:25:32 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6664BE043
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 06:25:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t10so117140885edd.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weKVU1kTnYmV8Kz2hO3iwF9H+hKHLTD9FkkPqYTBdb4=;
        b=Nr3g+Hbl9L+w1ge2cQP835ENaUyoy3GnzYz3FXpww7GCn4U/JCBEF21ElDfb3y4+zw
         hi1mf3tfYM+l2M2IpoJwtOg09JjGLoj5NZJjpyzIalK02GcJSePgcGzl++cFH6Vknsvu
         3ZRqtxNYkovZVJ6+F5EbrdkHkxzREnDGxpdGBhzeexv+OwhW8rBJbh+MMcpSoUo/oUHt
         +fKjFbEO8uFyxXqd11LTqio2VmwruzhoZXvZnTHG+Wiq3lX/3q+/GK93LBKvZ00nINbb
         3nd6ogV80OnDN916s9frwHl8pJzQdoQqOy4+SAJ5p7AtT7eXFMG1E9tTdLt1VHB3MkNN
         yh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weKVU1kTnYmV8Kz2hO3iwF9H+hKHLTD9FkkPqYTBdb4=;
        b=lWiM5eBpk3Xa03sCd1SPdngTsP2SWkyr31WYXtN0Iu6QF1kq6CIWJcG2l1p92p+njY
         bxYuv0EZNpHV2Az0ZWQJ28x9gkDOxJHWdwtWak9v6Q7jmmNrfdqpIPSjh/XnfkLj7ZLE
         BkWjRUTmI/lYmOC6AW1I0oNmW7rbf0a3VAABBDUUFSA8H06b7uv5Gs80m8lDIgT0iClN
         WtOdpwPhAOKiva5SpvGXMHU6OcBBbWQTkl0klxhzuetvme+9vO/LXPsSQBzZRH1XQoSl
         3PM4s+0cp1fDYDi1BoLNTg28GwnYtm9hs88sZVd1LdejVURfJ+Qk7FvHRZ8ovM20nkqr
         9nJQ==
X-Gm-Message-State: AAQBX9cgcrRaGd22Z71V/PJVW9BciwchHvutBvfRXI8OWEPgZjJTMGg2
        GxGqSv4uUcmQBbDaoEQJhu9NdQ==
X-Google-Smtp-Source: AKy350YWrarnG+pOFyqN5H8GPs94VDiB0504oYYt4205v8N6P8ovj34ASsNOxyFu/AbLwsjVAIXL0A==
X-Received: by 2002:a17:906:81d5:b0:93d:ae74:fa9e with SMTP id e21-20020a17090681d500b0093dae74fa9emr34019824ejx.7.1680528314726;
        Mon, 03 Apr 2023 06:25:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906229200b00930ba362216sm4658489eja.176.2023.04.03.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:25:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Patrick Lai <quic_plai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 7/7] soundwire: qcom: use tabs for indentation in defines
Date:   Mon,  3 Apr 2023 15:25:03 +0200
Message-Id: <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use consistently only tabs to indent the value in defines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f2e1135ef113..77a5e4cbbe9b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -58,9 +58,9 @@
 #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
 #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
 #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
-#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
-#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
-#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
+#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
+#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
+#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
 #define SWRM_INTERRUPT_MAX					17
 #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
 #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
@@ -125,20 +125,20 @@
 #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
 			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
 
-#define MAX_FREQ_NUM		1
-#define TIMEOUT_MS		100
-#define QCOM_SWRM_MAX_RD_LEN	0x1
-#define QCOM_SDW_MAX_PORTS	14
-#define DEFAULT_CLK_FREQ	9600000
-#define SWRM_MAX_DAIS		0xF
-#define SWR_INVALID_PARAM 0xFF
-#define SWR_HSTOP_MAX_VAL 0xF
-#define SWR_HSTART_MIN_VAL 0x0
-#define SWR_BROADCAST_CMD_ID    0x0F
-#define SWR_MAX_CMD_ID	14
-#define MAX_FIFO_RD_RETRY 3
-#define SWR_OVERFLOW_RETRY_COUNT 30
-#define SWRM_LINK_STATUS_RETRY_CNT 100
+#define MAX_FREQ_NUM						1
+#define TIMEOUT_MS						100
+#define QCOM_SWRM_MAX_RD_LEN					0x1
+#define QCOM_SDW_MAX_PORTS					14
+#define DEFAULT_CLK_FREQ					9600000
+#define SWRM_MAX_DAIS						0xF
+#define SWR_INVALID_PARAM					0xFF
+#define SWR_HSTOP_MAX_VAL					0xF
+#define SWR_HSTART_MIN_VAL					0x0
+#define SWR_BROADCAST_CMD_ID					0x0F
+#define SWR_MAX_CMD_ID						14
+#define MAX_FIFO_RD_RETRY					3
+#define SWR_OVERFLOW_RETRY_COUNT				30
+#define SWRM_LINK_STATUS_RETRY_CNT				100
 
 enum {
 	MASTER_ID_WSA = 1,
-- 
2.34.1

