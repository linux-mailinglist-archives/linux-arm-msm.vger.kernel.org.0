Return-Path: <linux-arm-msm+bounces-19741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CF8C33F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF5871C20DC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC76352F7A;
	Sat, 11 May 2024 21:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7WSBgRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206046430
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464573; cv=none; b=iZ13vUcCJIkrYWL7v5/y3W4ZKlywES7LArn9VR4gK5kBoQK3Rx7MxlSwsJR7LyU7Pj1/QLf2bwoL3fYt9B8BSEKsis2g/hB/80NR+EOg/fLZgLCoSU/S39rzWrcA2d3NPbgT8YgduP4PzQ60QgJkxlgUs31JF0qsnY7BsakAp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464573; c=relaxed/simple;
	bh=kSBL6HpSlhkhecDmVbVirL4cyYLi0VVC3JIAe5JCCis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSHXNAr90I6/U9hUgN/dPs5xei3yIT8178mWY4R03bC2QLIaDB4Jh2hiaGotnhxe1+8mo+LX2c4WZ6meIRYEqi5pBJHj79+3BqezO7CQYxFqjdVIisqCExI1ZJPfUWH2QULYdtq9j1clWtieceHUYybTXYJvdamPgWSW7nvIGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7WSBgRp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so3783842e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464570; x=1716069370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfgHOEk7b6c+S7H1X1EKSLsqVYxACpR76/AhrJnSZyk=;
        b=H7WSBgRpYGREWUG4RUupCHMtfAvKgdELc1o9AIdKAOgxP4DIVV/QGt3Yun7qAHTkpx
         VJctjYuf4PfVPHwxVWSs6oJJQm6HGA3HCe4cvPS/YIXQm/B+l8pa0UxnyRLz91AqKnzR
         rJfvUnqDSsy6hMpGWr3MqUQgdmnHDc/MtQMAoAvEFQGZ0bfOBjWt/P9rH/TCNTdmuSM6
         B2luBmbDK1WfGduNCkih/c110qRAyDUdaM7BjVMnGC+aCFaTCf+uJ+1rLq/ZPWbxTY27
         /gJad/AP9xhIg3ynYTcfz1neHIFwnr1UD+lDhNMr4XyCug3Pj5uRhwpCxEwu8xvjhcWF
         BOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464570; x=1716069370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfgHOEk7b6c+S7H1X1EKSLsqVYxACpR76/AhrJnSZyk=;
        b=sCKIvS0OOW545os7+ng1uPNBU6c0RUt7ZALZlIt5zUkHQH2rBaZ6cinIqpgsYcDu14
         Gx12Oi9CFYBXpNGteNDNeFlFGbIM4hxCYLAH0SetKlLHN3iN+/2SYWYyb+7XAksr4aPK
         3ln3G42Ek1QTiIrQiBHfiM0bYCYuFYJHf8cPUdTZ+U/AcrSuz/jfQbshAd6N5CZSQyt6
         azoLj8gEERQLmxcQd1BPwmzvgXVq+X1WfiTyD+iCgkFEkkSwrFXR2KSfsvu1+s7lytSX
         rUPoiz8mHPuYnFoGG+2qIi9dH/JO5UrG+GxbY35VyNMz5SeJsDoStiwpwplYa3a7YNos
         UZuA==
X-Gm-Message-State: AOJu0YytehmwR4N2piC918PnkmaPU5AVu31rvWaNXQDbWtoOAq6VjgiK
	2ZXf87v14GPFx23XGpk3XPryaAfUuLWWoGrPRQ4T2WLN2rsV5rimltAV0JOEIIA=
X-Google-Smtp-Source: AGHT+IFvPcj4V5GoSrF28GDRVh8LmagSae1ENSUHLkUZ2wMCtsjK/hDZ+GayeUMlU77qapc13uZoWA==
X-Received: by 2002:ac2:4c08:0:b0:51f:33b2:c3f7 with SMTP id 2adb3069b0e04-5220fc7acf6mr3337959e87.28.1715464569694;
        Sat, 11 May 2024 14:56:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d31d1sm1127576e87.286.2024.05.11.14.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 14:56:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:56:07 +0300
