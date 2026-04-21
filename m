Return-Path: <linux-arm-msm+bounces-103930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG73NZxY52n36wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:59:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B47439DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AA7305BFE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F4E3B19DB;
	Tue, 21 Apr 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeoJybME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPQfqIzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0183B0ACC
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769001; cv=none; b=VPr7EdbqzgcjuR38CPO1sPFNZcdRXNvbqKCKAc99TXcF7X2EtRMUoV9q1MRTzQTfkflsoAaRNNfCUeIdmZ9iaUwcjREKrK9EynEu6Lf82vDshDYZiSK7DHBBzTaVpGTvioyyzQNyKeIqHUSctGbCnd34yhM7BXjz5CvsOixlViY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769001; c=relaxed/simple;
	bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s18e8B28/qWe+WajfaPzAaWmhtr8Xmsv9K414snFn3zwX7vu4aR8LSWSdnGZAqYkVO5Yrn2GYJPAVeOGpqEa2FOotPUp2oxNl0woVdwno/cbWQJpPkKmsacAEgHErQuUJFlR5ozksKCE7BqeyDVQKpRWaCjK3iZ5Yh4ltINXpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeoJybME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPQfqIzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9f9f24169095
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=GeoJybMEmBngamUt
	0Apgufr0QpAMNtezGVorcHVZMx/CMveSithnwQp5Taz5ZGaRDRZxeBXKMJ4JlVQV
	RxVh4hAWCkQtUwD0xtKobM/XeTESt4qoPETKECWp1Vue9gY4ZLdkHQ3lhargy8Jy
	sz+cQmlsxknJ9B7qqtvcmDI4IHG7kOX4Z+cTOtKZz3X/cHizEGlgqd9JyanIny5g
	MuNmVxeImrzdj0cFBHfQvbw15ovHItmMWJDB9PGqy+RhtviurV43MYKRPCST64O4
	X/wH3y1I6u/ODq5nF4s9AKt1tgFvFHqKgQxTgADqcJ4VEB0bWnQOZM9B/P6vP84u
	Yys9AA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au1mt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so3666455b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768998; x=1777373798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=TPQfqIzMsK+M1TWaXWZZScuE2jq8jVy76GT2J+r85HQ+tDNDiTSzycLqX6s9rHmsrZ
         mG+ZhGW/kTqVoAdK/KIdxLlP6TALyqEh3m1zoYwLVF5oWXxxzE6q2u0KIUddCxxH0rGh
         e4XK4I+u2P27i4P1KobpzicxVVadAAkIEoCKx+WzjCrCcsa1IJroZTAchqddiLSsuITy
         BuwOVimOwCJU+3MriwMuPFnpeHOdyelKQC4fK7sQrLdB3haDYKqp+hBIaF0VRzOtKtYi
         ncd389JzXW1yguFGGh5RO4Y42r+4kNIreDGMjOQIZl4G2tEpdtEgEtKveyJ4NqkUAfAb
         8S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768998; x=1777373798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=dsZcts6tZ0ARbxXbLWDK0kv278X6IU6KYWHFwc9+wehQm0iF0FtSbZihWHgGCO13Eh
         oxNrK13e3mPU3iq0re9i7C60hnE0brwLI4zeTu7GsOh9YoPVGoOSmqcemzsw21yw6QeL
         rW3MurEvjYbD2SNn3jE6wEbNxz/R+Op5NWdfrAIjeH9AhSGz3ol1Ntxm40WSdoWkP0B3
         7+gXTnQBWbonUwZdFbft0IyrpGKeswouZ/f1a0NwRz8+QITyTxUEW0m5JbllfSQ9uDld
         SlJdx3/68AcUiWSFCuGGXLhz5bH4glWp7zUVfLScmGEOC3KB5qypyvD0X8QptvE/4G94
         5QVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aKGn0svQXFURZcmzmTq/FyC+UbTH3x9gIOY0R5692DU79XNYAJ6dRM958WXlfAW/GF9Px85t8JSrypkAu@vger.kernel.org
