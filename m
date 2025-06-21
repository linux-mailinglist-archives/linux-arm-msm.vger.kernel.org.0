Return-Path: <linux-arm-msm+bounces-61957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03FBAE2C10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 21:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A03D67A5FE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 19:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303AB277013;
	Sat, 21 Jun 2025 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhLM9JwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94817276045
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535789; cv=none; b=ZYhzTnyifnA8VIzMp0MM0ow6Jm66vKWG8K2iV1f8RY3q0z4dUdMwpKPJzHWCCmnAU0S5rZNIG8z3VUrWfLrwG6YktvJWKmbGVtARXatg28xH+cc0O2Xu2chHPSB1ZPZMMEgwZFvpR3dLwscahKNqKwlNs61bPM6S0YLzvVRRwY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535789; c=relaxed/simple;
	bh=weSsLLbXmweIsEysxpMRpS7St0Z74YJTWedM4TDgow4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAv7gePb1hnx7JoRJgjTOi4jhcvlQhSPwkGms/cwkboMQ6uqkPriUW6yS3+jN23/mcitaVyI8Z7zfMEIw7vS5wMpRtTVyCKFQQZQWsLJS6zgtKEBWT1fQPT5n0E1TZs0SzNhV0ei5zkZK8zgB55/jYY775lrslmvY1yBULjZeko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhLM9JwE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LJJDB3012678
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FXtvYm/oA+Ibq5DjGlmUKY9aOduwgKSXY/MyPkbtto=; b=GhLM9JwE4oaEY3eS
	30kk5JvggYqjwHaAIXQnuBivP7tJd6Q7UiJw4vqSinzjd8i15CGuq/NaZ/vxSjgV
	hioNBM2wDyizUo3393eFmAuW0HjWG1vDwEge0qj/pHFzPjbHZj8TGw/hFL6lbRvj
	E+0kSesbvHA/8tMc9SQvJRKQOpJNooFPxP0nF/AiZIKNy7E0C8yV+TXfwkoLZpcL
	kkzt39nMRzoPqEX4svb/PtleXDDcBEI6ShXR3L5wY6KTf59bykbsEQmmfxbiJsEe
	Ux+mI89CjQZTnr0CXfHZtCEup8f/EbGKP87QUIXCdATSkOSXjSMOiP5+Rc7KKdrk
	drRBmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e1qgr3g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f71813so412397285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 12:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535785; x=1751140585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FXtvYm/oA+Ibq5DjGlmUKY9aOduwgKSXY/MyPkbtto=;
        b=tT6Rck/K8PNCtmm8viePadj9+4vrONeySmubWi+JE9gt2ylU6JHQiwql75eukQmKVP
         0rGXU0D5ByCo6KCD04c+oci0Iki6u4NatcFhJhDLWCaDNEuDVmhnIZmuzhXClHHtfQlV
         4+p8kmV3ulBOd1JkazJGxsbec8jWppbiL3w1NSInZjgpQ/lq6q90Tw4Smxib66eqRdU8
         5rgRutFexAfsf233zt4XXwi9KryE6hZpMze0dNDbPw70jUTKL6KDSwKGtOT1U7n2wbev
         meuvFzqebdn2oBCoiYPdYH5nDj+TDgJiVgtNGaMURjD2H4bzE8ndgDz5QIn7wvhE8tDX
         QCGg==
X-Gm-Message-State: AOJu0YzrOsMisiUDTVgSAfjQlLArwxMW78Z8z1JN+J9UNnBoHymUxvxl
	cOnPN8GEoUsSL/Gbc62KuCWPz9QKZmqgOqgasnjz0Y69wHl9N3qkHFfYSUOjCOycy264zH3ipSB
	3yWtFSW3QgfZbBxyt+2ijQQG1qvTANtXGUxt5M5s684n4skyLpRRiGS2VrsNRoZKkfCzS
X-Gm-Gg: ASbGncuUqjJgeYpsJNDurR4bGHmC5Op2USgSKe/H3/SQAA25Z7E4Wknq4SQtwfnI8Kw
	r7+uas90sFrstBcT6oNAsymzL45/Qe+P+Kb0UiC0J4dmYdOEE7PWe/P7G5LCIJ96d4r+w+rVCDr
	gUgLw2OW6Ih8tQUf+UMWthC9o7YAir3pIbf0fbuBgkW/T0yS1ZJsd4OOPGcTXS/Jv8OxsGV0Ruj
	AvcgC2F4kJkg69ghiD+VrsdYNMarQz3KySzrjrDoIGJ1k6WMLyXhTwRGSQLe8V8dNrfZF2tBWdL
	G8Q4nrCjk3NbUvDUqNqnvwM1EzRwQJRQlXpX9vAkpUAZ0g7WpTOTbNGR6KrJtpmL4DvWJWtMJZ6
	l1CzjqmRqGiW7aLZdV/RPptEZ3b0Q8Abted8=
