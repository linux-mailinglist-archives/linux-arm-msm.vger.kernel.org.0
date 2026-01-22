Return-Path: <linux-arm-msm+bounces-90104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOQYLaSHcWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:12:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1360C21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 089BD8228BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE29378D8C;
	Thu, 22 Jan 2026 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmvrmMfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUH+VOe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49536CE04
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047750; cv=none; b=Za28IPb8pi4k64/W3u+7LLpQqnuGB26NUO41X63uJE81dCWcI3L6xM6zStoRaQVLfw6vGnR0ju8J0T5LScGVbkF11a57hCpeAqZNiLsTNwil8gUT6IiuE4gCPD3o+0LTXgIihfbLKsGsKsfc1ox2Q5zjkbAX4wZBGSQGKOWh2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047750; c=relaxed/simple;
	bh=1Yd4/OeyiYY49Es4IJlY73zV9yzGJi6c/ilE5vOhlX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VS5n1QvFgIkCYdw23KJ7y7s3axUI5Q9XnY0zpHXMqIVUEr0fubHB3mXnBeb5GRTZs4TPyiZD9vd+C42Dlv/DDwC218CM+GYVHiF14sswYLVvy/RP0krkeiA9l6qMOjM3jnG59AiH6F732J10KEhq91j0nv2mtjFh4NfBeC3T1Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmvrmMfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUH+VOe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M02ctf3463151
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=; b=LmvrmMfS2MrkO5Yr
	D9+fraziqK8OC/qlIsjMNuADn9dWfkkC/pM2MR++/zttxhAaynddedc0enbKgUUe
	JceSPg4vGN66jYll6F7yD5c30ldhuuaothl0H2z0HzsQvu0F91tLmqBm4cu1fYCi
	cpWWSTC0PV0oHFUDwPDVRX9FfHCqWvGjkZ6VcYMytwnquZKpwB1Bqwx0FXkFW2xZ
	gf2Z867zNFZD86ovIPzrodVdBhrAKC5+SgoyFohX6MnJVttQzwWGrdEK8GSLswaV
	bHmaChElXYpRJ3NZLpGHzvySZDAY4lT+aq7HzuTFNeqC4l8OrCya12+sEgau67vp
	+JinXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu06523k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a4b748a0so8833975ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047742; x=1769652542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=;
        b=YUH+VOe3JIulcmvvwISTIERe+wIjF/kyHRDk+6rxoaTfeTY3h4exep65BPoioXlT86
         BM3vE7HnI6hJf/nEiEMxjgW33JU1NYuf6/cV15iTrO4jnmrkEBZh4DBKpzxV6BxQv7hS
         pz4ijmaTfAKzjOhf3Sf1zt+sefy+ZPLKFe5fU3QzHo1XlPp2mfR60vjV/gMwpTo3Qff1
         jKZp5WHq4TXSuH3dI+Y+mBPY6l8kWWj3uMmmWVQeYKCxhTwrC5oEKJczwOLc9QeLGWRw
         hNcNQfJDe/KUWQ1jgk2vNsgp6lLTsAvSwWoa5rVQvKVRY1M8f357YBxMsH8z69DdkT5J
         4wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047742; x=1769652542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=;
        b=myhHRLcT+u/CTtuUqAurxD/dJJ1gxTIUSJ+YgJKyacffflECp6oYBkJM4kg9KJt1/Y
         rbSM+fHgXxlOiglFmE0f1OdHHLdnQ+qh9FZZ4ODpAWfbOigIqtOXp8CxEbgSv3OiF3GR
         A35WioNCftzbKynIakA00pznl3PmtIMEj8zf4zhy/48kwVr3hEOfQxZkv6NBV09TL/GF
         pdBY4WlAbWkn4wH2sWTjYv6JTR68SSnWRszmXEDBPW5SlYmEAReJVRv5hwKTgo2k2CEL
         EWQXSK/c+x3RQOAJDRNVBA2cZRR4bwMMYuAj20ylRyR5mbjHRSWoEynbSahONiFOMyh3
         yxyg==
X-Forwarded-Encrypted: i=1; AJvYcCVNvGoPxyvTWZvS4sydhdYvO0ONptoNybyVp6J99M3sFMmLemPhE65SG58nEXByWn3X0K37sFUFklimWVcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzV95m2D5DvFx/J4PpCFbvBM/Oq1vzdPLZcl4iuN6bKOkW2615t
	4Fj1u5ue98/xI/96nag2JFQ4NfCOnC3ij/cTMC8tavf8PvjtpmI1kcPhDydtd00Un7El/G9hoD4
	Hm5gT7v978HVoqs/u4BwZsH004Wke+06JBBkBIK7CHIZHaC/76DoPxbkyayl5v+0DyJ3F
X-Gm-Gg: AZuq6aKMeFsVMXgdYsITIMugdXmJay4YeKM2XVPIJoY2VU0gOElsKdGFluwase1+vrb
	RVpn69c5vtAspLIWRv2M2slUNx6d/y1svf7Kd3+NiMV4VwCwuRlEtZ5PbUOIyzwpT7xjGsodZNx
	LSGMkBFraPWGq0JYMbfNeaCWyjBKJtMUC4uWY2m6UI9hsgnK6vWEnwpma3RPU7Mr3jHXHo30W9L
	T7V0GzpTL3EwvlLt3jPxT9apMbB/FKoKc/d6Ba0tkHNX5yo0R3exI6AK6zP06if/HplHHBfsw0Q
	3Yp9krNHOTtAzK4INxR5RRyePnpGr4nwBgglmH9q0M8/AVG1vC9CPZm5qvAPl3qLErDqQjQZxhi
	dm6q8sQApqQNegc/fzb5uB0SkVWOQDvUqJYKRaGygwHWgc3fyhLk0spuvYBreO75CW/dBc/sp
