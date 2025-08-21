Return-Path: <linux-arm-msm+bounces-70046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C0B2EC27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAE697BC4B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 03:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7090D2E03F1;
	Thu, 21 Aug 2025 03:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPtQrzy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BB2C21DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747457; cv=none; b=lw0YNGZ9GuDg+pmnpzsY/TRH+837FjY1qQVXT1cD/refkwjivtqypqlfh+NM8ONbCpw4TrvEf7qdcRujbZyOmGy2oKs9A1RFCPzkjhTbswG7oeFoE9AJnGCiif6ymijyWuAH41x6Ftyk16nGP9qhv74ZzBvB2p2AnF/xOYyelrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747457; c=relaxed/simple;
	bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQuH4cbacsRdOqu2GVmcFw7wHuEECqU8i20C7nwZy6Kw2UbSQ2i4oaoVT9lilirZw4Mz3/00sSLmLCaCLd1AA+rN4ToQKXdQyP9yMOJAFA44EPLdV4KLFlO5cpw4QFJQ9Hj2kwiNXiCbR0k3pTePsV/0claD6Z+x9VuGP6euNZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPtQrzy8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KK5jcr031245
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=GPtQrzy8TIOYTIc9
	Vc74+YztRre+8yF1n0QVmxru+2H6j0GHXcc6EKQv8BDktJXRJ6saZkvOgGIsuB31
	tsp9fmJB2Rlsx8TlE0L23A3wUVkAnvCDUfHMcLYx8QNPymDV0PI/vGePJ8Y1tERE
	fiVSRRVbvZYxMKmgX5jK/CoqqZ0JEBOuUPetF1KDNkJWqUROrbghNoN10UsOHyzz
	VG6kVgX3skmArO55dEouE78l/SyVmCIR8PETcGnf4CikN8EGMqLLAq5gwRBIVts8
	/a5BTcuXQ3bQtFRq1HZwQ+D3n7qL1J6fgP8K/PF1yfIzXd1PISvhFGyN84Xomyyb
	S8i0LA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dkshf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47173ae6easo974679a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 20:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755747453; x=1756352253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
        b=TDjtEeixOtNxno/hPlMmgX85PbNFfvlRy3dsJNIExqCQa9Yg/61w5//FunosFQitIH
         kwkxN56xV/UFrRL7UVcKJcLvgwi5QKJmowFfniAlIemmeuYU7zJVcSJ4mklKO/c/3MzM
         uWYc0Qpqvky4JFkWGjajMF/9nQ3UeR0Nk13JGnrZIu8Q81B7RQAaaLMfT47YeKpboSy8
         nQaNvodhDzETs0PEdcgoyyNtEDpvZ5hdVgmE8xRDhGPEgBVjicVu0sUBvIaL+isRY89R
         0SaiPNdB0rdQmSBIODhQDZoadZFcwc4ZKC6NfulYw389h9hRONvLl3eF/HljWmfn9D7p
         Gg0Q==
X-Gm-Message-State: AOJu0YxIIhXSPPFUnTAsoaXMYTs7G39onP/VL6e0Cwj5o+IsLDcga/b9
	hYr7efN0uG8PSssczsOh6VItEW2GLrXtKLyHu4Zwd40LfHPoGw6qURIAC0004kQvu3X6Y4ujIDa
	Bz/2rUMFY3rSHoB3Pl1qIdIny0NJlwdSwNQxXZsZHCjeTnbbcVVEEKUdwV3yRz7ztc23/
X-Gm-Gg: ASbGncucSix6lDzI7qtkeQxjP3D35zZs15ygi7WD23Czx/Euoi7nL/g1JkFASvVTGiJ
	hOiV5ve0YNuJm0eWJZuN00Gc4PtXCPFFQg13FmNcSoCef7wT/jMBS1d0fwjya4/qdk0W3LVYhLa
	1yL5VEDeMWBIC0cXDyycEf75dyFv5H/XVp4XKsZ/jHo8vU0pGoKKGohHgkMvOYa3cdfgHAXMFys
	SLZwb1qhf2TWZfyTZ0dk4jtjfEri1ZIZyOtNMIER/aTtM5clI05w0XUW9lk/VCjvRHPP10fby68
	+USVAGfpNf4EGYk56GMMRtwWBJPd+Mq2nYm0KN50eg7UdKNRrT1hyof9nNsxhhXVrIYVYkU=
X-Received: by 2002:a05:6a20:7343:b0:240:6dc:9164 with SMTP id adf61e73a8af0-2433089e19dmr1159856637.15.1755747453475;
        Wed, 20 Aug 2025 20:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi4mGJZ5wAX9bpRLqAWGzqaPdfb8se3vOWiYgqadgqnAUMN/U4mRyTaYFAwyX37dTnizeIeA==
X-Received: by 2002:a05:6a20:7343:b0:240:6dc:9164 with SMTP id adf61e73a8af0-2433089e19dmr1159817637.15.1755747453048;
        Wed, 20 Aug 2025 20:37:33 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:37:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:36:01 +0800
Subject: [PATCH v8 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-6-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747404; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=9nEXtJyTvuvPoQMKa9vJn8WmfjXRNxEFGH4TAyQUtRSsAGs8a/pirBy7epfxNHUOJ6F3AyD4s
 mxQRny+F73nB+a5BUu1ybLK0EPA9/GcvDWqt7ON6vzsbdDND+MNtPmS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyfn6xl/PbaU3
 uUmXLBFwNqueoddK0IvD7Ie99uoL+BvU9AGd9nT+9XiR4z9f1yqMjChebvtC/6YbelsCCPxJBnL
 cOKv20kogbXgqMdtqPu8+XpXF1f2pWiILRGXtRB+PoTYHbGFLM6yxfmIJAqzHeQDpMmCm40S9tH
 18PWjtuoYQP10FKPG9tdr/DDg0oi/za6R80ZoHDmlm5kyILjFYXQoEBGosNJWnbyZKspRzwZJIN
 rMPaGtewiOBvOhPEnNAw0dr2gpxEBBtcAf7aFJRcwtcIMz0oW1s3nRWtgd9H8t6iDBIMGGWt2EE
 QIZrDbMTayxCH2genSjDolZHGzRDe3u43q6XaioTOdF511SwgaSZno1qU+lpIU/OL7S7RUk1sHO
 rRJibQfAkD2vVP5Ty/9GYuAn5yto8A==
X-Proofpoint-ORIG-GUID: Wf4uacVw2pszfgkfqBJO74YeBwOv1037
X-Proofpoint-GUID: Wf4uacVw2pszfgkfqBJO74YeBwOv1037
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6947e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1


