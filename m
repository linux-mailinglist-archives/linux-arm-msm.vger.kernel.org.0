Return-Path: <linux-arm-msm+bounces-74807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7AB9CC94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6B8A16E9F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A701DE8BE;
	Thu, 25 Sep 2025 00:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfZv7oay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC761A08AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758585; cv=none; b=CN3vpoqTNj0AGGG0WXSKCtl1VVw65NaorAQNKg/v3dMhQq3Qq/xcZ57hpDYAMwBxZsy7IgfiKZdh0Zg7nPQIJW3Otzzp5vO94G1shyuuWsN8zKtdq3HVL+nJu60PghcPBP95Evdl+m39GiUZDptMiItn511HcjQQVLlIiBsrHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758585; c=relaxed/simple;
	bh=RpsDt6AfmyJar6HaUrbvvM9UHQECfIpfv9kFh5VPSdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDU8eGp4EYayY0awufp/PLkH5hTLqjYTv+msZ4Km6YQTpfAGL/yWArMdb5IXAvsZTUGImlLyHci+hkVQ50LQmaxcdTMeEvivYHVdPur8YT9AeSVpR/J0+ED/LcFw+PQvR9dMV0BIsBTyNFZ/EdRA044q+F5DrtXlYX+I5mDkU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfZv7oay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONeKKP027919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwkFrLt9CwZe3OTR8N2fT7/T3WpENDpj9uT84vDktvs=; b=mfZv7oayTPWKte5b
	DUFEWdNYEiNo/9Dz97qZaaHLZeHx6Wv3Jvzt9IGW+iWK9BmDm+AZseG0/TI0HJPM
	hEgxThrxj3BkZp8qtqEDIWF/QNn2H8HmA1W3tallSFix9TEO8vuihcjccnRDUxFL
	qDsi4M3wwthPIamsh0l42jlnT5vxVc4ipDdTlMjE92ZZu1sQQ+eSuLcXUNEWAxrz
	Z0EG7TVrzGLyY3DA6vnjQCtqCcdwbJZMF0v00BGjM77vy0SS1ma6JrDZfbx/eS2V
	WUm+xHvP9dDQo8S3LuhcAyX11xrYLtHTyTfHdOcqykn0FckYHhEt7D9C0FGZdPRC
	fmWlRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxfax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fbaso4157745ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758581; x=1759363381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwkFrLt9CwZe3OTR8N2fT7/T3WpENDpj9uT84vDktvs=;
        b=cOqWMGU+1v0/DFPT7rihpfLZQxnHxflZEeUboNjtfzWfOrAbCy1PJLcZzLrYztu31y
         sH1Xdci+as03arH+9x1SsOX/v6GSBhmVwvCulFRUIUU+jR64Y5kHgpRB4KHcIlqE1572
         YQ9BemAT0SU+RuUOSDbBSeszltgubrddQVAHT6nKCerzFWlgW7MKnjbQRucrO3dG3p7R
         Yv8N6BnksVWMOlz6sK3MMNe4T2yGisWXaCgBAzpqtO1DSeSdfWBVuU3rsITtIq75hIYT
         Yvx+Y6AVQRsiDIFTP/xMIxC/AdPGglY4byNhAjvM83ekWghaFpBw2XVTueFHRBBn78GK
         vi3w==
X-Forwarded-Encrypted: i=1; AJvYcCXcvXRTrjoez8sxo80VrVItJ/hRI9hVzihJh8OnzP9ReFwXaepGtOlzsv1AdAsNjLBM9Kthzz7eC2/PtANE@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCf8AThb1EuInr31PFBFW1fcJhtyvLI2P730HN5UGxAJu49e7
	7CESj3fPuaIXACKJGA5c2tUm1pn23kHTfZiuZWldXa8OB4DjGgdGfyR/Ht9tPgQSOc8KvuED14b
	VwYVg1/4n9v6N2tBXslbVnbbabMXb0BDyIPMkQU89cMWQSZNeGww85zKaUOMTDQ6Dn897
X-Gm-Gg: ASbGncsgTNjG2vjdLAKjmiXm54BggQp8TPdJW0YDXtOs5gUgnAFAOwWSIqMGCBqyR6X
	jPVh8/rQ8wrU8uDrPJmXMQh5mI3077ClyhBtsDinwYkahvE0R7MLYaxFYtkpAehYepjVxLolfaf
	LQSg1z/YLo3mskvGMDsPYXHRrAwnky3wmdk1WuU+fi17eyW4UrqqZ6CHZbs6lmo/Yp1d9UrmqfS
	KjmH88mobptUih+szX9l8+i/3IIPA8PoBg/i6MLediTqP9HPdv2ZRLBsYbJqiI1VqAcFbQQenWw
	sEQb5zgSDatwHIDHgltq7c1ixYmHYC5XMgcrDkUqslfgHf9sux4O4iufoCK8IhwFt7k2bOE3qqn
	rh67+No5uGGMzCe8=
X-Received: by 2002:a17:902:cec8:b0:264:5c06:4d7b with SMTP id d9443c01a7336-27ed4aab67dmr13116185ad.32.1758758581093;
        Wed, 24 Sep 2025 17:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4OYy/wcHEm80h3cy0Kv7xZ4NhAqx6tS9+1F1Vhla9mXFmSnekp486y3cB9xDJ1tVDQQr9Q==
X-Received: by 2002:a17:902:cec8:b0:264:5c06:4d7b with SMTP id d9443c01a7336-27ed4aab67dmr13115885ad.32.1758758580513;
        Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:02:50 -0700
Subject: [PATCH 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cam-v1-3-b72d6deea054@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=2494;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Kdys2jJmwooCgeMAOsC7UrGVCJ/d9/5ByqD43NxfiGM=;
 b=lI1OzmIm+8NBUdhLMPuCT+AEpT0VAUkp8LHFgV9xz+9+b52RE+rDo/IHJjYNBOenj//hfFqKp
 a5dpvmn0TQ2CkCmljxrEQd+wCDNtdG0OUxNPKOQkip3veQrAXFMKdnx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d486b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sBWhLCaFyb788y1jVKBgaN0uM9LH18lo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX8/hKA02Q0Kh0
 eanfRpHRGmTNCISNQSSaOQs81n6sokBIjLs5sceay9Oh/+dTEsFtk9HO8yTt6BwGhEjMnSCjXpz
 yodpbNzJNHX8WPtoXCB15aAD2cX1j/dedhn5nhoj4E1gmQSd7ZMlT82Fhv24QbvL0I2ZcOGJcV3
 aIaLn1z/1RzJmqc83V9SGC0LCxxL2PP2A6jkj56x+PQSn4UNxhW4LDzznFgQ14noZfbEs4GWgp3
 pCJF2rFcg8/qiQx8fwKuppNfDgdeDgx8Rh7R82wpjGpjiWJKHvJ25DvRKuARGuSgObF65jnuPa7
 pGmJ1jf7oOSDZsXavvME3xO/Xu33Jo4tuPJZAWWEiFLG90cWIahPxApGLVslCkG/tcfPYTDwH53
 NFc4MNGH
X-Proofpoint-GUID: sBWhLCaFyb788y1jVKBgaN0uM9LH18lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..4a5caf54c116 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 925857,
+		.icc_bw_tbl.peak = 925857,
+	},
+	{
+		.name = "hf_0_mnoc",
+		.icc_bw_tbl.avg = 925857,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
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
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..9fc9e04b9dab 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -89,6 +89,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.25.1


