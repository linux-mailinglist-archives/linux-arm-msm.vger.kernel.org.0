Return-Path: <linux-arm-msm+bounces-103087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFAQJHYK3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:35:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E13F8012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66A63308B948
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5981F3C1414;
	Tue, 14 Apr 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCWU3kSV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4qB78Py"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F153C4569
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159121; cv=none; b=iXREWbp9AcHkKKnU8V9K2IhKqQyifGyctARN2vR+TnHFdeInITAn4XmmwPuIz1iFC+UbhI7BLUuwkq1zRrM8j+1ShuySsFttilsws78exQNqk/4jMtlbnAWWgb7sBfesB14qgE5/pXRAlpbnHIEvB1aoiT4GWQ73RtRyhGHiKKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159121; c=relaxed/simple;
	bh=93ZtNV79vuouAa8eL2edT1/Lmp8ZOeyQQhyPpBYjjwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOCYLSMqN3yNxI2USuTBYnmsR60R9BsT12XuDccGA8u4raQ413WKkUcIP8EoprK2qxDwgWMPIjBzf222y/PoSFfg0eXGHawlyAYWEuq0l3G7LG7oZjsxY7bLei8NtrgF0//H299T76KG9TQuxV3q9LMpULn8mmMx5y03neMCcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCWU3kSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4qB78Py; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6T8qX2633484
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9koPVHXl3Cu
	mpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=; b=NCWU3kSV2Fi4p8qSK7XreOSVhlT
	iPrxydAJE1efW36AqNdu+oOfptY8S8pb28DSgkQBC3bDuSOmP768+zhHZsPqmjJ5
	LAq5TXgTmVqStIsxJ7RYMT3aeyXaDiRDhxJZKJPBa1iU0Z8poEKQPsu22+Do2sA8
	6hXhfK8geHwTP/HE0kVhToF82gec/OrskSDMp1+/4dTnAMyPPtGQshDUJIFJBeL7
	9OD0slzUg1jZc3Tf46MXJZ/JWFkUNPl6eUAQux7KJQAwc/il38GlCLCV5cHdkjKt
	aIRgoHGinWZugBzuDPRB02qWTAkc4bVGg0q1Z0ah6lZCRQY6EHoZr0c+ibA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca3gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso6484129a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159119; x=1776763919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9koPVHXl3CumpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=;
        b=I4qB78PyTeQwWRnifrRRiYI/U4ffeRXBs0zGX9mxwGo2G/kyCmOqoE5ma6mtSkc/va
         TwFd6C+T7+yqIf2YBVaQkio9Ruvr6zfXxvgHHB6fjfyA5A5mjVl0gRtirTGSu71pEFnj
         Z5hH/LMM/yiyeIO6/y+bU0mO15a2RIsLmGYgCu9+1hsI+/3XwMvKvl/gXXs41bPh8j94
         1Ym+CWlqqUb8jXP2q+Q1b8C1/0vsE/dtajzVL7aN9fcmxcEmFGgy7rpt8FRfOTgj1Ho9
         5dn44ZTNm/u2EDO9NG9iU7zDuFEPPtjIpcgwKiw5Cepvirfrv5uQYmaYLrRspox13eqh
         9yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159119; x=1776763919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9koPVHXl3CumpziFxyBQPxdRYBEiMaz/dETZ0RnYqIU=;
        b=sk6D5QgG//0fR8GuKeIlTQgUPGTbRfWQ0ZPvCVHNLqI0Kpgc0mH4Jc8JdajXvCbqRu
         m3FlH+sfFV/qbugISsnPL+LhZhrJL61f47ZFKDvc4dsCR0OWnpCQ74YCH4iSej41OvY5
         rqVf2xhfq3XObJUU49h1iYT79yMQA7VIfrL02vzDpBSvf8BI9NWI1T/EDGD664dUOFsB
         rdEazOvMqCI+9i7itH72AoFX4AOeGTtM1DW99+8LHtmLExiBJZqqh6k1fMRuO5E5N2/z
         MzY8Wxg1Uld1yuCgI0lCYZzE2JlP4ia66IaQvPi4jdpQ9rbnwmZkuCkB/5pbPzkCdCyQ
         RD+g==
