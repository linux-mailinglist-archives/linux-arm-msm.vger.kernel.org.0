Return-Path: <linux-arm-msm+bounces-99789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFGqE252w2ktrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:45:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB431FEC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCC6730A0E28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8048311C36;
	Wed, 25 Mar 2026 05:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ig+5FkGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuDKMoB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755E30FC1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417444; cv=none; b=cizLMEvFTo4f4zl5hAItZC4Hma5LFIDGpkZliLPkmvCGwKfNctGc11garqOaKm1oFrTt4XSUBzeulIr3ikfo+O5vQ/KokmhE0+k/AK2r+fKQ/b9tZQY3Yie7aToZAMHM7SlMQ6AdtHO02L29sMCzBAY655sQNohyy4H3ehKmW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417444; c=relaxed/simple;
	bh=qAzZ+u/woLYDbL6f/lfFrwEnDhUdQIVjsv7FGZH74vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOQmnbn80CDuTljEiKL+SqnT6Rds/6PAjlFURagGMwwK850Z0MLKUcN+Pt/PKQvoFDHc6/r5WRZrpW3fjUsAzotjwqhvYSUm2DATqUYwJg06Sg8dI3YVDBwiA8vpg70AbPeW/xJJ9xXvHCk2OmlDJJ3WF00Yiz7tRz99pO+a/gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ig+5FkGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuDKMoB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4a0Uq989047
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=; b=Ig+5FkGCAbUc3AUE
	lCSSO7QnCBIRlHpyNQd7YaXWAB9WblZCVGQUtOG3F2TlXXmxLThGwS2vnessL1wX
	2Qi426EWbhnTT382mRrGb0Bo0TytBN8Fo+/5D3m+BAhSM96A1sCnicmLkBmOwkO6
	0rTz42x7R3JCk8GaVyTp8uh6vKlMcjpBozJl7zwht6Mik7c5jBdGYa4tuyWTAt8Q
	wRVyzsibalJpWMGwXPHMddMeLZC48llE4BryjJO+gGLG6Uf0KTS97D4OUD+K0giO
	wUhPgcZAy/55mrxZlhl+jKrJ7UHxjLxyq+rSc7LuLyaucBoXNv9KVoXT3A4yA3UO
	cuQiRg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m38su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b051befbb8so58662495ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417442; x=1775022242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=;
        b=EuDKMoB96TYHULAyWdgM4H5YItMQISawG/9OFAM2yLFAKKYD4CExmnz8NLR5lNTakD
         wX7zLXcLvNSyfBc84sQdi1GHAPcf2kjhkfUEsj3OY1GCyJO70WTzfCqWq+objYARR4m6
         Mmt44Dj9/niGVRi9UlwvQ95LbJ8hiC9Mx0bGS9zGZMWCLrqLxQAcrqBay6AkPykZW+az
         yp78BG+821/fgXhHIZRtO/gtiRWkPbuykYdp6FbW76ichjy3wPiqI2warPODgVvZnve6
         XuhaSO6fYYQnaXmdY6UCRSklVw2qvf6RmGRbVv5CkXJ3LPMg8k505ZmwBMIYoUoOjmLg
         /VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417442; x=1775022242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=;
        b=NPW65z0Bg1WAzgeYn1u5iOIX06lSiQmACQUeOi4JlAW/u21h0bLi91UwCUoeFmO0/F
         7ny8gT+T77IgiI1Hi0vNu5cdhchfQO6Q/1A045tRyURoTDtDRN1lieDH1mGCom5pZmje
         CsCjTawMvDigc4A+4t1Bvyqt8yODco5cY8vKeDyabBFiMoVSMXIu8/iDCwHdsgUOjgeb
         ZGP6OlCZMvUaydRHsUtA+IFk2YKm53tqLbBG9xA064AU5b5qWyrRMIEyqOxVkJ1TditE
         f+YXHZxL+jnOJ6JmtLaNZawa1cxzfAJ2Tx5ba0dKB7vlhckt78OsGyzxK6v0frtU313I
         xsdA==
X-Forwarded-Encrypted: i=1; AJvYcCVyW38+X/FAQeH7Z/Dght/JAoh9gRbdEue7MznhxmyU5JEWAuVO9mfcieZcJzFztta6rpH2QS+ycSxujUfT@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvEbddnR/PDggFJ9cYj6wvUj0pPGjM8r4Uad0o9QNn3P26UUN
	QC7uX3sFRY40zBE+sTdmLUTu7t3GeLPP8jFnFAWh2TCT8MU0cbbJpWAmMrR71m6z52+ugWRoA6O
	mbOxcpEPYV3lCk4IUqDXv+Vb4Vqetf6+r0/5g+kSszXgzwRBMo/bhxZvpKSsyhY3NEK0T
X-Gm-Gg: ATEYQzx6Ko/qBHursD+QpHoGnSYRJTqHd34pXiG+Otd4xXFrTrDQeAws8hUWks2riik
	/ueYijurOZUCP4gLgFxb0cXzrIcOkx2DMKehs655l/4dRoz0QKwSYrQPDE/gT5O2d8kVCXwa90Z
	LRK5KUw/4N8HzPDXEdTa2kM235XK9XjLZeFwupCe6SUbowvm6j7j7ITwwbFrrTmicQUhrwy+C87
	eVzYWE7YABJVRlgFWPVRsXIqmRWkomXgKs4F/2mJD4m7D3B5iWxj5C3HQpfF8q0JtKVJgfo5/Nd
	on91aWXFZ3fdtAbqq+MY75Th55sUSPaRhVQFVGXyIODPl8edLlq8FT75RW/1/MWo4NZqzo4RGQX
	aUO4AZEym+9UqvCbUnB23HU9+AAwGI3QqIK1CVPx5qiJKrqsA1jimuo/sKjUtwT6U6v8QvJLH0S
	OgQbbR+f2W0/tKcw==
