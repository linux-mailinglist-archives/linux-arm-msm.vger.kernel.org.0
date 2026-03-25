Return-Path: <linux-arm-msm+bounces-99891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOzGJ50IxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:09:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E8328B7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5D883413C15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24BB3E2740;
	Wed, 25 Mar 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWubD5nI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C63DD537;
	Wed, 25 Mar 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452215; cv=none; b=uWqhzcXzeifxG2cb0ml2QxQTkx1j7y5PzaxaKWXaQ3JtBuuGYvID4hQAzp4uzPyugFvmj/k3Zqh8OqUEmP7/Lckm3WPUQtJIT7/622Hzy2bTuIGpFeA/EXAD5kESund37riY5+ErWXXVvBKWt47eb57mmXTAccCZ7AvLYW12B5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452215; c=relaxed/simple;
	bh=n5HabD6kXTeIunQV6GErn6KfwCfunR4WNUbbVUedw1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNZMgEmE//pX7iNutgpSZUA2+I+T1bovyATDl75p5F5Uuu7dYW379fc3+sISacxoyiY7qcRbz5eqj3eJrina6oGSKjiB0Ng80hZBvr9gV0+3ZzHvFSqi6HGdR3PrxFvHLUJQplj1xcZVUrE4xe45+D2RecmEf9E3DspG6YAX1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWubD5nI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH9gr2432203;
	Wed, 25 Mar 2026 15:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ju/CSpA5l9N
	H1dFqrZ6QP/ujG2SD04D0yZ4wG+fL8Ug=; b=WWubD5nIDk3v3XcROgFSKDsICue
	fKf8KSadNXd7cuk4tdYPF98v5rkpcELgn7eJ1cxCN6zrvBf05Sf7Bhw226pxbBx9
	G7+mOhNH8oRGNBmBDK82xtMWkjxZU1bdH/yC0nK9o6lQGKmQRBzAtnYQSQXg+SRo
	toWPBC2cvnUvNhPovrnK37MuXJawCfFhe0WEShobahRWX2zqeIZKM4kV4iNeMkUG
	fdJOKtf9Njwk2X/tXC6LKX97O9B2yUxgxS0z8IYejbcT2dGhLegokHq0HJffugx1
	T3hUT08O5Q1cbxtzf8H2Zoc076ReShiEzh72lxhsewwjpp/Cco1EKxjFxCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mjdxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:22:52 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62PFKXBD014573;
	Wed, 25 Mar 2026 15:22:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d475qfh78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:22:52 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62PFMUG7018969;
	Wed, 25 Mar 2026 15:22:51 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 62PFMp5j019183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:22:51 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 6530F5AE; Wed, 25 Mar 2026 08:22:51 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-samsung-soc@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
        linux-mediatek@lists.infradead.org (moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...)
Subject: [PATCH v5 01/12] scsi: ufs: core: Introduce a new ufshcd vops negotiate_pwr_mode()
Date: Wed, 25 Mar 2026 08:21:43 -0700
Message-Id: <20260325152154.1604082-2-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325152154.1604082-1-can.guo@oss.qualcomm.com>
References: <20260325152154.1604082-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMCBTYWx0ZWRfX+DX8wmYnelgh
 fiU6a7JvTU7xkiV5EplnE+GxGKupaTSyxa/c2e7ycIdtaabu3IX83qCG8T7/g+U/9JnxXIH8IUD
 e2OYIcemXtVjphj8ROaunB4xKcvR3AhiBL/d3ryve4DKdYpqAnQNp1G5Ref9H0kLBUzKgqjwCso
 Wvsrp7nTDcaWpMrzQmkDZHB0C7P+2Fu5itrafChy0uWjBwtoibQHgFvghg/nJF8m+SDPNK0SdA7
 8FVe1ps8hv2fC+che7cYCJI55D6cyn5Xc4mfXdGZpkt4VPlVujNxGAzYH+RkgVamjvPSf4b2R0X
 ayQH9Gj6fbOtwoWDU2fWGIX+pw82ppYz4xuxLYPjn0tV6dtH/SJ3W9b3JmILeyhKbiid0JEyzfQ
 T/Z4o5xtl1Ow7pFaPKLdLFQZxd19IunELYILDOaWiQoLWJqauZt8PhxRndCY5W6lqp6zKtKy7jo
 5JOE4ppHzI13Oqs8RPw==
