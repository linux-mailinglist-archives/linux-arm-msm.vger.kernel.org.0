Return-Path: <linux-arm-msm+bounces-17528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A88A60DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22753282B97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 02:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769786AB9;
	Tue, 16 Apr 2024 02:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvLA1KpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA4101E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 02:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713233942; cv=none; b=QP2/L6yVCk9uR2QoXbGN0vS03AX4TJxs9SzgbiUNWzUJqpNh63x/n9dbJ/8U0VjrBbLYewgilqq7rTRGUwFJvibl9Jd2EBUVWF+8LwmNJnEHgQrYzubXrHlKUcnuZm+iefwb9ld88+5XieWjBt7ac0xfyD+q8fR2Y9wKfRy8JGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713233942; c=relaxed/simple;
	bh=MHIdviCdb2UidFcnZtfqo0Fb9VHpj6iocABWQYC7Xqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r9UbQ0WXnco473tTLzhuJw1+AjQ56vP/jFDbqBnjoQhUVy0OtA2kqvU+VraDBIoR3gBGTdaslOLDGQRJMFndhusiOc4E1AsOY+NoMA77bfRtKvzab1ZpvRZUv9pnIfU5c87YhiH1RVoEwGNwuaQeB6IXrfvye/y6JisWfP5Gbxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvLA1KpD; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d6c1e238so4692220e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713233939; x=1713838739; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5oDbW8M1wnTWukjhwfq9qbSiG4q2CDrYmMq6tS/w00c=;
        b=fvLA1KpDB0hLH+hPuBbv4A3FEWYcgqmlyIxg2ZJ7nFl6FLTzCdMT1i4IqIymip5qhr
         swzJSWV1t0nLc3/92jXS1GXgyo/lyOPja7nWNd8tYd9wgOcYVLcxUu1Qbz3ZrHjhztJC
         wo39ifKpwL/Txjji/OWTjVQMsnH+t467M0/EKH+SSgIQzbsSORdogqFC8IAOPLTTb7M5
         H4oZdHVefCx2BOykA+zr7/sgkqDp9zdh+ONobM087SXLuaC9gCbkONlyDXMUIaXCgzZH
         PqZqFG+dNUXJfxSvtmW+KgBByPkAD70lTrJ1OavSyLPjzTeUtEZ/MAmqVVNEYRSVP5J+
         ypLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233939; x=1713838739;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oDbW8M1wnTWukjhwfq9qbSiG4q2CDrYmMq6tS/w00c=;
        b=wHKOJ+MnB9GytwMgi23Ry7MW80kMMGdkfWMi7gZ1QYbgRxH41pSX0bGpVzockqUZqH
         SThoYPkrZEsEYkjGRp6VjR9Qos4bd0EEaaWQIWxmwD4CufyxtyrR8UXEhRmkH8qXRCYu
         HvyzrIDNnwPzDJSX2JZQyDChALQlB5W8fc9tGkUZ9jdLSzwT9K2TdLrS7NU5dnl595yB
         pRSW1YCFoRP3EOqCQfOIgZBk/DDGY6DgRM2VEerZ6upH2BUC9Op2kxT4L9ttl36edLWe
         p6s7TsQSJAvAvZ/Ckdrwb8GK2gnJavXup/s2P4K9QDN2jnOQSnXS9lG90WTqaYDqU4w2
         Z/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+rfaPFjRzyveEBmeSnu3jRNybBV1a377KWWr4eGqCUkVG6GNUPt4sJ9jh0977KIaMPwfQ4UpnkQV/IpfdjrEqJtZBbMVpwUB+hCvwA==
X-Gm-Message-State: AOJu0YzyorQPtMYiw7JoH9pgdzKjJSYf10byNnMPNcphoIRzVaAKSk/D
	nz6HZhaQ7hXY2nZDZJtzqwFaLAZWC0GBUollUgzZVFs7uc+tlNw+1oUwspnr7z4eTDsJpihhdDI
	L
