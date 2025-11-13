Return-Path: <linux-arm-msm+bounces-81734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B672BC5A9F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 3E7F4208D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B7B34679C;
	Thu, 13 Nov 2025 23:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThXyaQTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6ebtLN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630832C931
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076739; cv=none; b=VnANE72Jh9PsA8388RgXNA5NXUf3lMpGmKksTcp+9eI5t3NUSHIY9v9D5WnOdPGmy1SanQkmKNzE0ycAy3vhP0XSDgHZ/AadBrSZ/eWqEYfLKk8TITQ+A2DmGFXt+O5XB6oemGzwXt1VX6OZ6Iws7KmZzga8uHcg/20ek2ra5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076739; c=relaxed/simple;
	bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=reVk86Mnfgp71oHGwAzNHWxHQmx11cFbNBNKK4HfpWvXlVn5H0nfLqr42ii8oJxYolGO1cBcgNwkjOYuq0J80UHf+P0TGmdaxyvb8z58qeL+yV9azAMRzJF4VCG46bSRL4jQnUaOXBHXmsFHPy6h2uX1jF/mN2aNSOJtDGTzmNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThXyaQTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6ebtLN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaW181611840
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=ThXyaQTDJPqOcpAb
	1tEkPU6On/laF1l3L7aoaFM6DzJ0yGYot74k9fRZpKoFQ9jOpKf+ce9rvXeL8nXC
	Jl3z7rn14ut8dTx0fKahmsGm6xSazPsfYpmZCsw/J8CqgPizB6jlxTNGOVbwtv3o
	GpgA6+7Id2RZ10O6s9GbGLpPE0IYh/f5F/T79qhql/yUkYl92xyAd9nVpvw/FT/W
	kq9Kw/rN6m0YqrkxiYBGdnddkNctuWrY0WmfZwbamQYVuhOHo867Iil/qJOhs6hG
	fHGf7RKjzmdeHDHtO5h9yooAHvlEGBi/rXyRpnYtuQlKvtbVtmVhBITOsp9ImlN1
	Ww9ijQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9bg484-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f8a2ba9eso34258435ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076736; x=1763681536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=K6ebtLN0hOBZHNWb5G25mz1ZBcxTx+PQIz9Usb6NdFWTJl6+1d7GSOlc+ONYuGB/Xk
         q/V1yoKvgD01Dvsf91dp+TYunqia6uvMnB8iK3Pfbf6KOtJ6mhb/3X/DMRAQISSDKIYl
         nX9bT5BvHlF45zH6pCe5STpWKTSClWmtvRVJfaD6gGUuBdakKs5hJtYjkfdUBvplcnmK
         PkpMhnKDtXWaJyhreX37yp7nLWcFcO7EAfD52O9NH/rvcyTbKDIz0UvvxhIne18lagoU
         rsQO3jGF/T+paCdZ7AxaxoZoxacCuDidYtxIkgvWWj6YT7i8d4tLCcpfPH4UhDpTeMnR
         6bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076736; x=1763681536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=w6ApBR10mpK/Dz/ipcLfZwRP1ehFqVbLzbeiJ3jXhUE11RHDclj/oUCrvLJ/0PYOJ0
         eh1qp1lAMpteC7nB4NhsL8Xcy7RIukUMRPbglmP7u5tQOLcJN1uwB1FbfmtCsSfQBtaw
         73s4FAqp5+P2zVZmf1h083pa5LR8MNQZv8tViDkR7RbSwO5Ec3LZtQUiO+Azpn7z4z/p
         WQgIlP2pl/VgRbbDZR6y6mJ7AfnDFTjmFHWwsSohvVylB/QICUoxQ1kotmmABLpMFXhF
         ko3ZerL5PjdetAAbjV525X05YGbOZYUXrLkANUMoi8lecraxN07y5w7q/xSKkwR0g29M
         xQPg==
