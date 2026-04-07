Return-Path: <linux-arm-msm+bounces-102244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9CRSBpV81Wl96wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:52:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A043B5232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCABB302542F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 21:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7437F014;
	Tue,  7 Apr 2026 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyYSHebS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQQb/afg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A358537E2FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775598733; cv=none; b=MF2qd/nhMSwrOaczEzWi4FwS/2o5LxYHmkhZ11ASMDg3roxs8oA2BhXJ37Ftsx4v37LN5obgPnpHyPgS0YOm/QZanI0URl+Sw59uWGv2g4eNdXAtSEq7ZNCbHbhgnb7pbr7lepGNgfugUkNXCUYvZJePDUQ97BuZaiKjupIPub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775598733; c=relaxed/simple;
	bh=VRvociPdZzkn2LBvWUuRQKKAFjnlqZ3T0gECO7AzEzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6ZZMfttg2LHTpa9W0jo+oFb3UOzzY3xIixWenfR/i2s5724oF1SNRUBMtzN33Jdxi4Qqq2ytQfi70fihJBTEP4GeSfoWRkrRQHtV0WrYeJQ0BHoA98cFkCzYuUfj6eLWKRr9x68pWSkLO5xzhrRuQq7XSJul9SFNnJhUbd9k1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyYSHebS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQQb/afg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Jlo8K1314539
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 21:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbkX5Opmvuv/ESNdNx9guci0IYixc6Yeg821sutZxMo=; b=RyYSHebSPUEGFk7q
	EHFqUC1CuxPX5k2MpWb3mdZIHB2QDEvsmoqjXfBz66w9YQrCbX0ndVpwDD5FL/Dw
	2uP7BdZqinrmBQJKyXBdGDfWS09afSmI69mVZ1PAvfm7qnCFtcWgQX3mM48OqKos
	ufwBSmSsBUU42dPDtD4ucigEGfYXezUjWlHHjHQSyvMen/yqT8MbZ2wtHwsXv/ER
	RwKYyApoOhzUOOKrokQ3aue4Theasz07TeXVG4ruen2f4K+MzjfRWb4wOxCW+Qhm
	4lhyyjrMBwi3xwPJ7N1/8+RZPzvoaeVEpD3rIvQW5fmEbrhibVHTcLb7ZqGJ5VG5
	jhq2iQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6gb2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 21:52:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127133794b6so9085907c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775598729; x=1776203529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbkX5Opmvuv/ESNdNx9guci0IYixc6Yeg821sutZxMo=;
        b=YQQb/afg0mp/SS56egw8UdsxMWcaV0yNpH1/JBCpwHkl5zTTZRuOkyebOBcV+rtPCg
         T+HMrjZ64xCTJf0pb3yYTDYDquHQfHk4ajVAdXvd8d1m/d8Bx1Sw5t8rE6PdWtb3FCOn
         zI85uLIS7uo5Lob8pUA6cC1fhKe0q7C4KUWn1E3qnlYk/EQ3jGwkCdRdS3lEc+5WNYz+
         wEJWJDTENw5wp4z/H9/VEVzdwVkeF7dOPsPp3Q4J971BQdFhujOoZ8IIehX0Nd6z76Rr
         SWALB/8yZRqNkl3xD1hj2N2UsrNUlEU3ATuTkxeu6RH4lrWC/6bibGaKYjG3GpiejgUP
         nFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775598729; x=1776203529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbkX5Opmvuv/ESNdNx9guci0IYixc6Yeg821sutZxMo=;
        b=oNG2uUF2ne/GlvcspyXeJGAaG47doASmfg4G+P0Ql7CzYvrlpU07pBRxVVDUWDwZzt
         LVt7nq02YAxkkFXbBrGPT2YJymFtM7kp9JKo4GpjrUr8Q/z3G/W58Yi9SI2UvbObvZka
         8DlatKbACAP26ZYWyz/Tv700Gx6FQda9TB2Cxf+UA8UovAr5pIYMHlVHGkGM3M+wnJ0l
         GJsKUlNrFK6hfmSxC/G9xBmyGi+viP7u/Up8raA4jiY8ydKrfy4i/B7FMWLVUdhvV9XX
         X+geJGvaSsEWZBvTKbTTG3U1wvTYafPBeiggKBpCjsAliMoO9rq1Aa/QGk3fLzRAAxsn
         ELJQ==
