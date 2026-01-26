Return-Path: <linux-arm-msm+bounces-90487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCQ4MU0dd2lDcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:52:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436385133
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A59D30107AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4DE3128DF;
	Mon, 26 Jan 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9e7xKdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJdaXQF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCCA313E2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413732; cv=none; b=IeiQdxlp90q+2rnzOvpOwNXkMjcOjn1Cvod+/JvFlqt0MiaUpNBfrjnSUB1Df3jEv570y9msVfNjjd1k0bXnQ9KQIZh1QNycl3eBwH/Swe5iUdhQicnA75lOiPaOLEnTIhhsz/D+LBb/e0spzZXZIKWru9WPSKjccpk0FhIA4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413732; c=relaxed/simple;
	bh=CwCT5/x9boKhb1Ajkz+foUdUOzmm0/q81QDotkFpGzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8uRfFe+an3SCZ43+Z7w03FLTqcNUE1XuPLYg35QqQaaE/buccWlUCp8a1S7OPksLoRcAzgMdVh9x/c+OsY1dYbqWQ+Tocvtc1LSv4yEnnFINlBZ0lrODvA2/LN5PlptpQlztFqeZnNbdCTeshSzvEEKnY7QMy+9f+hDuAjiyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9e7xKdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJdaXQF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLS2Vd4162524
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=; b=n9e7xKdyqtsIO5rG
	F4lPB2ij4lSriSmuqoaPJzSerq7syILRisxT3UKxfXDEzC5afCP789G/fSDqFNNp
	gTdJBgXF1wRI9Pnr+UTUEPka+sceJqVShAzl3JzdAswghULQuH//3hdIkI2E0Nf7
	5w2wVqhdWYKwcStLfTLtjEQQPNA22H0fnYcUelOmYq8s8e5M465hYafXbdA1/Vh1
	m8x8f1mtRs1Ecna9+wv/dCLmNQOX8+uSI8Z8gXwY+PvC7BbDoLsr3YQcTnVIg36x
	piUO+cBvP+gcOewQ5EeDYg1QLkoicKhsQF50NK00TT3RSG254QsjXsojsZ0jMhn3
	iERnmA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xus1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81e7fd70908so7869207b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413729; x=1770018529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=IJdaXQF2CRE9nQKDdTYJ+dsGny5avJ2lOrD5B2UJptsthQQqWT7IwXUEh8fCqorqRy
         mmqddQVaIyHHgzyhHUxJe4yZ5IJya9VH6i9Lf5S0tspphxDbxiXAIpcl+s0m9OmhPOyz
         lAei1QoZ+n6o2hkSp5Hjl/FghmFpdTAa5PcxQqxeODljQLYvw7DhPXayyI8vG3Si2fto
         cSxEVBw1yW+TknH8RoBpRv7UA2pk/EWmZH6HeL5lAHyH5kMZoeR0ssmkIWTdczcyNOMQ
         luvsec1SysYX2QV+QxQao6FshLS+C7E11dlokeGepSOaiX8UDyVoaYezzMisWQLamfhx
         /prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413729; x=1770018529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=MmVr+NtoRVyfiWYClXt7Y5IPvqlf1SGDbxo59kiAllKr/sw6/SebVbrClVtRUOU0TF
         FbflhytZybOz2gt7EMdL6vscnueIAWD5/mLeFLjT6eWM4QCFu50lpGVb2GW55Z4eSRNN
         agOdhZW7X7U0BqInSWpTBDy+/fwQJTl90Hww0go8+O9bGiNIzc61kLw3/9hyw+5+qO67
         pL5M/03eNBc7eOX88NZApvPoez4izWoTXI8JF7jbab6dB8UsncJ87L19WE+XGViF8uFX
         i4ixYE7vmqFzVipBTnbf3JRXl6tKPufhY9fmdXtcfq+6ch1OE9jDiB2DBfEvPVvAfTgd
         IWPg==
