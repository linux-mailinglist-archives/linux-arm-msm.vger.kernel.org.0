Return-Path: <linux-arm-msm+bounces-88660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B06D169FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 05:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9C94302F2F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 04:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC464352C3F;
	Tue, 13 Jan 2026 04:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nkq8g5x/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnNacddf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA2352C39
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768279754; cv=none; b=opDbzW2Q/0KmlwWq8aQDcJaBDlCAhjQxyu4+HpwKtgnWrWAI/uVHCmXl6jycrpmaTgFcqMqEIuacvfyIf71d/Zi5kmXAdXG0uUw60yshtIyxwBiGUQlUpRAVcYiWdD85ecTPZgt65rWHH6UUxvXuNUsQiKzlYxNd259AmNUC/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768279754; c=relaxed/simple;
	bh=qAYVIyfc7e3rEE0r6gSKyylxaDF2Xe2iZmOVEFkuC+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUnnPYK044DfzUkAo55eEa+PPSMbi/StZ7jvc4MGWde6NOtHGvdlDrOQFuHilcCpsy/VrmTvFEq9SKvUeajrAT7u95Q5Aj0KpCrMrYlRJFx9UK7U4Y9Y+xusxC8/UbiXNw0zX1fH61ZGOY0nZtu6woEJcrMHWZ46k5FooTmkTgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nkq8g5x/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnNacddf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5sGC2065401
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pq8b7EgAUNsAtM6Fas5RMbp7EvPKne1LghzApOUHTvg=; b=Nkq8g5x/sEenYg2q
	pWfagCdLQaD+XN7PHTcmwEhTW70qtlXRl0zqQ1ol1MPx/8RBXnVOeZGdqeynQHAe
	Dh3WZ9CR+UvLVW63eKDeJ+GbK7dsuz66qKQbMtAh2nMRvqjThVPi+1Iv4msts1TN
	kKs1WkU2lG/8pMJku32laKB5CQDpxt6PGvWTzCdPJChLUIZi6BmZ07d4+drsVG58
	S2O5ptraOLvhv/jQpIXB6ccjIzW2JKc6K4aQOtIZi26u756G+SSoY4358QMOjq+7
	HidX/D7ioiZq5Y/RMp/JfScSfZngQ7U1OjxsxjXlVoxfv7yxGAQHPLH/8MeAWFKC
	jz47pA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvu5tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:49:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae56205588so8796169eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 20:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768279746; x=1768884546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pq8b7EgAUNsAtM6Fas5RMbp7EvPKne1LghzApOUHTvg=;
        b=TnNacddfZJl6DIQc83S0W9Uui1fOoyke6bZSQHA7iYlnY5A6AJpOHqVY2phyzMTnG2
         ww8OBR4h8NVSlkeaGz1oO3tepzWjxdlYkW9ZjKWz2hZig02oaT1AGpaKSvcx576ltT+W
         q2m6/ZS8U+k7ku2Ky0etNabKoGaEBR9fSV89Zwrg98REiQiHhXJbWgtjImksFPmuBoZY
         5gRQ+YHHoljxaFAlDfUh0szg7V0TQ+jeim/JB34izY2Jfx2zyQO5C3Mwo2WyBi9ekMec
         lR/gf6sbnx7AJxLFcmrLfzEM28+5xtZxUTCqXlrbDV3keGg4anD/h/FGoDczX0ogjSdE
         t+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768279746; x=1768884546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq8b7EgAUNsAtM6Fas5RMbp7EvPKne1LghzApOUHTvg=;
        b=cZEftu+zmQ+JMD348O46mYM+E+RtkidNwEEQKPUXERjYLAZ6wJs0OazPsNts1j32jv
         lao0Fz3dJzycHrawHm5kT2NxDHrQSrAPEkjQXzard1S1YzFT+dtFnlCNwXt/4mHXcfd3
         tGnWVfiGexJTUc0FkhlG0sAFy+XceqB6ON6yLq+nVEYPYvrEtaxGWP9C12RCDspp9NTM
         fKdUf7PpWWnzkQaJO9bq+VpsCV7cco5PnKmEZBsxmPpmvqMe5OKfriT6fwV1eVLdsFnr
         uFst3IAYbV/WEwQejkTczrgBBtyQZjB8p4TMMDFioXmIvF3gckEhJn0c10a3oN2dm3hw
         CHTA==
