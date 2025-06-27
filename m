Return-Path: <linux-arm-msm+bounces-62787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DFFAEB82C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72C55636BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D47D2D979F;
	Fri, 27 Jun 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbMBNwYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA8B2D12FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028699; cv=none; b=Pe1Ck8A1LUDvJ7pgpN3NDyTqZAixOcR5sH0AaT9qLoVfeOWjFlY1jizFfw5Zz5T/SQRANHbR4VyCivxVL9628rOc/7+AkCI6lHC4byC7EcpHNxKFCH1uL+ecJ7qKWLFXyJmfuzACLtoeurcsVcajoY6D0apmuWthnPG6hgoaFKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028699; c=relaxed/simple;
	bh=si5pkg3D7M7AemArS/xiRGGpBgK97TaRSQ8mXnLW03I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/xB8mxmxlcXednuEfRXWmSnWhTQ6yqs7KQFgSsHdzTxs7lj/HxXTYUdCYZo9yojZAdOgLZ97nrH2VHf+fsxS6dxDFCDoN81TKFt2O70tS6vNt+NtsMVrAs9b51Fm3Vu2b/4UVVHNSzJfEyqrRXy/SO1kBkqa8xoOOb7OmkFkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbMBNwYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBtHRi003247
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZrQ8AHkAD30tuUld9m43KAGRDqt8gThRB6o
	xUrxVwDo=; b=IbMBNwYCkXD5hjWt97lAhSiAVOC6h7oxNUV2kyldYK+XeLJ11DI
	hwqWLN13j41143FRF0SO817fOdVUt9pSIe7UkdkN9ldbhFw5JWJMXDJiItHDqgZx
	0kBBkcv4PNCVGBin7uvk5lk1NlXw+TxkqTuC2jUEDbXxuasvtH/wY6bUfTZEXTXp
	WxfmqAw6qIcQ+rY2+XG0cXbA925UEr4ROCJiJRFvsRrhZVCO86mfLz1MwvMwdPHJ
	CX+gwA3lY1yLPphga2ENcgDKTJsJ+B7KE6DhXO0nKR08nrrZp2/XrHehbtAKMVDE
	L/ToiV/xiULMEFu4QhcmYogoP2QYh76eHiA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgvgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:51:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2f103f6074so1426826a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028697; x=1751633497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrQ8AHkAD30tuUld9m43KAGRDqt8gThRB6oxUrxVwDo=;
        b=WzicA2DZnEH67LpOCdT/FzhYVE89stYsN5V+ByXk/RvGqlY8B7bA6PHB9iONVAnsoZ
         yUVZ7h0h8EvsC4DH/HAHMOUgm+7+/vdLF4s9Fzkd3Jxm6S407FHc1pLhNDm5yJqai9M7
         kHMRGcycHXayFaxkBlZH4t3idZLf2bTMCrpGhVXBzPnm6z+iE/vBzOjmlu/dfZTpN5IZ
         0yI8wEIr2b4+onGQ/cIbxsOK1k+qETmdNilscXLL23xrDl/eg2d+UOVjLrhbjdT1j0y4
         mANrexiolROSrnhIwff4qwzVl/FLPIvaqVXHzA85MbniHLF3Ab+GJgkCkQth2yybhVt+
         UTTA==
X-Gm-Message-State: AOJu0YykhsJ1usaxqDTy8WMbyNIeN7cfG9Xqx2uHPlcPoMQwQS6ndZTM
	CkcclxrmvOXPGcLxLfLVBquY3yKNqeCeo8nge2G6RoKZP7W84yKOzZNDL5WdY9R9nqvY0sIWAgz
	F9EQitQKCd6BUtHWC4Xru0ku+4x4T9zzrhVw5SSkwgm6n/KW2ociW3v5xzL4QVbPRuS3e
X-Gm-Gg: ASbGncumcjW9381+MTSYKWdX393mF/EFkxbLRNhdYN/PygjHXcTTcJCSuddOFDoxCP2
	UWQ7EwnwaYuLAQeXF4/UG4YWGETDXIB4FdihbmSnrk+HN9lRGs8NsJvGhkluuXL7KAAYbe6QmRr
	/6PIYobeFn/QROAH7s2P9wHfvuX30sm/WYc02poamwYAe+A8I8DXuyUM0hjVkCDMCf+wxIl9Tp2
	DWOhYJotLbEOSw1BtDesjkErvzy2BNnTZVS+vCe8g4AOBFM9VWn40V2wgsMlpYDXfQc7HJaREwf
	5tWdinw/PcYpfEnLlLxqIfT/9Qjz5V1bGEPxWEavKxtfQm4/1j0=
X-Received: by 2002:a05:6a20:4327:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-220a16b18d4mr4802829637.19.1751028695844;
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF26C8dtDNtXckzHuaNi47xMdSgfo4gkIZBa3WflpXjgfUX5aXrSLsxvdSTRWWbJGV3ZuUfmQ==
X-Received: by 2002:a05:6a20:4327:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-220a16b18d4mr4802762637.19.1751028695329;
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3200874sm1570337a12.69.2025.06.27.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:51:35 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Fri, 27 Jun 2025 18:21:31 +0530
Message-ID: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e93d9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RCjrDKQIKzBwdYVaOqUA:9 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNiBTYWx0ZWRfX/Z3fIuXocoWA
 m7kpoG2QWibr+Whfy5bn+hO9jk669LDQGndRpdLdvbPBcTiw3jIW7i/KZsMBJ6Z8oksE6eA/nEu
 53nXT+8W59X7q++U8cxs8W4F5zYr1XEL9xnJq2rQABdSHG9nGFd0u4F2WXcUeiuxS3xEjLp7vGH
 4PZUYUHkBQlYqoR6QS0PRprsezMdc8LU3lVPcYibHBwpYk7L+kTqJVU4Puip+QZCpqcs/hJ2lSI
 nwn5H0fO+/rfiI8exzaSWMJvA0pB8A7SqEkWI5V02UdAs8iXuhGKgBPXLY5EkVxqQ5UFsZi6KmJ
 GtGirnHL3T0Dikqm7MPHtIP8drQ9k8Hz90o0d6dAj1d9fzOO6OFeNC0RNm7f0o3c5bi6qjtDDlv
 JkGGniQ9ZJl10R07nqhFpH3ofv8LzgyZOMI8uWoChRU8pOY+2X2XVuUN6aZTOmoXzhvxJKI5
X-Proofpoint-GUID: syg6CLfj6wHtdIottM3cTCxu9VVyjpM2
X-Proofpoint-ORIG-GUID: syg6CLfj6wHtdIottM3cTCxu9VVyjpM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270106

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
Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..30c999c49eb0 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -16,6 +16,8 @@
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 
+#include <linux/firmware/qcom/qcom_scm.h>
+
 #define EUD_REG_INT1_EN_MASK	0x0024
 #define EUD_REG_INT_STATUS_1	0x0044
 #define EUD_REG_CTL_OUT_1	0x0074
@@ -34,7 +36,7 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
-	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -43,10 +45,14 @@ struct eud_chip {
 
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret)
+		return ret;
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
@@ -54,7 +60,7 @@ static int enable_eud(struct eud_chip *priv)
 static void disable_eud(struct eud_chip *priv)
 {
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+	qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +184,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +207,10 @@ static int eud_probe(struct platform_device *pdev)
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


