Return-Path: <linux-arm-msm+bounces-54091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EDCA86A3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 03:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E34734A2526
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C45A189520;
	Sat, 12 Apr 2025 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3zymVUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC3D149C6F
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422676; cv=none; b=YEN+iE2PckGIbTTGWJHvca9thSIDtdSNt7NnBu/E3yQsFGQuisG1nQEDOS7ChMUXburmwQfc1zDopRnz/fDL4mdrLxp/EiCSj9wroh4ofvvDcpycYLDhZo+CRPD0i3cCLdaYv7QUdHhInUT3Z5hgOOP6QKzPUHZRo7CpUBlTar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422676; c=relaxed/simple;
	bh=bIEBVjy9Ps3Bs5Az3H0qcu88DFS+DOGxuF1ReT7QAPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsodrhgpBgsA1bbRb+9sT+IzcCCVAaaW7GkbevNZWIvrosfq2TzXUQuDUCIz/9w9Rhu9ud+R8bbWdozztjuNa7KHTITuZs3lR00ubEPu6tstvU0QhkVXlByy7aoDT8CoXHW4rLSB0xXNdHUioea8DN2upxwH3zGnducKTJnTCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3zymVUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C1pDED008467
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qFeUaRiZMw95gdUKeUk+yYq0GTBUKJA4HO3FTl0Ch3s=; b=j3zymVUJIibc+7Ng
	oaEPWaizfvfgRtv+5PhyZ9mWsEHnzZh09WOXkfNntVA7VwYk2Kim7/t26Bz555wm
	X1JD6L3cHy00xIK+PWL5/2TmTjtEuYEA4RpP36xmSukbkO0ziUcy6b0pE1H9EoZg
	YjPZPPUxfJWk8kcp1ibpc69o4PP+vyvM4kmDMEgVTqbItt+Lcgy0hG5TixOom5Xk
	4en1LR+uBExgOTjo8jWc9TQZh5fUmjTMW6SJd5PeAVSVLpmbEbSzeZSpIBUedk58
	DAib7ep03Y2+IsLfybGMS8dhpk5EmTmqWQsDYJoiG23sRztbabKyny5nRwrP8cay
	XUmm2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrv6sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:51:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739515de999so2257556b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 18:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422654; x=1745027454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFeUaRiZMw95gdUKeUk+yYq0GTBUKJA4HO3FTl0Ch3s=;
        b=p1eekl2ZovmDTXNkuQPeFBvj/NBez7h5n2KYUeuvXTagh27b7xdzT8Jktqses8VDxJ
         BkZEvZ/wscu6ueZ/KF5VeEvpl7Okrtk/ZtYz1aUpat7f4lKI1LFO3zyOID8mZSzr1qlL
         +IBUxoFC6MSEEfbQ+z8tbv/yyV0NY+Vxa53hX1/8dS3Tp7ETd+RDlJ2P0Wl02/XIeRo7
         TvczJcrhNZ9SkeQQ70y8SViBWLIYuJ9xB/tqYjjrSLwzSdQLjS8mIM+8RRvu1/+qSnG2
         ZDtukmNUzH0RoYIAPMhbLPBMlg4vLj72oaR9SHjpcv+EJG0WEVtqssVoD5PErYNbWPHm
         q4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoAn73JafsahAQLCBiXINmJRyVXaWMfoYBFW3BImf0LB0Oj6e5nR/o3K/KR78h4XxI7x1W1Jk8rOhJAwbA@vger.kernel.org
X-Gm-Message-State: AOJu0YzMDH6BcJnx6F6APkRZ7CKgQF7EyE5GY9AZr1wbz/4lTK+jdchc
	CcOq/O3pmIfjKr022ELX84l1IOZ5NQrtvAbGtQXJfPtDM5qWI9j/y2ywh5ID2IgNkqiDP0V89xn
	ven+91YsOXyR1gOnnhDid/1qUS7whJOMfeeQyEWrjVBXap7HGPdg5sziveCkCPQqQ
X-Gm-Gg: ASbGncvwCYeh4Gg1jBIKAyz9gRAmJ6RHV9azNe1aPuqC46RBDAhqZUAdYFu0wBjwTbf
	P+1T5FqEXyulDZCceOQ/g6i2oxKRwAdk+ATc/ScjcaPi1ssFU3EYTxjdtRd2FFVNJa8myXlmwMV
	gLahbvFUXUugwfLleDVgDvK5BnuT8Kzf3owreS6XpA1cxQ9ID4m0DX073SQzYmEcSDnSkSrGtHW
	37gxtRfeH8WDcGfVTe0prhy7doUuYAXeBdyfHA/ksR7xt0D7f47t412Znc8laxYmvEAjQKpsBdr
	a+yNBhE/nx3dHe+SUFVxFFhg2u6EiyENTEt0XnT4oq27+gk=
