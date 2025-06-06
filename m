Return-Path: <linux-arm-msm+bounces-60488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B6AD0523
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3F3E1883C04
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 15:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF8228540B;
	Fri,  6 Jun 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdwYGjCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55061A2C25
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749223530; cv=none; b=QRnlrJfgmNugbCpixxgAtRynqt2SmHbMIIjVHotUp7i4/g1wfsykNGWKtovA6TwEhRxirgztF4QmqLciS/gKljw2a8LFchIq5V4c/7ngFyLS9NbVT210IOTvkoVRqOPfZu/FUuDCpEGVKtImKx9Nh4tgszPi3VKYLuRHhlFgOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749223530; c=relaxed/simple;
	bh=HC6LsIuSjJdJIiJFfJoG+7VCrWOecIYvMQ4VvDDwg8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VJwAOtCGq1HtpSIpARnC0tkgKKTqXDmCgiD8GVdv+YY6tzt5k3wHKF2Fb2MSbBaDK1SRby+j6Ayx6HtooeZoj3sV4mdXZO/Pp9zNgytjety9Rg0CEObiJNtIyilprrQVgE5Lr3ew1e/3CKGpIZN6mz7XCfRcc/sWdrXtb1xOENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdwYGjCF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9EAX017978
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 15:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QMrk3eQZuTJ6Bbd8ZWvEu0BI3B7FJkAMmmB
	mL0sh1sA=; b=bdwYGjCFEG7vaEpcIiuCiiXREzZTyhBYBqo0YNGVj/OFHAG3dWy
	k26BWitZglZYM6Sw/ImDKvlujGPtvpmQcV7XdtkYH6hilKOtf2TDyEVH6x3uDsxN
	wFGqhCqjI163CeZaFwnnrA0Nq4ppV/FT+TVEq3qc2UdtyOsR+ckRyUuQYsrOyELD
	LAmeNq3TvRGLDXoHF9n9wZtDTnPORczrhFh/19xzmZoIB9s8xLmQG94Y0COFNz/N
	ljW4kgnaGoEUgeAcHNVenfY6D1eTDAnn9OpZhPlqBHFMPEeK8uQbAvKRj8D7Rw67
	dSH/oqxKPaZkbrQBaHJGNTne7iR9ct+QLgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qd2y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 15:25:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d099c1779dso391325285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749223527; x=1749828327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMrk3eQZuTJ6Bbd8ZWvEu0BI3B7FJkAMmmBmL0sh1sA=;
        b=Tqi9zX9Xf2HQ+JrhdBNwYRVfW56t2D8wcbHRwUBAgI+jWGPcKVZJtNlTAbFlHwQcjS
         UO1fBPgwW6+9SUOy1xuoefpRK0YWT4J6i7d/8z5QLks8PUW4DOZLjQkKdMUAwY+TyK3S
         V/NlUdnUmOvmLnoYPzpCEM1jKnsBVvTRTVCHO7qO+82It+3LwrJ/qX+dx8cD2wSLkNYl
         FpmgltxDJu/yWkPOcybwcPSY4WVOUFeTfBxQfHJWxlsgdMXcDCUgSybijPE1YZ7/iRJi
         MORJ7NeBNQRfIzOiqjlzWBPCUzRKXCdPDXzW/FWI+4kgweuAsNGuv0ONQqsudAAcpSy3
         WXUA==
X-Forwarded-Encrypted: i=1; AJvYcCV1iq/RrdQKo0M9l1H7mK50LtJ2CM1rQeVbSNR8EgdLgrmAj/DVdyt/hTI4b3AbGsrYmaUZxBj0rPIG+Mq3@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMg1eCyEuVzYDaFYFK2xP9WOddHX1XE3UyYZ7GWfTsOUTVEPe
	Qi72VLa5GWVbVMLnjEtl0n/WAw5C/nrMS9rLTJAWbf1oqmOCOaHmx2VLqRFNxAkyHYNuSkXsAI2
	nlRh8RPWEpRtRMITb7eY9rINAWWZeQ4Yfv7M+QqJiIZ55wx+NbpfwcNICffewOaXrHgUW
X-Gm-Gg: ASbGncswAoXhGE5DK7m9wWzbdoQMCmTXpkCB8EY2i6zfwzIZ5S/++hiW48Uvq3mmJfb
	VxtRg0DkWpNXa+8uxJFlRhQZFAyMjFpA4r4VGD5j4DA9xGxsqt/3lIqmkop20HtRXJpi4s8WLcz
	fcmPuIrFhVosg8h2DF5r7ZBN2zDnCNwlAjTITGqlp5OLZQgAD+OXACZhSl1o6DSKd6zWw6SQfDe
	QIxK+DifA3rlV9M8W98FP+lLeUJlm7J57L+M+vHx16AqTxpcv5m4AYSDMxyq8qecRYLyAGZy3F4
	Vrmau3+B7rhw0hOXnt/NrPe7vROKayHFJbrCc8l/4KKb/vAjMXQ3JP32Ms33dwDVnAQ4VWxronC
	8
X-Received: by 2002:a05:620a:4487:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d22987d994mr658447285a.7.1749223526803;
        Fri, 06 Jun 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7SY5w0YSLHb0XHZ+BNK1tvP4sA95RKfBWut3ciF+YIVDSFV5SVbZ2+XhvLmzE/7rcFXto9Q==
X-Received: by 2002:a05:620a:4487:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d22987d994mr658444185a.7.1749223526437;
        Fri, 06 Jun 2025 08:25:26 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm27575945e9.22.2025.06.06.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:25:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv3] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 17:25:22 +0200
Message-Id: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4DqF7esK_VVRAPoAwLiZ9GM9wYttc8au
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNSBTYWx0ZWRfXyeNVRAsMe/lj
 0CYRl4MyGYJfGGw1fQSDM+ebTZelvtCRw3C/XJr0FfbOvSYcsQY4mDMVJRdZ9bshsl1GuHBOznM
 /VsKrbOsq2vL/VGOiHMfEr8WpiRbpN8CD1ALt8evDfpJfwQOs/2emi7eL+p2+dAL8ReuFA78O5s
 xEIB0NkAb/QrInnb6Go2WBcuR7uIa4ZbTNOmTR7k+eS+FlO2BUZRUKJV3ViiczD8inoorAQ5oOZ
 mdbscxPo6xLgVqj6kGoXhRcAX5ukLLrXEhM4q5Z9q1txGUCB3YqZugtH5Y72qqc2xdzy60WfqFz
 BIlRPY1AKBW6M8ihvOhiTjMYjomxWozqgH9mhu73S9aU94vssnB+LWAsb42+fg2+fcixpoN6fLV
 MtBUVYu7xPJSGgLSaljKNT44+QDeGLBa+cIQGBUGH/njCNF6kuGxk+HoFqLHBPn7jSEuFP35
X-Proofpoint-ORIG-GUID: 4DqF7esK_VVRAPoAwLiZ9GM9wYttc8au
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68430867 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ixoX2jXuh38yZQZJg40A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=909 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060135

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during system boot on Rb3Gen2.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v3:
    Added Fixes tag
 v2:
    Fix authorship
    Fix spelling mistake
 
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152..5bd99d0aafe4 100644
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


