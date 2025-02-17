Return-Path: <linux-arm-msm+bounces-48143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F93A37B7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 07:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76A473A8196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 06:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF9E1A3155;
	Mon, 17 Feb 2025 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpgZ3EW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FC919F424
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774077; cv=none; b=aM/WjMCw/lV/BfisEslycIOBwsJXMw6+w1+0ZCVgjUmPFkJ52gDCza1jOCbNCXGiIg4v2COMKFmzFZquYrsKgFq0ympJQ6FbBMClggPPU2lG7SsW2FPqcwGXJwXapOIZ678UDWY61NGEJteguYekIgmTlX0WBGnzb21PO1hNU6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774077; c=relaxed/simple;
	bh=PmKuDjh7TYnL36BsL4uFK3e2cvQCdB+O1CmCQrAD7C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnhG95Bm1cu67WQ5NWd+GUc6Xr8QHDKPqfn3YmQPuHzNriFej7yIeqtWb5NMPdzZvaQtVeRZM8BPO+t/qRqD0GVtMoevrWCtegBBwh9F1XNcM4ozZBnz25Rlfpo9Fgtk8OzZxgWfwwgCbbIzzo1NLXxhwf4UpVEyM+yW40qr9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpgZ3EW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H02vKK026666
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=; b=lpgZ3EW0mpxwv0E+
	gOQua5pAEUvV8uXKt1DFU5yZi9T70izQxPhRTgxYwuaykNzHK7K+x9p+kp6RGPG6
	vGAH78mWGghvsA37SywtIrcO9orkbPba3eY/r+lkUeOI3bt4ha+6lewAp5FoT9+w
	mIg8ZK3Xoz+3cKR58j8ELCl81IHXBbC6tnbi9TV8rle4eUdH6R4gkwzAfcKWKV4R
	hX96s/lVoNo/uAGaeH4QzeTAU3UpqlEr9RuHuamen/XcSwNrVXmLgqhmoBxgKjQf
	wVY8Zfr3X/HamYup4fC/pDhTYeiPOE+mxhoVoTxjJY4vIiqCFXru98FFpwaD96iu
	v0pr/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sgq5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc0bc05bb5so8335144a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 22:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774074; x=1740378874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=;
        b=pmCdQKNG8R5YVNrP/uT1+ytw3Y7WtqRaoPeV8vAhThehUr/UaHxhufmUCdhUexUOVE
         UoCQirKlMcQ2UWeOqZ+piBfy+0b5ZImFYG/lxxHLEUB05BI/rQJ8iCJhFKTihHcxy/vB
         /v/IpzXzlH92X0nFgPOW266K/XhIgEe2BK9PvIWMOJE0Y5tyP1RTFXvuryf5lzB7nEZS
         DKX4Qms3cAP1hxJSD5KrbNaBMsXOIMoslqyX/rAiNPIISTXkAxMr78FlZ2mR0bG8BrYj
         7Gygk880Sx8Xb2hJ010iggFzHa89ghaxmU8HNMqXxtjOTa7IaVaxxmmdT52zpaOJj/ES
         fSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0dznFCUHbYXHYaijx8T/F88V1+NOBA/DJwprxOrIJLI9B13ZbpgFlEENW95YIbkht9wT7R+duMC5LWv92@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2m2ZmYyKzMNcy3fKbROz+M4MusYDVvoKzCFh2wgYvH2NGr6PP
	poWON/7Xfe8BnteaL17fEesTGd/UUpKRuspQZ+b8BPLtNXmOPslroU3iVuAnA5aj+LiLnVS4BoA
	xZwVdOTsJ5u8ntZzcKoFx3Hm9HrJRcs64NUKKuSojAH5r9APcvVZGkDWYMQaA3IuG
X-Gm-Gg: ASbGncvHNKbOL036dHf0fMmuGb7RhdZQtRoSF0he+MJfgeHOWQvLwoUIdAdr4OIQ/ZT
	lt02CagjiCc0xi5d9mOHHqS9NSlOQ+j9RLP999kUbRvLKxuw+vSBF/Z0Eu/zB4IIyzJ9QMHzejR
	z8zdiQ6VgkJO2Hrh5QiITpmXAMwnKlb7GwLaDV1I2DNes3ccSxXhz6JJ2LWuHLesW0VoLVA8c5c
	rsXXwzOQwtlex+BbCLvjJ6fB5tEgPc6V+d0PhtVWmowSAPyjeWsHmlg+w2yTaqQAbgi91W1GA5p
	tbILwSQTpIoMKBxZDm49k2ycupWKm/SzpABDsgp4
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr14974764b3a.16.1739774073581;
        Sun, 16 Feb 2025 22:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHafDTAFp1GvU3CHv9ZBptsIxiiNWeH9I/2oU2Kp5bCj1qR25DKxmHgRfZiANV5piuH5zfVkA==
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr14974721b3a.16.1739774073159;
        Sun, 16 Feb 2025 22:34:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:10 +0530
Subject: [PATCH 3/8] PCI: dwc: Implement .pre_scale_bus_bw() &
 .post_scale_bus_bw hook
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-3-9bad1e42bdb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=2235;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PmKuDjh7TYnL36BsL4uFK3e2cvQCdB+O1CmCQrAD7C4=;
 b=klwj+7NCfeWvDoVYvXPeVg69yujP2GAfYPvAEuiF+KnPezPhilQ8VrheQA2mmkJNa+z/rwiGr
 7Ap/JoRXXsNBio5kxhs4s02TShlZdF+K/JhEklaBhvKYW0tWNirUE6I
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YdKXcEzhnGJ_60DXqClQkl3CfA0FKxuU
X-Proofpoint-ORIG-GUID: YdKXcEzhnGJ_60DXqClQkl3CfA0FKxuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056

Add support for pre_scale_bus_bw() & post_scale_bus_bw() function op's.
Add support for DWC glue drivers to register for these ops.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..4da4df62c3f8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -697,10 +697,31 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_pre_scale_bus_bw(struct pci_bus *bus, int target_speed)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	int ret = 0;
+
+	if (pp->ops->pre_scale_bus_bw)
+		ret = pp->ops->pre_scale_bus_bw(pp, target_speed);
+
+	return ret;
+}
+
+static void dw_pcie_post_scale_bus_bw(struct pci_bus *bus, int current_speed)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+
+	if (pp->ops->pre_scale_bus_bw)
+		pp->ops->post_scale_bus_bw(pp, current_speed);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.pre_scale_bus_bw = dw_pcie_pre_scale_bus_bw,
+	.post_scale_bus_bw = dw_pcie_post_scale_bus_bw,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..16e02646a8b4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -354,6 +354,8 @@ struct dw_pcie_host_ops {
 	void (*post_init)(struct dw_pcie_rp *pp);
 	int (*msi_init)(struct dw_pcie_rp *pp);
 	void (*pme_turn_off)(struct dw_pcie_rp *pp);
+	int (*pre_scale_bus_bw)(struct dw_pcie_rp *pp, int target_speed);
+	void (*post_scale_bus_bw)(struct dw_pcie_rp *pp, int current_speed);
 };
 
 struct dw_pcie_rp {

-- 
2.34.1


