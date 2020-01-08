Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBA5133B73
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 06:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgAHFxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 00:53:37 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46378 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgAHFxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 00:53:36 -0500
Received: by mail-pg1-f194.google.com with SMTP id z124so987177pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 21:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoB041Qi6gAAsKDfeXTiJLvWYKMaZ3RNSLAQlXIIIG0=;
        b=rmY/HpS/mbpy6xWHZc+XG8LDePEJw8nEDOE0yYUwMpcMbWnwWD4ibVlbu0EtJt9XGY
         WTpuQENnkbkloGePmvTrH2uDl2i4ocs//5xYYKO8sKEFe0NOUpPL4H9cv36+Fa8Wv+o8
         73u1xiZnqzTqz5nGn/h2l3h++gMTHvf/Qtf1wA3lblGcMZ9vIHGoEvJhTiocXpKJ45Ma
         qGZTgblO1msz7vOzp8YrREaSyZ+2UCokkTEp7+vGdJIBFAnzrJfwO1K1VOYPbogtinNp
         8LCL2gseqtHo1MnNLTdgnZ1qS+wMFzm8MCoHr2YBTHVLTj0+yQg+Qs3d5+d/U5ZDryb0
         ptVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoB041Qi6gAAsKDfeXTiJLvWYKMaZ3RNSLAQlXIIIG0=;
        b=ghGs1sou1cY70cOEwL+wgoGu51Ttu0ZZXSmTPxdw/R2FZPXPf4hDA51FBL4/twzQzx
         PK68Ae5AjDua+d0miLaGwFDUaMRIQMLeirOYCMrLBJD9n8INVHVJyNLYLuppoIk8g+Rm
         nLYsM3zuDcoppi6AOBuck77U4BDsR1T+m4buz2WK39CXKRRLmNdHRKPjM933t3iUdMbH
         wkYExcWwlCcgXjbRKaLv1TO4bBjOZYQiyGNNGEjZX11wxU0YxPLOhreI6K4zI5phpmDX
         DBuZsjITn9D0UgHmlL+aoq+ikfnE2x+GFyRPI+Rfm0HiRyFm9LGpgtyMpi+z3yMydHrW
         n3hw==
X-Gm-Message-State: APjAAAX7detGc4zaaXEq4iHzGQmU3qzLKAFjKgWF7Ph00A0S6hTRNi8p
        YGsbkuW7olsFIgV7LLIQbUZEnA==
X-Google-Smtp-Source: APXvYqzw6INjJz8mKK7BZ2+aIxdsMGb+ExuIJpa29ybtjU6VtPqSIZdlwTCJ4IiEtL1Rb8g/wUwGUA==
X-Received: by 2002:a65:5786:: with SMTP id b6mr3555590pgr.316.1578462816142;
        Tue, 07 Jan 2020 21:53:36 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b8sm1643971pff.114.2020.01.07.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 21:53:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: wcnss: Allow specifying firmware-name
Date:   Tue,  7 Jan 2020 21:52:52 -0800
Message-Id: <20200108055252.639791-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a firmware-name property, in order to be able to support
device/platform specific firmware for the wireless connectivity
subsystem; in line with other Qualcomm remoteproc drivers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
 drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index d420f84ddfb0..00844a5d2ccf 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    WCNSS core.
+
 - vddmx-supply:
 - vddcx-supply:
 - vddpx-supply:
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index dc135754bb9c..a0468b3cc76f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -457,6 +457,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 static int wcnss_probe(struct platform_device *pdev)
 {
+	const char *fw_name = WCNSS_FIRMWARE_NAME;
 	const struct wcnss_data *data;
 	struct qcom_wcnss *wcnss;
 	struct resource *res;
@@ -474,8 +475,13 @@ static int wcnss_probe(struct platform_device *pdev)
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
2.24.0

