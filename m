Return-Path: <linux-arm-msm+bounces-74248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 146ADB8B299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 22:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D621C1BC8028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027807262A;
	Fri, 19 Sep 2025 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZd7dPj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D702D0C82
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758312056; cv=none; b=VFCGyMTDho5Tmvo+17M1AUZejqbgxV4yUZ4S1KeCaywRELiqfSH8GwA142wyXenDNVZGXae/acDiMriuMzt86FB7uIsYSMchBBnDB+tS5QfRfrZMzkY8d38e3MoLcMZpt/Yxmzo1+Sd18kBRpDs6rtaID9dDpz32GoomxiDH8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758312056; c=relaxed/simple;
	bh=Zq9NQ1VbB9Tj7WKEy2NXLrm6JaJEvu6MFIHyIWFCKeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9GjHAxiSbuuAEk6Jd5oX4l6TNOGIKSUseQS9L96IYbhPQByQfMrkKsuSSJ+Ra5Gl4+GD3FTdmLs5AJR+zcL27WOXYKLZkYx30alGxZS5vbwU34PeJ+tL32dQxMh33tITsAkycJPcTd/eC9GqtUQjnOLw859CjyJxE5M7yJaotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZd7dPj7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JF0iG4010769
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jg+deZUns2OlXgXhJM5QdhR9WQrOxfsuz9UWmQ6lhXc=; b=OZd7dPj77QM1QE9D
	RKNcngCO+eJX/vh/ZJgOvxWkU0s8xSrt/FtTr8l+wOEG2Hb3W4ZDPqSLB9xHLg7/
	QYr9sn7pG622Aw4FRfkgoWex2cjmM02jZfDgsqhNxrk6r/MDRHPZ3vvcXYLrjcQ9
	Pg5Mejz4Z9ruKMELPnFo05/4qVd32zlNAJQQGRM1r4+bTW9eAVfrfSzA59NxEpZW
	MKy+J+exKzch5icVFHyCUWfLlTtdZtyDXfcM1/RtRyRvD4keBPx1NAz8IAjf4AkI
	Ch4d9Thqk8iSbj6HbPBVP1FOxGfQw/L63i0FzHqj8/eqv7ABfTZ+znN8roYUt1UA
	Ez7K3w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy3n4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:00:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5514519038so1966383a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 13:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312053; x=1758916853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jg+deZUns2OlXgXhJM5QdhR9WQrOxfsuz9UWmQ6lhXc=;
        b=I91uuzTDlOTSaIPC6GOexLuZpdmopNKWFUA9eAkOxAxnAh6mKjw57vAMFJpzs/0Ybq
         dwlepqqi6r4ZAGv29TrGx08ul/XQXoPPBan5xx0OiKGK5iehpU+qAQRdnMc1HEAXricZ
         VWelljIU/pB0u+TPpwkXMI6AJSDUbxdHEkK+IWzkm74UHWvk05ISR/6qWTfwZcQ733PH
         XjHteM2SLGGf9UvlPdDucL+den5Rn9kkugpSpzk9/W/c8KHsR6AW5++mIWnS+aGxQISD
         ninMNuGMj8H+4Z2Rsloi1RS0DObslIrxAM2SqIt0Q/csGDXlnIIEAf/9DB1A9rxjtYaN
         JFow==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7D1jnCDlmnqZo6ArcVfVMWlKTKODU4UqkN0/rTHzkUewhdHNnrkAexle8a9Xo6EzAKW/7T5gnV9QgFu8@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDRA2qO15NbZvQmgP1j+D9Cq6pD+uNUeMJp1uiApe0z5c2IWD
	FCSFIT9Anb/RxyzcCFrn0ZfUcSVt05lIazBBaGi7XRTIkj3dU2dsyGm1mDvYiCWSl4O77fg+ZLa
	Thk8Q17rVtgslFMb9KiURGgGf2a3Vn8CgjCwKu/2KpIzw4M1gh9w3V1nYVUQg93V6y2Iz