Subject: [PATCH v8 5/5] remoteproc: qcom: enable in-kernel PD mapper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-qcom-pd-mapper-v8-5-5ecbb276fcc0@linaro.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
In-Reply-To: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9472;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kSBL6HpSlhkhecDmVbVirL4cyYLi0VVC3JIAe5JCCis=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+l0xbKuoTRTC+Br1zNjxLbzbypZKrdjv0lGw
 Gr0NJWqIcaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/pdAAKCRCLPIo+Aiko
 1dcxB/42hnyg6hDXhPKLzE03vxtEACuTDaovzQcaYbXceX50imDaDMk3LnFf/JJKoRbNAVe3aKP
 VnmysQ5Jjodj+NSE4Hki+QHCjR6jW5Vcbxf0nZqqz7DdF9B1J7wmJGMa2tCR05zNJ8cfGB+q2gf
 HW2AHINAQ/kIi+JbUQfcgCLBzRWYTrjcwooOu2rPSwQ22CxmXAZV5D6SeAT4ZFIwfAGMimleVoc
 VcHNzI3Mm93ofSizxReX74JEygtkwaKLiF26FSY66p4ib3aNFvjtuUbbu7IhnePJi+iQWppxmu3
 k+CGoIn4Ti3dJangc/Z93RjKOfQrpT0DUFMfwxArsPmGl6uh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Request in-kernel protection domain mapper to be started before starting
Qualcomm DSP and release it once DSP is stopped. Once all DSPs are
stopped, the PD mapper will be stopped too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_common.c    | 87 +++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h    | 10 +++++
 drivers/remoteproc/qcom_q6v5_adsp.c |  3 ++
 drivers/remoteproc/qcom_q6v5_mss.c  |  3 ++
 drivers/remoteproc/qcom_q6v5_pas.c  |  3 ++
 drivers/remoteproc/qcom_q6v5_wcss.c |  3 ++
 6 files changed, 109 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 03e5f5d533eb..8c8688f99f0a 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -13,6 +13,7 @@
 #include <linux/notifier.h>
 #include <linux/remoteproc.h>
 #include <linux/remoteproc/qcom_rproc.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/rpmsg/qcom_glink.h>
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
@@ -25,6 +26,7 @@
 #define to_glink_subdev(d) container_of(d, struct qcom_rproc_glink, subdev)
 #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
+#define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
 #define MAX_NUM_OF_SS           10
 #define MAX_REGION_NAME_LENGTH  16
@@ -519,5 +521,90 @@ void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
 }
 EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
 
+static void pdm_dev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static int pdm_notify_prepare(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_pdm *pdm = to_pdm_subdev(subdev);
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->dev.parent = pdm->dev;
+	adev->dev.release = pdm_dev_release;
+	adev->name = "pd-mapper";
+	adev->id = pdm->index;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	pdm->adev = adev;
+
+	return 0;
+}
+
+
+static void pdm_notify_unprepare(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_pdm *pdm = to_pdm_subdev(subdev);
+
+	if (!pdm->adev)
+		return;
+
+	auxiliary_device_delete(pdm->adev);
+	auxiliary_device_uninit(pdm->adev);
+	pdm->adev = NULL;
+}
+
+/**
+ * qcom_add_pdm_subdev() - register PD Mapper subdevice
+ * @rproc:	rproc handle
+ * @pdm:	PDM subdevice handle
+ *
+ * Register @pdm so that Protection Device mapper service is started when the
+ * DSP is started too.
+ */
+void qcom_add_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm)
+{
+	pdm->dev = &rproc->dev;
+	pdm->index = rproc->index;
+
+	pdm->subdev.prepare = pdm_notify_prepare;
+	pdm->subdev.unprepare = pdm_notify_unprepare;
+
+	rproc_add_subdev(rproc, &pdm->subdev);
+}
+EXPORT_SYMBOL_GPL(qcom_add_pdm_subdev);
+
+/**
+ * qcom_remove_pdm_subdev() - remove PD Mapper subdevice
+ * @rproc:	rproc handle
+ * @pdm:	PDM subdevice handle
+ *
+ * Remove the PD Mapper subdevice.
+ */
+void qcom_remove_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm)
+{
+	rproc_remove_subdev(rproc, &pdm->subdev);
+}
+EXPORT_SYMBOL_GPL(qcom_remove_pdm_subdev);
+
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index 9ef4449052a9..b07fbaa091a0 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -34,6 +34,13 @@ struct qcom_rproc_ssr {
 	struct qcom_ssr_subsystem *info;
 };
 
