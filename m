Return-Path: <linux-arm-msm+bounces-51221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C02A5EB06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1355C7AB48F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4E11FBC8E;
	Thu, 13 Mar 2025 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="luNogbAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E4B1FAC5F;
	Thu, 13 Mar 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741843035; cv=none; b=u/UVWNGmiU3nu2uOcc+H/ZzSHrflgOEvej9+cqRo45bJ+P0mYG3ZvuH/xqWhl3826yPI2AWSsCDQrtZhFxYU8BbdOc5gG8SRRbf5kH7/obsp/OltItwavfCeZ8yh9+yN6V4NkavlmUA0/kAGmdw+h0ghywf0UTnPGeB7e//4778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741843035; c=relaxed/simple;
	bh=pfEcnwtoBGfL5v3a/QE2n6zOgKgHLmMhs++9bmj3+vo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GoTms5RFPyekyRSKLwTFRxsiHy4E16tWxX3v+Um9xv5EvevfspPqhc1vHY6WsA5h3sirF1NdE58lZFeoggcvxA1dAgWL3CRJrQic09AgIiK9iwmOXkNqJnWE6nf7S1la15l97+Mwc5h6spmSA1cicp7upT6m2uX3l1bsTXcPfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=luNogbAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMsZrD009124;
	Thu, 13 Mar 2025 05:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2y2v+RBFtHqZvOj1TgxGn+Vh
	LKxqFsPsT2CXX1tbA3Y=; b=luNogbAE+Ixz8d51HVGpmDJw6ylTCYaWc3dsublU
	eRjB7gvLPdWObq+qEWjNKp2g6j6ilQngndKsXc2F4PNLPYiJy6ONbQ+AeRWONh0e
	nmo1MuDw8c2pUUCBX4fAOiCSI+GlzPYE44kBbxAloXzDzmTOkPEbhIT/c+pL2SU2
	RAGs3c1LW/q5aMMbk0SOmK7VkwSKIcIIDre275EN3pMWlvgvRXSFihF7i8n+65gT
	NLn4YL+r90zTAqUiimpiF2FBWGR5OmvFnEEAeK2hu1uYzKlgmFebKnPJ1p8pngC6
	Q90dHG/KqH0RFjjycHfU9U9e5iYMJ25b/U10B6S0VZ/bhA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rcktb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:17:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D5H9Go016518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:17:09 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 22:17:06 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V3 3/3] scsi: ufs-qcom: Add support for testbus registers
Date: Thu, 13 Mar 2025 10:46:35 +0530
Message-ID: <20250313051635.22073-4-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313051635.22073-1-quic_mapa@quicinc.com>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d26a56 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qEoxdu5ElFVaSqPk7CsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aMvaP6szKTDLUwK--G2XtnAdi8f4SlXN
X-Proofpoint-ORIG-GUID: aMvaP6szKTDLUwK--G2XtnAdi8f4SlXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=813 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130039

This patch introduces support for dumping testbus registers,
enhancing the debugging capabilities for UFS-QCOM drivers.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
Changes in v3:
- Annotated the 'testbus' declaration with __free.
- Converted the switch-statements into an array lookup.
- Introduced struct testbus_info{} for handling testbus switch-statements to an array lookup.
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/

---
 drivers/ufs/host/ufs-qcom.c | 53 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index fb9da04c0d35..c32b1268d299 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -17,6 +17,7 @@
 #include <linux/time.h>
 #include <linux/unaligned.h>
 #include <linux/units.h>
+#include <linux/cleanup.h>
 
 #include <soc/qcom/ice.h>
 
@@ -98,6 +99,24 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_MAX][0][0]		    = { 7643136,	819200 },
 };
 
+static const struct {
+	int nminor;
+	char *prefix;
+} testbus_info[TSTBUS_MAX] = {
+	[TSTBUS_UAWM]     = {32, "TSTBUS_UAWM "},
+	[TSTBUS_UARM]     = {32, "TSTBUS_UARM "},
+	[TSTBUS_TXUC]     = {32, "TSTBUS_TXUC "},
+	[TSTBUS_RXUC]     = {32, "TSTBUS_RXUC "},
+	[TSTBUS_DFC]      = {32, "TSTBUS_DFC "},
+	[TSTBUS_TRLUT]    = {32, "TSTBUS_TRLUT "},
+	[TSTBUS_TMRLUT]   = {32, "TSTBUS_TMRLUT "},
+	[TSTBUS_OCSC]     = {32, "TSTBUS_OCSC "},
+	[TSTBUS_UTP_HCI]  = {32, "TSTBUS_UTP_HCI "},
+	[TSTBUS_COMBINED] = {32, "TSTBUS_COMBINED "},
+	[TSTBUS_WRAPPER]  = {32, "TSTBUS_WRAPPER "},
+	[TSTBUS_UNIPRO]   = {256, "TSTBUS_UNIPRO "}
+};
+
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
 static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
 
@@ -1566,6 +1585,33 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	int i, j, nminor = 0, testbus_len = 0;
+	u32 *testbus __free(kfree) = NULL;
+	char *prefix;
+
+	testbus = kmalloc(256 * sizeof(u32), GFP_KERNEL);
+	if (!testbus)
+		return;
+
+	for (j = 0; j < TSTBUS_MAX; j++) {
+		nminor = testbus_info[j].nminor;
+		prefix = testbus_info[j].prefix;
+		host->testbus.select_major = j;
+		testbus_len = nminor * sizeof(u32);
+		for (i = 0; i < nminor; i++) {
+			host->testbus.select_minor = i;
+			ufs_qcom_testbus_config(host);
+			testbus[i] = ufshcd_readl(hba, UFS_TEST_BUS);
+			usleep_range(100, 200);
+		}
+		print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET,
+				16, 4, testbus, testbus_len, false);
+	}
+}
+
 static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
 {
 	/* sleep intermittently to prevent CPU hog during data dumps. */
@@ -1680,9 +1726,14 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	/* ensure below dumps occur only in task context due to blocking calls. */
 	if (in_task()) {
-		/* Dump MCQ Host Vendor Specific Registers */
+		/* dump MCQ Host Vendor Specific Registers */
 		if (hba->mcq_enabled)
 			ufs_qcom_dump_mcq_hci_regs(hba);
+
+		/* sleep a bit intermittently as we are dumping too much data */
+		ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
+		usleep_range(1000, 1100);
+		ufs_qcom_dump_testbus(hba);
 	}
 }
 
-- 
2.17.1


