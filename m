Return-Path: <linux-arm-msm+bounces-84614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B59CABD3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 03:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5A503036A3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 02:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB832DC33B;
	Mon,  8 Dec 2025 02:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL2jIwli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FESiUxR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B4B2DA762
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159740; cv=none; b=NcXnv5NQ3jCuNUedrK6djugwYeqLVmqpHGq5m11fWMuaqH1tKaRShwFGaOaAuLkDpPyQBezEOHankditarubdU+ncxF4Luz4Nn1Pck4Cmdjgwa6Re/hY06Gv4CuEpqVAEGUNb6it7qwZRDkU4gzwcMDAFOO2uQtRm44aQuhZR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159740; c=relaxed/simple;
	bh=z+2zhT5iS1jtj/V/z+H/E0iOdnQsXlnnYnekDYlsgsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4jhMfhuvyQZ4xVSeGX303ihmZWEa+O3mHxQw9yEVidBqeJHJkDKG3dzhn3NCDE+iI2t2FUXVTZWOG9lTLkQH07IpFVSrcUd+F8UyKppInZ0Qg3cTGQMJSnMum/WS5G0a1SkzKjEBKz4WbGpLnmWSMCeAGpyVOSeDoWWuacJ/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PL2jIwli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FESiUxR6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7NdtFd3185589
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 02:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6m4yBMVpghL
	dTE/9wjzkray31oVvX3/XX9CZj5B0m8A=; b=PL2jIwliV2RXmjsH4QVQoAjYIVk
	X8g8GNp33l4himfG/2q4djnV6ODW2oOJJaxh+OjcxLN+1y9P+b6K5+mPydLWVY7F
	U+5bl7pnj1AsKXhWek1x/xuoJED1IvkZeBLmPsvvmKV+/6oNydK+1u3/+/7sX0Nx
	Q0WmeFNZsV9NrVkYYtpCzyiGMZLiDqv+9jo0FA4gzCSP1C8pfImV0Tgb+Tq5rhH0
	cp3l833Sse88aX7ghnHAmwCczSR4XPZAKajDP2gcBxP5JLyBjk8vaiLDk75tXZZm
	4OgBZoBbG8yqzQDGN3BQn/n8sBubjEJLHTcUWVxB3+tB3DRZtbCMGzjcS5g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e37t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:08:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3493fe3185cso4802994a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 18:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159737; x=1765764537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m4yBMVpghLdTE/9wjzkray31oVvX3/XX9CZj5B0m8A=;
        b=FESiUxR6w8Xdzt/aWAxxiw8IqiS4He5DPfXhotSnEGLrRc5pX1Ux1PBNs1TboKk5vT
         xzXP6FWOC61VNS64q4wA4PYsj2aW1GtYC82ZoIzMIxy9Wi2RNDTNy3pspqsqnggQRxMD
         cep5a8thUW4V9yE6frK3WnovXRmUZLifG1PwHEHICrNo83/c/K1LyYQ3tbs44y+KUd9g
         JolPwgwPQwe3zXmaMLhV0ssG6OtpDT3qd0CxbusSmbCswnsVO2dFODthioOa+a5moOTR
         q8gLJwcuwhAEVLYhafgEKjwirrZaIfQEeb5Ju7W9w0SeNGfx/fYA2Ok+pTA26WkuA5nt
         7BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159737; x=1765764537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6m4yBMVpghLdTE/9wjzkray31oVvX3/XX9CZj5B0m8A=;
        b=Ir+L14eu2EUq0kfYbmY4UknkZV5Yz3QGsdc8llSzHmsem1PPMoaKxTVG/VBTIOgPHo
         AulXruHLnXH6jxFqMJoRq+AsUO0mwKA61WfkMBdSw6S/TBQWDBilTtD7Qk3cHdGY70j3
         UZFvuv5kgomvhzehehC2HP1r/Y5+BEQj9Fr0Hz/2pd6zOzVurlJ1bBuQVbM9ubaNqxgw
         b7+QjOOksoguqVh4lKQcYtvkvMhCshkqoXrPk+U5k9m+2fZ3fzfYWyBn+haNo3/whGf4
         zTnAiZoS6C1hz5gcHIsEpfVuADRIccLBDA/WXUSrrYoCtJIxoIwJe/ISYxKK6jvpjIon
         XxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNKytz4T5ANKGlmKJn3nwg+CpOkaJMODil6ILNyX893SU9a6JD9+paakaCa3QaI/J1Yi4eDNahv0Q507av@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKRcXy3sU1ItrrKIaFEu2MHAPKJpiFIoDsmWCjZd/Pa3SzpW/
	LesnIv5Y2vCOeN4zEWvaXAqpwn+1GgGeG9bgg2cE7N6QT6aBTp7fnU6uxM393/WMjbcJe1O0Mz8
	0pJonPm8pWVvI4zlOA8vETuQN9IMpYvfii+7Cd8XMZvCxF+8KOkNJbw0UkTIJIoRcLKjc
X-Gm-Gg: ASbGncs+RDPW2ewDJmGwfcW1LNMU2HFfAtqpxRoisJ8QiyLo7tPnaTJh30G9d9zyaUF
	y3MMbfumqAx2sN7lU1cHZ1NweXRtFWnFQuSt32+b/rDJIZreBiDYMq3a3k9osmlMlgS6xUcWAIH
	7kPlrYVI6ewzIoqRq3U6GSCGe1W3QjQ/H7gJ9Q6oYPFcNaKWGGaU7YfS3NyI6dfnmbe/XWTvULI
	sKJrmljCcnVn5WQ9D7Ly8Yyfhd5NdlVikgltpqEUXb2dLSyaQNdlFLRVrEXk9O6JKSlDIlLwXkA
	OZ4FMy8ffAXhQskx7D1T+lGVs15xhLLPMm7UIPnhshohBiHa9FI12CkQmPDrMu4UknxJh7KkeOz
	FphWDdqN3rxBKNAqVQt2OCKKVz2RrwFSHYCfgwh/axSvl0/PQUMJG8ELW
