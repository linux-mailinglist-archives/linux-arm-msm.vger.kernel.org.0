Return-Path: <linux-arm-msm+bounces-62130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD69AE59A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEFD818993C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B7122FF22;
	Tue, 24 Jun 2025 02:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+OJCMA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF67C22B8D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731253; cv=none; b=XmATRMzYj/3MeCbCz+daws5VfOibgP5hS+UJzUHYkMF27sTJdP1DbSyaS6ti1bN1PmHwYz7xg17Wspx+Dp+w6SdWBJfo0OmuqPqLpJE2nJb2gT9TGmXwFQka6fCZUk2biD+OTXkLmHJJSWnZNWnGI79MAdlgXBejBCql4uWDLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731253; c=relaxed/simple;
	bh=v3Son85QFIExU23XS9BqES7WnyoRqHF3ETTCsPhCxq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXxmHY+LYmCjrxm0C3nyB0FQ0P/UthztwgwyjUJDNzbFrgnDhbH4kSsxvOO2UtNnh/7jBNExwGOKBaFPaGtWnd9STZJOw8WAHg89SnYE+QOrnieJxWqxEcixD20TkgUKAsExRmButPlG61MuJ/rv6uoaa9gHUl2U+Dtksk+JZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+OJCMA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NH3NYx005791
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5QrZxszEjgpMGIfh5fARAtG0+hpGYQPrZxwwktP520=; b=L+OJCMA2bzzxfTu/
	T2KN4PKx4LDls5LRt0MDzBtb9r12kbNertfiuH0viP/9SRgdjA8ThK0GmsRLrAVe
	5sZMWHdatnTFxU5icLoFxIPWVOWrJB1ndZIoG3aIlo0XzdK/EWt1LC4/7HbtmBWU
	jLwvpLdAYodPVa/WQTu0SMvjVTLA2ai6Mo/RRQjsJbeEXQgaz1mIRq93oxAUnGO8
	XN/JgF5s9UGqvYwqHt2woHfxL5uK9ngs2a0hN8mfbiLymyI6caO3l9V+HpQ3yqxa
	hHPtJ9wnHfmuZecBTt/qgXBDpAx9yOqXkfERbbdlVLP9Ape4W/oiIO5/j37bUAVq
	bBfJow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgahdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso687967785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 19:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731250; x=1751336050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5QrZxszEjgpMGIfh5fARAtG0+hpGYQPrZxwwktP520=;
        b=qg9aew1U6Q3NnOTUfg7KiIBLL5cTnKOeTEibjyX+d4Q33l16dtYZr/0eS8FSjsnscF
         80an6RIt56LVZX0GyyIbeMz28kaQgsmAiL6snoMl/UVEbwNSA/qwPxAw0g7ny1Auj/9w
         vZB5RTRdWMtTSgotULF7xoV44ulj/m4H2QrGGs43aEO0BZafpONOlj7aZzH0/C2iZcjA
         syTsySMg3mATpBVNGRxe/e4DbsMB64iwt6uVPVJ5H5gOLL+rsx41AUxpIkQb8UpovMoh
         ef4TtFAbnZhj6/6FqVJg3owql4/JEbnX1RF4nJpogw7HLucKp+ivHet9aYTRm+j+O1BA
         wH4w==
X-Forwarded-Encrypted: i=1; AJvYcCVkbt9CreA4KLUVmAfrWX2azsoYWSO4v8RkyScgFZX2NchgCxyv/lg//QDOppxMlSHFMUeq/tAfW34A2xkB@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxSUUUTMDgAKHvCjg72nC8bMp12eIcPnw7glhj7N+HLdqcmKg
	hxqwNexhPbdtugxPTMmCLjMwbiSFG4OB1yerj6Se1K45Jno8Je2Re3LEaLrt0zL9G4RlzrzjEM0
	mlHdIYdPaut2Uc5uYL3OUWKpgJUU8g4lzH8YaSDHuJzoxZTUg3nRul0IDXCKcEWmhhZLm
