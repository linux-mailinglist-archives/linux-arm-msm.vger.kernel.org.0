Return-Path: <linux-arm-msm+bounces-104580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGs2DAi47mmMxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF846BD45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBFE0300360A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D97246768;
	Mon, 27 Apr 2026 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2ifikMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZszsIRT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E988258CD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252345; cv=none; b=MFaXqX/v/c4+PNwgp1RbMeg0U3oWwI0+IwdxjDz1WXDIZBxhh0o27FdLLrj/tv+8VQssNPFl6eb5ZA3zite+SNcDBqVrMTVLxrNRaOzeN5hqVuisoMbqpe5oAbxq8v+ak6JVPpkrkPUpE6wIWOw00u1EONmAdKFDoDMOQ5LLRNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252345; c=relaxed/simple;
	bh=iG4COkTCGYDoqlZgFFtAAmBBJQU7vlY/JvqnefudTyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1JlyQ42xbiE5JLMWjXcth1YlR5e/uIP/LYafHhDFUZZydaV0rMqF3emtxOV2oVNLLNs9IPajq++00pg1LZtFjy/rYdmxgfXqduKAfAQ3jhjaZmgtcIiXT35PvSEN9tsDCTovP3P7vtH62/SNUMFhi0HjHOFPxJ63hybyERdh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2ifikMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZszsIRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QLkcDS3492076
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZDcRANZglOV
	UaL5FLV39PVd3KiA0z88+1ozBCf+dwxw=; b=m2ifikMUSqpNzi8e/ahUaNvrtsv
	QSxIfN6NjXSFxjFypbUr1rc2lJ238VHztaAv4czL6SzYo65/QzJmfuKukymwloj1
	9WKsWCovwF4BvYcusk9qg4xJ3fl50RETv+vqzTIADxRxhf7xuY8PJwCuIcHYAyOt
	S+QUwbZSQROBhVC3WANN0b/I/iFE/pNLEQ8Uuf8mffVxVgDxKDIT+e5eZ01l/FxH
	hj8gICoqgpibNdj3T/+j1S+J/tgeieBnERpWBQZNm6hl6QXfMRsD2HlXQdVSsA5A
	I2m/INL1QvW4wt1vKy5laRlfFeNChkh199q3OrrBNazjAxApsa3P68Z2W/g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdkugu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so23190901eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252343; x=1777857143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDcRANZglOVUaL5FLV39PVd3KiA0z88+1ozBCf+dwxw=;
        b=GZszsIRTHc6Yc3fV8x/UHh3QsfM2AsEcOsLnZ26YP7SN6srZfMTsR1Cb3iDhXL2Aw1
         HQWEQOYZapDUyauyn9KusCH/18CXzj3+uakks8f8kGNyxtUk2WYT9ySbi8iMqVa7HZ/g
         YPVypbQBp6q+ujM5WRudoXsC+PMt5Bydcp/PphbaR5KjJHvmV+reNPVvzmjJvv0jR993
         C3rY3Yv8zsMYx7HPxVjT74RuA7W9rdI+SFY7wafX8FBUik6wwxXl56Q5IZY00v7qJMRX
         osDC8YqPWLEqVlN16sApRSBymxY+CN1P0TnCk0ZjNnhTvjlOrOsjLW/n17aDpgLnQMpK
         TMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252343; x=1777857143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZDcRANZglOVUaL5FLV39PVd3KiA0z88+1ozBCf+dwxw=;
        b=i9j65RGvFmm0Jq1NrwkRiMjefVj3YVvOnu7Shz/YW5bzGdoLcbkuJ49mjK24k0Cljk
         St5xPdx+Y5KdX1HZPGMWdmGdZzILevpNzA9c3HAn5R1XHQqHn7egZzbgvonNRPHtzDaw
         MV/fzYtsZt67JI4cgfiCSwH4i82jd+sH6G+EI1TiuZRutVFo9ZenIxlL9jgm2BroApgx
         i4wxRwOfpulSjzQh9kAy9mdhWHt9K0ofe9E4SHOMkEQGITSEZFwQxJIDeEIf6QnqwbBx
         icKieEB275IDtrhII+4QInsVNyAEojZ4GtE+vvPern3lMWODbixFOjQXkm+5bpENjD4l
         OwIw==
