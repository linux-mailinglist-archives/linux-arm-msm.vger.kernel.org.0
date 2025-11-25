Return-Path: <linux-arm-msm+bounces-83171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FDC838F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7738A34D068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7253D2D060E;
	Tue, 25 Nov 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+kxnB4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Agx0y4+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442012E7F02
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053356; cv=none; b=gSYwYwMq+ev7bFLWU31zNTObG9lGMd77IkuZYKgwWYeP9AQ8aYzQdiBybUw9vrfe1+dIlm6hWogiP7VSdkbubrIRvFgJC9nfZoStkwXvrK/1nBrXrO23cFxvrhju0T7QYRZEUvpzm1bhboZt/KRgX/DgwMGWDEYyKFlrXcpIWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053356; c=relaxed/simple;
	bh=Lkr9nURjaF/4X10BCp6AkVEKptwiYyv1SOrxAC89O/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j432NSWcVx2h64uaQmimlUYNt+f3e+ouvLbR5ejjbfTTAYpBK3RSPhTzVtO9IoPZ4jjrNwzyA67yWNDhQ0cMIuNxM5z+kZTuGs5b2323IiAm63/8+LJBgn3jYeQQsROWqmBY00CmoH1jFe174eEdl6iO3VTwJx+YaT/AdRoiHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+kxnB4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Agx0y4+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gfUT1820683
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sl70Xakrk/Q
	WuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=; b=F+kxnB4BHt1771E/s27KGl4vZuO
	ji8uIBVxgAtc5jlyJX+jZc33agIimP1nJw3p9GmWMjweTmrdjTerZkWj9GMCaBjE
	/kBZptiUZC7pVh3IMBfbzsAFANG6SrX9lbxdutCuPsqzCbYj6TOjSmcpgFJF0bVm
	QZDfisUxkFu1VEoPx5tULR93GhSCqeNCU6bj59YkdOeX8KdBGOBpwatP/TZJK2ac
	9177VB3b8TygmF9bi1UimgwhtEKdcWTBtRKJRz12VlRJSpL1YHK/pQmef86RcWtc
	38tUF3X7YNflRC3lgBkfu40F1SJyFCeiw/SCXnX3hmBf9CxptNApl0AAezQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h32rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso206073361cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053351; x=1764658151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sl70Xakrk/QWuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=;
        b=Agx0y4+Z6ezwTSohYMnM1Vv8P0ojXc2pl0yqKil6NKMY2b6CIOlLZ+80JU1fdcdbkZ
         Y8Fbx5X1+7xZfDpqkuQs28Y/ZuknHVnL7DM62P7EOYBlgqdsEsvbUjNX2NFWqZwDh7ET
         ThaZrghTxyh/DQgHLhWADaFs4jUl877Khc5IsPmZWV+SHDU+In9TQz1I9b4PyHXaL5qy
         9LkMWUe2EyHRG/10g80BEna7dyGQ6rqXY4sHzHm5cZuQSHQ2194vOdS9856Rkpj6OGQf
         g0P6o90x4tCFcdSYhLCDC58UretjtUkJhEeCecxHa6+jkeJffUVXp/wxuZRuBeUg717a
         Wohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053351; x=1764658151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sl70Xakrk/QWuTVO9HzpUuERYvoGu0ruQzvOAyWXJVA=;
        b=P5mx28nhiZVqGCimX/aat95iNljLJzICnp4pr1w28SwNfA1480X0RihnTIafLhluhf
         mnjLwOR8uwG4xuhbKNjZRUZhXNABBbGIOCntDrOXjSYRzH6M7dj+OL5zcTau5pz0/7Fg
         MM7b9h2hggCE8bMMgZ6ZP4DCTIK3YDUadQ4Z1TPcy0ObyGghqlu3G4uPgcaJ+zlrjaTh
         +zI3FQJNR6miHgN47T3dm6R4+2C+phN/ytT4bNNIKkcu+3OMOM9bA2UYCux16O1uFJ4k
         ovvIGEZjd0IZA96kKaoY7Hjjp4EmoxTz3RqKtbEX/gG3qqIA09+ct1h6s4LRpDJMjPFr
         L9rQ==