X-Proofpoint-GUID: PGFBYnrrWyRVIHBLacQ8MwugSyBCgY2r
X-Proofpoint-ORIG-GUID: PGFBYnrrWyRVIHBLacQ8MwugSyBCgY2r
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3fdcc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=PY6Zn8H8AAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8
 a=Le07lM7PFCxdsHtvTlYA:9 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250110
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99891-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[micron.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,acm.org:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2B3E8328B7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Most vendor specific implemenations of vops pwr_change_notify(PRE_CHANGE)
are fulfilling two things at once:
- Vendor specific target power mode negotiation
- Vendor specific power mode change preparation

When TX Equalization is added into consideration, before power mode change
to a target power mode, TX Equalization Training (EQTR) needs be done for
that target power mode. In addition, UFSHCI spec requires to start TX EQTR
from HS-G1 (the most reliable High Speed Gear).

Adding TX EQTR before pwr_change_notify(PRE_CHANGE) is not applicable
because we don't know the negotiated power mode yet.

Adding TX EQTR post pwr_change_notify(PRE_CHANGE) is inappropriate
because pwr_change_notify(PRE_CHANGE) has finished preparation for a power
mode change to negotiated power mode, yet we are changing power mode to
HS-G1 for TX EQTR.

Add a new vops negotiate_pwr_mode() so that vendor specific power mode
negotiation can be fulfilled in its vendor specific implementations.
Later on, TX EQTR can be added post vops negotiate_pwr_mode() and before
vops pwr_change_notify(PRE_CHANGE).

Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd-priv.h     | 14 +++++-
 drivers/ufs/core/ufshcd.c          | 70 ++++++++++++++++++++++++------
 drivers/ufs/host/ufs-amd-versal2.c |  3 --
 drivers/ufs/host/ufs-exynos.c      | 34 +++++++--------
 drivers/ufs/host/ufs-hisi.c        | 23 +++++-----
 drivers/ufs/host/ufs-mediatek.c    | 40 ++++++++---------
 drivers/ufs/host/ufs-qcom.c        | 24 +++++-----
 drivers/ufs/host/ufs-sprd.c        |  3 --
 drivers/ufs/host/ufshcd-pci.c      |  6 +--
 include/ufs/ufshcd.h               | 17 +++++---
 10 files changed, 143 insertions(+), 91 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 7d6d19361af9..3b6958d9297a 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -167,14 +167,24 @@ static inline int ufshcd_vops_link_startup_notify(struct ufs_hba *hba,
 	return 0;
 }
 
+static inline int ufshcd_vops_negotiate_pwr_mode(struct ufs_hba *hba,
+						 const struct ufs_pa_layer_attr *dev_max_params,
+						 struct ufs_pa_layer_attr *dev_req_params)
+{
+	if (hba->vops && hba->vops->negotiate_pwr_mode)
+		return hba->vops->negotiate_pwr_mode(hba, dev_max_params,
+					dev_req_params);
+
+	return -ENOTSUPP;
+}
+
 static inline int ufshcd_vops_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	if (hba->vops && hba->vops->pwr_change_notify)
 		return hba->vops->pwr_change_notify(hba, status,
-					dev_max_params, dev_req_params);
+					dev_req_params);
 
 	return -ENOTSUPP;
 }
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8349fe2090db..91b5d5b02d22 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -335,8 +335,6 @@ static void ufshcd_suspend_clkscaling(struct ufs_hba *hba);
 static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 			     bool scale_up);
 static irqreturn_t ufshcd_intr(int irq, void *__hba);
-static int ufshcd_change_power_mode(struct ufs_hba *hba,
-			     struct ufs_pa_layer_attr *pwr_mode);
 static int ufshcd_setup_hba_vreg(struct ufs_hba *hba, bool on);
 static int ufshcd_setup_vreg(struct ufs_hba *hba, bool on);
 static inline int ufshcd_config_vreg_hpm(struct ufs_hba *hba,
@@ -4662,8 +4660,26 @@ static int ufshcd_get_max_pwr_mode(struct ufs_hba *hba)
 	return 0;
 }
 
