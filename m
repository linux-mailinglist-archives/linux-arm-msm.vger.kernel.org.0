Return-Path: <linux-arm-msm+bounces-84612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECEBCABD25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 03:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46A8230039CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 02:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85232D7DC4;
	Mon,  8 Dec 2025 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuWPJJfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bByFal6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA42D7DDF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159736; cv=none; b=FVBGVDvNWqMiOpoygYhkFplmnZj6kpDJ2YSHdozByQYJj6JDQBQOf9DN+TjNrEeQJmNmHs2xXSeafz45cBArcUvDZP7vuRrQs1g/YHAlUpHeN5b50H+TjdyOIDtf1+2JpCPQTG7PLgO/q4+9iBubDwDsY4n/pEvF+yLc3szmH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159736; c=relaxed/simple;
	bh=w22HP/nWRJ9nhoyTEjTWOnQ37ZAtJa5ZC5/dfp5OLeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFh/0NeIqo+Eh554qDaxoQV60K7Z5nURTihwRAH9/YRDlmUIv5twiS9Wbe6dHpu2fes8rO8/WTg16UGUP2lrUBTcsTIoEx3pGHwtCvVS0MdLDCtCFPYO6ubBEOiIkoIkI4GRhzPOj+3ly0UAQ4F6TZd9QZ95t1FcBz75ke709Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuWPJJfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bByFal6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MkLvR3662047
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 02:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3WGP91XI/V9pC6GHpPekKA9aM8v3JArvb7k
	xBbMuT+w=; b=DuWPJJfae82nm9aSa4NLHewlNBhNqtxTpAKhFVcogm7V1nbuKfN
	yeWDSvUJ8gsOjXmHhViBhMcuuF2+mIuXuzDZ/7OpHpiLz8RIPVcQfGa73VeIwNyF
	na+GS8bgINAxik9G+Kf4iqyhAM9BXpYaHZE1Kb8waLYkKVtfbLhEnsECzNSq+dBf
	1biAouLKkRIzMW7H1/iV23EhkXHUHZjFstAwAs8jZljtAVBq2MRHtkQMcG9vIFBC
	JfoGNz9xxfves7p+fyOqLiXaPBviRfZTqg8XYmcheJy+mmOS/KeA7pdJH8tdHTDV
	p4nvCKPkk10YxP/dB38jHMcFoV+z7QjMnGQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wkb2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:08:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34740cc80d5so7922627a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 18:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159732; x=1765764532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WGP91XI/V9pC6GHpPekKA9aM8v3JArvb7kxBbMuT+w=;
        b=bByFal6zkEsi+B4fW835IMfF9h1m8lqnNrakrR3299xLjel3QnafPUtrMNQQGutZGy
         268POeQ1c5AxqXDnz28ffulWmabjQMRG1l3whB8vWMMQSCIYaFVnDRQRcyZJul7uYkuM
         BbCJzZJ9NxTBcxNalYqm136Tj7dekkxvLelOWzAHnQTQBx75zGxDVaWBuM5iRDmYEKjD
         uSywEJb0cYt/m9eW97unvFYdSlXUaioLRiqfKx7khQKfZ3c8NC2+kiN3jltEaTsjzXw6
         FdFo3Z5gWdBbwZstWy1JatPaXUbJM+p45ViMo8EnoY4Lwfrg0K8cKyaRmS9A3uKnhs1H
         jIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159732; x=1765764532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WGP91XI/V9pC6GHpPekKA9aM8v3JArvb7kxBbMuT+w=;
        b=anre+7cPYUMSTzMPx2d/JQ/lfNwN7A/LEPKlyxO64lUwpCUihq8R1MOcveI0GFGxBN
         /8aIbPL9pp/S5EULJVemcXqTIyIGlNsebtrxqDURO4LO9h7dGnVwgtbjb1BqW0gIGP4M
         mGSCkOuLwlfFIY9BEg0kmbdxkMjAUUBtHCjjz2ymZyRuxm4kG039ddIpNMI7RgPONla7
         Wi1ifo/JJTqI1LNGn7GFx9b9dxEe5A0oj06/fm4X4QaZSj1ZLy+pRV93EtTMxqnaw6qG
         y7T5XBcOuSQGMiTOOCXxgLITHE93mzCCVfudWoJjxiBT5nPi1MXQ7g18z9TnjTXQHqjS
         j84g==
X-Forwarded-Encrypted: i=1; AJvYcCXiAS5uyE++dyiQah82a1QSMunAhmWi6GdMiP5euRiQ0C9XLs9rHZtv4iz4iTsdYW0aE7vkUbBg8UM9O9ss@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIfUfc8YJwqpG1WI9wWAKMzz1zdUKxBU3SLB/jO1up1OWpxMV
	MaY4XA9WjEiZ32493NFWL/W6ID8PyUf8LyBUvkaCvHBsIHk1j0/9Kim9947yLqXa18h0dMmJWbL
	boZB3PORxRPMQZveUThYwcCdQv336kePnzzxae2ySeU2YVV5t45m6UF1RG+/nEMbWBWEC
X-Gm-Gg: ASbGncspQGczV7Gou7ts2vjauWynO8sKtOMIFB4Q1I/sxoOvgjktyOfRdvEj3wYM8Zy
	uJeZCLBffZG2IZCsmGGmBqmZOUwvMnaOJc7M9gOjRD/ffci3DEJ6FmDPhYNrnDRXkvBgRpSfcPZ
	4zZSyWx7Smnzb8xaZiE4T6oC0VgPJ/FOFwvtOsbe5bSwDSjbgrekyW9xmwnam6cSsGFs7AS5X2k
	rlCAvSc4alwn/sAdLWsccphXn/D8S/nTFXIUqsYGD4NzPBWt8N51UHtSaBCJcYan8weugz/8grV
	gmfOkQaAcP0NwNSQIWmRE7MTR2HeeZQU7ErOZWx6ezIBhpNkUasxCUQxRqcC/XB1dKmdh3NXuEE
	4f6blDuM4isGLkU1F3mZo5VVr/Wcj9Xe1nL4XWZ7tvBOnKS2FKnimsrWk
