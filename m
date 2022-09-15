Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597365B9B1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 14:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiIOMm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 08:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiIOMmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 08:42:25 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9665214094
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:42:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id g3so9796596wrq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=5CMlBI/PrKLuiXDRVCmkwWXBv4d9T3I5m7kPv3uZKXk=;
        b=LlF+gnOCTKInIpXUMWd7obhKq5M2pJu5O+Wb3rhT2HxfBdERUsLE1wWgnOlJfg/q4K
         5Q5NYgl0EI7oudjmN2BXcWJ+A68ZdIYq0HPrx7dvi02Z6xKSkrgyEtaRuwEmGfHU9tMh
         nsM98mhMPbu5R4iLSaJMKjePD/uulH7Xs45cvI3yzh9mvo2cALXcc+hs1wlnMENiyAL0
         3qGjhwXNtoVkDOzxGLFh4G2f3OodGTSla8G8Osdc7DhVa3ehbWXvP9QUnXqVUQwf3V6B
         KLqFvvvFu+W3HaZPn+yMpwjTfJzGURbTj+bOerzKyfrWygYV0lEkt7cWCSwGJ8szxcmx
         cDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5CMlBI/PrKLuiXDRVCmkwWXBv4d9T3I5m7kPv3uZKXk=;
        b=2GgMODync0SYYGu1vJ5PA+5ZkzKpdBlsnkXMBvWjfF7PdCgLjaNVVRFoMjVTzTowy9
         SLZgYWN2kJpaOMoUIDSXju3C5ggxnxo7+85QiydfzmAC1DP34pC7wZwVJPyCwh8lnxbD
         ykp3E2drCJBCFA7tYsUDgof+7+LzLt0gxaDD/aKZMVPqYshWvfJqYd5rPGarW0yHZSqT
         s9+K3VgV54t5lrx9wV5IFqrzId4R/D9RNMdqZ6UWO4ATTpMoUNS2Jud3DXN2tQipSB/N
         Rvz3y7yYY4bRk5F+bvWBKXZet6LWFM9T6h8O3tVVLGA0JFVUPjbQ6OzA135YrhsNhv8D
         MSLg==
X-Gm-Message-State: ACrzQf2KlDGcnyIMoJj5jqFoXNrWULAOcrN129/IrUhHXWeSptjzhwbN
        qRJmCd/j/sGhbDc8xJQI1OAUwQ==
X-Google-Smtp-Source: AMsMyM6WelGrs0W65x7NDo18eVH5IHv5aoBArcifU+8Xdkt9zsXkV+YgHzC7srp6z45g4OGNPQCqQw==
X-Received: by 2002:adf:eec3:0:b0:22a:d159:456c with SMTP id a3-20020adfeec3000000b0022ad159456cmr1895699wrp.463.1663245740879;
        Thu, 15 Sep 2022 05:42:20 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id ay29-20020a05600c1e1d00b003b4ac05a8a4sm2783145wmb.27.2022.09.15.05.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:42:20 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org
Cc:     yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soundwire: qcom: update status from device id 1
Date:   Thu, 15 Sep 2022 13:42:15 +0100
Message-Id: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
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

By default autoenumeration is enabled on QCom SoundWire controller
which means the core should not be dealing with device 0 w.r.t enumeration.
Currently device 0 status is also shared with SoundWire core which confuses
the core sometimes and we endup adding 0:0:0:0 slave device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e21a3306bf01..871e4d8b32c7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 
-	for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
+	for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
 		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
 
 		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
@@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 	ctrl->slave_status = val;
 
-	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
+	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
 		u32 s;
 
 		s = (val >> (i * 2));
-- 
2.21.0

