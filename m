Return-Path: <linux-arm-msm+bounces-60463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCEAD0018
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCF4D188C93A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E265286408;
	Fri,  6 Jun 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKGLe6jE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470F2857FA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204594; cv=none; b=Df4oD0+nN2OsFR1JZZL7IAEf4p7BuMRKg9G36QmcXRkOEHG8cdC/3q2dHBv6ixExkfV0UcUcI6GlUvcXnNwttq8zmjSxEPzz8dwHm3ft64C2GqMRXgK3d+i9JVk7pS5zKy5QYgQZG6rHoqjpSGNLMERI1IVnNV7LIR5zZzBs5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204594; c=relaxed/simple;
	bh=LpL31W6AKDCpdo/fRCicU1F0HGSNhPmft1JV8Pa5bLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sUWZqcYgzmHWcPcRPLlLn8hOArjUBrYxhXYXY70XpWW6tTUOm6Bq37I5unqwH81efBRIRTX67fDtW1CHT/ZqJ5lo01LEdjGyk2E+a2rFbYdBm2Fi1dc1Q3am7q0J4scq7KffXfUM+iSh0N9lhEJT1irxDKoteRz6ntbDG6ejR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKGLe6jE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5561CCw0013895
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 10:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Rull5WUa5O/co7lCOuxKulj8U2Z6zdeHoH
	V9/g0S9I=; b=AKGLe6jEmO+oDiPNCgLtN/CuAN6XN+v1tEqUqlW4/pGOCi7POa6
	ILJ8a4+a36YxnCcp3T7ymkdEfvHdsphU5CNX4pNezkyYD7/aZJQal+2DhWPh8JMO
	Mr/AxO9Sfq0qferAyJW4M6cBNPWvk6a0q2V0oBE/C+qiOHWlESmW1qaZmbuzxNlp
	VIBYRRlyaLoymBzBgMtkKegF0MlUM8+7ourNSudo9QcHUyupWm7AFK+18iz8DxgB
	vTs4w1CjPnx5VrA9OGDFtRmt/7JYJPTtNFS6o4/MrVSdqcS/HJunrMaOfrg6Q+fb
	VtOn4Nev4Ub2PBSdqHFHGDlVd1ve3gLjBpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv35jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 10:09:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso306942385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 03:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204590; x=1749809390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Rull5WUa5O/co7lCOuxKulj8U2Z6zdeHoHV9/g0S9I=;
        b=rtA5Bcj28Z4ywKtnftLDTJ1euEKzd/c5FEqDZXpAB8gQJea9EdVrVJ3aT/oLrUsG2F
         FtS5IYiJr6jihINoyAkxB8uKGz1EaDy4sci1h03/e2CkehGDcqgRMUuVZyZQCUB252C2
         /PjtC9dZq3K/LHVhxx9jMyZrHTz8UpOf1s1pdEqfHR43eNEcTukVHW3lnsU4LHRHunsE
         F2nvvzuF2GxPPLYsCf0Y4PtT/4laMKwal93gbN9Kxo0ccyfcpeRks+g55kxELfzUW+E8
         jW6j510HCvl0lZxWAegGTXtvdPNAZAwrvUrk/io02jfHjZQD2i2juDoUfWl/UyFuU5B1
         etow==
X-Forwarded-Encrypted: i=1; AJvYcCWSvozb5PiGIpytmiBuqNCqPSqJMocC1wZsHEygHNWYZ+HxyV0CKnO6d6U3Q1sKMYr5f0vZz8eqeATzpBso@vger.kernel.org
X-Gm-Message-State: AOJu0YwQm+Qit5WP+6Bfe1q20mBdovNmPKn9kLKIpcQ+qhn/94gf/YM2
	elhrw8LH7eS0KDBTXIRVCagW4bWREabpAmsN0TxTeri+R/uioIVLqF8/mafcYjnWD7SJROfrl5i
	pIjS3VCgR/2n9EDeq1BTBeWwXiZGE9jtEaLt/Z9SahlNyOftQDuNIvrVkB0nvG/wHphnW
X-Gm-Gg: ASbGncs4C0iI1/e7ElsF2Ohq3NCfaH3X4jT2DIdclq9d6YjWGtovCp+1s2rQS0h4pEe
	2PBXn1dM16kVdy9G/ecvN5PkwKnx7WWrUVrMsh2FBpQDP4S7cXw9765m+dzPQQp48icRBLLkzHR
	8eMXHXbeILdg2OajRxzMOETIxV+SW8cs01AhhYxWXsVWHTnnsDFk69PxcaOAcmkweSK58Xtmc7U
	OJA9p01P9Gj6BqfWUpQPbCgpSGwRmE2pelaQmClkFXHQFBanzAb0REr9bzdF8na8b7waBtRHC8V
	bxj3ADudZMIDc9narstG4J7PPxx1YoRm3l+UNmE5ScTLugVqG7wbpfxxkKAL4aSRoA==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4adb:782a with SMTP id af79cd13be357-7d229851bb9mr483085585a.9.1749204590315;
        Fri, 06 Jun 2025 03:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENkAzJPgUxlRrOfxnaDBFgN+TY7Ep3pNndFgZuX9TRNL3Vyzjg5cluQwW3LY0RCEI363Xj0w==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4adb:782a with SMTP id af79cd13be357-7d229851bb9mr483076885a.9.1749204589288;
        Fri, 06 Jun 2025 03:09:49 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464581sm1415418f8f.95.2025.06.06.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:09:48 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 12:09:44 +0200
Message-Id: <20250606100944.4104715-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6842be6f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4rlHZoThpNXEEVWAyUMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: pKcUWcypqm08B7VNHSJ_sGnv1aKE3YQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfX9jbLoWeLO5yM
 8rUQDU6Jb10bjT8QbtUUlTNla+VjpuUl32njdFWaBexBOAstd6QI1NwJ78JtoGF9BUljjsH5di7
 D3OzW4aDobZ0Hs3cn9J9eLHCznUK0Juuk4/vBWtO+XisW4yxy0Sk/uBrNMqNaErnrQTKZ+zhFL+
 ztpqa3fLguWnCylusjiZvXTiP14U3JWcpz6KPhvyxtxVL5gXNVWEbe0xWOZfcDuw6t9d3TlzD0u
 5juRaI5Sv5SqM6ymXwhTIOJjWceo4tPu5jieClwThFxdKEExf38y8ccQwpC43sDqXahXiZtX8VI
 F79LRPaxFCO8FPx3jcBkNd+NV/2Qzsnv6cDtpL9JiBLDwkFgVEqxwgWsrXXWDIWaImzcD1OzZTP
 r0YpVryzxihOhKEjLLuuXJRcwUBEL7kxUVQvz0KiPSAMFZyXEO9DG/98IqqenYEmAGcsrmG/
X-Proofpoint-GUID: pKcUWcypqm08B7VNHSJ_sGnv1aKE3YQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=984 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060093

From: Jorge Ramirez-Ortiz <jorge@foundries.io>

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during sytem boot on Rb3Gen2.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 77d48578ecd2..04641a7dcc98 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"venus", core);
 	if (ret)
 		goto err_core_put;
 
-- 
2.34.1


