Return-Path: <linux-arm-msm+bounces-69654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4AB2B8BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528E0623319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6FA3101C5;
	Tue, 19 Aug 2025 05:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzqZ7Jd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0B1DF254
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581706; cv=none; b=cD5cFh/zdvV4pHLS3DFqnmrt0yfxGtZ6JUecRPUSIl1x3NJP+4f+f9+tsrPhZ+7BQZm7AUvYjn46pHFWnSlMb7QHaRT8NjGScPh289mGtnG9glt2MesE6IMTOan+BMC1BlsVvjDfbIZIMkOHjsVnBFFP1yKpz35Wi5yMeppznvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581706; c=relaxed/simple;
	bh=IGUYBqodeckAvkTwJGXLLcRUT+selbqJcsZemlSFEHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/tkfq0ZWUPELmeTxh2Wq+ekdyAyfYzk5NBFnElMZkfqUMKXxqbnTGc00m0tTbgs3WSTSrvCn9vEb9JHBptu0oBm5//MU8yEl1lBXOkD1/C7mhrlGxoxFGKDYj3AleVfI+lmg419qg+3bj1E5vh7rso/4zGwgvIUPWyawcWOqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzqZ7Jd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0nN31027867
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEfaylhhHT3PRMBgt77f7ADF//VSd924MmiZhS+q5SM=; b=QzqZ7Jd9CiM5OKHn
	v42Z08cLcobbNhw5FaKw1jZEJWgE2qfuLP5ZlMHrsfcAyFWgBUMJk6G7bew2ajlo
	yuNC235z9hJ0IGUsZxvoKDJdnxnosVcAso/VT7nEGwHuHCDgwaviPHA5EBS0setz
	b0Go36OXJs63XYpAr3GgwWf5G4WXopDk9g9BC/rMkRjBUkcpMHxbCKhlMdeidDFb
	9v2daUxOe7+GT3n/WXMdFaO5+H/CCATnu9KjY3BBQ5ytZe11YkXmucKjDBknyDKb
	SKTJZ5ByUNU7RivmfhKPHCY4zD/CUA4FWUJZtXjcrtQ4ZJ7dB6a7PH7rekKSnLHA
	UMBbMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ufcbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:35:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458121274so59232195ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 22:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581702; x=1756186502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEfaylhhHT3PRMBgt77f7ADF//VSd924MmiZhS+q5SM=;
        b=ERpDPEdchXL0nhqZeaKfOUKOAc1slJc83rKtVGBwe4bozAEbGR3FbapSPXVV4/6rBG
         /sdXxaT9KTaRa0q/AeC6ARFUlewKv/nlDP/octslD0AQYu1sglwkQNbaHpksZtrSHpBp
         vsTc639OmHAERmmE7KGQFlJP/KhDY9nlqhs0FWlH9fP4G5yigKi7STyDUf56Y7KnsZDn
         1AsGy5qWKjTb8D8fVKJTY+tObDdEPi9+5oaithRcGYrXPT4nKtJSJjFtii/0tqDwGZfo
         KWrZpG8Vh6z/yCZ+dLsDsyZvtFyHkuveyzPK+NEpqo/EO/QN+rk7Y2wLdUv90hD0oG9X
         QimA==
X-Forwarded-Encrypted: i=1; AJvYcCUfNaKkgrZkr5Oq0Bzqacj9qh6nsOCwfNVA0ogTKx+f2WqaPU84kBSTPN0E6FH7uE9CM/dvX/8TqMP/WSss@vger.kernel.org
X-Gm-Message-State: AOJu0YxvT2xalqAgxbFbknw9saLQjbO555ZEr8Abc5B/8zyKBCORQ408
	b97e9cDCmfMZj7YH2nmb0F1wOI4YCck05LDTIYphOv7d9ozn4vGf8SDiqQBLYdFOaTgwX3eY0YA
	R1stbxiTzhuRBPrghTOlsND1RJoJAfR3nUio5X1E+ky2r16qO3oPU3mqPPesqYwVpTZYDW0nbO9
	J4
X-Gm-Gg: ASbGncteXsyV7pBEPAjkPWAweCHBOYFkU+MJ/QjGCiFTAfZsUajjRpTp/23VmrXGSCS
	Q+s9vfxhK2QoOPIOc4GBNma8xu+owX+YjCEJgbbCEVE8pQc6vpHs9o114gTyZ/YApsutCM+Vppk
	S69EW1vSv7vcyXByt+fRhuD+tKAMRuuwU8xXzM84Swv/Trmw8BqWy5MvAdqxfKmrl/aPzP68xtw
	9Hgxz8rNXymHGYD2R6O0NidHIiJ3KvAIxLSU1/uS2ie13YlcKZfpeRf2f/jxFXkfWhDXAyAORF+
	cAf1NzzBcBA2ZDQCmdZiQ7OZwPKVT6SGWTQ/YSYLJL8EKV9UDCWE4wAiXZXqY2dtKdrtu0KU5kE
	=
