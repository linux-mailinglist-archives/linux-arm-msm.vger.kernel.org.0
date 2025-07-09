Return-Path: <linux-arm-msm+bounces-64125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375AAFE08F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E75CB4840EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 06:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B9126F463;
	Wed,  9 Jul 2025 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee68gTan"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6126B741
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043936; cv=none; b=iwp6keFZVCNBh/l5YSzuejL1wDW55ZJEdIFYCyZw05noLsQqjyZln1YSa8MUqpNEcJ3RDg7n3bh0dE8VBs4YRb14ac0YB7OIKPkNL3llHf3nRo5Ox5hmx9SX76QHzI8W6h/laXgmtC0LO1DZAaHbY9nCoVRHS1HGP/0KOngm4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043936; c=relaxed/simple;
	bh=rGOMCabko7Vc8v31AK3+fltTCCxGP7vOGR/wv9M1Fio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+6zWD2VaiqXcE/bZSN74CVuWLohUz9+2z70rVlVR7MM7j3H6kmUKOJdXDcfy7qEKDAk676PcXa25nrzuqePwFIE5ccIG7lui+VJarBeHFI+I0glYIC6gxss8tL7bIIpuA74vvj8Skyh3ff0/CZFiwxtLJxNH/MI5Sz7IfVeSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee68gTan; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568IloYN030357
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 06:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LYFV+qfiOjpQ2WB3oecbyErwUPp11c4DuSZ
	3nYHUO1k=; b=Ee68gTan1r3tQRlp0wdWAOJL0uISGyv8cjXIvH1JVmuA7I7AyIH
	swqSYkl4NXFUbC/c817I9cjJg06bzqSdOpZ9c+/3OL5pPoDIy/MQlKYsLx1/H/qD
	KTm6M4d0FZh3oO9xsmMJnHX6U2F/zp3w+w4L72aojXA6R48GxAK1VA9deXyrNJVL
	0ldFyCeTBIGaOj6RrqvBM1M8A4Gqe3V9sjKX78Z5uo+t3Jq6rUtWuqZo9N6WM54+
	Ky0b6OlSZW7GkWgA0jqkaU+9vjxCj7LQhSsc/iKVNdnoEUIdQvt1xehCj/gfCkkO
	Pp1y75JB5/dkZPMJV+Cu17BXuD3mhC5wMiQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b10qgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 06:52:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ea83a6c1bso182277b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 23:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043932; x=1752648732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYFV+qfiOjpQ2WB3oecbyErwUPp11c4DuSZ3nYHUO1k=;
        b=P/BWkWD+d9IVdMbqHkLGpbuwCrYTMfYPSbGtorA+JPC+mhERvFv6N/kkEfFxiVtbbC
         7Zz0H3UPBGev1oQOFO1+8pXUI3GRApPhMmzH1kGL2daK24QEulP5uSOSjtHMm56Z3CfW
         scdM1ftLbVAM1lxfaQh3yzsPRPMwNfuYbE2SnuFxc4dGpPTF9s5nB1mdf+lRIT6P/NS0
         jvQdLAHSg7tS1DUBgrxk/CvyoSICQcDyy2Cd1KO4fp7DSl2Bduiq5B9EpuWDuOHO7TCF
         GwmSiXqAPaV2dpN+RBJlxOe9R6MP5GOjxDFoGBpNWXy3Eod/TM/R+Ld4IsdhyUN27CNx
         XSdg==
X-Gm-Message-State: AOJu0YzTDK7YK4t0HRVnDY3aXU5NrLL64V9FbFPLSNlHsSfkyEN5WlDT
	krHfHKzyqe/ahnPMnE3vHj6aZtO3fGuMuIKbCQOsJAET7vJ9TmjJ1TsgWFaW05xv73nyn9Ky4Jm
	YFaWr5cDUUma4B/gleWPqP4kVAtnPEWXnHtkLZMPWnLIhGNbsP5yh4iMg5FKmetkBmxMoazt4gq
	h1EWH80Q==
