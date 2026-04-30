Return-Path: <linux-arm-msm+bounces-105282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HX4N6fs8mnhvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:46:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ACC49DB0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0F24301546F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D3A36D9F9;
	Thu, 30 Apr 2026 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5xGCNdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqIP1nvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96070246782
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527919; cv=none; b=F1+PqXwQ5LAHkSXqO2AKXY4NdY8aB9e1mluhj9K4bWVBid58hQfiG9mkEjFeUiF22VcDqpoi9z3kr6liuVNUtJrg06h9A2dSL5wMv4ujpEoH8p4CDdRyczPqckQVhxMLapFFZqpfDaS+bVHqfS2wR5txsBG6rTI1+3s2d8opiEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527919; c=relaxed/simple;
	bh=yb2uIXKbAtiJY0+Cl9t5DdGQEL+mqCNSFXLfXAtZ1MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dweunIjfjL6Q63/kUCI6JZwD37LsavU1X1G4klnvSM27c+5f22nqpQS8fq1Cp8ahXtmoZOwGuv8whgfg16maDVUq4zq9pcD/cE23PEByraecV06RQCY/WXS06FPv3+zP17T8L+4FkhYkJmyggnYJL7SS76B05xmp1G9sqKBvTCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5xGCNdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqIP1nvX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbT0O3665166
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rO0LY8vkzqo
	pIW/RYQ+1/XIn9AKgb50m4I58BeUUmsk=; b=K5xGCNdn3GwYexTmMwXCA6FpMJp
	vBZcp6APaIU8HT0pF2JWgI+gCB64VXmVaj/ZMuwzDlJ0tRjEvsnOhXYa6UUSDNZl
	CRKhMEnOX9cfvBGmjMMkeT0nEIRiGsGu7HE4hJXUtCkHE1aJAoglU3PQq1RMa4/Y
	SgF0rkUKQpHpKvGQ6YQ8xRjv3cp5Kw67akznvWN1qKlcCG07jfFLx5WV6/DcfpMA
	heRnq7b4cetQLWom+F+MCAUV4Ugbfcz6HVUTejilHNG90g9RoSdt47QF0DZzcSO7
	EefOq9D3JevlF0j6PWDOLqDeMScwgCjPVU7LfgtMlZFQY0eVfVQfaf5gnDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3vqe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:45:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79943d2fbfso203095a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 22:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777527915; x=1778132715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO0LY8vkzqopIW/RYQ+1/XIn9AKgb50m4I58BeUUmsk=;
        b=DqIP1nvXDZIETOBS0ZTjjxGN0LPyHlOP96SpDWreB5FbcJMd3D/gVRZ9WQaOI7djJN
         TA/3XeY5ra8wevfsWDuHZaSPZ+lno7oOsy5dqeHMrqAGNEiGCvncSvU1tbTm1mKKDjP0
         G3vvxz+pJsnlc3O9BIDADsX2+JAM+d4NIxyj79fjBaIqrcvR9hO2HQIlkX1o6evpjgQm
         ksPHTi3kVIYD7HdyY51uD5yFrJu5G/BsHl1L2HBOyA5o542MMbVWDn7SXutC4+tqOL7w
         Oz8ECDm599GXAeSatBMEQ/+wJyYAxyCizXY04UuE2yFRitok1dIDkxgqeKKWIzv+wewQ
         5uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777527915; x=1778132715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rO0LY8vkzqopIW/RYQ+1/XIn9AKgb50m4I58BeUUmsk=;
        b=KdIc/xRMfrYOHra7umtIpET7NrG1Ynvv4FGd5WRw/H42EQSLG5ZD+MxW1k2nuGoNvP
         Kz/QyGqgalDQ5eOWxbYdgJ+VrZGokqZr6GC75TyFp36vAxqlD4AUkkmPCXl3JbesVsBu
         Sj8omY1IGoFk0qzaLfhkkCb7RhY7RnuvJUBu1g7YCgSxmskRMYrTzyk1RMxBOU9LpXoO
         QrjC33G3ECcABKTzbwux7Fjnq5+sc7NrZfM++7iZD/zQr/aQ1D76L1w5mAdwfD56UHLi
         MpKILg2e6YPTJpdu+XtoccR6oF9zElLYIYaSUDw5RcE1pvXKN9+BUMeMEOW2rRKG4MXK
         VGxA==