X-Received: by 2002:a05:6a00:1388:b0:739:56c2:b661 with SMTP id d2e1a72fcca58-73bd1203098mr6999397b3a.12.1744422654121;
        Fri, 11 Apr 2025 18:50:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEviRTBK5DZGcJJTgPEl0lFpmQZ5SGJAey7iNqvYjght/SAinY2nKvN4JeaBM1l1ukmlkmjLw==
X-Received: by 2002:a05:6a00:1388:b0:739:56c2:b661 with SMTP id d2e1a72fcca58-73bd1203098mr6999358b3a.12.1744422653631;
        Fri, 11 Apr 2025 18:50:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:56 +0530
Subject: [PATCH v5 7/9] PCI: PCI: Add pcie_link_is_active() to determine if
 the PCIe link is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-7-5b6a06132fec@oss.qualcomm.com>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
In-Reply-To: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=7044;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bIEBVjy9Ps3Bs5Az3H0qcu88DFS+DOGxuF1ReT7QAPs=;
 b=qk2+PMsvx0JqWyt3SQiJcR2gbCvgKSF3VLo3erR5A3PKGX2bLKLsk1stMxJXgO5ndWUtiPxoN
 8NUE9KJpkoMCVGClilvZ4wob1PbEtVuzJpmSpsMNvJ7ckPfkwzDiNHD
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: hxg-51ZmE4C3IwGNE7_J1jDXvWyByJsB
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f9c711 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=DLE-xEQoUa54y48t:21 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=c8k0nbeVto6RhVnl1UYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: hxg-51ZmE4C3IwGNE7_J1jDXvWyByJsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120012

Introduce a common API to check if the PCIe link is active, replacing
duplicate code in multiple locations.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/hotplug/pciehp.h      |  1 -
 drivers/pci/hotplug/pciehp_ctrl.c |  7 ++++---
 drivers/pci/hotplug/pciehp_hpc.c  | 33 +++------------------------------
 drivers/pci/pci.c                 | 26 +++++++++++++++++++++++---
 include/linux/pci.h               |  4 ++++
 5 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp.h b/drivers/pci/hotplug/pciehp.h
index 273dd8c66f4eff8b62ab065cebf97db3c343977d..acef728530e36d6ea4d7db3afe97ed31b85be064 100644
--- a/drivers/pci/hotplug/pciehp.h
+++ b/drivers/pci/hotplug/pciehp.h
@@ -186,7 +186,6 @@ int pciehp_query_power_fault(struct controller *ctrl);
 int pciehp_card_present(struct controller *ctrl);
 int pciehp_card_present_or_link_active(struct controller *ctrl);
 int pciehp_check_link_status(struct controller *ctrl);
-int pciehp_check_link_active(struct controller *ctrl);
 void pciehp_release_ctrl(struct controller *ctrl);
 
 int pciehp_sysfs_enable_slot(struct hotplug_slot *hotplug_slot);