X-Received: by 2002:a17:902:ec8e:b0:2a7:5171:921a with SMTP id d9443c01a7336-2a751719312mr78653705ad.54.1769047742032;
        Wed, 21 Jan 2026 18:09:02 -0800 (PST)
X-Received: by 2002:a17:902:ec8e:b0:2a7:5171:921a with SMTP id d9443c01a7336-2a751719312mr78653315ad.54.1769047741481;
        Wed, 21 Jan 2026 18:09:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:17 +0800
Subject: [PATCH v10 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=4412;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1Yd4/OeyiYY49Es4IJlY73zV9yzGJi6c/ilE5vOhlX0=;
 b=DTMOiYD2h4vVx6W7jK2n596Ajp+2RBJ2ATsqrncV6tq1QOz6iBHg/9UDdHvW6nYw1ldjPJNES
 MDZgoyGPZoICgwR8/fUlFokUpybl7HsS3KUdGcqsENSUfvZyFr37SVJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=697186bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-ozbsww5GKt6_lkPIaMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 66Os4zqYvRKgO9-ppoGH_tex7YywrCdk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX8pHXTjzYGgSB
 moBZGhuGWhoXGgNRd71ceRv19/ojygeIexYBr3PyDJ98SkQOCWzQyi9O44z0nOe4efTpOZQDWsN
 YwSf4v/ESuyBq5VfpAGZ3rlzk+JIMbLQjOY9Q+Hmm6g/YT29wlSlAZ26L/Ww+OhhMCEGCpRQ+iE
 etED/2TaFvStseBSPN7bAIqv/hqKGTWsQLGbLbUtFhSMXZXAUZxG3zNF5sey15ESQQOiyh7p7+J
 SAmICPj5OhiyfqMJ1yViMK8smOcAA4ZTvKWnI31WjBDW9Tg0jwyrIQz0xaCKEvXlmPkKNEniZPt
 0UFQ0oPRvTYqu88t/uqR6ihweEOtexFbdpN6Ma8XvAsC6sB6sJ5l3wc+jCWuL1PTelbBpWqZe9V
 +EsCWAkOTatDGMcBgBbSJguQ8CKwBdFh93sW+L82X5XbfdF+XpBn5qeLXWCYP77M57smJEuquhP
 OzsTkHE/ChiXu2JaBkQ==
X-Proofpoint-GUID: 66Os4zqYvRKgO9-ppoGH_tex7YywrCdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90104-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AF1360C21
X-Rspamd-Action: no action

Refactor tmc_etr_get_catu_device to retrieve the helper device connected
to the TMC ETR based on helper_subtype.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 ++++++++++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 69b36bae97ab..d3972619cc96 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata *tmc_drvdata,
 	struct tmc_sg_table *catu_table;
 	struct catu_etr_buf *catu_buf;
 
-	csdev = tmc_etr_get_catu_device(tmc_drvdata);
+	csdev = tmc_etr_get_helper_device(tmc_drvdata,
+			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
 	if (!csdev)
 		return -ENODEV;
 	catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cbbb15648fb7..16a4562533d5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -844,28 +844,37 @@ static const struct etr_buf_operations etr_sg_buf_ops = {
 };
 
 /*
- * TMC ETR could be connected to a CATU device, which can provide address
- * translation service. This is represented by the Output port of the TMC
- * (ETR) connected to the input port of the CATU.
+ * TMC ETR could be connected to the helper device, which can provide address
+ * translation service(CATU) or data filter function(CTCU). This is represented
+ * by the Output port of the TMC (ETR) connected to the input port of the helper.
  *
- * Returns	: coresight_device ptr for the CATU device if a CATU is found.
+ * @drvdata	: drvdata of the TMC device
+ * @subtype	: helper_subtype of the helper device
+ *
+ * Returns	: coresight_device ptr for the helper device if a helper is found.
  *		: NULL otherwise.
  */
 struct coresight_device *
-tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
+tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+			  enum coresight_dev_subtype_helper subtype)
 {
 	struct coresight_device *etr = drvdata->csdev;
-	union coresight_dev_subtype catu_subtype = {
-		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
+	union coresight_dev_subtype helper_subtype = {
+		.helper_subtype = subtype
 	};
 
-	if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
+
+	if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
+	    !IS_ENABLED(CONFIG_CORESIGHT_CATU))
+		return NULL;
+	else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
+		 !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
 		return NULL;
 
 	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
-					  catu_subtype);
+					  helper_subtype);
 }
-EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
+EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
 
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
@@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, struct etr_buf_hw *buf_hw)
 
 	buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
 	buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
-	buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
+	buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
+			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
 	buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c9a82ff6cd00..7690a70069da 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -471,7 +471,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
 }
 
-struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+						   enum coresight_dev_subtype_helper subtype);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