X-Gm-Gg: ASbGncul39e8qdilDXcYiCxX2yJA8S5f+xRKfHXuY5Z/TjyhGrDFfYny253krrfRJTS
	JBPW53fdIKBhKnSKyPLR1AMZzOA1oiIc2WJVQG1MLUBG7HTCUpSRPDFNC0PFCe+AXOWzjcaFdIP
	oE3SeJhiNqIc8HN/AqEtMSmOEopeut0WD5OigMlAmXCY6SR1ezn0Z0Ja0b7ydLtmJ0jdaVcsRcC
	rRN+iL52QIfmg0nXPipqbOhJXUBiYXJ0vGx0FYrESOazyGbdsPh37yApx2Kp71D7K7XJ0WPoeBg
	xgJVa2ijc8h3ldK45/042EqtNeR3PkKmASD4u1qpyY6dOsf7/K9WR+3eiI+uKP4cnY4JHzVe1rx
	K7G0gf1gDZgusMfFBcOjtOvawlQ==
X-Received: by 2002:a17:902:ce92:b0:264:ee2:c40f with SMTP id d9443c01a7336-269ba564ed5mr74300555ad.52.1758312051990;
        Fri, 19 Sep 2025 13:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbCwk/FFynlo9j9ursa7Ky62ZdUrITzr0YVl+oIDAk29faXDzZhSaczYJTSpkuoMfhHEH+Hw==
X-Received: by 2002:a17:902:ce92:b0:264:ee2:c40f with SMTP id d9443c01a7336-269ba564ed5mr74299875ad.52.1758312051182;
        Fri, 19 Sep 2025 13:00:51 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm63053905ad.109.2025.09.19.13.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 13:00:50 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 01:30:09 +0530
Subject: [PATCH 1/3] spmi: spmi-pmic-arb: add support for PMIC arbiter v8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-glymur-spmi-v8-gpio-driver-v1-1-23df93b7818a@oss.qualcomm.com>
References: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
In-Reply-To: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758312044; l=19082;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=Fqxtatbk7mgYIrzc/6iUIgOGkhz3U36+T0T+kvTKHGs=;
 b=5MvZYV+Nfcwg8YHi5CCrreByZNJZKchtn2i5cKgQHIDue9t3sAWJq+tBBVcqfJZapUHAoQI1D
 c6Plea4g8wAAfJVb6hWpFsHE9Rk7ffIz4Ej8+YmDb4ylPqlkBO+tGcw
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8JJi8vy5neEQ
 QRlWa/UXFRWVvwAB8vRibTfrrEMmXaStBd5aNHHHMYEUErlJ3L1b3yU+Db+pxxvM/s4m9hFxjML
 dwtorht8dTrBFCYz20E3iOufkZlZwa2KDnDmUQwJyoTvsBeypLlIfx6XHEFm2nwBELyMVTuhL7J
 pJ5rFJREYVrATbcktlVoJJ3ujQDS06FSuyMy1rqLxgPTQWUsUgcyvl9JlIpSPlwRImPomqv05T0
 rq3ubKq5EQheYfULf0vEQRjA/r+KC1Cb0DGcx/d7SQhqd4bTc2YNhNLxOyciEmgImr8T5TpIM3W
 VpAl7AVxu6xyaFY5wR2hQ/FH5yFaVfnSGN+fL1iQICKB691baQEhWwZ/73ECeShlvZajWLUCNCL
 wzBfaIHK
X-Proofpoint-ORIG-GUID: wFXqVJloQbsaXPRzxTQ1KLXDmi7bsgHP
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cdb675 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ik5BXOhrgj9YKjSFxXcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: wFXqVJloQbsaXPRzxTQ1KLXDmi7bsgHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

From: David Collins <david.collins@oss.qualcomm.com>

PMIC arbiter v8 supports up to 4 SPMI buses and up to 8192 PMIC
peripherals.  Its register map differs from v7 as several fields
increased in size. Add support for PMIC arbiter version 8.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 327 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 297 insertions(+), 30 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 91581974ef84ea49f2b9c64846634ee2da8df2bb..f91c767ef688fcbe39d9bbb25111387ccc297f54 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -25,10 +25,12 @@
 #define PMIC_ARB_VERSION_V3_MIN		0x30000000
 #define PMIC_ARB_VERSION_V5_MIN		0x50000000
 #define PMIC_ARB_VERSION_V7_MIN		0x70000000
+#define PMIC_ARB_VERSION_V8_MIN		0x80000000
 #define PMIC_ARB_INT_EN			0x0004
 
 #define PMIC_ARB_FEATURES		0x0004
 #define PMIC_ARB_FEATURES_PERIPH_MASK	GENMASK(10, 0)
