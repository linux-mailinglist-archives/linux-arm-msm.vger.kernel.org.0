Return-Path: <linux-arm-msm+bounces-82224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B713C68618
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 89DB62A792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAC532E15A;
	Tue, 18 Nov 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nap4cjrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZdloPBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E83148B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456045; cv=none; b=OW0e/ftCoFo48APBehtYQEKOsbA2mXhRhSDm1bIgU7lhZRJCbS3hiMkBLmPLYeVj5yyvHasoozodazKpbJciUmohjRHKq5GssMKa4QqIXNwFYrzjg/5F1QXdw4O6Fb838V8rH9AVn8XJ0BzAVHRby7xNeerR7mkxAKIYtsPLOIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456045; c=relaxed/simple;
	bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRGO66XHjGRn6fl1Fz1i35+0CnAEaXxJE5ooc+MywryzO1APzWbuyUMCDFrhpkeYOrxNHEQ61FwUPFuD42Qs2JZWvp028vny63WSNAC0/Nes7TgCNyu8gI3GLWGpA9vouXUhtqsMgGsg6wIZZnYx+wXKXmFSn4+L94gTYypY/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nap4cjrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZdloPBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5kHxo4108388
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=nap4cjrQxREJ+aqK
	PMnvSbH2enVOsFMEJyhgwLWy24fFoEzavVDEgPpIkfjN8F9f/ZYSFxZgNbUB2EtM
	EUp2seF+tODO4xhwSfP3i/+/OFYSo7wc2lKhgoLEqnzXButwH+S78fcnjAI2JbYD
	Nv+il9pNolq6yf5W6DMSFVFSD3Xd+kLSAsx4SP3vQsMWqrX+EC0XDq7L37gJOmae
	gYcxjJnbNc9fha9vY1R4XLiTENeHb1ZUMZTXMf5VZg/6QI4XM13sbQCSdrEDsN9B
	obQcXXwVJB73dvRA9L7/boItF8/sbLgEBYlf/R6FJ363KSh5I0eQoOvSTzygwvQZ
	O0wyUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpbdbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:54:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dfae179bso133303545ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456041; x=1764060841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=hZdloPBd3r1nxhWVXBW01DWMgCDkb7O0AWzn5dc2DxpCy17Bl9ahxznwI6Pvp9xnVe
         zvwab1Z4UfK2GZq1CVDftocRm6a7uRjk/yP9e30NttwUAJGNShg83wrmyCa/g/74ly6f
         HgOjEJMfwxFjc7XTjLq5/7ltaauheHN4M4SWv9WHH9zIxtyqlRgyCKO7LEYoFV9cY1Ar
         ECyDrSMrSluLIF0usizKMITZ1/IkP6NGsunU4UglG8SbXUm/KdkRjU1vkSoVJ5Z9JuKs
         RyGJ/8geZkY7OoEqA59ShVqIib6ZJ9O2fWj3AVHy5WI7bWmL1IwqmZGbzdRfNz/llZwx
         jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456041; x=1764060841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=uxlB/qXbEbW5vNY/sTWtsHgIx2e73sqQwYsnpaQ2l5T9zVcmuzrZWFIFszNudyW7Yi
         LyTW6XBLTy4zElc/a+5S3Ny2/vKhlDn1+gZybQ6F4e7i+M/zA+iZEpSPT65KPP2DXXJg
         wF5WsnKi/3yD9fX+J5dFfZhAiNK8c/26r377qC9L9m+ecuZrE3Gfr64+xfy8HMQTrLbX
         GsohcmEzN4yoeI3YPNxul6oukJ+gXMmtxqmviMn/qBoX8IRshOTsszVkohy4Q7DkrLiy
         wv0gUel9/GuI9R1AjS8WpXVn/Fu9I3Ei59Yxrh8nDMxuDuxrYkyXlqWo5SNjBcoHigO0
         7x2Q==
X-Gm-Message-State: AOJu0YweQM+9YJyu63KtqCax0TEqd/mZozlA4+Cfeh/izVwti1cnkVfE
	mYIrGjNe37sxKkScSHgWyReSxA8oM5OHyBwCMrn8bz6RemcAKPhCPFEqXD2UJMrzaWlBg4GcCDw
	//Thb6bm9xzxZeB7WhTGPEEM2lBu4MuvwslGgSjSgzGyVOcKdBf71Xgn3TzR/Xheu0Whs
X-Gm-Gg: ASbGncsQ9X5YH6zbrnvxk7FyxTgDHyAkAym0w23RuIdd9uvRAncSh8+b7WIaPRsoX+0
	CJYVgCUk0Qsw3g+F7/IpCLbE2jTWdRnTTOR5hEAUS8y+ervlwD6ZWSh8TsvXznSmdfdUMkEd78e
	a3dwwypzGcUSTmek1F4lSXPGTX28WzVfDdh6ByX1vHWZS+p8DQs9EN9vC8pM4KjCiXhCA4kmiu4
	iFSz0GJhx8DQslnGFvsbwT1G/BEvHcG1Q3sojoDDTHnZyglae4pqfbJ+A1FXRkpU6OVd0pGEwfQ
	IFx2drZ92ixj6bAMGzZAsNpXtnfLWmavUJEpEIORQV5wxvZ8hqxPIjwRFU+UOIGX7m06cHx6Tgz
	OwrJ8gFKl1y927UuH2RyYgq8=
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id d9443c01a7336-2986a7435cfmr202036315ad.48.1763456040670;
        Tue, 18 Nov 2025 00:54:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfC5w5rOHD0/xHuLdWAeU6V8QfxoC4sF9cyqENeOkg8O/0IIShO5Ep+df4JjWBBzLhi9J5rg==
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id d9443c01a7336-2986a7435cfmr202035865ad.48.1763456040119;
        Tue, 18 Nov 2025 00:54:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:48 +0530
Subject: [PATCH v4 21/22] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-21-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=zvvisBZ9CDm655u/GMKAP2PN/vQQB431xxPZEb3DHkoURhax7xrlKi9CfUl8Bnj4wPgFckzyS
 rVSm5NWKKI0C2AxbhYwWPl9F7iIfqVGVFQNNrX2VVi4eTv0FFh7U6BD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: qYzqXup74XWLJBrangvGdQSbjY-yEKp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX/vfvBLr4obVI
 4zC09PfwmdeuZU3OUtYx/haDJkXvN7SdcTYeKuUQHeYdWTh2nhKRiLqgwWMgkuLKKTw8li+ooQp
 ZcRtXOHn9uxcxyJOWsWBmYJSgZEiUStOzQnFfDmlbYUI3uum5GfcPIadYFbV4M52fVuMBbV0aRW
 PIBlauqFllTAc7uHn8M9tNaUj3WpU0N/5FTO8QrHPYVA25h8UqjRwxJwQvyIMzsQk3bspclUMZR
 6rS4/KfEzNyYuv9HCKpo5Ya7am5g1XgrE4zfosQfE5rbcvdCBMC3X3tQDFdM16vXRptEe1hji69
 baVU51S7hw/69LBVjmgWprpRp5Wyqtx1n+RBB3ub5VUYaNJfGXCGp/h73lRqkYiH9Egr2BkYcz+
 S7sv5kzJQdtMiMMl/wp4r357A7wmZg==
X-Proofpoint-ORIG-GUID: qYzqXup74XWLJBrangvGdQSbjY-yEKp1
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691c3429 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

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


