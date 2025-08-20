Return-Path: <linux-arm-msm+bounces-69937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92467B2D8DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49B731624FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4280D2E0413;
	Wed, 20 Aug 2025 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY+ninO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55382E3391
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682642; cv=none; b=VVj386V5qIqc9ObOifJi7dYPdNlI++IItCbUy5eb+ulpXi84wMw6IlY0mug91eqzt5lmJ7fJgQipfUQE9iZr5OdrrpqwOvp76EqMVZUqbPufGglXmOlh7B4M+IqYxJ1IvrmI+vJWvgolY/rzqsmi31z68HVISZe1W6LBsWQPtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682642; c=relaxed/simple;
	bh=CUfovqe+BoyUTI1U5egPOGaqwOCo/lDF47XuEnGpvAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGWNaGJ+3E0HBPMT1FvcL8Rj+tC6GbGXi/stKEneUYtvBxRf2pR+Qaf7d+Tre/MZylSLHQrYdWh030zxMc9c4OtixIlrBRy3BcumbwKN3YqYg6yCQQ8UHoAe3bDYf7O/nDqmYWyBQ19Qp2CYJyxT28vU/O+17rUoTJajVB12duI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY+ninO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2RP027085
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uegs61kuvy/Ef2awv7oKRsWNlD6GJZeqQNqXJ5q3U3M=; b=LY+ninO3vDfwnTNS
	iZjusYM8bZZqcMtUChWT6lnXtWwt6+iBwVD9G89Aji+m6/uLUHLgsOtg/jxnpnts
	60AikWkmIWnpIZ70WP/2V6Und2ObG+r/DHOXhC9zyvNZvWCcdqqmzeCm15FFxVFn
	16PmSrZt5/iniYvy//bz0FtufRjQAryPirXPtRqNE3zxdLe07bR2ynP2R9QCEmet
	E5PLwoDQpGtwF5JHX6Z4tF37+zbdPaPH+v9uvj+i3Xu++UHJ0gZaJatW/VGzFiRb
	FuS51o3taH9RRzuKwjElP0iOhY7mRd5Moo+cijOOSgH6bauAlb0jlWb1xzEpqRiX
	F7rUqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a9834-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:37:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-324e4dd1237so102184a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682639; x=1756287439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uegs61kuvy/Ef2awv7oKRsWNlD6GJZeqQNqXJ5q3U3M=;
        b=QQVVFqRpOFhVQPbw1n2RRlrOWPs22fvoz5/5E50LkK+Knr39HqNx/VsMNSujhjasVL
         8HVS/PHa2Q03OZ5HW9Z/nUJqy9Rcw3Zs2Qhgb8jb7a2nZv9sMgr6Y43iR3KNzROVcOCg
         S8Xp46P/lYvLyK1KV13Y2RUI0Z1ZOSZY6k3fFpR8zIEdbxwpQW3M9i8/sNcJTNHJj4+V
         0ra0sEOJCSGov65C4tkjOskjwEZ73WhVaNCmS0+twbHeb/Gt1dHbt30ImIhicxyiIh/b
         8nsxpVfOTtBdSFrLqQubtP6VJkIRitd3IVH2NCtLMjBN6JPrOOC9GgL2Zj5cBp+vh099
         7E0Q==
X-Gm-Message-State: AOJu0Ywxlo8vpAluCMwwjx8C/+fmSGO29/aIM1SG0/YpOXoth9eZ6IMY
	bGcyqBYfzVCEuxsHBMXwr060FBHRvQybVRF2JDIMUJ01gjq9LvOciyw0TTYtMkD/a3QPnaDakN2
	8m72c/wWW2Aiak/XgwegyEMOx/kcPQjIbVds83+fBtw021bYLkqJmOQ0Xo8tB16RSNg5r
X-Gm-Gg: ASbGncsqBHXMMIlbp9KYHmzeWSMDuhWRVaj64JIfx14rAv+eeuvU3goNhXar45TBGf/
	tE1H1087r7WomrYaO4NjuiLJiCgQ44CmkG7FjWmcjrHYe0pJdx8IGuq6DlQKQm2pnQbHJXXo1yn
	MGZAx4xSa65c8/MS56h/4Ghstl5BA1X6ofnHrsMeqFSY7JXFmdGAQeAwLwSf5Rn8qBDeviFhuJS
	ZPlAmyqqTFnHLNAiZQmKhLSo7Sgq+nZoNefQAir+bJm+TSvbf41dWfly1pXAFCnQaNa8mC9J8xs
	WX2o+I2QL5Zyz8+aVqDZJmZLiFZMG1YS1ZCStNUpSLEVLceIRpq+GYtlRRPN6Rwvw61YQ7o8o4V
	3LhwiEMlc9FGmOXe08RflhNqijIPRwesBcQb42yFnyyOuAPqMswmD6ifS
X-Received: by 2002:a17:902:ce83:b0:240:4cf6:b07b with SMTP id d9443c01a7336-245ef27aae4mr14851345ad.9.1755682639077;
        Wed, 20 Aug 2025 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhfCvj2U0FsjX6+7/r+e6YXxU+CPkEer/Hg5wGnIICikJE5F8McukYclnXK8JpsF9sBJac1g==
X-Received: by 2002:a17:902:ce83:b0:240:4cf6:b07b with SMTP id d9443c01a7336-245ef27aae4mr14851125ad.9.1755682638604;
        Wed, 20 Aug 2025 02:37:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:37:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:55 +0800
Subject: [PATCH v3 13/14] drm/msm/dp: Add DisplayPort support for sm6150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-13-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=1316;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=CUfovqe+BoyUTI1U5egPOGaqwOCo/lDF47XuEnGpvAs=;
 b=ekFdgiw2VFgvGPY0u++RuMC/OoE30pi/c4ArAK4euKoOaQd5xA/773GbG8DDKJIfnJZNmKkAa
 ++LEXlx15JPA4vl5eGl1FhBay0hnnzF2X25zr4Rxgu8ALm78V7VObo/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: pWxSZLkGu6Z2dCjfCSyqs6zGfDiwBgdm
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a59750 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=V_msf0f7WKJAu9UcZZMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pWxSZLkGu6Z2dCjfCSyqs6zGfDiwBgdm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6ZdAN96dDrDB
 CI+9agdS2mVKzgsSqQwm45kJDdT4LvacJk/A7IT0jvLINcCRYhixWEoaluTV3IccMD2nK8PVz+S
 nkLorU8PD68Q54QVmg5pvFK85fEt5j0QrV8S3dt98/MlN97lV/3MAqV/KfLMpMBOYB9ZatEk274
 XSagIpr81oFYlNph8UHZ5CQOJ+YlOC/CfeZm+HCqRjU2MIrjxF2YdX+xogR4bMe+Dfkwt+vFV9X
 t9NskRzXJ3pRRF4b6PGAbUNwCueyVXPLvG3IxOmcTa1Co7Ww73dfkW3A6ajJe5HWy2JNx/jqnD1
 CoWJ6+CVXzUwtsU1B4HZM8DRymuFhFHtbdNOtOEgP3y78qbg2NFmf2BQqDlc/S+DzPm+Yks7gg0
 Ls8ufLddeWKxgn9pDatuEJqW041mgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for SM6150 DisplayPort controller, which shares base offset
and configuration with SC7180. While SM6150 lacks some SC7180 features
(e.g. HBR3), current msm_dp_desc_sc7180 data is sufficient. Listing it
explicitly ensures future compatibility.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
+	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.34.1