+#define PMIC_ARB_FEATURES_V8_PERIPH_MASK	GENMASK(12, 0)
 
 #define PMIC_ARB_FEATURES1		0x0008
 
@@ -50,9 +52,10 @@
 #define SPMI_MAPPING_BIT_IS_1_RESULT(X)	(((X) >> 0) & 0xFF)
 
 #define SPMI_MAPPING_TABLE_TREE_DEPTH	16	/* Maximum of 16-bits */
-#define PMIC_ARB_MAX_PPID		BIT(12) /* PPID is 12bit */
+#define PMIC_ARB_MAX_PPID		BIT(13)
 #define PMIC_ARB_APID_VALID		BIT(15)
 #define PMIC_ARB_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(24))
+#define PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(31))
 #define INVALID_EE				0xFF
 
 /* Ownership Table */
@@ -96,30 +99,37 @@ enum pmic_arb_channel {
 	PMIC_ARB_CHANNEL_OBS,
 };
 
-#define PMIC_ARB_MAX_BUSES		2
+#define PMIC_ARB_MAX_BUSES		4
+#define PMIC_ARB_MAX_BUSES_V8		4
 
 /* Maximum number of support PMIC peripherals */
 #define PMIC_ARB_MAX_PERIPHS		512
 #define PMIC_ARB_MAX_PERIPHS_V7		1024
+#define PMIC_ARB_MAX_PERIPHS_V8		8192
 #define PMIC_ARB_TIMEOUT_US		1000
 #define PMIC_ARB_MAX_TRANS_BYTES	(8)
 
 #define PMIC_ARB_APID_MASK		0xFF
 #define PMIC_ARB_PPID_MASK		0xFFF
+#define PMIC_ARB_V8_PPID_MASK		0x1FFF
 
 /* interrupt enable bit */
 #define SPMI_PIC_ACC_ENABLE_BIT		BIT(0)
 
+/*
+ * hwirq value crosses 32 bits only for platforms with more than 16 PMICs,
+ * none of which happen to support booting Linux in 32-bit mode.
+ */
 #define spec_to_hwirq(slave_id, periph_id, irq_id, apid) \
-	((((slave_id) & 0xF)   << 28) | \
-	(((periph_id) & 0xFF)  << 20) | \
-	(((irq_id)    & 0x7)   << 16) | \
-	(((apid)      & 0x3FF) << 0))
+	(FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
+	FIELD_PREP(GENMASK(27, 20), (periph_id)) | \
+	FIELD_PREP(GENMASK(18, 16), (irq_id))    | \
+	FIELD_PREP(GENMASK(12, 0),  (apid)))
 
-#define hwirq_to_sid(hwirq)  (((hwirq) >> 28) & 0xF)
-#define hwirq_to_per(hwirq)  (((hwirq) >> 20) & 0xFF)
-#define hwirq_to_irq(hwirq)  (((hwirq) >> 16) & 0x7)
-#define hwirq_to_apid(hwirq) (((hwirq) >> 0)  & 0x3FF)
+#define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
+#define hwirq_to_per(hwirq)  FIELD_GET(GENMASK(27, 20), (hwirq))
+#define hwirq_to_irq(hwirq)  FIELD_GET(GENMASK(18, 16), (hwirq))
+#define hwirq_to_apid(hwirq) FIELD_GET(GENMASK(12, 0), (hwirq))
 
 struct pmic_arb_ver_ops;
 
@@ -138,11 +148,12 @@ struct spmi_pmic_arb;
  * @domain:		irq domain object for PMIC IRQ domain
  * @intr:		address of the SPMI interrupt control registers.
  * @cnfg:		address of the PMIC Arbiter configuration registers.
+ * @apid_owner:		on v8: address of APID owner mapping table registers
  * @spmic:		spmi controller registered for this bus
  * @lock:		lock to synchronize accesses.
- * @base_apid:		on v7: minimum APID associated with the particular SPMI
- *			bus instance
- * @apid_count:		on v5 and v7: number of APIDs associated with the
+ * @base_apid:		on v7 and v8: minimum APID associated with the
+			particular SPMI bus instance
+ * @apid_count:		on v5, v7 and v8: number of APIDs associated with the
  *			particular SPMI bus instance
  * @mapping_table:	in-memory copy of PPID -> APID mapping table.
  * @mapping_table_valid:bitmap containing valid-only periphs
