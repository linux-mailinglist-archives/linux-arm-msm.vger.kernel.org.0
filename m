Return-Path: <linux-arm-msm+bounces-100228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGbQK1JJxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:09:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66541341806
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE6BB30B1F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355853DA7D2;
	Fri, 27 Mar 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyYUOzlI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoUQRNbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A93DA7D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602250; cv=none; b=BaT0havtCjnx96bMmzwXrlpaaAKUuquaKStaIVOb4TeW3MMsAyCld9P1OLlGPdVr6wNe+Hvek62C8cZrEWsvFSjVz3idVhtN7zZPqOP7KrBtl8QX96KBeMI0ZhFqIU5sua6S+Sw5F6kSWOs6qnzIfZQMyllfeoOHwCFBUFcnknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602250; c=relaxed/simple;
	bh=L22x1sAmNTPfVGmo45h6OxTwrRURMxryt2366AE58cQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EtXgKHVpp4lVydvgPnpFJW085hfySEW6dgsc4AMIMgz+yJ2XoxcAx4cpgWlb9KwKT79RCEE6meDj1oztTyn8r036JyBtqbGMBl7IFely62OabQxVs0bzxq34FlM6xhLc3xnSGcA8d2M4cQpqTNG8whhj+1q7lmJqNk8C3qJdjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyYUOzlI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoUQRNbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6ve8N2378942
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wUm1g75HVM1
	ePzrrQoDeo9sTJxG42J2EjNdxBe1uf3c=; b=YyYUOzlIk9vqMY6mh4cpy7bl0e0
	DIjyOWSM7552V6EA896uPxRz8YqxWhd0gl32fuwO3ZdSsoyrolbL4prfXelS5XHO
	uqCQNJygaSxwGHVzEiS/NQgfEs0sTkuO/MzHQ1lCIvcUXKRWj7EELYHn+cf5eOOu
	2wXVg2f7hTvvmRjbx8Ff0tzISPudIXDMu1wOT5HWLDoK6ZdCOZhhX1bG/8RK0D/l
	jm7ts3ac7gMdKXuSJaO0mRHQyl6iQS87Ung80gQJRGr2doInjRM8QwDu/++h9/xl
	e+I7m8++ScGNNt0/J3xrUhzmFLASi3JkLzYENUKJh0rTtoMK5HLAYoegfOw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx14gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:04:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c0f03b2a1so5326398a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602247; x=1775207047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUm1g75HVM1ePzrrQoDeo9sTJxG42J2EjNdxBe1uf3c=;
        b=EoUQRNbu8lxnyfGrI53DjGGJ9p/cg6cRdYBQAYtxewrBf0PwhcmNlUt0wAwE87LFJo
         ggDajLGEvGNDGO1spE6LKK0v8PiYMP73yz2UzWV8Fkx2DpJmAKzMMXoZXV7Xs5XXm/SQ
         5y0lQDpzzJv8fKsl7KDfxq50CQZ6nA7DlbuJFYMxP4wQ55lugGu7wWzbsbAe307z3nge
         rRrcVbNyQ0IuZ7wD/JmJ0q6HFbxrdjHmka02PqqaIkyYTALaZQ9yrfwHoFfroXm5fSV9
         DxSnDCnkGoY/3jCBymbQyGf/b7Y7gJnRDqAt9AesRTrmU0j3MZsZwwOfjovwVF/MNHpg
         /T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602247; x=1775207047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUm1g75HVM1ePzrrQoDeo9sTJxG42J2EjNdxBe1uf3c=;
        b=GTWv/I8ZUl6ugKen0FbhchzBJ+tPO/rxmjb2tos3aJp0Uw1gBQzc7HdhGZ1vPAO+Bo
         ZumnLIMGoto/qyP2zwhD0TkaO6u9lPw8ZENLA1RYITggt8PIMOVxI3CLnqM5Agpl30WI
         3ra0D5yL54mhpC0X3r6cgSo9+E5WBJ7fPNU7Odg79DMEhnjIgUMLj7eXvEBHZ8QV6cXX
         hpmXrkJsX17TfD8fxoEHpe0fAZEC0iuj5RJbAFa7ZmCraQFiWBt8+Jbyi5SI5JV42h/X
         Yj2vVcIRkYJMTmX0KYlsQOHR81qUC4RtL5yTzx1BEE+NUzkKGGo7SIiDaHI3jUQNoIQz
         3MHg==