X-Forwarded-Encrypted: i=1; AFNElJ8baIqn/5HHjMOed2tc6bakloHULZHSryE+kpcZj+ID1tKU0Daxc+6qzt9r6bm44z0ZTiFr17qRLmDD3ZTU@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWgtLmDkBknYScK2wTWWOCAdvGc6DOHTOhWl3IhI7tUsRIwcq
	b1LrByGIiWYgbNa9HKcP73KkLny0o+mgUkz+Y5cMKxSga/cEt/B1g6z92SGm+xXRJ5/WYGys8sG
	Mt+/dKDHX3vnzBvMfgDs8C29bGWIgwLDZ5GIWisyGg77udsvk8AzlIdyYqnuMHPXTQ/Qr
X-Gm-Gg: AeBDieumGU0voiK3cqTNC+LOu7wu3nYx8WvKfepmksQHZJvQe0D9YlA8FKy1qY1MY1c
	t/I6ROXCJLsO331ZnxS3j8HQ4F/6C4E4pRqfY8m4bVLelv4t/4bkZSDwBti3udBJuinlglpWwQz
	uZOXUQLZj4QjstTehollXeKhb6YxB6vth7oa3kZ41ROFWG5pLIlOcAIsc1aORouWqIqdX9ecfoQ
	dApbcwM4Bnwfud8laH52W787RZb+F+0lxB59sYxSBA6vt0SvePahhoivWp8pKBOvPy/3UmQu6jT
	hkkHhJvl9nCD0qsvclsjK4LO/BmJTvq52cTtBN398OkgwTSh1ihsECSFk7Gc6dTMmKVeGuelgST
	dVWfskoPjXXYqrs/bAaBba80g+QLB6H01Vz85PzRuGYCzaGN2SPUG/NS6mVam4ERHmA==
X-Received: by 2002:a05:6a21:999d:b0:39b:d6e0:2d4 with SMTP id adf61e73a8af0-3a3cf8fd2c9mr1638369637.48.1777527914382;
        Wed, 29 Apr 2026 22:45:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:999d:b0:39b:d6e0:2d4 with SMTP id adf61e73a8af0-3a3cf8fd2c9mr1638291637.48.1777527913437;
        Wed, 29 Apr 2026 22:45:13 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f21cbsm3955231a12.19.2026.04.29.22.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:45:13 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with hardware-guided retries
Date: Thu, 30 Apr 2026 11:14:20 +0530
Message-ID: <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kia-IM8l_IMycLNsel2VNSuO6KgvOIz_
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f2ec6c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=X5CxAMeF2Cgji5W92k0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Kia-IM8l_IMycLNsel2VNSuO6KgvOIz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1MyBTYWx0ZWRfX/c+a9LQLvHVp
 tOuN90P6PvKD4TiPJUeXElrZUHPNwTXUNLSD60NaHOY+5czn7wCt/sJbdAWOUkPkhTDAEDItpk5
 l0dl6e5aAVqyJYYmLvKP9cGMs0HORXdB9uT5qKOP4FpdepiNmZnyNOrK0A3F7TdiNTFTnJTDca0
 JSvN+r8XVJkp7z8Sb136eQDQLOkQ3iKotaFaFG9eTENTwfaX35Wh3EQpIKf87+iT2JobayZcfhk
 ZUShzJr65P+iebqORMqQ4bEfDeuVuqlrvyy2mXuBPIyeOD/iEproObMLN1uuA9asALTQ/DV0otz
 0uRV0xzFoa600kVQ5c0ATS9asXRw7NIYT8FCV7oO+HQfj+E9ZoMINzRgpBXIRsTgdEFpfj8EcI5
 9iQlc1e+TsO5QpL8UYRrX+tlqrSsR58i6bViIKnthEFZa8bYfXCFZvbFMADPI7O06BLarqi/RK3
 85bGszNZFmc4WFWGMXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300053
