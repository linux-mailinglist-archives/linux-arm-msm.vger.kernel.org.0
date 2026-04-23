Return-Path: <linux-arm-msm+bounces-104205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HEMGdm16WkJiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:02:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D28F44D640
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F377B305A8B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D216F4315A;
	Thu, 23 Apr 2026 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlwPNmMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+wvPr4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DEF3CC9E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776923990; cv=none; b=gIu/0m+KyyIkZ5VHmBmH1x9djEtJATMF2PvvDZ4TZ8553XKMa38u/ZealE863KIjkMt7+9yWlbRdW95e26QSKrh47MXa5t+6qKQrynot1ov0qCPoxpipLgVGjJ1LPjcIu/w1NPXepWZcpQvj/B7svxvWunxyc+ThJRE7f1WoBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776923990; c=relaxed/simple;
	bh=8bFKWayiOD8BO35QIE783r7n0Cddq+lbSeqnN278Nuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BjKAGSVtFmIPO0gRdLzxA14UH9nUXtPQkwvNLWwnhutZ7X13RUAnWzh54n8oeeRdShfQqcNLa8JP6ipFsvpcTQWTEEEf7wpHkMiyF5FPWjbUR7RS/QW6KKQ+8wTIVxig8HyK7mxZxKnZ838VTKreE92G/cMgXUshUZrteWRCRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlwPNmMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+wvPr4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2vuq0872752
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G/YQ77xR2B2
	MXHan+TOEUNPPbNxu6iwvshjfvxmP7Bg=; b=hlwPNmMFCnpXU6+x4RXcvqp5M4D
	jqj0zosxJxuUtOfg4J3ORFSsXd6V6IgPFBwwIS/V9LBkhSRTHgcIF4+X8YMA277g
	xV3CvXYpOfY6FfptYZS0Niz1CANCejKkNViazA/WoexrFkFB4JSkNB492w9BZ4C6
	IwUuJ8zQc6JDKxTz0OXbFtbx3reaEPuW3UEJYdNaVWm3D0Zos8JZvX+0U36LvGZB
	BAtdXejnAjG2wl2Bs5CS5ZVxOCUZ0E3rkBxO6jhGqTe1eRy74VCFizT2gSheIBkg
	rJ8Z+c1fxEdIKMGG8AhDNoTOq41WxuCqp+0D8yDJzToPXRlzCdGYIX01vmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh2de8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:59:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so6698571a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776923987; x=1777528787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/YQ77xR2B2MXHan+TOEUNPPbNxu6iwvshjfvxmP7Bg=;
        b=N+wvPr4UIR8irG50Mssp4oVwvRuJJsP7xma0OP6/O7KEkAap8PjahGgev267Az4b/h
         zDr1z7gwEfOLpkjddsP15tyCKJ1pEwdK/rj5tXO2ZmpOwp9uQsSn5V1VYKsRT7SpmatY
         GYDws7pd+5ObxZly/v8M3Wo7MnM8e8+eYjboEQYYyt+RJO+iZIWj5Qe3X/zx1evnldhp
         cIaGs3I4ni87r9pQxIAy8Bpiz10Kmja2AJ3g5zpcvSOb0+6KE2ZQTqBOPkHGdgfdsCmz
         L8cMcOKhZ6hZQHwLllp5fb6cserIZCJfp0mrykcz79HPoIms2ViG2DlTARu5VqXSEVPK
         D7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776923987; x=1777528787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G/YQ77xR2B2MXHan+TOEUNPPbNxu6iwvshjfvxmP7Bg=;
        b=EyFCuwwPcQNzvi5rf54qBAkhYGdj9UuWIbJJtzv5yXzaPv1hAP2JVPwSsLxQ1/9N7B
         1MFo+Cyp+2m9PAZWtWqvklUFrQFjCIwZUuo9s80gN6YpH6DWsf/pWa922FaYgQ5htDCx
         QGVoyqxDVRZb0cgkfy65z3XiFWK+K9rESgRJHS45siWlE6RfHrc0AV8KI+RDFfWhtA/9
         TplA1SyiiaxRnP/7XLO+34htlnEjNCLKUyY9y159H/9UVNfgkvlI60ldjeBdDQHEqKn7
         OBZZ3ObR8vZexf5b2Ghk+l8VclLz+8b6Rb2oFAHdp1N8AW02e92Hc1GTAxB3bsh+61DD
         2iKg==
