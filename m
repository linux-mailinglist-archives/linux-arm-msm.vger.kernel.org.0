Return-Path: <linux-arm-msm+bounces-69504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEAB29C00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8BC19619A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE452FF67D;
	Mon, 18 Aug 2025 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLSNhchZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D030100D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505396; cv=none; b=a0lK8tAeyDs+bUxsBhe3CjSXnG7bwQlsVPeF2wKx8s3RaIcOt7kh0+ORw1W21uQEzDiKMWqVCiYpCS7yZNg+1FwAVSz1hbPEFcJRDIhujxmAcgJtjL33pt3E379WXj25curqt/D4Wm7HvzsyyptVjPIi0gs7euDU3rdV1Ib0GRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505396; c=relaxed/simple;
	bh=3kVQhSMZncIoSbo7nH2qJTqRNDCOFdRv3QEYdUHeSlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtjFuLmTrfmMehCTzfCVAixuYJk3sjEjVPbD9Ai+A1LJ9ktthvUPvHSTqsBlftqmlikaIJe77W0lnRwQZEthPfjApwGw+8yUXYWiqKxzUrsnK50I9jsVzgwUqt8VDPPxtjh8S0hnhcZ7FVYj9E6H4B8GS25/6JxC6HX0nIsj7BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLSNhchZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Goau031569
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klAiFTBcRJfvFZL9ijQNcijA32Nr8LZgSDlbBt2W7m0=; b=FLSNhchZ/9aU6X8s
	sfyoHfsJd4914VXuGSZ4Lk0wNNLeTuwN3cje7rE/9+XowpK5MsdoenqFwRS8KFOF
	VvSESsOmuXicfU14hPQ/7f3Ne6yuMsPPG7RsnasyWOkw9No/b8TP/fFEgPJGM1Eo
	7ivwlfjIbwFuvlLxM8y0PyT0mJ5LyIzAQL+jmvn1HIkvpjv2xgjzW1m4s73ZEzpb
	GnB4Q6OKhLOeznqUmBFSVKiomF0UwtbTWUr+2uZZ2sLyaJ/rYFTmCWkCqmkxv0Hw
	Tgohmgpcw9NhG+l/E5XS4bnSQtcn9HdfwA7mTyvKC/PyCTC2QVSUfvdVkSIUY41p
	7OOjoQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mbswy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47174b3427so3296739a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 01:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505393; x=1756110193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klAiFTBcRJfvFZL9ijQNcijA32Nr8LZgSDlbBt2W7m0=;
        b=PTJ7C6RU70EYZfj/LFqku0vQTLCZ56ZJVOcYUcTbyepyu7eEoRSXN5nHMd7S7CIl+E
         crUk03/IM3glbaaFWxTYNZXswW2ErFnxckveCZO5p2xxiUeSSrbTkmxvUZsy0/Ofw1Xl
         aVa4qkopldANdr40yhvig1Kg5HGHUPH8i3Om/oF/4uTqJjhVOt74SGkFeiT4yyBGmC8U
         xJfUWv/rwedszP17212aP7lYF4hjTq3AA9miXbJ6I5XLCd4wvuWnRUtG2goEC7i3Snfv
         50gzndhPpwkIaMsUPdrt3VaGSzwOqKxosiK8EDs+4Zz8IjYGJNGEdCSbs0MG11XXG9X3
         GNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsK8EDJcNORaXDLekYH9pUvlrwxYvBUJqwSR+WPqZ9j51g5obhMEpuBKTD4mkCAlvvoE3/l09B84x2awSa@vger.kernel.org
X-Gm-Message-State: AOJu0YznuNusAcLnIDBk91S741WMj/GakyOFbXghx/nOdeT2XMkiZ5gi
	cmHiXPbDvs7AbHWflCF93J8/wI69npQPpaGebbzLybCu7Fkr8cI7xgzQmnOP31mSSvtsMH3pSCd
	1Rgwx1yGGlGmcBKugMPhoBV5PpoU5kJNktkDvOxTBpqFZHjmTeNtWIXmi791e6rO+uUef
