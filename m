Return-Path: <linux-arm-msm+bounces-94490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CP8CMzDoWkVwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:18:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D731E1BAB5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9751C316B90D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBF644CACA;
	Fri, 27 Feb 2026 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJDMP2eb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8AE44BC9B;
	Fri, 27 Feb 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208573; cv=none; b=coSSapCNp0GWjPPpndgDLiCS/ch+epVt06HwNRkDhir0JmC+YOp6WyhPEJoQ71SL4wqxaE+Sdlscw14DGGGATIP8BAAhzY1ymitkWrzAjCwSvATn86WB9DaXl0WeKdT+4OYWlh9QGR8/YPibrdiq5KMsA9clRqJSJm5U+UjWgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208573; c=relaxed/simple;
	bh=cTrOUt0UHA6eSEwKNIm8iIYNRTcc6nYEeFG/7a1e/jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coBCjuQtwtOJ6pzNfYzv6FzkuDbQVvTeZ58p54iIrDCmaYLTHjyoe5bvwY5v0PEkaCNSEJw+HXRksZVYWmBVcpbT9yhqHyLb/jNWvWrMcI4fvo3KlCmOb92tRN5LzpOTairLJ5pXKCNjL80I7H//eCQyZtzoXYulBh5KIbOc3Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJDMP2eb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REaN6p388748;
	Fri, 27 Feb 2026 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KaB9fQk4/UZ
	egp8DwoweORjGhzbT81Y/vGjLCzXEQNA=; b=XJDMP2ebC6vRRXyi1Fv4wGEozoy
	xQCMmWFzBz9Oe3NnbezvY4rv8LK3XjHq628GslBeHUGD9X1DJHNFevb7EiyzBI5E
	PDmkgr3K76Lcd8s/1s8awkH3YSykBN+RwMsHVpPPjBKXhrahJkGocZnl+nkKTJI4
	fHo+C59ZPUpS8uW1J86mdTEkKOgNh+B08y7v3OzCYwUBSi58DIo5NJqVJ5yp7A5W
	jS+50ODXQFifcks8MsdYj9C/YukP2rT+En/gNTeZe2gYUDzn6bB2vD6snkWR9F53
	Invevtuv11fY2C6JbMZtXX2Kmtz76Sl893vWiVxmpcS9ok6K8EC88WS3A5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x897hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:23 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RG9Mos018815;
	Fri, 27 Feb 2026 16:09:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4ck7dem38q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:22 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61RG9Mm7018809;
	Fri, 27 Feb 2026 16:09:22 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 61RG9Mbt018806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:22 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 39F045A0; Fri, 27 Feb 2026 08:09:22 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/11] scsi: ufs: ufs-qcom: Implement vops apply_tx_eqtr_settings()
Date: Fri, 27 Feb 2026 08:08:07 -0800
Message-Id: <20260227160809.2620598-11-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a1c1b3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=W_4UrmeIGeJD-bvouaAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0NCBTYWx0ZWRfXyQg35jh5XZgN
 HLUJWrHWYpdxKBjsX36ePHg+B/HjuNmPBLOLZlQEVujprwSMx8gHueaymB9CpSc++qtqkR4PsVD
 PrCc6oojVAB1UdU2O+vVMTuF6K4MvDsOI08WGo1Sn/Bf5XiS5yDTfoicXRb6fwrVmcDYFj7ej2t
 HiSZlCYieua8Uoh+qJKYDmSWOo+XQGP6RrRIWbbxLkuwO4yMwAUujJ3F8NbqTsyOkjoTcTqPRnX
 AEHcDLQWFB1SusH64sMNy1uGN27SO0D+eHtPUShMnTfqvviyRSthSyvg5qPurONJrMwla+iplAS
 9W4L1bPNQoQShTKgpGnF0uPCYjldSYHMpupwEW7ukk3YucW3wXuVaeY3xijxGR2TT7ELudjBbYC
 Huokl9yf10nx9RC/B1NQfwfgIB7xl/1kXFFJTI0kVB/mlzsuEgc0sQTSpMayjmtMQALfouwIFA3
 K8dJbQAuAE2FGTekXWQ==
X-Proofpoint-ORIG-GUID: lttaQ2tkBb3bdv2dpmCtrMz88-w4F9va
X-Proofpoint-GUID: lttaQ2tkBb3bdv2dpmCtrMz88-w4F9va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94490-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D731E1BAB5D
X-Rspamd-Action: no action

On some platforms, when Host Software triggers TX Equalization Training,
HW does not take TX EQTR settings programmed in PA_TxEQTRSetting, instead
HW takes TX EQTR settings from PA_TxEQG1Setting. Implement vops
apply_tx_eqtr_setting() to work around it by programming TX EQTR settings
to PA_TxEQG1Setting during TX EQTR procedure.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 33 +++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 7115d87882b1..8582396fa0d8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2842,6 +2842,28 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 	return ret;
 }
 
+static int ufs_qcom_apply_tx_eqtr_settings(struct ufs_hba *hba,
+					   struct ufs_pa_layer_attr *pwr_mode,
+					   struct tx_eqtr_iter *h_iter,
+					   struct tx_eqtr_iter *d_iter)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	u32 setting = 0;
+	int lane, ret;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
+		return 0;
+
+	for (lane = 0; lane < h_iter->num_lanes; lane++) {
+		setting |= TX_HS_PRESHOOT_BITS(lane, h_iter->preshoot);
+		setting |= TX_HS_DEEMPHASIS_BITS(lane, h_iter->deemphasis);
+	}
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING), setting);
+
+	return ret;
+}
+
 static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 				   enum ufs_notify_change_status status,
 				   struct ufshcd_tx_eq_params *params,
@@ -2865,6 +2887,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 		return 0;
 
 	if (status == PRE_CHANGE) {
+		ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_TXEQG1SETTING),
+				     &host->saved_tx_eq_g1_setting);
+		if (ret)
+			return ret;
+
 		/* PMC to target HS Gear. */
 		ret = ufs_qcom_change_power_mode(hba, pwr_mode,
 						 /*force_pmc=*/false);
@@ -2872,6 +2899,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 			dev_err(hba->dev, "%s: Failed to change power mode to target HS-G%u, Rate-%s: %d\n",
 				__func__, gear, UFS_HS_RATE_STRING(rate), ret);
 	} else {
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING),
+				     host->saved_tx_eq_g1_setting);
+		if (ret)
+			return ret;
+
 		/* PMC back to HS-G1. */
 		ret = ufs_qcom_change_power_mode(hba, &pwr_mode_hs_g1,
 						 /*force_pmc=*/false);
@@ -2914,6 +2946,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
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