X-Forwarded-Encrypted: i=1; AJvYcCVZZYrTa67wiCVa5CiQ78xtASfLPxRE3qXA/RqsmwIhsNs9PgtLP8U17/wKalTW9sDhSb7dS13meRraTZ1k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4C1VUDgf2eXy5nMMJK9awTUD0gbJU8YHdYuEtFdUfTrQhhjc
	wXPzTPDFlfmS2/dsugNy6GVLa+KDokOLyzfFplNorXtdEVxYBKjUx1hGXBIOWw98oJZqGh0bn9d
	QZ0I3OIF2oXFJa+qPH0BlDxlChdQml+98/LxpeztldaAWyeRP+AjR0j8NmLZUIz8EXTc6
X-Gm-Gg: AY/fxX5+GZ8xZVRL/EqHi3g5bI6qWfXHWFdWPwoGTfBiYnseXfP4Pu/M8WFyhVfkOF4
	A2NUJlnBNPZgLvbCJV401qP3DS4eGxcavjMaHKg1f1gWVV4gYI8wiGcKxiuSJpzKaX/AEmURWtv
	WH04bbWw+C6zCWGAnKMrMBl8OveAAG5RQtkCt0BC9Gm2Y0HLB4EuRLOl4SC/ST4VAMsgElGk3q+
	gY09OYt2C4qLdRWauskEFKv/38WxRe4+6raQiQVy27Gn8K1Wus+imbf6jmBuGQedWkJYTeHzZAp
	GQVnkMvLK/EF3jg4YEDBa0l955RVfKTek2Hpxp/cQlc7k8m4KtXrtquj53w5pPVvHLHf2y0uZMY
	jSVa8yodObx9leB2LVxDC6UsYRhitr9fzOaqbZbaC3hLUzlRdpGKw9pO6YjUYX1RJ
X-Received: by 2002:a05:7300:1912:b0:2b4:5b59:af73 with SMTP id 5a478bee46e88-2b45b59b400mr1069443eec.1.1768279746285;
        Mon, 12 Jan 2026 20:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+2qrVn47XsKn2tkzbXdNdwrPHH2trscWJ/BT0ds0BcnoIhXn09yvnKwbF2eg+QuPBmx5BCw==
X-Received: by 2002:a05:7300:1912:b0:2b4:5b59:af73 with SMTP id 5a478bee46e88-2b45b59b400mr1069412eec.1.1768279745743;
        Mon, 12 Jan 2026 20:49:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d57aasm16264065eec.30.2026.01.12.20.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 20:49:05 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 20:48:48 -0800
Subject: [PATCH v12 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-kaanapali-camss-v12-2-15b7af73401e@oss.qualcomm.com>
References: <20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com>
In-Reply-To: <20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: kuX1EdP2BiI_EkNPnJ-jt6Wdc0vFIIEd
X-Proofpoint-GUID: kuX1EdP2BiI_EkNPnJ-jt6Wdc0vFIIEd
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6965cec3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAzNyBTYWx0ZWRfX+xAZ3+BDCqJb
 Md/CyrgrHc64cQ3TCDCzU06VIpLtgPaOYOUMYTfbAfJJpBX7Hw1YMT8pQIwPNVKDI4yRySssJnP
 KzAJAjzyAGSRHTsddXU2Cs7KLSsEkXsZCDpI4ZJR10ZPCHzVzxFfyaH1yL53w5vTmTbFdmkqO0u
 IlrmEnYdQ4qXCKodiHV+PEsB0/CEeiRTsGJsQB+VU+iYa+oorQgj9wQ1LFncnOayHMw34AyEzDI
 PhXbwvcGrTvhcZboJ9sz+53JS7sMJ8KRyK8PD+gS50e5eoBHG5IMUv1nTfyDeqlUXPk0B+0SzyM
 GZN44sgl8L5cR6RMMiQ7++Vu80qpPZEIkPsJHR8TwHbCZVtTB9HvV6nlu2N8L4O8zMj9nCHe+7M
 GtXnEXMEbIVBA10RkjaNtC2StKFFR5CEMfOlp84EGNm81/Nu+F0Pv2jd65+mTAqb1h9dQXOAEKy
 FI2RxOqqAIpNSF8Jyzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130037

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


