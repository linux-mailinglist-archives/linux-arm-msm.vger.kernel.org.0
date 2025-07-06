Return-Path: <linux-arm-msm+bounces-63849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F9AFA4B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 13:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 276277A45E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 11:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151CA1D5CD7;
	Sun,  6 Jul 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcHFTlJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E37205502
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799692; cv=none; b=cpCh1zIHwglluUSUtzW0W/2CjK2MVUj/89Ip7VDAkYzgtFwZyj8X/IrXTDxSqMj3WthoKZi1sBiZEFY2NxVlbFw6+00o9kPo2xHtlKwPu8E2CQ0r9zrzq/kaIo7hXNkF7oweQPLuzO3c6eA6wBP5kB7XSs3rMLqvksW7f1x5nWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799692; c=relaxed/simple;
	bh=Oyxx5vC4JJMIeKLgfiqO0VgbZzJrI+W4ASpsNXhvHDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NxI1Uj1GsvSbB+7/U6P0ebFQKehZZ2q9wgHIwRqpillCzdDfvVGlsiVcsw81BZEH9nfL9TQKQ0FAfkZXSRBxMEazBuI95pzmFW2SOafakyQGWwJTMrNSo/x0s9cN7Edlonh+wXbT6SDII8tidFdcOKrnzhdmxihbMbS+wtndZj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcHFTlJ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5667h2TY029922
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 11:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iBkeT8jgV8DDHWz2j7uQm7
	EkBsDsU0+qy3wFBTJJlVw=; b=CcHFTlJ2hVn1ZdHJrE633A5X6LJbJI4amfya/c
	d1En8TNq0DyqNAp/PoED0viNHBbKVCvUiXyF5R2TL0FkhdkgS3Wwpc3KxTiZWubg
	qFIyZb2TwXUgduwRQ/fDWrxkwlC5GjfSNgSRCyLtJStSbFyq0XqvTgKJPHfUx00x
	efHUxpInjFyCbN+1qefNzY+2Z201fKLJv0hU+Zdl7SjRdt1LpYqfNWkEFkW2cmkY
	NLUvNklYaAwRnspLT0rCJR0urroe0UOIrfOUuMpc01cDNEaT3bnyxLhAEgMRlOEp
	BmexJKfqgZJsDQBb2/SRDSHxEKX0mll0whMSou271AtBE5Nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd3eyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 11:01:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399070cecso400208985a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 04:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799666; x=1752404466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBkeT8jgV8DDHWz2j7uQm7EkBsDsU0+qy3wFBTJJlVw=;
        b=n+sFDCH5upGS+sDMDjxjWtX0a7Mq5VGFT99Ue61QviarRvhA8YQDU2gBDt0LW9No+p
         n47NcOIjeQcy+QGi98tv8ZNsQNw9uZz/CaqtgMJ0c5cqz7CWvNAoDCV6rwg74yTFKPYQ
         WhDKVHTVBbK6ujZpV11ekIzZ530CD76F+gTdSADOMGS/qdhKvoF7MzK4O8yCbsKe5y3R
         TS5O7DxRm8V1U53yuuD4OEaBlavI+h7McpqlResb0JzIT6rFYgyH6GXd+RE91HTYvBdM
         ba+7sEaRw6UUoY7PnoQiXCGPWV/xTYfRrMFdekBHdwEdwDpUFuG9YUuY2v2vrgGL9imJ
         smxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgX01f531JcrvvK14WZWCw4XbCyOPTnm007Cj/0tJ9WuISSOz7ayC1TepqjFwQ/sUSezLMwTUsh7bbrisl@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1FcgjZZEgYyn1lptUdW3dqeWUAiwa9ve25Wl3eT43x2FTh9P
	eeCBsKgEOBZNFeO9jozxTB8IUBCC+ttU+3t6pU1b2gKW7yQ89MuU4kStpbHyIEIkU/ohYkPOZcM
	dG3IABNRVUkW4LPprmFfMM8HzQ3OKbrWD5cAZ9ROuJq5PjYACDeVY7k0J2yFVQcehd0cP
