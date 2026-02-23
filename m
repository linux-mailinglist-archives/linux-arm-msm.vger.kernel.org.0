Return-Path: <linux-arm-msm+bounces-93590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BCKHzf6m2l5+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:56:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE31726F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3993B3012BE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515EA34A785;
	Mon, 23 Feb 2026 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQjMkT1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+XaGoB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3234B1A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829796; cv=none; b=p4Cyj6He26zinx4z9r+xbZmLaEERD0+i7LEU/O4sFaGXv6/DyCt6EVuAhBTxYBH53iurN8z5s7tUWSoSScA8FDn8xxXF3aD1sKY6BSvTM3EuV54/kcg302SwAyYC8WOVEfnEezLhwmZaZ1rG2bRyC1lntKdt9aPqpHInIzZRCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829796; c=relaxed/simple;
	bh=wH5nsU/eD/1ygNqCsVaoWKHsLxpu0A62Fho+0L9SEqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RM/7EZmnsZtNK22k6FkrgSJqsT0n3o3nTXHp5e4ociSsB0lIJwCjDskRcQhc7JZD9a3gE5A9gg/wWBCUlR7/n5mnUzZB4U0B92p/siFqOkzWTFNeysXK6ZffkF6ipZUl6zoSi9p5KgvvMefuZ8X+qXTRtAhqpECcP3PNbcwCaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQjMkT1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+XaGoB6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMHsJM1427508
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=; b=RQjMkT1cCeTTegtR
	yAX8UtkpknrBVwzzvlcZysykP41Z2IJOCBOl15Hws2nhaWjtf18PbqIk7AK1OBju
	AoUVi4GdgIdUXE9h2033K8iPSoxAICESMUVvc0Lh8VeN4YFbjz9ZfopTSQHXZPIf
	Z+4zNl34ug6U6mUgwQ5EdTV2TCFuwbN99VmJgSfmH0+s6H9anPlUAHHZ4hF/QlN8
	RMzEfgepJ5CzHDgDMmLr8oue3UsNGWi2jCy16qiDlXjRi+gvmAAVfp50uWpchev0
	85c5VTTYZ8Qkc726RBzCg1xGiNU5GK1kDgdbx8qll+q2Ww9tkuOh9s1TuyTQduz7
	6uEj/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7uqsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a863be8508so43707585ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829790; x=1772434590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=c+XaGoB6cIillvxkRydjIrkMR7oMbiuYibMLBzLusYSF/X9v4AT5aVCltUsSSuOWQx
         yYxEqpB1Swf2pF08c12/CIc1ndWn4o2+GN6zGpvtJmOBrnYE7JlUub/b2Sh14Q3kP3ia
         SffypCVjv5WwKISRSjntlMhgMBVvvBaCVxo4zGAfvys3NXXy0sS82Zoss9D+zaGxr88R
         AZuBKjrrEEZ1Vl2lteKcNB/Z8n5RLciIXuziIoVL+tvHbdgzJ9thxYull2QXskk18FZM
         9m44MbQI1bRFPJspkYEHtVl831XiLJGLuc6hX5ol4k/cQR8r7H9T0aU1UeP9iArk6sHS
         2aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829790; x=1772434590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=GtFw9LX6AUFNz0Zj3sFUleVoW3tYEMYiXYiB4d8PjXxwcXvYA3LrCVG6UNhN1i+FSA
         0xmis4Gi/rnLbF5m1RcfKE6UWBhQoS2uq6utY5/SmVpsmNcAHc8tvcG4wdakMUaQ5lfC
         aiLAyXsjLSRvgnt11xgKck5jtRh22NAxke2evnui4VaDpt3kWCCdnw1Qn1E6/0F9W3ee
         EwVbSwnh5sqy9+ym2oftDN9HUtzCuGt9LKx3/ryXRX52D+jDG+Whk2Gauk3ms1F7BYvP
         N3UfTRuyU/XAQxs97S2qGxpTZ0Tb9FVmJBHhvjlCWWyZgUcxXMSLnNCHrizxTt+S8XlH
         E3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX/QnWWX8KbTLcJ+y3CPvD+l4wMMD1jto0VHefT9rHJsOWe823BVF8Tgb/bIdltOzr6L0wFvvUdUhy3JGXR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5GSFy5iz1S1+BQ8H8z4jBlo/9UzCWIb24YXR9+VazMGCYmtg
	jKtQ8BMZLyX+UAngKjBQCXAO2kyAeh+PEymHri4bUjrfcu4bIdyqsCVFDP//SGJVX4s5RZaMJSp
	Jx0MVbf6+GDm5cQGmzlOk0eiZ4cJ9lVgkEe81l0bocTg5cyYxXjgf/sEa8v3WYdN03dyv
