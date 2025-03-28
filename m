Return-Path: <linux-arm-msm+bounces-52748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71BA74850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC1016BE88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D2821B9F2;
	Fri, 28 Mar 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qb6C+umn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC121B9DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157755; cv=none; b=MGKIhhpeiEQEb30IzC8mgQnv3GrjEO9812PODupI+XsyHieYHg9ojDKcK2ZlxygNTLQqSxkdnY/2nlvDliOlmvNIA6kTxlwLSpK95ZqLSVEgMwe0dGxs6/hYA2qjaasdZt9KIMAWC6HqZErlhXRlpgf0OvVqwpqHj6fyFfBZwu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157755; c=relaxed/simple;
	bh=+5NeY14GAaZjhf9/kf9i4kyV16jVK7K3/ekUtxFah+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGTKme8jFTUYPTlqzi5UzF0fVJXHQGppbeixcJ5nDVcevPSvylGzclQcR2g5fyoFW1j1qho30YQo7lQuydw0M+fZeHRCUWaW0Ao/CzqsfVqUXALOy3Z6pT8edzdcE3pOAQYKU4orYKt+wBC0rWfjCkiRDz/7YMpuMvnVASnu1fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qb6C+umn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S854u0011163
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80CEep44lPSG9HKI/yxAQvAq0iPYIRCTfFFMWIfFXLE=; b=Qb6C+umnPj908RUD
	yKF00GV5DZbu24/nhfNJniTVWCKeVdoOkmM/7S7GjTjlTX4orohhjf3yO9RKD7km
	W71mWQ4WyaLAAuh+t558M6+R7VTe2FPBNVpG4ZHykTMEUn1AY65iliZi94TdYI3o
	JHQGUmlQVOYxnTgtYxTm4huRQh+m2qdG8D6Z7GSOaRll2mWU4VmvX8S/H7noIMnC
	zqHTaqdXWAhDlA77Yl//L9FRO71waUbgB0p71lg+INg3MBqQPWA2r6YvTPmoI27W
	DjW9UZvlgpa8pqFijFegNqSyyC6E50Bpx1EvOHk0OUWcMWztDk2yeqcLJhJobPiW
	ja62PA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxugegu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225974c6272so32999255ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 03:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157752; x=1743762552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80CEep44lPSG9HKI/yxAQvAq0iPYIRCTfFFMWIfFXLE=;
        b=LlysoihTuxnQaoRKGYyIcbwMGUQg/AVSGlZaOfzQu4508tkW1IEHUNz4coAsglajiJ
         WsVUfSe1vhr1Uw+IurnF9pXU5udl6PmFrzJd9iX5RiuHUeqGc/bnlza7jO9/sCCBM7uA
         Wlm8yZPdeDyyk2Vow95ix2gt3NIV3/yWEQ5ZY6oAfq1H3NE1+MmdyWmNtw+pY+O9ULSD
         OjrKTvmsTCXV3WifE4fC9n2L8RXfsxjTXreDUW/v0PyV8KYo2UbC27DFL0wyLjkboFbh
         yqVg2uDSvoT6cJevHOaBRVyhVoVU3IsiJoHRmqaaPOr5loPRhTuav2b+xTu+OduBRCLs
         O/FA==
X-Gm-Message-State: AOJu0YwgUok17usISZJNoniLqmWwYayCFhsXr8X+qXESmjRGgpvAV9I4
	/7LtXT0cys0TWba66ryDsxvCGpu1xZmqiHC2tMujLmDMJjEYcW+iOiGeaJJJab1TpfkR73zzHqh
	1YF4Pp6lkBsKVfKJWE+XWTmosol6Pc7TJ3RuaGtqj4Q8pc7kmAHYi4t9p0vBaM8Fv
X-Gm-Gg: ASbGncuwNTqyPfjut3aGM464f6sGSH4Qj/Quu5v4uLO2lD6ZSf9BNugCCdOiB1CqpEe
	FQb/eWSsmsa78oSOwNQUeNAjzCXD7aRFeWvRw5esXnIskjvYtUTWb5oT1MVB/XqDAoZYzqDdZE9
	zETLjZPb2xBPbbSOI61sR3HaN2gAAp0sMbQ0k3LdqJWtRVilXcg9S78R1VP7/MgqSiUURiDNnY9
	pcWaWaa3TzoZrMEQ3ZufxUrhVbaNGFQJBDDKTPU+yIf6x5Kra0YWnq5m8augrt3A1hSZ6qmb3yo
	ry1V7wxniDcTXNHACVYqkfGKqBtdIx4vn8QhkIin92KisHD8d8I=
X-Received: by 2002:a17:903:320e:b0:215:742e:5cff with SMTP id d9443c01a7336-22921f58252mr38676495ad.16.1743157751890;
        Fri, 28 Mar 2025 03:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/9+OWQt2tzJ+8IkaPQziFxf8VoAuY+gpALQggWTQ7aiXeiyfL8ffb6i3XDE8ji42HpyiVLQ==
X-Received: by 2002:a17:903:320e:b0:215:742e:5cff with SMTP id d9443c01a7336-22921f58252mr38675985ad.16.1743157751329;
        Fri, 28 Mar 2025 03:29:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:29:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 15:58:31 +0530
Subject: [PATCH v9 3/5] PCI: dwc: Update pci->num_lanes to maximum
 supported link width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-preset_v6-v9-3-22cfa0490518@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=2730;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+5NeY14GAaZjhf9/kf9i4kyV16jVK7K3/ekUtxFah+Q=;
 b=8kWMZulfaiG7eGCAWonbcj+4X20zPIFgg/s0opVxPbR9CUT5jB2an9qsYZhXXiH5Qv34Zb0oN
 p0I6gxSpHwjBgP8nRD7eyV5KHao6nCe8hC2aStQ/HvoMZ1XCYvqBpui
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 58hQWFumdPGPCMo6vsBy_89ZLGJuDtJQ
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e679f8 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 58hQWFumdPGPCMo6vsBy_89ZLGJuDtJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280071

If the num-lanes property is not present in the devicetree update the
pci->num_lanes with the hardware supported maximum link width using
the newly introduced dw_pcie_link_get_max_link_width() API.

Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
width the hardware supports.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
 drivers/pci/controller/dwc/pcie-designware.c      | 8 ++++++++
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 3 files changed, 12 insertions(+)

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
index 145e7f579072..f39e6f5732a9 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -737,6 +737,14 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 
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
 	u32 lnkcap, lwsc, plc;
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