-static int ufshcd_change_power_mode(struct ufs_hba *hba,
-			     struct ufs_pa_layer_attr *pwr_mode)
+/**
+ * ufshcd_dme_change_power_mode() - UniPro DME Power Mode change sequence
+ * @hba: per-adapter instance
+ * @pwr_mode: pointer to the target power mode (gear/lane) attributes
+ *
+ * This function handles the low-level DME (Device Management Entity)
+ * configuration required to transition the UFS link to a new power mode. It
+ * performs the following steps:
+ * 1. Checks if the requested mode matches the current state.
+ * 2. Sets M-PHY and UniPro attributes including Gear (PA_RXGEAR/TXGEAR),
+ *    Lanes, Termination, and HS Series (PA_HSSERIES).
+ * 3. Configures default UniPro timeout values (DL_FC0, etc.) unless
+ *    explicitly skipped via quirks.
+ * 4. Triggers the actual hardware mode change via ufshcd_uic_change_pwr_mode().
+ * 5. Updates the HBA's cached power information on success.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+static int ufshcd_dme_change_power_mode(struct ufs_hba *hba,
+					struct ufs_pa_layer_attr *pwr_mode)
 {
 	int ret;
 
@@ -4747,6 +4763,34 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
 	return ret;
 }
 
+/**
+ * ufshcd_change_power_mode() - Change UFS Link Power Mode
+ * @hba: per-adapter instance
+ * @pwr_mode: pointer to the target power mode (gear/lane) attributes
+ *
+ * This function handles the high-level sequence for changing the UFS link
+ * power mode. It triggers vendor-specific pre-change notification,
+ * executes the DME (Device Management Entity) power mode change sequence,
+ * and, upon success, triggers vendor-specific post-change notification.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int ufshcd_change_power_mode(struct ufs_hba *hba,
+			     struct ufs_pa_layer_attr *pwr_mode)
+{
+	int ret;
+
+	ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
+
+	ret = ufshcd_dme_change_power_mode(hba, pwr_mode);
+
+	if (!ret)
+		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ufshcd_change_power_mode);
+
 /**
  * ufshcd_config_pwr_mode - configure a new power mode
  * @hba: per-adapter instance
@@ -4760,19 +4804,17 @@ int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 	struct ufs_pa_layer_attr final_params = { 0 };
 	int ret;
 
-	ret = ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE,
-					desired_pwr_mode, &final_params);
+	ret = ufshcd_vops_negotiate_pwr_mode(hba, desired_pwr_mode,
+					     &final_params);
+	if (ret) {
+		if (ret != -ENOTSUPP)
+			dev_err(hba->dev, "Failed to negotiate power mode: %d, use desired as is\n",
+				ret);
 
-	if (ret)
 		memcpy(&final_params, desired_pwr_mode, sizeof(final_params));
+	}
 
-	ret = ufshcd_change_power_mode(hba, &final_params);
-
-	if (!ret)
-		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, NULL,
-					&final_params);
-
-	return ret;
+	return ufshcd_change_power_mode(hba, &final_params);
 }
 EXPORT_SYMBOL_GPL(ufshcd_config_pwr_mode);
 
diff --git a/drivers/ufs/host/ufs-amd-versal2.c b/drivers/ufs/host/ufs-amd-versal2.c
index 40543db621a1..52031b7256fd 100644
--- a/drivers/ufs/host/ufs-amd-versal2.c
+++ b/drivers/ufs/host/ufs-amd-versal2.c
@@ -443,7 +443,6 @@ static int ufs_versal2_phy_ratesel(struct ufs_hba *hba, u32 activelanes, u32 rx_
 }
 
 static int ufs_versal2_pwr_change_notify(struct ufs_hba *hba, enum ufs_notify_change_status status,
-					 const struct ufs_pa_layer_attr *dev_max_params,
 					 struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_versal2_host *host = ufshcd_get_variant(hba);
@@ -451,8 +450,6 @@ static int ufs_versal2_pwr_change_notify(struct ufs_hba *hba, enum ufs_notify_ch
 	int ret = 0;
 
 	if (status == PRE_CHANGE) {
-		memcpy(dev_req_params, dev_max_params, sizeof(struct ufs_pa_layer_attr));
-
 		/* If it is not a calibrated part, switch PWRMODE to SLOW_MODE */
 		if (!host->attcompval0 && !host->attcompval1 && !host->ctlecompval0 &&
 		    !host->ctlecompval1) {
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 76fee3a79c77..77a6c8e44485 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -818,12 +818,10 @@ static u32 exynos_ufs_get_hs_gear(struct ufs_hba *hba)
 }
 
 static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct phy *generic_phy = ufs->phy;
