Return-Path: <linux-arm-msm+bounces-66308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA0B0F3E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8AFA16DCA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B6E28CF69;
	Wed, 23 Jul 2025 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbU9twkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A82E54A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277025; cv=none; b=N5vdRTMs9zSZA5BMLtarVKDFkCR3L43vpViV1BEl11OLcxJfbwBwiUJw/388e4Bag7U+d+YYXKIvFZ2zZZod+7YJRrS3lyFe9ge/gapSFKGg91UkBxrv3Iz/DqxQhhvJreumoLVCV3P8HXkir5vXGZ2+YMdmWTOdMD96tbL02l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277025; c=relaxed/simple;
	bh=anIv7UBD8VLP4vJM5h2MZC00iJTIhwQ67w6K2o8NnI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FWtu+TYzZuU7JMHKlP5ZoftoG/scxbvyty1pmAGIA9aWNZEhFhID7jr+MxxG37rmqXvpwHHTjnuUX+cO7nyhG0ZWncWJkl1Nruf4VLNyZ9T4gYk/266KMb0VPPdj2CHSRoa26+hRp6i30KgStussAojHa+t/nhzzl8P8Qko/8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbU9twkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9MPKI030783
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tWG9Dumj/u2sl28Vz4MuVl
	d5C6QI9r+ImLKTNYl6w7s=; b=BbU9twkPFMHVO/SFlrrP3+Ksf/2+0K8h5zZ3BH
	s3iws3Tl8SCPAp/+Y4amI53WANmwyx2vmC+QA4S+ObxDiU03FvjQv8rvvX9qP87c
	0NIUpyYr7VWk32olhsRNnYJnKHe6mQL3UVUhJ0q8LHISEHynmIdH9wMhPeyMZJ90
	gOQyAPkRIR4z8jwYZTyOYJ7XLNJRqmn95PExRiANjCBsYmE+J8v3KzQPajWT9ZeT
	MEgXG4cqipvvRWvAg0iKukmgGkZ+ADUSXXEg/5WvW095c3idUU6tghwvZpZlN5W1
	C+KbHQp+GTfmNr5wpAzY0yd/0GOevyiIhvA/awRunHiTN5uw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s598j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:23:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f71b363so122125876d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277021; x=1753881821;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWG9Dumj/u2sl28Vz4MuVld5C6QI9r+ImLKTNYl6w7s=;
        b=nhm6a3PE/cqA+m0OmoIx51w0R6KAT5ejIXc8DqzeWs3dNT34SFP1U5QqssjjnqZxlO
         MyDfLdvy1Gea9Txt3bXX0ouHSSBMKaAp/thGnoCYOPLE1kfD1GU3wttPf/izGOOcl8qW
         LVy0zK7WBbsB/0HMSZ2NvcfBIdOYyh7Z8xuf2uiXYpGd6r+RBsMZzpxLjh0PaP3sU7Zy
         1gZ+MJvJyYwMmdXs+Fsb75sAdljwIh+B0ogIg4i15JTq8i2tV93OkAaTRoc7mttCHdru
         hJPmeQ2K6US09mM6vwO84oC8HUbsto+giqeTV9uui674NPy9KYKWELIN0teKD66sypJo
         6abw==
X-Forwarded-Encrypted: i=1; AJvYcCWfc+SJnu1cLtDVY3AroGzSH85A2yW+U2NVWVe7WGoyjDocriY/Mc4w+Z2wnBn6l1GEL4xl5Bl4DUPYjZIl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0nJAoJnoqxbB0gpv+P3RhARsyoOt4hsDNgC1RTUSUhq4uAU7v
	IBXNuZpPBnTmWij2w55llPBZ8k2WWirSBTsEKdKlcFzr2v2C5zIHYvA/jr/V7R0YwgsM6f2rmy8
	ftaZ3C13Ex6OAGIlPafeAtJ5xQEayluT8tz3zpXAiokFiIkrRf84z4wVT8KfXUlwoMyT+VIiaBn
	b4
X-Gm-Gg: ASbGncuggTzR3bQdtVGZt//2LMWljqCLuhz2dHa1fp4g8hhzvC2JezA4DeYnjfdaqpg
	CIzH2L98s87p2/JgJNMajlqC4mDEcVOGhZs6Jikrmpy18H3cOynJkfufywDxuMv1ClwFIrYWfn/
	AL+9np15XodoXuHIXZI8j9X93wDuVGERur0uYlnK4xQy/7eY6IuI3WZ4Rdo1seFmnAOuoGpEwFe
	G5ywDlyDb50mgmyQ8XuqhyUq1hkErsXaTawMMwsSVK2TAxbjM2wXq82aJNrOjbs1J/iVoKxft/F
	FgiN7eX0FnYojr3j09CZyX29uA9c7OaQSPR7i+kmfjGhMtBXKbR9OuepT6r76/jLUZg/XCzpfzs
	N4OK0GoUTB+C9BlZPGAw7SWefAWpJ87+sy/loG5RLh6HnuZvtZpb3
