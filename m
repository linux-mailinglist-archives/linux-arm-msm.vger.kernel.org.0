Return-Path: <linux-arm-msm+bounces-90488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCrtKsked2ntcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:59:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D6852CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 283F1307B457
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113EF31327D;
	Mon, 26 Jan 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrO8H3fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7TzqVdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBFD313E33
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413738; cv=none; b=jo4QAPwlLDSNF5IlF4SxHGf/+h/R3sc7JXzHZyrk/a8xHa+33U6SwfINuUz8r6hR3yRc7/JilRPHncPAMALWjXvVleI1AnrbK0m7CYT9G/wwXYbiIWBsXxS88ce4KBMyyy2ELtc2GUaqQ3bFwIl53r9hSLhZJIASmSEcmditwNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413738; c=relaxed/simple;
	bh=fYWi6it3rCCr65Id+LeC8mkX1SDe4sDJPpCZSTfEuGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZmcEG9VSjmiXV18/N9dO/Jk8uFgiyDel6fr64pJ70pNuW3d4V9bA8X63zfEVwpWhiQPwrhgejwur2hhCNmWgFxFI3U+U+hbTBlc66qTstI/Br8V3ahlvFhInxpBJYECpcSRytfA7lRASbI8zbRUPwyMBWShOARmDvOXWrGBQhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrO8H3fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7TzqVdy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PIxseC791030
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=; b=GrO8H3fht2IipknQ
	sSKyAl4IYQHxY1pMQQDatJPvob3JTF3HImBr4ENW1yC2sXQvP6lzZsC2Gx9aaMQP
	pkHVjwQg0iBU6Q7Gl8KVU+VfDXn3nMF/GZ4ZiW+rjhKMhkC5ZSindFIf0dpiF9M5
	jzBDt18AejB1L6MkudfIr9Ky+IaR/Ze+aMumJfIMGdtV4mLkgrG8FcJGA9ohIlUY
	WHscgldAL7WDUmyTY1WvnnL2/w4GZ3tVRCyx+eI55O/ZOsjzeInNsu+g363lbIAd
	UwoYhcec6B9tR7/QzKoPql/WC6tmi905gd66h7BoF15wnvNrdAhiV4NO9u+OJvfM
	owMHUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hbsv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso3252784b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413734; x=1770018534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=;
        b=Q7TzqVdyydfy9M0h8XrRNWPfU1I2GTBLamtXs1zWMMid4qDvDd5chMMA6fDKZKy9QT
         9rzN9PncmgNQnlf26lmQsEZcjHIK83vS7yk/Jplmu7yTP7ZxPy2r0SB8JbAlR9kqJzIm
         Z4/nmCr0UQ4F8Ze5gFIO32VX1pGBrvoVSVgRgs0B0xWqpIqTvo5mIDHuuSLGEqIZKa20
         tA1tSayFVK5VupMFYCQEgvETCgmg6dk8FEZ4CZSSD5x14YsILoBTAZipHCTUbdcml/1H
         06c+VFIgGkTV1SdLmnMZwLlZTJJfxyS0plV+LHAHbEidaGFQxjEwNBrDoABGCeFIHU3A
         exlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413734; x=1770018534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=;
        b=WBWczI4g12ARKHOTiElSE0gz27aUFPBimuotUQPWYvP498u7Y3BJLGWnXrd4NcvBbl
         N7JWn1RbXuDfPdk1ZzAb9GEEpE9hPQCcdb/hjLVYMqr4m9GHNqZJiU+tk9AWqnkYhUj8
         Jn+kmKD/2ThHjFNw90JPyv3oZoV6TK2rkJaR9L1T2aQnioOjVh5zZec+ZwHBPuM+7d2K
         N39N0vpqpApS0GKeWoJJT+nCUfU0yNOaGPzPvGTsk7z2qh7I7myUXRmxYNdx6cqOKc0z
         vkDMtzXGeGfpn35G7BmGdijCCNrHD6yxecqGA15BfIH4VF/83nKzNMfgzV/yj60PWZPL
         MGFw==
