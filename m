Return-Path: <linux-arm-msm+bounces-117833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x4hrG/4hT2oRbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:22:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31A72C8C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:22:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ETWhkHh/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=khLjsrV5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BBB6305BA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 04:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEFD39A063;
	Thu,  9 Jul 2026 04:21:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E629399D0D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 04:21:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783570867; cv=none; b=rFHROBWeh0Dp27ZHESS7uVxjaYMH+J2wGT5jyiz6X+lmn2M3s0G1JBIt7kShoj5s+pnxi7rxw47haTL3ELj30Axgz5Mpbz1AeeFAMZenXJ4qVwtLDcl7LYrmI2T2C8Rob1eIouV/jWj1IEbngHRDt4XFAyc5BrGIMSY/Y6Lx+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783570867; c=relaxed/simple;
	bh=x/+r0WCxXhtvsxLk0MJfIGA9DJGnCC94KwQw1Pqe8RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDZM3nPhbBLCzRUCJY4BbxuJ11GPdSdapSroZXv+49UIZJiglouiRMeWYKAeGpsMZKH2o53psEm6ynnYLPhdmyMC+ZKr4iM+uabPL5RBpa14H+3ECbSGs73RXQs4E/LXbFQd/ntzZUz4D01XqBURHKL0M6l9TPun6/NjHjLsYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETWhkHh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khLjsrV5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668NA2gC003463
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 04:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdxbWtKb1vLZTfYD2ty+3H1szGedPOtaWbhOclXrueQ=; b=ETWhkHh/zslQr61a
	vNwiAk4RxaPhhieDbVwzKuxyF50idQ2B+hZqj1ZJMGiS/WpCh7EovF7VVNKCZwVb
	FlCjdKOTfENW0ynXfoqjF5BXBZVbxKhGDtMOcB1uve2/MOQqagPNd57DFSa1190R
	Q4RNopiTVKK6qHVrrW7GNikVkYIE/7e3/HUU2h+I4IPdcBJmuQYJlyKXcMp2c2zL
	WxOV6AuY8B5luBNKXFlwapLUGkFu8lq2EDy4uYFT3C1CTrN571nu0tacpQ+kevVz
	nLXuYWbvXjTIxQ/hoTa1Q0+0QwLwCmSm3IvS5MrUmHF+0qPA5n/pW9XAZBdObW+A
	SPkIBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvsqtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 04:21:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9e994869aso23263805ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 21:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783570863; x=1784175663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdxbWtKb1vLZTfYD2ty+3H1szGedPOtaWbhOclXrueQ=;
        b=khLjsrV5SFGrr9qzuit/BsX+ShB+4rq52xYvkkxU5mm8E+iyMbnZHQiWu1OIHUjlkn
         aTD+Cu3z8pj/VQHW6jfOhsD3tGSsItw4auv1NcIpwdK2rhNjvpxeBgYxYQq77RnBQWC1
         dElo94yyNoHi6ZLA6Ze8iKKLtHMhWGMsL3ZQB3TkvJBxuW9F2HKMiQTtLnVxuibwi0ON
         Fce5gZEHz/rryAGHWUX5ZJEhhlyE9Hui46km2pM98Du64cx76bWGZ9+hcf4RRD0RbkW0
         REEbxajG/A/Qw7UuZNF/U45fmZnL8yt71OkoJEXKFut56IHKlfrCphOR16fhfH1rd48x
         AjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783570863; x=1784175663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdxbWtKb1vLZTfYD2ty+3H1szGedPOtaWbhOclXrueQ=;
        b=nfPfxSLj/8GzH7+JAa12RSV2l3g3c4hMrcDrbLmE9EmhCFS0HR4SuVCeM3gS3W0wMv
         tOMIk+4vhzf0u6ir0zMehRInbv9AxdfnLsf0YepuYpN8HfIB3sMk54UYbO09134ASsHr
         MXm/W96SLjO/9OEOS19uogh8+pRl20sxWXlMEfioCSGD6S4iW0XYIBxyN6KbfQny5LyF
         pZUsC1isaPvFf+Oqm+WXzejygdCQ9Lfjuxq4zGlfi8QcKftjSqR/EpdBKouZGksAq5fj
         5u/jYCFN+6eqCVttZNb3zJWQQAnYhyNvYyQM5NDkQgLECfm/wi96/VI9dgwpiiOdjN0X
         mb2A==
