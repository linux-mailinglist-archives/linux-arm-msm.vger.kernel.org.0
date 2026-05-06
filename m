Return-Path: <linux-arm-msm+bounces-106101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJniA2ga+2mtWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:39:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DCA4D9656
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0564304F220
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 10:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2D0368275;
	Wed,  6 May 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWgFQ55n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyXstXoV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDACB3FB7F4
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063857; cv=none; b=IYskYSpw1EZxIwWRokoZle7M7E/MaQZSPNRJuQDAAkS47kD+DhUWO94adBQOKrwsH9SFTZNIZ33YePxtRrg6If1LdDKlRw73uvFDsX+CPgNTJb0sTgFPSotu93KInQJrTD8KxCg7qV3cQ1yGURDs1148M/eHNDVYYiRasSNMP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063857; c=relaxed/simple;
	bh=Bsv4Yg92LURSuklrwl4qu3DNNZW0L7gUSpbzqbFGu88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4VeOyWb9HGtcXDqXTS+XPqrP8XobVM9ylUfoXDsaLYWAcpONtSepRbCQRDBDGVMw1PckDSmSMxKK6u0Diny0aSPwKtWAuJ1kv5/AgalDtE8LmDrXIpRr2dOqWs39IQBbRSSVEdTaDH0h59HRo5LKYT+IXgaJxqOWYCEXvPEYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWgFQ55n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyXstXoV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466BUkg152048
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 10:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3b1Hkkrnq9Wn9z2Cy/Er3dKGMkRLzR7aiAbEhDPjqaI=; b=SWgFQ55nPzISJruw
	WbMJVj9Pt5w6bYfwLjYjw0kbK4i1ZqELr01KlhWjySs7z0k6WALbJVuLd0U7gUvd
	060unEcgrOfO13K+n0UF5t9qo3B26CEa6aRBz0KEs/2dDYGuAASqcxjtOKqhSWPj
	qUUv/Jsm3VoVrigQ3B0d7puH843mjliaFexfsNwu2ZS8qTNzi7OY0yqFlV9cAYPh
	9FwDnIGCATCVKHa9osJp4oTR92pE3z2f7XQ47zwjGgO0YzOlxkIqWLLNWb6noGSu
	uK7msP6W3vAgeQE/gDKH2DmM6lOAjxSWf150p2Bms6IkpNV/6TJWMRo9UsyluYM8
	RbkMQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80c9s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:37:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso3497365b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 03:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063854; x=1778668654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3b1Hkkrnq9Wn9z2Cy/Er3dKGMkRLzR7aiAbEhDPjqaI=;
        b=HyXstXoVO+ACOEjQJtO9Uftt/havkyd6r8E4VL0qRSnioxH6hboZfD5tiL+L6DQK/o
         q/lyS1vQ4BiXKpqIZFZOCHwlX0naw+sZbO25uWUKmdf0/LvCNwPi+EvUMwTewTJtudAt
         gf6AqtQRicptfucinWwTYqsPRya3ihqefaSQ5rdna9DwKTMkh05RCUuc930C16AtCmNc
         ThDkNI90IXpPFRJlmHuebCNfTCIZeKXgjZJ/RhrmVNErZmvc+8iSA3i6d61QvOD26KGW
         Qg55Yo/jVsUc5UdZrMJdkoEmaV9TyH/EiHYaPNatnso2qNsuyCDwr3gk2CNLND4FLiMv
         jxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063854; x=1778668654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3b1Hkkrnq9Wn9z2Cy/Er3dKGMkRLzR7aiAbEhDPjqaI=;
        b=keXBSEXBBi2lIwDdlnTVVXzt/KwXSyVruwONOQkqd7BdH9nlanQH/KIHrfG8FKtyiB
         V2fSDP9fJuq+oa7GMblzpsFCoXC8f/XFSVPOS3Oq/eWHZ+c7RkEWuV+Q00nQ9Q72UKBM
         WuqZIAvvX+i68h3Lwuk8OYWQ61KqldmxWgVk3vvqcuBR6G969CQzmx8meKV7IbcW7oo7
         3BhIAnoZThLSLS5HNDgaIwX6e03G0mYyTVOWqM1aZ4UL1lLDLfL7vzhhvYOnvbuJe4M5
         mo2oJkB4WpCbX9A7Um0v2gYMB38wd0/WmtCik3Q5DDNjriD5THXjUiXAdGe4bmQGfo3j
         2sKg==
