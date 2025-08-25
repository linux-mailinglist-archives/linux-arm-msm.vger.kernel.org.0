Return-Path: <linux-arm-msm+bounces-70544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E104DB334C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C88D420572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5338927F183;
	Mon, 25 Aug 2025 03:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGgDr/Fz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55F27F00A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092981; cv=none; b=U96aZsGVE5MiHxDTlWS5N47cmJB05LHX2mu7d5fnLa9Q+o/xhTWQQ9WqfRKu6nDZbPUN9Sz3p5GP1wP8E5Ei4JHAQo3e6SKflu5DnGucx7MLwgmf+ziXtPNU0YCxGYrgQEqbs+qQLo4TnGtRyCkJd2+jvWRBNCm5+gnRA+zWYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092981; c=relaxed/simple;
	bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTscLRtN8kFbdMWWd1PJ9y4EbEnbjzWpc8fHqdmCSuCJ36RvNr+NcNk9NffK4sTm1VOwpbJjxUj/mICU3qf53URsUIApbcvcyvK+PmIdZ0N64HGjW4Voac8wChWd7nBmy87RYA6a5+nnKoBiVb3bD6gh2cQvlItVol5UqyOIodM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGgDr/Fz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMuhh9026431
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=pGgDr/Fz3Upj9d+I
	At0CdDfKw777H8QMjqQCBobmuLqKx+uNxEtgVEHKcwfFRS7BV8ezxeX6Yci6r9Fq
	NmyNYzh+kIrNMNtV3Amcyp343N1OPnFk+oSJGDlOQqTm5iu7SL//qTbvWU0mucvN
	1Ja5TsExp3z5vqtLS9ygTrR6yPdS+4rxwwbzI/9/3jiCDWRPQDHFrHiw3qS50eAc
	n4c5oFlmPnGeuOK46EGE1S+Aychkxpvk+l4iqNIO2oys6eZ0SS2NNgtiiqYlO1po
	m5A4M0PmBR43xwbmlA0P1pZKgYX/uwGMihjnDSc8fDHPj1Kr3qFJjP7QuxXnTA14
	rkQ5hQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de3hwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581c62faso48964245ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 20:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092977; x=1756697777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
        b=kEDu+oVDLzsb9mtSG9CffBfr8V3wxazhyDZWnL72RaGwW0EupXhCSxN3n1POBgOzPP
         4uTMb/hrHSwLrRARG9px3Mmn44g7XDsrva/POEA+aCIfbDOjDhJnlOUaiT1LIXAdJT19
         eOhM5VgEkSDgaNGo0YoT/6K+hIWwJATEOqYHyrbZzfjyyx3elm5o8CShScdZ7rPQ8H8m
         8VVx3IECEOhyhVSEtVWOyJCqpGGb3gAf4BnRoDYyYh1YyEQh02YOxXa3ZdGLk7aIZ+Gu
         SIZ2sWqiDAY1sPBEW/JgAvUTV6S+b7u/VeRjjA703DZMkcMcb4ac4KhY6myhlayJMmDR
         IE+w==
X-Gm-Message-State: AOJu0YxiIqoe8/dTYvwBJPo3OwqXBsALTkLQbcfAT8DH275BpqaUuIIc
	w1H4L7NQrmA+4wmRcZptnAwqDRi9TFnzP9XE+8LZDP1Hw6+maeOmvY7S9YvRfzGeJ8Glf69HbPi
	o+D9GAOX9QOzBDlF3sHSt2QJflARAccRWBsI/HLSB/4yASHGEe2u6B5zfxPpEjVhrlRLl
X-Gm-Gg: ASbGncu3kqv37lMjeEILb90PVDA87GYyz4t2UMw8s2KgsgiasCu0CPNXh6/81JJ8roW
	632aZoic6ddUXBWQOKeCkUICph90VfdV7qdKgVWml2L6clQ+9atr3gR5UgOcLJeBWAxmu/E+ghf
	bh/uIwhhSUGcCtZLjLRTDMnQZMv3jARFoATZLdt2uh9Vu9lkweG3nKzcidlWVHdx6qWNXo/yN5B
	6dvNqc+GXS2s0rXERi6gjtK+pH5qikoaWvHHPLuO6CJtLtShkEHhxVWAMqe3lMY8538yjDK1MB9
	pakLj0wwY6wgnm97oQ/hy7qJfSxWKZbVXbnD/AwThl4umPLUEKdp+nxCChlqap8ldAIhIXU=
X-Received: by 2002:a17:902:c94c:b0:246:1c6a:7026 with SMTP id d9443c01a7336-2462ef5fceemr147015105ad.40.1756092977431;
        Sun, 24 Aug 2025 20:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUHF1EOpueF6zxgZFcVMl7eVaFCuRiBqihrB66vAAoQ0pqCcjvsZWuWh8z1BidLoA1l+DrmA==
X-Received: by 2002:a17:902:c94c:b0:246:1c6a:7026 with SMTP id d9443c01a7336-2462ef5fceemr147014785ad.40.1756092976954;
        Sun, 24 Aug 2025 20:36:16 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:36:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:25 +0800
Subject: [PATCH v9 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-6-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092927; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=+HddgfRGfsccGRo6kGLEJNIBQn6m5wNdaACaxKf7tyrPNIGgvaclwhJLOqcbQW5QheaYxKVIC
 zxQVvicexOkAOWG5myMhf6iDOKDelASLJfIQjhcr7u8lGqcq2fdmsdi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX6rHt5tmV031n
 YcntHFf+Ec4EfQ72ajylyBDCimiBmM5NylODAYzi4dkwJsFRljLzb2cuCQMRbSmbkaPTa6L4Yrf
 t26pJhndHvAXdqJ0FoVbUFyw7f95lSUQ3NTfUdhCGQJwoRaQf9u5Alf4SxMkFEc/+bSUHGB+PWJ
 NKvzLv30GU0fx5rVIDPp0I8EOPs+/U/73sH/Il+w6QN/3MGWPtyxmSK/tMAiOumRwK5VH4Y0ZHr
 BZOfWXxWEZ+M+p0OdKVvfgvbOvg0FeciZ+HLXuyx1TB+9jG+UpkqkohfPUbYkSCRKy/Ri8sFFdD
 D5q5OprQUSFvzZqCRC4qNOkResXRHJvwAV4UPJomegIV2/v68sYIdVJYkK4w4NOEUazuBstoA0o
 NuBRAWbU
X-Proofpoint-ORIG-GUID: 5oiPU923oOlZ0KaZweWYRBx2_GtWfqQe
X-Proofpoint-GUID: 5oiPU923oOlZ0KaZweWYRBx2_GtWfqQe
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68abda32 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

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