X-Received: by 2002:a17:902:e751:b0:240:9f9:46a0 with SMTP id d9443c01a7336-245e056ad16mr19552715ad.38.1755581701349;
        Mon, 18 Aug 2025 22:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhygomeqN/twCLgtf4rIAeJ3WW/JSlAe0TPIExYym4m+qO/lkisrRXVqSA50IwU9v8z/7NNA==
X-Received: by 2002:a17:902:e751:b0:240:9f9:46a0 with SMTP id d9443c01a7336-245e056ad16mr19552365ad.38.1755581700824;
        Mon, 18 Aug 2025 22:35:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f710sm97004785ad.86.2025.08.18.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:35:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:04:42 +0530
Subject: [PATCH v3 1/3] OPP: Add support to find OPP for a set of keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-opp_pcie-v3-1-f8bd7e05ce41@oss.qualcomm.com>
References: <20250819-opp_pcie-v3-0-f8bd7e05ce41@oss.qualcomm.com>
In-Reply-To: <20250819-opp_pcie-v3-0-f8bd7e05ce41@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755581690; l=7102;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=IGUYBqodeckAvkTwJGXLLcRUT+selbqJcsZemlSFEHs=;
 b=a6zu95us9JDdiwpabmh6OKUCpDnodAcucS+dYmBc/1vKwHkujn/U4oxMiwAFcmwS6YXwLIJ3c
 Op+POgi5A24Bd0WU5OqK0xB/zx2fhJsXe3+dbGfIpjRtxDrpCo9GVfY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a40d07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=76l3OPsZB85xAofE:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=Efh3igjAhhwdWKXb3DkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: WIIUl70kjp-36gzATeB0k1bsnFLqubTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX6glBptpnMJSW
 Sw+m6WV95GfoidKpvPH5mBaaclUXIrTyH/kxnNPPVj677pJwjd+ZaywsXVuSfkZMNi+k/2Hv/cD
 cztTs8eoqQ03S8A8XCEuy9q7Ts2JK0r52+hh6i5zwHG3dGgjD5MF0eJpilRPN7iSn7pPcP5yatt
 Y/bftQeglinaJ8LkZkVyCn5Z6e0CbMcZSSTaNU8V29Ks2Mffv8voM8hKfIpMjlhpAu4h4xsVJxO
 Ib3N3tCk4DPwfdM2Tk+EVzDqR2SIcHqGcGwRHCY9JsPVrfRtiGMXcymuYFW0CS5RPx4GOtMowdM
 bphHNhj0SJZjKcurRQBqGlvP+OdD5yERt0zD0pp3Lih5IK8hLh8Sbxt0CIYMAEffGhDjFBbVyDd
 3pffsDsj
X-Proofpoint-GUID: WIIUl70kjp-36gzATeB0k1bsnFLqubTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

Some clients, such as PCIe, may operate at the same clock frequency
across different data rates by varying link width. In such cases,
frequency alone is not sufficient to uniquely identify an OPP.
To support these scenarios, introduce a new API
dev_pm_opp_find_key_exact() that allows OPP lookup with different
set of keys like freq, level & bandwidth.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/opp/core.c     | 100 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  23 ++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index edbd60501cf00dfd1957f7d19b228d1c61bbbdcc..ce359a3d444b0b7099cdd2421ab1019963d05d9f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -461,6 +461,15 @@ int dev_pm_opp_get_opp_count(struct device *dev)
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_opp_count);
 
 /* Helpers to read keys */