X-Rspamd-Queue-Id: 59ACC49DB0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105282-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

The existing TSENS temperature read logic polls the valid bit and then
reads the temperature register. When temperature reads are triggered
at very short intervals, this can race with hardware updates and allow
the temperature field to be read while it is still being updated.

In this case, the valid bit may already be asserted even though the
temperature value is transitioning, resulting in an incorrect reading.

Hardware programming guidelines require the temperature value and the
valid bit to be sampled atomically in the same read transaction. A
reading is considered valid only if the valid bit is observed set in
that same sample.

The guidelines further specify that software should attempt the
temperature read up to three times to account for transient update
windows. If none of the attempts observe a valid sample, a stable
fallback value must be returned: if the first and second samples match,
the second value is returned; otherwise, if the second and third
samples match, the third value is returned.

Update the TSENS sensor read logic to implement atomic sampling along
with the recommended retry-and-compare fallback behavior. This removes
the race window and ensures deterministic temperature values in
accordance with hardware requirements.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v1.c |   6 +-
 drivers/thermal/qcom/tsens-v2.c |   6 +-
 drivers/thermal/qcom/tsens.c    | 118 +++++++++++++++++++++-----------
 drivers/thermal/qcom/tsens.h    |  22 ++----
 4 files changed, 91 insertions(+), 61 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index faa5d00788ca..2e0a01348c48 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -77,6 +77,9 @@ static struct tsens_features tsens_v1_feat = {
 	.max_sensors	= 11,
 	.trip_min_temp	= -40000,
 	.trip_max_temp	= 120000,
+	.valid_bit = BIT(14),
+	.last_temp_mask = 0x3FF,
+	.last_temp_resolution = 9,
 };
 
 static struct tsens_features tsens_v1_no_rpm_feat = {
@@ -132,8 +135,7 @@ static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
 	/* NO CRITICAL INTERRUPT SUPPORT on v1 */
 
 	/* Sn_STATUS */
-	REG_FIELD_FOR_EACH_SENSOR11(LAST_TEMP,    TM_Sn_STATUS_OFF,  0,  9),
-	REG_FIELD_FOR_EACH_SENSOR11(VALID,        TM_Sn_STATUS_OFF, 14, 14),
+	REG_FIELD_FOR_EACH_SENSOR11(LAST_TEMP,    TM_Sn_STATUS_OFF,  0,  14),
 	/* xxx_STATUS bits: 1 == threshold violated */
 	REG_FIELD_FOR_EACH_SENSOR11(MIN_STATUS,   TM_Sn_STATUS_OFF, 10, 10),
 	REG_FIELD_FOR_EACH_SENSOR11(LOWER_STATUS, TM_Sn_STATUS_OFF, 11, 11),
diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 8d9698ea3ec4..814147735ba5 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -56,6 +56,9 @@ static struct tsens_features tsens_v2_feat = {
 	.max_sensors	= 16,
 	.trip_min_temp	= -40000,
 	.trip_max_temp	= 120000,
+	.valid_bit = BIT(21),
+	.last_temp_mask = 0xFFF,
+	.last_temp_resolution = 11,
 };
 
 static struct tsens_features ipq8074_feat = {
@@ -125,8 +128,7 @@ static const struct reg_field tsens_v2_regfields[MAX_REGFIELDS] = {
 	[WDOG_BARK_COUNT]  = REG_FIELD(TM_WDOG_LOG_OFF,             0,  7),
 
 	/* Sn_STATUS */
-	REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  11),
-	REG_FIELD_FOR_EACH_SENSOR16(VALID,           TM_Sn_STATUS_OFF, 21,  21),
+	REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  21),
 	/* xxx_STATUS bits: 1 == threshold violated */
 	REG_FIELD_FOR_EACH_SENSOR16(MIN_STATUS,      TM_Sn_STATUS_OFF, 16,  16),
 	REG_FIELD_FOR_EACH_SENSOR16(LOWER_STATUS,    TM_Sn_STATUS_OFF, 17,  17),
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..15392a17ef41 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -315,10 +315,66 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
 	return degc;
 }
 