X-Gm-Gg: ASbGncvx5l3cw+rSY0xrpk31BkYf3qKzPq1gUlr1hmYYPMW2IBvsIsuFvXMPHKALwDf
	odrsmczgIA1IXPnVjSelFTttdtYPRKplzdwo1+HgMI5nXwLWaA/clEkpItLp8Pb6jmt1TZL4IX8
	dWfqDKMWeT8j/Prrz65zTh+s5PDBPYKyPLdFSOARfGXkPf9zy4y+CBuZr7PubH8n6Z8dkb0gl9F
	r5xRF9tfkgL4RnB2ImT1scv/PvlnXhTMtogvphHs5k2KgpDKEVzBF02Aa7eX7GAS+SZRvS8ZeVy
	04HYls4pw7aiVkuqm4heVNXx+hK4LaD5hagyVhe/dguk5m1mdsxcX9ScZU/hv42PaLD8JlOTnvL
	xo32MdIeBojDOeMkPXzyhZtgOmFz4rSAXQAM=
X-Received: by 2002:a05:620a:414c:b0:7d4:56f8:76a3 with SMTP id af79cd13be357-7d5df14bb09mr1044682785a.41.1751799666282;
        Sun, 06 Jul 2025 04:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gImjD2nsMnKReqqrIWQr2EGvWEGZNMfKWWv1Nw71shiwoTzApW5p2PGgEryZvEgvDr6gSQ==
X-Received: by 2002:a05:620a:414c:b0:7d4:56f8:76a3 with SMTP id af79cd13be357-7d5df14bb09mr1044677285a.41.1751799665710;
        Sun, 06 Jul 2025 04:01:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c5217sm919138e87.229.2025.07.06.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:01:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 14:01:03 +0300
Subject: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG5XamgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMz3dKk8mTdvHwIbZxsamloaWRunGpgrATUUlCUmpZZATYuOra2FgD
 cZVdAXgAAAA==
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Oyxx5vC4JJMIeKLgfiqO0VgbZzJrI+W4ASpsNXhvHDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaldwGJtJi/2g3gwU7E39wmCa7dctEke23ckhY
 j0jw0CQ0w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpXcAAKCRCLPIo+Aiko
 1SdKB/0fDLUAWxjOoVOqFGJSDDaDSWQnR+ljIRvQihrg5mT+csnQcQXRooXVO5N6rwJKAj7gEZO
 W4EWv36XjveZrnkPtQE1o+MEBLZr2F50RE6wEUZ/9uK37xxft0v6ixn9pooxiKTCh+JYRfaH7+i
 6MQ/ysLTgab6KR3Qc5shfVNjgKty3UmE3jLMQpEWjgeNwO26QJvNcxCklWGH4vJ/0ln1Bms70tt
 t/2DRNfdWHFXC3tKYHsIZULrZw7L2i7B/1vQArrnW1y5OpoW0LkrTTnqn4i1p4/jcw0A7U9n/qC
 EpiHXAdBa1fvquFGbF1dKvs+tLWk9XGNL5eKgp11OsPz6aHc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eFwhjVfu1Pag5b4TLRwy0Ar7Py0rgRyJ
X-Proofpoint-ORIG-GUID: eFwhjVfu1Pag5b4TLRwy0Ar7Py0rgRyJ
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=686a5789 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KmBlSpI0m1EwYyTWySQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2OCBTYWx0ZWRfXxlqd739lYrBE
 rcffbmvSlSyHaBiJgIxwE1Kuab3G/RaJ2VfaefUeFs4/xRsfZS8ki5WcNZ5BftpCr6KqtNNlf9n
 82uv1OjPTspKPxDh46dNHBI7NvxYB80uC78GO5AxUSSjpTDtVLaL5256a27troHsNU+EsbtFZAo
 QTG9w3aTAXjYeNfZYIaufnhc+zapf+QZmKnYDOYOegL4DvYKWCTr8FQJfHlIrJGg1TXl5qlTWoO
 lzYDqAc0GXLkstiUJU9qesYbxkHeqY3RB27uGEbaf78nczgZKII39YZVCFdMNC1yb+hKGr9b9+d
 0gomkx9ebHCzuoub8HVsNDbp3p1paykND1UoWrWrb2tnVLFWZnNrvpO+AeGfUBGOCHsoMA4/BS3
 8023WgFXEdWTlRwzjFaaF4ifWgO5ZVoDmCeDDjTUzuExezxVljSFSU7TRhKzCZ8K0qdvbLw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060068

After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
database") the MDSS driver errors out if UBWC database didn't provide it
with the UBWC configuration. Make UBWC database return zero data for
MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
 drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -12,6 +12,10 @@
 
 #include <linux/soc/qcom/ubwc.h>
 
+static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+	/* no UBWC, no HBB */
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
+	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry


