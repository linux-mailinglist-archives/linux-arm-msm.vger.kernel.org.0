Return-Path: <linux-arm-msm+bounces-60860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AEAD4170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C57127AD56D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C31224502C;
	Tue, 10 Jun 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6fpe9tP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C8245027
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578367; cv=none; b=Z+NOiUHwRkH6HzOGLj6tZxmyNwFKf5XuQMK9POfBI016YmRm/SXonn2bmlkwGbICjqP+7D6z5HAdMzc6e5bzgmQADF+jKi6HsAN/8ROCBRzLumlxRQTm7OLiJsuG0lwYO4NUg2C0wlasl2cvSyrEJDY2iVHuGf56dAoiVTX5pIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578367; c=relaxed/simple;
	bh=TIAGKcCrZfVUPf4F95easUAWjOaFfMdNdJi9stDBnYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j5Wp91OipsH2UbJcLN3eNHZOVqV8gJEyXXbq88j6NtOD5Haaf7cWyeMmZeu/FPCt99A1PT52/wSc9bF3rcpAFoAQ2uJ2s+NrNMppwPFuuG6wLbsNoGqq8QXI99kaA41vRHeEHyKzJ5GXdadQABD5UiKdH8RMBF6g79dBwY5Wpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6fpe9tP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AG3t8M005056
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HdRdwAi5R4mg7+CZqegw72RDGkaSuNv85KQ
	OZooFeP4=; b=c6fpe9tP3IIguRdAG2VVxcPkbKJpU+JY3P3BblW8vTpTlaUzDo5
	BDMIjMMxKnDHzXaJA1Fx63K1/w1k77Bh3JkZ+2Hv/WWUrYJAeCWT2jZF3wQlyXtR
	t9WRrgCYJf0AVEF4x+Y69MVpyswiKl3ATvzFgWJdT89slIHwc+Zep1tKQQmCp2D0
	rxQg0r3erau4WfUZlLIPXrqYxomoEXBxvoW97kMZqAQKGirGNTudk6RFkFo3kV6p
	nQMfAXfBMz9ZLrJ35Syg21Lg83dKc6u+9IKSQ6LL7A69pBThpK212stct4Lmc2zs
	UvR4HfClcKOCkbthzidww/EZ9qUxLTyHdNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcja0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:59:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234fedd3e51so51518235ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 10:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749578364; x=1750183164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdRdwAi5R4mg7+CZqegw72RDGkaSuNv85KQOZooFeP4=;
        b=ug7nCwi0wmseNWXqsu4f3qn5/876ZW/hqiS9WUd9Rg5iR8nKMcpCcaAMW8yK51lU8w
         5zkznx5LZKbV4dCVZt4OBeidhDVqOLH9lc9rP5LXimLTvfz6oKWxTVaKXywBSz4E+OeR
         PzjJkNWu+4WpMJbn2p5pnt3VTu3DunTU1vYPswKsTnljSUa54rFR58Nuu39yydbMqe0b
         UBI+YyG6pov1edE/QX8vTEOSe/BjL00WRbQRZ6T7ogtQscNdre0O7qweAtktF2szFCFV
         kl/4RItDnnCkujVg8EOKd55Nt5f4WyuckhnTVl9N7nI77ze9W7P5W/GpVV51X82ATfBf
         HJkQ==
X-Gm-Message-State: AOJu0YzOi1rnSnN2Z+FSAw3NGHNtPi4pBLNoexoSfRSrGcocsHGM7O05
	SDLuYNCvNALVv8+dY3MfgL93VzQQTfnh9IiujufB4oHBVGfGUBt3LXuJcnaQFHvJAhyPBBG/A0m
	bVJ3uKWb7slZJ5aUDBdBWdWDBcsSK28+I2QEA3/mPXrsMwhZpLYQcNONQ74oahtqaeYPl
X-Gm-Gg: ASbGncv+5F3rHEAVQfRZIXAbHmH5GE1oISF/knru3ISX/ynbkE1AsHypq6sDU1GCFEC
	rvI27ujL1G0J7mfL05ZRRK6dWzsXCDk5TzIhU4Qth9cbt8zU9LekeQH+UGNd+qBZN33/PcjgYaB
	DBX68RrYkKqEWE94rEjuQHyUWYMz/6LUkAQjyfqLaA61mmEPDYHf4VY5BMzHowV2V3YGlj6Y5Zq
	Z4aPjwNOljmgpAYjzWSavVas70h5g/DBtxcGEcgG/M/fe4zMWGHh+fnZhRnpju2HgRByWbmKv6c
	51nyBapxUfhRNdf9HLmkJj5tluY2Nm6l3kP7V9cWiI8+oWgNDNDjhXMEjIhgG3BNvnW7on8=
X-Received: by 2002:a17:903:8c7:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-23641a9e732mr2753355ad.13.1749578363605;
        Tue, 10 Jun 2025 10:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/R/oyCTjIMyBrFffehV01N2xGnaQ7ZprY81iHDm8RPqdVN33MzJSoYmS6cZGq8g2YH9MZrg==