+static unsigned long _read_opp_key(struct dev_pm_opp *opp, int index, struct dev_pm_opp_key *key)
+{
+	key->bandwidth = opp->bandwidth ? opp->bandwidth[index].peak : 0;
+	key->freq = opp->rates[index];
+	key->level = opp->level;
+
+	return true;
+}
+
 static unsigned long _read_freq(struct dev_pm_opp *opp, int index)
 {
 	return opp->rates[index];
@@ -488,6 +497,23 @@ static bool _compare_exact(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
 	return false;
 }
 
+static bool _compare_opp_key_exact(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
+				   struct dev_pm_opp_key opp_key, struct dev_pm_opp_key key)
+{
+	bool level_match = (opp_key.level == OPP_LEVEL_UNSET ||
+			    key.level == OPP_LEVEL_UNSET || opp_key.level == key.level);
+	bool bw_match = (opp_key.bandwidth == 0 ||
+			 key.bandwidth == 0 || opp_key.bandwidth == key.bandwidth);
+	bool freq_match = (key.freq == 0 || opp_key.freq == key.freq);
+
+	if (freq_match && level_match && bw_match) {
+		*opp = temp_opp;
+		return true;
+	}
+
+	return false;
+}
+
 static bool _compare_ceil(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
 			  unsigned long opp_key, unsigned long key)
 {
@@ -541,6 +567,40 @@ static struct dev_pm_opp *_opp_table_find_key(struct opp_table *opp_table,
 	return opp;
 }
 
+static struct dev_pm_opp *_opp_table_find_opp_key(struct opp_table *opp_table,
+		struct dev_pm_opp_key *key, int index, bool available,
+		unsigned long (*read)(struct dev_pm_opp *opp, int index,
+				      struct dev_pm_opp_key *key),
+		bool (*compare)(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
+				struct dev_pm_opp_key opp_key, struct dev_pm_opp_key key),
+		bool (*assert)(struct opp_table *opp_table, unsigned int index))
+{
+	struct dev_pm_opp *temp_opp, *opp = ERR_PTR(-ERANGE);
+	struct dev_pm_opp_key temp_key;
+
+	/* Assert that the requirement is met */
+	if (assert && !assert(opp_table, index))
+		return ERR_PTR(-EINVAL);
+
+	guard(mutex)(&opp_table->lock);
+
+	list_for_each_entry(temp_opp, &opp_table->opp_list, node) {
+		if (temp_opp->available == available) {
+			read(temp_opp, index, &temp_key);
+			if (compare(&opp, temp_opp, temp_key, *key))
+				break;
+		}
+	}
+
+	/* Increment the reference count of OPP */
+	if (!IS_ERR(opp)) {
+		*key = temp_key;
+		dev_pm_opp_get(opp);
+	}
+
+	return opp;
+}
+
 static struct dev_pm_opp *
 _find_key(struct device *dev, unsigned long *key, int index, bool available,
 	  unsigned long (*read)(struct dev_pm_opp *opp, int index),
@@ -632,6 +692,46 @@ struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_find_freq_exact);
 
+/**
+ * dev_pm_opp_find_key_exact() - Search for an exact OPP key
+ * @dev:                Device for which the OPP is being searched
+ * @key:                OPP key to match
+ * @available:          true/false - match for available OPP
+ *
+ * Return: Searches for an exact match the OPP key in the OPP table and returns
+ * pointer to the  matching opp if found, else returns ERR_PTR  in case of error
+ * and should  be handled using IS_ERR. Error return values can be:
+ * EINVAL:      for bad pointer
+ * ERANGE:      no match found for search
+ * ENODEV:      if device not found in list of registered devices
+ *
+ * Note: available is a modifier for the search. if available=true, then the
+ * match is for exact matching key and is available in the stored OPP
+ * table. if false, the match is for exact key which is not available.
+ *
+ * This provides a mechanism to enable an opp which is not available currently
+ * or the opposite as well.
+ *
+ * The callers are required to call dev_pm_opp_put() for the returned OPP after
+ * use.
+ */
+struct dev_pm_opp *dev_pm_opp_find_key_exact(struct device *dev,
+					     struct dev_pm_opp_key key,
+					     bool available)
+{
+	struct opp_table *opp_table __free(put_opp_table) = _find_opp_table(dev);
+
+	if (IS_ERR(opp_table)) {
+		dev_err(dev, "%s: OPP table not found (%ld)\n", __func__,
+			PTR_ERR(opp_table));
+		return ERR_CAST(opp_table);
+	}
+
+	return _opp_table_find_opp_key(opp_table, &key, 0, available, _read_opp_key,
+				       _compare_opp_key_exact, assert_single_clk);
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_find_key_exact);
+
 /**
  * dev_pm_opp_find_freq_exact_indexed() - Search for an exact freq for the
  *					 clock corresponding to the index
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index cf477beae4bbede88223566df5f43d85adc5a816..53e02098129d215970d0854b1f8ffaf4499f2bd4 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -98,6 +98,18 @@ struct dev_pm_opp_data {
 	unsigned long u_volt;
 };
 
+/**
+ * struct dev_pm_opp_key - Key used to identify OPP entries
+ * @freq:       Frequency in Hz
+ * @level:      Performance level associated with the OPP entry
+ * @bandwidth:  Bandwidth associated with the OPP entry
+ */
+struct dev_pm_opp_key {
+	unsigned long freq;
+	unsigned int level;
+	u32 bandwidth;
+};
+
 #if defined(CONFIG_PM_OPP)
 
 struct opp_table *dev_pm_opp_get_opp_table(struct device *dev);
@@ -131,6 +143,10 @@ struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 					      unsigned long freq,
 					      bool available);
 
+struct dev_pm_opp *dev_pm_opp_find_key_exact(struct device *dev,
+					     struct dev_pm_opp_key key,
+					     bool available);
+
 struct dev_pm_opp *
 dev_pm_opp_find_freq_exact_indexed(struct device *dev, unsigned long freq,
 				   u32 index, bool available);
@@ -289,6 +305,13 @@ static inline struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline struct dev_pm_opp *dev_pm_opp_find_key_exact(struct device *dev,
+							   struct dev_pm_opp_key key,
+							   bool available)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 static inline struct dev_pm_opp *
 dev_pm_opp_find_freq_exact_indexed(struct device *dev, unsigned long freq,
 				   u32 index, bool available)

-- 
2.34.1


