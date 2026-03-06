Return-Path: <linux-arm-msm+bounces-95847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPS3K3frqmmOYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:57:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388422330C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF3DB3060CD6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC383AA1BD;
	Fri,  6 Mar 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiZekF94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYZpXK4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2C39E190
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808979; cv=none; b=l9KZ8VRQCIGUDChuE9SzEKxbnMWl8uEkj5jYXHqJnbfMM4eZAnKjlB/zNj9b7a4ZWoaPCgFUt52xe+Xa8kViK6JnWr7RS5mEM/VkZDtLead+W0H4wx2BlpM39hpi/75p5r+OxJzQIw3hKYD5ZlhMk9etp938dh8JwYR9LxrK93o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808979; c=relaxed/simple;
	bh=AttQkix3m08aHW46j0BnzSTtr0g+owRdurqQvIt3pbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIbKdpOsZWSgwxX8Pz92yxtPvrzzvALpG2V3D0mbVBlESICUmoLC6TDs/G8BWcKE/gza9oh2Iq+6e+nR8gC3+9F4h9C8C42wuz4Rriz3Uq8jbqMd+1proYzPzIbb3PhCCwDh0MhMPJLL9OxoY9+bmfgk4U+sK/huPon7Gy/UgQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiZekF94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYZpXK4N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BasJR1451723
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7SjdswPi7pCIktLLW0IOgccbJarmXU6/ZCw
	04/NF+Ik=; b=IiZekF94KxSn8ffRR4/WZ+hIh246aVnajVZpfpPbWzUvPPcw/yZ
	x40C5cSkYvShCiXf7xKY4RRvTs8dy8lns2/XS4nAvW1/Wj7RcQW2ZWcxWGrw9cKl
	SRc5rcFsx71Ms3SZ7TobsrBnfkI9ku03dI/s2T3ZZdazSJ9LEu6iAE4WcNpRycqD
	3uq3stggTUXg6daooqIXtd0I8x+UNLp3+cgPnF+Api22zLiQ4t5tbO8U+yYlGS1M
	odWHD6MlV5UYq4MsqIGwvfd3qe0NtsKwkFVtRIX4E8kbgj7GIaACgY5TsJBMLOFv
	1jMt/pDGkSHDyol1ZDoP0AzDIIJlGE88CWw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ah072-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:56:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be2f742c46so16294131eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772808975; x=1773413775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SjdswPi7pCIktLLW0IOgccbJarmXU6/ZCw04/NF+Ik=;
        b=bYZpXK4N6toOQgeziWRSFxFv/ZALcTtWbcNeFbbL1CehoHIbM1ePEpGYeIkNDoIbSv
         EdBIaN47ywEcPYjtYfvixz5PMfVE1BOpu2AMAqEvKllZrQXLirfnUAU/74/eeOInRGYj
         cTaaiIRNL6YW09448oBYakV+r9gK9Cvse0zxQYJguOOS+waYXIH6MIaulMDNnNo9qbYV
         LQ4uoTjerYqgbcIiuen3qw/Vq8txrAP4lQY+qRvGaTAos94QmnVazprLGiw6OEM6BAKX
         TBHG12W65AGCgjyVE69nC5Oj66ahDvGYYoHmP7D3O1nUUkb+Jyv1aLNkAPGSlXFzkg17
         3jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808975; x=1773413775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SjdswPi7pCIktLLW0IOgccbJarmXU6/ZCw04/NF+Ik=;
        b=nJfTq379Y8fLyV/fJIMYbWR5Sqd7UvSLD+Z0rTfLe137aoGiIlWw+qY80GLLt94SC2
         ki6DOILDG1Vye0+4OhmOUhMxlcYNhh62D3N9xU1CpMx7NLXo+wRMaiNodENzjeSNO5h1
         B/Sc8PdNavxkXPjTIlRGG6ZPNDw2FVShUAwqCSbH8FFRxv0tV0Dz5mA/st8BJibZG5sS
         qheBjXo/J48JccGvX7LsuehuVBWaSYSPZta1QP8yMyUCg1q2wpu90jSqu6iheSKsI8Zo
         Hwyll6orE6vrP9dmjetS5AHpTjRp6ze0CNgne9fOtCUNOIwkqpImraOyzRLFazPcVoNR
         QbJA==
