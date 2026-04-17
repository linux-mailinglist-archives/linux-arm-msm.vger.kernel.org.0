Return-Path: <linux-arm-msm+bounces-103468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JVyB5W94Wl4xgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:56:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C8416F0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1820A301624F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 04:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315151C695;
	Fri, 17 Apr 2026 04:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYKquZT6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRTg6+dN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D72E62A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776401793; cv=none; b=KO1WDSmoGFH18OMOPHuXEt+pD1HPOVKceVJRcxOoPBZawv11OYt8Tl7wJdtsBDtXzddpv4DYlIUELPa4vIrAgvG4tKzifJWQs928CKGdJWudQknXCFDoFqLASzas0w9ensM2AVuIJvk/8FwpM6sEVfH+tzPNhv32EaE8B8oiZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776401793; c=relaxed/simple;
	bh=93ZtNV79vuouAa8eL2edT1/Lmp8ZOeyQQhyPpBYjjwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iVsNbco7Pd9SlOz+/qzwDmsvCRu6l0Jvx1dvYC0u8UgfhPRgdmZflpcS1iubEFxVNijXPI00i1AzJsE2Jvw8oP+Pduz+50hrTh7Aiq/1m5NNFXKtnmSnguJVesEzmYmdML6eQVJWXxDLkQw7wlMIVtBrtuPRHfWXvG47uciw+IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYKquZT6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRTg6+dN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fjJs1092257
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9koPVHXl3Cu
	mpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=; b=LYKquZT6DgRnbyReSSpS9zk9Avr
	4sIoljkK9dd0bGDBiP14IWfPXR4Igk0FB1+i1WHBnNLBG3VvDR8WzdLI5Ujv+KoQ
	RrOG0aCU8VkdMZfeTTrulS6IzZkAvbmQ2i89GueUxq/OjJCxfJB/7IhtiwqPTrN8
	yxTd8kEnoUVoD0erkFLv1fWM3qr5RieJPAV4r2PMHZQz7IbtI+M489d/kEKg/xJ6
	0/M5wqn5zb0sSj0ITXER+upZyS9LllFHipXr9BVBLXBSeznWwNxOxJG27VKRFPLV
	CWCqS7+QuOHHAQtM/FsESKcEaW6TRQV05jUSJhHIBAyM7pGv70JrUCe/2kg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk227tfus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b45cd0bb96so2872055ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776401790; x=1777006590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9koPVHXl3CumpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=;
        b=IRTg6+dNtgaE1yg7GMK7Z9Prt1ZnUi61uAqaYJy7RtLhlfQTmtfbwkcNxlEjS0x85p
         PEQvT7nTrCDrSBFq3bu5/X+sb0j4chR6ZeIgBtt2T2y08HNQ6rheSu7DSc6ogREe8F+4
         6YUA2eeTraTWxDsiT3LDF+SW5HJWRA4gn2k9Ud3CWwdzH3LcPwLLa/hT4arGGoYrc1Pt
         odPbkS+1w1qVG/tqYUQfltJF61RuwacGN26bB2gKbQxHXn6IIX9qpL8OfnUP6oZKya5O
         B9fBr4NrbcxVcHR6xIIkxIzr1+CXesC+yPMWwl2PSgfPJN/4cjFLH3x64UmYkS9C/r9x
         hEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776401790; x=1777006590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9koPVHXl3CumpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=;
        b=RBb9C03PpgBBuerf9bQb5S6eB9tzVLS7uMV0/3AMJvOCsL1Otcx43Fw02kd25G2cRj
         zj0ChvtwTmLmhydgx6Ba4NSHp3MEdbUpcYe/D1cRG+WgWJiCdU8ysl52+LwbT38sysRO
         WI8QCf6GAdoMGKaTaNCk5IvXadkeda6AAzE9Am+Wo2FLHRSv3BXuO38NcrwiH4gI0QXR
         tln/tioNb37okCwAifUhiHyWYB9XeAX348ttp3WuWdydVIoEluMs5J4b/aUfKjMxTroi
         4HLpZK55d2oNtreI3v8gQWzIdnWNwSa+8owuKYnc8V2/NQth8mfbmabSoVMHkZgKB5SC
         oS2A==
X-Gm-Message-State: AOJu0YwxJ9UVuxC+GRoypxqzKXCozds1PARVQsRgs9QTE+8AsbZp8S0g
	sxArnk2kJqfClDZATriVCbqRc9Az7xpCtgWQoPKBROhrtfEyEmzSPOBMBM1dIjt98CA16fvsH/o
	l7FikJwJyFGgcCXE4fRQuLE5y+1q7TNEtoW3ckEH5vDLwbbHuRZu5CtcbxSZnzzj4SAaz
