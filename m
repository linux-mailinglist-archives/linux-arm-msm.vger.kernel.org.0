Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4527E62B786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbiKPKRK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbiKPKQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:16:59 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A318AB489
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:16:58 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r127-20020a1c4485000000b003cfdd569507so214108wma.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw5QT1NVHfKKpmW7+khEKT2Vh+eUJ/stlclYXIud4p4=;
        b=AH4KC2hil4/jmyYmqRsMSX5cx0eNktRhCSImGrZTarg8ROS+AJJymBA3cJiCkvF+ae
         4Tqwi8a+tmYCgrGaQxj6gwPXqdnT3URn+L54FPs4KIFgNWGaAByu7HcQfyxN3k+FKJGy
         bVhTW72QmTu6fluMBvGxfriYQJJny49DtROFfAf+GlRHi0dOUMGZtPSIQUMdYD/dgr7Q
         BR5o+Q6SLuR83UoSZB684bEuF47FkxYjJbOAvr6K48UDxcPFGijbgsVHaNpIdkdxr/v6
         7r3fXC32gdItRwkBT/1NJTwU3tyX2yVq66TueF65YAv5jG2SQ9eUZNaGLF0Ejf2Mczwt
         kB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw5QT1NVHfKKpmW7+khEKT2Vh+eUJ/stlclYXIud4p4=;
        b=wauuMof/2iy9AEDDuHtFu0IF7/0qzhEY8mNwRSv776lrZ0eJIOV4gaB5oC/ud6h7MJ
         XDxNDb65iD+kXhoDlj6/gR3DQ9gXvRL3JhJRDURNX9LuG+6bIFDh5Oy/MayC/Ckbiiw6
         cvCxYhqFWuj50P0LHS6muNoAJ4WzGL572A/vqY6jp+W3aXeFef8ePgdDA4xTQeabHa13
         fIRA2yw22zGJe6fKG+lnJNQu5Eo4c+v0mv+gflsMCtioVtf4LcJiiWugVXpNCV8C8Hfz
         HYFhbsa4T2jMQgwg3j4oFyaVxs0eUEANzgJN9s11/HXzxdQ+pp9bYALpKypVhoiamyQx
         6rrA==
X-Gm-Message-State: ANoB5pk/COr8uvMa39nR6FZeHsUQQIUwf3MSfUUCQr5jn+OC0/2BvTpS
        uAFjnTHuJ72+hiTq8ADC5E/0SPb9j+FLzw==
X-Google-Smtp-Source: AA0mqf7CvEEYHTZX+DjpHNUnItyw0lzgLSIuFLXmUgxgw5w+UlHIQmqgEDe1/rjx0joZYYCPxP79iw==
X-Received: by 2002:a05:600c:a14:b0:3c7:a5:6113 with SMTP id z20-20020a05600c0a1400b003c700a56113mr1632321wmp.129.1668593817181;
        Wed, 16 Nov 2022 02:16:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id c4-20020a5d4f04000000b0023672104c24sm15081007wru.74.2022.11.16.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:16:56 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:16:53 +0100
Subject: [PATCH 2/2] soc: qcom: add MDSS DSM memory driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-2-158dc2bb6e96@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-0-158dc2bb6e96@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-0-158dc2bb6e96@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds a driver for the Qualcomm Modem Processing SubSystem DSM memory
used to assign such regions of memory with remote MPSS processors.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/of/platform.c           |  1 +
 drivers/soc/qcom/Kconfig        | 10 +++++
 drivers/soc/qcom/Makefile       |  1 +
 drivers/soc/qcom/mpss_dsm_mem.c | 95 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 81c8c227ab6b..d5a9962641f4 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -504,6 +504,7 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
 static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "phram" },
+	{ .compatible = "qcom,mpss-dsm-mem" },
 	{ .compatible = "qcom,rmtfs-mem" },
 	{ .compatible = "qcom,cmd-db" },
 	{ .compatible = "qcom,smem" },
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 024e420f1bb7..7624a8af56bf 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -95,6 +95,16 @@ config QCOM_QMI_HELPERS
 	tristate
 	depends on NET
 
