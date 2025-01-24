Return-Path: <linux-arm-msm+bounces-46082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C045DA1B4AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF2616C0DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343F621B918;
	Fri, 24 Jan 2025 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkZbhuBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28221B8FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717796; cv=none; b=Lgos6JkIG0lKweLxaWNuApxJAQS74y+p8XAOKE15ad9enu5O798+tfzoNVO1+VgX1g5Eii/mhT9iQceNyt/BnLiphBn04iE31AO5Zc4E3UyfsGM2uc2ej5Q9dQgl+SOoKWOS5Y8J8S4UelPVPFCPnldrRfmjtidN3lC9meKq5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717796; c=relaxed/simple;
	bh=f7z3CtNmxsHSKM03nohqE7aPIUwkTTXaD4CtcTYvgDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JH3c3s+Xf9XncJmU9P2Vlm9BHBBmha9xHNhAsBRyktk+oBhk4ePFzQfDz93aFi7w2uKGIa4fkgoVRCKTPJttBqXl0S0Rx3PeAD75kfwJ/X40aHQPK2LEDEik+ZomzboCRXfmTd2a9yfIxYqQFl6/sgyGGpzX14HOn6VwWhzrh/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkZbhuBd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8bpKM031428
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPZTHj57MEyCMgMIvbxGmIatD2m1gGCN5WI13Bi7xRU=; b=kkZbhuBdHl1uAuGJ
	HBFUN73RL2SeQ2BP7OmraJE1AqijhtepG7nv+ExmAFRGZat08YNjwrP14rl7YmtU
	Ihq0L45meBLwIjzKFyg8PLtsHKfpMN1wzjtbJb9U9RiixlSzGKfnzhMaYxXFF9wv
	SuREmW9tKRklReA9raAGhXmUtJzipF0L9zQLoxUVQ9mde5ozXy5q0+Lh58oz6O7P
	0zlr1zjIHcXnjfTOhTsQ29UCvl5cjMwFcfBfPFCk2ClcqKVbb5Ut5ZNYhMeliVhS
	FttmKtjxUxzYHwKtjbsKQxqohm/xkZ8iHLCzxNDpzDhgHo80rG5Z6c2xoYhYR2i3
	TMBDew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c7h50gnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:23:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21661949f23so57752755ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717793; x=1738322593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPZTHj57MEyCMgMIvbxGmIatD2m1gGCN5WI13Bi7xRU=;
        b=BnJ7ifCt899Ez/rUGZZL2T9hpfGuizkZqtOuHJfwcm52UAFrwbg6SkeL5Rs06CHc72
         7DaZB1sLMhiZIRl1bnqYpetFhTjoLEifnLaWf+9I9SR2G9YIXAZSDUKkm+6pmUaTlnkW
         2nBlWZVgbxLzIc4EQ5DtTDWt7mN6tomDMkWn21Z1Sx7q+aWMUvT1zs2dgGCBvvKJSQNb
         mBcjRqwMuci6IHOCQTLvkfWdaj9cfG5eRc+knfgk4arA2h5dMsfg4oXz+zxK+mA7KQBa
         CRsAtUhsJWlFKBAy3hidQp6gXUss7slsYJz31rorr8slxTtCs8h2XBpVK7uqvSjKdpe7
         er6w==
X-Gm-Message-State: AOJu0YyijNYyIqN7Aoq0F76KkRTbpqwhJyIOvWEG936iPlnWJ+ACCi/w
	PqZaB7lsJxmYe7bufGdwioYLPEAzNz4SAAncvID2uyFJk/LnOyH8iHhd1/RLORcwMDUnACFN81X
	2DuaSKmmdYbpNf7AUDCvo/Kvoa/MEZJC7uWPmo4+0rBzk/8LNTDObUVsQrAA9Fpcr
X-Gm-Gg: ASbGncueTYpAAOyNPZ0SOWlu9QmmLFrKW5ye5CbGQ/KsfW7aoodvoTCiPWLqxJfW8Xg
	w+FnSWSNwK6iEP3W6Q3ysMborvqAwZ/He6n5Ceu8Q1sGPas2t3q2gbPE8PO98GBc6dgjFcW3c3o
	qP1wpIHCVZye4Sak5K3sPbxBMaz7vLjT7kqq5l8dYTHDA1XMmTPnqvOFs5I+2NIUQqOv4uCxMAe
	YO2gUg6KYZioF68FQ45Q97SBrg+R6SP2FYVkjQGpjbt8xIeiioffgtpV2PslTov4kKsA5wf6gzK
	tL6RRALjqIGdd67g9+HH3S4URyA61Q==