X-Received: by 2002:ad4:4524:0:b0:707:9b0:e5d6 with SMTP id 6a1803df08f44-70709b0ea25mr11477736d6.25.1753277021131;
        Wed, 23 Jul 2025 06:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9onlt4Azln72h1nDQG0ZF4ChtAfnqCYnLW93SKDW+UJYzjfRVMDoSUYaJ5uhPs4CUJcl8FQ==
X-Received: by 2002:ad4:4524:0:b0:707:9b0:e5d6 with SMTP id 6a1803df08f44-70709b0ea25mr11477336d6.25.1753277020608;
        Wed, 23 Jul 2025 06:23:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a4ee536ccsm387931e87.179.2025.07.23.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:23:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:23:37 +0300
Subject: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFjigGgC/3WMyw6CMBREf4XctSV9WEld+R+GRS0XaSIUe6VqS
 P/dims3MzmTzFmBMHokOFYrREyefJgKyF0FbrDTFZnvCoPkUvOGH9hyeTo2hV8rp40wslHIFZT
 LHLH3r013bgsPnh4hvjd7Et/1jygJJhgqo7W0lu+7/hSI6vtiby6MY10C2pzzB6AKU5CvAAAA
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=anIv7UBD8VLP4vJM5h2MZC00iJTIhwQ67w6K2o8NnI8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogOJaxaCr/gcCZWyHuVgzn/MgGo//mAlSYqc6X
 HFfMWJc15SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIDiWgAKCRCLPIo+Aiko
 1ceJB/4xh1Vu3lQYPxaXIi48J72Xok30pM63ksfuWfGthvySMgGbAcQYPIUvf9S00BGBXPRHJX2
 pOPZ7+tKVnnlJjTCrbJ+QGijPcp+Y1hdN+h6QIO9sZi1X0BqSF6aoAWPz+vphJN/1floLXmFqM3
 zc2by4aBVCZgzQBrX5LpKRtjfUfQryJJdhQ24lLnWtxSC07olg+nrTGowKG2ohKQSk8cFeJf2/z
 Zca+1Tld0AjzbA3HsP6T9BQQA9BQy9QgQU2cGcCJkLPLqP2nrJdelJ49C4mjO6aDp1cqKs046jt
 pUteGkrTOb1KQoncaPackjaFXSxAq27VYTVi1foDgRiC2K5h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNSBTYWx0ZWRfXyT0tCYMwy3u5
 rfxsLk59n+ifywhCZTh38Cqbw7tGqm6HGTQVg7El63BOOw9MGcV0YT2glur68IbCG4He72Wsh2M
 AhOwVPNVVhRpjdUEeqIQkS+KDNL5qrEJuFWOZLGn/kCqLM90MU8DEoL5Z0aAqEdV+K2R+GTGasX
 KmIqZf79uuz4Ky9R7QQpb7H0438fAhMMr50RX0CzHwLb0sEEDlJ2SSuXlQwDz8iUbpj0MVrD454
 ms23tVAu+2oYU1lzA/uBCnprYpapec7VKnH2oMjwHv2exlVqJAdBrtnmLkd3ZPSX/iu9zI0ynVn
 qRrKNo9dWvERjqWC6wWmzOJcWTNM4Fqmv9qgL9vfzshNQULu/mTBF7W2iBMV5VIhe/swTdIIjJw
 i7v3eEqlOzL12/XFt9oIhbikmZXdYTrGq71ZY1RZEz54svr4h6KCeda7GqDaol2br/r02NPK
X-Proofpoint-ORIG-GUID: FyxFHPIuRlSDf0Jw8n2Xq3piA5batDtd
X-Proofpoint-GUID: FyxFHPIuRlSDf0Jw8n2Xq3piA5batDtd
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880e25e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KmBlSpI0m1EwYyTWySQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230115

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
Changes in v2:
- Added APQ8026 to the list (Luca Weiss)
- Link to v1: https://lore.kernel.org/r/20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9002fc9373ce349c129889ab58f87cd59591de63 100644
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
@@ -215,11 +219,18 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
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
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry


