Return-Path: <linux-arm-msm+bounces-50731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3063A580D5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 06:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B69987A4263
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 05:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843FD19259F;
	Sun,  9 Mar 2025 05:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJu5Or+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B815749F
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 05:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499204; cv=none; b=X0UmooPnTz9rSYExopAjop4u22V7pv5qRhTYQwBfnMdNNTIs0p/MJlhxNl/U//NI+LucSRALmEh8rdpdMqh/EU5Vw+9nZTJol6xmeuCe4+g41FlDI7B7kg1aDaa3QKP391YTF5xcSxKNp94lQ+uumXsUgfq0nN7j46n4YfGhrww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499204; c=relaxed/simple;
	bh=Bx1t0hfsGiAmrm8Fa7aaRx3xbxwLUMJF01etPMnFL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajGoOnLC3Y3oG5J3HwiEmDll2Lqo9K0VIMpYnyC0V/yGo+7R8QgxnTqTvwdwcp8vEUY/pCXVJv4PrMndgum/9g+pKn9Nn5TwAfWNwpfnnWmT7if4snqjPlD59YEzPBLC0ZrROvNSBOKYphHSRmpqp0asQ88Jot6tKeZKgvuH/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJu5Or+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5294ocBx030515
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Mar 2025 05:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ysw+/4cUgDm4Un26mav5TFbRZXEfDz+iSejLiz1ojR8=; b=BJu5Or+TdkDUYlrU
	u7rm7rJnYlt+hA9RDsAempitukSGLrJP6hcRxthvrzSnJZz6vsQ+1B3zBOr0lYIO
	uJpAIf8x2cxgw34B85nz+ZYeRyzbJr9sW7oJKbosznixYkC2uCJcD2jTqf5vC3tf
	3b42y0/bPJOSZaZepCM7ZiAhwowRRlewgA6wDLcr90NCX12Ch4x75BsXII+flAUD
	m0HaiKEwNufFH8D4+pMkr+sngSkd6YMkMPKNtehg4yXefijkSwzLHL2nW//VS83z
	GnQmjdN9Gg46uvQF7WnFnzJf+aU3xUL4nwMS+p5A2wdRpFlfLxtI3/LpTKNhzGNs
	a/l6gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyp9p6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 05:46:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22410b910b0so43042785ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 21:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741499200; x=1742104000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysw+/4cUgDm4Un26mav5TFbRZXEfDz+iSejLiz1ojR8=;
        b=snpim+YdKaWlwUcnToaw1M4nExxYX9Gg6Mx4m6nfE1EwhFojxRyVDCm0+Dx0nSmgL2
         VQROOz+j5O6h1BeH23ijec/UBL/NGlgvFHQrc7XktLOqeTgJpVPmiwFXycOIRJhD77GW
         RgkdmGiZXINF9cva6y2cbCzD/6X2lZeR8SUR1ooDssXTzyPvfP8gCnmS5FfEJNJExFBZ
         66NjofYXmImjZfWm19Yyk+Xw467LxXke96q8rpqPpibSpCatyhkkXKyfhNIffpjZjWMK
         u84r5Rx2xvKFBr0oXkKLD4THYKfnFNE9RrbLKaZ+RypQXjuwVADAzSdGsmiaXFfF4/3a
         7ukQ==
X-Gm-Message-State: AOJu0Yw9XCBMPEWtSMcNfNyHfnLFgKGRtCaTOmrHTf8bjJ4YXp/Vg5uX
	cwyWsvsDq5GP0y8uA8A6oM6c2PsMNxPJiGZokWtqJRCxXgJG4OP2xTjr6MLlokxbYUrWx9ixj3A
	aOAsQ/QBANCZj/H7AP40zpKM9KyEgLpu1c6jeYJymN+X7DMtMRWIPOvDWuZ+TWhIz
X-Gm-Gg: ASbGncvw1jNSqht4Z0+ci1RIvEiNCvOprS/D4W27XT9MjpYhpjrXbhyALH++4wS3LMg
	bUiJHaYMN8pUoInlBQe1+gW0VBARyY5CDqh6vtfZIiX60dJ7+MOrONNi2Ch2DSAlaxnCFhN13pM
	xmwO5otCKmgOgxSrpYhbKIA05kY2550ibMuYGNaU2DHljYBvNLqGxms2Eh1ZXicTTf2pHcgDjzz
	zZldG+nyoPve1RcIUzZ62vBVl6Oena1vcsL4agZAoAoPrSEXlm4OpD4qBwW9iinrMnJXaS+7zFI
	XsWu+MvXEfC16hY45yU/IGFr/KvOBQ0l1hHurX7Xy7xoVDug3dE=
X-Received: by 2002:a17:902:d488:b0:21f:45d:21fb with SMTP id d9443c01a7336-22428881ee4mr135683645ad.3.1741499200106;
        Sat, 08 Mar 2025 21:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnyZN5VF7RcK4zybJvdGFZyYz3lOgTxL2YII1Ju6xlSqSAKMx97LQuwVDQJlMHh/criQJoMQ==