X-Gm-Message-State: AOJu0YwQuQ1UXA9puIUvD1V6W5L9NFqRDavCaegFbsNF3glv1xw4/ck9
	1G5w9wTuTxPaNF0Pe3U5gy7AVn0YBimqNRq+DnB68tuueziIZboxT5vMjjstuvfbyiQMYSwzaS4
	kcDkz9+KM6vao9ZS4/AJ/OFhf1c4tWUOYbq8Idiew9uNhuiIav4OREWrs/OidlVFvbvH4
X-Gm-Gg: AeBDiesEETW/9tu8lEI8cywWkp0Z+2uXHt8KuzArTndq/Jqqh6byteqdPca+1ruEiRM
	qGmxv41wB11CiTx1TDAO5QUEV9fXrjEkeRAVj1WZ7v9K1vCLLbHGxfDWgDFxSyoGMczbdqPG0CF
	VN8mSxHAxvT85aKI/oCNPfZqFjDtbvxmiI0GHS9mGSHkEmHgIspCt0iElMhYAgRyhtCgFz4SJtZ
	YgZjXLnN0+AJEO4izLgCLwvn4EmvdZNYZgTbIl85rf9D+xvUL4lPm9wzi784XSpVqPjDB/H7bOM
	tm/fVtJc38bGXujaI0yX2JB9R1z2Ujzk/3gAp0A33bltW4Bj3epEPgWbsaqKHXnjEy4Cz/oe1x7
	J2vfRIzf7MLIjK4qa1JOccyatj0EIXoBcTJ9Ha1N2tudgrmqe17GLtWXB3I5ks6eoz4SJOVPRPM
	r8cblpkPC69prZix1ZaAQ=
X-Received: by 2002:a05:6a00:a83:b0:82f:4bcb:a9d5 with SMTP id d2e1a72fcca58-82f8b387e8cmr15135269b3a.14.1776768998190;
        Tue, 21 Apr 2026 03:56:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a83:b0:82f:4bcb:a9d5 with SMTP id d2e1a72fcca58-82f8b387e8cmr15135238b3a.14.1776768997708;
        Tue, 21 Apr 2026 03:56:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:52 +0800
Subject: [PATCH v17 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-3-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=IfNyRA3MMtWPKSKkwi7v4iWcTDh/I/aVtZaIZtDxu2SqhaxcEJ5RqWM4Ax2oW/BsjCTcVEh56
 z6g3vcJa1twAvsV0woaMVwt9aqWa+lI1iWBnQUvc68LzdDBLo3azEbC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX9HN3BMBHqAxT
 WYLsQ90FMZDlaVw0SecG4QQ8ssHY6qjw/ytjhqke+6hzFekQ/MlTlAm8rdBD5DMRFbRcg3RTS7a
 MmVvlR2ErKez5UbUQCxHHUBOcjVuWnuiTaPxDjyxt4Hp6TCuNlaO9rVZlYCTmOI3yLC4Z+2/YaP
 PueEJj1wXpeR9fGsr1MmVUU3Gk9FIWm92gvkzALMXWpQHZObNzo/SluySE/82NL8NpERjKnh4rh
 GUmPv9HUqGN48i8ZjWWt4WgKVPkWtA4Z2ZZaEJtMCPPQkqfoXgPLScJQmyrDiZW5zXK1liwp+Ng
 M3J/MDEKqZrUmagJobFmzXBa2qAkZhvbnbRDEwZvnmB6lzu34XrfLdKrD4ZoGIJPniVB2AozV16
 mBlwGRxFoQx9bOUi7F8z0LyEKGO2UoluXlF+L6rLpgJyEJGwH6C6TbuaP2paEYGDaoUb5CklJa9
 4+vTkUky0pJX9xsDYcQ==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e757e7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eHLx28fpOywnpUhm60h4SD3jEQI5otVq
X-Proofpoint-ORIG-GUID: eHLx28fpOywnpUhm60h4SD3jEQI5otVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103930-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,desc.name:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38B47439DB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
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
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
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
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
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
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