X-Forwarded-Encrypted: i=1; AJvYcCUOaBCETmGkK6BEEA9hNdaFavbgzGew2qkRtB3dHqNX+Ybg66x+MaXKn4hGi+Ym9/TnxCI3GYw2lT+Gsclx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz65hrQyeCUaPe40C3Pbtxd0x6148iZyqvyjZm7G9W7RRScEqj7
	WW89IaXgbDTw/3osO7etC7ZIEyQ4D4Rv4DpRbgKsig2xOYnjlQLuAzSFsUi3D3MER3qNS0smz8U
	kpVg0ANPS+sTfw3bsyKSJAA9pXcbc7YAhzwjkZJukToQb8Y8erVmxq4PUccYcQR/JlsJU
X-Gm-Gg: AZuq6aI2WmAONvjkeY3XFr4i2lsFqyMPzKHauiBlkYnN2xIWWJAv16Q0JtXcXCY/7zL
	V9SD+yAeRR5rYpkDjnn4oSQeyjiSTX8RKHrLzJb6c70GUnllLZ9A2WbCXgXpN4Hmoy6xhr8JFiP
	55ipppsmfa+m8gzAeNvJbox89mbD6yyy50Gu6f2dOqBP+cEg49HrlfgukSB6rgZKOG1DCzU70UA
	BmV+cWiiRm8sJpFYytR+pYS2zitw1KDuPIGeyogPkfDs2xKlwCvZWZbDrpYSO4ZZFT4+FKwtlYU
	FedJB4rBNaDMQzcqXIIHCJrI9+vOdq97K11pkf+1FgX9hTIX+vObr03SBAv+r7EU/Bg+z+2shZZ
	ZSypbR42kO5Y3Mqmosz9ILFgLRSCHFJmk8r2oSqWSi/0HfJUntC5fPAtYnklOQ3ih5eIzIJoPyu
	U0
X-Received: by 2002:a05:6a00:9284:b0:81f:de60:39b0 with SMTP id d2e1a72fcca58-823411da07dmr2830798b3a.13.1769413729097;
        Sun, 25 Jan 2026 23:48:49 -0800 (PST)
X-Received: by 2002:a05:6a00:9284:b0:81f:de60:39b0 with SMTP id d2e1a72fcca58-823411da07dmr2830765b3a.13.1769413728607;
        Sun, 25 Jan 2026 23:48:48 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:55 +0800
Subject: [PATCH v11 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-3-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CwCT5/x9boKhb1Ajkz+foUdUOzmm0/q81QDotkFpGzA=;
 b=Cl4fdo7nxRQLBIImPb2gA1ya8QZK0sZl7WyCD5lomXVdSWJdGJRffVnzjr6VcolRhx6x5UUn2
 FRFHQSMSYPKBcaC84Macjr8SUm23SdXP0xXOEqDLRd0hp/VoYoJ9J3W
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: d45mVx9fG2AD6SHWKRBAeYiFMJyTeGqP
X-Proofpoint-ORIG-GUID: d45mVx9fG2AD6SHWKRBAeYiFMJyTeGqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfXxfoqFJBhfN15
 Bo8OO9JvlvDGOCb8r4w5jUh5G4b8EokekttdzOb0Ful2N76EnADJ4CR/ikBrZF4SBo3WL2ClWc3
 cHpl1mqdqQOGcufzOLVIPs2LvO/qWMxx31q/w+zYxz2se8RI3HZJrhiMAatQF0t5W1DW05hT+EC
 liEd88nODkhYi5rpEgX5L/n1+6QrE7BbB8gOl9lLt7Tg8Ds5DFAG5MSdZ3fYMlwvVRpc25A2kGj
 IkkdqxLOXRYXzEpp08jJnFGlWTM37WzTjWIFRFpC6GE32mx9tXJXzuGU5S+QofdfTHOua1wxZrt
 siCjOWN2VdmPeL2rUR4ttOayq67Osbgd+m10RTwxgY11JXnVxD/iZlTjTe/58cicWmcbld61kXf
 aPgFwzgSPX+884rJTza9uHiJJm580HW8YTwtwp7lvMh0+pdFcBZep5ro9JzLEl+k1ttfNG74zHQ
 77mC/qkdBdwalNtj2wQ==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69771c62 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
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
	TAGGED_FROM(0.00)[bounces-90487-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6436385133
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
index 9b3c4e6f0a5e..c780f6d5dede 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -258,6 +258,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
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