X-Gm-Message-State: AOJu0Yz5m/Py8muEoyP8JUe6VwDGvUUoWhliBgn9XkXLZaLNlXNGldun
	Sduqhst5C3upiBirmkjuaIXFDLSWkPcfL0U+ZU88bbuZ8X9y6BMztOJ5DMW1+Fmn1oPBcPJW9IC
	H25mNvuHhqADDOgHOasoCBQUSe5PftKsk1gTFhN4anwnvVn+Yj8Q1A230GFha7frTXCIx
X-Gm-Gg: ASbGncsIJxuxSlrr0G7M3wAc0UIPcer1LUCN/nunxbfUURI1liDc9SV5nzvSrFxNxAy
	79IefUqrMJgKjF0mz72by1GSxMZdQ6Paovhyhq9t27VJ2tCjsF26VFsJZLXvHUaVragoWSBl52U
	Clhh32ArbXcXYdU91u8AzXfc2kTRi+wn1xJItngtzCvyE0BAmw2Swz1l5eOAWbEfaA2aU7lOcww
	j8vE/4rXa7AK8guGwi+GC7ENRSwb/jccqJHnG9c5StzwnLyQVyOvmAP1HVYoJ42vk0sP+EBm1fa
	FFCgr7SmVEXAhXe5QWWkxj4DgB/OCqKFwFHFxp4vxB7BkMUR0YSfspXCkL0j3qrCLoZvu+7+1+i
	6TmdGmtxvDkYVnTAwJI6h3ZcqpFd/3E2BRed+WtvjCpoRjo3xV1esHtgUR90c5iALOiLQSeo=
X-Received: by 2002:a05:622a:98d:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4ee58a446e5mr170268641cf.1.1764053351616;
        Mon, 24 Nov 2025 22:49:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiZgA3RMR7QzcGUxzPh5hdymLOsFNIYBB5TZ/d/l1DFbwPQDvEADrbvlT5d/ZAyusRDJhjzg==
X-Received: by 2002:a05:622a:98d:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4ee58a446e5mr170268461cf.1.1764053351283;
        Mon, 24 Nov 2025 22:49:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:10 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:53 +0800
Message-Id: <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXyVCUHgZPuYas
 7IHaHJvwGibA3edXbLkU+weQEkI5cZS9FXYuvL9fy6arVMVWntd8iLAqWZaiXMVpaajOL5N6fEU
 rIyoab24vdEjysJDrhrKWEwSdn5nCBtHOy0NopGEoFABRXY9j0InAmKW0vPlbhMwInOxCS8lyvs
 BPUC1jU1XA3nB26XbRu2cp5DfiL8vf+S2V098dw9e3KNHvwhKxLNg34mcLgQGMCU3ItnXNFryHU
 BSPPqv5agQ/lkwUCVRZTKQe3D4Uwe3/bCrQi9Rx3NQTmlAjVoyU1cjCpwlanct2EAddgz5Kc9G1
 MqtMrVIKe2P4T17+iLg85M1sz5dTmjq72gzOb4HtEdfCqMUOXiDScM9mLcu9aoAJFgVWHz+4sN0
 rB+LGdOBxyEmbCGlv12EJP7dhsvvEA==
X-Proofpoint-GUID: 7IkrArPhQFHvhbtmxcrfYx6GtXVGkOBj
X-Proofpoint-ORIG-GUID: 7IkrArPhQFHvhbtmxcrfYx6GtXVGkOBj
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=69255168 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=74ENWJKDy3Vb_L2bHi4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..797ef134e081 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
+{
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
@@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_60(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
-- 
2.34.1