X-Gm-Message-State: AOJu0YxiRpOgROhE/0L3CVBfPnyeMB800Javdn4vKb1Om/BtPtvZOGjv
	aZNl7gEjkZN2SjStazC1aTWmGcHWH4r2AkoW/VEF5d6JJO56w23vY26IRFNBfYP8Fc62rubfYsT
	fLHceKZn6zMz/CT3L2FKIyXM87x+YIHk4UBoyAv1gQ4AG2mD+LVkXTokfhiqOLuUXfao=
X-Gm-Gg: AeBDieuwWCRvttLK4NkYKgwZ/Qjd8NTsvMsE9sIWvbkcE8hNHeOq7GGLqFtSMN/w9y5
	gh6rYWlKJhwJwfdbfmZqEp1gdXhj3Uv9lJ2N3IGa3Gp/I7V94JjtLCsgrV2tXszOxPU2NL/Gkkv
	VJRVDtZysFyC2aQNOqPysgYImghaqnXxVgfgJzT4wcsL/SEXQudDuNNirsbs/bz79UiTAkqIgVA
	GPjpSvJ1WDcZ7E1+XUfawIW/H2wSNEh6xPXKBafrDVSXOJTdfjDEIhtSZwMJxbIbJ1sPANggG9e
	NMRu6fvwPrEe42Lh4kPwPPCyyhWIBa2vf1idhE3itY+DA5ZmkEzu7GcUxrlGoSi0eujyaxW8+u2
	rvX45+c6XKSVC37rvh+cfVLgwxqur4CceuwrI3hxBQ/1MnNOQyPhh8W6hDBaT67hnsafPdYoGCg
	==
X-Received: by 2002:a05:7022:203:b0:119:e56c:18a5 with SMTP id a92af1059eb24-12bfb70bb8cmr9416573c88.13.1775598728992;
        Tue, 07 Apr 2026 14:52:08 -0700 (PDT)
X-Received: by 2002:a05:7022:203:b0:119:e56c:18a5 with SMTP id a92af1059eb24-12bfb70bb8cmr9416545c88.13.1775598728235;
        Tue, 07 Apr 2026 14:52:08 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm16224123c88.2.2026.04.07.14.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:52:07 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:51:48 -0700
Subject: [PATCH v2 2/3] soc: qcom: llcc-qcom: get SCT descriptors from
 fw-populated memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-external_llcc_changes2set-v2-2-b5017ce2020b@oss.qualcomm.com>
References: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
In-Reply-To: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775598723; l=14020;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=VRvociPdZzkn2LBvWUuRQKKAFjnlqZ3T0gECO7AzEzs=;
 b=n0TiBSuLo+qhCiWOhTgCk0zfuR7u0nm9C37W5zwK/YhpUxyT1a/RL1+l3wCgIQBmIRFRNNt3P
 W263K0ALZOlAwFdIeGkilCFTSsj7pXebBa1V9qZvRBNERK8Qu4CfzW7
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Proofpoint-ORIG-GUID: DUA5e9QJQDuXcp_vwOkuYMio8mX9Lv2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIwMCBTYWx0ZWRfX00Kfots6X52Z
 HfqYdf1m12Qr+mDVEupsq43C6pDT36geoXTeGfO0S4Cwo4Y4MGOwuyJiVnf2n4xZ9+94rmljFW1
 VcVccpBCCnYPwUpDapGaMKGAgo58C4hQILWNOcciOiAJw3jskIDV56FfpZPnwkLd9QoFlTN+8Ef
 LBOIM61gANzsAUYPO4IvJ33SL7I6dp+YddSIkFnbc01NO1RnKtZeOcCLwGjl7keP3bJbWQ76+KA
 88Qbj0wRMWfFbQkxY02iiPXiEOmNpSYnbs74Yu5dCNhssMgfL48XJcSBVbzYrh53kkeTXO6Izus
 eRbjAoI7iN6mPQU5N0O+/fKHIA4CSADzQF8Vd8i8dPKlQul1HP868T4D8GRduBZj6+K5dtz7ygd
 70X0T/Xb8ZbjdlcEvARfpyOwp0sLVa50UAm9aQra/802hQoyw5aVZaw1advdVtMvpKVu+FyJIPe
 Phm6IkNgCY7JM1ISZHg==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d57c89 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mueQnyBuSmwt3Ye5OMMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: DUA5e9QJQDuXcp_vwOkuYMio8mX9Lv2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070200
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102244-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7A043B5232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Retrieve System Cache Table (SCT) descriptors from a shared memory
region populated by firmware.

