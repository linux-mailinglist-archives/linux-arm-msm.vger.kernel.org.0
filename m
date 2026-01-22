Return-Path: <linux-arm-msm+bounces-90214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD/BFP5CcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:32:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C7468E62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F4097A2A3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A26A34AB05;
	Thu, 22 Jan 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3ZRJxEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9827346A0B;
	Thu, 22 Jan 2026 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091226; cv=none; b=WcTf65lzPQKUbzQhX1v9prEdMcHeylHRWIw3DOHb+7FZEuD33rPoT9duIrq9xszrRQU1lrNfhiCiXJCB66U3JetqEnXOc2Gc0rDf8YnRWVfAPOCUe+ep86tVsQNor4ZFJCDHzso6jL2OaLMugSwaDaC42tFn7rYUGiYsJMh3dr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091226; c=relaxed/simple;
	bh=fUwxz3ydpRhMyBoChVTw/KF4/LIDJ6fZK3ivdu8g9bA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2A4ox3Plg+CS47eRr0OxJDZAdTnZJTzh72c08kble6IPHwMx9xcZtY9vgJ2o+N4LxSLyZRy/dWq+p3hCEmgAwJN3p4ny9PZCQB16XanxAa2RJNsCJsKLCyyIGarPT1zVopCz12+2VsPMofM0o3H3LFNEIXrpYC9tSjubMvRbJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3ZRJxEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M840Fx2282653;
	Thu, 22 Jan 2026 14:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LSHNFL3tKNI
	7c8D8QgjJv8jXY7CgFs/Bf8DrUthXzxs=; b=h3ZRJxEU/cMkpvBUBxy9Q2qbSIF
	TnvT1+6Oj686hE75NI13JWUrNDphKkb+DJbmXksPPKNKEZO9FVOIIJ1Sxl6SYsPx
	un0YzL4TnTImEkD8fka0ER5n38tRWZplWlCcMwc3HTZh3i609P6BKXvLinSZWdzO
	W2nsw5T/hUKZDVk4NDVVlXcYRFCmGzfcktXJR2cUq4kvP1xcp6Wq2kBkDLwPuzHZ
	yDHs/G2eAdVroabn6sJnDgVDv2SusoYcvkZNFDiJX/F0qryuq3Jnzh8GmBqFMO5N
	SJx2uSB3xE4WnXFJ7957pQCqZ2ExTqk3tU65+h0pwP4vus5QHYqgIu9hU7g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fatjvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEDYn2003653;
	Thu, 22 Jan 2026 14:13:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gmypnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60MEDYox003646;
	Thu, 22 Jan 2026 14:13:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60MEDYpW003641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 7A24F5EC; Thu, 22 Jan 2026 19:43:33 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1 1/3] ufs: ufs-qcom: Add UFS ESI CPU affinity support
Date: Thu, 22 Jan 2026 19:43:29 +0530
Message-Id: <20260122141331.239354-2-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
References: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69723092 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=l0ib3MoQakANPgn6tzIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwNyBTYWx0ZWRfXyMhiPTK3lPIM
 R2MTu1/m6bzP1aygk/nlIdk/M6yO/+2RkB+ED0vXAsIufhv89+EU3SgTfBfywlMxUqqHPQ95lkn
 jegVEC7CNRDfnyAypshdTkUaesvgrNklKDr9r9TbZsw8tZODDwf6PmxbP7BoXER/Gf4etk5mACA
 l7hiSE4DZov/GKHSJyWxwLkwIYmECp0INi/rufv4pjfv0REaZiAGs+W87xiR+1EWm8PF5xkuuEU
 bjujRbxXz9ktHZLxPV6AHPiSRQMht9ESX+dMSjgeOsVNygs93zn3KDYuaJQ+gR+P5ymA+70Hh+w
 vimmua2w0rBlWdryjyxavoUOuq/BTEZu4f7keJonQasqU2ZrtLW2Z/1hj1cNC1vpX5xUjlZiBw5
 /U5k9kLmSjV0VmWA8BBhkudUnfLLdLxB4XIyKPOUz1YiF50g72hpDvFCcKCV5Pvvr6RKZtioL7v
 WgH1AyOeI6/vzBlvu4w==
X-Proofpoint-ORIG-GUID: XfXoFQuC5T4sqACsKDRgpdGmKaZ3zLFy
X-Proofpoint-GUID: XfXoFQuC5T4sqACsKDRgpdGmKaZ3zLFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90214-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 07C7468E62
X-Rspamd-Action: no action

Add Enhanced Shared Interrupt (ESI) CPU affinity support to improve
UFS performance on Qualcomm platforms.

By Default, the IRQ core route interrupts to a limited number of
cores while other cores remain idle. This patch enables dynamic
interrupt affinity adjustment for better performance tuning by
distributing ESI interrupts across all online CPUs in round-robin
fashion.

This reduces CPU contention and enables better performance optimization
on Qualcomm UFS controllers by utilizing all available online CPUs.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ebee0cc5313..c43bb75d208c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2070,6 +2070,55 @@ static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }

+/**
+ * ufs_qcom_set_esi_affinity - Set CPU affinity hints for ESI interrupts
+ * @hba: UFS host controller instance
+ *
+ * Sets CPU affinity hints for ESI interrupts to distribute them across
+ * online CPUs for better performance in round-robin fashion.
+ */
+static void ufs_qcom_set_esi_affinity(struct ufs_hba *hba)
+{
+	struct msi_desc *desc;
+	int ret, i = 0, nr_irqs = 0;
+	const cpumask_t *mask;
+	int cpu;
+
+	__msi_lock_descs(hba->dev);
+	/* Count the number of MSI descriptors */
+	msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
+		nr_irqs++;
+	}
+	__msi_unlock_descs(hba->dev);
+
+	if (nr_irqs == 0)
+		return;
+
+	__msi_lock_descs(hba->dev);
+	/* Set affinity hints for each interrupt in round-robin fashion */
+	msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
+		if (i >= nr_irqs)
+			break;
+
+		/* Distribute interrupts across online CPUs in round-robin */
+		cpu = cpumask_nth(i % num_online_cpus(), cpu_online_mask);
+		mask = get_cpu_mask(cpu);
+		if (!cpumask_subset(mask, cpu_online_mask)) {
+			dev_err(hba->dev, "Invalid CPU %d in map, using online CPUs\n",
+				cpu);
+			mask = cpu_online_mask;
+		}
+
+		ret = irq_set_affinity_hint(desc->irq, mask);
+		if (ret < 0)
+			dev_err(hba->dev, "Failed to set affinity hint to CPU %d for ESI IRQ %d, err = %d\n",
+				cpu, desc->irq, ret);
+
+		i++;
+	}
+	__msi_unlock_descs(hba->dev);
+}
+
 static int ufs_qcom_config_esi(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -2122,6 +2171,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 			    REG_UFS_CFG3);
 	}
 	ufshcd_mcq_enable_esi(hba);
+	ufs_qcom_set_esi_affinity(hba);
 	host->esi_enabled = true;
 	return 0;
 }
--
2.34.1