X-Received: by 2002:a17:902:f681:b0:216:1cfa:2bda with SMTP id d9443c01a7336-21c3564858emr475850405ad.43.1737717792789;
        Fri, 24 Jan 2025 03:23:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr5DYYXHE2G/vBfLJJCN6ckREbrK5+wnUplikzoVZhqw80AYnBOws3G++Q2Ix4csuj5Tuxeg==
X-Received: by 2002:a17:902:f681:b0:216:1cfa:2bda with SMTP id d9443c01a7336-21c3564858emr475849925ad.43.1737717792330;
        Fri, 24 Jan 2025 03:23:12 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414cc20sm14025385ad.165.2025.01.24.03.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:23:11 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 16:52:48 +0530
Subject: [PATCH v4 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-preset_v2-v4-2-0b512cad08e1@oss.qualcomm.com>
References: <20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com>
In-Reply-To: <20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737717776; l=4612;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=f7z3CtNmxsHSKM03nohqE7aPIUwkTTXaD4CtcTYvgDI=;
 b=ONmPOabKI/5+CXlcVHrVmoVXeeLa+NbJKA7XyAUP+yvdzFIStSgyQzc7zxbrQEzYeC/fnPWAJ
 KCBUFQE8411CxldWCVXPOcrFJlTYhQcHAoFUXYQDP7askNWfbP5Nxd1
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: VArcNWKz8eM98WawirIlPG33b9Ox7Bh9
X-Proofpoint-GUID: VArcNWKz8eM98WawirIlPG33b9Ox7Bh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240083

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
 drivers/pci/of.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h | 24 +++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index dacea3fc5128..7aa17c0042c5 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -826,3 +826,50 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
 	return slot_power_limit_mw;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
+
+/**
+ * of_pci_get_equalization_presets - Parses the "eq-presets-ngts" property.
+ *
+ * @dev: Device containing the properties.
+ * @presets: Pointer to store the parsed data.
+ * @num_lanes: Maximum number of lanes supported.
+ *
+ * If the property is present read and store the data in the preset structure
+ * assign default value 0xff to indicate property is not present.
+ *
+ * If the property is not found or is invalid, returns 0.
+ */
+int of_pci_get_equalization_presets(struct device *dev,
+				    struct pci_eq_presets *presets,
+				    int num_lanes)
+{
+	char name[20];
+	int ret;
+
+	presets->eq_presets_8gts[0] = 0xff;
+	if (of_property_present(dev->of_node, "eq-presets-8gts")) {
+		ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+						 presets->eq_presets_8gts, num_lanes);
+		if (ret) {
+			dev_err(dev, "Error reading eq-presets-8gts %d\n", ret);
+			return ret;
+		}
+	}
+
+	for (int i = 0; i < EQ_PRESET_TYPE_MAX; i++) {
+		presets->eq_presets_Ngts[i][0] = 0xff;
+		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
+		if (of_property_present(dev->of_node, name)) {
+			ret = of_property_read_u8_array(dev->of_node, name,
+							presets->eq_presets_Ngts[i],
+							num_lanes);
+			if (ret) {
+				dev_err(dev, "Error %s %d\n", name, ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 14d00ce45bfa..3a8c04e3b30d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -7,6 +7,8 @@
 /* Number of possible devfns: 0.0 to 1f.7 inclusive */
 #define MAX_NR_DEVFNS 256
 
+#define MAX_NR_LANES 16
+
 #define PCI_FIND_CAP_TTL	48
 
 #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
@@ -732,6 +734,18 @@ static inline u64 pci_rebar_size_to_bytes(int size)
 
 struct device_node;
 
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
 int of_pci_parse_bus_range(struct device_node *node, struct resource *res);
 int of_get_pci_domain_nr(struct device_node *node);
@@ -746,7 +760,9 @@ void pci_set_bus_of_node(struct pci_bus *bus);
 void pci_release_bus_of_node(struct pci_bus *bus);
 
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
-
+int of_pci_get_equalization_presets(struct device *dev,
+				    struct pci_eq_presets *presets,
+				    int num_lanes);
 #else
 static inline int
 of_pci_parse_bus_range(struct device_node *node, struct resource *res)
@@ -793,6 +809,12 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
 	return 0;
 }
 
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


