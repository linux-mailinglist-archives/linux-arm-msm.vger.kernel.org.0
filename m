Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE9356B7B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 12:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237983AbiGHKr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 06:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237947AbiGHKr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 06:47:58 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6B524091
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 03:47:56 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r14so24210172wrg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xluwZ9y3zdmAPfcT1yYXDD9KZroOpceJIZ4q+RRr1oU=;
        b=JPtEmO4trG7s6aC0J9ygjQlOCrt7aZxW4zQWOL3LYOBjAeYpBRPDb6+tO3McP54lf9
         iKP27VpYJP9FFXqEVGefhLGNOEVZcXePzkp5qaytOID3uUF3nTsPzw/NjZ6p06b8PovV
         joEjnoJ0qcQ5BMlZk006adTqPyp7TYLSNO6LX6jllBGN7bg5rccHpoF/Pk198DrTtkN3
         /WeVTPniOizjNDT04kTwZIwCv7//GRyefmpP6im3meVPzUaR1XC4U4msgdm1YPJ8z1bc
         Cm6YMjj0N4pPIeOUhP3VsiOnyKYEivqNkGkclUlN3cBTtPNkztWhwRH7Mfn2Xvyw7uUh
         8ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xluwZ9y3zdmAPfcT1yYXDD9KZroOpceJIZ4q+RRr1oU=;
        b=DgJgHjud7VgJlEX0bPrNNa/TOjLE4HXRip1TdxZT8IbtskqKy9fZAW+pHNxhTynPju
         I6mAzcBABHioDS/NkkV/Clp5a4eCzuoH8vIqVDMqyf+rUPC1onjvwq49Bop7HUuVSRic
         7x2yIK73jg5OBWDyg1g5WuUJCZ2XhAoSltkSi6awWSM9gttVD5g8h5UAZXIdt+ay6tGB
         yR1QAwLVuLGASfN1jQ/ZY9Az9xsLV42bNgiUq6UJBctIf+p3Y69a2pNr3z/PPjHlNuv7
         l7vvRc07GoSxV7I8MyakiD9ayLi2Z07S5Om1/UvinJ1DKSIiVHvCc51R4vYZ2gEd1D4Y
         nSyw==
X-Gm-Message-State: AJIora9MTYprtNJnbMHkvtvuVAvJS1VAmoxrn8iPKm43585I/7+dqaMl
        XYw0NbQ9MCjzU0Ppha+ctXUdOg==
X-Google-Smtp-Source: AGRyM1tT9rQIlM4HXj5Tbwcts2dErI6OHFaa52hqrQ9CstIDKYjsLpQenpYPtpMOAPh6+QIHiep/6g==
X-Received: by 2002:a05:6000:15c1:b0:21b:ad5e:2798 with SMTP id y1-20020a05600015c100b0021bad5e2798mr2636491wry.237.1657277275444;
        Fri, 08 Jul 2022 03:47:55 -0700 (PDT)
Received: from srini-hackbase.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003a2da6b2cbesm1251621wmf.33.2022.07.08.03.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:47:54 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org
Cc:     yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, dan.carpenter@oracle.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] soundwire: qcom: fix device status array range
Date:   Fri,  8 Jul 2022 11:47:47 +0100
Message-Id: <20220708104747.8722-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
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

This patch updates device status array range from 11 to 12 as we will
be reading status from device number 0 to device number 11 inclusive.

Without this patch we can potentially access status array out of range
during auto-enumeration.

Fixes: aa1262ca6695 ("soundwire: qcom: Check device status before reading devid")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9df970eeca45..16a4a51978ca 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -169,7 +169,7 @@ struct qcom_swrm_ctrl {
 	u8 wcmd_id;
 	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
-	enum sdw_slave_status status[SDW_MAX_DEVICES];
+	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 	u32 slave_status;
@@ -420,7 +420,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 
-	for (dev_num = 0; dev_num < SDW_MAX_DEVICES; dev_num++) {
+	for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
 		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
 
 		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
@@ -440,7 +440,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 	ctrl->slave_status = val;
 
-	for (i = 0; i < SDW_MAX_DEVICES; i++) {
+	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
 		u32 s;
 
 		s = (val >> (i * 2));
-- 
2.25.1

