Return-Path: <linux-arm-msm+bounces-4082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D339680B2DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 08:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D8002810C8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 07:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD78C1FD9;
	Sat,  9 Dec 2023 07:47:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE34F12E;
	Fri,  8 Dec 2023 23:47:20 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=guanjun@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vy5Az.R_1702108037;
Received: from localhost(mailfrom:guanjun@linux.alibaba.com fp:SMTPD_---0Vy5Az.R_1702108037)
          by smtp.aliyun-inc.com;
          Sat, 09 Dec 2023 15:47:17 +0800
From: 'Guanjun' <guanjun@linux.alibaba.com>
To: neil.armstrong@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	guanjun@linux.alibaba.com
Subject: [PATCH 1/1] soc: qcom: Fix compile error caused by uncorrectable definition of TRACE_INCLUDE_PATH
Date: Sat,  9 Dec 2023 15:47:16 +0800
Message-Id: <20231209074716.2689401-1-guanjun@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guanjun <guanjun@linux.alibaba.com>

Compiler reports the error message when compiling the file drivers/soc/qcom/pmic_pdcharger_ulog.c:
  - ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)

TRACE_INCLUDE_PATH shoule be relative to the path include/trace/define_trace.h, not
the file including it. Fix it.

Fixes: 086fdb48bc65d(soc: qcom: add ADSP PDCharger ULOG driver)
Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.h b/drivers/soc/qcom/pmic_pdcharger_ulog.h
index 9d5d9af4fbe4..3ac994d160bd 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.h
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.h
@@ -28,7 +28,7 @@ TRACE_EVENT(pmic_pdcharger_ulog_msg,
 /* This part must be outside protection */
 
 #undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_PATH ../../../drivers/soc/qcom/
 
 #undef TRACE_INCLUDE_FILE
 #define TRACE_INCLUDE_FILE pmic_pdcharger_ulog
-- 
2.39.3