X-Forwarded-Encrypted: i=1; AJvYcCU2U7biEL57tvSRn72Bxn4L6dIUHUpet4sj/+2cjCSU45+SRL834IuOCYLpgByn7Sfhi96nnCS2kyIlG3jq@vger.kernel.org
X-Gm-Message-State: AOJu0YyomW/J3PlKt73xKTCLenXEgEW7KK76Xs6WPBlZlBAH7cUfbI7w
	qigfF/kwgOnh7zIHZXnflByjUk0y2h2q1pM3y96d3XKEjAslUiMyH3bsyixcfrp+VyKHHnmUbSB
	E/oWsImqxu4YgmzK+evPIsLlGauUfwDHCtlWHc6cI3aa5SHJP+n6Q1cUxME+hx8nB2W1T
X-Gm-Gg: ATEYQzxccM2ExzWizbypdCesYbUimIynfAyssqATez4GbxiEaq0VtfLmU9u8614IC0F
	hvf9U14l3oPiaIbSZP2d+GVi+Rt5rClwz1c5Rhxy5btShSXow5Hsa1E1RR6lrqau2FpEp0HJgLd
	hSIg8JznRnkQt11NTcUUeQgFTl3hsHVagIeGP1EFnv+KuSEp16AFetKBHBhQwDq4g7NqlBbrcg9
	UbxzQqsXBz9XW1A0nfzqmjumxr1r8BmnKxlFcIM4rMztKg4Q2tkgltbv/DhNNCK1TcIwKYyPUB+
	gPSeBc9Wi4Y5cSX1znE54QikiFbkq87vIx01u0YBaSjN70R1vPEXWla0anv1hVpJhsAySh2r0Xi
	Mxj/URPoxFyfM3Qs1edt9iXnjAuyQopNyJRlgDPxvqrKp+fcZFswZbdK/S+p3AswRJ+EehKzOFz
	3YeW16aQ==
X-Received: by 2002:a05:693c:2c07:b0:2b8:261a:fbdf with SMTP id 5a478bee46e88-2be4e067a2emr902229eec.39.1772808975164;
        Fri, 06 Mar 2026 06:56:15 -0800 (PST)
X-Received: by 2002:a05:693c:2c07:b0:2b8:261a:fbdf with SMTP id 5a478bee46e88-2be4e067a2emr902203eec.39.1772808974470;
        Fri, 06 Mar 2026 06:56:14 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm1259726eec.6.2026.03.06.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:56:14 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Add missing space before closing bracket
Date: Fri,  6 Mar 2026 22:56:07 +0800
Message-ID: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pHcgv2sFfgEY9f-yhu_nG7w9aT-EhBVe
X-Proofpoint-ORIG-GUID: pHcgv2sFfgEY9f-yhu_nG7w9aT-EhBVe
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aaeb10 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GiIGSGX71zzE2fQmXVIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX3gWV+SEaQ1id
 Zyv9cAS4fcWw5m1qjw+nuDyCUjieWeVZsHRxVsXxusbRVVHUSG0JfVFQ7zLCMK1W4ntYxrJe6Pt
 ZhvJa5mzOJvZ39z/hvizq03VeRP9JzdxkPkUaGg1DzAnvUtJKOQqXiyuN35ilS6F/G7H9Ld+l8N
 xDEh0fd8w6iF0eDYpCVmc9jQNd9CQSq+vlmdeYKdxp6VL3/qy8fM0ymM7qx5c4s5DWNJEdqMlUp
 5SicPT2NsbMTs5Rr8Tx86329dTvHvvgrVLd/ysf3qenEiB19fBQ/jVCo7vgb70OmLR2OBdhO92E
 gXWwlCAHuEU00GIQG62R6veerB/39tCLSTAWZuIKit5cnZjHnszRNozcf1P0Cx7z9geJInFLb4W
 BnSVpWHDdEq2taXlfHk0tcjWzEAnFS2gSA/U8rKwqJF1ztsnOWJTFXcvuth3CIeXbqlWx7ATD2k
 liDrSIvIMpE24/nBsQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143
