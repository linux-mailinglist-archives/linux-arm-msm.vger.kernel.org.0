Return-Path: <linux-arm-msm+bounces-95335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH0qHu06qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:00:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB2200DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA4630F57EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF1031813A;
	Wed,  4 Mar 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEfbg8CJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE88313540;
	Wed,  4 Mar 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632446; cv=none; b=GdJNuL7EdLml2glsQE4uriFcadv+9xrcicwa7GLEr6HdsB3Lwm3c+BJn6xWc4IqUt2MJAyWtwGI6oRvUhoqs0L1tziD6M+/2lAVZPudRr0SDZHfW+TeUqvdCa8wGZ7WVID9obAro3t3epxTHx5wDeNrAbdm0irHF4zXwJlBJNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632446; c=relaxed/simple;
	bh=MpSSxCrAYSoSSs7jRGFQJeXDiKBaTVg1dxa2bmqpJHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MGyytlhqKa1eCdkeXwx2hrJX64ux/t3DABKe5YOzdD+NXneCurPeI5qRbGrhOrcd0cm7aJC0TDNSHnI/lvlKEn467n0tJu/h+UprxU9kdPXVWFHJ5ig8Cvge9+5Q7ui7xak4fIIcWN6naEBBAvf2SsJwHWtJfGYd+ciJckGPOkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEfbg8CJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624D0mRg1422295;
	Wed, 4 Mar 2026 13:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4xRlCnQazv
	KlRt4Un33KNm/kgafWf+y/+Yy1Nw2Bus=; b=EEfbg8CJMaCQCrJ+epMNO46OXLi
	7EvUQ9DAZU81OUHCkC0BCoHN6+zjQslC94oKTWEWgco09IzSjkhW5koHpdgVDbRE
	L7joiKp7GH6WQIi5uGvmNZ6TkNns4IF5wRaMpcGnnIKZWy8j9zdjRgSlH3vj6j2X
	T3FBhTVujJj1KOV2JODPk/bhpuEpyaQhNb92Mw/8t2Qppe+h3CY+GAf9whJjAZs+
	fhxmzmIxOvSERIklP/mP7IXq34+gwKq1PD4d/KE3Str4ElVIqejfOw0SDU6KVeau
	NNucINdYI5CwroAaKp2oQyx/2NOgMWXYAZk9bzjiYCECa0gv1pZAxqQRkiw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u1kdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:53:34 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 624DrXaJ019534;
	Wed, 4 Mar 2026 13:53:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cpf4wmkx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:53:33 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 624DrXJE019528;
	Wed, 4 Mar 2026 13:53:33 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 624DrWFI019522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:53:33 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 8288E5A7; Wed,  4 Mar 2026 05:53:32 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
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
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Subject: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops negotiate_pwr_mode()
Date: Wed,  4 Mar 2026 05:53:03 -0800
Message-Id: <20260304135313.413688-2-can.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zNQDAyVVCaEuFpQA5VwH9bQWDUS8P5o7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMSBTYWx0ZWRfX1zLVksqOx0Jy
 kq1WC6Zqi3iZEQxeL7ZFNXY3PR4oFEbbugHrWN1b66Hu353RX0CAAmk/OVFcmmvT0kkc5NNJtv7
 e+e37NtCaW5XmcUIi/psXY6fAYSv/tenK3PbGMtX4iDgWiOQuM0kZt8cD7e0X7YoGgxwKXr95Of
 VVFCC86jF7BsskjfAY+M0RbimyzzngQQnyb9l4c+//1sSJ7/6dXJLYi6lCr9fhNmyLNY/0MPF6A
 bmExVSeqFu12TIOys9YBXS9GX8MYUppt6qBc1UPZZhP/gU8vBPKUTKJCovm6XDb94+SknW9UEzx
 +WsbduWGanPS0AHKJnFi08dj55Uvx8Aj14B8k+hC/hJaq6KFaFjIxROTwSqanip1S9jF+49XVGG
 Lg1XsFuIKeX9jGbF3gLaAB/qF9lyCG0LQpjUxPs4EoNvAG7QVoyD8lpVTcKC6SmeaS1zAMvku8N
 VQyKiAwHaBumcHq+JUg==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a8395e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=oMxu7MU5fr9-E3tHNaIA:9
