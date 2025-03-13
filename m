Return-Path: <linux-arm-msm+bounces-51319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B2A60358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 22:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CE9E168B5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 21:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5FA126C1E;
	Thu, 13 Mar 2025 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy9mTsMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6739D1F4C8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741900903; cv=none; b=e5g8TPm3EEUPeiZ9qXqPgfnv/S+T3w01FmFC5KIuguP8ya9ITfCpa24kboJUPLLsPBLWNd+AIWDO+n4cK9f2VqMpxTB8esojEARHAYVYsMe9CVJV5iFO/MuFkzLm1meSWJeG0Eoz5TdmSwyHGmcU1jF3FA6KZafNqRLtjUDq+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741900903; c=relaxed/simple;
	bh=bxwRGhp1n0pI0/lcXsC1uFENkA1yhmJSWsvPZhEto9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XpHXxtK6IXd+BT03DyGJzCZcpTekKOsdU9lLCLCwsK65qS0l95mzfkkUyk/YHOsnmRw18ZohJArmuL8/4Gmuq3bwRX4nC3iJEvYbAewzgHF/9XfC96lic6nZSnd4PY/J7oVhHVa7JhBc4JF8Z2IbB/MRPXvJV94V6eoATNY+ztw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy9mTsMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKDuuG029014
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 21:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sc2tdTqGtA5fEOw5t3e1Qi
	cFcw5LIwEMfE0xdIoaMts=; b=Hy9mTsMI0ApadFr/gtOT8wGCpEQspH9O1Phqqk
	R6DlGp9a0t1vudbh2u9TlItieYDKOVY1YWuGm1dC6MItWi/CBIn6AogLvnjUlIl7
	5G0sZRtLVUKA6aSx1cjMN8oHVzOnAwShyHJQM7b7fChSKPXjxLpopukMDkbnx7Aj
	PB+DW2SuXtmGTD8MjstFbLOQQipOJbAxWIaWzz0+IlRApBGd4ajzk8xx/qObiWWT
	sLXp9o5ESfJ0okaswAtw4wNLtW2i6b367kAH9vwLW2q/k1/afUj6C/TnOTR2aRTm
	p+70npb03WJtt912BCAWb99L0BePBrMa/i216FczDmreOGwg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67304h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 21:21:40 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72a4454246eso496920a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741900899; x=1742505699;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sc2tdTqGtA5fEOw5t3e1QicFcw5LIwEMfE0xdIoaMts=;
        b=c3lt6GovPkIGu+AZU+gJEcR0KZghOQNROYuwGBK2Fh4KoSwRCNiiFzF6M91HtrYjBS
         xr1DDSKtcd0mV+v60rVYB5AaEAASXpnvn2A4g9cOX+Io4p/wxZzU2x9bk/6VG8d4llDo
         ULQ2hsNB9S+xIoyuaXyBZwFKlNuXwYCuv3sdE3lLbJzub02TyL6oKQh/cUNlrtxBCtvC
         TgZr/UBfygygUVcGZY649XndbxTElIOqL78bYslqmc/P6RFeOgkhqF7U96Rvcky6cC5y
         KUchtigNeef69hMvH5cKidQyHQyCvF9to6pBhVjGSDy0W3yjZqheB3dQIJnmLqw96ojz
         Wl7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSLXOn+j3v+Z9q8zFMLSrAJMELb6hTBaNrrteE/AEasOq8uLzyqhvRi+mgQBEAjgXtem5BNYy3zk/N+ezt@vger.kernel.org
X-Gm-Message-State: AOJu0Yygy7/ulF8W8xZuwxRien7PKiXY5z9jNptJmI6kEY6YmaaRcoGJ
	Q6WFk5CjujEYqSRWsbvhh/KXc0N+YMAwfZwrwHJGnWqXQaMJfuN8ybbF+ykSs4Uxxmarxl9mjP4
	sji/v0vX1JzQIa+SiswTwrI+0yJq8UPHWjyst+T0Hicz8efztteMHNqTP/A698/IN
X-Gm-Gg: ASbGncs+xZOVnA8Fo9o2UAI6/1kWSd4Os/jN1GYqKFwy+DFTcw8JfRLLujngQjKhEKZ
	Xt8emk6S16tr2KXuTggb+9zOMffI9y9cPrU4QUhaTe98EWMILFZEjZIbW1rDuw7O8weEhD87uQu
	Ckle3ktBTR4VQsQOyXP8+hyd9DioH1/oOcUX+FOoXI5WYEAvr5SnWQuOftbPImlYg1GoX70WmK5
	zE1GJyPw5pcBXtx3bITvmvOrAzMvioDhMhIHKngpzrmlXSJ+Z/2A1CVPqDwIPXYTzSoLeNxIL/J
	8bSyzU48QB/Ut6oRl3qjBNa6DO1KaxogO9zwaS3sdmis7RSGxi4eH6QJUeKQgWMXdXlB4FyyzYb
	18Fmf2smrtbZMIQY=
X-Received: by 2002:a05:6830:4905:b0:72a:1625:ef11 with SMTP id 46e09a7af769-72b9b593d8cmr7658939a34.27.1741900899379;
        Thu, 13 Mar 2025 14:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSJfSSomTC3SCdbcrgeOpL44R+cUJ/sgfFjrWaSF6qXtM2EgPsMKfh4s/9jEulvEPGOITeDg==
