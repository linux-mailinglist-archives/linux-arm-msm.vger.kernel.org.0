Return-Path: <linux-arm-msm+bounces-62248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAEAE729A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F01188D058
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A204325CC6F;
	Tue, 24 Jun 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b88fe+lX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1625B677
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805615; cv=none; b=UzK685/uSTFwZ1xn0Ytet9uNRYerYX6xe5TckeRMPGL/rg01YMeTjj2RZQWq/vC5y4cjBQQpG3vXNVMSmU2anCRlzdkbgvHH5MxO5svObQIRBdB3thjI1fTcPN0MfrM55z4ror1/5hFgaXvjBSm0RzmcZ5WVrifBHCW65f2Ephw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805615; c=relaxed/simple;
	bh=TpzKss6UqA2cLICb253kuxKt/G/KQj9NlkXx3BbhyVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6HyUyKM/g6U5KN6kzUUVga9ctmggn+3wSU/mBV/jS4riuMzr1gLGGsL2oYCkppxfnKHzDBs1K10GE+Pr0D8HR/D1m2XkXS/o70vM6BM3TomFhVdcOmiZu18ww7ZTfgLi9zJnN381yLgv7z9f/kecFDxmWuUnqnbyBBchaBxnWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b88fe+lX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGku0b021903
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q1+TTvG9KmmMqdJiHEKwEMvDzCclBDjJoltJ98B9ai0=; b=b88fe+lX1wJgTans
	u6vR+95b7xnUYDSFX8fAXT/rBgu6W5FoaA/OcW7euaanH8AyvR5qpwrdj4KTg+fL
	YiL9x7TF2k95M6pa1FtozBBqNcxYwcZjiLilTi+IjeU35yS6iISo2LHA/fsUBo2f
	tIrIep8pv5yq6Voe/XfTA0leM1opIkazOJqFvo5//m5VF9f3lftK1yx107Ffo1Xx
	ZtXmuhAa+/SiSTdOm1MYfCTVa7lHr/P9wBGeScSll+Z9YPCDQgfjvbm8pPZ7W5yH
	UODU0XDvjvZpbJK5qOKk9p/T/oct9RbFYNSpqgDqET3yaIRbWzS3Su008zFmn0NO
	hzf71Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgdus5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0aa9cdecdso470125685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805611; x=1751410411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1+TTvG9KmmMqdJiHEKwEMvDzCclBDjJoltJ98B9ai0=;
        b=qd1S3BYnqFJ2aqvgjgcDOg4kACclyKfyVk35fvnBWDwCsPjDW0L1BLkvMEHXJ/tlkq
         fbpHJUztEGkgzrBfqn/B7l62DtaBF9kWrGz/4HQB4raTSQlfVzxpU4JzFgmREVM1H3hx
         GW1Uh07TqJFTNsUHRTvtVjJTztpC3dF2KiiJ9ohasLuQrLXNApz14XzvsyDJgpVkoL3A
         x35YiPluM/ZA9jmHZt4cHP6bKGVDn4m1v5b9X6oZkw+vWQP0hCzsbuN3FBJQzOKQt1mH
         utXyyKh8HUDkhqFkhrIo/AAIGl6TMt7YTlfS90YE3h3kAzd0dqrZBBSu6Ow+/5VK8w4F
         wbHg==
X-Forwarded-Encrypted: i=1; AJvYcCWuAapN2DyAXsMHq+NovZzY1TOv/EUZ5OxKEUwidPxXPdcAOGfM+VDRrElOB5xctSGH3zyxSZUpa8HtX3tP@vger.kernel.org
X-Gm-Message-State: AOJu0YzsMwZjOFhbpN2ZAFF8FxsRV/uDh1o56GIb1wQZGkQRgbSU8wjT
	nTF/51XVLp1DKTbG6BqEEwujdFrBGijqcGtQaH53j08exOkdGh9A7p/+X1N5LdEwm6HjSIjs9w3
	3+ReaQlFM6vVY0EB7HodgYPwgtbgqTOTdXr7MFy1hcEBvolcjiX8Kd2EfKJxRsyZSG9bX
X-Gm-Gg: ASbGncu5I1IPU7/Yhc0hbUPKZQ+St2/J3YyBJdpOjojHwwczIJtWzlBM+CZsQrzSV0y
	GrTTBLOjDeq2sVbMA3B7cTaISByjeuqDFs0luzeupFK3ToqXX/ZCGNsXT+FdSUOCGSBAr9K4Mta
	KaDj2ahYy3RCyWX6gjOXA+zWBhqJoWqo83mLjjUgE1dS4j0VuiV1Q6hqzyrXzrZGgehxSJqIFY5
	RYUe2pNP9xBmn4tdQ8BE242RT5uaze0LXOsTLRFUU0uIF7Dp7s5qQx1G0tPzAmeUHwpBqWhlFY+
	NgwAYxijfGv81UqWceFiP3Qhz83DX6GvQ1jFt1VMdPrPze697exJobXBoiXmDx6EjTpqRe3qKIo
	Ta3sNitWBjOGWkBe3+mikRggdPiG0tcH6W2M=