X-Gm-Message-State: AOJu0YwddacH8VKPkTFUU0rt6Vi0D2/W3k29RfKGaNnGuKQgtzLZ5YdY
	lB2gkPhmdJTIRov/hGv5Ms8G6TZY+3v3WFvk0Bl+ZhkJ/JJ4BKlfLRGhLoorfXfXwfu7pVJpHsv
	2mkf2guxW137VFXHX69XCcrx32PpVE0MU0sFN8Umw2vI6vjAGr35addoHm/ZppkKAc5j/
X-Gm-Gg: AeBDievSdIfrl8FNvj1bwDKFGTiyPW7/muRcetbazE4uPTq51/LKKTaQJTrWrUTpPJD
	iyE5EPm9uo2TIMAUlOasTKlxzLtZrHi3eJAJuxms9pyNXVr96ES2ucwpYwshjlbRwQv2Axl7EP8
	DOEnti6i2xthQN92DHr9KJEuLOd1+c5+Eo4kvONBooPmFWWUUpAGa7h8BV2VbFcquuft5KrozAT
	0aEwl2faVQclB0PFajTgnzu+t4QupiGO5bUiiaed2wljn2GQrR+kcsuFn3LtlWRLphZfu57/TLi
	L1HgScf/v5jkjq6yOK9E1j6TKDbBOrjCiIIrjQri75ySgBn3lR/iJsPwXJFJKZseULjL78QYGnP
	RgL4c2DNO94oDl7g9nq/h3BG1CK43gt+zU52s0QcmDqSeHo8esOqFgL4a4hajBGlk
X-Received: by 2002:a17:90b:33c7:b0:35e:577a:73a9 with SMTP id 98e67ed59e1d1-361404ae4e1mr27534175a91.26.1776923987310;
        Wed, 22 Apr 2026 22:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:33c7:b0:35e:577a:73a9 with SMTP id 98e67ed59e1d1-361404ae4e1mr27534140a91.26.1776923986748;
        Wed, 22 Apr 2026 22:59:46 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361418c3944sm23461841a91.8.2026.04.22.22.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 22:59:46 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V6 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Thu, 23 Apr 2026 11:29:14 +0530
Message-Id: <20260423055914.3566684-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423055914.3566684-1-palash.kambar@oss.qualcomm.com>
References: <20260423055914.3566684-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA1MyBTYWx0ZWRfX3QshWXTRNn8t
 4gBfCu6ugyTQkAMFsVl/m1N9PEbhIl95cOXsQOt1BUaK4UDmkqNezxsX2/e28ghWBZZ8JiJYehb
 v8VD8KQCdzTmkQfYEi6Z3lfOq2/aIZhXu9gyo9qx9OZ2IZkjsakvLXBVHS9qKra3cC/qd9IRpLK
 B+lbTUmakQG208oVJn9x1HBuaTVAsVrERPELCeycn7Jzp9c59qgjY7jvhi1z2PAey82bnqohIcR
 gIaYOl5LkzKO6wj9tWRU9nFpvwfb0PThWSwE0DJNylMOs1w1tfgLBRy+2LLsgLEGdFebQYJqCRZ
 ogVdqU6qbpikfpL+jVPnuP1C9Ry/AyIcw8wdh5VtyPtGoWSvUPz7916dX3EdsfAudFqzRXEEnK6
 U18xKnkI1NovwtRSM8SYEiHlWeNYBrigbSdoFSFC1UV3qLI1QJm9Mmvt6krI+xUz4Pw9aXoUt6W
 Ziyrei+KtVMOc2UF5lg==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9b554 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=gce-7N_bzMkFAa6Kq10A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: g0HEiysopPXUfN5KVRkekZszj1G6FgBu
X-Proofpoint-ORIG-GUID: g0HEiysopPXUfN5KVRkekZszj1G6FgBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230053
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104205-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D28F44D640
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


