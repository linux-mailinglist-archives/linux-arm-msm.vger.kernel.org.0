Return-Path: <linux-arm-msm+bounces-101874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 83jaDyqr0mloZgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 20:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4639F4AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 20:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F165B3006B64
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 18:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949B02DCBF3;
	Sun,  5 Apr 2026 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEsUHJrp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RykwAGam"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974B27FB2A
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775414054; cv=none; b=IPTkOqUceWoSHRydBJhDGMb1V1rQMsEUzwCqdNG7FlRumyLC1RxfuCYaGonAT45gjQ+jzEYEh46ohdORtgIg2I7xjbIgupVaeevuy9mA5b7OSOGwPpbS6If7EutIzssZN0AWeyWoW9pNwnnC3IOiWfYenK7ph/RapxLnm5lipag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775414054; c=relaxed/simple;
	bh=rIHQYFQaf7Z31vVenFUwFs+dg0T61WDiFEUzAaHA7GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GEvZYFyCx2sTMhxPRfaclf7xi8HSg4Je9U09DOM6BYEMyVp60XZQfK8ATyqA9oqz7W42cWy2F9KVEjqYQSHGHqPfykvJgf2+evpo/goad/LbNwTkghQ6kvnyIC72AAuH3rky4kmTkWdKXg0+EMqWoCHHwNvvevdByQK3FPoBXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEsUHJrp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RykwAGam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635DdGgj704419
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 18:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v+AeVjPxl1GLotUz/UVGgs
	9oc8hGdD/fRuAHzr1OtAc=; b=cEsUHJrpFopmprn9PCrFKVIvW479gojEIz3Ju6
	/JWs7kLjQXxs+M0F1hFBUdHXMLwOHddX3G70hy30lsK4EeWGZgL0Fc5QqDf9Tm9i
	fLgrPgbDKGRtiWnMrWREOH4Jv28XjFo62ecBIua+2vgIdqUGDy7QUjn6JLoEiK69
	9IAesTilKhlwZdoJtBFXAaCP0vJF3os/M3S/rx/ktZZrK81BTNUdKeSUPA5umYPz
	DPs1EeS06LQFmaXdqY6I9lPiZulqvi9BPLZDAZTc5yiA9wrjZkAIu9gZOkt6d0vu
	H3lLkjRju5ELjWqqqz9pgQUNqajn0ivL9ln98fBlxBZk3FFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd2vhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 18:34:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c1107da15so3261552a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775414052; x=1776018852; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+AeVjPxl1GLotUz/UVGgs9oc8hGdD/fRuAHzr1OtAc=;
        b=RykwAGambwTnrRnlRKVmfR/rh6dHysD2LkwjJcUr51X9+32bVEKJYl8rJ6vuoV+ja7
         kqHKzybiYMsm1JQmIpe17zjPFbVdkgS0T9g14FWMtf2FS9Rtw3GoPqMFqEC0GbVRz9cx
         0UjRYBSbjnASlUSBY45CX6ItmNR1BWDdPCBCh/gtcGa65mPniMIJkUxDm243hVbCoQfa
         47E8hgwH8AjDEwsPL/Wy5Da5f8I1KkpysIrf+/c0Q+SOis7EHP2kofcRBxk9Z4hoQitS
         mf0/6l/MbYsKvRpHPxBCerLfGEYpNgzGRhKEwpfCuW2Pa1eksv8vxluiCkQp9li/NWJR
         Ld0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775414052; x=1776018852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+AeVjPxl1GLotUz/UVGgs9oc8hGdD/fRuAHzr1OtAc=;
        b=T0uxfAIIp/GbW7BFjiDzhJMOsYvtfxQKuChc3RjaMYBppEtXAVcmcRko9q+tYaAEE1
         J+2Qgou2MEaoSIaHZaodvMwZa7xUYno5yclnHOi/oLcxaRzwSL/jr9uvZzShn8afquCz
         TBEDYPYY3FmTSCP21Px9ouimpXvTKxIIDBMjbkQ6YjN+FLBFfVvkX33CNpNTfbczz5kr
         AhAcme58UsVGG66cbHdwffuFBuCnx3c3sxHk2lO3w1Bn717rUZKjFXijpP2UPV1Le7Ye
         +pGEAnTSubqPJ9EwRk3XCk8ZLxtNu+s5heIUadcI3tBnzFO+OZLH+scqDcNuBIvbcSri
         wsEw==
X-Gm-Message-State: AOJu0YzGQV+go5kPWXvtAvuaMBrzK8NuYIQKZYz0H3dvNUsonYISxDuU
	39v8Bh+jKGYcXAOAKCSG6gQXOCMdcP1SyzIotn8xau57FF3nx2GOesdx6yapJPQOJSzkCE8+/jU
	1RbvuM6X5s4/eOPqjuaJv0PWMOZHXnWSpkUNh2T+hIdYiNL5m2SLur1WhSZebCyoYgPIJ
X-Gm-Gg: AeBDieuhU81RsruySSoK75RyCVDZxZdqirVJRFoEYQZCQPLi4nu38jrxC7vqsRcG14l
	zsXyjTXJ1rt7W6+8JNNxWgJbbGcaR6HVwFFhv668VDag9C2sis8nPyRFmCrsk0pHMYVm9RfsiZR
	ppOyWJYRGinnAIkmaiDHzXnXmg1f57k+/Rl7Y7BnBfsjiBC9CKl2yP+NgLx735pfnEGiML2OoKl
	3R/Zr0o4ckhtdLwww4iQ5kp29Xr52KDpB1o8ovL4/WAz59ofwY32ud5FW/1+yLJmYHLy9I/v+wr
	N7q8cZ0iM7vCq1GRSES4RZoHztrmyvkq5J+eW3mEj2326R49aymUVIrrPyaSwjGY0BMvCfV6ksP
	kbrFoGk2HFmmNdlnLau+XaBhxNsg6sjLP5j8yazEF2J3rK7VWWA==