X-Gm-Gg: ASbGncsfn6NVciB47ouq9PJ60BoW/lgos1df/4ei8iAc13x2s2YiJpNxrwwVKWIyA+6
	QzykHkDYqx6cFytAkqUzi/PPWRM5qAtNIdiqSsyCXU762oy0h/Rd9izRDMxvesI8F1pTZZMhtUp
	wVO2IBuSkQ/BdPwnLyjQsowFMzG7FCkgqAY6aWoeg8woNEqSm4PSiDFa+6G7LDlgnQ4fi1OaroE
	J+2zPIdpdJ4QvUB9svXNjnnifpkG5zW5iMWgO+6XYjjz/0zThOXyo1SV1asvfSdm38k4nzrMPrx
	6noyeKMWOcbFmKQI8miqH2aG8SM/crPJ5HbEq5sAYq7seE17S0Z5vydiE5Sz+AImTHE2VqZGGK4
	=
X-Received: by 2002:a17:902:c951:b0:240:22af:91c7 with SMTP id d9443c01a7336-2446d71db3fmr137303165ad.14.1755505393227;
        Mon, 18 Aug 2025 01:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEQ4OLfzKDCynU5NX13S90adlyz0mKnEDg9lAHh0oyawGQNe7zcWlBFZqEe/U/0n2KsOjSOw==
X-Received: by 2002:a17:902:c951:b0:240:22af:91c7 with SMTP id d9443c01a7336-2446d71db3fmr137302655ad.14.1755505392641;
        Mon, 18 Aug 2025 01:23:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5536c3sm73225155ad.137.2025.08.18.01.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:23:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:52:53 +0530
Subject: [PATCH v2 1/3] PM/OPP: Support to match OPP based on both
 frequency and level.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-opp_pcie-v2-1-071524d98967@oss.qualcomm.com>
References: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
In-Reply-To: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755505382; l=7541;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3kVQhSMZncIoSbo7nH2qJTqRNDCOFdRv3QEYdUHeSlM=;
 b=egiIbtEkxg4AJc1GNbqSrjFEc5t9ay4p51jScc4BJHzTdUALgaTbpg5zBkn0ZcohfbL1xyD0L
 6xgPz7bXktkCG/Wzw2LvfSIkvFn07iPkKZ4aQ1SLxlxVwJI1z16cTbu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a2e2f2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=x3cnzf2s5ip7nYLkZs0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 6--hPtGZjIMH9ETgrUv0duYUIBhTv1Hp
X-Proofpoint-GUID: 6--hPtGZjIMH9ETgrUv0duYUIBhTv1Hp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX0XJFxRQwYv5a
 WsHo9zGB5BmUV3WVjJj0ERvaPZxFY1Yf7Im7HMV/3/aY/f7b/Hwm9bpcT8V5lNxcuuJYXRzwyLj
 2M4mfkeI3Cqxd5a2nTIkNZsMB/FJNm9RY7w2+lmvwKMmQ4WcLWkJhPovcNz3UR27IVU1QYT2K9N
 z2YnvlPSW32dzJDb1cteacQP6hGhs9HrVRm1QM3tSZ7izcG6YgkTzsdXPj80ClJHJWw97GaQ+yw
 X8jGVRMyslMegtCKvIreaCkqcul47tQUtPriVv89zRaymDz8WSzJYQZQH6bf/40glI/zTAbghsI
 jnHR9TwHEdkM7YMO9+ncMp3NAN8rGUjGNFAVA4iu4svpE8GYxn4wJ4IXl5wfnHSh3EP+leNhT05
 g6ruehBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

Some clients, such as PCIe, may operate at the same clock frequency
across different data rates by varying link width. In such cases,
frequency alone is not sufficient to uniquely identify an OPP.
To support these scenarios, introduce a new API
dev_pm_opp_find_freq_level_exact() that allows OPP lookup using
both frequency and performance level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/opp/core.c     | 103 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/opp/opp.h      |  13 +++++++
 include/linux/pm_opp.h |  13 +++++++
 3 files changed, 129 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index edbd60501cf00dfd1957f7d19b228d1c61bbbdcc..4aeb394dcd73a1ca70899a887f8a8c4282ec6d57 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -461,6 +461,14 @@ int dev_pm_opp_get_opp_count(struct device *dev)
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_opp_count);
 
 /* Helpers to read keys */
