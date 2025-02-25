Return-Path: <linux-arm-msm+bounces-49280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 571DCA43E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0AEB16FEE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC625268696;
	Tue, 25 Feb 2025 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYGlIrkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7692673B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483953; cv=none; b=pFLgTOBwVe9vzhIm1E1QD0ckmWTD7AqLKOiDREFJPdlBu9WmP2M2Bq+y++byJwMj7ROTWvMhx3RhpaSJmouXO25FtRZmLb4eL6KMnGKFYxRcZ1P3Byf6Hz5OGqjcaKVTnnfAji0NDzFJWDNl8cb+toGqQMm4nXq6lGMkyTQK5Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483953; c=relaxed/simple;
	bh=WMbOp27utSDkHhEXVAa3MHd/brdszfrzIwpx9Festsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvGG0ldKR6BW/13tkYNf6rucrXAT6jFww1NnG3vSHviuwu6607tADV8+kdOTcnZ5pYcySawJXdPwoTMpJZtoc/neGPogRZdS/mU8QgtYUvflMmeUWiNtxPOUC83SK/59DAglhdd9iEgAq9ks6xkO5tPOqNjcxZOehAGm/A53X6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYGlIrkM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8opiX017279
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFJWUCVZ6M2euvvcGUy752g9X1XZh3x6N7aMIvdjCOI=; b=bYGlIrkM6DiBBT0A
	kw29ytY0s9lpbWIKIjw4e64X9ayT8h0Iqa9fbajvrLVys+uVpctbACYrQzw6vLFw
	LCu0OmjrY3Znz7UvbeQ1BsZmEdEhTNOPUkUIGMIQ0yQmW4pMpv4zDYnkuVEsha3F
	SSRz3rnrvUJ7GSynDzKDtF/JfqdgQpGIc2OMMUDfB0EqIqwXXO++XXolnsyc6brv
	3BcJ3IIFVV8LZB2urlJkzqEfSZchlAcgInBhaaYY7oXl3+BbQNoBzDdgsJnIlVH8
	HmuYwG802O1kFFofNytxwgzvryX6g7c8Y3e2cUkytsxHynmtwB1c9GNP1xakM5+c
	rrGR8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k68ucx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220c86b3ef3so136578325ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483948; x=1741088748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFJWUCVZ6M2euvvcGUy752g9X1XZh3x6N7aMIvdjCOI=;
        b=Qjmn2BBdL4XklrM9iWZ0AnfThYYR31AjSrRSCm3oARDD9KSha3GOA1F6TEc0xcDYKb
         NOaaAvz4a0lOIWzSf1rPsZTYNq7ZIzHRjWsuwQuR2XyW9akd8YlzuvNYhJsBxY4D7JWJ
         DCB6C1NMlRJYK9fPmaYV3i+K1aib1rpCWI1ekNggqBqOa3P2kpVEyYepYwU6eALfPCY1
         hvh4OtV+RHNR6JKmYuOd4Rc29ztxJK0P+H9hLsmRMP/9Dgq1/WHJdC+Gc8n8eJDuhviu
         oNnIs0ggixxz+t0D1qZM69ET7jbWlJJwBx2NPadvFcabFgi+N2cvn7mrAdXD+hY650R6
         Yg4Q==
X-Gm-Message-State: AOJu0Yy6/TQnPtleHlE+ENXlMF2meJMJyEzqEKHNXNhcrH020BsD343L
	6h5plLRsUu5nBI30GxEXJGdkOPqpIMt23LcO5lJ3FBf5KKFG53mNpp+8kUVKp7XWKHsECYYHXWx
	LIOt2m2CQ970dgbOli8xbWUcWNhzlshttlfVcdKcOmVz4AfRnXwktQp2anTHK+i+N
X-Gm-Gg: ASbGncvvWZsk38iGUIysX/EDOmyHzPkXbeboSShFqxuHlT7B6vRZ+ix4Z2vVOzsA+PB
	18hThVsL064xUAy9qMc49+myO7StYiy+QM2XGvWQv7vLa6JxpfZO7oyDJAIq1tKeT6wA3MRjdPn
	EpqyKu5B0bterh37qLEGsxVkh0VoT+SXglX7BQ2oU4IxhfxTeexHM2m+HlFE316gYcurJOU2eXn
	N6CG2cQbd2rj98P1KsQkHEVXR+tHegjcJTzGxE+jS6zGZ8SrM39qc3O/o3o0yt30Wg/i8jJ5//w
	lYzQwTDsKGTfVyIE7VJ/EXL5+1FyFyOPu7lI04sumWOhFdLm8mY=
X-Received: by 2002:a05:6a00:8a17:b0:732:6a48:22f6 with SMTP id d2e1a72fcca58-7341410bb54mr27637508b3a.9.1740483948550;
        Tue, 25 Feb 2025 03:45:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLEK0CZlrCWZb3Xuj6wszq4+kfT30Don9arlTNNmJDccEr1jdH+78HFestoRn7PlNMxSiSVg==
