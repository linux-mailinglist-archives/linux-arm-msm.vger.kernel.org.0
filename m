Return-Path: <linux-arm-msm+bounces-65845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C5B0BCC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6743172232
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BD227EFFF;
	Mon, 21 Jul 2025 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FX94H6SP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4F27A92A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079938; cv=none; b=P2zPiEzSOoQcOmd2MJxW0TYUGespooBM3sIn5/AfohyqUXBz1VymqgcBjzBhTSf41N/Vm9I+JRmvbPd+cSd3NcUKH7tpHS3dVpK1PqNKcaqS0uO2R8eSauKfUc/VraPxigVDDhhRgpnh9A7SD9YI+tsekcZNvLje+BcCT5qzln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079938; c=relaxed/simple;
	bh=2xg0NV/M3b1B1hjZbwFKdPDsyamKVf1rmwKufVJSzuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DDLDKkthJTht23VV/NjCPnj2FN5FePTedlaD4Qi8GWDWe6hYU3oXXarBf95cA3qFEANTOviF+JxvBKWXXBzgFNSZFgha/VbwT/C1cdWKn6/BGETUykUfSZIuthrG6EUOwLfy5ziS+MGAfj9vJT72fsy8+Xf4MVyZOO5hCeB/HF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FX94H6SP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L40flG016289
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fYHYCnRlqnA8SARi373nD6
	538xoAzXeqruNe6iQgZOI=; b=FX94H6SPHQj4sMft4J4ZhdRBTMkYvNVrP3iHsI
	h8i2TCBj4mlfzqZygKKlTd0/L8fNIGHcbVbKmzVYnRvJJtTEhsPn/9NCQErqvG5H
	OGfMbsEVUM3TkPJ3tLZheZE7pfGDgWt6Iim9WpKwpFc3u1brlc8qIxW5TIZCJlbS
	26SYtt5uLAsAKTdt78e81BNl/DOhjpkgE7hgZijPvzMZnOHk9yF8VIeMZDAqmNYg
	MnstvD2CWZkmNDqRIjyNlVN/BzDqTYJKBvfPCBgnypg9Mym1KUaQBKGEL6nK9kzF
	0SbWpXpDQ3EhKzZbi9hQIwGAstSQBGVGxXdxRxUcnN74dQQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rupes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:38:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-754f57d3259so5886322b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 23:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753079931; x=1753684731;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYHYCnRlqnA8SARi373nD6538xoAzXeqruNe6iQgZOI=;
        b=I/7jtQXakL72XJKdZYcL1HpB6OZoQtioOSSOeId4T82boApfdUOB6A9lBVMiYaWnV6
         XC/om5BiBpS5vwRaey4TE+wWw6YhOgMaNk4wD7nQ7REQuVMEhtuZvBztLy/YZZeIe5az
         +KM8nH7+dKrSDVavghmazgfstePipO5W482l9UBTKAI8j1TNsZk68fn6Ecxx4s0RbDYI
         1oMXaIMTa2XMvKk5LRmpEoMU7uq9zeT3O0xK8wYzhekGn0WKKaa7zbaIA4nqzHnsvmK7
         i3/rV39+T7zcQQfwcptvXWIq24YSI2PecWJC2F33+0GZ0/p7g1LQkcVJ8dm1SeD0OzJa
         jb4A==
X-Forwarded-Encrypted: i=1; AJvYcCVYgCxNgT4AJYJxZgJH47+cSt6H2yJGp/pHxxWaX0bAkfIwvE8jG3HEyyIkodtk1cX9IZg3Ku4K875XdFs6@vger.kernel.org
X-Gm-Message-State: AOJu0YxxNKNkhwTS0Rx5nwwPbPQ3EiPHiw9IPqzv0N1ZFax8qTc6/m2T
	uWzFMS43IRI8aDxMPOHzAplR1JypUx5ExElb08duqjWXSwAAYTGlSIotG+1kHMF5FQ/lI6mOL7I
	bTT2tBzsMRHto9jmIk7eRCrpKyi8BwvnlwdWin7BtWtox84EiSuKvDdeQwzZ5nUt4FCDs
X-Gm-Gg: ASbGncv3sso9Qh2dDiMyhOOKunWIvbxyzWT6NoE9rzmeK9bbVXKxQQDm1YhFoMrCNKW
	Mty1QZWjGwgDq8aXU7fyXQisxtkMh1AyiLb/6QLGMDhOTBHFknYa7z21qVS12lRMak6jQ6OXDrX
	ov/GLUy5bB0O/c4RyhDF4MYbbCzviqggvBillCr8zd91JThWk+E6vierAPy7EiuvpOUJdyWHm+0
	3dZ3H7hcI2wkGj6NfH8+JrQ1hO8xQ4500mNCqQRSOZ5PEh+AdzKz0JtRXeubTXXquLQlmh0YRzw
	lq/tDyfCa30h3fBgSaiO7PqKy4yE553Ky3Oci23uNw3yWaLKW8hjucdHEEEdC8aHX/VS