X-Received: by 2002:a17:90b:510d:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35de68f7c0amr9250060a91.16.1775414051909;
        Sun, 05 Apr 2026 11:34:11 -0700 (PDT)
X-Received: by 2002:a17:90b:510d:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35de68f7c0amr9250042a91.16.1775414051382;
        Sun, 05 Apr 2026 11:34:11 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e1b9esm17556788a91.3.2026.04.05.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 11:34:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 00:04:04 +0530
Subject: [PATCH] pinctrl: qcom: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABur0mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNT3dSczKrE+ILMvOSSohxdYwujpBRjw2Tj1NQ0JaCegqLUtMwKsHn
 RsbW1AAM/zGFfAAAA
X-Change-ID: 20260405-eliza_pinctrl-382bd31c3eef
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775414048; l=4084;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rIHQYFQaf7Z31vVenFUwFs+dg0T61WDiFEUzAaHA7GI=;
 b=QSMJt00zX1aFeziyuKMEVucMSkhPmMbziYVqU7O+MP5fC6AhPtm5CH1EPck2xpAT4UJMhet6H
 LboySXNusz6AqQmmUqPSGJ09MnSOBeyIGx1gxAorUDYvOCnmsy7jroz
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: _YbfxVXlmDQu3q910MI5L95MATDF8F-F
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d2ab24 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Xb04hPqHog99820oH2IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE5MyBTYWx0ZWRfXz6n33rFIuUTW
 Y6fFYkhqkkt8SsNGd6Evt9MKNgjZQw04uR0mXUWpMRq0+TVjiKyy1WczE8xc5242FjfriSOm5xS
 VsGi6Gr+1IDq2Ptst1RLFgTqvbOcmRUUQchZEGaM3pOmrIgEOyzjHL2JU5WTH5nJCHlq4QGKoIv
 RfIZF5artgHqRZ0PxgmYtB7bBXKd9t0sM8LzUNLmKIuFo0oOkP97/7p/bUi2itksUJ9XWXhJ+cp
 OfBprksuGHgf3ycVnQPCl+HcQARXYvVUE96d5HufMaFpyOhSnFYn9zLg2n282ztLSdeQ+TXgIod
 zVzPKMjr4vRAdXb7zY7kNrcBYNSd9K3Wlu8/V7MnaM2Uf8+5Kika3vn6ZTLxM9knHH9HNp6su//
 ZyidYn6FDbZPrVSzdcP/CQOOx79PK0gioHnxxOL5Z+j8T0kLy88prF5kchxUKGz32Za5Ghh5ftk
 uEGFcnZWcPpjM9p8kQw==
X-Proofpoint-GUID: _YbfxVXlmDQu3q910MI5L95MATDF8F-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050193
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[205.220.168.131:received,209.85.216.69:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91A4639F4AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
platforms they are unused.

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c   | 25 -------------------------
 drivers/pinctrl/qcom/pinctrl-qcm2290.c | 24 ------------------------
 drivers/pinctrl/qcom/pinctrl-qdu1000.c |  6 ------
 drivers/pinctrl/qcom/pinctrl-sm4450.c  |  7 -------
 4 files changed, 62 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 1a2e6461a69b8e7c0ffaeb15b0c20bccffc51410..4c941cbd4a12736e3ec135066a229227875f16b2 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -55,31 +55,6 @@
 		.intr_detection_width = 2,	\
 	}
 
-#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
-	{					        \
-		.grp = PINCTRL_PINGROUP(#pg_name,	\
-			pg_name##_pins,			\
-			ARRAY_SIZE(pg_name##_pins)),	\
-		.ctl_reg = ctl,				\
-		.io_reg = 0,				\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
-		.mux_bit = -1,				\
-		.pull_bit = pull,			\
-		.drv_bit = drv,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = -1,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
-
 #define UFS_RESET(pg_name, ctl, io)			\
 	{					        \
 		.grp = PINCTRL_PINGROUP(#pg_name,	\
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index 38200957451e1975b7215eae6a2d10329a30a57d..1c6d0e0b7ddb785b36febc4efdecbc84a27408ec 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -77,30 +77,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define UFS_RESET(pg_name, offset)				\
-	{					        \
-		.grp = PINCTRL_PINGROUP(#pg_name, 	\
-			pg_name##_pins, 		\
-			ARRAY_SIZE(pg_name##_pins)),	\
-		.ctl_reg = offset,			\
-		.io_reg = offset + 0x4,			\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
-		.mux_bit = -1,				\
-		.pull_bit = 3,				\
-		.drv_bit = 0,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = 0,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
 static const struct pinctrl_pin_desc qcm2290_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 7c535698a780041c2660c08d22146c8d700ce081..c9431bcdd4b499e035f48498e822fe20ecc98d0e 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -102,12 +102,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
 static const struct pinctrl_pin_desc qdu1000_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index d51e271e336101796b75d64e56f573f3547f1121..bb4e2c7714e3fefbd47a9dbfaaef542d19555675 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -102,13 +102,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
-
 static const struct pinctrl_pin_desc sm4450_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),

---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260405-eliza_pinctrl-382bd31c3eef

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


