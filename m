Return-Path: <linux-arm-msm+bounces-90215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EzbCdM4cmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:48:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A65681C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 156C07C2AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A252A34D4FA;
	Thu, 22 Jan 2026 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDvzDNDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265A34A78D;
	Thu, 22 Jan 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091227; cv=none; b=UVDuyfS8aFmkDWlr9TxSDrIMsO5hN/KXL2euJ/z93iJtaxvaAVkW+NF9gcftJfzDGJYglybzA3CWOmE6XvM1CfW2l319rPPUt6yo1nIj/RGhrWJO57SuKpxxbH3ob+G5DlL5OsyjeNm2zbM2miPq4Rg8zH0gStH9xkMLxfJwXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091227; c=relaxed/simple;
	bh=rvbMOzhV/pqqIVLf0z4e2+FBomHlnIj9UpbG0L3Kih4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L2FZ8YkuJSC6E764PqPO1/ZIdLG+UZNHU2hmgCn1jKtNS4VJn7Lxx/mKPa9J+9gf2hkjuYiYMVraX1ChTo0iUMUtDc0eB2fziCJ451YQTOWKWBLsLHbj/wdqR5wZyboVkzYgC4C6EC+unXseqIsTst+ykHJEDfgbF/2Bl6k4h7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDvzDNDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MCTxOw3902080;
	Thu, 22 Jan 2026 14:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ImuYD66sVwW
	N+Mt6iFHeG880YkzyHX+kIKXxIJIAedM=; b=kDvzDNDEaDkchNLtC3qnnACLuNX
	NFQFWLlwdn/wK2V/Jl9Jbo2F9d2zu1rD2hxE2Z5JLF/TXbuWN7qnEab5/CvCrPzV
	hLRj17cM8482h9BAwC/HuyqRqhNocQMGRIqpykuswp4/e957yVkChh4iI/7IhoUI
	dro8CCUH95QIq+r0hboK38BJAe2M04TQe2TgC1bAq6GeUSyMcGzzeWzmtQ/a0BMR
	4DH/8tUHJJDK9wmldGvnI1/Omm0Gc702brALtMaRzWJ7BlmC/oKJVe2gteBMnLYN
	5MbdkH4/wnmGSFcxr2Uojc8Ie494f22nSQhGc6+AAPcuNJSTZ+7srjWpTGQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khk3gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEDZFU003667;
	Thu, 22 Jan 2026 14:13:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gmypnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:35 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60MEDX33003636;
	Thu, 22 Jan 2026 14:13:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60MEDYOK003652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id EE09D5EE; Thu, 22 Jan 2026 19:43:33 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1 2/3] ufs: ufs-qcom: Align programming sequence for UFS controller v6.2
Date: Thu, 22 Jan 2026 19:43:30 +0530
Message-Id: <20260122141331.239354-3-nitin.rawat@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwNyBTYWx0ZWRfXyPkm0zcpsA/s
 BsghmgSmJf85Y/r70trk+SPuq1lI3vr0czmKQIeP+K+s9w1YbFKvPYkUFINr+pO9fqHiThGeCx9
 denV67OtdT49uRuLyGFcitA2WqB/vp09uraW2KipxqSB9g1TPa//1/9zW0I0+VTn8H+243+bWS/
 lvnoSi/lG0hNiochai63IFdBwAiOPncLF/91TzoWt7SBJW6LhVK3lgfS5YHT/ySK4CNkjLNQ/AC
 ZWp9X6zjjzgImfgx2WhYGXNWQXozBtQ5zFelAIAVxIX2jX4V0JWzGkfN5CPxNK7aecl9GyEnMTm
 dbl+Ml54g2sKIP0tWg7zzCzqsRc9AnbpBq4g4U2udGuH60AvwLqrfyB/nkTmIhQOvDgdUqYylho
 i046zYZtqP4rUJx+SSlicaS8HkQnsutzE+ed/x0Y+tqnd6xZEwELLK6NkNhCIeD40Yuc4Zgk1hE
 ccy1txqZSzecZZ4D2gw==
X-Proofpoint-ORIG-GUID: DcObYPgQbxIMDDo9NVkkgdFEvajrAsQW
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=69723092 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HW2gPmhGDcn8-JjtCIgA:9
X-Proofpoint-GUID: DcObYPgQbxIMDDo9NVkkgdFEvajrAsQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
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
	TAGGED_FROM(0.00)[bounces-90215-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C3A65681C1
X-Rspamd-Action: no action

UFS controller v6.2 requires bit 31 in the spare configuration register
to be set for high-speed link startup mode, as per the Hardware
Programming Guide (HPG).

The spare register value is read during host driver initialization but
gets cleared after UFS reset. To align with the UFS v6.2 programming
sequence, preserve the spare register value during initialization and
restore it during link startup to ensure proper high-speed mode

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 11 ++++++++---
 drivers/ufs/host/ufs-qcom.h |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c43bb75d208c..ab5aed241913 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -686,6 +686,7 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
 static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 					enum ufs_notify_change_status status)
 {
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int err = 0;

 	switch (status) {
@@ -708,6 +709,10 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 		 */
 		err = ufshcd_disable_host_tx_lcc(hba);

+		/* Update REG_UFS_DEBUG_SPARE_CFG to set HS-LSS mode in link startup */
+		if (host->hw_ver.major == 0x6 && host->hw_ver.minor == 0x2)
+			ufshcd_writel(hba, host->spare_cfg,
+				      REG_UFS_DEBUG_SPARE_CFG);
 		break;
 	default:
 		break;
@@ -1084,7 +1089,7 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
 {
 	struct ufs_host_params *host_params = &host->host_params;
-	u32 val, dev_major;
+	u32 dev_major;

 	/*
 	 * Default to powering up the PHY to the max gear possible, which is
@@ -1103,8 +1108,8 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
 		 */
 		host->phy_gear = UFS_HS_G2;
 	} else if (host->hw_ver.major >= 0x5) {
-		val = ufshcd_readl(host->hba, REG_UFS_DEBUG_SPARE_CFG);
-		dev_major = FIELD_GET(UFS_DEV_VER_MAJOR_MASK, val);
+		host->spare_cfg = ufshcd_readl(host->hba, REG_UFS_DEBUG_SPARE_CFG);
+		dev_major = FIELD_GET(UFS_DEV_VER_MAJOR_MASK, host->spare_cfg);

 		/*
 		 * Since the UFS device version is populated, let's remove the
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 380d02333d38..d09ef7f44305 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -308,6 +308,7 @@ struct ufs_qcom_host {
 	u32 phy_gear;

 	bool esi_enabled;
+	u32 spare_cfg;
 };

 struct ufs_qcom_drvdata {
--
2.34.1