X-Received: by 2002:a17:902:d488:b0:21f:45d:21fb with SMTP id d9443c01a7336-22428881ee4mr135683455ad.3.1741499199685;
        Sat, 08 Mar 2025 21:46:39 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddbe7sm54887145ad.32.2025.03.08.21.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 21:46:39 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 09 Mar 2025 11:15:28 +0530
Subject: [PATCH v5 6/7] PCI: dwc: Add ECAM support with iATU configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-ecam_v4-v5-6-8eff4b59790d@oss.qualcomm.com>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
In-Reply-To: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741499159; l=9239;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Bx1t0hfsGiAmrm8Fa7aaRx3xbxwLUMJF01etPMnFL30=;
 b=qWQ5Pex/vR+t1LH4r7N0A7IOcpK6WPN87zPPAVGK6r0BXePVxRVzuuRDFkmFlHUzLrgWJj/AD
 AtThaqwVgZQAfMgYb+JMAQ2TE18b2obmUhUZdhT3pEaUsGOIxZcFGt2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67cd2b41 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=d_4vt3V0DEEF9yyfqS0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: KpnbZErxNDBF2zcA9KVNhGeoOrxVghFd
X-Proofpoint-GUID: KpnbZErxNDBF2zcA9KVNhGeoOrxVghFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503090043

The current implementation requires iATU for every configuration
space access which increases latency & cpu utilization.

Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
would be matched against the Base and Limit addresses) of the incoming
CfgRd0/CfgWr0 down to bits[27:12]of the translated address.

Configuring iATU in config shift feature enables ECAM feature to access the
config space, which avoids iATU configuration for every config access.

Add "ctrl2" into struct dw_pcie_ob_atu_cfg  to enable config shift feature.

As DBI comes under config space, this avoids remapping of DBI space
separately. Instead, it uses the mapped config space address returned from
ECAM initialization. Change the order of dw_pcie_get_resources() execution
to achieve this.

Enable the ECAM feature if the config space size is equal to size required
to represent number of buses in the bus range property.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 134 +++++++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   5 +
 4 files changed, 124 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index b6d6778b0698..73c3aed6b60a 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -9,6 +9,7 @@ config PCIE_DW
 config PCIE_DW_HOST
 	bool
 	select PCIE_DW
+	select PCI_HOST_COMMON
 
 config PCIE_DW_EP
 	bool
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..4433ae3a0dfa 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -418,6 +418,81 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
 	}
 }
 
+static int dw_pcie_config_ecam_iatu(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct dw_pcie_ob_atu_cfg atu = {0};
+	resource_size_t bus_range_max;
+	struct resource_entry *bus;
+	int ret;
+
+	bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS);
+
+	/*
+	 * Root bus under the host bridge doesn't require any iATU configuration
+	 * as DBI region will be used to access root bus config space.
+	 * Immediate bus under Root Bus, needs type 0 iATU configuration and
+	 * remaining buses need type 1 iATU configuration.
+	 */
+	atu.index = 0;
+	atu.type = PCIE_ATU_TYPE_CFG0;
+	atu.cpu_addr = pp->cfg0_base + SZ_1M;
+	/* 1MiB is to cover 1 (bus) * 32 (devices) * 8 (functions) */
+	atu.size = SZ_1M;
+	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
+	ret = dw_pcie_prog_outbound_atu(pci, &atu);
+	if (ret)
+		return ret;
+
+	bus_range_max = resource_size(bus->res);
+
+	if (bus_range_max < 2)
+		return 0;
+
+	/* Configure remaining buses in type 1 iATU configuration */
+	atu.index = 1;
+	atu.type = PCIE_ATU_TYPE_CFG1;
+	atu.cpu_addr = pp->cfg0_base + SZ_2M;
+	atu.size = (SZ_1M * bus_range_max) - SZ_2M;
+	atu.ctrl2 = PCIE_ATU_CFG_SHIFT_MODE_ENABLE;
+
+	return dw_pcie_prog_outbound_atu(pci, &atu);
+}
+
+static int dw_pcie_create_ecam_window(struct dw_pcie_rp *pp, struct resource *res)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct device *dev = pci->dev;
+	struct resource_entry *bus;
+
+	bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS);
+	if (!bus)
+		return -ENODEV;
+
+	pp->cfg = pci_ecam_create(dev, res, bus->res, &pci_generic_ecam_ops);
+	if (IS_ERR(pp->cfg))
+		return PTR_ERR(pp->cfg);
+
+	pci->dbi_base = pp->cfg->win;
+	pci->dbi_phys_addr = res->start;
+
+	return 0;
+}
+
+static bool dw_pcie_ecam_supported(struct dw_pcie_rp *pp, struct resource *config_res)
+{
+	struct resource *bus_range;
+	u64 nr_buses;
+
+	bus_range = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS)->res;
+	if (!bus_range)
+		return false;
+
+	nr_buses = resource_size(config_res) >> PCIE_ECAM_BUS_SHIFT;
+
+	return !!(nr_buses >= resource_size(bus_range));
+}
+
 int dw_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -431,9 +506,11 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	raw_spin_lock_init(&pp->lock);
 