X-Forwarded-Encrypted: i=1; AJvYcCXNK4RWe1vDQhtWV63G+vV6f0nH6oBG5hW4uYyV7YTbMEXm8/9vIwKCFcDudf6nMBuuEUBlDtHU9F040mD2@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqicFq8JAjX+4bUoXU4LIdwU+Rfc1lZpKBmyPjWIPZmJKg4jZ
	9L+oX0TG+46p4+iXc9Tim33Ezhail69NibgEqj3g1laQdMA9Ro2uqw2VA0rv3Q1nO03FAdEn/FO
	As69zv2HvOHWrUkvBRFk2nV81787nqDMR8VfpDsAgvMa1fxyNCqqSS05S7h8KmfODIrhv
X-Gm-Gg: AZuq6aIVPULronem6fQCpqdGEvXcfWjGSlf6+nnjDq2EZYPpWckAjgk0v/ezngmm+l0
	05bHx3fKJK/9BDXBZRGNuVaPKiMpUhpeIn8X+mPaDM3Et9gu5KJGKnlldEwjhg0f0BOtBpHOKeS
	Nf8QCEiIn7OpqxLwQkblBN8g3PjqAY0gii1tFKApserJBAhlK0Mwbia5alsVdvBBVqLajA7WRWS
	sfMT6Thb9FE03g7tYPk43PGnW/CJmyy8m/G06TEGVTGWNj9rV7K3bVeIeMiFKbFO1ivMnMqHPVh
	5xobVtwKE4fpJJfOs4VBWoSNDFZ49KKt8RHG9OfjjCz3o/ypiU32DtPzaRK0iILx8M5dKwlBLm0
	YqhoHZtQgvOp/Tyrr6/nbRbl8D+0Lwl2h7v0yeVEhU16C2t9UFEi477OH8mfVkeXnh0zxcF/Chl
	eX
X-Received: by 2002:a05:6a00:8d94:b0:81f:995d:6cb with SMTP id d2e1a72fcca58-823412d9289mr3296078b3a.36.1769413733963;
        Sun, 25 Jan 2026 23:48:53 -0800 (PST)
X-Received: by 2002:a05:6a00:8d94:b0:81f:995d:6cb with SMTP id d2e1a72fcca58-823412d9289mr3296055b3a.36.1769413733496;
        Sun, 25 Jan 2026 23:48:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:56 +0800
Subject: [PATCH v11 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-4-c0af66ba15cf@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=4412;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fYWi6it3rCCr65Id+LeC8mkX1SDe4sDJPpCZSTfEuGI=;
 b=UJnXSFL79huFwDQeeINc5HmqIQvIG4Wua9f5RXCBnj2KI8WFg7dFFU3bzJbZunIagSjnxh6Bo
 WobJdmWoxbXDUSqzioewnFE2oO4k9VVDYNQElrobh6S6ekOCGvUzSVu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX11E9hfQQ/R96
 tMggiXtHXYP/CiPNtHlhZTtW6YROR5tlGLr+dTNy2Gim8a+baJumfhRMiFIe88xA3s++4ye0cIC
 w2CAwc4yGFFGtPM6ocdc522z/TQQbqrvkNDsigmROTcIPEdGsu3SGdpqncNtlfk+a9cnwsTpwfD
 xj1dSP8ldy2Pmkryfk4p2I5Rab/jh4WWOzgZYC5BVsY5F6aB+lKsx8mHWq+5hkRfCTTvEvSbMx1
 7M2ktpKUzpYBBwiI/pfq91Mp/ImTVhBTh+k4M+GdirlE3YXuFzOUMF/94sYFSjzlKQNY7zxnlTV
 jv8zGO5WYHX+kb4RveqqrSwLqTjNxJWUY/gx5Q1TfzoYfdwXZcs83QiPyHYxlF8AKRrjbv+DAJN
 Jm8cnNQjlDphlVFApwhWDU+0XYWLpxGb87yQmTSdKC7paLfZUORrbPW4bWiXcDptnGb8f4PcOE5
 AtYOr4KZBk3AodDZP+A==
X-Proofpoint-ORIG-GUID: lOf4lSu8HGPiwBwp090bmf0QOkUQP4II
X-Proofpoint-GUID: lOf4lSu8HGPiwBwp090bmf0QOkUQP4II
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69771c67 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-ozbsww5GKt6_lkPIaMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-90488-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C82D6852CE
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
index c780f6d5dede..e573503f2edf 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -469,7 +469,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
 }
 
-struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+						   enum coresight_dev_subtype_helper subtype);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


