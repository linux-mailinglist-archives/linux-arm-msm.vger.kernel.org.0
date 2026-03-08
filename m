Return-Path: <linux-arm-msm+bounces-96065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLqDOLOSrWlH4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:16:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F74230E22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FA8F3007A4D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 15:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17FD29C325;
	Sun,  8 Mar 2026 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbXP51lu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAED1FF1C7;
	Sun,  8 Mar 2026 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982926; cv=none; b=GG/vFI6eP+Pa6IG63LEYXkNJfdzlR/wxVZt0aVCr7cN+i1JADw5CteRBwW4jOcHD/X+EB2Duz0a+YH/K3Fj4Ai1kpHq99ks/KcMcAj3Z9cAJV3mjFR70oNQEJ7jhyH6EzpLCcmKsspfw5asmC3+GyfDkM3ddUF6sN5blEMJzCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982926; c=relaxed/simple;
	bh=x49WPumQLg0Aw7O/mJooOSUzWGHDNilrajeoi4BJBH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rK+I8SSaz7+DkRuDQ8JfkJYPrcp7cBG5KBYXcj/kZpGzVwEM7pznmKlrflnwmaZ5aBE7HNjD9N/BiMeeGAH5W6JiZWcHdjLUULPaSHrv2MhhY5olo+huvVgtfZfZIiWbjS3SjL9MeWLJ5Zzxc9NW1cSz88uHtR9u+7SECHIdpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbXP51lu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628B9l962288470;
	Sun, 8 Mar 2026 15:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OSUtRzB1F57
	XuOhG4mypDZyIn3e3SJUfvoH7mtveVwA=; b=VbXP51luux0msaTM1c7OAYpt4Wi
	BOl8xFJspAGsgZUbU3YnJf8tbiwHjqGxA6DQYPZ53X5tx8EIoscKNbtdJvsLbZJP
	vxAVx2j2E/NcfccOExcw6Ds91Gjm5VwA8jm2qB22NwdkcID6m/IWajc9iNCc/++c
	bAi2zvuGl+4e+53D059MNNXBbMdqaRX9WTedF+/1Nf6pQSiGVIfIci8oR9tn4fDJ
	leLZEDUJWaUmNhi+jUyxrzTVY+z6SqTUAeKJ7qWn/yOFBLruCV5CJqyMy6k13AHE
	9eNDtPIv/ND7TghiE8ZMHD09K7lPRDrRbPH4eVR7PdVDNOpBtQ5jNsPFenw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrjup6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:18 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 628FES4n020256;
	Sun, 8 Mar 2026 15:15:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4crd45jvgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:18 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 628FFHLJ021289;
	Sun, 8 Mar 2026 15:15:17 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 628FFHVH021288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:17 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 8AFF85A4; Sun,  8 Mar 2026 08:15:17 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 11/12] scsi: ufs: ufs-qcom: Implement vops apply_tx_eqtr_settings()
Date: Sun,  8 Mar 2026 08:14:08 -0700
Message-Id: <20260308151409.3779137-12-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ad9286 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=smRfVIh15VBtCzV98ssA:9
X-Proofpoint-ORIG-GUID: SNyu7LGF_5i8nOpVZPw9pTJEERCfQP5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE0MCBTYWx0ZWRfXxRRrZHpP4IFu
 NojZIqEFtZgxyAnwoEVl1MX3Txpz50Ge/+NFRr01J49KydSDJoCT+yrw6eCJqHLGVfNa5I/aIYD
 suTgaXnS4aEXR3CX+6bI3eQY1jUQlaj/gWbIyP+f6RnTS4G96+CIQ/PYtpD+mJDTpqpCseArwM5
 uH6hyWVe3S6onRmdsimeFhVMIlLJbIPzoucU8avCJ29ISWAvaJLHRn06Jy61nYHT3Nx/FtaiZNC
 OVHKmkofq5sIgz96KAnUZFvEqEVfNr8g3F4Qr7iMztXkhb08Nt/I1xk7PXsLLYiLmJ4ujmYUzUH
 tj2PPUAZIOzPP4PIK13i4cxx/5gd8g4kB2W9JLGAUlrHqshvLbzq0RzRbyqpXZpkX3N814WE4y4
 QL8pJZIf27u+S6oSkhMd/2KGBuhY44295HXQLUgtV8d+nWaUWHSHHwfN5qbmkbCJaD0iUMeMH62
 WfR45BVUwRQdlq8nspw==
X-Proofpoint-GUID: SNyu7LGF_5i8nOpVZPw9pTJEERCfQP5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080140
X-Rspamd-Queue-Id: 72F74230E22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96065-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,sin.lore.kernel.org:server fail,qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On some platforms, when Host Software triggers TX Equalization Training,
HW does not take TX EQTR settings programmed in PA_TxEQTRSetting, instead
HW takes TX EQTR settings from PA_TxEQG1Setting. Implement vops
apply_tx_eqtr_setting() to work around it by programming TX EQTR settings
to PA_TxEQG1Setting during TX EQTR procedure.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 31 +++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3e989c683c29..a7feef2385fd 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2827,6 +2827,26 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 	return 0;
 }
 
+static int ufs_qcom_apply_tx_eqtr_settings(struct ufs_hba *hba,
+					   struct ufs_pa_layer_attr *pwr_mode,
+					   struct tx_eqtr_iter *h_iter,
+					   struct tx_eqtr_iter *d_iter)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	u32 setting = 0;
+	int lane;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
+		return 0;
+
+	for (lane = 0; lane < h_iter->num_lanes; lane++) {
+		setting |= TX_HS_PRESHOOT_BITS(lane, h_iter->preshoot);
+		setting |= TX_HS_DEEMPHASIS_BITS(lane, h_iter->deemphasis);
+	}
+
+	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING), setting);
+}
+
 static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 				   enum ufs_notify_change_status status,
 				   struct ufs_pa_layer_attr *pwr_mode)
@@ -2849,6 +2869,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 		return 0;
 
 	if (status == PRE_CHANGE) {
+		ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_TXEQG1SETTING),
+				     &host->saved_tx_eq_g1_setting);
+		if (ret)
+			return ret;
+
 		/* PMC to target HS Gear. */
 		ret = ufshcd_change_power_mode(hba, pwr_mode,
 					       UFSHCD_PMC_POLICY_DONT_FORCE);
@@ -2856,6 +2881,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 			dev_err(hba->dev, "%s: Failed to PMC to target HS-G%u, Rate-%s: %d\n",
 				__func__, gear, UFS_HS_RATE_STRING(rate), ret);
 	} else {
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING),
+				     host->saved_tx_eq_g1_setting);
+		if (ret)
+			return ret;
+
 		/* PMC back to HS-G1. */
 		ret = ufshcd_change_power_mode(hba, &pwr_mode_hs_g1,
 					       UFSHCD_PMC_POLICY_DONT_FORCE);
@@ -2898,6 +2928,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
 	.get_rx_fom		= ufs_qcom_get_rx_fom,
+	.apply_tx_eqtr_settings	= ufs_qcom_apply_tx_eqtr_settings,
 	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 66fb42453e5c..ebe4e07c7da1 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -350,6 +350,8 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+
+	u32 saved_tx_eq_g1_setting;
 };
 
 struct ufs_qcom_drvdata {
-- 
2.34.1


