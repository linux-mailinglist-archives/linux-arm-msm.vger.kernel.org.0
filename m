Return-Path: <linux-arm-msm+bounces-71191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C11FCB3ADC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E47CC1C83251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AF62D0606;
	Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0dy2w/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D992BE63D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421306; cv=none; b=vBJ6rECMcwVS+XM4nZIMahvQuyjNd0SOYe/oeOPPFglf6ifQvnTmTZkbc4p4L9A9NL6C99sn8Ky10ioSw1AZ3QzRbpKhaO/Ta5S9e9gPxCezrL7C0xUWEY1U/XYHI/hvrWCFmN3GxtOsDkt3dgqmZsWxJmIsTS0PkPUMQ9j0J6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421306; c=relaxed/simple;
	bh=/sz4uD15qfpeXM2kvdoyrlAbCsNzt6KQNu1t0VjLU08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PksddldE2u5QIl2hZKfuLksLhonhFiHkcxzeHgE4OvNG5f6pscnB27NT35oeFxnfTrvXRYFBCzxZXiB3Qylwd1VbmN7Gou30wmto7sEc/j2FrqjAjhNhQaF2+nw2ElSnFgaS5gtCgKjuBwIHav7NdVJFK87nDXj8Hom7ceol6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0dy2w/A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWbqk013486
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4xG6gxGmUBVptNQ0Jx0EnSCowy9k6fTDk5k4/UIYcY=; b=p0dy2w/AdUiCNHf8
	3UWigGUTlIHNV0HeKwUGM09SoLtV5C11mc+2F9eEjurw63RC6FNozXI2wNylIyuP
	PA1xlK5lClKyOJ0Xkn5TCdK0z++9nr0Bs5Vdrp4O3L/VFGdcLjBvLmklws9q3RVj
	Q67ZWtiyAp0uDquksHPJspV1+zAJGKtqXY0zVaZU6EpLN1RIrnxAwZUUIkWhRC/o
	uR0qvU+60rYyVDNqwcECSCjdvTTWPtpduPB96+v6yowcUiTUS3Rj+sz6N6Yx/5G1
	QBfxguQG1ew7YGLS+Vi4mC1XXGmMC8QqcinP3F7duSYHEcVBZ6Vk1YWiFXBXmPya
	5ChdDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ssqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109c7e901so31784171cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421303; x=1757026103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4xG6gxGmUBVptNQ0Jx0EnSCowy9k6fTDk5k4/UIYcY=;
        b=d4NbCiHv4AHho3wvxGVi+6mJ23fx0RHzh+kBLj8TWfz04EaMNNr4I7xAMZgsM95SUn
         dlo9Hh4GNNQbtnFv6sEZKeG7FGU5FqYdnK1UpYFQp5HoWkVQYgIWteCVb9n8prqMnR7O
         sk3GsBLbOkBfKxobcBmKNiiCg9MVa38oKX6B/aofHU4iQt05gmgg4Wk/Faken8omzy89
         R6CxNWlqtrN9wnBW8mm8x6ZgZBmgbTBergfbSioSGI4L8clblfdZen+pZGvqNh2GwLmM
         GA5UBHIiJPI13HYUt4D9K9oZ5EMJ49yUKLZRQbI7s2wFLf0FDyzkJZQWdoA9+so+5Fo1
         d8eQ==
X-Gm-Message-State: AOJu0YwxXnn/Ar2XAZer8zT/K2I8VHJp5iY64B6xJHoUdKuKbHc5ocnH
	eDl4ypWooTw1ZAz+YwVvVohEiCvdr60lI7fcNMcpcph8OoKgKH5AlMcBdHPka0O2VKSX+kfgYvK
	L0bV8YrS2IinT6kVVXhC4zJsN1Negw1RDuUZbCHpgiXu0GhSmEErc5YvLCvvgMa63Sfan
