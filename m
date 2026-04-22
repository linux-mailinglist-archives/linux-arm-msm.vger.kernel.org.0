Return-Path: <linux-arm-msm+bounces-104107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGP9N+216GmgPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:50:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2412445925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3423D3019076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE30B3B27E2;
	Wed, 22 Apr 2026 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5oqQTvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXODdqxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51156382F19
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858603; cv=none; b=A3O6LjglagyLGTnhacSA0b8Ue/I/9RtJDT2loSvJhWDgzk9IAAXq1Mx9AW5E6k0+T4fbKGZb3gYPFT+Rs30cVbcspClfpdSy7h8TuXncmuWxz+vkjGhIncnynYYFyGZDNqYYHYTLTvUSTJWPXJ92nkEuuD8F36lboqgCg/XwRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858603; c=relaxed/simple;
	bh=93ZtNV79vuouAa8eL2edT1/Lmp8ZOeyQQhyPpBYjjwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UuMNtoT5NLHC9+6AOV8yNCor0ssYkGNCaXVdQO45febi7zomqKp3ooxfub9opDelVlN830e0FYklKGEW+N51nx/KQdRsPhIVQh0vw6yQCyMY70j/hjfJOJRFMh9WQQHHL5nglCtIvoCZXqmhp4uqbtxLwRuLv5KyiehdHAuLXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5oqQTvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXODdqxb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5e0gn3730894
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9koPVHXl3Cu
	mpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=; b=e5oqQTvPFLcTI/mhg3CPLHqlBNV
	LplqfeDS4XuKJNeg7SP/ndEqo4PbJIUdSnhW764QCT9WzPBKRyUsAdxxpxVaz5BJ
	97UhPOmt3BxYSdMPIZNC/gcZRhKvmLNqjq1RdBS6K8EH6ZDnnAKWysP3fmX6vOW8
	AgmnjDfA1VR5UIgJnpvxZF5bLauee3AH8DQSx2/chRJpHucpvDlbBT+hf6QhU4AQ
	OeGuBBGV7noj6aUbRxEjnirCPwVo3rmDl0V2fYMK9zt+otpSK6WWtUTYK2rNm9uQ
	TqSuVccYEwxz7Z8qbyEURLU4tNZN74at868lDXT5bj81KRDzbBAhs6Yns6w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu4g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:50:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so108856055ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776858600; x=1777463400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9koPVHXl3CumpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=;
        b=DXODdqxbmzEScpyUkj0UYlGYL3LvAN+ngSXDRy9QmrPSXFmWEnz5hBaS4NYY4Fq8qz
         hsvPNctzCUSWFcXlsBIxN5zTTdL18fIfo+4AhvpkXzx+EJ2KfGnLuT302YJDHdtSZuDZ
         l2Cp+RE3sVtkRvENJ1+9oF+FaWQPWTJU2UTlm+mBcdjLszGtUCUTwkfN0X5wJEXNylsF
         NyMzj3bMfxQCJ5xUq06VItlZB0Y1YhdU0XK0Y+MhI38pLGT1p3hAK+IrCZEFSVOplj4q
         MMau4TZnc9Up4D+18Q841jfumtCtilw3Fk+Bupq7s+vhPxjXve7ePlqpy3H3nAwmxS1R
         7BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858600; x=1777463400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9koPVHXl3CumpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=;
        b=mwp1z7eKvC5Yd8PZRC4dLRjgqd6QDehUSYWr6vg9mtS1OBGGeCq4GNFMn0QLnH7rMl
         Ar7kdfq9OV9QhWA7PxF15dHKmbq19Fk5DMNg36afVf/QQMZQ73X19gTVVuYF1xemdP04
         kcuMkzrJvANAWH0OXL62ddoYM6BNaAuZbzLXoeUwnlpVANJ104udHPEDNiM+Te4mTeKX
         F9Xz+sTSSB3yaGJuS9enrZ1i294EIKG+7dX5tExho1vicQioD/oJZLMfvKh4Vxh2xe9w
         VGPI+BHxnK/yZViCox4cB3LUtfaipYI5d216frzcbYI/Pm8ryHbX67JndHylRrkxdEm8
         yZ4w==
