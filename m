Return-Path: <linux-arm-msm+bounces-88029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F7D03BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF0D93015198
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E742737C0E0;
	Thu,  8 Jan 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwFID3MK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fd5Kg/yT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A03624DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862701; cv=none; b=UWGIhWclD1PSASAu3eM1g5es0Heu9yghvM12TWzLG1676O+BaUGqYDh3YQKey8tGCVPoY86sftdzMDMCNY8FRfWXxnRlAoNv8JWuxD4aLvCoDp7UvrFWVvau/0VgIwB/J+WWGXOnV5GKbXeYIz8J8RLR3Ydx6lWVV4d8akEFNj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862701; c=relaxed/simple;
	bh=k21KuLqrakb4fzczAxo35U6ZXCS51oohpzYX1tys+us=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYMdfgT8eKABXUC8jcRddlQg1fPzxt1KIuF95dCYw5URbAe68dWfUGrgi+qtb2a5d389pa134RZtmlPFqUU2Idvdl2ODjawZwCf3MjlJ7BLlLc8retx8BpoAy0jo1X4qilKZADPNa+aA4OS1O4ckw35HTY+5QUQeOdWRJqUDFV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwFID3MK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fd5Kg/yT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60846GnE2780200
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7O7zbR7bk0
	RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=; b=cwFID3MKDYKuRkIpd5VIj7CQX80
	IIeZdQuPcSNfydPzPOdmuw9iQumQlXD7JTLsuLfBEAW7845tR9e6liYyieNchtEr
	4fnDAWK4abSlCZLdbiJFQUjt/DtwZdqv//UD+enyPhLOpRx4bg1QAJKl1M9XD/md
	Xvgmst4sdC4nt+aSG59pJ+03r8f+NGc/yfJemkQmAohN2iL1L7IvjvA0q3Y28ELr
	fVN/nCVeqcStpmRPKeAHtP4FyZXFUt0Yv58KULElYh89VeVOsojNdgSVfTsO+AB4
	dJeSVybIHzJRgihto5ew5EiXAg5ySQpytw2AuaQ7ZCBSPNK8vCUjMr++1Nw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugt7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:58:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-888825e6423so64025156d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862687; x=1768467487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
        b=fd5Kg/yTxKXW2Ygdyg3XGVk+6t5tPbMEF+s6pXRy2dycAYUdgEQakM/fs0V3EEnkp0
         4mhJd8MqjQeZchP+0jMMn0WtaSQ4Xi6k+kjK+d6mqn4pmI3PbOrkmdAtSdL60OulBrFK
         eB2lUok19zeH32PBcNPj/aUS+fklxCz3x4k82fEuQBsSN5jB9NI5oIdMrP50p1N6ZW5r
         fWMXGOzLyawZZPlfCk+D6MPTxxn1d6x0TDpYrGHn6U5Ns6jkvcZndy1z9GGggqgKo3iJ
         ip/ofL0/LZEGSKiyieVVJEPV1K6MoNPH0lkRRdhHXtV2FUZInDvc6HZWAYz685uajae4
         /3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862687; x=1768467487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D7O7zbR7bk0RBrH6WlI0a+LXkFPZYFN4ZGyTTHv5I0k=;
        b=crcUSwXGbURV3oRqRvvZ+gEOFouPZs8c3SjS3/gLrMX74GtnQYVa7vEq4jSn1RqM3/
         NGurWmbhkBoQyRhO6o/+qP5Dsjy/fRpSvC99tTejBpVVoyPGlD302KGIo+dzTJWv2TGI
         SRu5jtBWoJmHH7fbyXxbEKt0k+2wsecos6O2ABwfiJ1/2w95rNnzchEdzTDNOaHm9XDB
         IOFdC12VkvTY/MViczsPmoeXT9RrxlAh7h60ipCT4iPa08lV/J2q1fJfy2AquXCaTt2A
         XELaQI23HrKVbygmUBco+3qltdNhy1BxfHLitT408fXzI9SeaO8lfdJ/KM2l51YziaJS
         Gixg==
