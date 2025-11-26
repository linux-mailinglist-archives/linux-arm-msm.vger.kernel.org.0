Return-Path: <linux-arm-msm+bounces-83417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 355C2C8901F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E9B3A8506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2698531B837;
	Wed, 26 Nov 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alAHDnNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixls+7yE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3716730275B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150012; cv=none; b=QzKYcWjtSzXUOfMKyO3TUCWMk1Yxy/9zJyay08Rs86lsnsEPV6EuV5fXrvXrCZbc4m/zu6xKwPd2Ex1cOE9HLYzXdglANVdc14PqW9wCGiDR6wIDzOAupcpRt96cURWMh0+U4TmoIvOUCy5a+Ir+JzOcOsz3B83OjgmbxRZLZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150012; c=relaxed/simple;
	bh=P+4vSBemr+XqaJS5CuSjW7s0tLIfkJf6/LU++jjhoLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTUoYA8tL1B367gHgwvR0YaRMvvVbwcv10cKV68ydbiY7CJJ5TQpcC4/uR/Hb2+gjDgVQjrQcsC+x4Kls1gs7ij1KXId42OKySoeLbpAM9kmkKP/EcPRy8A0tFNntssx439eQf3RCccaExcTsYDF/Y4ghgYCNQCVFWpa5RtfAlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alAHDnNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixls+7yE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5wYU83587377
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=; b=alAHDnNHPMWwDg8z
	x4fdf0eEq1OZqpjqMepI15qHoHSMf+YqhR0iThAlFU+A3N0yYVkNwyhKlBEy5idz
	g+Om3mCzCe5paf7hXQDdf644H5A6N/GZ6Gq4i5oQhuajqHhdy8S3gtDsgnvGOJ7/
	9J5HGsvTWhdx7+wfMNRspWEBaTkGaeVnOj56OE3ppFpyU5MWCIZaas/0uI9q3cHJ
	7lmMHWEZMykVtT76p5iPze+gNVKykGog7io37IalVOplZSKLfk64RRjwGyPNRnSP
	jzgNQzGXKpMKanGgDcQKooCsw7vf3D1c1n4++v8FNH64Ox108O1JvZ3FmbJZ1BJ0
	MQ+0uA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang792du8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso10946234a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150008; x=1764754808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=;
        b=ixls+7yEuNYEBx9sN9Wzqxa4/dsoTW9DIHsTWsu5TpfwTfHb+Q/5BuRO6Yn3jRQTDS
         0ipF3OACCYpF0devPn0aLtIQh5MW9MXYUsT5dpOP4vFzZeD4qTvw63O3wlzQErMrTlX2
         n3fGcG3xfwvXAKBzKGtfY50ch9PusyxKa2SP/GQ5FFW+7gdRpZrFUjq2335INrdzrQG7
         lpZ8dheYZi6E6zDmWTEyZEzkqKLcErmwgH3UCLI/3NOho6cSxPkbRWZe9vNfJ2WuwNdW
         4FrABY16vb+8+ncSpXbEI+TYrjRAjXwCW7bf0k3tZO2bC8iYluzSy4IeA2JrPs6/GvJf
         DbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150008; x=1764754808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=;
        b=j6FclocJqj1O9SjmrezZPX5vZS921+3SF8sQM7KC2Fn/SzlWQWNh9aBYOLQPEjsQIA
         YLbSWULNp4lRQZYNcL96dp0zZuGuG6Qt4kpGKYwOUvDdSt+aR+Ey/DHa3PG+tAW7ugCo
         DH/eNnVuTJrL25PqND8ZH9ATZhsy0WmJEzaz6ZkO7MmatoWaUFc8iiK8PhwPiNrtNHB5
         g52cZ/cRrfEjNevy2SMs0ji/99EcXRozwhGd8wZXrgDVqDBLvww/PC1eZKnxy1aFR0mh
         5BF2YuD14qYLZW3YrNOIsEzTBasmIgMLXaXJCMyvsnsvEyVS0v3Yh++Gw/oVE+KaBX6L
         TCMw==