@@ -159,6 +170,7 @@ struct spmi_pmic_arb_bus {
 	struct irq_domain	*domain;
 	void __iomem		*intr;
 	void __iomem		*cnfg;
+	void __iomem		*apid_owner;
 	struct spmi_controller	*spmic;
 	raw_spinlock_t		lock;
 	u16			base_apid;
@@ -181,6 +193,7 @@ struct spmi_pmic_arb_bus {
  * @wr_base:		on v1 "core", on v2 "chnls"    register base off DT.
  * @core:		core register base for v2 and above only (see above)
  * @core_size:		core register base size
+ * @apid_map:		on v8, APID mapping table register base
  * @channel:		execution environment channel to use for accesses.
  * @ee:			the current Execution Environment
  * @ver_ops:		version dependent operations.
@@ -193,6 +206,7 @@ struct spmi_pmic_arb {
 	void __iomem		*wr_base;
 	void __iomem		*core;
 	resource_size_t		core_size;
+	void __iomem		*apid_map;
 	u8			channel;
 	u8			ee;
 	const struct pmic_arb_ver_ops *ver_ops;
@@ -206,6 +220,7 @@ struct spmi_pmic_arb {
  *
  * @ver_str:		version string.
  * @get_core_resources:	initializes the core, observer and channels
+ * @get_bus_resources:	requests per-SPMI bus register resources
  * @init_apid:		finds the apid base and count
  * @ppid_to_apid:	finds the apid for a given ppid.
  * @non_data_cmd:	on v1 issues an spmi non-data command.
@@ -227,6 +242,9 @@ struct spmi_pmic_arb {
 struct pmic_arb_ver_ops {
 	const char *ver_str;
 	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
+	int (*get_bus_resources)(struct platform_device *pdev,
+				 struct device_node *node,
+				 struct spmi_pmic_arb_bus *bus);
 	int (*init_apid)(struct spmi_pmic_arb_bus *bus, int index);
 	int (*ppid_to_apid)(struct spmi_pmic_arb_bus *bus, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
@@ -656,7 +674,7 @@ static int periph_interrupt(struct spmi_pmic_arb_bus *bus, u16 apid)
 	unsigned int irq;
 	u32 status, id;
 	int handled = 0;
-	u8 sid = (bus->apid_data[apid].ppid >> 8) & 0xF;
+	u8 sid = (bus->apid_data[apid].ppid >> 8) & 0x1F;
 	u8 per = bus->apid_data[apid].ppid & 0xFF;
 
 	status = readl_relaxed(pmic_arb->ver_ops->irq_status(bus, apid));
@@ -686,7 +704,7 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 	int last = bus->max_apid;
 	/*
 	 * acc_offset will be non-zero for the secondary SPMI bus instance on
-	 * v7 controllers.
+	 * v7 and v8 controllers.
 	 */
 	int acc_offset = bus->base_apid >> 5;
 	u8 ee = pmic_arb->ee;
@@ -913,7 +931,7 @@ static int qpnpint_irq_domain_translate(struct irq_domain *d,
 		return -EINVAL;
 	if (fwspec->param_count != 4)
 		return -EINVAL;
-	if (intspec[0] > 0xF || intspec[1] > 0xFF || intspec[2] > 0x7)
+	if (intspec[0] > 0x1F || intspec[1] > 0xFF || intspec[2] > 0x7)
 		return -EINVAL;
 
 	ppid = intspec[0] << 8 | intspec[1];
@@ -1160,6 +1178,24 @@ static int pmic_arb_ppid_to_apid_v2(struct spmi_pmic_arb_bus *bus, u16 ppid)
 	return apid_valid & ~PMIC_ARB_APID_VALID;
 }
 
+static void pmic_arb_dump_apid_map(struct spmi_pmic_arb_bus *bus)
+{
+	struct apid_data *apidd;
+	u16 apid, ppid;
+
+	/* Dump the mapping table for debug purposes. */
+	dev_dbg(&bus->spmic->dev, "PPID APID Write-EE IRQ-EE\n");
+	for (ppid = 0; ppid < PMIC_ARB_MAX_PPID; ppid++) {
+		apid = bus->ppid_to_apid[ppid];
+		if (apid & PMIC_ARB_APID_VALID) {
+			apid &= ~PMIC_ARB_APID_VALID;
+			apidd = &bus->apid_data[apid];
+			dev_dbg(&bus->spmic->dev, "%#03X %3u %2u %2u\n",
+				ppid, apid, apidd->write_ee, apidd->irq_ee);
+		}
+	}
+}
+
 static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 {
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
@@ -1222,17 +1258,7 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 		bus->last_apid = i;
 	}
 
-	/* Dump the mapping table for debug purposes. */
-	dev_dbg(&bus->spmic->dev, "PPID APID Write-EE IRQ-EE\n");
-	for (ppid = 0; ppid < PMIC_ARB_MAX_PPID; ppid++) {
-		apid = bus->ppid_to_apid[ppid];
-		if (apid & PMIC_ARB_APID_VALID) {
-			apid &= ~PMIC_ARB_APID_VALID;
-			apidd = &bus->apid_data[apid];
-			dev_dbg(&bus->spmic->dev, "%#03X %3u %2u %2u\n",
-				ppid, apid, apidd->write_ee, apidd->irq_ee);
-		}
-	}
+	pmic_arb_dump_apid_map(bus);
 
 	return 0;
 }
@@ -1346,7 +1372,7 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
 }
 
 /*
- * Only v7 supports 2 buses. Each bus will get a different apid count, read
+ * Arbiter v7 supports 2 buses. Each bus will get a different apid count, read
  * from different registers.
  */
 static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
@@ -1424,6 +1450,185 @@ static int pmic_arb_offset_v7(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
 	return offset;
 }
 
+static int pmic_arb_get_core_resources_v8(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->apid_map = devm_platform_ioremap_resource_byname(pdev,
+								   "chnl_map");
+	if (IS_ERR(pmic_arb->apid_map))
+		return PTR_ERR(pmic_arb->apid_map);
+
+	pmic_arb->core = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V8;
+
+	return pmic_arb_get_obsrvr_chnls_v2(pdev);
+}
+
+static int pmic_arb_get_bus_resources_v8(struct platform_device *pdev,
+					 struct device_node *node,
+					 struct spmi_pmic_arb_bus *bus)
+{
+	int index;
+
+	index = of_property_match_string(node, "reg-names", "chnl_owner");
+	if (index < 0) {
+		dev_err(&pdev->dev, "chnl_owner reg region missing\n");
+		return -EINVAL;
+	}
+
+	bus->apid_owner = devm_of_iomap(&pdev->dev, node, index, NULL);
+
+	return PTR_ERR_OR_ZERO(bus->apid_owner);
+}
+
+static int pmic_arb_read_apid_map_v8(struct spmi_pmic_arb_bus *bus)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	struct apid_data *apidd;
+	struct apid_data *prev_apidd;
+	u16 i, apid, ppid, apid_max;
+	bool valid, is_irq_ee;
+	u32 regval, offset;
+
+	/*
+	 * In order to allow multiple EEs to write to a single PPID in arbiter
+	 * version 8, there can be more than one APID mapped to each PPID.  The
+	 * owner field for each of these mappings specifies the EE which is
+	 * allowed to write to the APID.  The owner of the last (highest) APID
+	 * which has the IRQ owner bit set for a given PPID will receive
+	 * interrupts from the PPID.
+	 *
+	 * In arbiter version 8, the APID numbering space is divided between
+	 * the SPMI buses according to this mapping:
+	 * APID = 0     to N-1       --> bus 0
+	 * APID = N     to N+M-1     --> bus 1
+	 * APID = N+M   to N+M+P-1   --> bus 2
+	 * APID = N+M+P to N+M+P+Q-1 --> bus 3
+	 * where N = number of APIDs supported by bus 0
+	 *       M = number of APIDs supported by bus 1
+	 *       P = number of APIDs supported by bus 2
+	 *       Q = number of APIDs supported by bus 3
+	 */
+	apidd = &bus->apid_data[bus->base_apid];
+	apid_max = bus->base_apid + bus->apid_count;
+	for (i = bus->base_apid; i < apid_max; i++, apidd++) {
+		offset = pmic_arb->ver_ops->apid_map_offset(i);
+		regval = readl_relaxed(pmic_arb->apid_map + offset);
+		if (!regval)
+			continue;
+		ppid = regval & PMIC_ARB_V8_PPID_MASK;
+		is_irq_ee = PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(regval);
+
+		regval = readl_relaxed(pmic_arb->ver_ops->apid_owner(bus, i));
+		apidd->write_ee = SPMI_OWNERSHIP_PERIPH2OWNER(regval);
+
+		apidd->irq_ee = is_irq_ee ? apidd->write_ee : INVALID_EE;
+
+		valid = bus->ppid_to_apid[ppid] & PMIC_ARB_APID_VALID;
+		apid = bus->ppid_to_apid[ppid] & ~PMIC_ARB_APID_VALID;
+		prev_apidd = &bus->apid_data[apid];
+
+		if (!valid || apidd->write_ee == pmic_arb->ee) {
+			/* First PPID mapping or one for this EE */
+			bus->ppid_to_apid[ppid] = i | PMIC_ARB_APID_VALID;
+		} else if (valid && is_irq_ee &&
+			   prev_apidd->write_ee == pmic_arb->ee) {
+			/*
+			 * Duplicate PPID mapping after the one for this EE;
+			 * override the irq owner
+			 */
+			prev_apidd->irq_ee = apidd->irq_ee;
+		}
+
+		apidd->ppid = ppid;
+		bus->last_apid = i;
+	}
+
+	pmic_arb_dump_apid_map(bus);
+
+	return 0;
+}
+
+static int pmic_arb_init_apid_v8(struct spmi_pmic_arb_bus *bus, int index)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	int ret, i;
+
+	if (index < 0 || index >= PMIC_ARB_MAX_BUSES_V8) {
+		dev_err(&bus->spmic->dev, "Unsupported bus index %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
+	bus->base_apid = 0;
+	bus->apid_count = 0;
+	for (i = 0; i <= index; i++) {
+		bus->base_apid += bus->apid_count;
+		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES + i * 4) &
+						PMIC_ARB_FEATURES_V8_PERIPH_MASK;
+	}
+
+	if (bus->apid_count == 0) {
+		dev_err(&bus->spmic->dev, "Bus %d not implemented\n", index);
+		return -EINVAL;
+	} else if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
+		dev_err(&bus->spmic->dev, "Unsupported max APID %d detected\n",
+			bus->base_apid + bus->apid_count);
+		return -EINVAL;
+	}
+
+	ret = pmic_arb_init_apid_min_max(bus);
+	if (ret)
+		return ret;
+
+	ret = pmic_arb_read_apid_map_v8(bus);
+	if (ret) {
+		dev_err(&bus->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * v8 offset per ee and per apid for observer channels and per apid for
+ * read/write channels.
+ */
+static int pmic_arb_offset_v8(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
+			      enum pmic_arb_channel ch_type)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	u16 apid;
+	int rc;
+	u32 offset = 0;
+	u16 ppid = (sid << 8) | (addr >> 8);
+
+	rc = pmic_arb->ver_ops->ppid_to_apid(bus, ppid);
+	if (rc < 0)
+		return rc;
+
+	apid = rc;
+	switch (ch_type) {
+	case PMIC_ARB_CHANNEL_OBS:
+		offset = 0x40000 * pmic_arb->ee + 0x20 * apid;
+		break;
+	case PMIC_ARB_CHANNEL_RW:
+		if (bus->apid_data[apid].write_ee != pmic_arb->ee) {
+			dev_err(&bus->spmic->dev, "disallowed SPMI write to sid=%u, addr=0x%04X\n",
+				sid, addr);
+			return -EPERM;
+		}
+		offset = 0x200 * apid;
+		break;
+	}
+
+	return offset;
+}
+
 static u32 pmic_arb_fmt_cmd_v1(u8 opc, u8 sid, u16 addr, u8 bc)
 {
 	return (opc << 27) | ((sid & 0xf) << 20) | (addr << 4) | (bc & 0x7);
@@ -1490,6 +1695,14 @@ pmic_arb_acc_enable_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return pmic_arb->wr_base + 0x100 + 0x1000 * n;
 }
 
+static void __iomem *
+pmic_arb_acc_enable_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+
+	return pmic_arb->wr_base + 0x100 + 0x200 * n;
+}
+
 static void __iomem *
 pmic_arb_irq_status_v1(struct spmi_pmic_arb_bus *bus, u16 n)
 {
@@ -1516,6 +1729,14 @@ pmic_arb_irq_status_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return pmic_arb->wr_base + 0x104 + 0x1000 * n;
 }
 
+static void __iomem *
+pmic_arb_irq_status_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+
+	return pmic_arb->wr_base + 0x104 + 0x200 * n;
+}
+
 static void __iomem *
 pmic_arb_irq_clear_v1(struct spmi_pmic_arb_bus *bus, u16 n)
 {
@@ -1542,6 +1763,14 @@ pmic_arb_irq_clear_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return pmic_arb->wr_base + 0x108 + 0x1000 * n;
 }
 
+static void __iomem *
+pmic_arb_irq_clear_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+
+	return pmic_arb->wr_base + 0x108 + 0x200 * n;
+}
+
 static u32 pmic_arb_apid_map_offset_v2(u16 n)
 {
 	return 0x800 + 0x4 * n;
@@ -1557,6 +1786,12 @@ static u32 pmic_arb_apid_map_offset_v7(u16 n)
 	return 0x2000 + 0x4 * n;
 }
 
+static u32 pmic_arb_apid_map_offset_v8(u16 n)
+{
+	/* For v8, offset is from "chnl_map" base register, not "core". */
+	return 0x4 * n;
+}
+
 static void __iomem *
 pmic_arb_apid_owner_v2(struct spmi_pmic_arb_bus *bus, u16 n)
 {
@@ -1564,7 +1799,7 @@ pmic_arb_apid_owner_v2(struct spmi_pmic_arb_bus *bus, u16 n)
 }
 
 /*
- * For arbiter version 7, APID ownership table registers have independent
+ * For arbiter version 7 and 8, APID ownership table registers have independent
  * numbering space for each SPMI bus instance, so each is indexed starting from
  * 0.
  */
@@ -1574,6 +1809,12 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return bus->cnfg + 0x4 * (n - bus->base_apid);
 }
 
+static void __iomem *
+pmic_arb_apid_owner_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	return bus->apid_owner + 0x4 * (n - bus->base_apid);
+}
+
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
 	.get_core_resources	= pmic_arb_get_core_resources_v1,