X-Proofpoint-GUID: zNQDAyVVCaEuFpQA5VwH9bQWDUS8P5o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040111
X-Rspamd-Queue-Id: CBAB2200DE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95335-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd-priv.h     | 14 +++++++--
 drivers/ufs/core/ufshcd.c          | 35 ++++++++++++++---------
 drivers/ufs/host/ufs-amd-versal2.c | 13 +++++++--
 drivers/ufs/host/ufs-exynos.c      | 44 +++++++++++++++++-----------
 drivers/ufs/host/ufs-hisi.c        | 32 ++++++++++++++-------
 drivers/ufs/host/ufs-mediatek.c    | 46 +++++++++++++++++-------------
 drivers/ufs/host/ufs-qcom.c        | 34 +++++++++++++++-------
 drivers/ufs/host/ufs-sprd.c        | 13 +++++++--
 drivers/ufs/host/ufshcd-pci.c      | 16 ++++++++---
 include/ufs/ufshcd.h               | 17 ++++++-----
 10 files changed, 173 insertions(+), 91 deletions(-)

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
index 8349fe2090db..c6b9c58fece3 100644
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
@@ -4662,8 +4660,8 @@ static int ufshcd_get_max_pwr_mode(struct ufs_hba *hba)
 	return 0;
 }
 
-static int ufshcd_change_power_mode(struct ufs_hba *hba,
-			     struct ufs_pa_layer_attr *pwr_mode)
+static int ufshcd_dme_change_power_mode(struct ufs_hba *hba,
+					struct ufs_pa_layer_attr *pwr_mode)
 {
 	int ret;
 
@@ -4747,6 +4745,22 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
 	return ret;
 }
 
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
@@ -4760,19 +4774,12 @@ int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 	struct ufs_pa_layer_attr final_params = { 0 };
 	int ret;
 
-	ret = ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE,
-					desired_pwr_mode, &final_params);
-
+	ret = ufshcd_vops_negotiate_pwr_mode(hba, desired_pwr_mode,
+					     &final_params);
 	if (ret)
 		memcpy(&final_params, desired_pwr_mode, sizeof(final_params));
 
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
index 40543db621a1..aa1ef4d9d6e8 100644
--- a/drivers/ufs/host/ufs-amd-versal2.c
+++ b/drivers/ufs/host/ufs-amd-versal2.c
@@ -442,8 +442,16 @@ static int ufs_versal2_phy_ratesel(struct ufs_hba *hba, u32 activelanes, u32 rx_
 	return 0;
 }
 