-	struct ufs_host_params host_params;
 	int ret;
 
 	if (!dev_req_params) {
@@ -832,18 +830,6 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 		goto out;
 	}
 
-	ufshcd_init_host_params(&host_params);
-
-	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
-	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
-	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
-
-	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
-	if (ret) {
-		pr_err("%s: failed to determine capabilities\n", __func__);
-		goto out;
-	}
-
 	if (ufs->drv_data->pre_pwr_change)
 		ufs->drv_data->pre_pwr_change(ufs, dev_req_params);
 
@@ -1677,17 +1663,30 @@ static int exynos_ufs_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
+static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
+					 const struct ufs_pa_layer_attr *dev_max_params,
+					 struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_host_params host_params;
+
+	ufshcd_init_host_params(&host_params);
+
+	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
+	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
+	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
+
+	return ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+}
+
 static int exynos_ufs_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	int ret = 0;
 
 	switch (status) {
 	case PRE_CHANGE:
-		ret = exynos_ufs_pre_pwr_mode(hba, dev_max_params,
-					      dev_req_params);
+		ret = exynos_ufs_pre_pwr_mode(hba, dev_req_params);
 		break;
 	case POST_CHANGE:
 		ret = exynos_ufs_post_pwr_mode(hba, dev_req_params);
@@ -2015,6 +2014,7 @@ static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
+	.negotiate_pwr_mode		= exynos_ufs_negotiate_pwr_mode,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
 	.setup_clocks			= exynos_ufs_setup_clocks,
 	.setup_xfer_req			= exynos_ufs_specify_nexus_t_xfer_req,
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 6f2e6bf31225..993e20ac211d 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -298,6 +298,17 @@ static void ufs_hisi_set_dev_cap(struct ufs_host_params *host_params)
 	ufshcd_init_host_params(host_params);
 }
 
+static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
+				       const struct ufs_pa_layer_attr *dev_max_params,
+				       struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_host_params host_params;
+
+	ufs_hisi_set_dev_cap(&host_params);
+
+	return ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+}
+
 static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
 {
 	struct ufs_hisi_host *host = ufshcd_get_variant(hba);
@@ -362,10 +373,8 @@ static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
 
 static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
-	struct ufs_host_params host_params;
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -377,14 +386,6 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ufs_hisi_set_dev_cap(&host_params);
-		ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
-		if (ret) {
-			dev_err(hba->dev,
-			    "%s: failed to determine capabilities\n", __func__);
-			goto out;
-		}
-
 		ufs_hisi_pwr_change_pre_change(hba);
 		break;
 	case POST_CHANGE:
@@ -543,6 +544,7 @@ static const struct ufs_hba_variant_ops ufs_hba_hi3660_vops = {
 	.name = "hi3660",
 	.init = ufs_hi3660_init,
 	.link_startup_notify = ufs_hisi_link_startup_notify,
+	.negotiate_pwr_mode = ufs_hisi_negotiate_pwr_mode,
 	.pwr_change_notify = ufs_hisi_pwr_change_notify,
 	.suspend = ufs_hisi_suspend,
 	.resume = ufs_hisi_resume,
@@ -552,6 +554,7 @@ static const struct ufs_hba_variant_ops ufs_hba_hi3670_vops = {
 	.name = "hi3670",
 	.init = ufs_hi3670_init,
 	.link_startup_notify = ufs_hisi_link_startup_notify,
+	.negotiate_pwr_mode = ufs_hisi_negotiate_pwr_mode,
 	.pwr_change_notify = ufs_hisi_pwr_change_notify,
 	.suspend = ufs_hisi_suspend,
 	.resume = ufs_hisi_resume,
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 05892b9ac528..7b45cf0428af 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1317,6 +1317,23 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	return err;
 }
 
+static int ufs_mtk_negotiate_pwr_mode(struct ufs_hba *hba,
+				      const struct ufs_pa_layer_attr *dev_max_params,
+				      struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_host_params host_params;
+
+	ufshcd_init_host_params(&host_params);
+	host_params.hs_rx_gear = UFS_HS_G5;
+	host_params.hs_tx_gear = UFS_HS_G5;
+
+	if (dev_max_params->pwr_rx == SLOW_MODE ||
+	    dev_max_params->pwr_tx == SLOW_MODE)
+		host_params.desired_working_mode = UFS_PWM_MODE;
+
+	return ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+}
+
 static bool ufs_mtk_pmc_via_fastauto(struct ufs_hba *hba,
 				     struct ufs_pa_layer_attr *dev_req_params)
 {
@@ -1372,26 +1389,10 @@ static void ufs_mtk_adjust_sync_length(struct ufs_hba *hba)
 }
 
 static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	struct ufs_host_params host_params;
-	int ret;
-
-	ufshcd_init_host_params(&host_params);
-	host_params.hs_rx_gear = UFS_HS_G5;
-	host_params.hs_tx_gear = UFS_HS_G5;
-
-	if (dev_max_params->pwr_rx == SLOW_MODE ||
-	    dev_max_params->pwr_tx == SLOW_MODE)
-		host_params.desired_working_mode = UFS_PWM_MODE;
-
-	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
-	if (ret) {
-		pr_info("%s: failed to determine capabilities\n",
-			__func__);
-	}
+	int ret = 0;
 
 	if (ufs_mtk_pmc_via_fastauto(hba, dev_req_params)) {
 		ufs_mtk_adjust_sync_length(hba);
@@ -1503,7 +1504,6 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 
 static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status stage,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	int ret = 0;
@@ -1515,8 +1515,7 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 			reg = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
 			ufs_mtk_auto_hibern8_disable(hba);
 		}
-		ret = ufs_mtk_pre_pwr_change(hba, dev_max_params,
-					     dev_req_params);
+		ret = ufs_mtk_pre_pwr_change(hba, dev_req_params);
 		break;
 	case POST_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba))