X-Forwarded-Encrypted: i=1; AFNElJ/CNYyydf3C9HOtTVWZ7Fb2dQTmb46CTAAMd/GIThM6ADuHrepsis/frEtZDPuqIQqZ7d5It/ewJSmW5WK0@vger.kernel.org
X-Gm-Message-State: AOJu0YxWoocDONLYMf6b+a18sIagEvYRP/nexZgro5U9WnShu0gh5wD0
	2pvxSouprIsXR6LaK90ejsofGzQFllWLRxLp3x+yaxFVZ2grqf4cZH5my/JMKuOrHswGXgVqt5T
	3q/+xzmV635lx+0LYqXMaIWTOyzey8mcNeTHwwCkPdSTrN6MI21nBlGkezC1tFM9ZBzcxJgvYmt
	zZ
X-Gm-Gg: AeBDievXeixkZq8wzKXW8BKQ12h7dOMCC59RafQLoSrH5MNoq4adn9BbUsdL6PdlbBd
	J7RJ3yp1YjFrjJT9bFuyyk06iai6fIzC6rIHWv+C1CZCCafXsTSYttCuE1n9ERVqBYeqMKDUxBN
	OU2hNe4YNPonRfHE9rvRKWpeIrChO9sTgFwJ1V7XsahLnkCnmLEhchEEdr5n0D0OVWRVUjA1fph
	9oF8qVu4Il3HjsIXVuGK2uBClNRStX0n6H6ZWob3RPR3KJUeGHAqQZLoBAZYK+V/qnAMfvsvgaE
	CkQTdGN6fE/ytO807ywHHTU7S+vPMVcF0UubmoEAtGlLOteY1Cn6iJIuUm0Pl6TmmJkSUle6MgB
	ZkCWUJaAnU0rn5D6C5ZPJd4njkP3v+Lr2S8Gz/hhi/hr36tm+x/9pHU2JZOCnwwBVWxN/P4mQ/i
	GfrTfM65GnlwwuqxHsSZrOv7x1pRw/y/uZUHR8wRN6x8YdEc3Kk5uCUsB35JuNkQ==
X-Received: by 2002:aa7:8889:0:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-83a5e93f5dcmr2834091b3a.48.1778063854281;
        Wed, 06 May 2026 03:37:34 -0700 (PDT)
X-Received: by 2002:aa7:8889:0:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-83a5e93f5dcmr2834064b3a.48.1778063853778;
        Wed, 06 May 2026 03:37:33 -0700 (PDT)
Received: from hu-yrangana-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm6167123b3a.20.2026.05.06.03.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 03:37:33 -0700 (PDT)
From: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Date: Wed, 06 May 2026 16:07:14 +0530
Subject: [PATCH 2/2] firmware: qcom: scm: instrument SMC call path with
 tracepoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-scm-tracepoints-v1-2-4bc983264014@oss.qualcomm.com>
References: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
In-Reply-To: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778063845; l=2570;
 i=yuvaraj.ranganathan@oss.qualcomm.com; s=20260506;
 h=from:subject:message-id; bh=Bsv4Yg92LURSuklrwl4qu3DNNZW0L7gUSpbzqbFGu88=;
 b=FJ3+1m5chx1KKuPog3SDGlHAvRI4QRLZKVCCPjVGl3ByzTaswrplMPpF8wdEEULNHb6HKrash
 3fD0Nh5NkdLAjD88rxyoW7ttQ1n4RFXo0403Y0Oq1jvRIqOWX7cGNsg
