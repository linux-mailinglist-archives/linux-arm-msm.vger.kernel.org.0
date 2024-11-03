Return-Path: <linux-arm-msm+bounces-36851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315619BA666
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 16:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E263A2817B8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 15:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E5218660B;
	Sun,  3 Nov 2024 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzevnEA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F04D171E6E
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Nov 2024 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730648259; cv=none; b=XI22QwacLBwNli+Cs3fWWrOKfBZxFbqp3zz5ggnlSXkAGOkLCtEwoVZFGPN0ipHFiNzd9XqTfe6WQK8Qqa4TBY1yc1KcZrXoe9oE+T4d8wy26Z11TbnijKXXD0G6d62i7JFSGPrlMzeZ1f5OcHt9hjID4bHNPdllmevRme6FuDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730648259; c=relaxed/simple;
	bh=sw8qDmg/fpdLnRt0QbNfK7Tvz/5Vb2q/W5NquGgNRVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNm8O2qqo9RLVbKvJatoojcw5lvpvjliZ0IZfPOGgHp0idf0MjwxEoLo24Qqxht3/GDLLybOSRpTS3zckIGWMFk8tFwDjF+TZ71SXshmhfSzWbQ+18XRp0lPCbHeeraLI3gsFlstRX+wo0eFd/Htzg3uSq+A6o2s8Gzg+Cs6P4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzevnEA3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e63c8678so3842900e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2024 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730648255; x=1731253055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rBtSxH+nRblxK0rTBEsk8wDwXuSSuDQ0C3QTkMi0+c=;
        b=TzevnEA3W8bavNN/EKB/QdC8XCQYPIeKFongK507BIu8eD50IeagtzDjG+QayE4CwZ
         pRs8hyG15otjeGQbMbPL+RQyL5I/DvyE6LWNXIP2F1yeQRne8XXaOKglotgsRk89baUZ
         xtq9/8QJZQXRTPFQQB8eosgctpApc7EZrq+mtwSTGXmqaiD/VIMpj6XvuIlhd3hHrtvg
         pvgeYRNdccwE4dmnTtxFr+pwZVDMcKPboGTjKu9ha6WmkjHbruBEAt+M56dZ1UJrpPpI
         qkAx2C95OQvjwzoruHQBbmOkDGRl+N5yKVYRz88MfwOyDKJQaSkkizf/y/3dVE/uS+0t
         EHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730648255; x=1731253055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rBtSxH+nRblxK0rTBEsk8wDwXuSSuDQ0C3QTkMi0+c=;
        b=ZzHpC5JguWSru6SiwvPurb+oSitGNdVURPQLHi011xZL60rAdXT25LmU6KWlN972C1
         WXBwFBrpd8vzGt/8+1mgySdWLw8wgd5eAFr3wh7sQ28sxYCSnrOt7/5qZCoULBENfzfc
         zEVYYnhaucnE1rwWVBiV761iKyxncZa/nTM50TbuBDPWlYKVrcHEUcKbqk0Oej97iwli
         KvXZ93/+gscNPmvdbhkXXKvBNKY+yZgPAHSySmsZEYZYf1L6bx+HKtrrP8DINhJlEspa
         UaK0b2t7zQRcFuQPfUmzJ4v97QTFxyn6PeKp+uizmqW5JRhTbNobu3ZB23QjkysgLZs/
         xq3w==
X-Gm-Message-State: AOJu0YxFYIfLzUrCB7PfrYTE3jOpjR1MRps1mcDHj1S7z0DpeUc5c6JG
	E/FlfVV9cCxfE/26g2pXvG+Y9Z44rEfhW7+4zJclUFOI4/F8ocnhNMMBgKl3iLg=
X-Google-Smtp-Source: AGHT+IELXtJDR4+8b0XHAj6OvRNeBjogWCkvRsCEPs881Boox9IIZGNTUcfx9zV3PZ+sUY+jBA73VA==
X-Received: by 2002:a05:6512:33ce:b0:536:7a24:8e82 with SMTP id 2adb3069b0e04-53d65de4988mr4332637e87.13.1730648255202;
        Sun, 03 Nov 2024 07:37:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce4fbsm1321133e87.128.2024.11.03.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:37:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 03 Nov 2024 17:37:29 +0200
Subject: [PATCH 1/2] firmware: qcom: scm: add modparam to control QSEECOM
 enablement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241103-rework-qseecom-v1-1-1d75d4eedc1e@linaro.org>
References: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
In-Reply-To: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sw8qDmg/fpdLnRt0QbNfK7Tvz/5Vb2q/W5NquGgNRVw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJ5i6PbyX3LbrCM8bdBp6waXJ/6gErOoy8fFEf
 wy2jBKsJ4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyeYugAKCRCLPIo+Aiko
 1bdvB/4viK378touiBV3Ea8U8V53xptxxPEMK/v1ndWvX8gjI7HbWYmCUH2f+UZx63oe2hdPBxZ
 IFz85s3PyCbNxfoS2wskEmTPJJnsQQknb9Og50Ek3vOJzwIKmht3nUqqHw/hy0kmyb5BtwtZ4SB
 D28u/YMoFLVpQ7aSoHLzcM/c6wNgKx0oh3m9gmk3jLl8yTncju6D4L2wje0MOi2SIZLXxtX3EJR
 f0pHpEJhzQU+WpR4RREyjkeCB6+hlln+KV35ebPjuEPtBVmS423ZXtLIdI15ImxiPVhfmIRDJxd
 Tw1L+cXnOLB85iKSBVAk5JXzqKaPn3CIQVIn0Zt63AXv8oKP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to enabling QSEECOM for the platforms rather than
individual machines provide a mechanism for the user to override default
selection. Allow users to use qcom_scm.qseecom modparam. Setting it to
'force' will enable QSEECOM even if it disabled or not handled by the
allowlist. Setting it to 'off' will forcebly disable the QSEECOM
interface, allowing incompatible machines to function. All other values
mean 'auto', trusting the allowlist in the module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 47853860422525da79a249824afb45f6801151fd..9fed03d0a4b7e5709edf2db9a58b5326301008b4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1737,9 +1737,14 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
+static char *qseecom = "auto";
+MODULE_PARM_DESC(qseecom, "Enable QSEECOM interface (force | off | auto)");
+module_param(qseecom, charp, 0);
+
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
- + any potential issues with this, only allow validated machines for now.
+ * any potential issues with this, only allow validated machines for now. Users
+ * still can manually enable or disable it via the qcom_scm.qseecom modparam.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
@@ -1756,11 +1761,21 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(void)
+static bool qcom_scm_qseecom_machine_is_allowed(struct device *scm_dev)
 {
 	struct device_node *np;
 	bool match;
 
+	if (!strcmp(qseecom, "off")) {
+		dev_info(scm_dev, "qseecom: disabled by modparam\n");
+		return false;
+	} else if (!strcmp(qseecom, "force")) {
+		dev_info(scm_dev, "qseecom: forcebly enabled\n");
+		return true;
+	} else if (strcmp(qseecom, "auto")) {
+		dev_warn(scm_dev, "qseecom: invalid value for the modparam, ignoring\n");
+	}
+
 	np = of_find_node_by_path("/");
 	if (!np)
 		return false;
@@ -1802,7 +1817,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed()) {
+	if (!qcom_scm_qseecom_machine_is_allowed(scm->dev)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}

-- 
2.39.5


