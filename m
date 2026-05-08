Return-Path: <linux-arm-msm+bounces-106632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILRlFlW2/WmAhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:09:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 558544F4C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEFB7302A1EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390A83C345D;
	Fri,  8 May 2026 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDpnuK7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ou/gOBHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D48379971
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234843; cv=none; b=BwNFHXPfECJo7/wBQdJoo5QGGemh0GJaIuefwAegb7Cu48qVNQ40z3JDqt/k+kCITRAFiT2YXwsIeXJYd66mUYXxaXWMueo2BNukV4jAtl7FLPH8nEnRAG4S/hIK4lpzFkz2vg/VoFJ2eyG41mPDvR1J+27Rso7L1VwCL9AbCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234843; c=relaxed/simple;
	bh=ZMM7SEBI1S1M/NdDC8o6m8b8Ebk1T2FxL+d61HIJ3TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joISkLo/gIzQJ5LfIDkkfKZrYyLUzegzZwYSDDR7tbI720aZC4YgIQ28L2MAJokLMVsiBtt2nYVKzVh3pgezibOIeh1PT9FsMlijI9toCLPfx6ABH+rsk2zx7kaZTnW0ruOteTRc632eRO+Um8JyB2JomEaO51/WbpDlgpBy8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDpnuK7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ou/gOBHx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64872mah1062270
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0+wcU1eUbP
	pEVz56DDLl/V1LzFqYi8M7FxNmC3SV3w=; b=VDpnuK7alXSOMqAnPE2mqeEDpbF
	iTuFEOKXEef8IlVJoiIHFRAynaVzgi/9KxRYADrhVTvTuDUztHRGyiaF5MuJ5eMN
	slH16vl/uIXT5m02mL/OIo8WIcrBeJvy+fMrVdpSjo9cL1gzFgD5ILsK7qKUTVve
	p+ki7BwX4rmoLmkvxoHhWICk9sSralFw/Z0cOrI5f732crikQt3SfjcpvoAN2cAs
	YQfau02DeCW0kls+MBMh0Q/rjG8E1IHlneh6V7GVi8z768i88F/fC3VMs+C0MH8K
	xhJx/wOplNOiXtmRNsWNtWGiVPGTg9pk/uKt9uvxqH6V4FWX9uyE5c88G5w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fgq03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:07:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c802545ae0eso1218888a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234834; x=1778839634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0+wcU1eUbPpEVz56DDLl/V1LzFqYi8M7FxNmC3SV3w=;
        b=Ou/gOBHx8itV3hT/nQ9OkJoPD53cY4FG+ZnaMNN0fF6q/wgFFiuufeaya29wLtsx+h
         9oRZQj7/CVN/tz0qYMUYrSsJ+TAOKUPqwDr1P9Q1zegrQPb1wSX5sR3MvKcAfB1Wsn75
         UEqPEiYrBBottaviTZ4u3kHNQ9JT+t6CcupZDWZ8zMwPFgoNXrKLWmym7drWmVvaHRLu
         F+/e3AnwfgmzAjkCblC2RBVsUALUUG/LVQaGhG46+wuenKCRKzwruacWrCBPr7fdOHA3
         Vrs8xEz6jXNLXnil7Mkslo+iMang96JcKmlaQ8q53Y7AR0yq5MfR5zYVMzwRqHPviQoS
         00YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234834; x=1778839634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0+wcU1eUbPpEVz56DDLl/V1LzFqYi8M7FxNmC3SV3w=;
        b=D2f47PILTNkVaCsbUAIzZhDDFQ562/RrXQAlrApr/P2e8W7B7u+p+hjiEQsrVMZ20a
         tFXRHKG2Csm3BPlIQI3vdWSnTUyzQV+P/q2iRQuY0eM+KDdQ13oJnLNE1lEgP5WaBfrq
         f6kSMt87UGmDMjFt32s1iYSsQubnBDP+86CQcKJvRfG0Cit5cfskT7gZkzsLCgfynR1I
         p63XG1xbRzF3Dg1brNnKbPmYB3mEZIx6lD3XrlMP6VXxbsAppnLepr5/OCSyJAExacQf
         Jm3lZ9yhVUMEqWETQfefxuf9v9aHL03sV1PelMzg3V8A7E6uvXBqHZfzS6ZO8jYeTbgl
         nVSg==
X-Forwarded-Encrypted: i=1; AFNElJ9SDl8XxdYJylJKylt9HuN9sM+L9jrXu3pMNUXxOecfQ0SedesfeqA8vhXXZTZFL2xyx9EFAHS/LOfGL8OD@vger.kernel.org
X-Gm-Message-State: AOJu0YykDej+6FwKkklFSQ3RIpjKe3+1SeUAsf8AyPiiCraTI+mwbVQ9
	U+cH6UvbFsxmP8quJjhX+exY4mFcZSiejRxV+YpgVtA2K50vOPw9MxX/L79Esp/aCVEYZUHEPfC
	/GN3Zh8PInRcNj1jKaYVQhhByZoGY8VGYSODnQCocxZbkh6wooFxFc6VflBNW6aGypduX