X-Received: by 2002:a17:903:8c7:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-23641a9e732mr2753055ad.13.1749578363199;
        Tue, 10 Jun 2025 10:59:23 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059cbsm73798635ad.165.2025.06.10.10.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:59:22 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
        jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] accel/qaic: Use dev_printk() in RAS
Date: Tue, 10 Jun 2025 11:59:12 -0600
Message-Id: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0NiBTYWx0ZWRfX9/Gd/2HRFqdM
 7sooIol64L5fGwl80SbcG06M1uZ+imxjpPrzIglhSaPjc4FCCXCHyuUxQ7soKJDoOo6Adudb7mp
 ppbXbPKyi7ewijKgRkbcS1etxPMoCHqXNxVKZOACjbXVbeO2e8xVLMFr85A2vybnPDhyRcnIBUR
 hkAzQKQw+Sh1HSkArs4iWWNGMaNr5xHuQOfvvkglDDFZkWPobLj32jMWloyv+eSSyhm2y90mHyR
 txg9X6IJPm2IMKz7vE45Hd0CEyVDV+b8iBu7qYMB/tw8/TNDc4mwajSRnySSoa1Scb3NNbHXdAu
 qpZTo5qZQMQ0o3JdXE/geNSZ64i2cX22oX++KuCsXp70sHnbJh2FviKYthJ1aBnR0+fTkLL2kBG
 eQLpCLRAcGrJ04zp6R4Xo+Bxe2cZnYz3GqhDgsp0DT3cpeIR67c4Bu4Jsb9f6L/1+vbd6udz
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6848727c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=EUspDBNiAAAA:8
 a=HoyUafP1cdkc2dKxyUcA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: FJpSeGQLT5lK2i-L08TjIIaVsGvWQQnl
X-Proofpoint-ORIG-GUID: FJpSeGQLT5lK2i-L08TjIIaVsGvWQQnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100146

pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pci_printk()")
so change to using dev_printk().

Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org.au/
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_ras.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index 39c6f9cf98cc..914ffc4a9970 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -322,7 +322,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 
 	switch (msg->source) {
 	case SOC_MEM:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -338,7 +338,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   soc_syndrome->error_address[7]);
 		break;
 	case PCIE:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -348,7 +348,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 		switch (msg->err_type) {
 		case CE:
 			/*
-			 * Modeled after AER prints. This continues the pci_printk() from a few
+			 * Modeled after AER prints. This continues the dev_printk() from a few
 			 * lines up. We reduce duplication of code, but also avoid re-printing the
 			 * PCI device info so that the end result looks uniform to the log user.
 			 */
@@ -381,7 +381,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 		}
 		break;
 	case DDR:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    Instance %d\n    Count %d\n    Data 31_0 0x%x 0x%x\n    Data 63_32 0x%x 0x%x\n    Data 95_64 0x%x 0x%x\n    Data 127_96 0x%x 0x%x\n    Parity bits 0x%x\n    Address msb 0x%x\n    Address lsb 0x%x\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    Instance %d\n    Count %d\n    Data 31_0 0x%x 0x%x\n    Data 63_32 0x%x 0x%x\n    Data 95_64 0x%x 0x%x\n    Data 127_96 0x%x 0x%x\n    Parity bits 0x%x\n    Address msb 0x%x\n    Address lsb 0x%x\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -402,7 +402,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   ddr_syndrome->addr_lsb);
 		break;
 	case SYS_BUS1:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    %s\n    err_type %d\n    address0 0x%x\n    address1 0x%x\n    address2 0x%x\n    address3 0x%x\n    address4 0x%x\n    address5 0x%x\n    address6 0x%x\n    address7 0x%x\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    %s\n    err_type %d\n    address0 0x%x\n    address1 0x%x\n    address2 0x%x\n    address3 0x%x\n    address4 0x%x\n    address5 0x%x\n    address6 0x%x\n    address7 0x%x\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -421,7 +421,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   sysbus1_syndrome->addr[7]);
 		break;
 	case SYS_BUS2:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    valid %d\n    word error %d\n    non-secure %d\n    opc %d\n    error code %d\n    transaction type %d\n    address space %d\n    operation type %d\n    len %d\n    redirect %d\n    path %d\n    ext_id %d\n    lsb2 %d\n    msb2 %d\n    lsb3 %d\n    msb3 %d\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    valid %d\n    word error %d\n    non-secure %d\n    opc %d\n    error code %d\n    transaction type %d\n    address space %d\n    operation type %d\n    len %d\n    redirect %d\n    path %d\n    ext_id %d\n    lsb2 %d\n    msb2 %d\n    lsb3 %d\n    msb3 %d\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -446,7 +446,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   sysbus2_syndrome->msb3);
 		break;
 	case NSP_MEM:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    NSP ID %d\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    NSP ID %d\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -476,7 +476,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 		else
 			class = "Warning";
 
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    %s threshold\n    %d deg C\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    %s threshold\n    %d deg C\n",
 			   class,
 			   err_type_str[msg->err_type],
 			   "error from",
-- 
2.34.1