X-Forwarded-Encrypted: i=1; AJvYcCUJHq/DG9q1vyFuiR+j9Km3U3+UA0tM/pTECBs8IZlnSwYhGa4bBRmf3/062kEul0wiCPm7wJv0Aw5vYCWZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7MKA9GAHEZgY+j1oRR5JD8vOuN4covhRQ0yxseSr5MK0DkseO
	kS3Ef0hQM/9r20LbPWFyLRQ775wwShmbAh2YM+nuk3x+gOeMRklCJpt8BxZFP9o3G1M7bHI3o9G
	Ols4gwdqjpLUsxWKH8cbopOyzI7ORvrS0rH6wD4T8jzSh07inAKT2i7mvtZv0By3wmZR0
X-Gm-Gg: ASbGncspordCpo/jqbcUJ2EgdzTUc4CReiR+G350JUtZ3wxo6jxIdhdF/wjoJ3wx6b0
	wm/jZAlGwAroHZ9ZaaIXWnrj6MGqZOIqGMrLsTa9DIj+zDzRdvRzfseNl7lMAyjM3CtQ6WJIzEM
	0XGl++7B6f29cer2lrz7VnHxTRM5hOf6PdRpXX/JoBDifIRimwgWxnsvzu8ikIOFJ8ReDo3I5AP
	/gStflx32oNaLEYi2XmELT3EjD29lB5RN6TNKU3F+2pHHKLFjsznfiUVRQMFe3nUz/Sf40IO1UG
	0nnocg4Zd4w/1suwgpqg2krXs9M2VqBRX7SshM0mPAJWDA4jgc9m1Ku76mz1v4YKc5wpIRXyQhK
	Tz/ba+MKMKDhDB6t7LFiaQPbWUwqNWxz9eeUM+woOL1lUXqm4REAToUdxfojWc20a
X-Received: by 2002:a05:7022:2521:b0:11b:65e:f2c with SMTP id a92af1059eb24-11c9d60ea19mr14591434c88.10.1764150007656;
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH49U7C0moElexCLrZcV2e+MlUgzEqGlJSAWySjH4yEsEcXnQAS0Ww7o7oxUV9i0HPgQkXFpg==
X-Received: by 2002:a05:7022:2521:b0:11b:65e:f2c with SMTP id a92af1059eb24-11c9d60ea19mr14591417c88.10.1764150007100;
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:36 -0800
Subject: [PATCH 3/7] media: qcom: camss: Add SM8750 compatible camss driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-3-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=6926caf8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: lv6WzphK849DmrcznV7Pjt2DmZsHeDhG
X-Proofpoint-ORIG-GUID: lv6WzphK849DmrcznV7Pjt2DmZsHeDhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfX4YD0b7Eoo51b
 +yANHW2Yu60DS4ZJXewWNYFO6JhVJ0WbWDvdebO6X81O1mqmbZYKDhHuViauX9TuEJrKUB7FCxa
 VjRMLY9NTXKLhVsUv4RszhnTFa/cB8c4jlCZBgIFzFY1L5VHnEAyj6bG8zr8atcxXPxeYDZGLHu
 ylfUwOzrdDl+QL2MneKwa2lZzcn6qY7PKKr4WT6GoGXuavtvSfE0BV/nKl9lIxTAwFhkz066aBR
 SmxjGXoQzSuOWIqpiq3l6zA1tbwPUkVkpIX52CZknarsTu5iwwlgBse6xpcaiiicNjd+5gtkVAo
 stKb9JFf2jTT0bxYSk9lfLsFS3telwqGFbwsgaKytxfd8/5QgIbyxKwkL7T9oCLiWZL5tmMUE+T
 BBsd9SHLAk/xzXnNsRdoeLTIo/S2IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5ee43c8a9ae4..805e2fbd97dd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3870,6 +3870,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5283,6 +5297,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5314,6 +5335,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index b1cc4825f027..f87b615ad1a9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -91,6 +91,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


