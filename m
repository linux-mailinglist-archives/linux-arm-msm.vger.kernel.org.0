Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB5047CA5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239797AbhLVAf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239736AbhLVAf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:57 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7542CC06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:57 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t18so1278173wrg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZufHHL56QnwdvQ0f3Flz67cCgVr3fdpU8FUQ+foUQdY=;
        b=B/2I0NH3IqgZyVF+jgW/K9NBAFGeF92U4vOximxPLEJJQFAw/yUqL8AoQiCDh+gQ25
         u/FPL+3Y6Q3kub073s0DSoqD++1/Eii7I7geGk+HKF52+k3SLtjvHWUBSjLyRQee6kb6
         JX/3tFCm1GA5/mhUmSXVfImGENDUKFmxWmKvs6tvwU64c8cYvyIkeajLZ9TOiBSxZjeB
         sG7R2Yexh5y5LqzDa9s8SSHj9i2IFI6SoOcsnwM3PUCUKOwwXZ4gjW87PT1IjCx74iD5
         QlDNZYujFUFynMBXA8Uy3sv0EqCo2rRArxC4t5a82MLxGo5i+q4X58Xiz0NueAGhqMfu
         spMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZufHHL56QnwdvQ0f3Flz67cCgVr3fdpU8FUQ+foUQdY=;
        b=qjXAjSC0Ul85eg324KRVaNU/X2vwazzuDvdsD3od895tWwpjJ3RfGmcAKMeKTq0Rm1
         GCpCg/PPyyfvcr7CbGEIJ7kKtYmtr8my+BuHDAA04EEhlZLIzzG3kCaaU4ksj5vdsHkW
         BZaPuoLqjgV/U1yEI65jZQsXA51ZXxDa038m67fIc1p9MJ2iLnanWrB+t+V9ip/o3yBc
         C/STiSBlSwM2+rXzHWIgkmilyT5Nr/hFMJ+nSNiSz8lC56/w5GUFhSxCxnTyOzLwbIzf
         3x4P3y/fZI3vHp3RFmmaWEh3QRI+jvXpPWWSmJShSrEF817QMgQ1fr/6c06UzcXLbqt+
         jpTA==
X-Gm-Message-State: AOAM533tsl/gs1m7tXrsNbL6yKQsPv85q1WaUYhwXBDBCYzvrgYCdv4O
        gMh5u1ELSEo2UfQChBsSMJIOeGkss2hLKA==
X-Google-Smtp-Source: ABdhPJwyVRoapyOKSitDwl0bFZFIq5o2eyeMIa5vtLzLMcJ89bbgrQ60+87kimH+sWfksv//Bz3EFA==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr405815wre.558.1640133355743;
        Tue, 21 Dec 2021 16:35:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:55 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 09/19] media: camss: csid-170: set the right HALT_CMD when disabled
Date:   Wed, 22 Dec 2021 00:37:41 +0000
Message-Id: <20211222003751.2461466-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the "HALT_CMD_RESUME_AT_FRAME_BOUNDARY" define instead of a "1" which
is otherwise confusing, and add a "HALT_CMD_HALT_AT_FRAME_BOUNDARY" which
is set when disabling.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 2c84d40fe3e04..22a7d7ad63403 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -105,7 +105,8 @@
 #define CSID_RDI_CTRL(rdi)			((IS_LITE ? 0x208 : 0x308)\
 						+ 0x100 * (rdi))
 #define		RDI_CTRL_HALT_CMD		0
-#define			ALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
+#define			HALT_CMD_HALT_AT_FRAME_BOUNDARY		0
+#define			HALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
 #define		RDI_CTRL_HALT_MODE		2
 
 #define CSID_RDI_FRM_DROP_PATTERN(rdi)			((IS_LITE ? 0x20C : 0x30C)\
@@ -444,7 +445,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
-	val = 1 << RDI_CTRL_HALT_CMD;
+	if (enable)
+		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
+	else
+		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
 
-- 
2.33.0