-	ret = dw_pcie_get_resources(pci);
-	if (ret)
-		return ret;
+	bridge = devm_pci_alloc_host_bridge(dev, 0);
+	if (!bridge)
+		return -ENOMEM;
+
+	pp->bridge = bridge;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
 	if (!res) {
@@ -444,15 +521,29 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	pp->cfg0_size = resource_size(res);
 	pp->cfg0_base = res->start;
 
-	pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(pp->va_cfg0_base))
-		return PTR_ERR(pp->va_cfg0_base);
+	pp->ecam_mode = dw_pcie_ecam_supported(pp, res);
+	if (pp->ecam_mode) {
+		ret = dw_pcie_create_ecam_window(pp, res);
+		if (ret)
+			return ret;
 
-	bridge = devm_pci_alloc_host_bridge(dev, 0);
-	if (!bridge)
-		return -ENOMEM;
+		bridge->ops = (struct pci_ops *)&pci_generic_ecam_ops.pci_ops;
+		pp->bridge->sysdata = pp->cfg;
+		pp->cfg->priv = pp;
+	} else {
+		pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
+		if (IS_ERR(pp->va_cfg0_base))
+			return PTR_ERR(pp->va_cfg0_base);
+
+		/* Set default bus ops */
+		bridge->ops = &dw_pcie_ops;
+		bridge->child_ops = &dw_child_pcie_ops;
+		bridge->sysdata = pp;
+	}
 
-	pp->bridge = bridge;
+	ret = dw_pcie_get_resources(pci);
+	if (ret)
+		return ret;
 
 	/* Get the I/O range from DT */
 	win = resource_list_first_type(&bridge->windows, IORESOURCE_IO);
@@ -462,14 +553,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 		pp->io_base = pci_pio_to_address(win->res->start);
 	}
 
-	/* Set default bus ops */
-	bridge->ops = &dw_pcie_ops;
-	bridge->child_ops = &dw_child_pcie_ops;
-
 	if (pp->ops->init) {
 		ret = pp->ops->init(pp);
 		if (ret)
-			return ret;
+			goto err_free_ecam;
 	}
 
 	if (pci_msi_enabled()) {
@@ -504,6 +591,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	dw_pcie_iatu_detect(pci);
 
+	if (pp->ecam_mode) {
+		ret = dw_pcie_config_ecam_iatu(pp);
+		if (ret) {
+			dev_err(dev, "Failed to configure iATU in ECAM mode\n");
+			goto err_free_msi;
+		}
+	}
+
 	/*
 	 * Allocate the resource for MSG TLP before programming the iATU
 	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
@@ -539,8 +634,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 		/* Ignore errors, the link may come up later */
 		dw_pcie_wait_for_link(pci);
 
-	bridge->sysdata = pp;
-
 	ret = pci_host_probe(bridge);
 	if (ret)
 		goto err_stop_link;
@@ -564,6 +657,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pp->ops->deinit)
 		pp->ops->deinit(pp);
 
+err_free_ecam:
+	if (pp->cfg)
+		pci_ecam_free(pp->cfg);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_init);
@@ -584,6 +681,9 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
 
 	if (pp->ops->deinit)
 		pp->ops->deinit(pp);
+
+	if (pp->cfg)
+		pci_ecam_free(pp->cfg);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 874fd31a6079..3dd9406edce4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -518,7 +518,7 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 		val = dw_pcie_enable_ecrc(val);
 	dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_REGION_CTRL1, val);
 
-	val = PCIE_ATU_ENABLE;
+	val = PCIE_ATU_ENABLE | atu->ctrl2;
 	if (atu->type == PCIE_ATU_TYPE_MSG) {
 		/* The data-less messages only for now */
 		val |= PCIE_ATU_INHIBIT_PAYLOAD | atu->code;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 3248318d3edd..6c95c36e3b0b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -20,6 +20,7 @@
 #include <linux/irq.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/reset.h>
 
 #include <linux/pci-epc.h>
@@ -171,6 +172,7 @@
 #define PCIE_ATU_REGION_CTRL2		0x004
 #define PCIE_ATU_ENABLE			BIT(31)
 #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
+#define PCIE_ATU_CFG_SHIFT_MODE_ENABLE	BIT(28)
 #define PCIE_ATU_INHIBIT_PAYLOAD	BIT(22)
 #define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
 #define PCIE_ATU_LOWER_BASE		0x008
@@ -343,6 +345,7 @@ struct dw_pcie_ob_atu_cfg {
 	u8 func_no;
 	u8 code;
 	u8 routing;
+	u32 ctrl2;
 	u64 cpu_addr;
 	u64 pci_addr;
 	u64 size;
@@ -381,6 +384,8 @@ struct dw_pcie_rp {
 	int			msg_atu_index;
 	struct resource		*msg_res;
 	bool			use_linkup_irq;
+	bool			ecam_mode;
+	struct pci_config_window *cfg;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1