X-Received: by 2002:a17:90b:48cd:b0:340:29a3:800f with SMTP id 98e67ed59e1d1-349439278bbmr12915949a91.15.1765159736933;
        Sun, 07 Dec 2025 18:08:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFNs1bJ6t1L3uGImiEkEaEt7oqJ8aG203beI/b1GtEUEXzHgekhKWgKsZH5Y+mzjJEEFs1ig==
X-Received: by 2002:a17:90b:48cd:b0:340:29a3:800f with SMTP id 98e67ed59e1d1-349439278bbmr12915929a91.15.1765159736445;
        Sun, 07 Dec 2025 18:08:56 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34986460717sm6481676a91.5.2025.12.07.18.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:08:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] tee: qcomtee: user: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:08:47 +0100
Message-ID: <20251208020844.5310-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=z+2zhT5iS1jtj/V/z+H/E0iOdnQsXlnnYnekDYlsgsA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjMucd5+fOHWEMT3FrtBL0qR0/Lb7P8bQWjo9
 xx4Lu+vP2CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzLgAKCRDBN2bmhouD
 198OD/4vkeN8r1M22JTB+8VcOOxCRZZDeyFzB00INO17cwu2eeu3wpNJG55S2DYzzJ7HdqJodMK
 G5ZCUzL9OXHp6uRPS9OiBhGd3uITN9XA33VwTGBRCK9yARKOJT1W+yo8bhxUpGeyJt5UQkjZgpw
 aHMNmFKGV7Ois/2thVVhj86E67PdWN4CTqlTVJeGJyl+yWE6pDUltC1YUStTFRMOrKs4HXMRdGZ
 0/p7XVHr7i7rdCI0OMI9HK5Ib4T18mBbsefNiom4Y05YAdDgzsSjKD1k/ltkGCHTw+dFBh5sQap
 mWrbDo+qp9A/YdYLROpEn7s/QBYBwJClUm3JB/jSoOPw+OiF9FD4qiXqCcZdVUF8D+ffB47Xji5
 AGwg3+Z06qLPiR7hcusfiih31axYuEjfdGyzYufAXIb9mL+23Cp2MXWf2l6Ub3L67yPtuj6d79H
 GpxJg3B/VBRfbwRTPJTNSGODWKyJft+83JvX5wP4Ad6FenhxFmH1NoDa/O20+XMWXZpkbSfXbM5
 +Q/2bDCn2z35eGsqfUNzLs3MNeHddmYCIacwmNms4L3CCqayYjreRmb06g2p+CEAMet4S6iw/iq
 6xiC6DmnQN42Ca7F+ARSv4wvsA8JX+LRvTp6WL3nA3d5QmmOJ2OzJi+hyPXGIW5koh0Z5zhXeFD CJwz/rtck9EpiTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfXz3Xenwpx2OT3
 ZPxDCYlc7IMxY/T3LqXy5B5Hyq4LtL2b+VewsdLSOJEt1xuNblIjgEM+gIx1jJUQ7PnSSH1WpN3
 jh+ffW9XHAWoE0bqPXKCxA3swsn7/N/50hxo9pF0odHQ5HkernJ5SVILScfaRThFTmxA1RBTmoR
 PGAYadLhcioZqVjllciXANkEfq29ocAQCAoqwXFUkUg0IzoYZLDKnWaOw0DerU14x3xWKnvC2cl
 ebu3FA4/cuzy83ZDNkEDLY4P09w50SBMGL2RoDW0VtR7DGjpjPZIUpEeUIVAytC4sqqQqejlZdH
 B2eJyF/2mvjqS8vfodudkyBcv3IKtTKe/3X9PrSZSRZScT+Gg+v7lIu4ydngWsmmTPSII7iOOr+
 xFDiVQZbIZVNp/XbI/mS8pdu8X2Vjg==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=69363339 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YPuPo_wWdk5lylyXwGcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jG7EwTb7_9uKRkswDxMRQ992KL3FlRde
X-Proofpoint-ORIG-GUID: jG7EwTb7_9uKRkswDxMRQ992KL3FlRde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
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
 drivers/tee/qcomtee/user_obj.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
index 0139905f2684..6aa3aefd67f0 100644
--- a/drivers/tee/qcomtee/user_obj.c
+++ b/drivers/tee/qcomtee/user_obj.c
@@ -228,10 +228,10 @@ static int qcomtee_user_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
 {
 	struct qcomtee_user_object *uo = to_qcomtee_user_object(object);
 	struct qcomtee_context_data *ctxdata = uo->ctx->data;
-	struct qcomtee_ureq *ureq __free(kfree) = NULL;
 	int errno;
 
-	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
+	struct qcomtee_ureq *ureq __free(kfree) = kzalloc(sizeof(*ureq),
+							  GFP_KERNEL);
 	if (!ureq)
 		return -ENOMEM;
 
@@ -367,10 +367,10 @@ int qcomtee_user_param_to_object(struct qcomtee_object **object,
 				 struct tee_param *param,
 				 struct tee_context *ctx)
 {
-	struct qcomtee_user_object *user_object __free(kfree) = NULL;
 	int err;
 
-	user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
+	struct qcomtee_user_object *user_object __free(kfree) =
+		kzalloc(sizeof(*user_object), GFP_KERNEL);
 	if (!user_object)
 		return -ENOMEM;
 
-- 
2.51.0


