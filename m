Return-Path: <linux-arm-msm+bounces-95338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANO2AgI6qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F19B200CE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C05AE305C27F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83923317165;
	Wed,  4 Mar 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bf2clFDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507433368BA;
	Wed,  4 Mar 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632485; cv=none; b=hE4f0KD8JgxtQDFXtdNP5f2zkWRGV4Q+DU+XDTlL5NA+0HBDOi7C3LvFafaVJ7sEpkKsIs8XYFVRrYGN4AUZY+PVgHFM9br+71hbacsVKS2AjyADwK/A6dYC7j+OsG/XE9uB/ahwEiOVP6NCscmcpII3sy79Hk6Bfa0fQMen9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632485; c=relaxed/simple;
	bh=p/i1dOAUGe6fVdLr92p0K8Okm+shkQ3i4jcjRR2fA/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ymsprdc0LZFm2RQMcnDh+7IGvZ0+xEaY8ra2qxU92kPk8QGtENajUUcYbaB2RA8OhAW0abMbqgVAy/URqLop10J5p2dhSVUR0Q15czWkx4iIN79G/jU44Vv7arYMu9+QdOjLAcL0cP5zeedn/Nz02ts1D/Y3/xeFoUFig8S44Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bf2clFDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CIqdv3110945;
	Wed, 4 Mar 2026 13:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zv2sg36Ri7u
	7pmuSX9mgxh+m3UVXFeAu0WygmwBiekU=; b=Bf2clFDjTBk12n1MqhduYk7K/QX
	ykAYvvYX+DNohyH9yX5/qswk+gvaz0++Dxq8zpbRNqMl19Lgdc9655MERA6y72Nc
	YkcT7IZpkpcXO+m5bB7rFniyOvkKEXPXwiTXPP7u9icGBisb6nQCElU1GtxEljCZ
	eiKSskajniwFWFNnQ8Tt+YnGFZoHEEf7Hlyo8IPXgLEl2f3STYH/R6CWgFQCb/+O
	ppBWCvt/CgTE/hRDJZuOTjHJv1z9iKR4VDl/rQcKIDfZdJDEqOUYGW3C7i36Rv8I
	Vv1oTKI6Kz9jMHQbbM93Il/hAurJIwcaCu+X3lk4H1yrwqyKVOT/VyjFEyw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2bbna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:31 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 624DsVq6028421;
	Wed, 4 Mar 2026 13:54:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4cpdg0nq6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:31 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 624DofqC021764;
	Wed, 4 Mar 2026 13:54:31 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 624DsU6K028415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:31 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id E1FB75A7; Wed,  4 Mar 2026 05:54:30 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 10/11] scsi: ufs: ufs-qcom: Implement vops apply_tx_eqtr_settings()
Date: Wed,  4 Mar 2026 05:53:12 -0800
Message-Id: <20260304135313.413688-11-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a83997 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=W_4UrmeIGeJD-bvouaAA:9
X-Proofpoint-ORIG-GUID: Lp08DtRU3WmTjENHFtL_zpWlnQt1TqBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMiBTYWx0ZWRfX6DSVDxTSZSyG
 ql0oqyQXIlf5KLlqTr7Pc3MYngCgezaoCBnkgPwgu+cceJaMLwfRvs1f88DRW4L8qQdBW2IWkyY
 LmMomUO4xpOV8ANjPYsFsJsH9bWpgLbTeK25iZ9EQJs3curVdf1nC5znnY87GmcW22XFYUUs+x5
 p/a7Txlew37JGRy7HOfg8MG9NRKg5E7sVfj31ZZyVe3O8MBhncSj3rJpFQoiWecqt5w20fbcisr
 umpwj12OvGu2RNOJwwpuudXU+/1zL6bN9Q9AJE8x5hISKWayx13ypwTwjAbTXFdF1vBbkVgmYvE
 icroflceVIiiuscakW5G2M9U6CxQGpR8PTVf+/D9VfU2We6MVt4MXdTcWVTZJjn0HyBwzCbOkom
 i+5bHw23fp1WYIX4VFhpd7iniCxQu5dEQYWBcKzikPyRrE+yiULGZvMyAIZ+yFc+9x8D5osRN4B
 71W9lTcVbSVR1d3iqJg==
X-Proofpoint-GUID: Lp08DtRU3WmTjENHFtL_zpWlnQt1TqBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040112
X-Rspamd-Queue-Id: 9F19B200CE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95338-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
 drivers/ufs/host/ufs-qcom.c | 33 +++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b8fa4670ddd6..89bea823a08b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2848,6 +2848,28 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
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
 				   struct ufs_pa_layer_attr *pwr_mode)
@@ -2870,6 +2892,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 		return 0;
 
 	if (status == PRE_CHANGE) {
+		ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_TXEQG1SETTING),
+				     &host->saved_tx_eq_g1_setting);
+		if (ret)
+			return ret;
+
 		/* PMC to target HS Gear. */
 		ret = ufs_qcom_change_power_mode(hba, pwr_mode,
 						 UFSHCD_PMC_POLICY_DONT_FORCE);
@@ -2877,6 +2904,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
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
 						 UFSHCD_PMC_POLICY_DONT_FORCE);
@@ -2919,6 +2951,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
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


