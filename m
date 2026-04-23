Return-Path: <linux-arm-msm+bounces-104287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OTaFUH26WnkpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:36:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1C450CC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1679301E65E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E12A3E3170;
	Thu, 23 Apr 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jd6If4sk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kbz3+8sX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E23E3D9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939649; cv=none; b=MWvueA5+lvQNNIzNBrcK0ufAnYppYppK2Phvvx8Ed/AgwmnrYacCAQnJrgtaAgnHQE2GDo13a/lh1mGQIs7eoeiDq9+ykpXEU/XCrwxIuceapZm0peKs0g6uJ2Duc9fatDEDH7cjZB2bJKOZ2rD7PKxh8mlbMqK55dwIy51P+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939649; c=relaxed/simple;
	bh=8bFKWayiOD8BO35QIE783r7n0Cddq+lbSeqnN278Nuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sGKwczAdwmlPW278PedzcGnZS7iQusmIYGyNlCBf1cmc85b1NC+BLEzf9z/fn80hr/HC5xGHUdMJTzz5zxanLRwWwig6jGcpWz6yxVVzh4wknWDKKXSuq4pMCYd/pN/Qrcy+Y9rUUumwcgaaat+dwLJAoW4PsNp1wG6y+1/Uvnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jd6If4sk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kbz3+8sX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8trN5028821
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G/YQ77xR2B2
	MXHan+TOEUNPPbNxu6iwvshjfvxmP7Bg=; b=Jd6If4skLJKxMkzvI3cifZfjM6c
	su9JryZCBXInEQPD5Mffcf3CDVVUHAWPkzuUEte5jVkm6ixj5htq5wWBbxUq6CJV
	2ZNabBimSgPwmNbNEtX3bj3QuHsl6q0ZcXoyOgbPf8MgNuqi9nOklTAxycbPByYy
	GdeW+8MGLhWWGBPBsDZjg8les6ArA4FUFHkiJZ484gRYwRXS5YgMJWH+gohSJOSZ
	xCOU+L0XXjQN/iCOYYSeOR7IIRWMWiz99R3Ipx5jZDDzkhMtV/WZlu102E6+BnhW
	x/2VvZbzy+IIC2++TeIfmmDyBLpB3z/5kqRj8t2KZ3uL7TIkJ2S8hr2+JaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm10pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so88265355ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776939646; x=1777544446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/YQ77xR2B2MXHan+TOEUNPPbNxu6iwvshjfvxmP7Bg=;
        b=Kbz3+8sXMps061oJyIyrmBFSQ2HcV4VYPTXqhDZEEF4EOgbeU5BJpK5cqhTNIK4400
         kRQCH/z8j2iGn/h/XIcKUpdwu1a1ZrqOGO+6o1NAluHfGLPSGMDQRWYKFr61FNt+ewG3
         EBFOHtKHiLTP6Ip9z7lg2JpKeJxB7XJbZs1I1ngN67myFGeQOlAspBvWx6DqI89upgU9
         FAR2X+62Og58KJWxSzLQBmYvlpSuqYfwwD8GTGsaeWca0pPEhQMf9o5E6Y5EcQf38R8Y
         cjktopLDa3+s8cdpmOETJ2eXDfgOaV+c8lqch5/jxCWTsYZ8fxSh0u3OfA+W2BqFMVoV
         sqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939646; x=1777544446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G/YQ77xR2B2MXHan+TOEUNPPbNxu6iwvshjfvxmP7Bg=;
        b=bIi8Rvr0O/6Olg/6bmNJPuvvR5tU9Iu1VZzoF0BSqZ5XExLcg0Uw76adbnRH1u/mkr
         5pbZVYiOXNgWX5HC2T5X3o5BmhFxb2EYUV1/MEa6eIMvkdSSWyTEN1uCU3R3aTNOaCm9
         r8UcjanGNWLEpHazqQCDCShgm5xGcOD992JVkbi29C4Wy7qWYvQxj9bqbqKlDAPy4IhK
         qyy+9wxBKF7dbxTCoeQF4zZFW3qfJf9X2M1M5SnZNTtgCj5u2tcysKyZBTCeHIqAnZwe
         66FJkM9TkVDqiYTzEZEna4Hfs3T1iL2oSdWn7534+nqiPhsyjaEMBgCtapxKl3u8xSTY
         u2Yw==
