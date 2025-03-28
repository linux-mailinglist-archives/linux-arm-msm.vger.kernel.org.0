Return-Path: <linux-arm-msm+bounces-52749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F213A74851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21AAE1B604E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B80321C190;
	Fri, 28 Mar 2025 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+mcOQgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86121C9F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157764; cv=none; b=Yx4JTqVxLWDDoJSZIQkjEeROLWpmbxirIxwe94JrMh4PeobKGGt6fvGM56RT1ZuQQMz/iwWmh//u1avj07lURK0fClmD0hU5Jw5G7qw7Xh0x6wNWgwQ9RcRNeB5H8fUYZEx3K+KAP75UXyrLrX717hM2FMcZx2J0cD4m1RsX2cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157764; c=relaxed/simple;
	bh=sHJJJcuX61owR2kyjUesjcXVSkVy1yJD+aWD4is8QhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNjYha0+Rc3fHQ+SqaSTHpThfRNVDsjVq1wR2DUMMknZHJWoTdoIdAR3575UHkprYpCnkZhg0BQhUtenZhfrln5jooPe5uzkB0C+ycOXJi1bNFKeP+R2q/LE5oN80SdthjEvvus+2gPc7rOUuUkWl8kLgcuB2osl4DCc4M1O3E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+mcOQgd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S1UO6L017043
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76wnfktK4/WqcnPSiRccrWPBKZwX9OX9wOv5n8+c2Zk=; b=D+mcOQgdKQlRd3Uy
	gWvfXVkAUAf4/iq1V8VbbXoWSFpfS4GydVJR4Kvpcg5/regeFipbgVut6SHYeS7J
	Tj8ll71aczrDsB2nE/WaokfrftnsTkppdIqTCvpFvT2ADsEDIEusB8MYtZtUGogN
	408t+uAAW+ZCdb2gCvZClmb1I8dLPUg6W+ollQcck5vHout1y8KoaG2i7+rGydmK
	58/ywm7sC6vEbJ2Hqd2Oj0+Un/OI+CEvlttUU3lz4CS7r/ZRhuGjaMNjSpuH3Slj
	PdMwfYngPWdSihFJIxfkELAf8Gt+A5R/moBBXKsEBB7TQYcA345E4VHTRkWiJJuD
	e6Pdlg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nj5q9dru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so54683275ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 03:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157759; x=1743762559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76wnfktK4/WqcnPSiRccrWPBKZwX9OX9wOv5n8+c2Zk=;
        b=lzlOmhQJJbKZwTlNnDR9FDWQdl9u9VUFURNr6QdCHQqPq71Ju/RTZshSU1Ksmd4Ms1
         SYcxnW5+lzNi4uzoezgrbC3hqn+Wfhr6J6FG61X2mYYZZQCU6E39wVX4rTlHsrzZ2Crx
         RbItwqnPMG9dh7SoDkEEwxmTzV9f8H1QyPO1hSwiZ4os97Zec0HgodHtDNuB5/B+/9uv
         8b9m4x+Zl8ZeCA77eopk8DNR7kfX7ihalKR4nwmTsvJZSr39b3OLwp1ngFYbxysTQfCC
         exqDu5nHGnOIfY7SbfBIHnCCnLCSrejUKfw7F0wmuufsn0i+lOzYArY9N0d/zKhQzQm6
         q93A==
X-Gm-Message-State: AOJu0YxLDZnj+IiVaExP9KWanCMU2NGO/Y7I3gnVM9bFs+00QebDHBQG
	wUzm8VcrdFXIeAom9LwVgE15MvzbGnRf8h9yGXelPcNtAfq03kkvgr3szWegYSbDH+tEjPM/+bi
	zNX051feFVeXHVJdq3a0ivvKPJgFv7FrgiCplKqBNcBMYjK2tbW4kptC0BYw3oRb0