X-Gm-Gg: AeBDietI8uGy0TaOzc+usdtZ6zZ5tcSZ/+gyyX+e4JdnLq9iiqemEavNmLzY6eWfv2O
	oJlhb1oz0IJ3ZWE+aihZ+b1Q+Ce1tOqV/FIQcIqD5r3CMA/T0RmHHnubDQWpHJzZh5PR4Ln7tw1
	haroQ47PuFU9HN+qqj3h/BHgF7SgSqmOAwsaCPYZ2Tej+GK8tezY3HCgH2F4yIvUdNttAH9EGJU
	Uuu+8Pbb6KINv7mSwRiqDuriDmT0i9ZofBv8lyAeKYunEfV8w0v8Eck/s9kpcZyfIPRuVgTFV4O
	DFPuSnBuc58iWIzuXPzruJ8qdq4+GSS0RKGccu4SBJWSkgob2cViy7idcH4ogalS8xllO8P/xkF
	Pqt+Umwonsl+NhCV1iUI2jyvTmA0ummvIlPPJdNeD+RhETTf0OPHG/40=
X-Received: by 2002:a05:6a00:3309:b0:839:9ad:ee33 with SMTP id d2e1a72fcca58-83a5b6c38eemr11437862b3a.7.1778234833811;
        Fri, 08 May 2026 03:07:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:3309:b0:839:9ad:ee33 with SMTP id d2e1a72fcca58-83a5b6c38eemr11437819b3a.7.1778234833198;
        Fri, 08 May 2026 03:07:13 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm15876379b3a.49.2026.05.08.03.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:07:12 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH v2 1/2] thermal: qcom: tsens: atomic temperature read with hardware-guided retries
Date: Fri,  8 May 2026 15:36:59 +0530
Message-ID: <20260508100700.772985-2-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
References: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0WT0ngpUiSQqHvHHINJvXdk1yQoPYr3P
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fdb5d2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BLZHAyhsm81VJvnBO_kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 0WT0ngpUiSQqHvHHINJvXdk1yQoPYr3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNCBTYWx0ZWRfX3ZByV+iieM6l
 pc/XhaXrW8XuPw08izNyVu0bp8rlaKKg67/15qTv0BCOx1tpBAip9mQK3Uj5B+YPA5b6NkWcpp/
 T6H3dc/+wsDBoudvTgQJk7GA6AWI6Mp6zHK+BeO46PwnFbG7DjUiqfiLqKEoiFy0MTGDHcjMPyp
 3k4BP7EQyODJbQ33fLLcGTDiYADJQCv2Dqw7dmmlDH2eZX6V4k04buZ+Y2kFCJWnV4Pc54PmWVL
 yr5GVr1Qx+dYddOD6Le3c/N6jDAg0+TDqjJmCAWtCxBx55n1JoIyz6KvBBmXwgFExWvdEW7cKgd
 kuXtVik8UFt5IHKMRzny4O+bgkCdYl4lF93Z2O86x6W45sqAmpj8tEi2p1U+KL57iJy+96YpKjy
 jaffpmek8lXWuFbLLkTfmLbx2LKcq5DNXNnoT9+U2JWk3CktUoZzq3x712CBPFcKfqi4S0kQjqT
 mEHgMvRJ1Bb65kEOggw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080104