+static unsigned long _read_opp_key(struct dev_pm_opp *opp, int index, struct dev_pm_opp_key *key)
+{
+	key->freq = opp->rates[index];
+	key->level = opp->level;
+
+	return true;
+}
+
 static unsigned long _read_freq(struct dev_pm_opp *opp, int index)
 {
 	return opp->rates[index];
@@ -488,6 +496,21 @@ static bool _compare_exact(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
 	return false;
 }
 
+static bool _compare_opp_key_exact(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
+				   struct dev_pm_opp_key opp_key, struct dev_pm_opp_key key)
+{
+	bool freq_match = (opp_key.freq == 0 || key.freq == 0 || opp_key.freq == key.freq);
+	bool level_match = (opp_key.level == OPP_LEVEL_UNSET ||
+			    key.level == OPP_LEVEL_UNSET || opp_key.level == key.level);
+
+	if (freq_match && level_match) {
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
@@ -541,6 +564,40 @@ static struct dev_pm_opp *_opp_table_find_key(struct opp_table *opp_table,
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
@@ -632,6 +689,52 @@ struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_find_freq_exact);
 
+/**
+ * dev_pm_opp_find_freq_level_exact() - Search for an exact frequency and level
+ * @dev:                Device for which the OPP is being searched
+ * @freq:               Frequency to match (in Hz)
+ * @level:              Performance level to match
+ * @available:          true/false - match for available OPP
+ *
+ * Return: Searches for an exact match of frequency and performance level in the
+ * OPP table and returns pointer to the  matching opp if found, else returns ERR_PTR
+ * in case of error and should  be handled using IS_ERR. Error return values can be:
+ * EINVAL:      for bad pointer
+ * ERANGE:      no match found for search
+ * ENODEV:      if device not found in list of registered devices
+ *
+ * Note: available is a modifier for the search. if available=true, then the
+ * match is for exact matching frequency and is available in the stored OPP
+ * table. if false, the match is for exact frequency which is not available.
+ *
+ * This provides a mechanism to enable an opp which is not available currently
+ * or the opposite as well.
+ *
+ * The callers are required to call dev_pm_opp_put() for the returned OPP after
+ * use.
+ */
+struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
+						    unsigned long freq,
+						    unsigned int level,
+						    bool available)
+{
+	struct opp_table *opp_table __free(put_opp_table);
+	struct dev_pm_opp_key key;
+
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table)) {
+		dev_err(dev, "%s: OPP table not found (%ld)\n", __func__,
+			PTR_ERR(opp_table));
+		return ERR_CAST(opp_table);
+	}
+
+	key.freq = freq;
+	key.level = level;
+	return _opp_table_find_opp_key(opp_table, &key, 0, available, _read_opp_key,
+				       _compare_opp_key_exact, assert_single_clk);
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_find_freq_level_exact);
+
 /**
  * dev_pm_opp_find_freq_exact_indexed() - Search for an exact freq for the
  *					 clock corresponding to the index
diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
index 9eba63e01a9e7650cf2e49515b70ba73f72210fc..60bb0042e30f73a8e31c1688e0cb3842cdea09d5 100644
--- a/drivers/opp/opp.h
+++ b/drivers/opp/opp.h
@@ -249,6 +249,19 @@ struct opp_table {
 #endif
 };
 
+/**
+ * struct dev_pm_opp_key - Key used to identify OPP entries
+ * @freq:       Frequency in Hz
+ * @level:      Performance level associated with the frequency
+ *
+ * This is internal structure, used to help in mapping frequency
+ * and performance level combinations to specific OPP entries.
+ */
+struct dev_pm_opp_key {
+	unsigned long freq;
+	unsigned int level;
+};
+
 /* Routines internal to opp core */
 bool _opp_remove_all_static(struct opp_table *opp_table);
 int _get_opp_count(struct opp_table *opp_table);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index cf477beae4bbede88223566df5f43d85adc5a816..a93f2670da6c2f10aa7ac5ea020fc3ef14fef113 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -131,6 +131,11 @@ struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 					      unsigned long freq,
 					      bool available);
 
+struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
+						    unsigned long freq,
+						    unsigned int level,
+						    bool available);
+
 struct dev_pm_opp *
 dev_pm_opp_find_freq_exact_indexed(struct device *dev, unsigned long freq,
 				   u32 index, bool available);
@@ -289,6 +294,14 @@ static inline struct dev_pm_opp *dev_pm_opp_find_freq_exact(struct device *dev,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
+						    unsigned long freq,
+						    unsigned int level,
+						    bool available)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 static inline struct dev_pm_opp *
 dev_pm_opp_find_freq_exact_indexed(struct device *dev, unsigned long freq,
 				   u32 index, bool available)

-- 
2.34.1