X-Received: by 2002:a05:620a:4094:b0:7d0:9d42:732b with SMTP id af79cd13be357-7d3f98d8cbdmr1074126485a.20.1750535785401;
        Sat, 21 Jun 2025 12:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEphDP4IOn/xKx05euM3/unH/TYC++bj6aRlmPjOgRxXWSiKB2HZrEbxSLCpf8wSoJb5xsTjQ==
X-Received: by 2002:a05:620a:4094:b0:7d0:9d42:732b with SMTP id af79cd13be357-7d3f98d8cbdmr1074123885a.20.1750535784932;
        Sat, 21 Jun 2025 12:56:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:12 +0300
Subject: [PATCH v2 3/4] firmware: qcom: enable QSEECOM on Lenovo Yoga C630
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-3-6e8f635640c5@oss.qualcomm.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=weSsLLbXmweIsEysxpMRpS7St0Z74YJTWedM4TDgow4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Y4X6J8WHnl5LgZrvWzOJ30bbtuGZwy4WMxE1mgF5Hcn
 law3r2T0ZiFgZGLQVZMkcWnoGVqzKbksA87ptbDDGJlApnCwMUpABPZbc3+z/Q262u/aoYz4ptV
 JFt0djNd2rKbwSLpwQR2r1DO3yf63T5ePcDlls46VcuWaw9jeuSmw11N79Vy7d7ktYt8O/dcdN4
 2kY1mNgqXAvlm/TzyIvGsUHb+z5TFzLyvd/fzJz4xvlcQpmLRN8/HYK2b2mF5zm2ZLKnM05b8mm
 xxf5rwPK9Zlxtabfg/2howqG44LR18am+NXeehTfqXbkWeT3FwSrofXyyS5zL9g+YR/uVdCz5N1
 Qt1837vpNLnGqsu6ZBSV/t0YYRL2I7ImRteMvRJhybWfwhbNf/43kTnczLxVW5LgjJcYjc+0v7N
 dqlgn6HkTyUZcY4wn7aNu1Q6zsud+2359O3TiKmBqocA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZOA0WjT-2lqxT4ePew4074eTUbYbtSKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNyBTYWx0ZWRfX52nWthB1XlEy
 F/QW/+wAENWIdBfWASNlHlnd2nbHlfYYZI7pGbo1RadbpyoHHogFbWoF7sX75ENfo5ZiVnj5XvH
 Csng8fdSqu5euOx11b4NgoWov2ItcEn/8j4gasFmffmwSiUWs4SKQWXe+Z2L5c57pA45gB7haMp
 BSWKTn7YBK56dg/EgInB114CcCRh0Lk1ChRdZUMd3/kqoq5uLbePuVCcgHWN/MGC1/zADtl4bwa
 TMXiDfUGQEK1Waly6DerZRCQaHOi1cp+5FM5WpzkcpUvnodfzkwlOrCGkvVRKxlthHJcfn7hIw2
 AP1hYUUL05tpWSTbM844sAneIk3n2VB8uA7qZE1XN4lYKUR5TA3yqZ6ByNHtH34tHnpVRqDFooC
 mMvlLTiyAq4Mg42YYGt8icWCOgtWEtHabYgoIB9cMFz+zh6NbTYgQKLN3OXugxpTLu/oh9Hq
X-Authority-Analysis: v=2.4 cv=UetRSLSN c=1 sm=1 tr=0 ts=68570e6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WOWBbpsv7UBti09GJWYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZOA0WjT-2lqxT4ePew4074eTUbYbtSKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210127

QSEECOM driver end UEFI vars access works on the Lenovo Yoga C630. This
platform has only one storage (UFS) shared between Linux and SecureOS
world, uefisecapp can not update variables directly. It requires some
additional steps in order to update variables, which are not yet reverse
engineered.

Enable the QSEECOM device on that laptop and set up a quirk, making UEFI
vars read-only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fa7a3c4c8f006599dbf6deec0a060e1158c91586..3b1fbdbe79cdfe9dbb1a4ff5afae53b469441ed5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/firmware/qcom/qcom_qseecom.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/init.h>
@@ -1980,6 +1981,8 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
+static unsigned long qcom_qseecom_ro_uefi = QCOM_QSEECOM_QUIRK_RO_UEFIVARS;
+
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
  + any potential issues with this, only allow validated machines for now.
@@ -1995,6 +1998,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "lenovo,yoga-c630", .data = &qcom_qseecom_ro_uefi, },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,blackrock" },

-- 
2.39.5


