Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5474702DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242320AbjEONU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242322AbjEONUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:20:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC38358E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:20:07 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bcb4a81ceso22540791a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684156804; x=1686748804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsO/pqq6pHh8swXKYO4dDKBfdrzUB5clS17CPd685rE=;
        b=cuqw52C5rpcXbOGzrmkE4xmmnK5Jt5fPaZCflXVDw88vJSBl6wQt9VwE0IZZvrp+PW
         sV33lHjOwyknAlH7ZAy8lZqy+7gi2VHrGEs+ClBw84ZPB9pT1+BDJg1m1lIe1/ixI3ys
         ev9U9MbOUnPIhN4nM9d3MiY+MaAC0yGQiq5Go85NmazLlZgVv4+FS6vkAMDNUyXV2+uo
         D2Nq2wOaWhjGaDF5R4fETrw+pNg1jVn+GCeInxb6uF7T+PDL4QGJO6SrbA46HwhlFE6+
         RNaHazm0m/Bjx259Nomk0c2aHY2v2ECmE5dy91H9cDm3L7fD5E7zT3/RdoBeqVdCHR8O
         8jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156804; x=1686748804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsO/pqq6pHh8swXKYO4dDKBfdrzUB5clS17CPd685rE=;
        b=YdiotagUEtkVhWS8GDftv7+kk4JBQv9CfGO8lswQExuyrtOmGy43XoNokPpmFX6jMo
         wksLyNUZOCZQfv6bKXDa9qTuvKtfTFjA7aarrhF/OtIWUtpG2WOkPJkz7475RtajZCfj
         rcD1CEAXVZiDHyT8zyaTs8mTlu2a7ogcUz6QPC4IkaQdQNTIZWcDgBihwHH8VIAhy5n6
         ZJRILpDKsn+z/nlJ3POGiNBnDqtiHR2o5m/e1x8ytBTq6QCWenN3xC6YbnLyd05avW9g
         8lgFtpwYDL/X74iOQMTKXkTvRA1j21G8s0k+JqaQIkeAEnMgrQQ9yLkI+2vJzzOEf1TY
         rarQ==
X-Gm-Message-State: AC+VfDztuzFxK5rE+gmPKNMAiQGXKHBNHnF/zYh+cSXhffCMB6YZ4RCB
        O/bs1YHtijfK8bJpOBvit94p+g==
X-Google-Smtp-Source: ACHHUZ5Y4XCmYDhtgTBiXMPECGlCjtaIhndzpaVgj4RRqFlSCnphrHUtnoB3PmaDLPOST75piELJtQ==
X-Received: by 2002:a17:907:ea6:b0:96a:4325:2593 with SMTP id ho38-20020a1709070ea600b0096a43252593mr15083216ejc.42.1684156803836;
        Mon, 15 May 2023 06:20:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id bz6-20020a1709070aa600b0094eeda0df09sm9598421ejc.179.2023.05.15.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:20:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] soundwire: qcom: drop unused struct qcom_swrm_ctrl members
Date:   Mon, 15 May 2023 15:20:00 +0200
Message-Id: <20230515132000.399745-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused members from the driver state container: struct qcom_swrm_ctrl.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aad5942e5980..ab1098ec56e6 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -187,12 +187,9 @@ struct qcom_swrm_ctrl {
 #endif
 	struct completion broadcast;
 	struct completion enumeration;
-	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct clk *hclk;
-	u8 wr_cmd_id;
-	u8 rd_cmd_id;
 	int irq;
 	unsigned int version;
 	int wake_irq;
-- 
2.34.1

