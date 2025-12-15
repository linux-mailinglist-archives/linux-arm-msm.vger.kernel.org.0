Return-Path: <linux-arm-msm+bounces-85203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12ACBD01F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60B153043927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA561315D50;
	Mon, 15 Dec 2025 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiUHDZ+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fe3d6Bq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B223329C54
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788031; cv=none; b=Bo/8AqbiahYvu8dmJwgicCF1zyvGqxCNGkGJUX+me6KONk5X3lx6x41y4yN1iQLzEcoGnJbLMNqOQI6diLltsG+IZehmyykF0hFN4e8cbH+7RbJBSM+qYPVeZkTBq6SQj4/bSXiaA2JmCcVcvtCiW/IGKXQ8t8FuDXtzEKGUTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788031; c=relaxed/simple;
	bh=9NEfqZGAspJARqDUStHlgocJrjSmzTYofnsxILM05Aw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TSEjXfkqMSrBu6oYtGHf5Jn/Uyccwah8EjYBwcT97GvdrC0yQvoT8fPvyhOo3as1SC/IknJU0TPwGYyLeTNDLe+8oOj1UVOCuYPF8RsSHBC2QJyOV9sf9hQiLPLwrNE212Qv2ARNq6kRSrnDXqKQ36XHmJ5ghwhgKU8iMWA5xYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiUHDZ+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fe3d6Bq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8W2YG2310080
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T5hormO1Tzm
	iMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=; b=GiUHDZ+3mRxBGRkuHWnuU4KxTRD
	BRMMKpl+1xHry6oADWGSvdPkZvY+rD1NVwqvKuZTscyCSpqC5xzOLNewgDYP6YGy
	iQ61YS19nKRVoG12kW4M0mqs9caEtkDSLBDb9ebB/OAAHNzulM81ShFkmb9NG/gt
	0xvcMsDj9BArDuTlawLA+3w84pP4koFgHsqdE2qB5zmkLa+SsjkES55fSvh4fbi7
	qEVi1Fx7a6i4RwFIAkpzx5HkBhFD+v6eLJkUFK4n8OSY9n3CenOAeOEBCuQ3wQvP
	sh6hzVTwH8iXJrkfWwqGmKowSWerkizyQR7S+iBsnRw3Ysich7vchD9iTNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b1771ucj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee27e24711so60701841cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788028; x=1766392828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5hormO1TzmiMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=;
        b=Fe3d6Bq/nGdR3H+WQFpfZDU3Pv/XmNg48VlvlJ0+eGOZbmre3D00wcm0DufakVzfBM
         brD7SXwq8m6h33A5uxTNl03fwO9TbCP405bivs3PiU1acaPhJvDllqjTWUTqXBjlnoo+
         JPt6R3F7NoMK1iVoEr+9K6WqxoqyRR5RQyruya0/+Yyc8734c9X8R6QBISkgBwHCu0kS
         4L9T0DrJdpE+VOFQQwGuT4oXyEGNYIgRFZrE6pESX0bCB32t2xHp2YcEh3cojL3xUdj2
         PiPwNOkmxVtUVFSZyU2ZhHFJr3P0ahNCK3IIfjGfggEW3u5fFG8mFEf3adnhrARNZkvD
         z6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788028; x=1766392828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5hormO1TzmiMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=;
        b=MGuWyfJFeK3KAA/xZGQpNDe+mff1rNa3Hpd7JJMeRaXXr/akTAfzTg4G0SXa1TecfM
         3QCqALYrZtzLyB21DBxtlwCVIMmW1avBTyY901P3ePeL54Cl6vGknBXJfjFtxRLRgsBG
         9dM6wa5+kCAHhz21VhSet7zuT3lRcihumwZn/51JaHYafD2APGq4U/FBDefqLfczwHkR
         vkaiYYS3HwnHUmHyDU76DLe2bvGH6f8lkLfHjoZ37TqCvMDqpxb/6iNlrpoqFXjPduEr
         eNaANT4wO46EB2u/N0AHF2NoNkZSm6St3PpAwLyR2cLWYRmWOBlMZ9aNHWec16V0eWtI
         XjEA==
X-Gm-Message-State: AOJu0YzodKpi86b+6NcmKorGwjR4DoVYc+EcoCtUkyAOH+IPV889fNqx
	y0dyFXYRKjWBRVIKmy9rDX55ZlyiuTDqG9gfoI+4siJRg8p88FPYB67M8FZbbVXk/dwSGqxxl2p
	hLzouosRvk3fP6LNB6G4A2p3jvvLfuun80AfMGtAcKKx90zv9oZtKvk0zbgzpvnQlAFYd
X-Gm-Gg: AY/fxX4VaRE/1y+ZtN1aAonUSYwWmmrnlADMM9BGyWKh2wDt2851ft6SJOzf3QV5YIa
	ONjr8G37tskW979mivkNUgIvPpm9UT5iRs6Wiar/H22xWGdE5YgnW0uTMfr+FN8AY/30DFGaQCD
	hSGwUIXaBJIh/OxS9RF1+/msn2fuBJkMNLfeqpCKl6vL8IrK9UcCuvEuuHeLPJA0G8Qo7r2Tc01
	USBkWjQ+RUpZT9p2HTZhGtXEgTWVz8tGFd5opiVe8rZ20rww5T8/w9io/aItm9fk0W/ToEvRHi/
	kbIjmZghaAhtELOpMAEHhMnL1O3uKacc61/jYnNM5+LM9xJV42uiHIQ7Ec3a9Pb7aTG1JN0NWeF
	pEdm/RusaBhGwPy8it9+/zP4xiG5Y2HR89rrrhj16o3Pkp3xKTH0/JWHGZHgsiQNGczU=
X-Received: by 2002:a05:622a:4c8d:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f1d049f54bmr115502501cf.8.1765788028599;
        Mon, 15 Dec 2025 00:40:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE21JM+j2xLBWwUMji/MxEsoKpff5aogjPA7lsLdjIGqhs/FRgyL+lLOBLkdvbMHjyrb9e34Q==
X-Received: by 2002:a05:622a:4c8d:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f1d049f54bmr115502311cf.8.1765788028170;
        Mon, 15 Dec 2025 00:40:28 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:27 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:48 +0800
Message-Id: <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q6vfIo2a c=1 sm=1 tr=0 ts=693fc97d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sRsiwY7EFmHr75jNHr8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bUnMK6WSu4H_vs7ycC93_azdbli26zDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX/82S7KUfeUyM
 3BXENWwgpVLmwlrRs+oMzEFqAYGMIbtQvG57ku/3hpKhggcId5R+RPaT5Zd96Dk4YMrhVHofC82
 qS40qKUnNvMejg8NlaWcLuz0yKzhdjCycNt/21ZlacaJYUBQzJ4x2n3mdF44URjYTliV5poRpCQ
 88LOqNSOr+SUWOGxgNyJiuukfoXG5pl79S20By0MArzt323tMRbCAQF0+TLSlGRdIMEPMaZ+irj
 AbftT0LRb0EyZhMQvrp53t1Gw26Zmz/M8H2IJMZZ5NYLO4eqM5P7mT/Yb4rSLIRuM04ZlA2r8dF
 mYNS1uH6c70NHgMrcj0+o5ifafhWO7/K2u/OZZxmfoAhTs/7BOLQCnoLlRY0RAn6BMlSitzS6VU
 QfdMOyMWtMCEAice6OXfo42qwJlZ9Q==
X-Proofpoint-GUID: bUnMK6WSu4H_vs7ycC93_azdbli26zDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150071

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..cd330870a6fb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_5_0)
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
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
@@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
-- 
2.34.1