diff --git a/drivers/pci/hotplug/pciehp_ctrl.c b/drivers/pci/hotplug/pciehp_ctrl.c
index d603a7aa74838c748f6ac2d22ffb8b8cfe64e469..36468a9c31d669ec916e867ecfb7a8220cfab157 100644
--- a/drivers/pci/hotplug/pciehp_ctrl.c
+++ b/drivers/pci/hotplug/pciehp_ctrl.c
@@ -230,7 +230,8 @@ void pciehp_handle_disable_request(struct controller *ctrl)
 
 void pciehp_handle_presence_or_link_change(struct controller *ctrl, u32 events)
 {
-	int present, link_active;
+	bool link_active;
+	int present;
 
 	/*
 	 * If the slot is on and presence or link has changed, turn it off.
@@ -260,8 +261,8 @@ void pciehp_handle_presence_or_link_change(struct controller *ctrl, u32 events)
 	/* Turn the slot on if it's occupied or link is up */
 	mutex_lock(&ctrl->state_lock);
 	present = pciehp_card_present(ctrl);
-	link_active = pciehp_check_link_active(ctrl);
-	if (present <= 0 && link_active <= 0) {
+	link_active = pcie_link_is_active(ctrl->pcie->port);
+	if (present <= 0 && !link_active) {
 		if (ctrl->state == BLINKINGON_STATE) {
 			ctrl->state = OFF_STATE;
 			cancel_delayed_work(&ctrl->button_work);
diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 8a09fb6083e27669a12f1a3bb2a550369d471d16..278bc21d531dd20a38e06e5d33f5ccd18131c2c3 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -221,33 +221,6 @@ static void pcie_write_cmd_nowait(struct controller *ctrl, u16 cmd, u16 mask)
 	pcie_do_write_cmd(ctrl, cmd, mask, false);
 }
 
-/**
- * pciehp_check_link_active() - Is the link active
- * @ctrl: PCIe hotplug controller
- *
- * Check whether the downstream link is currently active. Note it is
- * possible that the card is removed immediately after this so the
- * caller may need to take it into account.
- *
- * If the hotplug controller itself is not available anymore returns
- * %-ENODEV.
- */
-int pciehp_check_link_active(struct controller *ctrl)
-{
-	struct pci_dev *pdev = ctrl_dev(ctrl);
-	u16 lnk_status;
-	int ret;
-
-	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
-	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
-		return -ENODEV;
-
-	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
-	ctrl_dbg(ctrl, "%s: lnk_status = %x\n", __func__, lnk_status);
-
-	return ret;
-}
-
 static bool pci_bus_check_dev(struct pci_bus *bus, int devfn)
 {
 	u32 l;
@@ -467,7 +440,7 @@ int pciehp_card_present_or_link_active(struct controller *ctrl)
 	if (ret)
 		return ret;
 
-	return pciehp_check_link_active(ctrl);
+	return pcie_link_is_active(ctrl_dev(ctrl));
 }
 
 int pciehp_query_power_fault(struct controller *ctrl)
@@ -584,7 +557,7 @@ static void pciehp_ignore_dpc_link_change(struct controller *ctrl,
 	 * Synthesize it to ensure that it is acted on.
 	 */
 	down_read_nested(&ctrl->reset_lock, ctrl->depth);
-	if (!pciehp_check_link_active(ctrl))
+	if (!pcie_link_is_active(ctrl_dev(ctrl)))
 		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
 	up_read(&ctrl->reset_lock);
 }
@@ -884,7 +857,7 @@ int pciehp_slot_reset(struct pcie_device *dev)
 	pcie_capability_write_word(dev->port, PCI_EXP_SLTSTA,
 				   PCI_EXP_SLTSTA_DLLSC);
 
-	if (!pciehp_check_link_active(ctrl))
+	if (!pcie_link_is_active(ctrl_dev(ctrl)))
 		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
 
 	return 0;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..d14cd6843a020f2cec3e4cc36522526cf1faf0ba 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4926,7 +4926,6 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		return 0;
 
 	if (pcie_get_speed_cap(dev) <= PCIE_SPEED_5_0GT) {
-		u16 status;
 
 		pci_dbg(dev, "waiting %d ms for downstream link\n", delay);
 		msleep(delay);
@@ -4942,8 +4941,7 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		if (!dev->link_active_reporting)
 			return -ENOTTY;
 
-		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
-		if (!(status & PCI_EXP_LNKSTA_DLLLA))
+		if (!pcie_link_is_active(dev))
 			return -ENOTTY;
 
 		return pci_dev_wait(child, reset_type,
@@ -6251,6 +6249,28 @@ void pcie_print_link_status(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pcie_print_link_status);
 
+/**
+ * pcie_link_is_active() - Checks if the link is active or not
+ * @pdev: PCI device to query
+ *
+ * Check whether the link is active or not.
+ *
+ * Return: true if link is active.
+ */
+bool pcie_link_is_active(struct pci_dev *pdev)
+{
+	u16 lnk_status;
+	int ret;
+
+	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
+		return false;
+
+	pci_dbg(pdev, "lnk_status = %x\n", lnk_status);
+	return !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
+}
+EXPORT_SYMBOL(pcie_link_is_active);
+
 /**
  * pci_select_bars - Make BAR mask from the type of resource
  * @dev: the PCI device for which BAR mask is made
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 09cda518350c8ea86bf1c6bd64ed8d67e774c8df..2c34302dc5bb73aa2f9e3bd02c12684d8b6856d9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1945,6 +1945,7 @@ pci_release_mem_regions(struct pci_dev *pdev)
 			    pci_select_bars(pdev, IORESOURCE_MEM));
 }
 
+bool pcie_link_is_active(struct pci_dev *dev);
 #else /* CONFIG_PCI is not enabled */
 
 static inline void pci_set_flags(int flags) { }
@@ -2093,6 +2094,9 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 {
 	return -ENOSPC;
 }
+
+static inline bool pcie_link_is_active(struct pci_dev *dev)
+{ return false; }
 #endif /* CONFIG_PCI */
 
 /* Include architecture-dependent settings and functions */

-- 
2.34.1


