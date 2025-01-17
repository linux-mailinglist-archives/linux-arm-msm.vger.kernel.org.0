Return-Path: <linux-arm-msm+bounces-45411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF5A15186
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A5D188BD1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D443136341;
	Fri, 17 Jan 2025 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQjFAArJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14210537FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123547; cv=none; b=YK/8HjuhvsOVjmV/PEi20LJxrpfEEJDqXqOh4AzYduzC/MkrbhV8A1FoxGuqyuDJBGw/ndQvq1n1caLeEn8uHm/PDGyocy6z95/3m0d7Dmhg/AdcHItWFECPNYkuJA1Mza+OFzx+dWCTNWUEi66e/kSa9g5nhMlbjDsx54xNLNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123547; c=relaxed/simple;
	bh=yG8sQ+nx9Eqw58/wd8HyjrYz0XP+TABX6QtHMArWsyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APPjz0RaHSERmSF01se7hMLUifKpSDh74vsvJk9G0raGD/L3m4IhIfd4PLXBU//MKAHdyFFYVUvLfPTGYe4zgCtnqCq1xCnTcUoD1rKemnP2aFNdWp5lFdXEhjLHio2hgBHcDSuSM7I1rDH5NvKFtUCIbRe3Gj8LTnYsOmOEXkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQjFAArJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436a03197b2so14331975e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737123543; x=1737728343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJPpzjW5eAxwdMtWI5K0l8mGr8BTWJyLsOuy62grEjQ=;
        b=MQjFAArJ1oQ+XiFb01gGlTaIwCMUZ6/eaMswdNPVP+UdM4o40QJIZ4veg5VEDYPmQr
         rqAfDKhj6MqIX9tbOcrFqqSazHgM4yVeVSxd/EfGt6mXhtqPCfZM5R0DLPdP8yiFCZ17
         Kx9vl30rfvYaAXHn0vcf3taVGqhhTjRjDGitTyNd/hgDt4nojy7Qh/SCf+5cOAMp8CkQ
         3tt2jSRMbsKP2b05Gtt2sHxfOhBm5r+cMNjiSF2FsKE/8alqqr1SWsEgCeWPtC0ZRjmU
         Ya/WH5kkPKpvsK8gPA+iFvsDM4+IjtZWAjF+U61lLe7x8RdrIUZ9jMpak0Pgd0skveDP
         VQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737123543; x=1737728343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJPpzjW5eAxwdMtWI5K0l8mGr8BTWJyLsOuy62grEjQ=;
        b=Cym8tUUW8RneURbK1C2R0h6NsJEwx1DGbM+76CfaK/APiQZvlb6HEhZRLxBUTXnAPH
         V2NnebDkGDbd9TBYty+SqXbeGD6RYPcBgAM8otg07Y+K2BMunCKm+Vx3C/YeEspSnpAl
         984/MqDXj6atXQfZ4P6uh2ghGotURNDKHrTP8DjmYnN2bIe9u5eQdx5HzSSxEJlolwLj
         BuPhFK5uibmRUeETfE99j3PybBhSnlx/bvjWOJF/tY/tTOPvYDQEgX8YIh8LWgCUbhQY
         1BPxr4Jzi9xpzqYvC6FUTYkcihvVKVAUf8cbVSjA67Jn/NJtNem/VdRCXU+1x2o6vDyS
         +nPQ==
X-Gm-Message-State: AOJu0YxlTVvk3w2PBIZ+xI1K4Q17O5UjEMdK3d1pyU1hTjUyBdpFX5RV
	KPXNvVcD2MxzDEWB7PnPQVeFQRtjKJaReiupg6KtOE669KKBXFQ64JVVuex/sIcvIYmKD9JQqNA
	Wb/s=