X-Gm-Message-State: AOJu0YwlNmSHvav+RRJaoMf5YOlIaxUKtUipF55L8h8AiA0YqOxWpLC7
	zY8kKi8wRkNuXbO8FBRwoZeOvuE2u1c2q4R8hKgbQEGT0WBrLVwW29wBp10fpjLzDiHtAjv3iLi
	rh/dYX9RDAkFARkuXs5xVluRR6MJOdTWK512R6SZnx1Rid9bCmV3u57HUuyr0BMxCs/e6
X-Gm-Gg: ASbGnct9xezlF/Gz2hc1wli+M8jNE8BX+epElEqybeSHllLPtomJYylW25wXJcLveXr
	kTaMaKWbqZ//Nc7WLXxeqnkbfoLaR4FSnAqRXvkOSfqegR8pK8wbETRP+BgsjeRiKTwk3VtqznM
	qxX6mW/O24Dm8iUAUmQp9JquM3Zem6OOnCwPv2/LplroH8kGRq90x5E4J3Dgp1CGVtT2DrsMElN
	Le4OkbJXRgpy3xT1AbUHWRtW12KmRZySDLWgdxhgWXqBHNu9Kzp1GjX4yD/we9YCrPk4Zh1nMsk
	rWm52N9IS2bXT91KoxOayjp77f0bsVU+R15S+b6lPtsLu8AIg+hl4xuuw0OY5JBCCuGCThxlTOq
	L9pXCYnAqKOikps6VrHsg2yo=
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id d9443c01a7336-2986a7435ecmr7356015ad.47.1763076735692;
        Thu, 13 Nov 2025 15:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEodQqYgRJkYLIy60kg92PboSbyAXwzBxQKHsvJ7k9auT4mdj7T3WB7cWTBc3Q78iQHPbKACg==
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id d9443c01a7336-2986a7435ecmr7355695ad.47.1763076735212;
        Thu, 13 Nov 2025 15:32:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:32:14 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:17 +0530
Subject: [PATCH v3 20/20] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-20-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=VcSmbJTK+AwALI8XC93AXkctqWpbKLucIhitRFtg+TnNd7qWT/+mcPon0M8DxlJ+BMR8C3A3A
 P4jrORXACVYDIs9gVsH1RAPyI2NIJ+HFj6zCe6e8XrFttR2KeLzGgOY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=aJz9aL9m c=1 sm=1 tr=0 ts=69166a80 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NANO-2fmacaw7WaYlGCSJkOGyzUKovoH
X-Proofpoint-ORIG-GUID: NANO-2fmacaw7WaYlGCSJkOGyzUKovoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfXy7OZG8DGX1uW
 cFVsVA2T3tZEBrilyc0BMVrBye6Ze5EMjOAQCU7NeYR0rZhFJRHNyAR6UpOJX2NbwdbnAftU2Nl
 jxiTTIAV0NPvWbY4X0mv1cppLjrGgODm89EtmiMalVC8DUnIJGOwH93NoYeKNOsg6XiF3B6Gi7C
 m1dwRro3Brx5iF/nHHyKPdSP2wOF/x19ZKr9Mh803OUi6Y7Luawcp5ZB6B6A3IkZZKfHt6+fj2t
 J2o8fi+2PSudiR8aPREHpLIVaIRcSUHTUpXfXwyqbbmXTybDPtQ+JZWHS4yq8GV9NRepwTi0+cq
 3grTX7LdFxnA27f0pf/byl/2vtUxmei1qu3Yun4B6n52uz1XtJuHvI1HOcsPAaao1NQvtOOhoSv
 t7zOqtYQ3sCLFPo+3PMzbO9ajZVRvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185

Document Adreno X2-85 GMU found in Glymur chipsets in the
dt-binding specification. It is very similar to Adreno 840
GMU with the additional requirement of RSCC HUB clock.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 2ef8fd7e9f52..e32056ae0f5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -327,6 +327,36 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-x285.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
+
   - if:
       properties:
         compatible:

-- 
2.51.0