X-Gm-Gg: ASbGncu1SZQVZs3J9uGm4tKCNytoItP3D5TO2CRmlxi2AXL+R/C+BG8P1viCysp4qO3
	9T9sdGUVWmkEWyi3NcndDucngGhNVJxtsaATXRxSZ8rlQXbXQ1SGzjmhieNFvtyuaugchswuagK
	DEij8A4Rk5P/imMYtLFQ9daqjvtWgehMKXoxkutSbsLFDQxryr3XLmy23KWRUrSrfMmgzPjvwb8
	XLucizLKtEXaXvj3G7LhLwYu2wJT307CBYaKnajrw+OraTE8/8/I8yEJ34sqDJ9AnPlPgCcBkTc
	WiXyCo07hwC1qxeJ6suL3BW2AjTk6iCl9QpuYgvnPpC7whMn5tyLtAePrrNsw1CxDn3dfbGjtYa
	q/Ly6KAk0cvljTJWDg4LXyfz3IBsHjgzAv2w=
X-Received: by 2002:a05:620a:1a86:b0:7d3:e710:1d3 with SMTP id af79cd13be357-7d3f98c3369mr2225927885a.7.1750731249954;
        Mon, 23 Jun 2025 19:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKmXoiRtPNEWmHEBmeQERxK7vDC1NSMXXW/JftGSNVpwOb7nUvzFKFHDL4r99WBj53u5KU3A==
X-Received: by 2002:a05:620a:1a86:b0:7d3:e710:1d3 with SMTP id af79cd13be357-7d3f98c3369mr2225925485a.7.1750731249530;
        Mon, 23 Jun 2025 19:14:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:55 +0300
Subject: [PATCH v3 4/8] firmware: qcom: enable QSEECOM on Lenovo Yoga C630
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-4-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v3Son85QFIExU23XS9BqES7WnyoRqHF3ETTCsPhCxq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWgnm3R9FHErq2BcU8gbUjr0GQ+28hQ1zTQF2F
 7xwmaXb9xyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFoJ5gAKCRCLPIo+Aiko
 1eKrB/94cDUgCnfyhIrD3o/4vYyVA6SWxvaGs1Y0Qpy5Nel7viljJpaPK9rV2HF0DYE/Hk5yHjP
 E6ssnHmeaqqYEN9y2L0MkmW58T5Zy2PP9V9lFhK5M1t9uHOd9JuNGgb7bK7R+5tDpiI07Vf6j3y
 qg1JZ/riJqhUQkm1m/JUo9jGbNGd0cWlpOXOyp3LLNd2g6DrAtyGjb/wtEeTyizJ33y3E0YfLYA
 v+MNANaqIwSI9pj1uANbqb9zvgUFyCS1pMrSnkxyvWD4U/JKBzHOaYVdBL4rku9ynEOL3gkBeAj
 7Fx/tf0R8J7cPqTv0qTuBwWKUaVPY4RnRJj5Pisaspm/7p1e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CHF9-HqS-n2BaBK3fJX2sk1jqvRnVz2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX1I1ULB6PkKWu
 YBJStZSieDg56ZirIXFy2QxV0pGirYLFv9PphHVj0vZTYv51ZgWLn1Dw2qTS1ICe5O7BGAWtuUX
 Ugc8coN8eOxdCBxSbR34BZXxh1Z6nwQ7JV2a9MybAJRS3K1G06caCoo9nfp0DKcOk1fVlOMAHGB
 MhBuq110unCBHwdRuOANNwItRvJOqFpPh9kZ+G0oNv3/7ULq0qdL7LhBF+T0QFiJlnmbVCV9V3e
 e8LT37Wq2SQ5Th8IfX2RxFclJItpPgp1Jpizdn0gVfSuEnxs9DFn6OyGfBNPHo3gyfHTniPJebu
 /IH3/+B0BwKKuF6bZwm7exNO9Aup/Ecg6FwzVS8ZO4v7i0o6IrycKNquxdduC0SThhZHAeSZUBo
 OH/AIlyHL8csCqn5V2GdF+3JGhyQi2bI+h1+whTEXiTaVfB0QACiW6prZ5aHcx1+dt9oiXZI
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a09f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WOWBbpsv7UBti09GJWYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CHF9-HqS-n2BaBK3fJX2sk1jqvRnVz2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240017

QSEECOM driver end UEFI vars access works on the Lenovo Yoga C630. This
platform has only one storage (UFS) shared between Linux and SecureOS
world, uefisecapp can not update variables directly. It requires some
additional steps in order to update variables, which are not yet reverse
engineered.

Enable the QSEECOM device on that laptop and set up a quirk, making UEFI
vars read-only.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc2ed02dbd30b389b5058f5cac70c184df7ca873..dbb77c3f69ddaa931e7faa73911207a83634bda1 100644
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