X-Gm-Message-State: AOJu0YwguImPzmrJcSsIhwA1opkwcIedsKdG+15yb7B82c2wbhB0Ovtj
	IEo2pmGEYAik4v7JaATgLlQaP7TW++NDGtD2zke/cuB/8DSMqB9k2FK3/qjYEwlvorFFM4zf3TG
	/kxtlb/euRYnNn/DwG2BK3Gq9ZQnAWCUqQCZPjDjMFlXhUyjqpq6WIvrlmpqKQnO3326Q
X-Gm-Gg: ATEYQzzdrlXlmJTwsQsO3SSCW+f2vhXaPRKk3kja3uKMmpm2fHLn34Q2ghvHgNpxxwK
	6Db6A0qXegnKpUZ90L1PCGwEKlRqx0vB3Ur7Nyr3zrOuH8hb2WyW1xL4pUTnhBavI5dXlGKwFNe
	TElemDVm+pS2Df2EzRQw038vmT6eImwIv6asVwheD4uKCd0BKZfWX6lMg/Rm2hCcmmd3TccBEJx
	dT9VCfwtyR2z+oglVb0UArLC5rb9l7+ulfg7gyTMKytwcxbOVRxlMwGDxjc9LU2ouDc+qJYMi9R
	wZ1LJCXSyTG89QeuSz5x1tu8F/7VCj0y4ECMCWrBZpNplZYGdLpZGsYE6ZM0oNWPTZJ0WVmKlhZ
	y49h5S3jvV9P/jcM5qTlVNlBeLVWOXtKp4He2i9XBLtMVEqFj9VOe2g==
X-Received: by 2002:a17:90b:4c:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35c3005bb92mr1909520a91.17.1774602246439;
        Fri, 27 Mar 2026 02:04:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4c:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35c3005bb92mr1909490a91.17.1774602245965;
        Fri, 27 Mar 2026 02:04:05 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81744sm4230006a91.5.2026.03.27.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:04:05 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Fri, 27 Mar 2026 14:33:46 +0530
Message-Id: <20260327090346.656324-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c64807 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gce-7N_bzMkFAa6Kq10A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AVN0WFqsu-_MYWlmi1m_TVtkjvrdVl0r
X-Proofpoint-ORIG-GUID: AVN0WFqsu-_MYWlmi1m_TVtkjvrdVl0r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfX0HQaFvl7RbpH
 /2u8dz3d4g7wLNTRGLMPs7lR80KGBviwq6NP/wAkyH8+2PNHDzADUr568JLNgiliBuqc03kRSzD
 My4/yegv+cTbazjOkrftbMR/IvFppvJbdwUCarqdPKyLGiYoLgxnJh9J7APNnB5SnJJ+fbjNEBG
 9Gh9/t41hxhYK7qDGDzKvrD/6AWCs2nWSu1Ad2WXz34LNMnynbfmnEkKWk6HNC15q9TBECn8ZdI
 pu07P2XcKpzN5zwA4XhPhYZwunOfJNbYEPRAgyK4QCUm4eBq0Mf0jPH6hRlGNt8Wq7unlsGNAMD
 EjJ1qrwi7fgRn7cbfKrM8dAmV75mepV1N0SyYABqPNSNQHSoX3Ch5YTw/l8EOT17LALZfjOKkHl
 Q3mevm2zGYhyJ8hWOIr4E3HhxK9SdAAqJvj+cb27Ec4GKVWIeIHrCxCuFDDEkVyYKksWZL1swOa
 MaJ53kLm0RlXvoPdjeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270066
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
	TAGGED_FROM(0.00)[bounces-100228-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66541341806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

On platforms that support Auto Hibern8 (AH8), the UFS controller can
autonomously de-assert clk_req signals to the GCC when entering the
Hibern8 state. This allows GCC to gate unused clocks, improving
power efficiency.

Enable the Clock Request feature by setting the UFS_HW_CLK_CTRL_EN
bit in the UFS_AH8_CFG register, as recommended in the Hardware
Programming Guidelines.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 11 +++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ebee0cc5313..0e653b34b00d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -683,6 +683,14 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
 	return 0;
 }
 
+static void ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
+{
+	if (ufshcd_is_auto_hibern8_supported(hba)) {
+		ufshcd_rmwl(hba, UFS_HW_CLK_CTRL_EN, UFS_HW_CLK_CTRL_EN,
+			    UFS_AH8_CFG);
+	}
+}
+
 static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 					enum ufs_notify_change_status status)
 {
@@ -708,6 +716,9 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
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