X-Gm-Message-State: AOJu0Yx/VmiBXW2z6aNwe+mmog+0JeGFg7OjcQPLdAJHuXnHMhLP/lNd
	57kWGe3WlmBRE/1VC6Fkp3cZQ62KMDEOX6ee0196IYZqBi2sNJfJqbUQFJFC1uzuiTtydN3q6C4
	1aGu67zKh1KTFYxSqWwm/qo0f6RwTq+QAl1od80KLd+rwn/S7wLAqx4qW+iFzEr4OuOzUDm1+y2
	br
X-Gm-Gg: AfdE7cl1EP6PjfPBhyvma4shH9OsyGF8cNXFO6MFBBkpsB+h6DlG7RdOCR6EKSLGLBg
	1VOPXbDhj8eV7T/MYHKWlWgpNAgTXZ5aDlnQtVFQChbYZKpt0H0yEJJjhUBCS1hDIouOZiwxhVk
	f40p2CQKEgh08sTeF+qM8XouOS0uyKCC3BKrrbGLMpiK7Aub2ZPq5eGZyjD44EN9Kw6Gm50+Sj/
	ZZd55u0jdqazebu92qF4ulQ8av6fo0STKpFbnIUayMDHadjsq+pgrRfLJnK6T6ekN06ffua9uSv
	AZ33pZP6l+J5xhj2zd/+mlIEOoeZHAkQ63F3lKdl5r8bLo3jHDzWlrIxO/b/vBW8a8KNSlxbrzT
	KPwWbf2mv/RVJJ7JVfA4QnBHzT10XIf4SwJaR2uzjDd35
X-Received: by 2002:a05:6a21:7482:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3c0bcbc1353mr6751621637.37.1783570863206;
        Wed, 08 Jul 2026 21:21:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:7482:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3c0bcbc1353mr6751582637.37.1783570862650;
        Wed, 08 Jul 2026 21:21:02 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm25490098eec.2.2026.07.08.21.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:21:02 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 09:50:42 +0530
Subject: [PATCH v2 3/3] i2c: qcom-geni: distinguish address-phase and
 data-phase NACK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-3-1db178c695bb@oss.qualcomm.com>
References: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
In-Reply-To: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783570849; l=4782;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=x/+r0WCxXhtvsxLk0MJfIGA9DJGnCC94KwQw1Pqe8RE=;
 b=Oo938cWNx5pvZgK8W1p87S7pXAl/lGcTpZBp5riU+IBimPSduPLPbIKl6d96vZI0q6OIHZLFn
 n/FfwrpDK15A3965ibUOSic2+UnKGOFGY92ZRIFjyxgSkdykzMWDS3n
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX+kAWcyj2O9OH
 +6iuZnYwkrokLHoREafGjwqX1OxOhZ8Eifelr9JoCIDMxoZXDnaB+ArYEvmtBLpmtVHQ1NaHBU2
 4PM8jLBOBxsf+TKa1Xd8IDEbNV0H45I=
X-Proofpoint-GUID: wS95s1XT1TicMjFttN7EuZna1UZ4UfOK
X-Proofpoint-ORIG-GUID: wS95s1XT1TicMjFttN7EuZna1UZ4UfOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX/rojiPFvkFGP
 egS0nfO283qIFyGqXxOhG0qILOb7Jp+oN4paKGut+zjsuSKraB55vqWXVpjNBdCJHKNnvMdxcfy
 2AhEAQVXDxD2Tq+/96uRV8zRTBcqxnfGG8Ja0Vj05DSTcgVY7/N131iGIJW5HIMsw+nUjNlOnH1
 xeiehRpzwaejMFs9XSJ2Vb5KMzWyxgvjzrfiRPGuxMQLL64laWjnkqrl3/cLf4k5TfPaxexCzLI
 pmK2KO+gj1sjM87uDTOG4WfzsQ1/CWpFSCo3idOLvu+oivN3pmzhgF4VC8mTp3vtM05AlhVq3VG
 7Jq/QhZnxFm+JwfsZcGYSuKVDZvQqUwMRkFRAFjWgcXA9i/4Z6mp/7p20Bd2KYSyjyirWFfsxbH
 UWU751qu59AsugBdEYkHtaNPQTMKoF9Oc1miPv1X4Tmh7K4kdBqA7wQ9vFSW/nmHaA3MXAq+jFT
 eKDeS1/CMRO5Dqky/5A==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f21b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wcK_sNrN2goZDBkbqrQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE31A72C8C2