X-Google-Smtp-Source: AGHT+IHfyVY9cg3QTI5knfzFgZiKtEcizLWiX8/cm33X8cyTKnAMLoSSEcH5gXxzE+6/VFBO70AOFA==
X-Received: by 2002:a05:6512:3da2:b0:516:a13e:d775 with SMTP id k34-20020a0565123da200b00516a13ed775mr8830997lfv.2.1713233937986;
        Mon, 15 Apr 2024 19:18:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w12-20020ac2598c000000b00516c403d243sm1419868lfn.60.2024.04.15.19.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:18:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 05:18:56 +0300
Subject: [PATCH v3] usb: typec: qcom-pmic-typec: split HPD bridge alloc and
 registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-qc-pmic-typec-hpd-split-v3-1-fd071e3191a1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAA/gHWYC/4XNTQ6CMBCG4auYrh3TTvnTlfcwLkopMAnS2pJGQ
 ri7hZUujMv3S+aZhQXjyQR2OSzMm0iB7JhCHg9M92rsDFCTmiHHjGc8h6cG9yAN0+yMht41ENx
 AEyBWPEMuzhxrlq6dNy29dvl2T91TmKyf90dRbOt/MwoQIAvZKNXWUsviOtCovD1Z37ENjfgJV
 b8hTJAoedbmEkVdyi9oXdc3zbR8lwgBAAA=
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3051;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MHIdviCdb2UidFcnZtfqo0Fb9VHpj6iocABWQYC7Xqc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeARXPEiZjIUDFYvajgiSUJkPkERcc1010T8R
 P51cd5Ey5qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3gEQAKCRCLPIo+Aiko
 1StjCACcCM5SP+4h5B28K85XStct3OSB9acYvCwV81z9BaC2oUzhvCiRGicL1HVNeMkPKCzJ7x8
 KOLeWW4rS51upcj15IZfmJbeGuz/yuqNbKZrT7KZqFvBo7U91+OJkDtTumCdiNOATDuYnH1LMoP
 Hbi2S3+oAeokvtTn9rCjELvo+kVKGqJHJw+nLt3LJKrOodpBJM1+ejJj5wsk5lV73EqhRJ6HxVJ
 5a6+6Ed5gN08xXsWboZ11+1o25PZBThVmT4zaN3jjZ195ikLkcumVhIiOaGlqa2hOXYWQUXNtrn
 kYdfqIWfQdzj5PHgwdMbEmZTO0GJso39+lWxUjixWTr2DfCM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If a probe function returns -EPROBE_DEFER after creating another device
there is a change of ending up in a probe deferral loop, (see commit
fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER"). In case
of the qcom-pmic-typec driver the tcpm_register_port() function looks up
external resources (USB role switch and inherently via called
typec_register_port() USB-C muxes, switches and retimers).

In order to prevent such probe-defer loops caused by qcom-pmic-typec
driver, use the API added by Johan Hovold and move HPD bridge
registration to the end of the probe function.

The devm_drm_dp_hpd_bridge_add() is called at the end of the probe
function after all TCPM start functions. This is done as a way to
overcome a different problem, the DRM subsystem can not properly cope
with the DRM bridges being destroyed once the bridge is attached. Having
this function call at the end of the probe function prevents possible
DRM bridge device creation followed by destruction in case one of the
TCPM start functions returns an error.

Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Updated commit message to explain my decisions (Johan).
- Link to v2: https://lore.kernel.org/r/20240408-qc-pmic-typec-hpd-split-v2-1-1704f5321b73@linaro.org

Changes in v2:
- Fix commit message (Bryan)
- Link to v1: https://lore.kernel.org/r/20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index e48412cdcb0f..96b41efae318 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -41,7 +41,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
-	struct device *bridge_dev;
+	struct auxiliary_device *bridge_dev;
 	u32 base;
 	int ret;
 
@@ -92,7 +92,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
 
-	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
+	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
 	if (IS_ERR(bridge_dev))
 		return PTR_ERR(bridge_dev);
 
@@ -110,6 +110,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (ret)
 		goto fwnode_remove;
 
+	ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
+	if (ret)
+		goto fwnode_remove;
+
 	return 0;
 
 fwnode_remove:

---
base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
change-id: 20240405-qc-pmic-typec-hpd-split-22804201902b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