X-Gm-Gg: ASbGncsDW6bkIAjX+pg3PjZB0uJUD4xPOsvgtPdtxhRDDXAIOk9myyb8JJX5uVuVrqw
	O5wyRRiO7kyyIQJFC9gI1cWCF2Cmnkoo+ewwbTGCdMc4128JQMIontp5X0tK6fNigiqwO4+vSjo
	tKTS7tyrEropf3T5C19H5WUCGQGEBBEgeumQzIXud9PwTEod4IzYySykcRdbVOgQvRcZGRwRAfT
	NjI2Q0aSgi9STebeH92Yey3CnuCoXGw5K581m3hwY53ihZ2rifVk8xb0E863G+wbPGcJ9HxTO04
	5gIMeUBXSj2INg2RkFi7wJNmzYnVxLgG1Jma
X-Google-Smtp-Source: AGHT+IG5K3FNsGuzWqRixT4OiMWoWe6dLCzIRKc7oOU3K/CehjLULkM8EVMs4EBMJ03fSNI8Cqn0wA==
X-Received: by 2002:a5d:4e86:0:b0:38b:d824:df3 with SMTP id ffacd0b85a97d-38bf57890e3mr2043468f8f.24.1737123543332;
        Fri, 17 Jan 2025 06:19:03 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74995f6sm96764195e9.1.2025.01.17.06.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:19:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 17 Jan 2025 14:18:50 +0000
Subject: [PATCH v2 1/4] soc: qcom: ice: introduce devm_of_qcom_ice_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-qcom-ice-fix-dev-leak-v2-1-1ffa5b6884cb@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737123541; l=2995;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=yG8sQ+nx9Eqw58/wd8HyjrYz0XP+TABX6QtHMArWsyc=;
 b=XYQFpfWRMZlFbEbuuaOCZ4aYKbikkwMh7NOh050v6RV5pq7o3U3s8DytNgIi/EzzIkR8kxinl
 Olkd6PT8mK+CLzSZcBzMMXEmMb1XtCif7d7l2h9XI0JbH14ZTKpkBWo
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Callers of of_qcom_ice_get() leak the device reference taken by
of_find_device_by_node(). Introduce devm variant for of_qcom_ice_get().
Existing consumers need the ICE instance for the entire life of their
device, thus exporting qcom_ice_put() is not required.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/qcom/ice.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 393d2d1d275f..79e04bff3e33 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -11,6 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -324,6 +325,53 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(of_qcom_ice_get);
 
+static void qcom_ice_put(const struct qcom_ice *ice)
+{
+	struct platform_device *pdev = to_platform_device(ice->dev);
+
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
+		platform_device_put(pdev);
+}
+
+static void devm_of_qcom_ice_put(struct device *dev, void *res)
+{
+	qcom_ice_put(*(struct qcom_ice **)res);
+}
+
+/**
+ * devm_of_qcom_ice_get() - Devres managed helper to get an ICE instance from
+ * a DT node.
+ * @dev: device pointer for the consumer device.
+ *
+ * This function will provide an ICE instance either by creating one for the
+ * consumer device if its DT node provides the 'ice' reg range and the 'ice'
+ * clock (for legacy DT style). On the other hand, if consumer provides a
+ * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
+ * be created and so this function will return that instead.
+ *
+ * Return: ICE pointer on success, NULL if there is no ICE data provided by the
+ * consumer or ERR_PTR() on error.
+ */
+struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
+{
+	struct qcom_ice *ice, **dr;
+
+	dr = devres_alloc(devm_of_qcom_ice_put, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	ice = of_qcom_ice_get(dev);
+	if (!IS_ERR_OR_NULL(ice)) {
+		*dr = ice;
+		devres_add(dev, dr);
+	} else {
+		devres_free(dr);
+	}
+
+	return ice;
+}
+EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
+
 static int qcom_ice_probe(struct platform_device *pdev)
 {
 	struct qcom_ice *engine;
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 5870a94599a2..d5f6a228df65 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -34,4 +34,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
 			 int slot);
 int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
 struct qcom_ice *of_qcom_ice_get(struct device *dev);
+struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+
 #endif /* __QCOM_ICE_H__ */

-- 
2.48.0.rc2.279.g1de40edade-goog