X-Received: by 2002:a05:6830:4905:b0:72a:1625:ef11 with SMTP id 46e09a7af769-72b9b593d8cmr7658927a34.27.1741900899001;
        Thu, 13 Mar 2025 14:21:39 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c670f86a17sm478881fac.6.2025.03.13.14.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:21:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 14:27:27 -0700
Subject: [PATCH] pinctrl: qcom: tlmm-test: Validate irq_enable delivers
 edge irqs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-tlmm-test-disabled-irq-delivered-v1-1-f0be903732ac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL5N02cC/x3NQQ6CMBBG4auQWTtJCxKUqxgXrf2VSQroTENMC
 He3cflt3tvJoAKjsdlJsYnJulT4U0OPKSwvsKRqal3bu853XPI8c4EVTmIhZiQW/XBClg1aFdz
 QX6L353gF1cxb8ZTvf3G7H8cPwud4nnIAAAA=
X-Change-ID: 20250313-tlmm-test-disabled-irq-delivered-a0758b114b9e
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=bxwRGhp1n0pI0/lcXsC1uFENkA1yhmJSWsvPZhEto9M=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn003G2C9slR48Upk3nATcOyK7ugL3Dasv72Zrc
 Ggcd/i3JqKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9NNxhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVLTA/8CBpkKNPjbvMqFrVl/S2Oogv2nA49C9YOM9prNGh
 dhu9KoK73LDA7Oxn7nAGNigeEgvbpYq0wkT4c4ZYn+kF0zDiw+NwzNL7vXJOGk9YfFNdz+Z1ceo
 Klicq4sQM+yo2tOrThul7pxbNOITiRg9dUeA6vJDZr44nf3+Ej82x1EFSKGDJLEgfOGbeE0gL9L
 ClZhez2hmFXWrUWOPQzt0+vKOF3+B2yhgYswaeOogtT7b8LoWPff8mRrpWvaUH0Nw2tgwUCI+Cd
 4che8RE60va7HiY41JWhn2uUzkICEqqNyHvhLWmPcp1ba3Ur0u6XDLdL1OTW2R1/IYL9QM3/qEI
 4nN8JlVdBwfJHYUVylQL+3Jclx1F1ECBKKTX6Ur361ojmLJQkQUWzglrLHS7QJz62Lv+H94T486
 8ymFVLKrIJaM6ttQ054D96IL+S219QoIZ4D2+t91yPQj/PHe8bRl2wpceOggjpiOmzTxu31/7rd
 oMIZ+twN7dbC5JvcNXt9TKf+6Fo4ZSvFhyF0qq5m9+A1tGtvgMmIRwVNxYR8ZeyAY6Vs+a5duh2
 Zf5bnVC8XYYomIOKJUeLv818BH2Sf1Zif5fpz7V0VSGhCzbKuAEVCnMcsyltIPg7+9pueBV/wMP
 pezNPdwuPWymGDtyL00dbTTfrtVXiUMlYMjJclTxOSCY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d34c64 cx=c_pps a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=qPeax27BKI-lfaCsB2gA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: _NCrs7zB0BRLX5SOcd1YAYznBfUxStiz
X-Proofpoint-ORIG-GUID: _NCrs7zB0BRLX5SOcd1YAYznBfUxStiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130164

In commit 'cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts
when enabling")' Doug establishes an expectation that edge interrupts
occurring while an interrupt is disabled should be delivered once the
interrupt is enabled again.

Implement a test to validate that this is the case.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 9c31798b3c08b59ba9a77454a297ac6630cf829f..fd02bf3a76cbccd290735f77f19dfb26730be679 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -506,6 +506,42 @@ static void tlmm_test_thread_falling_in_handler(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
 }
 
+/*
+ * Validate that edge interrupts occurring while irq is disabled is delivered
+ * once the interrupt is reenabled.
+ */
+static void tlmm_test_rising_while_disabled(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	unsigned int after_edge;
+	unsigned int before_edge;
+
+	priv->intr_op = TLMM_TEST_COUNT;
+	atomic_set(&priv->thread_op_remain, 10);
+
+	tlmm_output_low();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_RISING);
+	msleep(20);
+
+	disable_irq(tlmm_suite.irq);
+	before_edge = atomic_read(&priv->intr_count);
+
+	tlmm_output_high();
+	msleep(20);
+	after_edge = atomic_read(&priv->intr_count);
+
+	msleep(20);
+	enable_irq(tlmm_suite.irq);
+	msleep(20);
+
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, before_edge, 0);
+	KUNIT_ASSERT_EQ(test, after_edge, 0);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 1);
+}
+
 static int tlmm_test_init(struct kunit *test)
 {
 	struct tlmm_test_priv *priv;
@@ -609,6 +645,7 @@ static struct kunit_case tlmm_test_cases[] = {
 	KUNIT_CASE(tlmm_test_thread_low),
 	KUNIT_CASE(tlmm_test_thread_rising_in_handler),
 	KUNIT_CASE(tlmm_test_thread_falling_in_handler),
+	KUNIT_CASE(tlmm_test_rising_while_disabled),
 	{}
 };
 

---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-tlmm-test-disabled-irq-delivered-a0758b114b9e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


