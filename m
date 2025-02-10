Return-Path: <linux-arm-msm+bounces-47367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C2A2E56E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11C69188A8BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4B61BD9FB;
	Mon, 10 Feb 2025 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLnkEjvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E294B1B425A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172638; cv=none; b=QLDAGnE8mpJogo70qa9Bxt5cOFdvtQgukXMloMpuRBVtOVi9HzPq0HnsrDQuWwhmgYRmCnZ/ykFf4CekocAsRSTS8adgoJy2Qj887zo9oz20Pglfu4xEBprqbgtpuK5JRyormCIP3PLNbYeoNcVIYxFR3vsal3ST1EtDQnscIRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172638; c=relaxed/simple;
	bh=aQRQ6+sri+2FjvUvhS/l1+zsbikTMl/4NyNhdlh4S5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGjUuoyYTw1KA8lUOmALOhuC869eJwdk1OtO8a/Ruk8A2iJoEwGOI+j9frrlzrHPX8hvFF5J7/pGIcHQh4PH0HuvXhrkqh+bO21KO3FuRrP6oCs3jUNdtFndmxFJrDeYuImGQw3MB3aWb6h26JZTtygKBIcP8XStkx3vAsetuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLnkEjvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519KTGUj032157
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRrOHyip7ZbNQ8lQZNrcx41SX8ZDA1DYAx7l+sPi8FQ=; b=QLnkEjvtShF4yQUQ
	59LbxklTXLrVeURi78b4YdSZtR0aRY+HWGSDr8ous2OcFH2KA4sBGtghCJF+obVQ
	fvwerthjtbQ7QG4Q+h+UiW1JQukHY9geConVce1YcPGreop1rMyx8v/4HnoBaK4J
	5r26vMorQDX5clIIlUcIQw31Q4HNz1PqicK82zid5CUCm3ZnfV4zW8SqY4ZHW3ST
	tcLRke4ZqPWvdgQadR/+DwEaI5UqayB3ndNbAEahLaLC1S+IT3bVrrOBr8QOsmXR
	RCO3S1sq0fFtXSMrgHsgHN9NML8u1wsB6UIXsU7twxrPzRMhcLbaR12kT/mdu17t
	CWUfzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esben6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso12694004a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 23:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172632; x=1739777432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRrOHyip7ZbNQ8lQZNrcx41SX8ZDA1DYAx7l+sPi8FQ=;
        b=xIr7/AHiJVslCZO5zHpLHkrv2GS3yLBAXTCkdW9p7LQ/QE1gSnloFl/NJ+V3PxBWlN
         BHIWJqA8TQ5HzrQR+H/MnXEfYhHK6pUlayABVfuHo8Vx5/fLoH671wfq2LRVVDZeDgsE
         aDsk6LcSA9p3jmINNAU4WsMBIMpEhILxgPuoFjJ0O9YNDRl7Nz+rcnHWUQ7AWV3mLk/b
         YlulFCWt/xO0LrrEeY7iA9/4tHEvH/4lb+/vXGSixOokto4QrfZeAVd+RP4yZ26KVnCA
         IckMAJS/Vps2TUbnF2IPJiD1xcQm0dB95ijinBvNc6hrnirnOwVfrgHZcdCxhOrad8Ro
         kHbw==
X-Gm-Message-State: AOJu0YwaUJDnLjUb+eR25IQCb2uRb6OuYu3J50z2RAkHnKBvP1Hrp72a
	eOcSFsh7lbxfe5rgJzwYzSSM3LVaFBlY/lX0IWwx1WtP2aL3vx4bGSt1oWMIYfEp4h/Ph0qWa8I
	ATU/ccPXoibFAfQ1EFSV2UXxFTqgvkgGk+br89ce6spK/HKWJkoT+wZOU8qdbwiKY
