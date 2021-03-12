Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D805338236
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 01:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhCLAXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 19:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhCLAXi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 19:23:38 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B13AC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:23:38 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id e45so2719506ote.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7aT/J1LFmtvLKFcXjPBW6z31sGa88GVVAsq4gij9cI=;
        b=Dn5GJHIGdDBFWjBqycALa2+mx50GxHOB8uWp3ohF+lpu1lrM04eZO8HaUQORjTFXzF
         iPinfDZIf4QhZEdJRlcwYJHOmytJ25wC5hxCK8f1Tsm9YyRm8idvLETOkQBjAOmp7ffO
         0ViTC1hX8AlxyqTumScYmdexvO+2IEUL1YG6rzg3fM59ln5rZKNtqPGZHxby5PPpsWhB
         vYRqnSl1cNC+R+XTjwNJlFeMBrTdZ1mlFIdmyTEq+00kMQ2lYM8XCn8sCKbGaj/+VTMh
         FGn/T4+b2f3rkFYwiI9Q+220DwE9Ek1MMnvmcfWfKrgSa8M9cAIBkSoTe4/hBSgodidh
         fYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7aT/J1LFmtvLKFcXjPBW6z31sGa88GVVAsq4gij9cI=;
        b=XsfvONcjoIBtR/od2MpRk9Odnu/qdnLTZg3Uj2WqpySX0264FcRYdz1BMrD9bMKkeU
         Krms8WbJg5Bl+gPUh3idAJioiB5nad6ygwPeP0vznLhkMVymuIewzIXPelmI4A4/pCp8
         XGx/yARbs3xfJzaXk8cFYkX1ruEj04b6zw+iicKRuR7Zm5oHacoOX/wMZAu9LwlLz7J3
         Zuv66QCQuIwS8FOXYntnVm/h7SO6FaB9gYS9t8MRWr9mMcdo1IbGlCCCVP4I7AIayVAa
         jeR9h60w6avPtMWgvJi5Co7PvnMlJeIuKeULfrznqPcbB1G569Tazcklc/n9LLSKLy8w
         WhCA==
X-Gm-Message-State: AOAM5315fowHX2T31oODfxxcOTbg67oJuA7D0YiZ+ZImP08OyR4XvlLm
        9mZEx2YHXkGuvpXS/MjrdBDmDQ==
X-Google-Smtp-Source: ABdhPJyKq/vY0N41x7OuC1EarDrRQ9SAJlH1Wyv2qeZEniJ4lH/ZVcEnUtNwvCEzNRKEsQVdfEDssQ==
X-Received: by 2002:a9d:53c5:: with SMTP id i5mr1189218oth.159.1615508617666;
        Thu, 11 Mar 2021 16:23:37 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h2sm994460otn.43.2021.03.11.16.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:23:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom: wcnss: Allow specifying firmware-name
Date:   Thu, 11 Mar 2021 16:24:41 -0800
Message-Id: <20210312002441.3273183-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a firmware-name property, in order to be able to support
device/platform specific firmware for the wireless connectivity
subsystem; in line with other Qualcomm remoteproc drivers.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rebased patch
- Added default filename to the definition

 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
 drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index da09c0d79ac0..a83080b8905c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    WCNSS core. Defaults to "wcnss.mdt".
+
 - vddmx-supply: (deprecated for qcom,pronto-v1/2-pil)
 - vddcx-supply: (deprecated for qcom,pronto-v1/2-pil)
 - vddpx-supply:
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 2a6a23cb14ca..e8007cc01bfa 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -530,6 +530,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 static int wcnss_probe(struct platform_device *pdev)
 {
+	const char *fw_name = WCNSS_FIRMWARE_NAME;
 	const struct wcnss_data *data;
 	struct qcom_wcnss *wcnss;
 	struct resource *res;
@@ -547,8 +548,13 @@ static int wcnss_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
-			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
+			    fw_name, sizeof(*wcnss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
-- 
2.29.2

