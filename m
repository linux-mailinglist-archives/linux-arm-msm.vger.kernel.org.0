Return-Path: <linux-arm-msm+bounces-90103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFaWMZOHcWlaIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:12:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1331B60C04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 167B380A5F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E32374161;
	Thu, 22 Jan 2026 02:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNSVCC1G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifFT5dac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1B36C0D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047743; cv=none; b=FMpuaaBr5ItjYGlQHhGmNLgTcDPV0TBRXPyXetTAyakai8BqlMjKcAV8DixNhqLpW+AayJ7So5owSpbAbmtsI/LiteKy1ER4JbOJE1pesS5c7Co8fvwVlxrjD3OYoyLB6mNksqfZsv+CnZncGzYzwjiN1/DosZeVX66QSs4E4+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047743; c=relaxed/simple;
	bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJuI04tpWe7Pfd3Pbwc4wkA1rbopPeWN8QcMv1KvkitvlVDcpqfJhMCBrVgAyzzIJVKqgrED7fO2U8s1hitnRi740j6JnooTJm8ZXQIFXt1e5OiRvNhuTk1PJabeLzWzuPJkhQ9aqUJvky6weHygqzZOJUI2cOeHW4laB5bba9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNSVCC1G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifFT5dac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLNbIC788974
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=GNSVCC1Ga7J8TSot
	zNDR0RW+ICcJAGgI9B9Ri99awN6nVDURWz1RpPbNTcLaTUnn3JYPU1e4ZjW5DPuJ
	Qe2E6c8Rqb0ECwElqOW53gLg0NHSn2Y48NIAsVO4R0D4ZFSSZvAFjjNPbGQMs3UH
	I9xQVI3CLR7648IqVHZt2+RJHxYCB/fz/rIxQsiKnAusRbApB7l/ltjD0AQsySG+
	CEJQFTFyKhXrC33C0m0iv2VxlAdAT+cOuwK8xts6t3530jl0oPRzeWD+gM5Dr1em
	+bx3E0cYlhzgEvdTNg7CmGbqhIWX1DGxg8DfQRrvWdhJG+yi+3oltUN9r6kd9sL2
	49s1aw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6p1gn2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:08:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a4b748a0so8832785ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047737; x=1769652537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=ifFT5dac3lD3t/D7cywhR8Zeiv69diTRLIN5aMvcEJUT8DVR/UvWBqaIuYoR9Fa07M
         RIMHNXyXlSpEAKC858QDYdOEa4UdfJgmmer5Qaz9/S2KR3lAnD6BB8XTW5tYNySUovkG
         KdkUEu/ug6zGDFFQ4p1puZxmNIZqm/h4rIDi4W1UERAIIWNHPg27KCuRYMAvd2Q/feBe
         46mjbS6HwQeqM5MgFvjaP4B5pIsUnpgZRQMBqHH/mJT/Wr80n15QsqVnxYQRZYjxTzoK
         h5XTXSplx4Sumk3vogVoL6j+W33GgZhOspBFVKzWZE31kNuUghT+KdhPQQqxUqL662uY
         cLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047737; x=1769652537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=nHGxJ1EtqVCuHz1NXgzOHz9H4bwr339MgwFKsceQkUv4Nn+WqiTjzx4qlhpFCKbVD3
         aIngI9bT3ojj1fN7dRNrsG8pKeuyIDm37Zw0RiDpxsChL8IHhjdOgz9h2MXpfUtaE6C9
         hZf+yH+ddSb6X2OJMc6UsRgo75X8BrpgVbR88d8x7WOB0CLqSHIZafZ7VId0yRSkb43I
         OuMiQK9oJFImXtp3KrzdQNuhhYmXnhL0zF9ONYBS05bs7TOf4TTfl/KxIxhggwAgmV3s
         nPKmILlzWDoUeucrYnWYndK0pvBqcae9rOW2WOhTnSQ8YM8CaDBnxTzWi4eOJUMim12l
         l5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUODXU4cgejkgv/M5ZDhVbHMJ3uiaG3t6n6dSZxymZn1Xiox8P6yrV4ZH71k2kPEJSSV2TidGtl8Da3Uhk0@vger.kernel.org
