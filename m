Return-Path: <linux-arm-msm+bounces-47368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E5A2E570
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5C101647D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5F91B6CFA;
	Mon, 10 Feb 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyrJ3WEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F01BE23E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172641; cv=none; b=lwONce5B7aljKlw4bSHx+Bb8lVFdVlyPDkTVm5I6bc8N5I+PZIilomMpBE4zskQMRLAuQ7atlQtDQe/PL0a5naRl2U/avugyhxxTcJzp8+Hle4uAaLctZrwUqY+tHQjJsjIOs/rjpk5psy4rGMjqW4Srn5jOSzxDZM4iO+zV/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172641; c=relaxed/simple;
	bh=CjcIoMuWyC0rjQWAhfahtHdPtxVNXgXdr00cki07ZIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLyJ8CQSOuYSQtBRxzDI2HZ7+M73yo1HehK2mV9LSdUit+Coj0YwR5ebNfbAj4Qh0BfoymbaoGCyzMGlXdCxMkN76ONkbhu8Pj+aJgHKPMwYH3P/BV6Tjq9U3DSuwop0zir+WBQV3Y6kPwtZPDraVAHphzAv7uNDTfeEP27mCKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyrJ3WEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519L20u8020492
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHhumTqGiC9SFx6j+TjMU9C+4s+ppWJX8DmHw2DIZew=; b=eyrJ3WEaYSjb0Qsy
	Az03gffoqBvKBtrPmMSam9OjivgMr/5zT5uV/YW91N/P//I7emzsj2554eZJLwA5
	X+JAgnYh2HQSn+n/8yYwCH9csyGQv8luvRCqLeIewoKBvvKkYE+jiG2TXKM0O6al
	tnu3vli7a6RciLvB8OBNtY+v7RzwUy2ndVUKe+dMga1bJphCY7BGhkZEgHlzV6qA
	h45WFmCsPCwrNS6TrVmFxIvIy5MtCGqjneL5nYo2s9XeBlf6hZOQovZW+eVyN/XC
	fwKDEcilYvFqs7u5RcuucLg9OfWWabEsMjyg1WRBWELcbFP6uLhfFzzGWYmr6Myq
	DKRKyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guudd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa228b4143so5962374a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 23:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172638; x=1739777438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHhumTqGiC9SFx6j+TjMU9C+4s+ppWJX8DmHw2DIZew=;
        b=vvl8uhA/byVCoHVd8PQVkoK1XelFLx1iTQJo58iec1vp/+LwcifvFNsDPxlqY0NmdE
         vu1Et3Euxu+rSBnq/Gx+Zi0+jlUTSJIJD3QmLolMYbYj40sBmWVEHl6/fofSIWHHV6tN
         guUWUqARQ8vhTtcs3bI6MXECxzVQQqhW6TQCcpiN+SiZo7WpwDAMjFz0yr6i51YDdDke
         Fw0XaIC25nep8+QB7tp+i3Y1cyDtyaN0sB1e0aVVU49IKs7vMYUozDZIvMu9LDFfc2Wi
         xSCexYKG+7YgO1u1EyPwslGGPOWS/NkpL7qAn1Ei7i8bC0WtbhmSTb/Jm2ZCgNHIrHgY
         7O4A==
X-Gm-Message-State: AOJu0YxaaagCI1ECrlESk77Muy7K1T4jnrf5Lu9wwbexe4u+1SHBFnae
	y3TL80DWFRRnnDcFc0DEs24wnMXdglbUEPKUD2cX+EbKt1PefYvm8LPbSn/f12VKbmH90zFHjlO
	UBzdCOuyuBgAUltXGplT5vFAFs6X/f6fHgtFlTg1uC418PWh6eYQVu6yeh3mc+FkN
X-Gm-Gg: ASbGncuGtcO+RtRCI1TNaGbFy2whYNaf7R6HdMV2lRdeAdE1goWDYaCXbAHKFrSFS8i
	Ds5E1XcAia4GsFztoPi7y7UD+VeZnNo3Uj3YSZ6Q1pkbTNFGg3Ht6tkQtq9Y8P59MD0TRl0OShS
	IlgA+eWfB+ja6dlJ33aIcGSeFJPN/Qqf0e10cgmz6jdHj0uaGoRcB0XFxSt3fACp/CCdzbDCi5Y
	1rz1bnDEQ9KPue+F/7MvkBIPQja4HI6Mw6xpfMx5OdflHmjx2Y/zdPl3IENh8fne0L6xN+qGF4R
	XSDF7OwhMWviLAifkrKDANv2icwSPrunv/Iuaseu