+struct qcom_rproc_pdm {
+	struct rproc_subdev subdev;
+	struct device *dev;
+	int index;
+	struct auxiliary_device *adev;
+};
+
 void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 			void (*rproc_dumpfn_t)(struct rproc *rproc,
 				struct rproc_dump_segment *segment, void *dest, size_t offset,
@@ -52,6 +59,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 			 const char *ssr_name);
 void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr);
 
+void qcom_add_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
+void qcom_remove_pdm_subdev(struct rproc *rproc, struct qcom_rproc_pdm *pdm);
+
 #if IS_ENABLED(CONFIG_QCOM_SYSMON)
 struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   const char *name,
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 1d24c9b656a8..572dcb0f055b 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -112,6 +112,7 @@ struct qcom_adsp {
 	struct dev_pm_domain_list *pd_list;
 
 	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
@@ -726,6 +727,7 @@ static int adsp_probe(struct platform_device *pdev)
 		goto disable_pm;
 
 	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
+	qcom_add_pdm_subdev(rproc, &adsp->pdm_subdev);
 	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
 					      desc->sysmon_name,
@@ -755,6 +757,7 @@ static void adsp_remove(struct platform_device *pdev)
 
 	qcom_q6v5_deinit(&adsp->q6v5);
 	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
+	qcom_remove_pdm_subdev(adsp->rproc, &adsp->pdm_subdev);
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
 	qcom_rproc_pds_detach(adsp);
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 1779fc890e10..2a42215ce8e0 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -228,6 +228,7 @@ struct q6v5 {
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
+	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 	struct platform_device *bam_dmux;
@@ -2102,6 +2103,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
 	qcom_add_glink_subdev(rproc, &qproc->glink_subdev, "mpss");
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
+	qcom_add_pdm_subdev(rproc, &qproc->pdm_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
 	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
 	if (IS_ERR(qproc->sysmon)) {
@@ -2143,6 +2145,7 @@ static void q6v5_remove(struct platform_device *pdev)
 	qcom_q6v5_deinit(&qproc->q6v5);
 	qcom_remove_sysmon_subdev(qproc->sysmon);
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
+	qcom_remove_pdm_subdev(rproc, &qproc->pdm_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..399c3bc104bd 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -109,6 +109,7 @@ struct qcom_adsp {
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
+	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
@@ -771,6 +772,7 @@ static int adsp_probe(struct platform_device *pdev)
 
 	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
+	qcom_add_pdm_subdev(rproc, &adsp->pdm_subdev);
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
 					      desc->sysmon_name,
 					      desc->ssctl_id);
@@ -805,6 +807,7 @@ static void adsp_remove(struct platform_device *pdev)
 	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
+	qcom_remove_pdm_subdev(adsp->rproc, &adsp->pdm_subdev);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
 	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	device_init_wakeup(adsp->dev, false);
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 94f68c919ee6..e913dabae992 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -148,6 +148,7 @@ struct q6v5_wcss {
 	bool requires_force_stop;
 
 	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 };
 
@@ -1052,6 +1053,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return ret;
 
 	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
+	qcom_add_pdm_subdev(rproc, &wcss->pdm_subdev);
 	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
 
 	if (desc->ssctl_id)
@@ -1074,6 +1076,7 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 	struct q6v5_wcss *wcss = rproc->priv;
 
 	qcom_q6v5_deinit(&wcss->q6v5);
+	qcom_remove_pdm_subdev(rproc, &wcss->pdm_subdev);
 	rproc_del(rproc);
 }
 

-- 
2.39.2