X-Developer-Key: i=yuvaraj.ranganathan@oss.qualcomm.com; a=ed25519;
 pk=ln7RObom4c2W8MEnQqwZbOi6X198/6toN51al5+6rKI=
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fb19ef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3FqWZPxWWeaEg-9cAZ0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Xq_4yjWNWGgTUjh02V_bx4zuGu2i6It7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMyBTYWx0ZWRfX1tASiLjPazTO
 mdfPpwfxAujSldS15LzFqcGNOOtncxZD1gsl2oMT5Tu8kCkCpu6OS8CAai4rqwlj4L6lBZfXBoC
 5mWQjleY5RYbCK7oCFP3je8bi9vaPDHvpBjMhntyIzuYR7H2YqktEiEDIvkJt89WbIX9w4xphP/
 gs7NvKXErmm8hTMdmkN7O0jl1xjYp5xcCwLuhKduTfYzMZZee4DGvdbhB+/XMNkdY+cSmNHK8Zn
 6Rffhs8AW7GnU9RWsV9HDBkFx6mcRljNCMlllu6+Q31j9VS3Pae7x1NWDglDpSJ+4RC5mqfrYSE
 NLQgqAg4aX4/yNwHF0fHgpbXZYTmzH47S3zyjSNFV1oqWNe0v9CZP/7L3kkt/v0Avg4g4pXwMm9
 68Bk6+qWyDgcgN3tbRfdZPt/Bf1DxcLD3Wr0agclHRYngeHJ8R9jJjfwTTrw7wZmIumCLlzMBZz
 ZkfaZgnsnZCFV/pojrw==
X-Proofpoint-GUID: Xq_4yjWNWGgTUjh02V_bx4zuGu2i6It7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060103
X-Rspamd-Queue-Id: 58DCA4D9656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-106101-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuvaraj.ranganathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Wire the five tracepoints defined in qcom_scm_trace.h into the SMC
execution path by including the header with CREATE_TRACE_POINTS.

Signed-off-by: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
---
 drivers/firmware/qcom/Makefile       |  1 +
 drivers/firmware/qcom/qcom_scm-smc.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 0be40a1abc13..b679d3fc2c26 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -5,6 +5,7 @@
 
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
 qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+CFLAGS_qcom_scm-smc.o := -I$(src)
 obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 574930729ddd..01999c22659c 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -24,6 +24,9 @@ struct arm_smccc_args {
 	unsigned long args[8];
 };
 
+#define CREATE_TRACE_POINTS
+#include "qcom_scm_trace.h"
+
 static DEFINE_MUTEX(qcom_scm_lock);
 
 #define QCOM_SCM_EBUSY_WAIT_MS 30
@@ -44,6 +47,7 @@ static void __scm_smc_do_quirk(const struct arm_smccc_args *smc,
 	quirk.state.a6 = 0;
 
 	do {
+		trace_scm_smc_request(a0, smc);
 		arm_smccc_smc_quirk(a0, smc->args[1], smc->args[2],
 				    smc->args[3], smc->args[4], smc->args[5],
 				    quirk.state.a6, smc->args[7], res, &quirk);
@@ -83,6 +87,7 @@ int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending)
 	if (ret)
 		return ret;
 
+	trace_scm_waitq_get_wq_ctx(get_wq_res.a1, get_wq_res.a2, get_wq_res.a3);
 	*wq_ctx = get_wq_res.a1;
 	*flags  = get_wq_res.a2;
 	*more_pending = get_wq_res.a3;
@@ -105,10 +110,12 @@ static int __scm_smc_do_quirk_handle_waitq(struct device *dev, struct arm_smccc_
 			wq_ctx = res->a1;
 			smc_call_ctx = res->a2;
 
+			trace_scm_waitq_sleep(wq_ctx, smc_call_ctx);
 			ret = qcom_scm_wait_for_wq_completion(wq_ctx);
 			if (ret)
 				return ret;
 
+			trace_scm_waitq_resume(smc_call_ctx);
 			fill_wq_resume_args(&resume, smc_call_ctx);
 			smc = &resume;
 		}
@@ -201,6 +208,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	}
 
 	ret = __scm_smc_do(dev, &smc, &smc_res, atomic);
+
+	trace_scm_smc_done(ret, smc.args[0], &smc_res);
+
 	if (ret)
 		return ret;
 

-- 
2.34.1