X-Gm-Gg: ATEYQzyAWP9mlloJnl+s3se/y884SEiiWioVJPwjGTziuJFm+ACj5ggiov8BWsFg9hx
	qSEXwD67PLj2NNI2ERCtKAzbYjIWlERN0wJyAqkJSTGVaKQvIdxtm3CE2VKuHbha1kteIJh78jQ
	DNgBl2WV3Nt9dqmkz82WAo4/ovILE6Od17XRiSOlCCCP2tgQ/OeAotEOUImQXL5aPakxGw1URvO
	skbIOchKY5QzLFBydSMWKxIjlwQaVwxLnCZLNmjnDIitsnSAiAp1A9HVN2bLos8+Nv7RYyEU8pb
	L+rc8/0hdSHqZ9Bx2pCGE+N+SN8hGwBz1sUEb9wgESybzsvHYn4GXBg1MxEdsyodc3Q599xfFsu
	J4otLG7+KEK22i843MP+qWbuw7sQMMKntxnMgED6Ii6GwEYVRqgxySwc3V55ndqPpnGObRLfBYf
	1eIaJj1a+RqAiS
X-Received: by 2002:a17:902:fc85:b0:2aa:e23c:2697 with SMTP id d9443c01a7336-2ad745984bamr63944165ad.57.1771829789776;
        Sun, 22 Feb 2026 22:56:29 -0800 (PST)
X-Received: by 2002:a17:902:fc85:b0:2aa:e23c:2697 with SMTP id d9443c01a7336-2ad745984bamr63943935ad.57.1771829789311;
        Sun, 22 Feb 2026 22:56:29 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:28 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:43 +0800
Subject: [PATCH v13 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-3-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wH5nsU/eD/1ygNqCsVaoWKHsLxpu0A62Fho+0L9SEqE=;
 b=H43pKn8Uscw3mu08d+dMVb0DXKlrPYSYoKHYO/ML3Gr05Uq7OROqtpWA8vYBorTTw9EQ/UW8O
 tryQ8J9+2a+AkzQvxYExucJi3ODdnVcCnQIyIy1CNbZWZjbnzCkdJtl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfXz5lKdBO3FjFg
 MwtjNOBbQANfp8wtoSQWMWpZlYDhlZs9eN3lfmMmiGpaC07N7BMCMNwFKUlt7q95LEKrG+c4WZU
 eXvMdo+FN04YeZZEd4YTpmg3KT3lh/Y1m0DPnJvxZlmquyTscJAKd699YWqqXaGmWHRDGwSbHw+
 pY2JIYo5Kd0z6WRHWjvHbqpTUsjoVyLMOlQo8rBGOtD3c/Dua8aigZHDt+RXynBwHV/QWsNXnGw
 SZYjnlw/lWca1ikF03bfIotHSKqhwBtmLHebyBE4cQEv+6Z7O4CqGg3xjYkVdmMoAv2utkf1ndT
 xiTamczkux9tpdwad1pGm2H5U5niE27fh6Ho2PQrHLIiJs6uAINBinIPz30jXsBTGs5QjR+/Wd3
 x8eLxXoyI6395puc9ntHHPfFc+Tt0aTvhWCWc4KXhg2Q6YUTGbka/j1q772MMBqt3LWB1dCP5LT
 VA0ImbyzmhXQokVPOXg==
X-Proofpoint-GUID: 4xBxoMSy8bkDKflWeMS5NhZwwVEgTO8D
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699bfa1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4xBxoMSy8bkDKflWeMS5NhZwwVEgTO8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93590-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DDE31726F7
X-Rspamd-Action: no action

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..32ca2ec994de 100644
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
@@ -291,15 +277,7 @@ static int tmc_open(struct inode *inode, struct file *file)
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
@@ -769,6 +747,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
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
@@ -828,6 +818,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +832,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +841,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 57d8394d09b7..92ffaf771fea 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -260,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -292,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
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


