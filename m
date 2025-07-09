Return-Path: <linux-arm-msm+bounces-64126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2AAFE09C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DAEC1BC6420
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 06:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E27526B2B3;
	Wed,  9 Jul 2025 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OppS0zo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1D1B4153
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752044141; cv=none; b=UXMRZRT8KaFMD7LMExWDbGSv/sxjW+M8xFyd8SuOkpYzsCnf53sdkjkjnln/FgDq1n6JH/jOotwWM2/nXsHBwInY1DRi4bjXtl5dVzKUzqWYJ+cUKgjh21yfiDqSlFeQ7enp4faPlOY+cVR88Z59C3+pYZK9pijTm2XMq63zhAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752044141; c=relaxed/simple;
	bh=aStpdlLyG/6MtjjNhbFEJ4UHFKsyDfXe+V08u1Vqp4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c2wUaEwEp36MZGIJKBPXtBm5HR+so6ONlIHzWXuG/tB8AbpvtdOwHGtUciq7KClAEypZgIod7U3f3yDLbw5S+NpVL/ck5cYP3dued4ihd5mK7oTrPcuHmL/NN0FWdCvSlosEnwarbURNaMepl7HoGtIqCbo1xqFgz2Oxlbu5SDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OppS0zo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JqtAA031807
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 06:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+GJzZgUqMI2hbbRTEmaNiN
	bgqXt+YXuLS9oqBkPXt7A=; b=OppS0zo20JIOP80NQBVebFOdvtxWBw4BWRLgEA
	Otp3qLURRChF0OWQ6WYABHHdoLafukmveeit0Ben/UnOd/pFV6gIsobb2mbWjBfT
	UnpS7HSSsz0l6sOZu49jG8PzpN0jTWZiMHMp28jVp7K5xHMWcVXTkL9FP+VzXYZE
	6f3YgASBLcZx1zdrezS0mAe++LxGdesokUAeGO/ZAGxQxmP2pgcm/5LlEeociraO
	dPmH+a4PDS7vEsFXRMtbWh4d4oFB6QY3Zn0flqlMPS76XiikP3TyUaYkP/euY+Gy
	YwFJcXK0zHbf50RE9Aqxld5acGR3DCQcwzpzvB7peXfO8ILA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qtjcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 06:55:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313f8835f29so8414864a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 23:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752044138; x=1752648938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GJzZgUqMI2hbbRTEmaNiNbgqXt+YXuLS9oqBkPXt7A=;
        b=hthRBLWBaV/f32n5Z6TpmJnwpEf6Npd6PwgiRI7UY5oE6ntEsSCyPwedh+J+QHq4PQ
         ByaNVVVLiOuQ6CV04ts6EX3XAId8tfthLHXRegqAh8FU/Q4XWNUI5rcyU98hcNqO54IP
         72nRKRyIZjzgUiwplG77OFffixjEDTKdHArDZ4oXmeUoM2YudT26L/YuEQuZDFCxXTtz
         N6LkW9+KYxVEjmkZfz8XlG5LNFmFANzHymGER8B7ijcK3iqj5Lno9ricXyDkFSkfI727
         cYjWkfXDsmNRarH3vwXeTh0TGgTWRXz1j7gH3sk3LCoOzkkrq2K6I5NHVebNqrR/HEfQ
         PC4Q==
X-Gm-Message-State: AOJu0YydSO2890kip3XCrr/jhoWDMVvXPMOrXOXO118NC+C3qL7pYTUk
	DIcYcnJU8VcaPe0k0RglD8K1bHrrrIM0+SkRWqobn0c4cPCVOhdHuMduM/PMqO+Ci+/br3j5e2d
	BljzjRP+AwPHLc2vpcVjGDm5UgkktSg+yMLnPJiSfpoegMk7iMli75ROjcf60NEoHPHzj
X-Gm-Gg: ASbGncsj8yTvydAm8tKKJTly9w1glCA7eKn3yTXqa7ObqyXFnNSHUhbTNu4hKW7BEVY
	9C75vZhBgzwXwr6Yz23mQUM3rlZT0MdaL4tNkbXoR+XoVhXQYmMC8l+riL3UEmUfecOEu2wqp8/
	5prqPphWGEApacbTDK77sBixofSsvjzLDraHjtLA/1pFgxbxwX0ZreKT9wG4aKzamOA4FlY3hc8
	4s/kvFjobDUJM3XyBPRSB5sBagtchOGBaEJpd5dhUl8IEvc+Kk8ssUU1hf3QcoPtsFshkCAki44
	Uhptz9fadhtd/wxSEUZowp8O1NRDSI9TsIojcL9cz0VaU8O4Jm0=
X-Received: by 2002:a17:90a:da83:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-31c2fcf3c51mr2422591a91.13.1752044137810;
        Tue, 08 Jul 2025 23:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5yfc8Y2jDpZ/E660q3B9XX34ak9hBxhvIIKY9LijykXgX0MytbGPEN8DCwPrxFMRyaT5q+Q==
X-Received: by 2002:a17:90a:da83:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-31c2fcf3c51mr2422559a91.13.1752044137334;
        Tue, 08 Jul 2025 23:55:37 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3017cc3bsm1191192a91.24.2025.07.08.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:55:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Wed,  9 Jul 2025 12:25:14 +0530
Message-ID: <20250709065533.25724-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA2MCBTYWx0ZWRfX4WgnaSH3m8w1
 y3CPTuCCAT33bXGNRjYTYIPYataKDxmqMqEM1BBttrKo+Vj83eCsjlwHFCoblU+Q+EjrLaeKf9b
 aS799OVBZqbR052+69BZXhJdDSfcjDEdz8F19Y8xwVHOI+VVeCXBJui0L/z0xAUDiuIg7j6hAhi
 sfbCZNl/VPvwKqHH459APdwf6QOdE4CWaNakjbJtFnqrTud/uZBPc1zQawxk+WGlUkzWg900C3b
 BrnTCgNDaHliUOoC6O5tzmBQrZPs7Oe8XbanI3vITOGVEXB+9f3bv4SkdhcCF5WZZ7AD4NcDvCj
 IiTVMLeITjyenBTnmEcAPSavbYNH0jlmyZl36iShRdxgOv/9x/yqe25qQDasGBhEiHkI60yVWIM
 dNSx697mYodD1OCWgRun9/I737TTt0WWBPIdugKAmfD0d17kP5UrfB4ydwyDOvOllT5McucL
X-Proofpoint-GUID: L1ZlKR0lct2UceFharW86PGxs1sEflbs
X-Proofpoint-ORIG-GUID: L1ZlKR0lct2UceFharW86PGxs1sEflbs
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686e126a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=eSh0DRBKNElbVECXfMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090060

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
Changes in v4:
* Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
* Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/

Changes in v3:
* Moved secure write before normal writes
* Added error checking in disable_eud()
* Use ENOMEM error code if platform_get_resource() fails
* Select QCOM_SCM driver if USB_QCOM_EUD is enabled
* Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/

Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

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
index 83079c414b4f..a58081f53db3 100644
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
@@ -43,18 +44,30 @@ struct eud_chip {
 
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
+	if (ret) {
+		dev_err(priv->dev, "failed to disable eud\n");
+		return;
+	}
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
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


