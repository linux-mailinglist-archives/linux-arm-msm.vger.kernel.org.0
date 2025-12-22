Return-Path: <linux-arm-msm+bounces-86209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8ECD59E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33B5B3010E7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01743321B0;
	Mon, 22 Dec 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjWUDFfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB8ep6fL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD3233373B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399099; cv=none; b=id35WDFLTnA6y/nfoDLnFU6S8Fgg2vjOFpG+J3hOXWtiZuKmzLU+1ZfgxfrEzFzkixyPOz335+IvVe4n6U+WqEgyE04YdgJd+C19UihEdbxTGN69yFbJFqRGXAEhQdAR/83EAmRV7BASKLo9HhFy6jK6yX33P8jKkKa1Q4DV6Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399099; c=relaxed/simple;
	bh=ZJngLeEZS0e09bK0MMrDj9e1QjuzlLhQ5avdrX+SFVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I1PhmiIRIbwExXpD6PMLM6O2UcpV5aLcI5d2RLbogz3sFw7aYrxbtCmwYHJYDcyd35p1FgkSf07schrz5nRF7fPJKD82sm29gs3HG/Lw5HbSOj8TWLx4oCVTubVyuqUvqiuoyv0H5yogxw4qyg8m2pfCJ3NstAXe6xphnp4ppaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjWUDFfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KB8ep6fL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8wqDT3962884
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r5yEEbJ1h77
	cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=; b=SjWUDFfQc+mpaVxxFqvCDxq3/qu
	FEXsBPNKY/k3yowBwXnpEW/FCvS79IR+SXEjRW9YgouJvC9UZWMbjiCZlgfQDziz
	kRQIsYgVbdAX6L9zM8c39VM7GHxp2zZcDGDn7kUBuWb0cSd2a8bLd4gzkg+0WqqU
	MAAHgysJkaOxwpy+6tFIPpbwNsJ0k5Y0isRQaJr3DNlj7Wck+VUtuyk03AkFj6mV
	8M/wlBF+nhVMLwAKFubEJU1GIKnbRR76hH3MA1V8P584cBrldNFpV/DOZ4t5gnfa
	ufuHMainpBfED6/Q1asUznXH55sWEf4h/SmGlKhpI9oBGvPNo6rFozDH98g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hcyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:24:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a39993e5fso96524456d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399097; x=1767003897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5yEEbJ1h77cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=;
        b=KB8ep6fLiHBQcaJl9EAP6oao2R6dmyxgIAuJaP7DiUK9rpe/e46dwWvh44NZfqG3Kw
         /2z90KHm0W1oBV7PoxVcQsGEjYVQwoH36yoU+aH21nu5irXAWgQoFpPv9va0BKHOjf+C
         TGceVJw2HNYgIiN5jRNBZjdY19yJwGnXJX1435PRQne9/1YA5zDrhBeZi4YeXU6ieLDI
         TF6cb38wqicv2xuM/+h57kBAZyp+fxQ1EfLiKHPupwIh4OlGavtkqTzNbvT+NQrGPpaH
         ImBKu+xLnnjoKArT2ux8/ZzG8sK8auvlMQvy0xdF3My9tC2mP9Nij7UFWShEug7DKkep
         XMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399097; x=1767003897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5yEEbJ1h77cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=;
        b=lGhDgsRdXXOkpi+JeR8IUAKelwZEpLWGl9Q/VGgmvTOzOWo+IxLbeOdqXwwVNhczun
         M+ILM+4zHxsLw9D5ea1Gwm3XauZJHhtniDh1gi1ZkVYaxh4zLy8cTVpGlyzVHektCCVm
         kKmR4kjnDdsZTTmNBZbmexfC1oVlRo9ICpG+0OqOp0xtkHXWraBTz5LJ//WH+mfehpVH
         uJe36JtHaVWayssQiIYnqw5U2rr5LvlUMCGbfeQ48oLcuEfoRBw7JTvMl9Ba2FNEZGm4
         N9IX9sRq/Ttr5CFliLuU1zYbi7Mnoykvjezfbn3R1iNMNu58cFmtlwDH8uVeP8W5t3FE
         B4XA==
X-Gm-Message-State: AOJu0Yx86yOGHPBQYRwibKx+MQO0N0o782oCFkD5uBCYmf2XblrDkYJj
	XY6S6RQL/vPKeLmhNuMvDnasVQr/u3r17wuGJTqHApjz9MS/Fy6VZ4ZzJDHOPvLPlc+s5kzlrxk
	BVh24PbcMdRRArUaUDMQ4fH3r5+qkf/btOE640Z7bAKmYq6ZUHlFNTtf5mwaOqnhsa1sn
X-Gm-Gg: AY/fxX69av6Bl0kaPU7ijStVrQJWqyD0KahAMQcxF8hxKr5FkxqUBaXhWFr72Ro/OHO
	Pk+Wxq00BElo0xwh8SzDSeb0FdPgXheiZEEPW0z4obx/gmJcjSHRkmoTahvTPEIRdYYxanlswdk
	hANz2TJm/DmmQPU/+o8ONT+bWS2A1jwvDMAwCnGr/CkwkJz+/AXuUt3/aYOUmegmo0fs/4tMly3
	zrdV4Pflh+66g3AOOqUJ8/nHVqU9o1HJKMkgrry5SsJt2ChipJJwLcCkePKBqmFDYcM7iRFF/fM
	4oKn1z9PWTHNfvMiSdMNlZdFOgzyO5IvtjGoFBG8OmqxZrE6r9qjqNd2BLDRzhfU9GjKdZ0QyO8
	riyIUlAcfzKC1T9Fq1ONPw2mTfTRyBp3MQSVKa+E+Iiij6HA0U/cwYgrOLhMn154UvDY=
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id 6a1803df08f44-88d86290b9cmr184689756d6.37.1766399096788;
        Mon, 22 Dec 2025 02:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1CYIqkjr3zp/RkKgn4YLOMNIlAJHmGvQ9whNuk0P5xefXhTdEEm9trZuQpyBGny8zBVJ6wQ==
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id 6a1803df08f44-88d86290b9cmr184689416d6.37.1766399096353;
        Mon, 22 Dec 2025 02:24:56 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:24:56 -0800 (PST)
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
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:54 +0800
Message-Id: <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y_uc-qV-QAvt5iLzygYFp72kd83nzxPQ
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491c79 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX5J8Ph28SeEbR
 HlX7+wlTbawny4zoi61HC3eDD44bU0ivDU9P1sl2cSCBbgajL/ZRqL9FUIsE5fEvucIPEmnkL0K
 HldVo2Uw67rIlpcG4AqPtImcNdxbQtQ6MhJN1jziyTw/8h+UQDMqE0JHk0gd4RijU5M+IIL/fW/
 c/zl9HsgxozpSvS7neL7La9beZmgqmQF6do6+EV920PPxtLNo1pqHiE5iJzpqtc4PoSkEL5Lbio
 XNmeizR9yEeT0qIz8oevLMZnPgxmDOngZN74c7ImrocM9LLR81J0ZOB598zg43uvx9QegVPqUsr
 unmDgwzSfYe36Bs5o/a4SRDxfC1PKGdByAQSqm3GU/XTGpGqRonRnxNlUW9lHjhdipNd7JO8B29
 4diGdqdADKosW57R7kHkX2Tr2WGnV0nAIgfHTiA4zecjWhOe3rXk8Uf580loH9Dmvlv1m8ZjCgT
 rVZqTpR+AZJJoLcDYXg==
X-Proofpoint-GUID: Y_uc-qV-QAvt5iLzygYFp72kd83nzxPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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