X-Rspamd-Queue-Id: 558544F4C8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-106632-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
 drivers/thermal/qcom/tsens-v0_1.c |   1 +
 drivers/thermal/qcom/tsens-v1.c   |   4 ++
 drivers/thermal/qcom/tsens-v2.c   |   6 ++
 drivers/thermal/qcom/tsens.c      | 114 ++++++++++++++++++++----------
 drivers/thermal/qcom/tsens.h      |   7 ++
 5 files changed, 96 insertions(+), 36 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 32d2d3e33287..9426646d1124 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -287,6 +287,7 @@ static struct tsens_features tsens_v0_1_feat = {
 	.max_sensors	= 11,
 	.trip_min_temp	= -40000,
 	.trip_max_temp	= 120000,
+	.last_temp_resolution = 9,
 };
 
 static const struct reg_field tsens_v0_1_regfields[MAX_REGFIELDS] = {
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index faa5d00788ca..c0263375b771 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -77,6 +77,8 @@ static struct tsens_features tsens_v1_feat = {
 	.max_sensors	= 11,
 	.trip_min_temp	= -40000,
 	.trip_max_temp	= 120000,
+	.valid_bit = BIT(14),
+	.last_temp_resolution = 9,
 };
 
 static struct tsens_features tsens_v1_no_rpm_feat = {
@@ -88,6 +90,8 @@ static struct tsens_features tsens_v1_no_rpm_feat = {
 	.max_sensors	= 11,
 	.trip_min_temp	= -40000,
 	.trip_max_temp	= 120000,
+	.valid_bit = BIT(14),
+	.last_temp_resolution = 9,
 };
 
 static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 8d9698ea3ec4..d39d3a2923a3 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -56,6 +56,8 @@ static struct tsens_features tsens_v2_feat = {
 	.max_sensors	= 16,
 	.trip_min_temp	= -40000,
 	.trip_max_temp	= 120000,
+	.valid_bit = BIT(21),
+	.last_temp_resolution = 11,
 };
 
 static struct tsens_features ipq8074_feat = {
@@ -67,6 +69,8 @@ static struct tsens_features ipq8074_feat = {
 	.max_sensors	= 16,
 	.trip_min_temp	= 0,
 	.trip_max_temp	= 204000,
+	.valid_bit = BIT(21),
+	.last_temp_resolution = 11,
 };
 
 static struct tsens_features ipq5332_feat = {
@@ -78,6 +82,8 @@ static struct tsens_features ipq5332_feat = {
 	.max_sensors	= 16,
 	.trip_min_temp	= 0,
 	.trip_max_temp	= 204000,
+	.valid_bit = BIT(21),
+	.last_temp_resolution = 11,
 };
 
 static const struct reg_field tsens_v2_regfields[MAX_REGFIELDS] = {
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..1a7324afe321 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -315,10 +315,64 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
 	return degc;
 }
 
+/**
+ * tsens_read_temp - Retrieve temperature readings from the hardware.
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
+	int temp_val[MAX_READ_RETRY] = {0};
+	u32 status = 0;
+	int ret;
+
+	for (int i = 0; i < MAX_READ_RETRY; i++) {
+		ret = regmap_read(priv->tm_map, priv->fields[field].reg, &status);
+		if (ret)
+			return ret;
+
+		/* VER_0 doesn't have VALID bit */
+		if (!priv->rf[VALID_0 + s->hw_id]) {
+			*temp = status & priv->feat->last_temp_mask;
+			return 0;
+		}
+
+		temp_val[i] = status & priv->feat->last_temp_mask;
+
+		if (status & priv->feat->valid_bit) {
+			*temp = temp_val[i];
+			return 0;
+		}
+	}
+
+	/* As per the HW guidelines, if none of the attempts observe a
+	 * valid sample, a stable fallback value must be returned. If the
+	 * first and second samples match, the second value is returned;
+	 * otherwise, if the second and third samples match, the third
+	 * value is returned.
+	 */
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
@@ -326,19 +380,12 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
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
-
-	resolution = priv->fields[LAST_TEMP_0].msb -
-		priv->fields[LAST_TEMP_0].lsb;
 
-	ret = regmap_field_read(priv->rf[field], &temp);
-	if (ret)
-		return ret;
+	resolution = priv->feat->last_temp_resolution;
 
 	/* Convert temperature from ADC code to milliCelsius */
 	if (priv->feat->adc)
@@ -514,8 +561,12 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
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
@@ -524,9 +575,14 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
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
@@ -750,33 +806,16 @@ static void tsens_disable_irq(struct tsens_priv *priv)
 
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
 {
-	struct tsens_priv *priv = s->priv;
+	int ret;
 	int hw_id = s->hw_id;
 	u32 temp_idx = LAST_TEMP_0 + hw_id;
-	u32 valid_idx = VALID_0 + hw_id;
-	u32 valid;
-	int ret;
 
-	/* VER_0 doesn't have VALID bit */
-	if (tsens_version(priv) == VER_0)
-		goto get_temp;
+	ret = tsens_read_temp(s, temp_idx, temp);
 
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
-
-get_temp:
-	/* Valid bit is set, OK to read the temperature */
-	*temp = tsens_hw_to_mC(s, temp_idx);
+	if (!ret)
+		*temp = tsens_hw_to_mC(s, *temp);
 
-	return 0;
+		return ret;
 }
 
 int get_temp_common(const struct tsens_sensor *s, int *temp)
@@ -1065,6 +1104,9 @@ int __init init_common(struct tsens_priv *priv)
 		regmap_field_write(priv->rf[CC_MON_MASK], 1);
 	}
 
+	priv->feat->last_temp_mask =
+			GENMASK(priv->feat->last_temp_resolution, 0);
+
 	spin_lock_init(&priv->ul_lock);
 
 	/* VER_0 interrupt doesn't need to be enabled */
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..e56b6f29621b 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -21,6 +21,7 @@
 #define THRESHOLD_MIN_ADC_CODE	0x0
 
 #define MAX_SENSORS 16
+#define MAX_READ_RETRY 3
 
 #include <linux/interrupt.h>
 #include <linux/thermal.h>
@@ -511,6 +512,9 @@ enum regfield_ids {
  * @max_sensors: maximum sensors supported by this version of the IP
  * @trip_min_temp: minimum trip temperature supported by this version of the IP
  * @trip_max_temp: maximum trip temperature supported by this version of the IP
+ * @valid_bit: validate if read temperature is valid or not?
+ * @last_temp_mask: mask register for last temperature
+ * @last_temp_resolution: last temperarure sign bit resolution
  */
 struct tsens_features {
 	unsigned int ver_major;
@@ -522,6 +526,9 @@ struct tsens_features {
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