@@ -2318,6 +2317,7 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.setup_clocks        = ufs_mtk_setup_clocks,
 	.hce_enable_notify   = ufs_mtk_hce_enable_notify,
 	.link_startup_notify = ufs_mtk_link_startup_notify,
+	.negotiate_pwr_mode  = ufs_mtk_negotiate_pwr_mode,
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
 	.apply_dev_quirks    = ufs_mtk_apply_dev_quirks,
 	.fixup_dev_quirks    = ufs_mtk_fixup_dev_quirks,
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 375fd24ba458..cdc769886e82 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -966,13 +966,21 @@ static void ufs_qcom_set_tx_hs_equalizer(struct ufs_hba *hba, u32 gear, u32 tx_l
 	}
 }
 
-static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
-				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
-				struct ufs_pa_layer_attr *dev_req_params)
+static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
+				       const struct ufs_pa_layer_attr *dev_max_params,
+				       struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_host_params *host_params = &host->host_params;
+
+	return ufshcd_negotiate_pwr_params(host_params, dev_max_params, dev_req_params);
+}
+
+static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
+				      enum ufs_notify_change_status status,
+				      struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -982,13 +990,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, dev_req_params);
-		if (ret) {
-			dev_err(hba->dev, "%s: failed to determine capabilities\n",
-					__func__);
-			return ret;
-		}
-
 		/*
 		 * During UFS driver probe, always update the PHY gear to match the negotiated
 		 * gear, so that, if quirk UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH is enabled,
@@ -2341,6 +2342,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.setup_clocks           = ufs_qcom_setup_clocks,
 	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
+	.negotiate_pwr_mode	= ufs_qcom_negotiate_pwr_mode,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
 	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
diff --git a/drivers/ufs/host/ufs-sprd.c b/drivers/ufs/host/ufs-sprd.c
index 65bd8fb96b99..a5e8c591bead 100644
--- a/drivers/ufs/host/ufs-sprd.c
+++ b/drivers/ufs/host/ufs-sprd.c
@@ -161,14 +161,11 @@ static int ufs_sprd_common_init(struct ufs_hba *hba)
 
 static int sprd_ufs_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_sprd_host *host = ufshcd_get_variant(hba);
 
 	if (status == PRE_CHANGE) {
-		memcpy(dev_req_params, dev_max_params,
-			sizeof(struct ufs_pa_layer_attr));
 		if (host->unipro_ver >= UFS_UNIPRO_VER_1_8)
 			ufshcd_dme_configure_adapt(hba, dev_req_params->gear_tx,
 						   PA_INITIAL_ADAPT);
diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
index 5f65dfad1a71..8a4f2381a32e 100644
--- a/drivers/ufs/host/ufshcd-pci.c
+++ b/drivers/ufs/host/ufshcd-pci.c
@@ -145,7 +145,7 @@ static int ufs_intel_set_lanes(struct ufs_hba *hba, u32 lanes)
 
 	pwr_info.lane_rx = lanes;
 	pwr_info.lane_tx = lanes;
-	ret = ufshcd_config_pwr_mode(hba, &pwr_info);
+	ret = ufshcd_change_power_mode(hba, &pwr_info);
 	if (ret)
 		dev_err(hba->dev, "%s: Setting %u lanes, err = %d\n",
 			__func__, lanes, ret);
@@ -154,17 +154,15 @@ static int ufs_intel_set_lanes(struct ufs_hba *hba, u32 lanes)
 
 static int ufs_intel_lkf_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	int err = 0;
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (ufshcd_is_hs_mode(dev_max_params) &&
+		if (ufshcd_is_hs_mode(dev_req_params) &&
 		    (hba->pwr_info.lane_rx != 2 || hba->pwr_info.lane_tx != 2))
 			ufs_intel_set_lanes(hba, 2);
-		memcpy(dev_req_params, dev_max_params, sizeof(*dev_req_params));
 		break;
 	case POST_CHANGE:
 		if (ufshcd_is_hs_mode(dev_req_params)) {
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 8563b6648976..51c2555bea73 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -302,11 +302,10 @@ struct ufs_pwr_mode_info {
  *                     variant specific Uni-Pro initialization.
  * @link_startup_notify: called before and after Link startup is carried out
  *                       to allow variant specific Uni-Pro initialization.
+ * @negotiate_pwr_mode: called to negotiate power mode.
  * @pwr_change_notify: called before and after a power mode change
  *			is carried out to allow vendor spesific capabilities
- *			to be set. PRE_CHANGE can modify final_params based
- *			on desired_pwr_mode, but POST_CHANGE must not alter
- *			the final_params parameter
+ *			to be set.
  * @setup_xfer_req: called before any transfer request is issued
  *                  to set some things
  * @setup_task_mgmt: called before any task management request is issued
@@ -347,10 +346,12 @@ struct ufs_hba_variant_ops {
 				     enum ufs_notify_change_status);
 	int	(*link_startup_notify)(struct ufs_hba *,
 				       enum ufs_notify_change_status);
-	int	(*pwr_change_notify)(struct ufs_hba *,
-			enum ufs_notify_change_status status,
-			const struct ufs_pa_layer_attr *desired_pwr_mode,
-			struct ufs_pa_layer_attr *final_params);
+	int	(*negotiate_pwr_mode)(struct ufs_hba *hba,
+				      const struct ufs_pa_layer_attr *desired_pwr_mode,
+				      struct ufs_pa_layer_attr *final_params);
+	int	(*pwr_change_notify)(struct ufs_hba *hba,
+				     enum ufs_notify_change_status status,
+				     struct ufs_pa_layer_attr *final_params);
 	void	(*setup_xfer_req)(struct ufs_hba *hba, int tag,
 				  bool is_scsi_cmd);
 	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);
@@ -1361,6 +1362,8 @@ extern int ufshcd_dme_set_attr(struct ufs_hba *hba, u32 attr_sel,
 			       u8 attr_set, u32 mib_val, u8 peer);
 extern int ufshcd_dme_get_attr(struct ufs_hba *hba, u32 attr_sel,
 			       u32 *mib_val, u8 peer);
+extern int ufshcd_change_power_mode(struct ufs_hba *hba,
+				    struct ufs_pa_layer_attr *pwr_mode);
 extern int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 			struct ufs_pa_layer_attr *desired_pwr_mode);
 extern int ufshcd_uic_change_pwr_mode(struct ufs_hba *hba, u8 mode);
-- 
2.34.1