+static inline enum tsens_ver tsens_version(struct tsens_priv *priv)
+{
+	return priv->feat->ver_major;
+}
+
+/**
+ * tsens_read_temp - To read temperature from hw in deciCelsius.
+ * @s:     Pointer to sensor struct
+ * @field: Index into regmap_field array pointing to temperature data
+ * @temp: temperature in deciCelsius to be read from hardware
+ *
+ * This function handles temperature returned in ADC code or deciCelsius
+ * depending on IP version.
+ *
+ * Return: 0 on success, a negative errno will be returned in error cases
+ */
+static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
+{
+	struct tsens_priv *priv = s->priv;
+	int temp_val[3] = {0};
+	unsigned int status = 0;
+	int ret = 0, i;
+	int max_retry = 3;
+
+	ret = regmap_field_read(priv->rf[field], &status);
+	if (ret)
+		return ret;
+
+	/* VER_0 doesn't have VALID bit */
+	if (tsens_version(priv) == VER_0) {
+		*temp = status;
+		return ret;
+	}
+
+	for (i = 0; i < max_retry; i++) {
+		temp_val[i] = status & priv->feat->last_temp_mask;
+		if (status & priv->feat->valid_bit) {
+			*temp = temp_val[i];
+			return ret;
+		}
+		ret = regmap_field_read(priv->rf[field], &status);
+		if (ret)
+			return ret;
+	}
+
+	if (temp_val[0] == temp_val[1])
+		*temp = temp_val[1];
+	else if (temp_val[1] == temp_val[2])
+		*temp = temp_val[2];
+	else
+		return -EAGAIN;
+
+	return ret;
+}
+
 /**
  * tsens_hw_to_mC - Return sign-extended temperature in mCelsius.
  * @s:     Pointer to sensor struct
  * @field: Index into regmap_field array pointing to temperature data
+ * @temp: temperature in milliCelsius to be read from hardware
  *
  * This function handles temperature returned in ADC code or deciCelsius
  * depending on IP version.
@@ -326,19 +382,12 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
  * Return: Temperature in milliCelsius on success, a negative errno will
  * be returned in error cases
  */
-static int tsens_hw_to_mC(const struct tsens_sensor *s, int field)
+static int tsens_hw_to_mC(const struct tsens_sensor *s, int temp)
 {
 	struct tsens_priv *priv = s->priv;
 	u32 resolution;
-	u32 temp = 0;
-	int ret;
 
-	resolution = priv->fields[LAST_TEMP_0].msb -
-		priv->fields[LAST_TEMP_0].lsb;
-
-	ret = regmap_field_read(priv->rf[field], &temp);
-	if (ret)
-		return ret;
+	resolution = priv->feat->last_temp_resolution;
 
 	/* Convert temperature from ADC code to milliCelsius */
 	if (priv->feat->adc)
@@ -370,11 +419,6 @@ static int tsens_mC_to_hw(const struct tsens_sensor *s, int temp)
 	return temp / 100;
 }
 
-static inline enum tsens_ver tsens_version(struct tsens_priv *priv)
-{
-	return priv->feat->ver_major;
-}
-
 static void tsens_set_interrupt_v1(struct tsens_priv *priv, u32 hw_id,
 				   enum tsens_irq_type irq_type, bool enable)
 {
@@ -514,8 +558,12 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
 					&d->crit_irq_mask);
 		if (ret)
 			return ret;
-
-		d->crit_thresh = tsens_hw_to_mC(s, CRIT_THRESH_0 + hw_id);
+		ret = regmap_field_read(priv->rf[CRIT_THRESH_0 + hw_id], &d->crit_thresh);
+		if (ret)
+			return ret;
+		d->crit_thresh = tsens_hw_to_mC(s, d->crit_thresh);
+		if (ret)
+			return ret;
 	} else {
 		/* No mask register on older TSENS */
 		d->up_irq_mask = 0;
@@ -524,9 +572,14 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
 		d->crit_irq_mask = 0;
 		d->crit_thresh = 0;
 	}