X-Forwarded-Encrypted: i=1; AFNElJ96EaM9S41F1qHyHZ5RzbUEC7s+aqDouKJp1dP/g//5NROig/dLE3iv4p84Drv7pjVJ6WJO27iZNLKvaTT8@vger.kernel.org
X-Gm-Message-State: AOJu0YxICtTb1J8XVnlTomVz1wX3CsehJ9BW5XJGcXXHFzd9Tct8fnoc
	h9gh47+AiUR9zdOBQMnnq0Xg/hd8c6xA6bzSpb2m1haBL95AwqE8W+g2XcyEgzHcQuOMxZH1feJ
	zOk4Y+RKhcFjFepebbc4eCPR+43qqLlYfYhMv15xxkesDCCbkZSAKa/NSQhdIPlliTn5P
X-Gm-Gg: AeBDiev7AKstkvpLWMBVPZBv62IT5xqiU1Zj0RABODpCpkfW6RX/GAYTKKrOPnJtCoh
	hTseMFiblqTO6eYwHK+cm4TQlWXj8UlmCIiETGNI2rO6HzuG6oRaHQDOgIw9OsHdHSc2JCsy9Ge
	lIOL+gP/kHFZ+ZULJ6Ug8X9PeO7WhFAuMMEvQOzXHIYwiGIPAfoxxfe41To8Btl1iGKvV7s1oHv
	FgNXx1ubOzwLGKoLR1hcX77tBoZUouwqjGaXr/A1/U28aE+4dJEdj8SvaomhFkFA41bJngEe/gs
	MGbC2QazF62mU5V4NySKfq+MYQz56yXF8q+s5eHBJx5IbY2rl+Ry06jPb4V51jg8+Xk/+am3ZRf
	xCLVEW/ydAONKx9H+50hMfQCZccrX1R9OKr7I6HPq3/7TRtzZdza4NGlZ65nFF6Fuab2IIS2A6U
	Ke4yEVNo3cV5v3Z0xu
X-Received: by 2002:a05:7022:6b97:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12c73f66d99mr23095257c88.6.1777252343004;
        Sun, 26 Apr 2026 18:12:23 -0700 (PDT)
X-Received: by 2002:a05:7022:6b97:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12c73f66d99mr23095238c88.6.1777252342506;
        Sun, 26 Apr 2026 18:12:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm21720098c88.15.2026.04.26.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:12:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] regulator: rpmh-regulator: Add RPMH regulator support for Nord
Date: Mon, 27 Apr 2026 09:11:59 +0800
Message-ID: <20260427011159.230698-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfX4GyAz4Sgtlb9
 wAITzq/RWayp+GBnpIZXORh7J1LgNyEnf83JWvh5LEGrab8ZeSfXk4ZsrQEGJ0ngsvli0B20tEh
 fT8hEj9ru7e/6fNA3W+4/AfD3fDMnkRYiacJiPnLFhiBtN9JLA7I7E1bsYVukIMWXV7y6fVIoxB
 pi4siiufY7hLMM/wdhwEEJrbzquOD/SwWSEa8WDLu/ljBbG8XnuWgrc8x3lmoZ1Gfs2WluEA0Fx
 dO5SJCyFy62KWrOZWAALbo2o3GKm4wTJfGt6oPVAfq3CpCzF2gzqd/WF7442+4QuEYdAwReN8zd
 nzmdNFvC4Bqpp3MCC/QoxOWFj00b0NnCNGINNQIh+PiemT69EQLjQKC1HGCToRwRCmGoLggyUa0
 lLFe5aVnDAJn9p0bZmcDMFMQ3GdNGjJJ1Onb0SCg6A9GP+YPvPL/P0vjjaMmVpo3K8bVQFjEWGX
 j2caZ0o7t+ccODJIf1Q==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eeb7f7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jsfX6IzCLFrmiuH_c3QA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: MLi73SiqztSwCYXu4f43Ek1_Gg_n3M62
X-Proofpoint-GUID: MLi73SiqztSwCYXu4f43Ek1_Gg_n3M62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270010
X-Rspamd-Queue-Id: C8CF846BD45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104580-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add support for PMAU0102 PMIC voltage regulators which are present on
Nord boards.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..87cba629860c 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pmg1110_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps510,  "vdd-s1"),
 	{}
@@ -1877,6 +1892,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8998-rpmh-regulators",
 		.data = pm8998_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmau0102-rpmh-regulators",
+		.data = pmau0102_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmg1110-rpmh-regulators",
 		.data = pmg1110_vreg_data,
-- 
2.43.0


