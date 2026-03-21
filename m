Return-Path: <linux-arm-msm+bounces-98983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALSGOJINvmlQFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:16:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958F2E3132
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84DFD30BAEC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 03:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEDB3016FB;
	Sat, 21 Mar 2026 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLybmoss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638AA3002D1;
	Sat, 21 Mar 2026 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774062711; cv=none; b=ffQSImODDmV3bhSY4kr+5F6aoNLEurnSS4jCUnyGq2Hu0lJ/cOoHmGom4eeHlgBa/uZB06rI51OUqZAFF4GQIxuQNofDXU5sFKyQHLBJH86ZpF1bHLv0a3SAewk6yoUOqxxvJ+F8gqKR7VjtHUJ3jYSiJCgalytr9mXFe8IghJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774062711; c=relaxed/simple;
	bh=9jynF8I66l7T/+PfRfojNODP98Jgrzn1CKOz2qfz+Ek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FS3lHvhbUo+eo4EMoAyVdzFZqMkJk1j4QC82iaF1PCYdZH2pKPS/p9/wj5cnbaevU7myIDyGqflNJvqPiox54J/YlD1ALfnhtpuKuubAcV/rIOCbMHsp+yFCN+aLgFYgasjh8S21gMZZLa8XlG/JiKde0sMaVS/sIjcZjp4kVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLybmoss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KFLbHo3141905;
	Sat, 21 Mar 2026 03:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yD8E56CiENo
	Pm8mr8sl6D91roOVRgF/yvVzhCKrbJnk=; b=YLybmossVrrw1IWcKiMGQSlFbCv
	fvwcXJoVAII5LfBTVBxYhCwZUqwup4ZuNTSwE9Z9EkL5TpQ1Q6uqqfuIr3oDrCSS
	TlAwxMlqSsIYkcO/vH+2qN12IEl1/ep0q/14q6ghrl4C6feZuQHUErO3gGAwTqUM
	i3s8k5/LzotcLY/VpqibYMpnhQuOucFnrTVHx19bK8qN2GiGLVlr6Ufq3YUuLSwK
	9pZrWhCGLruSda+dbIUvDsL5VAq3E+sdbYePnx91/JpGX6L56RQLP8cM7b/30qcK
	FHhrUcVNmBbZG9AIzdaUVpOOind3VYETsrOxhzl5An3M3KMXJYzw4nc4S/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt95628-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:40 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62L3Awkb017673;
	Sat, 21 Mar 2026 03:11:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4d05k3awu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:39 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62L3BdwJ018397;
	Sat, 21 Mar 2026 03:11:39 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 62L3BdoO018394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:39 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 136C55A8; Fri, 20 Mar 2026 20:11:39 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/12] scsi: ufs: ufs-qcom: Implement vops apply_tx_eqtr_settings()
Date: Fri, 20 Mar 2026 20:10:20 -0700
Message-Id: <20260321031021.1722459-12-can.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: jG0Sbop-YyAsV7UMqZlQJNwz5scQDEoh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAyNCBTYWx0ZWRfX+S0DzdCC28Q5
 pFxLiWs1bdImHUqijLbkDYf8yu3JYcdrfDZQBOf6uVq+kHTAES3NCH0ht1kOt8OeKrLK1GLO53k
 1jBcx/o4v2X6ATZlsaF9PgEMoimoyVDOi/HoaAlK0ylswhEy/ChipcAt9Jt/gYVaDkpBBTPa34U
 zNhy1Ztwoh9NuY60ioBwZF82DV+/0549ZfjNTK0IKD7H9p3OFV+zyDquBDm3buKZOYTrZ8KR74f
 scemlpjVtQ/mNr9NDwStxvbrjRfwl7SkZ7Chu76e5ipAl+siRNl4gUhaszxHvY+2lpLLc6PWQDc
 KvXhvwZmKPztOqB33G6QYpiN7e9vvmDD7u0im1ntjHZFSv94fcLodoCEtrOSgh0rFAKLfkIjaiS
 k1wC3S24ZeMWhpp+9lA6j5gNae4wfd+1e0S8X/7IHyztiJTcSEFWtFJA1fh35V+MTu/zbDAQtzE
 wGoc8cD/la187sHLjEA==
X-Proofpoint-ORIG-GUID: jG0Sbop-YyAsV7UMqZlQJNwz5scQDEoh
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69be0c6c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=smRfVIh15VBtCzV98ssA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210024
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98983-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7958F2E3132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index a0314cb55c7f..9abdeeee81f7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2816,6 +2816,26 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
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
+	for (lane = 0; lane < pwr_mode->lane_tx; lane++) {
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
@@ -2838,6 +2858,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
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
@@ -2845,6 +2870,11 @@ static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 			dev_err(hba->dev, "%s: Failed to PMC to target HS-G%u, Rate-%s: %d\n",
 				__func__, gear, ufs_hs_rate_to_str(rate), ret);
 	} else {
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING),
+				     host->saved_tx_eq_g1_setting);
+		if (ret)
+			return ret;
+
 		/* PMC back to HS-G1. */
 		ret = ufshcd_change_power_mode(hba, &pwr_mode_hs_g1,
 					       UFSHCD_PMC_POLICY_DONT_FORCE);
@@ -2887,6 +2917,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
 	.get_rx_fom		= ufs_qcom_get_rx_fom,
+	.apply_tx_eqtr_settings	= ufs_qcom_apply_tx_eqtr_settings,
 	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 7183d6b2c8bb..5d083331a7f4 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -348,6 +348,8 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+
+	u32 saved_tx_eq_g1_setting;
 };
 
 struct ufs_qcom_drvdata {
-- 
2.34.1