-
-	d->up_thresh  = tsens_hw_to_mC(s, UP_THRESH_0 + hw_id);
-	d->low_thresh = tsens_hw_to_mC(s, LOW_THRESH_0 + hw_id);
+	ret = regmap_field_read(priv->rf[UP_THRESH_0 + hw_id], &d->up_thresh);
+	if (ret)
+		return ret;
+	d->up_thresh = tsens_hw_to_mC(s, d->up_thresh);
+	ret = regmap_field_read(priv->rf[LOW_THRESH_0 + hw_id], &d->low_thresh);
+	if (ret)
+		return ret;
+	d->low_thresh = tsens_hw_to_mC(s, d->low_thresh);
 
 	dev_dbg(priv->dev, "[%u] %s%s: status(%u|%u|%u) | clr(%u|%u|%u) | mask(%u|%u|%u)\n",
 		hw_id, __func__,
@@ -750,33 +803,16 @@ static void tsens_disable_irq(struct tsens_priv *priv)
 
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
 {
-	struct tsens_priv *priv = s->priv;
+	int ret;
 	int hw_id = s->hw_id;
 	u32 temp_idx = LAST_TEMP_0 + hw_id;
-	u32 valid_idx = VALID_0 + hw_id;
-	u32 valid;
-	int ret;
-
-	/* VER_0 doesn't have VALID bit */
-	if (tsens_version(priv) == VER_0)
-		goto get_temp;
 
-	/* Valid bit is 0 for 6 AHB clock cycles.
-	 * At 19.2MHz, 1 AHB clock is ~60ns.
-	 * We should enter this loop very, very rarely.
-	 * Wait 1 us since it's the min of poll_timeout macro.
-	 * Old value was 400 ns.
-	 */
-	ret = regmap_field_read_poll_timeout(priv->rf[valid_idx], valid,
-					     valid, 1, 20 * USEC_PER_MSEC);
-	if (ret)
-		return ret;
+	ret = tsens_read_temp(s, temp_idx, temp);
 
-get_temp:
-	/* Valid bit is set, OK to read the temperature */
-	*temp = tsens_hw_to_mC(s, temp_idx);
+	if (!ret)
+		*temp = tsens_hw_to_mC(s, *temp);
 
-	return 0;
+		return ret;
 }
 
 int get_temp_common(const struct tsens_sensor *s, int *temp)
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..f346557b0a8a 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -194,22 +194,6 @@ enum regfield_ids {
 	LAST_TEMP_13,
 	LAST_TEMP_14,
 	LAST_TEMP_15,
-	VALID_0,		/* VALID reading or not */
-	VALID_1,
-	VALID_2,
-	VALID_3,
-	VALID_4,
-	VALID_5,
-	VALID_6,
-	VALID_7,
-	VALID_8,
-	VALID_9,
-	VALID_10,
-	VALID_11,
-	VALID_12,
-	VALID_13,
-	VALID_14,
-	VALID_15,
 	LOWER_STATUS_0,	/* LOWER threshold violated */
 	LOWER_STATUS_1,
 	LOWER_STATUS_2,
@@ -511,6 +495,9 @@ enum regfield_ids {
  * @max_sensors: maximum sensors supported by this version of the IP
  * @trip_min_temp: minimum trip temperature supported by this version of the IP
  * @trip_max_temp: maximum trip temperature supported by this version of the IP
+ * @valid_bit: validate if read temperature is valid or not?
+ * @last_temp_mask: mask register for last temperature
+ * @last_temp_resolution: last temperarure sign bit resolution
  */
 struct tsens_features {
 	unsigned int ver_major;
@@ -522,6 +509,9 @@ struct tsens_features {
 	unsigned int max_sensors;
 	int trip_min_temp;
 	int trip_max_temp;
+	int valid_bit;
+	int last_temp_mask;
+	u32 last_temp_resolution;
 };
 
 /**
-- 
2.43.0


