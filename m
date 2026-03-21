Return-Path: <linux-arm-msm+bounces-98980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKekFI8MvmlQFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:12:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D02E3099
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2676301F167
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 03:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3FC2F617C;
	Sat, 21 Mar 2026 03:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAOObuQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A92F260F;
	Sat, 21 Mar 2026 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774062702; cv=none; b=Dw+OoUPWOMWEkpE0pt/Cm8EIL6YG/xDDpbl7duE1hjrojUo1SoKZxA1szAFxyXBkw+Z395wm8EklRmKpy+siWZ2aLOm0itv/5P+kgrvef0P96Yo0ATgcpy4f9MMdzOCthu4ArM6daGC0UFQK+q7B/BSaXTDH7HVWNYyGAapu/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774062702; c=relaxed/simple;
	bh=EH7KuSNwCBf3FH4D//MnTer5kV9fByalsJL3IkywKJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cHcasODHzHMmbjx8WDYHSO1ZatRdHPstz7+4/Sg3Op/AenKKN84WjoOvpHfcbXFLqSsJ4ELCwJd+enl5Dv4MTOIY2w6TsWOBSxKCjJJgCY89fUX3KuxvykyJ5rbt6ItvW2l+0ktNtvG+v8ZzAURKxupkytNw7ol7j9M8kkQ1B6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAOObuQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L28jXw4158188;
	Sat, 21 Mar 2026 03:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YN9X4soyMCC
	yPJoPlST+CTU8bDY9ToZoHlr4r9yNwn8=; b=SAOObuQgVUJWNrcdsS0/mL6Ttyd
	H/Apvf5rktTjHv+tMh9LwXfJ4W30SsSx2fZJ13NktVVSxM3EaFxNR95u2k1nhyTe
	8RUBdCmKoMhH8LiuIsk8xWyFV77LTI8JF3m85Wl+wmy6QnkzixV7S6TrK6uC7WB0
	vII6h0MIrV3pwqzwsAA5/jgAaDZXej7RF1cOh+QHG3PyBaAFGbxvyRbhb1Xf72V1
	bzD4ZsLx9ZAOavj93rohdVymwtZPp+gDSQEyaVw1kivx3eVx2s/y6t8mHzaC3lYZ
	Vq2oqoMZPbsxc/C7zkFmzEuSxQJ4kDA7KbXjJVNNPRJhJ9R7VSuUgAN9uZQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9r82ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:30 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62L3BTaA029862;
	Sat, 21 Mar 2026 03:11:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d0tph0y1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:29 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62L3BTSO029856;
	Sat, 21 Mar 2026 03:11:29 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 62L3BTdt029854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:29 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 528015A8; Fri, 20 Mar 2026 20:11:29 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 09/12] scsi: ufs: ufs-qcom: Implement vops tx_eqtr_notify()
Date: Fri, 20 Mar 2026 20:10:18 -0700
Message-Id: <20260321031021.1722459-10-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Qo3vAMsUhKLp54TyqviM-uTGVHzMTAJ1
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69be0c62 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=nGGDM5cuOJ86brUDmcsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAyNCBTYWx0ZWRfX+/CmQLDfYRv5
 NB0WYlpwKJRpvBXYUI02fJvd+HiAduFKwbDwv38BypSwI5K2t2M6vYPnKgabVBLIdlG9Yr3KA8Y
 YSI1F5xc8hm8HgWv+bfksqdfKiEO3pYjdEJltFZ4Gd9dxYY+2Re2aJGdji1d6vhA+2SRPY5aUW4
 4ex7+KBIDLxg1p/aM1pX1mCrgAm/rc5+5nX8qoN7vwaFEvpOhHVZefuY8k5+/PjcURtYg05KhzV
 rpiviOC4kUFl1Q3iorLcvn6gOoyUymBSsHzCpfguyCznoPSOqpsXdT96cbWKvh7muH6dkUfO9UB
 6Af8NDtvMwv3ardCbKjhRZvTqmiv8aT1wln81nzc0aarivD1qNPuCflW48gp2UrdL/ywbuUp29g
 5RB1gC/wLBYQLQ1XzSZF/E4PCZi0D7b70kV2JfMmZoIvTEIslyspBGDXxuHKo8qyJIHdLd/+fdQ
 nDf9TrgpV2eR7R6O/IA==
X-Proofpoint-GUID: Qo3vAMsUhKLp54TyqviM-uTGVHzMTAJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210024
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
	TAGGED_FROM(0.00)[bounces-98980-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BF5D02E3099
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On some platforms, HW does not support triggering TX EQTR from the most
reliable High-Speed (HS) Gear (HS Gear1), but only allows to trigger TX
EQTR for the target HS Gear from the same HS Gear. To work around the HW
limitation, implement vops tx_eqtr_notify() to change Power Mode to the
target TX EQTR HS Gear prior to TX EQTR procedure and change Power Mode
back to HS Gear1 (the most reliable gear) post TX EQTR procedure.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b94fe93b830e..eac5e95e740b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2505,6 +2505,46 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
+static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
+				   enum ufs_notify_change_status status,
+				   struct ufs_pa_layer_attr *pwr_mode)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr pwr_mode_hs_g1 = {
+		.gear_rx = UFS_HS_G1,
+		.gear_tx = UFS_HS_G1,
+		.lane_rx = pwr_mode->lane_rx,
+		.lane_tx = pwr_mode->lane_tx,
+		.pwr_rx = FAST_MODE,
+		.pwr_tx = FAST_MODE,
+		.hs_rate = pwr_mode->hs_rate,
+	};
+	u32 gear = pwr_mode->gear_tx;
+	u32 rate = pwr_mode->hs_rate;
+	int ret;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
+		return 0;
+
+	if (status == PRE_CHANGE) {
+		/* PMC to target HS Gear. */
+		ret = ufshcd_change_power_mode(hba, pwr_mode,
+					       UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to PMC to target HS-G%u, Rate-%s: %d\n",
+				__func__, gear, ufs_hs_rate_to_str(rate), ret);
+	} else {
+		/* PMC back to HS-G1. */
+		ret = ufshcd_change_power_mode(hba, &pwr_mode_hs_g1,
+					       UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to PMC to HS-G1, Rate-%s: %d\n",
+				__func__, ufs_hs_rate_to_str(rate), ret);
+	}
+
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -2535,6 +2575,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
 static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
-- 
2.34.1