X-Received: by 2002:a17:903:234a:b0:2ae:4445:f39a with SMTP id d9443c01a7336-2b0b099d271mr24386415ad.7.1774417441578;
        Tue, 24 Mar 2026 22:44:01 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2ae:4445:f39a with SMTP id d9443c01a7336-2b0b099d271mr24386175ad.7.1774417440961;
        Tue, 24 Mar 2026 22:44:00 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:00 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:44 +0800
Subject: [PATCH v7 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-1-bb406005089f@oss.qualcomm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
In-Reply-To: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=10928;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=qAzZ+u/woLYDbL6f/lfFrwEnDhUdQIVjsv7FGZH74vE=;
 b=0Kh5Lc/nzRfpzwGgV7GyzeF6MuKhH7iWTmlVU6okSE1pU+fbUygtkD5sBgvzeufPgQgZggox0
 XwhjY48/XQTCfZQzqSbUb8uHubuvZ8ewW83DFQpsqUCXURAkMztduz1
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c37622 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gAozoMUHzvVhJ8WkzYYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bZEdmo3a_i2IGU0H9PmCrZHhil5xeRmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX0aNvtm78lexP
 5R/US5N+waNJ5fZ5CHNxBkR3pWRZc9O9LJq3UP2cTKuyhpvAb5VOr6GLMlM+dIvSsfF3ffykezT
 S3RxcZpQZ2m2fW0Ls1PxW7pw3VErWMwJ7c3Hbme57TIaGSUM7DRZCDarpWlynwpykJNqOHoTcDj
 S390NeuUsbIKS51IHMLm8MX8YwnD+xL2m9DFoQ+cOeecqXPP8ETsMfHmau+OdHtB2NhNNsFQsaO
 rNEPzfvsKPDHAcwQKfOUqckUb3UDjOoqECqiX5syTTw7C0A7IP+xriumNYyaoQYo0SlOfA4NNoj
 z3LZX9qeRxyDJOrUy2QGoZrIDnS6xi0wCJbVkLHhoqdYhYzi5Hh1G8NKjzKsFNx8riDZ9u+hNND
 UWtnZIKgXe4Ld/2haWYSCisr5eLMmSQ7E/5P9sJdzKePbuEc2+uJrsvp98EujJbd+TSS0RREZDg
 Hcj+W7ACTlUwKwiP9Mg==
X-Proofpoint-GUID: bZEdmo3a_i2IGU0H9PmCrZHhil5xeRmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99789-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7CB431FEC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
structure with dynamically allocated bitmaps and arrays. This allows
memory to be allocated based on the actual number of triggers during probe
time, reducing memory footprint and improving scalability for platforms
with varying trigger counts.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 57 ++++++++++++++++------
 .../hwtracing/coresight/coresight-cti-platform.c   | 16 +++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 13 ++---
 drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
 4 files changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2f4c9362709a..d5cb94e33184 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
-static void cti_set_default_config(struct device *dev,
-				   struct cti_drvdata *drvdata)
+static int cti_set_default_config(struct device *dev,
+				  struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	u32 devid;
@@ -181,6 +181,26 @@ static void cti_set_default_config(struct device *dev,
 		config->nr_trig_max = CTIINOUTEN_MAX;
 	}
 
+	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_in_use)
+		return -ENOMEM;
+
+	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_use)
+		return -ENOMEM;
+
+	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_filter)
+		return -ENOMEM;
+
+	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiinen)
+		return -ENOMEM;
+
+	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiouten)
+		return -ENOMEM;
+
 	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
 
 	/* Most regs default to 0 as zalloc'ed except...*/
@@ -189,6 +209,7 @@ static void cti_set_default_config(struct device *dev,
 	config->enable_req_count = 0;
 
 	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
+	return 0;
 }
 
 /*
@@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -242,12 +265,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_alloc(dev, in_sigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_alloc(dev, out_sigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -263,7 +294,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -274,8 +304,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -288,7 +318,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -298,18 +327,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
@@ -687,7 +714,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 4eff96f48594..af5f45c6fcf0 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, drvdata->config.nr_trig_max);
 
 	kfree(tg);
 	return err;
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 4c0a60840efb..88f8a08ef778 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -720,12 +720,9 @@ static ssize_t trigout_filtered_show(struct device *dev,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	int size = 0, nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
+	int nr_trig_max = cfg->nr_trig_max;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
-	return size;
+	return bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -934,9 +931,8 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -948,9 +944,8 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c5f9e79fabc6..ef079fc18b72 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -68,7 +68,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	unsigned long *used_mask;
 	int sig_types[];
 };
 
@@ -145,17 +145,17 @@ struct cti_config {
 	int enable_req_count;
 
 	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
+	unsigned long *trig_in_use;
+	unsigned long *trig_out_use;
+	unsigned long *trig_out_filter;
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
 	/* cti cross trig programmable regs */
 	u32 ctiappset;
 	u8 ctiinout_sel;
-	u32 ctiinen[CTIINOUTEN_MAX];
-	u32 ctiouten[CTIINOUTEN_MAX];
+	u32 *ctiinen;
+	u32 *ctiouten;
 	u32 ctigate;
 	u32 asicctl;
 };

-- 
2.43.0