SCT initialization and programming are performed entirely by firmware
outside of Linux. The LLCC driver only consumes the pre-initialized
descriptor data and does not configure SCT itself.

Support this mechanism for future SoCs that provide SCT programming
via firmware.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 269 ++++++++++++++++++++++++++++++++-----
 include/linux/soc/qcom/llcc-qcom.h |   8 +-
 2 files changed, 240 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 0161ceec8842..f8cd35b205eb 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -14,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/regmap.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -76,6 +76,12 @@
 #define LLCC_VERSION_4_1_0_0          0x04010000
 #define LLCC_VERSION_6_0_0_0          0X06000000
 
+#define SLC_SCT_MEM_LAYOUT_VERSION1   1 /* SCT Memory layout version */
+#define SLC_SCT_DONE                  0x00534354444f4e45 /* SCT programming OK */
+#define SLC_SCT_FAIL                  0x005343544641494c /* SCT programming failed */
+#define SLC_SCT_NAME_LEN              15
+#define SLC_SCT_SLICE_ACT_ON_BOOT     BIT(25)
+
 /**
  * struct llcc_slice_config - Data associated with the llcc slice
  * @usecase_id: Unique id for the client's use case
@@ -143,6 +149,87 @@ struct llcc_slice_config {
 	u32 parent_slice_id;
 };
 
+/*
+ * struct slc_sct_error - Represents SCT error
+ * @code: FW code status
+ * @param: Holds the SCT programming error
+ */
+struct slc_sct_error {
+	__le64 code;
+	__le64 param;
+} __packed;
+
+/*
+ * struct slc_sct_status - SCT programming status
+ * @program_status: Indicates programming success or failure
+ * @version: SCT mem layout version
+ * @error: Error enum and its param
+ */
+struct slc_sct_status {
+	__le64 program_status;
+	/* Use the lower 8 bits */
+	__le64 version;
+	struct slc_sct_error error;
+} __packed;
+
+/*
+ * struct slc_sct_details - SCT details
+ * @revision:  revision of the SCT table
+ * @name: name of the SCT table
+ */
+struct slc_sct_details {
+	u8 revision;
+	char name[SLC_SCT_NAME_LEN];
+} __packed;
+
+/*
+ * struct tcm_mem_info - SC TCM Shared memory details
+ * @is_present: is TCM region present
+ * @offset: offset of TCM shared memory details
+ */
+struct slc_tcm_mem_info {
+	__le32 is_present;
+	__le32 offset;
+} __packed;
+
+/*
+ * struct slc_sct_slice_desc - Slice descriptor definition used in shmem
+ * @slice_id:  SCID of the slice
+ * @usecase_id: Usecase ID of the slice
+ * @slice_properties:
+ *	slice_size: Contains the slice descriptor size - 20 bit wide
+ *	rsvd: Reserved space - 4 bit wide
+ *	flags: Flags for descriptors - 3 bit wide
+ *		MPAM SCID: Bit 24
+ *		Activate on boot: Bit 25
+ *		Non-HLOS SCID: Bit 26
+ *	HWMutex: Ensures only one processor (CPU or MCU) at a time can
+ *	access the LLCC hardware resources - 5 bit wide
+ */
+struct slc_sct_slice_desc {
+	__le16 slice_id;
+	__le16 usecase_id;
+	__le32 slice_properties;
+} __packed;
+
+/*
+ * struct slc_sct_mem - Shared memory structure
+ * @sct_status: Status of SCT programming
+ * @sct_details: Sct revision and name details
+ * @tcm_mem_info: TCM shared memory presence & offset info
+ * @slice_descs_count: Number of slice desc present in SCT
+ * @scid_max: Maximum no. of SCIDs supported
+ * @slice_descs: Array of SCT slice desc
+ */
+struct slc_sct_mem {
+	struct slc_sct_status sct_status;
+	struct slc_sct_details sct_details;
+	struct slc_tcm_mem_info tcm_mem_info;
+	__le32 slice_descs_count;
+	__le32 scid_max;
+	struct slc_sct_slice_desc slice_descs[] __counted_by_le(slice_descs_count);
+} __packed;
+
 struct qcom_llcc_config {
 	const struct llcc_slice_config *sct_data;
 	const u32 *reg_offset;
@@ -4141,6 +4228,15 @@ static const u32 llcc_v6_reg_offset[] = {
 	[LLCC_TRP_WRS_CACHEABLE_EN]	= 0x00042088,
 };
 
+static const struct qcom_llcc_config hawi_sct_cfg[] = {
+	{
+		.sct_data	= NULL,
+		.size		= 0,
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config kaanapali_cfg[] = {
 	{
 		.sct_data	= kaanapali_data,
@@ -4397,6 +4493,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	},
 };
 
+static const struct qcom_sct_config hawi_sct_cfgs = {
+	.llcc_config	= hawi_sct_cfg,
+	.num_config	= ARRAY_SIZE(hawi_sct_cfg),
+};
+
 static const struct qcom_sct_config kaanapali_cfgs = {
 	.llcc_config	= kaanapali_cfg,
 	.num_config	= ARRAY_SIZE(kaanapali_cfg),
@@ -4533,23 +4634,20 @@ static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
  */
 struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 {
-	const struct llcc_slice_config *cfg;
-	u32 sz, i;
-
 	if (IS_ERR(drv_data))
 		return ERR_CAST(drv_data);
 
-	cfg = drv_data->cfg;
-	sz = drv_data->cfg_size;
+	if (IS_ERR_OR_NULL(drv_data->desc))
+		return ERR_PTR(-ENODEV);
 
-	for (i = 0; cfg && i < sz; i++, cfg++)
-		if (cfg->usecase_id == uid)
-			break;
+	for (u32 i = 0; i < drv_data->cfg_size; i++) {
+		if (uid == drv_data->desc[i].uid)
+			return &drv_data->desc[i];
+	}
 
-	if (i == sz)
-		return ERR_PTR(-ENODEV);
+	dev_err(drv_data->dev, "Failed to get slice desc for uid: %u\n", uid);
 
-	return &drv_data->desc[i];
+	return ERR_PTR(-EINVAL);
 }
 EXPORT_SYMBOL_GPL(llcc_slice_getd);
 
@@ -5029,6 +5127,12 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
+	for (i = 0; i < sz; i++) {
+		drv_data->desc[i].uid = llcc_table[i].usecase_id;
+		drv_data->desc[i].slice_id = llcc_table[i].slice_id;
+		drv_data->desc[i].slice_size = llcc_table[i].max_cap;
+	}
+
 	if (drv_data->version >= LLCC_VERSION_6_0_0_0) {
 		for (i = 0; i < sz; i++) {
 			ret = _qcom_llcc_cfg_program_v6(&llcc_table[i], cfg);
@@ -5064,6 +5168,101 @@ static int qcom_llcc_get_cfg_index(struct platform_device *pdev, u8 *cfg_index,
 	return ret;
 }
 
+static int qcom_llcc_verify_fw_config(struct device *dev,
+				      const struct slc_sct_mem *slc_mem)
+{
+	u64 program_status;
+
+	program_status = le64_to_cpu(slc_mem->sct_status.program_status);
+
+	if (program_status == SLC_SCT_DONE) {
+		u32 desc_count = le32_to_cpu(slc_mem->slice_descs_count);
+		u32 scid_max = le32_to_cpu(slc_mem->scid_max);
+
+		if (desc_count > scid_max) {
+			dev_err(dev, "Descriptor count above max limit (%u > %u)\n",
+				desc_count, scid_max);
+			return -EINVAL;
+		}
+
+		u8 revision = slc_mem->sct_details.revision;
+		char name_buf[SLC_SCT_NAME_LEN];
+
+		memcpy(name_buf, slc_mem->sct_details.name,
+		       SLC_SCT_NAME_LEN - 1);
+		name_buf[SLC_SCT_NAME_LEN - 1] = '\0';
+
+		dev_dbg(dev, "SCT init: desc_count=%u, rev=%u, name=%s\n",
+			desc_count, revision, name_buf);
+
+		return 0;
+	} else if (program_status == SLC_SCT_FAIL) {
+		u8 version = (u8)(le64_to_cpu(slc_mem->sct_status.version));
+		u64 code = le64_to_cpu(slc_mem->sct_status.error.code);
+		u64 param = le64_to_cpu(slc_mem->sct_status.error.param);
+
+		if (version == SLC_SCT_MEM_LAYOUT_VERSION1) {
+			dev_err(dev, "SCT init failed: code = %llu, param = %llu, version = 0x%x\n",
+				code, param, version);
+		} else {
+			dev_err(dev, "Found unsupported version %u\n", version);
+		}
+	} else {
+		dev_err(dev, "Unknown SCT Initialization error\n");
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_llcc_get_fw_config(struct platform_device *pdev)
+{
+	const struct slc_sct_mem *slc_mem = NULL;
+	const struct slc_sct_slice_desc *memslice;
+	struct device *dev = &pdev->dev;
+	u32 slice_properties;
+	struct resource res;
+	u32 i, sz;
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(dev, "Unable to locate DT /reserved-memory resource\n");
+		return ret;
+	}
+
+	slc_mem = devm_memremap(dev, res.start, resource_size(&res), MEMREMAP_WB);
+	if (!slc_mem) {
+		dev_err(dev, "Failed to memremap SLC shared memory\n");
+		return -ENOMEM;
+	}
+
+	ret = qcom_llcc_verify_fw_config(dev, slc_mem);
+	if (ret)
+		return ret;
+
+	sz = le32_to_cpu(slc_mem->slice_descs_count);
+
+	drv_data->desc = devm_kcalloc(dev, sz, sizeof(struct llcc_slice_desc),
+				      GFP_KERNEL);
+	if (!drv_data->desc)
+		return -ENOMEM;
+
+	for (i = 0; i < sz; i++) {
+		memslice = &slc_mem->slice_descs[i];
+		drv_data->desc[i].slice_id = le16_to_cpu(memslice->slice_id);
+		drv_data->desc[i].uid = le16_to_cpu(memslice->usecase_id);
+		slice_properties = le32_to_cpu(memslice->slice_properties);
+		/* Set refcount to 1 if FW already activated this descriptor */
+		if (FIELD_GET(SLC_SCT_SLICE_ACT_ON_BOOT, slice_properties))
+			refcount_set(&drv_data->desc[i].refcount, 1);
+	}
+
+	drv_data->cfg = NULL;
+	drv_data->cfg_size = sz;
+
+	return 0;
+}
+
 static void qcom_llcc_remove(struct platform_device *pdev)
 {
 	/* Set the global pointer to a error code to avoid referencing it */
@@ -5096,8 +5295,6 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	struct platform_device *llcc_edac;
 	const struct qcom_sct_config *cfgs;
 	const struct qcom_llcc_config *cfg;
-	const struct llcc_slice_config *llcc_cfg;
-	u32 sz;
 	u8 cfg_index;
 	u32 version;
 	struct regmap *regmap;
@@ -5190,32 +5387,31 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 		}
 	}
 
-	llcc_cfg = cfg->sct_data;
-	sz = cfg->size;
-	drv_data->desc = devm_kcalloc(dev, sz, sizeof(struct llcc_slice_desc), GFP_KERNEL);
-	if (!drv_data->desc) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	mutex_init(&drv_data->lock);
+	if (!cfg->size) {
+		ret = qcom_llcc_get_fw_config(pdev);
+		if (ret)
+			goto err;
+	} else {
+		drv_data->cfg = cfg->sct_data;
+		drv_data->cfg_size = cfg->size;
+		drv_data->desc = devm_kcalloc(dev, cfg->size,
+					      sizeof(struct llcc_slice_desc), GFP_KERNEL);
 
-	for (i = 0; i < sz; i++) {
-		drv_data->desc[i].slice_id = llcc_cfg[i].slice_id;
-		drv_data->desc[i].slice_size = llcc_cfg[i].max_cap;
-		refcount_set(&drv_data->desc[i].refcount, 0);
+		if (!drv_data->desc) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ret = qcom_llcc_cfg_program(pdev, cfg);
+		if (ret)
+			goto err;
 	}
 
-	drv_data->cfg = llcc_cfg;
-	drv_data->cfg_size = sz;
+	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
 	drv_data->edac_reg_offset = cfg->edac_reg_offset;
 	drv_data->ecc_irq_configured = cfg->irq_configured;
-	mutex_init(&drv_data->lock);
-	platform_set_drvdata(pdev, drv_data);
-
-	ret = qcom_llcc_cfg_program(pdev, cfg);
-	if (ret)
-		goto err;
-
-	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
+	drv_data->dev = dev;
 
 	/*
 	 * On some platforms, the access to EDAC registers will be locked by
@@ -5231,6 +5427,8 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 			dev_err(dev, "Failed to register llcc edac driver\n");
 	}
 
+	platform_set_drvdata(pdev, drv_data);
+
 	return 0;
 err:
 	drv_data = ERR_PTR(-ENODEV);
@@ -5239,6 +5437,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
+	{ .compatible = "qcom,hawi-llcc", .data = &hawi_sct_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 227125d84318..b5e917154998 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -90,11 +90,13 @@
 /**
  * struct llcc_slice_desc - Cache slice descriptor
  * @slice_id: llcc slice id
+ * @uid: Unique ID associated with the llcc device
  * @slice_size: Size allocated for the llcc slice
  * @refcount: Atomic counter to track activate/deactivate calls
  */
 struct llcc_slice_desc {
 	u32 slice_id;
+	u32 uid;
 	size_t slice_size;
 	refcount_t refcount;
 };
@@ -147,6 +149,7 @@ struct llcc_edac_reg_offset {
 
 /**
  * struct llcc_drv_data - Data associated with the llcc driver
+ * @dev: device back-pointer for this llcc instance
  * @regmaps: regmaps associated with the llcc device
  * @bcast_regmap: regmap associated with llcc broadcast OR offset
  * @bcast_and_regmap: regmap associated with llcc broadcast AND offset
@@ -157,10 +160,11 @@ struct llcc_edac_reg_offset {
  * @num_banks: Number of llcc banks
  * @ecc_irq: interrupt for llcc cache error detection and reporting
  * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
- * @desc: Array pointer of pre-allocated LLCC slice descriptors
  * @version: Indicates the LLCC version
+ * @desc: Array pointer of pre-allocated LLCC slice descriptors
  */
 struct llcc_drv_data {
+	struct device *dev;
 	struct regmap **regmaps;
 	struct regmap *bcast_regmap;
 	struct regmap *bcast_and_regmap;
@@ -183,7 +187,7 @@ struct llcc_drv_data {
 struct llcc_slice_desc *llcc_slice_getd(u32 uid);
 
 /**
- * llcc_slice_putd - llcc slice descritpor
+ * llcc_slice_putd - llcc slice descriptor
  * @desc: Pointer to llcc slice descriptor
  */
 void llcc_slice_putd(struct llcc_slice_desc *desc);

-- 
2.34.1