X-Received: by 2002:a05:620a:4591:b0:7d4:bc9:de7a with SMTP id af79cd13be357-7d4297103d3mr126984185a.4.1750805611614;
        Tue, 24 Jun 2025 15:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5iqcSJE9XJE1gL9pGZTU4bZ49tSTbYK91N0UVTEUFririsFG0S0LsnEPN2FuMB1s0FTIHw==
X-Received: by 2002:a05:620a:4591:b0:7d4:bc9:de7a with SMTP id af79cd13be357-7d4297103d3mr126982085a.4.1750805611199;
        Tue, 24 Jun 2025 15:53:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:22 +0300
Subject: [PATCH v4 3/8] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-3-aacca9306cee@oss.qualcomm.com>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
In-Reply-To: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2930;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpzKss6UqA2cLICb253kuxKt/G/KQj9NlkXx3BbhyVI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxigvWyn4A+onkiU+AFmVnTp+eG/+F69fK94
 JtVCN4LCVmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYgAKCRCLPIo+Aiko
 1ZhwB/49S5NGzvatWyOAaoIdQKCjjG9EEZ6OG66sXVZht8tAHyXEhVQmxE27iZqgsflAmoTqgQW
 4KIpuExKh2ber1GsFTblUrTDPl0ZT/ICK95AHQsby0oIrKMZ5vHxnoHVTu48YtoPcc0jiywKYM+
 UZJYxaMAFAxpv+OlrbddVdJKRWpd0vkf+vrrwnWJi456aKJRpqbQM+HfXwtHNYp5dM8DwTtXMcv
 44ZUXjJlRu5tMe1sA/N2Ve2mclA6cMf4bkeJgU0Rj99Rg9NhPivnrL0PONtpck6fl+zjaK/z1Sj
 1L3L8j+hcZrmgNJ6SvfMWtwJUx01YJfOwDfj2H2ceocdZUky
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: oPbW-S1MdApJVudAZD46uD5qblx82fhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfX3Y0J65GUvil6
 YV+XNAh+vS7ibhij2CL+P3qMf94ig3sjzZhg/IaGNhb24MrOtwGvrPFtRBKdH8YyQ+57DQyCW4M
 Ectjz3cc84C0oixWDsOgTqvSpEiiCezYKtfrF2a0Q57iWcI2/x/seARw59kNwZw4Nkz6tdCOpua
 3LFG0nGXB8iZ0ov/fVLwFRTWf2ErqcFFKI3qifUviy7tuWzCsETbdy6rc/QvGlUH1iqBpOaZ3zC
 Iqj/+eJzu285o5FOtR1Llbbdgxmbm6oLlz161qd5CyhPHbeeCI9lGPHYSoBMF3uG8BS+n6ZB24i
 D7Stcptb6z9JnyAY6c/DL+JC8WgT/B5k8a5hXTiOcW11oDUgo+LFdkwWOP77hMCpW85nR6VA7np
 kjcwr/p7n9dThibAgglKDRFSVKaBEehsnye4+46JdPB5dQVZ6Jw7jOqLXyC8SVZGCvAYPks0
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685b2c6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hoImanld2GFzOgiN87EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oPbW-S1MdApJVudAZD46uD5qblx82fhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240182

For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
update variables in the permanent storage. However being able to read
the vars is still useful as it allows us to get e.g. RTC offset.

Add a quirk for QSEECOM specifying that UEFI variables for this platform
should be registered in read-only mode.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
 include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
 	return status;
 }
 
+static const struct efivar_operations qcom_efivars_ro_ops = {
+	.get_variable = qcuefi_get_variable,
+	.get_next_variable = qcuefi_get_next_variable,
+	.query_variable_info = qcuefi_query_variable_info,
+};
+
 static const struct efivar_operations qcom_efivar_ops = {
 	.get_variable = qcuefi_get_variable,
 	.set_variable = qcuefi_set_variable,
@@ -804,7 +810,9 @@ static const struct efivar_operations qcom_efivar_ops = {
 static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 				 const struct auxiliary_device_id *aux_dev_id)
 {
+	unsigned long *quirks = aux_dev->dev.platform_data;
 	struct qcom_tzmem_pool_config pool_config;
+	const struct efivar_operations *ops;
 	struct qcuefi_client *qcuefi;
 	int status;
 
@@ -829,7 +837,15 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 	if (status)
 		return status;
 
-	status = efivars_register(&qcuefi->efivars, &qcom_efivar_ops);
+	if (quirks &&
+	    *quirks & QCOM_QSEECOM_QUIRK_RO_UEFIVARS) {
+		dev_dbg(&aux_dev->dev, "R/O UEFI vars implementation\n");
+		ops = &qcom_efivars_ro_ops;
+	} else {
+		ops = &qcom_efivar_ops;
+	}
+
+	status = efivars_register(&qcuefi->efivars, ops);
 	if (status)
 		qcuefi_set_reference(NULL);
 
diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index 3387897bf36843cccd0bd933dd562390bf674b14..8d6d660e854fdb0fabbef10ab5ee6ff23ad79826 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -51,4 +51,6 @@ static inline int qcom_qseecom_app_send(struct qseecom_client *client,
 	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
 }
 
+#define QCOM_QSEECOM_QUIRK_RO_UEFIVARS		BIT(0)
+
 #endif /* __QCOM_QSEECOM_H */

-- 
2.39.5