X-Gm-Gg: ASbGncsRY2Rx7D73keHqpnQDbVfZotZgv7+pCszReY5rHF1LAy2qBGx+k43xKhEpoc3
	I+kq5Kj4fKVRlHXhZrXKiPcabjF+ejkE3pehH0icb1cTA7/Cfy3Bc3EwaIAOPb7VbhqQYnmBu+x
	BLR1ibK2jdhJBPykyr4R0H4c3UgXXT3I4NOq9J525M+KngvlvL10wSsS6XnIYQJS8msV5XE4WWw
	q5+t4sxSzsDNO+rmp/VJMSlNJooDNWDFenupF5O6jUQWnEl479O9bCPaWzFkMQ+WaGtN44S8nKZ
	IEtrBkwXku/ZGyNZOIlR1rDiZPwuc4Qn0tmMK7mb
X-Received: by 2002:a17:90b:2ec5:b0:2fa:2252:f438 with SMTP id 98e67ed59e1d1-2fa2450cf33mr18714844a91.30.1739172632478;
        Sun, 09 Feb 2025 23:30:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC4mFsdhr14elczMdgif0tIJ9T32NQVRA86UAwGYhm7aRYQ7hdqOUHt+ZP3HEWgDqCFnMgDg==
X-Received: by 2002:a17:90b:2ec5:b0:2fa:2252:f438 with SMTP id 98e67ed59e1d1-2fa2450cf33mr18714812a91.30.1739172632097;
        Sun, 09 Feb 2025 23:30:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a6fe28sm7918507a91.26.2025.02.09.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:30:31 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 13:00:02 +0530
Subject: [PATCH v6 3/4] PCI: dwc: Improve handling of PCIe lane
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-preset_v6-v6-3-cbd837d0028d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739172612; l=3073;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=aQRQ6+sri+2FjvUvhS/l1+zsbikTMl/4NyNhdlh4S5Y=;
 b=VCnpoykv6zQRuJNMbEm6VdCa9AY6fq++JhPDYFwoMtavGyTSlIFAEqHNlne4oCwsJ2w9Dw0a0
 /v3Lv2XJzR1DAxjBZMQrUAUVCbu6ncBtGcIvRRjc/DYwqXY2GU1QVwy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: _vCPTBQKxujHYGgl-QcoVbraOhXoUj3T
X-Proofpoint-ORIG-GUID: _vCPTBQKxujHYGgl-QcoVbraOhXoUj3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100062

Currently even if the number of lanes hardware supports is equal to
the number lanes provided in the devicetree, the driver is trying to
configure again the maximum number of lanes which is not needed.

Update number of lanes only when it is not equal to hardware capability.

And also if the num-lanes property is not present in the devicetree
update the num_lanes with the maximum hardware supports.

Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
width the hardware supports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
 drivers/pci/controller/dwc/pcie-designware.c      | 11 ++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..dd56cc02f4ef 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -504,6 +504,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	dw_pcie_iatu_detect(pci);
 
+	if (pci->num_lanes < 1)
+		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
+
 	/*
 	 * Allocate the resource for MSG TLP before programming the iATU
 	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 145e7f579072..967c62cf3db0 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -737,12 +737,21 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 
 }
 
+int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
+{
+	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
+
+	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
+}
+
 static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
 {
+	int max_lanes = dw_pcie_link_get_max_link_width(pci);
 	u32 lnkcap, lwsc, plc;
 	u8 cap;
 
-	if (!num_lanes)
+	if (!num_lanes || max_lanes == num_lanes)
 		return;
 
 	/* Set the number of lanes */
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..61d1fb6b437b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -488,6 +488,7 @@ void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 int dw_pcie_link_up(struct dw_pcie *pci);
 void dw_pcie_upconfig_setup(struct dw_pcie *pci);
 int dw_pcie_wait_for_link(struct dw_pcie *pci);
+int dw_pcie_link_get_max_link_width(struct dw_pcie *pci);
 int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 			      const struct dw_pcie_ob_atu_cfg *atu);
 int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int type,

-- 
2.34.1