The M_GP_IRQ_1 interrupt signals a NACK condition, but does not
distinguish whether it occurred during the address phase or the data
phase.  The driver always attempted cancel and DMA FSM reset on any
NACK, which is incorrect for an address NACK since the DMA engine was
never armed and the hardware requires no recovery.

Add geni_i2c_check_addr_data_nack() to distinguish the two cases by
reading SE_GENI_M_GP_LENGTH after the NACK event.  A zero value means
the address phase was NACKed (ADDR_NACK) and no DMA recovery is needed.
A non-zero value on a write transfer means a data byte was NACKed
(DATA_NACK) and the normal cancel and DMA FSM reset path must run.

Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9490aee4928c..b1cd027b5ff2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -56,7 +56,8 @@
 
 enum geni_i2c_err_code {
 	GP_IRQ0,
-	NACK,
+	ADDR_NACK,
+	DATA_NACK,
 	GP_IRQ2,
 	BUS_PROTO,
 	ARB_LOST,
@@ -67,7 +68,7 @@ enum geni_i2c_err_code {
 	GENI_TIMEOUT,
 };
 
-#define DM_I2C_CB_ERR		((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
+#define DM_I2C_CB_ERR		((BIT(ADDR_NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
 									<< 5)
 
 #define I2C_AUTO_SUSPEND_DELAY	250
@@ -143,7 +144,8 @@ struct geni_i2c_err_log {
 
 static const struct geni_i2c_err_log gi2c_log[] = {
 	[GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
-	[NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
+	[ADDR_NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
+	[DATA_NACK] = {-EIO, "Data NACK: device NACK before end of TX"},
 	[GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
 	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected start/stop"},
 	[ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line undriveable"},
@@ -258,7 +260,8 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 
 	switch (err) {
 	case GENI_ABORT_DONE:
-	case NACK:
+	case ADDR_NACK:
+	case DATA_NACK:
 	case GENI_TIMEOUT:
 		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
 		break;
@@ -269,6 +272,14 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 	}
 }
 
+static void geni_i2c_check_addr_data_nack(struct geni_i2c_dev *gi2c)
+{
+	if (!readl_relaxed(gi2c->se.base + SE_GENI_M_GP_LENGTH))
+		geni_i2c_err(gi2c, ADDR_NACK);
+	else if (!(gi2c->cur->flags & I2C_M_RD))
+		geni_i2c_err(gi2c, DATA_NACK);
+}
+
 static irqreturn_t geni_i2c_irq(int irq, void *dev)
 {
 	struct geni_i2c_dev *gi2c = dev;
@@ -294,7 +305,7 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
 	    dm_rx_st & (DM_I2C_CB_ERR)) {
 		if (m_stat & M_GP_IRQ_1_EN)
-			geni_i2c_err(gi2c, NACK);
+			geni_i2c_check_addr_data_nack(gi2c);
 		if (m_stat & M_GP_IRQ_3_EN)
 			geni_i2c_err(gi2c, BUS_PROTO);
 		if (m_stat & M_GP_IRQ_4_EN)
@@ -443,7 +454,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
 {
 	gi2c->cur_rd = 0;
 	if (gi2c->dma_buf) {
-		if (gi2c->err)
+		if (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err)
 			geni_i2c_rx_fsm_rst(gi2c);
 		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
@@ -455,7 +466,7 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 {
 	gi2c->cur_wr = 0;
 	if (gi2c->dma_buf) {
-		if (gi2c->err)
+		if (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err)
 			geni_i2c_tx_fsm_rst(gi2c);
 		geni_se_tx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
@@ -493,7 +504,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-	if (!time_left)
+	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_rx_msg_cleanup(gi2c, cur);
@@ -535,7 +546,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-	if (!time_left)
+	if (!time_left || (gi2c->err && gi2c->err != gi2c_log[ADDR_NACK].err))
 		geni_i2c_cancel_xfer(gi2c);
 
 	geni_i2c_tx_msg_cleanup(gi2c, cur);

-- 
2.34.1


