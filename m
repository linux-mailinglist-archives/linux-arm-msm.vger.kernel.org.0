Return-Path: <linux-arm-msm+bounces-48147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C990EA37B93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 07:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7DE188F82C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 06:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6727D190055;
	Mon, 17 Feb 2025 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtIxSIql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFE1AA791
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774100; cv=none; b=LrdoJhuiy0YKR4m2hghohcxbL1Mqnjk3ETHBhFz4W7HJYtVrGVqCNH6fiIPa44HAU3CMAhLnWwuDTkbro6lbr9lh87ZX12Sny90SW4Toy/tXZY/x4wrxKEp3SuVg1NKCjvJBoDiUEELQ24gg8+70WPVx1yN9B8XV/iXjIwwydeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774100; c=relaxed/simple;
	bh=MDH1EAT3iFlnei9rPbQ3oLiWKzuPU08kTSTKS0pttwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YslimnxueL8N6q8nowDX1sA29zqcQr8iGk5Wo/Sb3lC//Y02ZPZ5HVkn7eHzJDkDQgYP6gkC59BH1d8K+d568ajJXHQCPXkhSAE4uRdcY551Zjic2GpGNg2rTF7/e4xtob81gs1X3mvFdnkHuu3b7LWroPX41mfanhzNd3dhUs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtIxSIql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H0388H025454
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnkNnMCfFUxeM0wOwRWOrbx64pi1NXcdn9eltQQvhxg=; b=jtIxSIql9rVQy5UV
	UqMLQus7m7W/13yb2LGlfhPBRgGxbyimevQB/YbsDdSYEJmETeK0ieL3Hola4gAk
	hpcMVSlFheMTd4sxcI1663zQ3BxqSfzVtEK8ILbo7PY476x101F2HanakgI3DBK4
	OIbFmSYHHj4YSrUtpeuTIQUVvmjAP8j+DEm3kzPIbqN+pBsen2FExy2BSAhl6eKZ
	AqCIDIruWSi8z+9rvTgp09tkM9kqJ95x1cA0KVdaEbDV901TtwWfmxBj7BMfuwZW
	mUAyr3RtBl/Qi6e47T4Ryc5ByfqdGD8rMsIbfUfFcatn/HUu66fj8KEV5zOB4uuT
	P5fLTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vrppy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc4dc34291so2507552a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 22:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774096; x=1740378896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnkNnMCfFUxeM0wOwRWOrbx64pi1NXcdn9eltQQvhxg=;
        b=tv6S8BydFsbKcWTAMVnK3rTmRNIWL1ZTaR3BLmUMnM2rLV/nDs9DG8l3tqqXlxUnVS
         kDyAloFH/7gmzU1l/6y15Ht2c2cdnwEDSUIuOxTJdKfoK4SktDyzmxqXH40H9oY9s7xQ
         Rt5c8wkEZ/yIAP4TtKTRab2iIAyCWvYFE6GnWOKBEDlUFP+gXtj2Zn/T5/KgcjY606hj
         9tg7HKGB3PC9kRuh8R1n4iMQhuX7XwMei2AMY3faV7eLr7DUEGOAdjEuiT6SsyENz5Kn
         ibADQbfURo52GjAZGe3D3UkI6+iC7qMUGhGj6hLwBHKU3xL7msYlyHbhnp6IoF3SIHES
         SxQA==
X-Forwarded-Encrypted: i=1; AJvYcCWc7n6idfQqSjXc7AzyO27KZVFZH65RW204Bay3T6e173OXhSRkKuYWwwxW+cISSj49JUa0I68w+PNGUvRM@vger.kernel.org
X-Gm-Message-State: AOJu0YxqWp9E4SM5CSxMIIQPGwwE/hbwcQKqbQBwjcXb0Dn6hAI0sP1n
	nG2gwBiEEsFSoEFTRRw/q+sIG08kHh654wDlLR8QjLQVUIoXMwoAdbAhDm+IuSnJ7YLu5OR8Y+z
	wQOWe/edZp7DZmDEyNeGcYOWWqnkew7XFA1OaC1npmjpuB8zIPhQcN89FygFPGxan
X-Gm-Gg: ASbGncvGdAC1SsbuSoraWT7dIb0nbLKBxN8xFsoR8kVmYq4J4ICBVBRkKRLLFAUWFmH
	vBg/JgWZvlHRURQfDtbkh31yoYirm3ahPUTnCsEoMf2wUQM93FdZQqN2kQ4/d53ked6XcwaX7ef
	to3GoebaXnOv3zzhzSk+J/4+K2+97y8k+a8KV9aRhbyS523MACz1GzQMdmkb5238PqchgCSfkyp
	sc/EmTst+ZloPJ6EfPDDEIwXCamEJatfTKVvw2jx/pSUTBmys2mMSSj5CwkWJaxAR3L9djaLoNV
	d7Z1rw31Xr8kDnFrm6FATN36Jdtq9G3gFxeDuSUw
X-Received: by 2002:aa7:8f99:0:b0:732:6231:f2a3 with SMTP id d2e1a72fcca58-7326231f591mr10834875b3a.3.1739774096138;
        Sun, 16 Feb 2025 22:34:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lYcW5hPdY6ZjNE6LJPu12IuQ+vFgWgZldyLyVtQtpguJsqNYOC4jj1hFpi5FOLfE6r8WdA==
X-Received: by 2002:aa7:8f99:0:b0:732:6231:f2a3 with SMTP id d2e1a72fcca58-7326231f591mr10834848b3a.3.1739774095765;
        Sun, 16 Feb 2025 22:34:55 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:55 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:14 +0530
Subject: [PATCH 7/8] PCI: Make pcie_link_speed variable public & export
 pci_set_target_speed()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-7-9bad1e42bdb1@oss.qualcomm.com>
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
In-Reply-To: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=1633;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MDH1EAT3iFlnei9rPbQ3oLiWKzuPU08kTSTKS0pttwE=;
 b=snYvwe6fz5/0tGaNyLSFO6GDeBFP6NvfzVDDK2eS6qx1l1MqJLBNCE6ieF3cDDsCtYItw70rc
 DiK+FnwplEVCc+mmzxuokhAenPJKdpKx0tYfSSyXHuaTWeeuVDz/U1y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: AVNkdwWZVMcvADGwI_mllpUBO_C7y5cK
X-Proofpoint-ORIG-GUID: AVNkdwWZVMcvADGwI_mllpUBO_C7y5cK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=928
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170056

It can be used by the PCIe client drivers and reduce the code duplication.
And export pci_set_target_speed() so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.h         | 1 -
 drivers/pci/pcie/bwctrl.c | 1 +
 include/linux/pci.h       | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 01e51db8d285..ada9a0433a99 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -82,7 +82,6 @@ struct pcie_tlp_log;
 #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
 #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
 
-extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
 bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index e3faa4d1f935..dc01c93bcc37 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 58f1de626c37..8a3b3195122d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -305,6 +305,7 @@ enum pci_bus_speed {
 
 enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
 enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
+extern const unsigned char pcie_link_speed[];
 
 struct pci_vpd {
 	struct mutex	lock;

-- 
2.34.1