X-Received: by 2002:a17:90a:d44d:b0:2ee:8253:9a9f with SMTP id 98e67ed59e1d1-2f9ffb38478mr27370637a91.11.1739172637480;
        Sun, 09 Feb 2025 23:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBoMPJCr9G0sVDjZr31KH5I4trCwBw8lTPD73GBYRG0dc62HbkoqDzG06kQVfThE+IO0v0Zg==
X-Received: by 2002:a17:90a:d44d:b0:2ee:8253:9a9f with SMTP id 98e67ed59e1d1-2f9ffb38478mr27370599a91.11.1739172637066;
        Sun, 09 Feb 2025 23:30:37 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a6fe28sm7918507a91.26.2025.02.09.23.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:30:36 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 13:00:03 +0530
Subject: [PATCH v6 4/4] PCI: dwc: Add support for configuring lane
 equalization presets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-preset_v6-v6-4-cbd837d0028d@oss.qualcomm.com>
References: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
In-Reply-To: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739172612; l=4696;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CjcIoMuWyC0rjQWAhfahtHdPtxVNXgXdr00cki07ZIg=;
 b=KVgBviQ7UiRSel1hjYer6GXaCC7nOQtup6xnnSKAfaMXd9KBuTWru2Ckp73BEOBzb3SfFHDgX
 ypw1tnP+2usDf3EeTh7g5GH5VSe5gP77S4tvvyToIsNTX4xbA0E717l
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: BPYfGq-CydqozG05deps9jceKr8d5Lfr
X-Proofpoint-GUID: BPYfGq-CydqozG05deps9jceKr8d5Lfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100061

PCIe equalization presets are predefined settings used to optimize
signal integrity by compensating for signal loss and distortion in
high-speed data transmission.

Based upon the number of lanes and the data rate supported, write
the preset data read from the device tree in to the lane equalization
control registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 53 +++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
 include/uapi/linux/pci_regs.h                     |  3 ++
 3 files changed, 59 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index dd56cc02f4ef..7d5f16f77e2f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pci->num_lanes < 1)
 		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
 
+	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
+	if (ret)
+		goto err_free_msi;
+
 	/*
 	 * Allocate the resource for MSG TLP before programming the iATU
 	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
@@ -808,6 +812,54 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u8 lane_eq_offset, lane_reg_size, cap_id;
+	u8 *presets;
+	u32 cap;
+	int i;
+
+	if (speed == PCIE_SPEED_8_0GT) {
+		presets = (u8 *)pp->presets.eq_presets_8gts;
+		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
+		cap_id = PCI_EXT_CAP_ID_SECPCI;
+		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
+		lane_reg_size = 0x2;
+	} else if (speed == PCIE_SPEED_16_0GT) {
+		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS];
+		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
+		cap_id = PCI_EXT_CAP_ID_PL_16GT;
+		lane_reg_size = 0x1;
+	}
+
+	if (presets[0] == PCI_EQ_RESV)
+		return;
+
+	cap = dw_pcie_find_ext_capability(pci, cap_id);
+	if (!cap)
+		return;
+
+	/*
+	 * Write preset values to the registers byte-by-byte for the given
+	 * number of lanes and register size.
+	 */
+	for (i = 0; i < pci->num_lanes * lane_reg_size; i++)
+		dw_pcie_writeb_dbi(pci, cap + lane_eq_offset + i, presets[i]);
+}
+
+static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
+
+	if (speed >= PCIE_SPEED_8_0GT)
+		dw_pcie_program_presets(pp, PCIE_SPEED_8_0GT);
+
+	if (speed >= PCIE_SPEED_16_0GT)
+		dw_pcie_program_presets(pp, PCIE_SPEED_16_0GT);
+}
+
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -861,6 +913,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
 
+	dw_pcie_config_presets(pp);
 	/*
 	 * If the platform provides its own child bus config accesses, it means
 	 * the platform uses its own address translation component rather than
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 61d1fb6b437b..30ae8d3f4282 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -25,6 +25,8 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+#include "../../pci.h"
+
 /* DWC PCIe IP-core versions (native support since v4.70a) */
 #define DW_PCIE_VER_365A		0x3336352a
 #define DW_PCIE_VER_460A		0x3436302a
@@ -381,6 +383,7 @@ struct dw_pcie_rp {
 	int			msg_atu_index;
 	struct resource		*msg_res;
 	bool			use_linkup_irq;
+	struct pci_eq_presets	presets;
 };
 
 struct dw_pcie_ep_ops {
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 3445c4970e4d..2cd20170adb4 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -1140,6 +1140,9 @@
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
 
+/* Secondary PCIe Capability 8.0 GT/s */
+#define PCI_SECPCI_LE_CTRL	0x0c /* Lane Equalization Control Register */
+
 /* Physical Layer 16.0 GT/s */
 #define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
 #define  PCI_PL_16GT_LE_CTRL_DSP_TX_PRESET_MASK		0x0000000F

-- 
2.34.1


