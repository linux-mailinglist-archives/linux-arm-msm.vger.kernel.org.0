Return-Path: <linux-arm-msm+bounces-23670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2900912FFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 00:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A617E2878AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 22:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804ED17CA10;
	Fri, 21 Jun 2024 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsD7AmYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3617C7CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 22:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719007429; cv=none; b=Xpc1aiFC0H6VUIeZdC6JzBoDmakc4E2Rr/zpMLoNbqxVRgzbOXl3n0Gb7moOP6dQQw4/KRrKsCuiGwk8mp26Xy0wL9JM5B6df1MVuCIRMYlyqcHh24z32Eg2WTnECuk8vyAV2Ctv1mNBjDVHQ5wLx7Jkl7cCKGjS/biBkBs8TJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719007429; c=relaxed/simple;
	bh=ERzl1vOfSWUTdRssx1gYQEEpeL4zdtyW1p5ZcdM048M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zt23+0jWJ+B6CID9VZFMf12dSrmfAbWgzqPl54kF0sinsgMhsSoE8/yd7tNF9d7JGuo7dx6BeMxkzeuNGHwxxgFzhG6sGvklj2m4wwWc3J6kCXGXvRk+VYUpv4bpHn9KaxQuRRiPyg7sFX1NmPucSJng4A+nEuyBr6IJRIa4DdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsD7AmYK; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so29327561fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719007426; x=1719612226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNV+yfMl4wzIlPe6Pg4OBBplV6ElcGrIImNf/vZG4m0=;
        b=JsD7AmYK8DaiHDGZFojiPJbkmK5uiYXsQeUdTvGk2xHguC/Yr7CPjekJUjE5I8OCfU
         xgHEHQRRdXorTw7FtNRfarnhI8qBlQQB2xUQBRo/NXgoMXi9elUk41ZyJxkdDBF0nkHI
         D+flGYeFU8aYTfifm9lJuWST4A7WoB1H9UiNyPDHvJP0T7ZDMMgQpll/3WyYXPKrbKRR
         Pd031gm4UYTERaQLzvC1lKr41YFZp3IOOiZG5bw8MWBXrx2WMNHN1iWZ7mzekXgYg4Pp
         1v0qrz1bykTxqGCPP87NtoAxTga++Q1/dItk6amthZGJ3iAAMoko86ZUSZ8p/KL9zLWJ
         j4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007426; x=1719612226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNV+yfMl4wzIlPe6Pg4OBBplV6ElcGrIImNf/vZG4m0=;
        b=DndyjNLVYgl+I5sbbyvKq3D35n82Uj+UJjHadIXhJivj/xb08wtjuJz4VG0DU5b3ck
         H4/WA7omATMWIBdSouGm60xLEW7CiePyqFKGKXjH95JZ60fVbPeyAIxCetVKdWLDQIV7
         +thNFGVWuYHTkxT8tPpX4squIWT3rVfNUIAqBOiytIDzLY9jMTLr/DrBo43bB6kMu1+Z
         /CADgr0nllpT9BXSfizuCxNTVlYuGgyvs+1sqfP4E7qi9nFGItSC68tYUXR4O05haY3s
         NByv8+wgZha0EckPhg3G0EfiGcqRuRd/lS2+D7NkI3S0hieWB0BW2xFBomV6iv4pwc1O
         e0dA==
X-Gm-Message-State: AOJu0YxOCKoiUs5tVckgy2rrTp+fZtdKRY6yxKjCHpwQlfeZY9kZW39W
	K9J1hIBhg0KyQi5bo/Jh0KCJZSuzI3uZ8Y01KVAfXFI5ODhHWJbje8jvUboftVM=
X-Google-Smtp-Source: AGHT+IHWKfpxf222Z6fpO/pG32g0rZ3+yfuIB65S+L6Ajx161gbLUon+dQfSytPM2Kwd93xWGyThTQ==
X-Received: by 2002:a05:6512:324c:b0:52c:dd8d:8b44 with SMTP id 2adb3069b0e04-52cdd8d8bdfmr207721e87.22.1719007425680;
        Fri, 21 Jun 2024 15:03:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6431fcdsm318293e87.210.2024.06.21.15.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:03:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Jun 2024 01:03:44 +0300
Subject: [PATCH v9 5/5] remoteproc: qcom: enable in-kernel PD mapper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240622-qcom-pd-mapper-v9-5-a84ee3591c8e@linaro.org>
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
In-Reply-To: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Chris Lew <quic_clew@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9639;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ERzl1vOfSWUTdRssx1gYQEEpeL4zdtyW1p5ZcdM048M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdfi8S27dm1fHUp48zQ0eg0UMYWHJlD12WN38l
 gY46J4uqYqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnX4vAAKCRCLPIo+Aiko
 1YAiCACzBqZDblGXcwb7Kv48HLNNpvqWibCx3M+4oFkup/CSa7odlypo4iJCuV8kSZrlr7ipDkP
 AesR6oXFZPO/2u2dp3eZ7I6gC9uGJ5qIUAQQ0XaBYZQlguJwMEmOowbzk4FtJPY0pr0cu9QrcFu
 B2tUgKKyYfRh7KsSPvE2CsCBCMch23vJVplVO83UWXgudsZ9IH95xfyL9JNG+brs8uisw5YDKv6
 FiZkYW15nt49b/TY1f0Aww5xNBoFAyFRvVMDg7Ao6Yr4McSS1wG1Rpp0jtsKUKCBkj/JOJzvn10
 UCujwA3P7F5SNt+3FhCoCZlCf0h0nC3HhHaacLWv1wTQhEPU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Request in-kernel protection domain mapper to be started before starting
Qualcomm DSP and release it once DSP is stopped. Once all DSPs are
stopped, the PD mapper will be stopped too.

Reviewed-by: Chris Lew <quic_clew@quicinc.com>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
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
index 8458bcfe9e19..88e7b84f223c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -111,6 +111,7 @@ struct qcom_adsp {
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
+	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
@@ -777,6 +778,7 @@ static int adsp_probe(struct platform_device *pdev)
 
 	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
+	qcom_add_pdm_subdev(rproc, &adsp->pdm_subdev);
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
 					      desc->sysmon_name,
 					      desc->ssctl_id);
@@ -811,6 +813,7 @@ static void adsp_remove(struct platform_device *pdev)
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