X-Gm-Message-State: AOJu0YzgKOLTdMR/GHMJIw+qd1VWU4yu+PQZoD+FJdOcDyJNb3h0MuAk
	If+Wy7di7wqk49o4PBQZixnP24q2ipqmbSmT4Xq7i3tI+8mRv+Pbd2dTGbUXAkDXzb3z0masKxk
	gXn9MxurAWQFFM3nlaxVqYjQKDekTfm8s0iwn5nn52fNY4uXxLz/7uXIn2nQwm2ygRphp
X-Gm-Gg: AZuq6aIrN429jW4/gwi7vXa48GjKwjdscSanLn93aDc/59yGYZgZ0eco9CyyyxDbbN3
	eBc2eTFW3yjSti2IQKj0WkjE1/C7qIOhTxwsw7S9IBF47JtshEvpKK42CszYU2JuO6LfXKleZTj
	p7RRyRZliZ5Y3Mkp8h7m5q3kp9Vacw7TyHbyQKqenvuSsJ5Gny/UegP8Rme+khLMMQg+hUvw5g3
	TFeHE9SAZ9AgixGvCPlJ5hV1AORp6nGSHVVq9OtTJ+T27ZNcterRruOH1Mp46lyWQ2VjVdznamK
	sneML/fmNXK0KskT7vCTpmdlkYIog6pTsTv1m5fvbVzwYr6yNfF2A/RskB82lXFrGDOzf0Kkqln
	9wV9K2P6sNHF0qFgl6mq0p110vm6KUbIEbN7MimU7woI/nGOrc8LM8mB3Jf1LlVjEOytFGn/K
X-Received: by 2002:a17:902:e74c:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a717516415mr181775465ad.15.1769047737420;
        Wed, 21 Jan 2026 18:08:57 -0800 (PST)
X-Received: by 2002:a17:902:e74c:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a717516415mr181775235ad.15.1769047736896;
        Wed, 21 Jan 2026 18:08:56 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:08:56 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:16 +0800
Subject: [PATCH v10 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
 b=rf8eEkX6xeEuQxudEYmOmXgRoN92u1XmNwp5u00r7XMrpm6LzyuxgLLZ8Lo+mYOuaJZKZBuJH
 /WrVbjKjsbFClTLEWHl+Ay3vgW9n4BYJjwh4rGYY6dPKEpVTDE58045
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: cB-YuxF1kheWrzCNmDnOqqfQSSmj-fgC
X-Authority-Analysis: v=2.4 cv=N7ck1m9B c=1 sm=1 tr=0 ts=697186ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cB-YuxF1kheWrzCNmDnOqqfQSSmj-fgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX+TcowBA4ADUm
 n3U/sJIrZpj/6yB4cEp0O8Gfc1rbvP8V3U97Gw58l36CxD0g9FjPBaJiHyuTiC6NK8AgzTy+UKY
 1NkRiPu1ChSVMi2Xbdauvk5A9l4MJa2Rz49xvsRSesryhWE178gniKUP/sKSyPmS/5Kh0veNyFU
 QQhqnPD7Pi1dXdNRq0WbcyD5XY8ezNtjBYFCUzXvLfKMpA7KZepDYkduXKd4WHJjFnO+x7Yx1bC
 Veflc7hRUbitHIBRhjMm58XTulJ8uPuEe7wJMyChzW1GP7yCkC0mGF7Cw/CqIZumB8p5VNpgRg2
 f2EtNHGmr3ab6/UhGE1zg5/XrwAkP8Fu7jr2A+NWQE2GZdlN9KZ6axfjLnWkMTJklftk8TbUnra
 xDNKysez6WpeO7AJksi+xnhGxDPmVx1qPBiMj0Q4LNVDaz8mGqGPtflO94aRHTyJC8RzE78JW3a
 IbcyfDH6W5yor6Q13QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-90103-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,desc.name:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
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
X-Rspamd-Queue-Id: 1331B60C04
X-Rspamd-Action: no action

Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 50 +++++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..8b0397a77e57 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
+	if (drvdata->sysfs_ops)
+		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
 	return -EINVAL;
 }
@@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b3c4e6f0a5e..c9a82ff6cd00 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,6 +221,8 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+struct sysfs_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -258,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct sysfs_read_ops	*sysfs_ops;
+};
+
+/**
+ * struct sysfs_read_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct sysfs_read_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