X-Gm-Gg: AeBDieuc+dn1KrNSY1gi9cB4xoGWfTWW0awHOELNwwiuxSZG6+njww3Y+a8NEfgwNhK
	/8eus+toE8iI+rCEiWm9IrjJtNuO5jHq6HqUn8OJXmRD/hDh2iXGLXTJxi7SRq61k/1UWcWAk9S
	7DXgeIUU2pLl+n6mQxmp5PZ4XEoL9ahmJ+DEAZYlr+MG+l+69/HH8WOq+2qx/or9Gp35nPDHOdd
	yWnGxVfUdd7eS05doAjX6RXhW/87BNQDF8RhPRRUkIy8JT+7GKF8uqp37XUKn1vEfFWiyqF6bac
	sQ31ErbK0ctU+Kp+fb6FpmWk1PUBuRgkSnN9nENqDpFegkls3taS/FuRepRnMexVmXaTjZs228S
	6NeU3WsZG7BkKFFFltlxKlGcAEnU5uTAgZXquNFN1udOnHRBRB99ji87LT4LfJJN5
X-Received: by 2002:a17:903:11ce:b0:2b4:5ff5:e51f with SMTP id d9443c01a7336-2b5f9f51dfemr15020115ad.36.1776401789770;
        Thu, 16 Apr 2026 21:56:29 -0700 (PDT)
X-Received: by 2002:a17:903:11ce:b0:2b4:5ff5:e51f with SMTP id d9443c01a7336-2b5f9f51dfemr15019765ad.36.1776401789186;
        Thu, 16 Apr 2026 21:56:29 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3a8sm5702115ad.12.2026.04.16.21.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 21:56:28 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        nitin.rawat@oss.qualcomm.com, shawn.lin@rock-chips.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v4 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Fri, 17 Apr 2026 10:26:02 +0530
Message-Id: <20260417045602.3042928-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA0NiBTYWx0ZWRfX/+cHEhDmlyhc
 j4awQv+Vkrs+hQDPcpDpXozKPeAjmZBEoieNOX3ZAN9quCyP/i+xIujwuyRENOeAnKYTSnobgY1
 k7q7iST/6neyWkUw89NHABAMmxjiIhqcH5542NopBZlCv1kePyV6pa3XRFk0ZeD4SVcK9xINQRb
 bMQ4MPpjDGMj3A3eBsSNM5ICGEn9918C21tRBj1T2BmOrUXmNYpXfI4nq+ehUjOV0ZmbhvYRBip
 /OFCdoIUXSD1nJZxY3n+nImk1D9RRL3E59pjDqM0LGmV+8UCwbiM1l8VTMeoXMuCQcAC7Zj0KV3
 oJvEOkCvByVUlzogSxWc1RYuxoPeHX2JiPKNAPRPAVbm1icOQUtUlj6OFLSo/o5dh+VOyP+ZZlR
 Izidmhq7aRmWn6Qpu7CnfAeA2betOWej2SA2OXG8GzXDQS1npOaKVdF5InErpy3SWjVBmT2jmCY
 DHRJKotH/h+Aglu0KfA==
X-Proofpoint-ORIG-GUID: BQ-Q9UcrqfSDAd4_L-6JNnLYEOKcufaA
X-Proofpoint-GUID: BQ-Q9UcrqfSDAd4_L-6JNnLYEOKcufaA
X-Authority-Analysis: v=2.4 cv=Iuoutr/g c=1 sm=1 tr=0 ts=69e1bd7e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gce-7N_bzMkFAa6Kq10A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170046
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103468-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B4C8416F0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

On platforms that support Auto Hibern8 (AH8), the UFS controller can
autonomously de-assert clk_req signals to the Global Clock Controller
when entering the Hibern8 state. This allows Global Clock Controller
(GCC) to gate unused clocks, improving power efficiency.

Enable the Clock Request feature by setting the UFS_HW_CLK_CTRL_EN
bit in the UFS_AH8_CFG register, as recommended in the Hardware
Programming Guidelines.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ebee0cc5313..ed4c531e1fb2 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -683,6 +683,13 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
 	return 0;
 }
 
+static void ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
+{
+	if (ufshcd_is_auto_hibern8_supported(hba))
+		ufshcd_rmwl(hba, UFS_HW_CLK_CTRL_EN, UFS_HW_CLK_CTRL_EN,
+			    UFS_AH8_CFG);
+}
+
 static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 					enum ufs_notify_change_status status)
 {
@@ -708,6 +715,9 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 		 */
 		err = ufshcd_disable_host_tx_lcc(hba);
 
+		break;
+	case POST_CHANGE:
+		ufs_qcom_link_startup_post_change(hba);
 		break;
 	default:
 		break;
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 380d02333d38..f19def37c86f 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -228,6 +228,17 @@ enum {
  */
 #define NUM_TX_R1W1 13
 
+/* bit definitions for UFS_AH8_CFG register */
+#define CC_UFS_SYS_CLK_REQ_EN          BIT(2)
+#define CC_UFS_ICE_CORE_CLK_REQ_EN     BIT(3)
+#define CC_UFS_UNIPRO_CORE_CLK_REQ_EN  BIT(4)
+#define CC_UFS_AUXCLK_REQ_EN           BIT(5)
+
+#define UFS_HW_CLK_CTRL_EN	(CC_UFS_SYS_CLK_REQ_EN |\
+				CC_UFS_ICE_CORE_CLK_REQ_EN |\
+				CC_UFS_UNIPRO_CORE_CLK_REQ_EN |\
+				CC_UFS_AUXCLK_REQ_EN)
+
 static inline void
 ufs_qcom_get_controller_revision(struct ufs_hba *hba,
 				 u8 *major, u16 *minor, u16 *step)
-- 
2.34.1


