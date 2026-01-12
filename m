Return-Path: <linux-arm-msm+bounces-88492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A8D1161B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB6DE3004290
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F994346E56;
	Mon, 12 Jan 2026 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPkE4Y5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmVzPgUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1463346ACF
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208563; cv=none; b=qvrCpxOi/LUQK5VComWTQl5HTf0ssZUMLMqKGS2OoGKqpHNcjS4t00oLL+fhvwdrJlf5og2wYn7qKVV4pDfYb4FRNbzbGx8mjsAEUpTGp45A/+uD+TPOrmtIVXvmCki0VE0A3ryZ21DYgyqBLoKJeKabYuYChZyu9DQrl5y8HbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208563; c=relaxed/simple;
	bh=qAYVIyfc7e3rEE0r6gSKyylxaDF2Xe2iZmOVEFkuC+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tkxd4TtsZYSICJMTAKoU5ugh2SR1oasVNUXrxSjSbiZYehkaJUbl2kKRQEdSpWZ7ZuODm27mXIFf/ut8Sk+BUuaqRvMxiz7v0qQ36iRfXf/ZPpkTvcEvRYjnE/VZ3DTyfsgsEqhhNqiWEh0G3Iz8jOyzkyl3lWd4ngxKuRxtb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPkE4Y5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmVzPgUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8lepi113540
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pq8b7EgAUNsAtM6Fas5RMbp7EvPKne1LghzApOUHTvg=; b=GPkE4Y5kn9V2Sa5j
	2Bp/lAkfIVJZSBpdddh8bcER5aKeepScDq8x5RU9l4BzBOujsBW4W9UA1VHADP5c
	zEtg688godMvhib4m4Kpvmmu/lCEgmDwlmxYSXiOsRH8C5Mt8dk01PkuS780V315
	DQBQt8ZPm07sg/ziGnJBALWcmdgxYc4q1pD8IbfYkQJ1PwzjPeMudfUkSwm/xLHx
	Xp4Rjdfgib8BNypXwglC6U4gpuYD6DhfMMMKN1TL1LWTqiZGriGC583S2Tw+02G/
	vZIWPkMUYt6gfnscq1T26Ih3YED+U6pjTr00Q6cmQipKh7msyMT57H3XqBl2SQOC
	MiFu+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uh3n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:02:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae6ef97ac5so22520120eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768208560; x=1768813360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pq8b7EgAUNsAtM6Fas5RMbp7EvPKne1LghzApOUHTvg=;
        b=OmVzPgUmg3jdI2siRFkFY2v5oGZ6YVKfL6rV9w9Uau3bcgIaVbDQKXh9cly2+o66XA
         CCjXNLPy3ZfxMzskbtTury8m872HSx+AhCfiSnAXCPNYRBNpRwvQYio0ITvTGYBl0yZ9
         Fq84ToKRh0xaX151K7bHmI2UrLRMJdy97u4BigDk408J41WRgoi5a8xG6rgPX3PR4NJe
         ycsAOt5d0WxMHqbhhpLkX+HEaGmAH141v0e7QSXLN31kX/sNPV7m0NOBkk0I6hgl2DoE
         tBUyQQd4gkF1OUN541EbAdGx9SNFmm9jSUKVDV8dYoID0xZf/cQR1Rxgsu5NKuMeTwAb
         tcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208560; x=1768813360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq8b7EgAUNsAtM6Fas5RMbp7EvPKne1LghzApOUHTvg=;
        b=Qhvp+UPP6eIDafyCJVtp3WovCbLXS8/xGvIwMasbS3QHc6zhbewZeuAgN2wcNJEQMq
         vFjOV7I9rdDYjjWbeaPQwWOn6/WF/7y3rBUJaMr1AACPHw5SzGGJUmk7OyGCd62numI1
         EoWkRLaMFSyYLzGcgty26YD8PlQz+kq6sFueB1Sjf3GivhVMien2B4pruXSDaNSfTTcS
         vZFk/7prKPMQlidv9hesridMRBiy2KlVO7sgKyJ/iyiHNChf3qtoIrQIZAKGB+DxIc6Z
         nUkni7IsKvnV/iMbvMjVc/mh0NrkyRuiCbb3qiiqGlREv7PW1iVyeZwxLuEJSCDoa1Iy
         APug==