X-Received: by 2002:a17:90b:2fcf:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-349a25bccbbmr4669254a91.22.1765159732469;
        Sun, 07 Dec 2025 18:08:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrG/5bwhMAhRxYN0RWld3QNF2ZqZ5pChxoPhW9jJoYuDTIhqiBe8YPegtrhEZ5+5m+3NFPEw==
X-Received: by 2002:a17:90b:2fcf:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-349a25bccbbmr4669233a91.22.1765159731996;
        Sun, 07 Dec 2025 18:08:51 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34986460717sm6481676a91.5.2025.12.07.18.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:08:45 +0100
Message-ID: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2937; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w22HP/nWRJ9nhoyTEjTWOnQ37ZAtJa5ZC5/dfp5OLeE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjMsmjXlLw1xsJumQ14vmDefJJ/qUkCdcVsO+
 tSM1ublOJ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzLAAKCRDBN2bmhouD
 13LhD/0VSMflZEH1bwUcU87tggaD+IPWfPu1oV98XZbYGoYzGNCHLEdoFrVAPnJ7jOEidBdwnYl
 dn4EPipxw9IpKyOKnlRzaoU19U5Qx5X9vGxmS6X5h+6hUCS23hfdya1kMZ56FDEX/5QWrCxfN5T
 YSnWnBf+HN+cBQcWwQLQ6k+oD6/KVkqPlTizkI4IbQ8DeWOdowqTluoKrQfTcQNnBby3mVIUckr
 /p2FpgHJ8WcqdvGKfqMhELcJ2mDS3l7sF7lxBd3NmhX2+hCvtvSWpwdH/V4HRtXeLGrLdMunSTi
 p8ua+AA3dRQLRrHyPF4z++JZ02bliPtJeMJRlxZq7jQLrTZxyImttlU9IYKMr5AROeKd9x/4PFA
 h9S9e3uuA56/I0GJkPEKd7LhKfuqrcPVU4pS8A5VJyjjlgGSypMC8ktczimruZip9jdIJyP3KoR
 tH7rwm4aEDmtfWCJ34q75CJ1d59Jl9eu7WMuKeaCaWHqj0Tr7TAxt3s82jdv6v2Qlx/JleEt/rr
 5awpNAUSHp/SN8Sn/9pg+Z1okK6z42wdky0FNbOqDnc98I7cmou9XLCFp3Iin5UMR1Ctrydd6BG
 B9XRSOYXnQ/LOLFvzUImohsbYEXfYA1fjkTh5UpNveQmx1syPD31v8MHsmwg1FhS9gDPK8TGpsP nAF6mq+lk/pNThw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8iNWxwDQ8plxEDJtmpfgpTve2E_xmAEM
X-Proofpoint-ORIG-GUID: 8iNWxwDQ8plxEDJtmpfgpTve2E_xmAEM
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=69363335 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bnnKY8jWoa2RUCiOtN4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX4xrMtoUInkVV
 JvFHeoB4O36u4leyJPr01a3aIe93P78zuuk41d+zjlATpqJH1E155k6P15VFwlm6YYBXeDYDzNq
 57Lnrs6QhmYcOUhqDMCFq3PfG+vA1wmFIpNXml5Th/ULnUVxzDAlgxGCxq9U/clz2EhGEK86ls6
 6tDLnAbMRg53+uAhxHjsHE9SgKX2JJ3/sy1JNDqu8vdqEyhmq2S8KF3NXBsrOw1e7bXjzu4KmD2
 c7gZpdvlRHRyfw5Z56UocZViKCKSKxxVhfJtZsnOtWp9eggyN35rS7eQ+LEnDICDiJdGuDi5227
 nfCjau64Vskc0l5LweIW3voOoIs69ucpAAV2mORis3jotk6dg6R4mqw/pVqdA8sksdoj5beNynF
 ib37UV/IJTp5aqT7vaEPWweAvIjnbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 65f9140d4e1f..8f8830f0df26 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 				 struct tee_ioctl_object_invoke_arg *arg,
 				 struct tee_param *params)
 {
-	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
 	struct qcomtee_context_data *ctxdata = ctx->data;
-	struct qcomtee_arg *u __free(kfree) = NULL;
 	struct qcomtee_object *object;
 	int i, ret, result;
 
@@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 	}
 
 	/* Otherwise, invoke a QTEE object: */
-	oic = qcomtee_object_invoke_ctx_alloc(ctx);
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx);
 	if (!oic)
 		return -ENOMEM;
 
 	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
-	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
+	struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
+						      GFP_KERNEL);
 	if (!u)
 		return -ENOMEM;
 
@@ -562,9 +562,8 @@ static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
 
 static int qcomtee_open(struct tee_context *ctx)
 {
-	struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
-
-	ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
+	struct qcomtee_context_data *ctxdata __free(kfree) = kzalloc(sizeof(*ctxdata),
+								     GFP_KERNEL);
 	if (!ctxdata)
 		return -ENOMEM;
 
@@ -645,12 +644,12 @@ static void qcomtee_get_version(struct tee_device *teedev,
 static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 					  u32 *version)
 {
-	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
 	struct qcomtee_object *client_env, *service;
 	struct qcomtee_arg u[3] = { 0 };
 	int result;
 
-	oic = qcomtee_object_invoke_ctx_alloc(ctx);
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx);
 	if (!oic)
 		return;
 
-- 
2.51.0