X-Gm-Message-State: AOJu0YwG4O31zBDHrk8C0yAZ8otdNdQPtIztgoQnbaXK9UfOxNPu2bzJ
	DT/I/rvja+FfpOOD/ixGYeloYbya8z987vJkn7rSOKcLMxNO1lRieTfJa8HtIrKMEOUH661SKrO
	JhFa5Qdm+nl91JwkEQrHkwGORTfXk1hYT20B3LTZQUvZITNlL7Imn/lBZ8WZGqxnjxQmw
X-Gm-Gg: AeBDievoDBA3HX/DDpgKTcfL5pSKmCnv+/5CgilgyllPPi4Rytyg1RJYnrhje9GAdbh
	KKOgwS9n8DyqYCsSXsAXgce6mKPOxjVi6uqXzc8iuJl50/AsnUW5/J3/jM8IL83A8UJRoq4OuQ/
	BZG932+GjXxhmj6saXTOGaSh/6Sb7qJBT8e7XyqTtI45dq+oGT309/9Ap7+PN+6Nhg8W9ZFqdhJ
	cVlB0REgAgk1vtwkbFQtUfEfrmJ5ot4ZstlieNLcFMKlN9yvMTb0/HnPEJ4Y6pvw6VvFaOjmr7y
	B+WB/NKKf99mTVAdi8WSIjL1/lux2n5rJKgVP1QwK/vSeP4YhpnblRmjJBuYDbg6J8bBdUrMujq
	gLDdLRjCYIrwI+TjKKrwtf893s2/VOkduWtAR7X33rqWYCFu3aDCr9VB4v8nONqTI
X-Received: by 2002:a05:6a20:6a13:b0:39f:a42:9243 with SMTP id adf61e73a8af0-3a08d67e277mr31070881637.3.1776939646086;
        Thu, 23 Apr 2026 03:20:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a13:b0:39f:a42:9243 with SMTP id adf61e73a8af0-3a08d67e277mr31070854637.3.1776939645617;
        Thu, 23 Apr 2026 03:20:45 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f92183sm13944461a12.3.2026.04.23.03.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:20:44 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V7 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Thu, 23 Apr 2026 15:50:23 +0530
Message-Id: <20260423102023.3779489-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
References: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69e9f27e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=gce-7N_bzMkFAa6Kq10A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gAw6yvMRm4Q5HGT2ikCcG7_17nlzI5Wn
X-Proofpoint-ORIG-GUID: gAw6yvMRm4Q5HGT2ikCcG7_17nlzI5Wn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMiBTYWx0ZWRfX9X6Q9oMpBMS8
 821m4oyn6gx6w/nd2J5DyaNKY7LvXleEdRi07gOZPPIL8ol9/P79tGSi766gojK8mBndtFg4IDK
 bemR+cuVWBE4x4ia2bKqWV6yhBjuh1f4iHgF9ufWsNUlj6HWUycL8F2GgOqLosoVgd5b12wRHW9
 H74vyf/RilmIZFB+uX7IxxBSXgqLcp+8hSqYVUGCDFPRQmW3JlnxU5k9WEP61B3oPkj9ls2G8QA
 VP3VlZVDlMkdUCJj1wRI8iTN34fzfQhyMBu5T5NuntD0PTJs//8oe9SEEGuAESnIN0XI0iLuZV1
 tTsGaXlJyDUWf6W7RPiGhKa+tKuryaEaDle9eTJPODUOd+ojxNpoZug6q93ES9K3aT4xcqLqeIr
 O6yIq+CFne2ZvW5BEfEecDf84284qcMS45XGM9g5EZohwSq1V9T1VFhHvMUNhwJpEJPLJSE1xN0
 QknSk9QCYo6VjFNVpPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230102
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104287-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44E1C450CC6
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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
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


