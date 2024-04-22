Return-Path: <linux-arm-msm+bounces-18157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30B8ACA5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 336B82833E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBC713E885;
	Mon, 22 Apr 2024 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E036oUi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA013E41F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780692; cv=none; b=ox1sjeKbm6PPm0nYQ0CU1mFwBpbGekUfDbmJ6w1iBtV2m8NQsRgTtRAEvCI0EZww2Zj/v9oomLyVB4JEfccQu7xXDaN5OyIKKsDQiLQ6X/tV9xmmjR7yjxPaSfWILz3ZnLhTR86MDPBMuCWdk8uPHIbzB8iqtt5jPsHhvSCjGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780692; c=relaxed/simple;
	bh=fRpe4tZif781lZ12DHSpdu5zykO3631nXc2R0m1h4Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGY11CLRRA4kLKhEQGx2C0h0+xkLG6DzW8DyExh0wrK75SpiahCLOInlqYV8M9q75Zq2yj/8n1jE6ADYgCgUOsw1otPbIM8Wa8U2rQM61CyHvHzL/JiA0OtfOmWWeHPOGZ1aYw7VqtQljIBJYk9zlq2Y/qV6yExSmoVvayHSNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E036oUi7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so6319446a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780689; x=1714385489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XqnvD15NkzmaJMEzgWAv80CASkF9y6TdmD/lauJI7g=;
        b=E036oUi7GxRJIHfe5lvdTHApfLORvMJkacP3uwbfdcR4EjCwdH6HI5wn7mty5BarEk
         mTtBt3Yf5oQrGdqh4P4hF6VFn9KAzMvfFQHXlVhe4cjiLlJ8thb4M9qldGFHAeAIbIV1
         PKJmRo2cVRBveHri1l3HoYHrGyBeTayj8Ngoyzdg8cQCrhV1DK9iJk7ihrad5OcMOHYc
         XVN0Ckoq6L3MPDdqU2/Wz9VybjxGwzyRf1rKJhEaXGIIWp45QDp83fhfqd8VW7P7P1C2
         vTFwXRxvDetS3v27j2+gOLHiNF2/boPjBqHEtrLYQFSI1vSdGVz4rGegBOXkl0sK0nXj
         nwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780689; x=1714385489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XqnvD15NkzmaJMEzgWAv80CASkF9y6TdmD/lauJI7g=;
        b=htCOfzojzm1bOVkV5qf4sxZpxzRoXbvL4gEJmoT9xpplj1TL/fZsaTmBVDLdiwi6E1
         hiU4gQD3ZZS2mucwh3zjV0+LLOrGVGQfhjkBDm9WHBexhJYxB7o1MQPI0KyEQ7HzN0bZ
         IlkNZmLRiR0ivh3hN2COr7ITZZKd/+b+/TTu+jVGJQywTrn7Kn4AiM+qE2Zb1gwwseTb
         qSPn0U9n8LTNaImDEhgq/W4wFCDONBOx7kLvkLtuSyZCKPtJo0Ika2yM3bhrDVICtJEl
         w82FrJBVMzoMcQmcZkQm1W1AfeS2zeVboS3e04nTJKHIUEhGudwWt27G/ncDdxxTIOzd
         kpDQ==
X-Gm-Message-State: AOJu0YyP5LbDiMHj4xibbZdMGLTWKrcobbMjdmZFoLiMQ6OI7JLfLcTt
	cF9Wwge2fMlX/ReZGHj+Z2v/665MWP7ecCxdFSQqWO4ZavSTK6POic7IR7oszPc=
X-Google-Smtp-Source: AGHT+IEV+na64WnVhyAu32rRwkfex9DDQX519KNKS+y//ZdkNOvjn+Bl5fb3TMvireAJ6AdSONA/XA==
X-Received: by 2002:a17:906:4a8a:b0:a52:8062:a8d0 with SMTP id x10-20020a1709064a8a00b00a528062a8d0mr7884034eju.58.1713780689132;
        Mon, 22 Apr 2024 03:11:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:11:21 +0300