X-Gm-Gg: ASbGncuuxX4SULKDRVNred140G3ir+kgmUz79QzuipNHbzytd312FI8b3ZDzLOOD7il
	OhIf5tMjhEZD4eijXLyapDANuBRvxuWp8jsEO24SGXMbY+AcdvUUCqTj3MDaTXv8UNeO5FVPC9P
	JpcPXXbiYR7VIsZbVST6bTKbo43Gp8hfDXguLLtkyWBm+bTjprc8MGtOHNvw2Ag/FZ+9Au4Rf96
	sYTrRdYOTUSqb5gV5IBYWmmHhp5Hmgj9YTfGR2LjFhnhuhV928PeLkgw7oBp95sjV5UQupOdFge
	u1w5Fg+cj+92JdZty1owNqsgyhL4Xc2D2/XNYv4taB4DvdqbqGQ=
X-Received: by 2002:a17:902:f709:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-2280481cc49mr105959495ad.8.1743157756410;
        Fri, 28 Mar 2025 03:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXkA4w1mpUhoDFXTTo21wx0R4Ts3go+ZL4NmFZ2yuDManGOG7lOg7EVTJNBHvMCKqEBeqaQg==
X-Received: by 2002:a17:902:f709:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-2280481cc49mr105958905ad.8.1743157755896;
        Fri, 28 Mar 2025 03:29:15 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:29:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 15:58:32 +0530
Subject: [PATCH v9 4/5] PCI: Add lane equalization register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-preset_v6-v9-4-22cfa0490518@oss.qualcomm.com>
References: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
In-Reply-To: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=2046;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=sHJJJcuX61owR2kyjUesjcXVSkVy1yJD+aWD4is8QhY=;
 b=a9KRYry7jIrmqwsIS2XJJ3sGB8e+LtGwDrzvmnIfoUkWsS2MMxW0KQF0540d8pI13QVDyreqo
 mrRxGO35u41BBXt18lsZ9/RQI3K5I/ZR4IL+lB0eukonydk4IFeYCzk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: i9Jn7QeBN5wyV2hqAcrmH66-8sQFYITa
X-Proofpoint-ORIG-GUID: i9Jn7QeBN5wyV2hqAcrmH66-8sQFYITa
X-Authority-Analysis: v=2.4 cv=Gr9C+l1C c=1 sm=1 tr=0 ts=67e67a00 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=QpCTzhXZHEQm8rbsoTIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280071

As per PCIe spec 6.0.1, add PCIe lane equalization register offset for
data rates 8.0 GT/s, 32.0 GT/s and 64.0 GT/s.

Add macro for defining data rate 64.0 GT/s physical layer capability ID.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/uapi/linux/pci_regs.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 3445c4970e4d..0dcd9aba584d 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -749,7 +749,8 @@
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
 #define PCI_EXT_CAP_ID_PL_32GT  0x2A    /* Physical Layer 32.0 GT/s */
 #define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
+#define PCI_EXT_CAP_ID_PL_64GT	0x31	/* Physical Layer 64.0 GT/s */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_64GT
 
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
@@ -1140,12 +1141,21 @@
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
 
+/* Secondary PCIe Capability 8.0 GT/s */
+#define PCI_SECPCI_LE_CTRL	0x0c /* Lane Equalization Control Register */
+
 /* Physical Layer 16.0 GT/s */
 #define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
 #define  PCI_PL_16GT_LE_CTRL_DSP_TX_PRESET_MASK		0x0000000F
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
 
+/* Physical Layer 32.0 GT/s */
+#define PCI_PL_32GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
+
+/* Physical Layer 64.0 GT/s */
+#define PCI_PL_64GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
+
 /* Native PCIe Enclosure Management */
 #define PCI_NPEM_CAP     0x04 /* NPEM capability register */
 #define  PCI_NPEM_CAP_CAPABLE     0x00000001 /* NPEM Capable */

-- 
2.34.1