X-Gm-Message-State: AOJu0Yze8mcItbYGMJwbe0sAk9rq5aXq4kjNkulJZPHAtO1Yc2dJ/gIT
	iCzMq992sddCAOguGrBXPIQqH9aq2+dGLMdOe9VaE3FyfKV85B4oIg9CH6CboIKgfGCsJOl0QJA
	o9X32RWvWf07gr7iONOlCLt+0OOTyKHf9j2d3UcE8s5ZeU51dTnKMK6ETen/uaj7dD+6o
X-Gm-Gg: AeBDievgRubk1g8XxgP5yqE4kgfEL3w0zVyA/LQDhGutuK2Vql/rOJ5K58TNZy5V5gL
	QbhTixZ7BzvjNEqWuq/ad2zO5hacSwh1QNITNUOncFPsIDYb/C4tKvPRkfBTghSW0HMq6JPWAlb
	dhImxRFa/ch2m13V0KHKzH6EAPs2rM53S6ONlKBZDq00Fyo+UuUod12oHCjAhWe+0le4A1+GWhj
	Kqbai8ch9RZJYpGwRfMDUolSm1gNjzhN4Z1ycaVBlY/FVvPydXxLCqOUAOHvBz6CnQFAmuPzYG7
	+LCf5Q93t+7t8qtKGetBTH4cSbg20wlbzixxiyNwL3fPjb7VF5hw7DPoajNDZL4ZihKB1riY2et
	q1imuD/BLeVr8zOE2nkSjxG3RiSDVU/6Hk/SioWjh0/NGzpLDerv4iQ==
X-Received: by 2002:a05:6a00:3c86:b0:82f:5051:f022 with SMTP id d2e1a72fcca58-82f5051f702mr3913337b3a.32.1776159118691;
        Tue, 14 Apr 2026 02:31:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c86:b0:82f:5051:f022 with SMTP id d2e1a72fcca58-82f5051f702mr3913312b3a.32.1776159118224;
        Tue, 14 Apr 2026 02:31:58 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c35194asm17321642b3a.20.2026.04.14.02.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:31:57 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        shawn.lin@rock-chips.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V3 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
Date: Tue, 14 Apr 2026 15:01:35 +0530
Message-Id: <20260414093135.660725-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414093135.660725-1-palash.kambar@oss.qualcomm.com>
References: <20260414093135.660725-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nG--DzrsXTmkKT0ArSVpYIDvgGLtLEBR
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de098f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gce-7N_bzMkFAa6Kq10A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX3KES9rpdTBeo
 eCUlF+7OWPIfS46/YihzSi/67U2HKG7U/aPSVt2bUaXoXbjn99Cy08RcOBOjqSid/3Lu7QooXlt
 vlP3IOGU+U73Mhc2TpChc+KO2viI5vKvCn4wP26mgv8X3kwhZkcSSHy+CzxsA7v86C2tjHeXKN9
 fRAUkcAWxHrylrSjgWbC5ePmezf6gWhXZRprBK7tFiRKwL+KEflbIBGI/DKStR4G/5SulrLnVGH
 6w9N/qWchOu17Kk8Fh7K+7tCLqGU8G+wH4T/hItT9TgBB2IVrtT6pUljGojB97JeU+Qjl7M9G5t
 IO3cINdx4RhWzycssqjh8U112XqwABO0QcXnI0l6ybOsTm0DIybXdM/VUUaZvSYYe7Qb1VNDpAH
 tVRwTWRyxhBeBTcLK3cRvvnyBXJoCd+YUEa/YbJDGg8UNK2fHpfuoquIZD4nNsSKCLnb4WBxbWZ
 qfz74F9rc8RyxShqchA==
X-Proofpoint-GUID: nG--DzrsXTmkKT0ArSVpYIDvgGLtLEBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088
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
	TAGGED_FROM(0.00)[bounces-103087-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 087E13F8012
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