Subject: [PATCH v6 6/6] remoteproc: qcom: enable in-kernel PD mapper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-qcom-pd-mapper-v6-6-f96957d01207@linaro.org>
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
In-Reply-To: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6924;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fRpe4tZif781lZ12DHSpdu5zykO3631nXc2R0m1h4Bo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfKJHMOtZPcf4dbDlmLTgsdtXVeYHX7r2TB3
 0zh3dLdnk6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3ygAKCRCLPIo+Aiko
 1QvvB/0dScCxZ9LZCSLjINii4AdBfOrUAMBK3ubeGvL2jFLK4KTNyqrb7cgH3lxd/3gipJ1YG23
 zGoXGSeNpQKLCwVHrClu0EJ0CXJaD2ionQvRU/d5/9qUTH80cauDycsnTwDgwlUuFPZ8W0RbOMP
 tSX4hslBRjqiRvHTq1H6bAqZJSaAJTsMJVSAEYfV3n5/5QWZZDjGDohHgpPuLYoPPlZQWzN7LBQ
 dX2y3MLEV4FSJ0Ha7+jryW7B8qq/hXQSKm7YLEzhdxQCiGXk12FwZeVjDSYPN49GMNLO/88EZJX
 PSX8iUDbVLTGb4B4fe8n9qKqibuSfpsasxBFOCGonhRsRZRC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Request in-kernel protection domain mapper to be started before starting
Qualcomm DSP and release it once DSP is stopped. Once all DSPs are
stopped, the PD mapper will be stopped too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig          |  4 ++++
 drivers/remoteproc/qcom_q6v5_adsp.c | 11 ++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c  | 10 +++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c  | 12 +++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c | 12 +++++++++++-
 5 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa85..a0ce552f89a1 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -181,6 +181,7 @@ config QCOM_Q6V5_ADSP
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
@@ -201,6 +202,7 @@ config QCOM_Q6V5_MSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
@@ -221,6 +223,7 @@ config QCOM_Q6V5_PAS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
@@ -243,6 +246,7 @@ config QCOM_Q6V5_WCSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 1d24c9b656a8..02d0c626b03b 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -23,6 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -375,10 +376,14 @@ static int adsp_start(struct rproc *rproc)
 	int ret;
 	unsigned int val;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto put_pdm;
+
 	ret = adsp_map_carveout(rproc);
 	if (ret) {
 		dev_err(adsp->dev, "ADSP smmu mapping failed\n");
@@ -446,6 +451,8 @@ static int adsp_start(struct rproc *rproc)
 	adsp_unmap_carveout(rproc);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
+put_pdm:
+	qcom_pdm_release();
 
 	return ret;
 }
@@ -478,6 +485,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_adsp_pil_handover(&adsp->q6v5);
 
+	qcom_pdm_release();
+
 	return ret;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 1779fc890e10..791f11e7adbf 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
@@ -1581,10 +1582,14 @@ static int q6v5_start(struct rproc *rproc)
 	int xfermemop_ret;
 	int ret;
 
-	ret = q6v5_mba_load(qproc);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = q6v5_mba_load(qproc);
+	if (ret)
+		goto put_pdm;
+
 	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
 		 qproc->dp_size ? "" : "out");
 
@@ -1613,6 +1618,8 @@ static int q6v5_start(struct rproc *rproc)
 reclaim_mpss:
 	q6v5_mba_reclaim(qproc);
 	q6v5_dump_mba_logs(qproc);
+put_pdm:
+	qcom_pdm_release();
 
 	return ret;
 }
@@ -1627,6 +1634,7 @@ static int q6v5_stop(struct rproc *rproc)
 		dev_err(qproc->dev, "timed out on wait\n");
 
 	q6v5_mba_reclaim(qproc);
+	qcom_pdm_release();
 
 	return 0;
 }
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..653e54f975fc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -23,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -261,10 +262,14 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto put_pdm;
+
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
 		goto disable_irqs;
@@ -356,6 +361,9 @@ static int adsp_start(struct rproc *rproc)
 	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
 	adsp->firmware = NULL;
 
+put_pdm:
+	qcom_pdm_release();
+
 	return ret;
 }
 
@@ -399,6 +407,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	qcom_pdm_release();
+
 	return ret;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 94f68c919ee6..6ed60f3f3eee 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
@@ -240,13 +241,17 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	ret = qcom_pdm_get();
+	if (ret)
+		return ret;
+
 	qcom_q6v5_prepare(&wcss->q6v5);
 
 	/* Release Q6 and WCSS reset */
 	ret = reset_control_deassert(wcss->wcss_reset);
 	if (ret) {
 		dev_err(wcss->dev, "wcss_reset failed\n");
-		return ret;
+		goto put_pdm;
 	}
 
 	ret = reset_control_deassert(wcss->wcss_q6_reset);
@@ -288,6 +293,9 @@ static int q6v5_wcss_start(struct rproc *rproc)
 wcss_reset:
 	reset_control_assert(wcss->wcss_reset);
 
+put_pdm:
+	qcom_pdm_release();
+
 	return ret;
 }
 
@@ -735,6 +743,8 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
+	qcom_pdm_release();
+
 	return 0;
 }
 

-- 
2.39.2


