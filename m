Return-Path: <linux-arm-msm+bounces-53380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700DA7E175
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 16:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1BAA16E6CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BFF1DE3B6;
	Mon,  7 Apr 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XAgBa6jY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942401DE2B7;
	Mon,  7 Apr 2025 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035698; cv=none; b=eIzfJE5tuauXkjdode6uWKRCnLaioHJhn8m/r9Wze/0htIIK0tLkN05hXeoVxL0NPAdSw513XPBZ9j3TKm0nzufmXhnjFu+8qYUz2AkfkTchkL/pFWQLmJAdJyIffjal67h1c9Ill8RnlxBJGdlt08cHMECSiDGrdfH+prDQXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035698; c=relaxed/simple;
	bh=WMZdYMqeble+5ENbltFw5oBDAOlyqpx8sxT8Fz2ymhU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYlgEz9oTYW63wqQ9x3IyGfksAPzggqoZ1Bkvshlij1x/C8K6CXuunDmQea5GVnbB7PAYZgiZ8iU6gew66m0+BEVMiasO+CsTW7aEiWJLuTwWKC9pqLo5RTZy/FbnRR43vNL1wxxebYAqR+UnQwKuigIM3qjwcaP9Ux4kxwRbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XAgBa6jY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dvTe002096;
	Mon, 7 Apr 2025 14:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G9ETNGdJgbFJJHZriYwEjq0a
	5zCxwqiX1YmqyMf11Js=; b=XAgBa6jYGMB0WqQLRugf40WbaCMqZZJwCyMsLDkU
	LXo8406NI4e8CeHDxiAmYhGHLb+aLS/EjKcylwBoB5dU+HnfACRUa1GD4pMdq8Jk
	HEaQtHH2kmydwpJshyM23xa8IZLYmLP+xevDJb2wweghoNIJ83Ipg+pisQE89Goz
	08j/NRhScWXHUPdLsa9nU79J8fj3b7d3tfcGOljCEIAhrFdfceEB4yBQWd1qQ1IL
	1ATV2VcKbvE1M9m3scJNLqwvvu7bjbyvzzfLbSXa4GiQ3ITLe8irS5/jgdF8Yvad
	jJVfEejr5Ron6jVS7GFh+K1rTRdz5AV16jEgZIxjnoDCUA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtavg98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 14:21:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 537ELVDM026359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 14:21:31 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 07:21:27 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V6 2/3] scsi: ufs-qcom: Add support to dump MCQ registers
Date: Mon, 7 Apr 2025 19:51:09 +0530
Message-ID: <20250407142110.16925-3-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250407142110.16925-1-quic_mapa@quicinc.com>
References: <20250407142110.16925-1-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: _1KhEidujFBpVQb5QGP9ZaBhSa7GUxdb
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f3df6b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=9gNdh71IRGoVKlRnfDUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _1KhEidujFBpVQb5QGP9ZaBhSa7GUxdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=915 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070101

Add support to dump UFS MCQ registers to enhance debugging capabilities
for the Qualcomm UFS Host Controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 83 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 028833acb3db..3a8eac62967e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1542,6 +1542,77 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
 	return 0;
 }
 
+int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
+		     const char *prefix, enum ufshcd_res id)
+{
+	u32 *regs __free(kfree) = NULL;
+	size_t pos;
+
+	if (offset % 4 != 0 || len % 4 != 0)
+		return -EINVAL;
+
+	regs = kzalloc(len, GFP_ATOMIC);
+	if (!regs)
+		return -ENOMEM;
+
+	for (pos = 0; pos < len; pos += 4)
+		regs[pos / 4] = readl(hba->res[id].base + offset + pos);
+
+	print_hex_dump(KERN_ERR, prefix,
+			len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,
+				16, 4, regs, len, false);
+
+	return 0;
+}
+
+static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
+{
+	/* voluntarily yield the CPU to prevent CPU hog during data dumps */
+	/* RES_MCQ_1 */
+	ufs_qcom_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0", RES_MCQ);
+	cond_resched();
+
+	/* RES_MCQ_2 */
+	ufs_qcom_dump_regs(hba, 0x400, 256 * 4, "MCQ HCI 1da0400-1da07f0", RES_MCQ);
+	cond_resched();
+
+	/*RES_MCQ_VS */
+	ufs_qcom_dump_regs(hba, 0x0, 5 * 4, "MCQ VS 1da4000-1da4010", RES_MCQ_VS);
+	cond_resched();
+
+	/* RES_MCQ_SQD_1 */
+	ufs_qcom_dump_regs(hba, 0x0, 256 * 4, "MCQ SQD 1da5000-1da53f0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_2 */
+	ufs_qcom_dump_regs(hba, 0x400, 256 * 4, "MCQ SQD 1da5400-1da57f0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_3 */
+	ufs_qcom_dump_regs(hba, 0x800, 256 * 4, "MCQ SQD 1da5800-1da5bf0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_4 */
+	ufs_qcom_dump_regs(hba, 0xc00, 256 * 4, "MCQ SQD 1da5c00-1da5ff0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_5 */
+	ufs_qcom_dump_regs(hba, 0x1000, 256 * 4, "MCQ SQD 1da6000-1da63f0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_6 */
+	ufs_qcom_dump_regs(hba, 0x1400, 256 * 4, "MCQ SQD 1da6400-1da67f0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_7 */
+	ufs_qcom_dump_regs(hba, 0x1800, 256 * 4, "MCQ SQD 1da6800-1da6bf0", RES_MCQ_SQD);
+	cond_resched();
+
+	/* RES_MCQ_SQD_8 */
+	ufs_qcom_dump_regs(hba, 0x1c00, 256 * 4, "MCQ SQD 1da6c00-1da6ff0", RES_MCQ_SQD);
+	cond_resched();
+}
+
 static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 {
 	u32 reg;
@@ -1600,6 +1671,18 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	reg = ufs_qcom_get_debug_reg_offset(host, UFS_DBG_RD_REG_TMRLUT);
 	ufshcd_dump_regs(hba, reg, 9 * 4, "UFS_DBG_RD_REG_TMRLUT ");
+
+	if (hba->mcq_enabled) {
+		reg = ufs_qcom_get_debug_reg_offset(host, UFS_RD_REG_MCQ);
+		ufshcd_dump_regs(hba, reg, 64 * 4, "HCI MCQ Debug Registers ");
+	}
+
+	/* ensure below dumps occur only in task context due to blocking calls. */
+	if (in_task()) {
+		/* Dump MCQ Host Vendor Specific Registers */
+		if (hba->mcq_enabled)
+			ufs_qcom_dump_mcq_hci_regs(hba);
+	}
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index a5bf1282ddbe..6087fd1534b4 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -50,6 +50,8 @@ enum {
 	 */
 	UFS_AH8_CFG				= 0xFC,
 
+	UFS_RD_REG_MCQ                          = 0xD00,
+
 	REG_UFS_CFG3				= 0x271C,
 
 	REG_UFS_DEBUG_SPARE_CFG			= 0x284C,
-- 
2.17.1