X-Gm-Message-State: AOJu0Yw0bLmJVsv91eyM1agdH35oDvaENmGfJBKprhPXq4cN7bc2ZQjS
	dIpvVDMm6GqBrVs1rKC/ABrHpaCAPnNqPSinba7IpOW6gat+VlWaH3oxtIN1ciOFjfIuDmjZ5ff
	GkYBijP50SkCuJsNHfUItMjuLsqVhjXiEu71sZ2Zv0zDvvfugQo5LO4uIu2NrMNRic9ks
X-Gm-Gg: AY/fxX5qdcMW7L3iJ5ntmXtnKgU28WXRnA7T9t4Z6ziv9leWnpKiZhUNKm9kQP3DN4u
	BPe7y2Fq+3wmK2H9zlJxuGqaCzdGotRqFzBGqn4YOaHbZj5MgSsFF634ozQDjUHq3tQnJ0loMc5
	ENeQZm3LqnxqQCr0ADO1aWQ0dVTbFmQD+UC640czr78ro+XKDCm2R5uXOaQvEezjwtcIflNeRKe
	HlbsosTxpc/q82NmuO7FPx6enTcare+Tff01eZHgF3WUahTUqPTxQ11N6O6EKbF1tGDHZQTRoPo
	yABYYX47YhIN6t4OkSkEIP5UDMrpaS80MNKO71QKZQ4MdiKRVUNk+01iT5kaRD/gaRAsCagAGtw
	hwCEe6PgwXQpZNsGj/PhsJIG8E15GDHsFQbacom8y4pmx4g3uZn6jn6KQycP5G249ngk=
X-Received: by 2002:a05:6214:c46:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-890842d158emr79772676d6.54.1767862687092;
        Thu, 08 Jan 2026 00:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ6o0SmHvML2LmrOe7eTL0nOVLedXj8klhr7BqpyaZ9HLVsEOuMtIS4GiO6aIiM/fwMf952g==
X-Received: by 2002:a05:6214:c46:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-890842d158emr79772466d6.54.1767862686705;
        Thu, 08 Jan 2026 00:58:06 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:06 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 05/12] drm/msm/mdss: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:52 +0800
Message-Id: <20260108085659.790-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX4jF/k7Q7Gvxa
 5GHwVMF1QFEGvTrXpggvg017iEdtKtb0ajWbFiWFCUqDWQPty75vCi4BKoxE58PMdQPZCK7U6x+
 xcvbNSn7bEF1acYGs8ZoDENiZSzsngxclGBBGXFV/FCyI8nsY3hD8rAFBw26CL3PeEaC3WVafFh
 btTKVGKppVWil/r7vmhkomy8ktzcS5qqyNMl2AemqpA3fFYy/avg3DZge8YaShhMJ3nqeKZVd0c
 sFldWNFV/r3nVG83ST7bnfTBD8A+eBDLC5l7/IUlZywprpRp498RDur/NMDsse9ezomLj+9j0FF
 NlHuh8oAQ+UhnBTPoNRToIooE5I2Yra1klAy4en3gGMc+a+defGAynOuHy6HYgkLoBqzEo7GkAL
 k62uhNo2NH6xVS0yyFala1fReab+tX+iixHgLoMWH3+S4hiRNSdDLGw7wy7pG2C4zoGoyKeLLRr
 BPWCFJIEa3kIUf9FQHQ==
X-Proofpoint-GUID: 5XNeOdg8J4Az1VKXT6Oz4uU5sNVyDNu7
X-Proofpoint-ORIG-GUID: 5XNeOdg8J4Az1VKXT6Oz4uU5sNVyDNu7
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f71a0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..7d78d16f8802 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_6_0)
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
@@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -554,6 +561,7 @@ static const struct msm_mdss_data data_153k6 = {
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
-- 
2.34.1