X-Gm-Gg: ASbGnctXsPHme6LRxqH+tY60vFSpAtBPQeaUSQNtR0/mPYj617QcPjj2iNdyaJiWg0K
	luRrWhe6FbLVXECHGWKL9Zr7W05wYyxzIKbKp4bf93SgAOeAH0g5VuBDCmNmW2lQr6inbHGNikN
	IucPD1HOS1c8g9p1Zi86a7XNljRUEGoBgDNOtgKJSaUSUSOAbcGGvO8VEUVMA8qrje/uxCK59cH
	9fTDJ5jgGl83kIeWQCvj2YZZxd5r3LQNALRLN6EYz+z2rbDBJLIDNtNHOVlQpcrfxokdiunkoix
	5P/5TZMLkHiIkOzyezft8MPWzciT2+IIrBXoCPcgCKEeGmvRw5LgzTF97o/bNwtF2qZ+K1U1Vtm
	MzOq47e8XScE4krsyvgj9pQJTwvx32rVy6fxXnX3hotTiu6RxxoRB
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id d75a77b69052e-4b2d6071a31mr191750451cf.37.1756421303033;
        Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7cyyzQ3Kf4dK4/z65Oa9WK91ZkCYZL6Cr2V249eIGzQpvoHtsFVnZjw8wzQhViVcb/WTnA==
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id d75a77b69052e-4b2d6071a31mr191750081cf.37.1756421302572;
        Thu, 28 Aug 2025 15:48:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:15 +0300
Subject: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/sz4uD15qfpeXM2kvdoyrlAbCsNzt6KQNu1t0VjLU08=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNywp4OsQT1E4CJI1lZdVPf8echcYqGySBx5O
 omJr8Mg9UaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1TRxB/907NXfImpQV/stpw3mpwD+8toHKtrEP65UViVPZgbNaFMVOcWCWXVHtfd/38lF6hBoYeL
 +qI0rggASaXPpb+9wEmSjOc5GicpROgbZrQkHOeJ/qq1MYvUDUWV8tWLv32DXyB0SjMIXAwrznp
 ploOqrU7WPiFUvV9zd6xH7/UXx8JV1CLp7qzP5KVFDcv5Oi3fVgsf0udNb1ve37U9e1kzxI8FYl
 oqOkdADnlSv6Ldurd2msJ3zek8xyUST8a6zPGMsXCfNLCzneUl6TxseK0Zn9TIa81DB8RPhGTb7
 GCR/SxpE+Uy6qAwBeCdAfLCt1Y1c8u9NaYgdAtoPoy3hHv1G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX14mFGZHvKQTT
 4j4DY3YRZJ4jtSK/Ay8412Vd4NaPnB1ZMuKeJSmySQEGV4+0n0DMiCfCpMX29WKBQ9mNMFCiyG0
 JFFLRrmxX3XexIaI5gqMVMVsP9sxn+/+os+4hT53243KDPiAx1T2CmVIcnJFLky3fmu+mY0xEGH
 GDQr1IZleKaahJS5FPULc9gPwAYGOunOFaZTFwGJnFuHhU8S+IkqRPBUAzrW5HoFZhOBmhp+1ks
 DafLJ3bOOd6umnMlEomPAjPm8G7D5Mv0kwBMLAqmvAL/iYkUy/zW724CCPr/UKYJqFNl6Jhiq2N
 Vez0QZLnbtfIShctedmoTNX+J+cXH61mmTXg5QGHk5MPSwnyJoWiX8kEkENaglELYBBYNgkL/I0
 q0EE2lbU
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b0dcb8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MC5GR9oWvUQqojeRwHkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cSj67zPpyMwhwqf7nCpJA2u_IpWbP__P
X-Proofpoint-ORIG-GUID: cSj67zPpyMwhwqf7nCpJA2u_IpWbP__P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

The SM6350 doesn't have MST support, as such it is not compatible with
the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
(which belongs to the same generation and also doesn't have MST
support).

Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,13 +31,25 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
-              - qcom,sar2130p-dp
               - qcom,sm6350-dp
+          - const: qcom,sc7180-dp
+
+      # deprecated entry for compatibility with old DT
+      - items:
+          - enum:
+              - qcom,sm6350-dp
+          - const: qcom,sm8350-dp
+        deprecated: true
+
+      - items:
+          - enum:
+              - qcom,sar2130p-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+
       - items:
           - enum:
               - qcom,sm8750-dp

-- 
2.47.2