X-Forwarded-Encrypted: i=1; AJvYcCXX0Ki7ZL8mHmFpHQ9PfgKjNASUy0ftWeJS2BryjZ6SNNGgcY+Yuh8cp4lRz6WjZet7rZSTXkYkHx3H0Ow4@vger.kernel.org
X-Gm-Message-State: AOJu0YxOV6LD88RzYsrXbd6uTvqHcI1Piq3YduChmuqd+SaN9fAT3OIs
	f4yUISc246F5sbONvEboKuTMKOsXhMwohvWGoLWvq0SQ774DKBM62r7r8vVbu59dz3fnB4vbwd1
	c/ZbFcHUuBrpoyaQB7BGjeO2LjW2FDCeZRWP81QTrPEuWPq98sRUtFlskCqWoow4IAS5J
X-Gm-Gg: AY/fxX4sl+/Dh2HZ49H0ITcXda3hryySuykWr6fQQnQ/dAGtkKkI0ceWAvDB/DWVIDv
	gavkbYXhzbVYD77rKfLWc2dPqY+/ImKyZEq0Ha8dPRg4sZIBoXy6VGb/wcB83Zj30gT3xpZbx4t
	oGw/x5bzhK1cjQSb+Hz55gVQ6Gk+llFOeRdEoU//wtyzc6WgDIP9EgGg+qTKSwK2uQykI4mSaac
	+T6ZL0iC0StmBI48BZMsenCFmkj3jhUVtSsjs0BIleRQrGsxSXySSVgP+c4Iqp9KBMbOyWgbjDv
	G2RVn+Wf6qHkat03/cFJVcRI4P6RDZeoRk8G4rTLgCWCqUpoSfJMaLsnSDXMmUk1SjqjBL9Mc9R
	AYZi0IpaeXDhyp8YNWGK/4//nT4RShK+f6XfLAbDL1ErMiSpHfWLY+TjvWs6dzcFQ
X-Received: by 2002:a05:7022:d93:b0:119:e569:f27f with SMTP id a92af1059eb24-121f8b608b4mr12937573c88.40.1768208560174;
        Mon, 12 Jan 2026 01:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGv5Osxs4SohIS/nHhwxKn5i0JKCKDk0dqbFAHZdlKg/51clHLDRxH4WYi9XO8YXLYbySCrpQ==
X-Received: by 2002:a05:7022:d93:b0:119:e569:f27f with SMTP id a92af1059eb24-121f8b608b4mr12937555c88.40.1768208559618;
        Mon, 12 Jan 2026 01:02:39 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm18888500c88.0.2026.01.12.01.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:02:39 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 01:02:27 -0800
Subject: [PATCH v11 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-kaanapali-camss-v11-2-81e4f59a5d08@oss.qualcomm.com>
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
In-Reply-To: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MCBTYWx0ZWRfX0v+PI+TwqOV/
 WcG7ypWzLegPv0G0BJ9gkMV4+9sdVQlTQf39B1p/1wsO9whnEEnrA8QvibG2rfTTCriaGt9Zgz/
 i78ZAFzz+HK8dExs9IErV4/ufpaPzuCnqxJcRSbCRT1R+5JBz/7GR4u24YTL2IVDEq/1lkkhYVe
 eCDTHJGhXR7BVrjzxh4V5xz5BAaqOFeGjuUWDRprhGo/AmXYHovW8h2P7EUN19Ydy/rWlfsZ9ek
 /xGvJIAV7ZHjvQQInojFEZsXTn1qidp6Z3BW6sQbnwgBH0PruZDhDg55C48rTZH8QzuNzXHI95d
 jjtaWL2m+MpVMySVMwcyjhpv2feEbU81BKHwa2JSPB8P49L8O7zdjrDfu06GumkhrT2HjjV+8Fa
 SLMJxwjr8zTtL9XvDBImLW2srLppvAt0fAAY3Yhv1IXov7N4UKqmxQYEanylsZtk/El7mMSQRJE
 rpRIS0w7j0RCNdvDsDQ==
X-Proofpoint-ORIG-GUID: DFDGg117nIBUI7qvw3pQzgeGJOal1XtU
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964b8b1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DFDGg117nIBUI7qvw3pQzgeGJOal1XtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120070

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba0..d07bde60b3a8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "cam_hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4746,6 +4760,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4947,6 +4968,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25..b1cc4825f027 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -92,6 +92,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