X-Received: by 2002:a05:6a00:8a17:b0:732:6a48:22f6 with SMTP id d2e1a72fcca58-7341410bb54mr27637467b3a.9.1740483948142;
        Tue, 25 Feb 2025 03:45:48 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9bb1sm1331790b3a.92.2025.02.25.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:45:47 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 17:15:05 +0530
Subject: [PATCH v7 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-preset_v6-v7-2-a593f3ef3951@oss.qualcomm.com>
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
In-Reply-To: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740483933; l=4572;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WMbOp27utSDkHhEXVAa3MHd/brdszfrzIwpx9Festsw=;
 b=dvX/auMBkpEgcGMORcBFgKOMtMkGSfVdVDfd6RF5iHlRcUBHnUXDQewFhufkMjDqeQhHJRWNB
 jOnND8g2ITtD1TzdG8zKakZMSC8tLm649lBS+5oJDId0yqYbdZJVByp
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: QQNlgbDAtH0HZfQcxYjorzLwZGMab7wG
X-Proofpoint-GUID: QQNlgbDAtH0HZfQcxYjorzLwZGMab7wG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250082

PCIe equalization presets are predefined settings used to optimize
signal integrity by compensating for signal loss and distortion in
high-speed data transmission.

As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
configure lane equalization presets for each lane to enhance the PCIe
link reliability. Each preset value represents a different combination
of pre-shoot and de-emphasis values. For each data rate, different
registers are defined: for 8.0 GT/s, registers are defined in section
7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
an extra receiver preset hint, requiring 16 bits per lane, while the
remaining data rates use 8 bits per lane.

Based on the number of lanes and the supported data rate, this function
reads the device tree property and stores in the presets structure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c  | 43 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h | 27 ++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 7a806f5c0d20..9ebe7d0e4e0c 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -851,3 +851,46 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
 	return slot_power_limit_mw;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
+
+/**
+ * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
+ *
+ * @dev: Device containing the properties.
+ * @presets: Pointer to store the parsed data.
+ * @num_lanes: Maximum number of lanes supported.
+ *
+ * If the property is present read and store the data in the preset structure
+ * else assign default value 0xff to indicate property is not present.
+ *
+ * Return: 0 if the property is not available or successfully parsed; errno otherwise.
+ */
+int of_pci_get_equalization_presets(struct device *dev,
+				    struct pci_eq_presets *presets,
+				    int num_lanes)
+{
+	char name[20];
+	int ret;
+
+	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
+	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+					 presets->eq_presets_8gts, num_lanes);
+	if (ret && ret != -EINVAL) {
+		dev_err(dev, "Error reading eq-presets-8gts :%d\n", ret);
+		return ret;
+	}
+
+	for (int i = 0; i < EQ_PRESET_TYPE_MAX; i++) {
+		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
+		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
+		ret = of_property_read_u8_array(dev->of_node, name,
+						presets->eq_presets_Ngts[i],
+						num_lanes);
+		if (ret && ret != -EINVAL) {
+			dev_err(dev, "Error reading %s :%d\n", name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 01e51db8d285..c8d44b21ef03 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -9,6 +9,8 @@ struct pcie_tlp_log;
 /* Number of possible devfns: 0.0 to 1f.7 inclusive */
 #define MAX_NR_DEVFNS 256
 
+#define MAX_NR_LANES 16
+
 #define PCI_FIND_CAP_TTL	48
 
 #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
@@ -808,6 +810,20 @@ static inline u64 pci_rebar_size_to_bytes(int size)
 
 struct device_node;
 
+#define PCI_EQ_RESV	0xff
+
+enum equalization_preset_type {
+	EQ_PRESET_TYPE_16GTS,
+	EQ_PRESET_TYPE_32GTS,
+	EQ_PRESET_TYPE_64GTS,
+	EQ_PRESET_TYPE_MAX
+};
+
+struct pci_eq_presets {
+	u16 eq_presets_8gts[MAX_NR_LANES];
+	u8 eq_presets_Ngts[EQ_PRESET_TYPE_MAX][MAX_NR_LANES];
+};
+
 #ifdef CONFIG_OF
 int of_get_pci_domain_nr(struct device_node *node);
 int of_pci_get_max_link_speed(struct device_node *node);
@@ -822,7 +838,9 @@ void pci_release_bus_of_node(struct pci_bus *bus);
 
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
-
+int of_pci_get_equalization_presets(struct device *dev,
+				    struct pci_eq_presets *presets,
+				    int num_lanes);
 #else
 static inline int
 of_get_pci_domain_nr(struct device_node *node)
@@ -867,6 +885,13 @@ static inline bool of_pci_supply_present(struct device_node *np)
 {
 	return false;
 }
+
+static inline int of_pci_get_equalization_presets(struct device *dev,
+						  struct pci_eq_presets *presets,
+						  int num_lanes)
+{
+	return 0;
+}
 #endif /* CONFIG_OF */
 
 struct of_changeset;

-- 
2.34.1