X-Rspamd-Queue-Id: 3388422330C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95847-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add missing space before closing curly bracket for qcom_q6v5_mss and
qcom_q6v5_pas driver of_match[] lines, so that all qcom remoteproc
drivers are consistent on the common coding style.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c |  26 +++---
 drivers/remoteproc/qcom_q6v5_pas.c | 138 ++++++++++++++---------------
 2 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 91940977ca89..256882b2fd67 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2657,19 +2657,19 @@ static const struct rproc_hexagon_res msm8926_mss = {
 };
 
 static const struct of_device_id q6v5_of_match[] = {
-	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
-	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
-	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
-	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
-	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
-	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
-	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
-	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
-	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
-	{ .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss},
-	{ .compatible = "qcom,sc7280-mss-pil", .data = &sc7280_mss},
-	{ .compatible = "qcom,sdm660-mss-pil", .data = &sdm660_mss},
-	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
+	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss },
+	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss },
+	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss },
+	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss },
+	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss },
+	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss },
+	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss },
+	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss },
+	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss },
+	{ .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss },
+	{ .compatible = "qcom,sc7280-mss-pil", .data = &sc7280_mss },
+	{ .compatible = "qcom,sdm660-mss-pil", .data = &sdm660_mss },
+	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, q6v5_of_match);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..46daa5c9ac3f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1531,78 +1531,78 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 };
 
 static const struct of_device_id qcom_pas_of_match[] = {
-	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
-	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
-	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},
-	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource},
-	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init},
-	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init},
+	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
+	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
+	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
+	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
+	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
+	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource },
+	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init },
+	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
+	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
-	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
-	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
-	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
-	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
-	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
-	{ .compatible = "qcom,sar2130p-adsp-pas", .data = &sm8350_adsp_resource},
-	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
-	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
-	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
-	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
-	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
-	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
-	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
-	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
-	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
-	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
-	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init},
-	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
-	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
-	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
-	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource},
-	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
-	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
-	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
-	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
-	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
-	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
-	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
-	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
-	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
-	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
-	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
-	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
-	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
-	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
-	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
-	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8450-mpss-pas", .data = &sm8450_mpss_resource},
-	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
-	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
-	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
-	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
-	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
-	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
-	{ .compatible = "qcom,sm8750-mpss-pas", .data = &sm8750_mpss_resource},
-	{ .compatible = "qcom,x1e80100-adsp-pas", .data = &x1e80100_adsp_resource},
-	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource},
+	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource },
+	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource },
+	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource },
+	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource },
+	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource },
+	{ .compatible = "qcom,sar2130p-adsp-pas", .data = &sm8350_adsp_resource },
+	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource },
+	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init },
+	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource },
+	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource },
+	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init },
+	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource },
+	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource },
+	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource },
+	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource },
+	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
+	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
+	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
+	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
+	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
+	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
+	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
+	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
+	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
+	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },
+	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource },
+	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource },
+	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init },
+	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource },
+	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource },
+	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource },
+	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource },
+	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource },
+	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init },
+	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init },
+	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource },
+	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource },
+	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sdm845_slpi_resource_init },
+	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource },
+	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource },
+	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init },
+	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init },
+	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource },
+	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource },
+	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init },
+	{ .compatible = "qcom,sm8450-mpss-pas", .data = &sm8450_mpss_resource },
+	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource },
+	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource },
+	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource },
+	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource },
+	{ .compatible = "qcom,sm8750-mpss-pas", .data = &sm8750_mpss_resource },
+	{ .compatible = "qcom,x1e80100-adsp-pas", .data = &x1e80100_adsp_resource },
+	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_pas_of_match);
-- 
2.43.0