@@ -1654,6 +1895,23 @@ static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.apid_owner		= pmic_arb_apid_owner_v7,
 };
 
+static const struct pmic_arb_ver_ops pmic_arb_v8 = {
+	.ver_str		= "v8",
+	.get_core_resources	= pmic_arb_get_core_resources_v8,
+	.get_bus_resources	= pmic_arb_get_bus_resources_v8,
+	.init_apid		= pmic_arb_init_apid_v8,
+	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
+	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
+	.offset			= pmic_arb_offset_v8,
+	.fmt_cmd		= pmic_arb_fmt_cmd_v2,
+	.owner_acc_status	= pmic_arb_owner_acc_status_v7,
+	.acc_enable		= pmic_arb_acc_enable_v8,
+	.irq_status		= pmic_arb_irq_status_v8,
+	.irq_clear		= pmic_arb_irq_clear_v8,
+	.apid_map_offset	= pmic_arb_apid_map_offset_v8,
+	.apid_owner		= pmic_arb_apid_owner_v8,
+};
+
 static const struct irq_domain_ops pmic_arb_irq_domain_ops = {
 	.activate = qpnpint_irq_domain_activate,
 	.alloc = qpnpint_irq_domain_alloc,
@@ -1731,6 +1989,12 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 	bus->spmic = ctrl;
 	bus->id = bus_index;
 
+	if (pmic_arb->ver_ops->get_bus_resources) {
+		ret = pmic_arb->ver_ops->get_bus_resources(pdev, node, bus);
+		if (ret)
+			return ret;
+	}
+
 	ret = pmic_arb->ver_ops->init_apid(bus, bus_index);
 	if (ret)
 		return ret;
@@ -1825,8 +2089,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		pmic_arb->ver_ops = &pmic_arb_v3;
 	else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v5;
-	else
+	else if (hw_ver < PMIC_ARB_VERSION_V8_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v7;
+	else
+		pmic_arb->ver_ops = &pmic_arb_v8;
 
 	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
 	if (err)
@@ -1875,6 +2141,7 @@ static void spmi_pmic_arb_remove(struct platform_device *pdev)
 static const struct of_device_id spmi_pmic_arb_match_table[] = {
 	{ .compatible = "qcom,spmi-pmic-arb", },
 	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
+	{ .compatible = "qcom,glymur-spmi-pmic-arb", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);

-- 
2.25.1