X-Gm-Gg: ASbGncuujM3jQRpt9kzY1izsAaxnmlANL0Hapg2oXzde8xs5KCmoDC61+7TiwhkxLdW
	jfyKZBrdyeIaIdgLe9EHCFrvXyvMpHb8fI99SZnkCuyYGzetir+NqvzRq1ferzAfBPseU9fGsyC
	PhE4mtYJpDAAOiE5IEFWzvIwHqXJXtu6pVjZWSMwpLGqeWHeklwaSt7iogA9q7bI11VfsXTJN+O
	Z39jJVFG/vuPfl1yOS3/qdlrThV6tRadatABVJBLenf5ZLeodQpZ+2MDFFyGGpb6xnvNik2hSLz
	YpyM9CG6ORzTIzfQ28mFrtxQjMVFKppP6r0cqqmjXxznKrWl7+s=
X-Received: by 2002:a05:6a00:4fcb:b0:748:31ed:ba8a with SMTP id d2e1a72fcca58-74ea6643e1amr1890445b3a.15.1752043932271;
        Tue, 08 Jul 2025 23:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAD9UdgTCiHjCpK2047MD6y9rFF7TCHzyxX3XcavW1hPdqvpCm6YUUzivM2ZdGT4W8UeAOyg==
X-Received: by 2002:a05:6a00:4fcb:b0:748:31ed:ba8a with SMTP id d2e1a72fcca58-74ea6643e1amr1890422b3a.15.1752043931846;
        Tue, 08 Jul 2025 23:52:11 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a2638sm13766285b3a.137.2025.07.08.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:52:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Wed,  9 Jul 2025 12:22:08 +0530
Message-ID: <20250709065208.25472-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686e119d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CoRrhzqLTzFM5RYyXc0A:9 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA2MCBTYWx0ZWRfXx4uUE4YI2atb
 hyX+0RnSAhfjr5t3xfZhBRL4X3ruw/GeQ0OEs1dqMxWCFixPR66O29ZZAJSGnNAfcUUZSYSOX/X
 MPFLab4LuRnHAHXkLFDInCarU+9cbr9t1qJpkQRqd8r/GfcF9+7HU2ZgFoacQ14Yzb5ftZhcYkF
 3rVQPaBO9X0fwyHOQ9DydiweZuY27fJezkHZ8402es2weLu7OHrTcBZfrBF3q7I2GI7KuOv2rPc
 /j3RZ7minAlLIxOB7O9zF1fHZUoDgpM66EekWYAw192lmy8Plpg6JgBAcqbggC/rtiM3E9BBRQJ
 O373d9Og/fc56sfH+0cYpMInYSBtGO04Rjl7HHvjcfsqjIoA4x6AQU1Iw3ZxT2y3m+i/isOhZvt
 k1GUfGlU/TARFrVw6/WSZhYr5eXyRJPBQ7vQFHTdofbVUcb60fbX1OkbBwWU4SDLbE1C7xJ/
X-Proofpoint-GUID: jVtasOEMKfZq3dMUdd_cVKAbS2XzPqAZ
X-Proofpoint-ORIG-GUID: jVtasOEMKfZq3dMUdd_cVKAbS2XzPqAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090060

EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
as read-only for HLOS, enforcing access restrictions that prohibit
direct memory-mapped writes via writel().

Attempts to write to this region from HLOS can result in silent failures
or memory access violations, particularly when toggling EUD (Embedded
USB Debugger) state. To ensure secure register access, modify the driver
to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
Secure Channel Monitor (SCM). SCM has the necessary permissions to access
protected memory regions, enabling reliable control over EUD state.

SC7280, the only user of EUD is also affected, indicating that this could
never have worked on a properly fused device.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
* Moved secure write before normal writes
* Added error checking in disable_eud function call
* Use ENOMEM error code if platform_get_resource() fails
* Select QCOM_SCM driver if USB_QCOM_EUD is enabled
* Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/

Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 24 ++++++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 6497c4e81e95..f49d5ac0e957 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -148,6 +148,7 @@ config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select USB_ROLE_SWITCH
+	select QCOM_SCM
 	help
 	  This module enables support for Qualcomm Technologies, Inc.
 	  Embedded USB Debugger (EUD). The EUD is a control peripheral
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..156c4f75c3c9 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #define EUD_REG_INT1_EN_MASK	0x0024
 #define EUD_REG_INT_STATUS_1	0x0044
@@ -34,7 +35,7 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
-	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -43,18 +44,27 @@ struct eud_chip {
 
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret)
+		return ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
 
 static void disable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
+	if (ret)
+		return;
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +188,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +211,10 @@ static int eud_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(chip->mode_mgr))
-		return PTR_ERR(chip->mode_mgr);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return -ENODEV;
+	chip->mode_mgr = res->start;
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.48.1