+static int ufs_versal2_negotiate_pwr_mode(struct ufs_hba *hba,
+					  const struct ufs_pa_layer_attr *dev_max_params,
+					  struct ufs_pa_layer_attr *dev_req_params)
+{
+	memcpy(dev_req_params, dev_max_params, sizeof(struct ufs_pa_layer_attr));
+
+	return 0;
+}
+
 static int ufs_versal2_pwr_change_notify(struct ufs_hba *hba, enum ufs_notify_change_status status,
-					 const struct ufs_pa_layer_attr *dev_max_params,
 					 struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_versal2_host *host = ufshcd_get_variant(hba);
@@ -451,8 +459,6 @@ static int ufs_versal2_pwr_change_notify(struct ufs_hba *hba, enum ufs_notify_ch
 	int ret = 0;
 
 	if (status == PRE_CHANGE) {
-		memcpy(dev_req_params, dev_max_params, sizeof(struct ufs_pa_layer_attr));
-
 		/* If it is not a calibrated part, switch PWRMODE to SLOW_MODE */
 		if (!host->attcompval0 && !host->attcompval1 && !host->ctlecompval0 &&
 		    !host->ctlecompval1) {
@@ -509,6 +515,7 @@ static struct ufs_hba_variant_ops ufs_versal2_hba_vops = {
 	.init			= ufs_versal2_init,
 	.link_startup_notify	= ufs_versal2_link_startup_notify,
 	.hce_enable_notify	= ufs_versal2_hce_enable_notify,
+	.negotiate_pwr_mode	= ufs_versal2_negotiate_pwr_mode,
 	.pwr_change_notify	= ufs_versal2_pwr_change_notify,
 };
 
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 76fee3a79c77..ae179339f9c3 100644
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
 
@@ -1677,17 +1663,40 @@ static int exynos_ufs_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
+static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
+					 const struct ufs_pa_layer_attr *dev_max_params,
+					 struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_host_params host_params;
+	int ret;
+
+	if (!dev_req_params) {
+		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
+		return -EINVAL;
+	}
+
+	ufshcd_init_host_params(&host_params);
+
+	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
+	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
+	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
+
+	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+	if (ret)
+		pr_err("%s: failed to determine capabilities\n", __func__);
+
+	return ret;
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
@@ -2015,6 +2024,7 @@ static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
+	.negotiate_pwr_mode		= exynos_ufs_negotiate_pwr_mode,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
 	.setup_clocks			= exynos_ufs_setup_clocks,
 	.setup_xfer_req			= exynos_ufs_specify_nexus_t_xfer_req,
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 6f2e6bf31225..f7301f94502a 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -298,6 +298,26 @@ static void ufs_hisi_set_dev_cap(struct ufs_host_params *host_params)
 	ufshcd_init_host_params(host_params);
 }
 
+static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
+				       const struct ufs_pa_layer_attr *dev_max_params,
+				       struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_host_params host_params;
+	int ret;
+
+	if (!dev_req_params) {
+		dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", __func__);
+		return -EINVAL;
+	}
+
+	ufs_hisi_set_dev_cap(&host_params);
+	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+	if (ret)
+		dev_err(hba->dev, "%s: failed to determine capabilities\n", __func__);
+
+	return ret;
+}
+
 static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
 {
 	struct ufs_hisi_host *host = ufshcd_get_variant(hba);
@@ -362,10 +382,8 @@ static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
 
 static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
-	struct ufs_host_params host_params;
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -377,14 +395,6 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 
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
@@ -543,6 +553,7 @@ static const struct ufs_hba_variant_ops ufs_hba_hi3660_vops = {
 	.name = "hi3660",
 	.init = ufs_hi3660_init,
 	.link_startup_notify = ufs_hisi_link_startup_notify,
+	.negotiate_pwr_mode = ufs_hisi_negotiate_pwr_mode,
 	.pwr_change_notify = ufs_hisi_pwr_change_notify,
 	.suspend = ufs_hisi_suspend,
 	.resume = ufs_hisi_resume,
@@ -552,6 +563,7 @@ static const struct ufs_hba_variant_ops ufs_hba_hi3670_vops = {
 	.name = "hi3670",
 	.init = ufs_hi3670_init,
 	.link_startup_notify = ufs_hisi_link_startup_notify,
+	.negotiate_pwr_mode = ufs_hisi_negotiate_pwr_mode,
 	.pwr_change_notify = ufs_hisi_pwr_change_notify,
 	.suspend = ufs_hisi_suspend,
 	.resume = ufs_hisi_resume,
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 05892b9ac528..507ff0c1cd26 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1317,6 +1317,29 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	return err;
 }
 
+static int ufs_mtk_negotiate_pwr_mode(struct ufs_hba *hba,
+				      const struct ufs_pa_layer_attr *dev_max_params,
+				      struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_host_params host_params;
+	int ret;
+
+	ufshcd_init_host_params(&host_params);
+	host_params.hs_rx_gear = UFS_HS_G5;
+	host_params.hs_tx_gear = UFS_HS_G5;
+
+	if (dev_max_params->pwr_rx == SLOW_MODE ||
+	    dev_max_params->pwr_tx == SLOW_MODE)
+		host_params.desired_working_mode = UFS_PWM_MODE;
+
+	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+	if (ret)
+		pr_info("%s: failed to determine capabilities\n",
+			__func__);
+
+	return ret;
+}
+
 static bool ufs_mtk_pmc_via_fastauto(struct ufs_hba *hba,
 				     struct ufs_pa_layer_attr *dev_req_params)
 {
@@ -1372,26 +1395,10 @@ static void ufs_mtk_adjust_sync_length(struct ufs_hba *hba)
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
@@ -1503,7 +1510,6 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 
 static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status stage,
-				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	int ret = 0;
@@ -1515,8 +1521,7 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 			reg = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
 			ufs_mtk_auto_hibern8_disable(hba);
 		}
-		ret = ufs_mtk_pre_pwr_change(hba, dev_max_params,
-					     dev_req_params);
+		ret = ufs_mtk_pre_pwr_change(hba, dev_req_params);
 		break;
 	case POST_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba))
@@ -2318,6 +2323,7 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.setup_clocks        = ufs_mtk_setup_clocks,
 	.hce_enable_notify   = ufs_mtk_hce_enable_notify,
 	.link_startup_notify = ufs_mtk_link_startup_notify,
+	.negotiate_pwr_mode  = ufs_mtk_negotiate_pwr_mode,
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
 	.apply_dev_quirks    = ufs_mtk_apply_dev_quirks,
 	.fixup_dev_quirks    = ufs_mtk_fixup_dev_quirks,
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 375fd24ba458..5eb12a999eb1 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -966,13 +966,31 @@ static void ufs_qcom_set_tx_hs_equalizer(struct ufs_hba *hba, u32 gear, u32 tx_l
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
+	int ret;
+
+	if (!dev_req_params) {
+		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, dev_req_params);
+	if (ret)
+		dev_err(hba->dev, "%s: failed to determine capabilities\n", __func__);
+
+	return ret;
+}
+
+static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
+				      enum ufs_notify_change_status status,
+				      struct ufs_pa_layer_attr *dev_req_params)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -982,13 +1000,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 
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
@@ -2341,6 +2352,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.setup_clocks           = ufs_qcom_setup_clocks,
 	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
+	.negotiate_pwr_mode	= ufs_qcom_negotiate_pwr_mode,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
 	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
diff --git a/drivers/ufs/host/ufs-sprd.c b/drivers/ufs/host/ufs-sprd.c
index 65bd8fb96b99..fbb290356e1d 100644
--- a/drivers/ufs/host/ufs-sprd.c
+++ b/drivers/ufs/host/ufs-sprd.c
@@ -159,16 +159,22 @@ static int ufs_sprd_common_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static int sprd_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
+				       const struct ufs_pa_layer_attr *dev_max_params,
+				       struct ufs_pa_layer_attr *dev_req_params)
+{
+	memcpy(dev_req_params, dev_max_params, sizeof(struct ufs_pa_layer_attr));
+
+	return 0;
+}
+
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
@@ -398,6 +404,7 @@ static struct ufs_sprd_priv n6_ufs = {
 		.name = "sprd,ums9620-ufs",
 		.init = ufs_sprd_n6_init,
 		.hce_enable_notify = sprd_ufs_n6_hce_enable_notify,
+		.negotiate_pwr_mode = sprd_ufs_negotiate_pwr_mode,
 		.pwr_change_notify = sprd_ufs_pwr_change_notify,
 		.hibern8_notify = sprd_ufs_n6_h8_notify,
 		.device_reset = ufs_sprd_n6_device_reset,
diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
index 5f65dfad1a71..894b7589b14e 100644
--- a/drivers/ufs/host/ufshcd-pci.c
+++ b/drivers/ufs/host/ufshcd-pci.c
@@ -138,6 +138,15 @@ static int ufs_intel_link_startup_notify(struct ufs_hba *hba,
 	return err;
 }
 
+static int ufs_intel_lkf_negotiate_pwr_mode(struct ufs_hba *hba,
+					    const struct ufs_pa_layer_attr *dev_max_params,
+					    struct ufs_pa_layer_attr *dev_req_params)
+{
+	memcpy(dev_req_params, dev_max_params, sizeof(*dev_req_params));
+
+	return 0;
+}
+
 static int ufs_intel_set_lanes(struct ufs_hba *hba, u32 lanes)
 {
 	struct ufs_pa_layer_attr pwr_info = hba->pwr_info;
@@ -145,7 +154,7 @@ static int ufs_intel_set_lanes(struct ufs_hba *hba, u32 lanes)
 
 	pwr_info.lane_rx = lanes;
 	pwr_info.lane_tx = lanes;
-	ret = ufshcd_config_pwr_mode(hba, &pwr_info);
+	ret = ufshcd_change_power_mode(hba, &pwr_info);
 	if (ret)
 		dev_err(hba->dev, "%s: Setting %u lanes, err = %d\n",
 			__func__, lanes, ret);
@@ -154,17 +163,15 @@ static int ufs_intel_set_lanes(struct ufs_hba *hba, u32 lanes)
 
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
@@ -507,6 +514,7 @@ static struct ufs_hba_variant_ops ufs_intel_lkf_hba_vops = {
 	.exit			= ufs_intel_common_exit,
 	.hce_enable_notify	= ufs_intel_hce_enable_notify,
 	.link_startup_notify	= ufs_intel_link_startup_notify,
+	.negotiate_pwr_mode	= ufs_intel_lkf_negotiate_pwr_mode,
 	.pwr_change_notify	= ufs_intel_lkf_pwr_change_notify,
 	.apply_dev_quirks	= ufs_intel_lkf_apply_dev_quirks,
 	.resume			= ufs_intel_resume,
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