X-Gm-Message-State: AOJu0YzK98itgzIBvMnwcrhYGKHlhL/kPh+w/ef41HrgHgFxd5BdWJco
	fb3TYdNYsEtaB/nL7/CmHfMWde0uJs2ZSrrnokaY/ZTGMe6UndTLsscRMvtioJCf/OMAvjDZwA+
	gv/DcGq/wHSN50dPJi7v/rsBbp6ZULXnKWOWqWPdt0u6V6vrLcXNPuiX8N6xpyifKE1gY
X-Gm-Gg: AeBDieuBsN1Eod9GshhY5E+ruypGLOtHxcaDZNPNZrZIp5FVqqHD2xxGmddMFEJcnO0
	WpSVrPpnHBxFIk3XFHWf46K2Pzl0kEpzXeTFJqsTzFV62pQWSBaGn6zM5tS0Z7tFkbonwyI2+Kd
	KrGYkK1oaPakBS3g9Oz2we5PCQMyoeRAkdfMs0cURj49A7Pe3dJQnxgU2to8X6H1lSNssc2N9Ho
	uW1DA1CuGMYPw46bPZwqLYSp/M3TgQZyWxcGZMmIyN8pGrWvNMkMOrKnwWWuyZ6cphvnLK7s34m
	dlppDP7uAlCyz8O87iP04KzwkjwyzR50G0+gW/Z5iOCnyoSG94lO1JRdqtc8VDNFM2KTcbBDWng
	pJ7zi3tSr55ptH83WGAvIH/a+v51Yro8QVjMr8B7u4Qyrqmc669J/ekkjIT7jb6MR
X-Received: by 2002:a17:903:1cb:b0:2b4:5dad:2523 with SMTP id d9443c01a7336-2b5fa003d32mr238398275ad.35.1776858600073;
        Wed, 22 Apr 2026 04:50:00 -0700 (PDT)
X-Received: by 2002:a17:903:1cb:b0:2b4:5dad:2523 with SMTP id d9443c01a7336-2b5fa003d32mr238397925ad.35.1776858599606;
        Wed, 22 Apr 2026 04:49:59 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa34ea7sm163047125ad.34.2026.04.22.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:49:58 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
        bvanassche@acm.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V5 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Wed, 22 Apr 2026 17:19:39 +0530
Message-Id: <20260422114939.2901925-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
References: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FHJdmyQT2BtJO6K1vMUUTjsl7gtgamju
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8b5e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gce-7N_bzMkFAa6Kq10A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExMyBTYWx0ZWRfXz4hQFcRXJeMF
 drdRl0Xn3gf5UIR3+RbUIyutErT77eMXUhmmobJ2aT3pCXOg2g4qDn0J/qMA7qIuEuchfVPBQI2
 A6ujXW3WdMDj5ETg2MeastKP8/dqCnAdWVpSgq6UM9QE7lSQxPYCm+ujuH8PFyjCb63zE40KwY8
 wDa53ZFk8KgQGK1gCWrxAsJ+Qpi7QzNOl2WijvO8z5h6hZBtru8i2kGD0294czJnwyrmrwy/ORb
 pdAbudhVPlMwr78SSUNxXtyB1/dq9YFa2bDM5aWpKi1SXkXNOiq4vcbNwWSY90+aXJtah0gyNX4
 NxTZmeCI9PQE0ysjzus+TyzUZiZ9t0wtrubx60oCtUe+tPRD8/4hxX0H2m06KH0HZItUzHaFx4X
 ZKIdHs+ofjL7JKSeZpBB6J2nVXit0sWKYkeNZMEjT6uyBZfrWzXJwYguROMdmraILMepGIdrnxE
 FEsSj8PlL/Gh6pqC/WQ==
X-Proofpoint-ORIG-GUID: FHJdmyQT2BtJO6K1vMUUTjsl7gtgamju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220113
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104107-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2412445925
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