X-Received: by 2002:a05:6a00:1488:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-7584b13905dmr21777756b3a.19.1753079931077;
        Sun, 20 Jul 2025 23:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe3084qTMHfewaxpTs+H7S7dY/TNvKUMB/eyZxsYUU44g7Ux5hgQk/0nK2V1m3gP2ZCscKDw==
X-Received: by 2002:a05:6a00:1488:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-7584b13905dmr21777730b3a.19.1753079930597;
        Sun, 20 Jul 2025 23:38:50 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154745sm5149329b3a.91.2025.07.20.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 23:38:50 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 12:08:41 +0530
Subject: [PATCH v6] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHDgfWgC/42OMY7CMBQFr4Jc48hxcAxU3GOFoo/zIIY4Bn8S7
 Qrl7muokGhonjTNzHsIRvJgsV08RMLk2cchQ71cCNfRcIL0bWahlTbKlkZibJsQWzSBBjohNQw
 3JjTkHJhlDWNROVvCaZEl14Sj/30FfvaZjykGee8S6E2rNqo2pqoKbaxeyVJeYqC+ONCZzrvIX
 NxG6l0MocjztHae7zH9vV5P5un++uBksh+23hxQqXW7os/Afp7nfxHRjRkZAQAA
X-Change-ID: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753079927; l=5653;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2xg0NV/M3b1B1hjZbwFKdPDsyamKVf1rmwKufVJSzuU=;
 b=NyR8KHH4oexneKEyVAQGrT4A+qpwhmKpQbvYXNLTleW6BHByNB6K3SHd3DxZiS+uplKzAaXhP
 tAgt0Ag8tjmA7C/pRvsHkqtwaVZq4CNcH9vcZJLnG1yyMFS8fZkDFl5
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDA1NiBTYWx0ZWRfX11LL+WcjTBmJ
 /73PVy9SgOLSHODO71CV7xg+Fr80Yf1cqSea++sdVSsjQGfLbiqgwXKkVsSapSLgS0QmvfpxpLc
 B9Z7S7jE61RAT/3Wh9Wm4AUxm/Q7l1KA08y/wYjERnoCzWZctLJxYlOo8bH6xJ7K1KlolCyoa0E
 582nvXj3WR8VLidpRs02FN3cye7xz8CpFZrGU64GzAK5zjNoina6vB+9rE0T+6aVC0mSW3nVx+G
 Ux3HZVSmcYlLFFgE5oVOf55Y6OW11egW/Ikxa73fr4xQGM7N/0Am5e1t1fTOe94dJzvOC2SQsT0
 cj9EGLsIpjVN3hDOVyBDHVh4n1iE9MxwnW8PVqWyXk4TE4XsC5M6GKAT/kK5cWb3ehuzNAKeqbp
 fesVFqqAwpz6MbU8z7Ph2Y8LY84EJj/CNX78cKPP0Jw8jol98uahzfDi+Mf4JtP6Inbqcybx
X-Proofpoint-ORIG-GUID: DNuviNM7OjtAO-mcatoQIszQRVkKfi7a
X-Proofpoint-GUID: DNuviNM7OjtAO-mcatoQIszQRVkKfi7a
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687de07d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=lmNMGcLygp3pFLK-ZoUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210056

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
Changes in v6:
- Propagating the error code from disable_eud(), per Dmitry's suggestion
- Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com

usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls

Changes in v5:
* Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
* Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/

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
---
 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
 config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM
 	select USB_ROLE_SWITCH
 	help
 	  This module enables support for Qualcomm Technologies, Inc.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f281b2136d0d1eb39418c7f94ff8c..05c8bdc943a88dab6159a05c2d770484c084f7b7 100644
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
@@ -43,18 +44,29 @@ struct eud_chip {
 
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
 
-static void disable_eud(struct eud_chip *priv)
+static int disable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
+	if (ret)
+		return ret;
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	return 0;
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -82,11 +94,12 @@ static ssize_t enable_store(struct device *dev,
 			chip->enabled = enable;
 		else
 			disable_eud(chip);
+
 	} else {
-		disable_eud(chip);
+		ret = disable_eud(chip);
 	}
 
-	return count;
+	return ret < 0 ? ret : count;
 }
 
 static DEVICE_ATTR_RW(enable);
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

---
base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
change-id: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