+config QCOM_MPSS_DSM_MEM
+	tristate "Qualcomm Modem Processing SubSystem DSM memory driver"
+	depends on ARCH_QCOM
+	select QCOM_SCM
+	help
+	  The Qualcomm Modem Processing SubSystem DSM memory driver is used to
+	  assign regions of DSM memory with remote MPSS processors.
+
+	  Say y here if you intend to boot the modem remoteproc.
+
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
 	depends on ARCH_QCOM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index d66604aff2b0..0d0e850f1a18 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -16,6 +16,7 @@ qcom_rpmh-y			+= rpmh-rsc.o
 qcom_rpmh-y			+= rpmh.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
 obj-$(CONFIG_QCOM_SMEM) +=	smem.o
+obj-$(CONFIG_QCOM_MPSS_DSM_MEM) += mpss_dsm_mem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
diff --git a/drivers/soc/qcom/mpss_dsm_mem.c b/drivers/soc/qcom/mpss_dsm_mem.c
new file mode 100644
index 000000000000..5584bd101aee
--- /dev/null
+++ b/drivers/soc/qcom/mpss_dsm_mem.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Linaro Ltd.
+ */
+
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#include <linux/qcom_scm.h>
+
+struct qcom_mpss_dsm_mem {
+	phys_addr_t addr;
+	phys_addr_t size;
+
+	unsigned int perms;
+};
+
+static int qcom_mpss_dsm_mem_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct qcom_scm_vmperm perm;
+	struct reserved_mem *rmem;
+	struct qcom_mpss_dsm_mem *mpss_dsm_mem;
+	int ret;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	rmem = of_reserved_mem_lookup(node);
+	if (!rmem) {
+		dev_err(&pdev->dev, "failed to acquire memory region\n");
+		return -EINVAL;
+	}
+
+	mpss_dsm_mem = kzalloc(sizeof(*mpss_dsm_mem), GFP_KERNEL);
+	if (!mpss_dsm_mem)
+		return -ENOMEM;
+
+	mpss_dsm_mem->addr = rmem->base;
+	mpss_dsm_mem->size = rmem->size;
+
+	perm.vmid = QCOM_SCM_VMID_MSS_MSA;
+	perm.perm = QCOM_SCM_PERM_RW;
+
+	mpss_dsm_mem->perms = BIT(QCOM_SCM_VMID_HLOS);
+	ret = qcom_scm_assign_mem(mpss_dsm_mem->addr, mpss_dsm_mem->size,
+				  &mpss_dsm_mem->perms, &perm, 1);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "assign memory failed\n");
+		return ret;
+	}
+
+	dev_set_drvdata(&pdev->dev, mpss_dsm_mem);
+
+	return 0;
+}
+
+static int qcom_mpss_dsm_mem_remove(struct platform_device *pdev)
+{
+	struct qcom_mpss_dsm_mem *mpss_dsm_mem = dev_get_drvdata(&pdev->dev);
+	struct qcom_scm_vmperm perm;
+
+	perm.vmid = QCOM_SCM_VMID_HLOS;
+	perm.perm = QCOM_SCM_PERM_RW;
+
+	qcom_scm_assign_mem(mpss_dsm_mem->addr, mpss_dsm_mem->size,
+			    &mpss_dsm_mem->perms, &perm, 1);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_mpss_dsm_mem_of_match[] = {
+	{ .compatible = "qcom,mpss-dsm-mem" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_mpss_dsm_mem_of_match);
+
+static struct platform_driver qcom_mpss_dsm_mem_driver = {
+	.probe = qcom_mpss_dsm_mem_probe,
+	.remove = qcom_mpss_dsm_mem_remove,
+	.driver  = {
+		.name  = "qcom_mpss_dsm_mem",
+		.of_match_table = qcom_mpss_dsm_mem_of_match,
+	},
+};
+
+module_platform_driver(qcom_mpss_dsm_mem_driver);
+
+MODULE_AUTHOR("Linaro Ltd");
+MODULE_DESCRIPTION("Qualcomm DSM memory driver");
+MODULE_LICENSE("GPL");

-- 
b4 0.10.1
