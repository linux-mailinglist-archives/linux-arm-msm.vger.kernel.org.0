Return-Path: <linux-arm-msm+bounces-86560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF8CDC0CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2613300AFCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E9931AA9E;
	Wed, 24 Dec 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgoaKCA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdJViQXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B1A31A561
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573632; cv=none; b=i5ljRkIfckFdxOgUVthVfpqiSXDU2MSUx9Ed5bWxW9tVcfO0R2ouKZ270Shaed37UQUdNOK7ixpraah7hDiiFcHoik9ma1dZcKgOUx8HgWTQrnTdwt58Yom/VTG4BuCMEb/Tb1pgmHtlNV5J0+XWqZPrM1YpMtReM98IaxHiTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573632; c=relaxed/simple;
	bh=2itzp5Me8KCm4wDk0c8WCgo+rJvV4Ir6J9SaNy5gByE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2rBKdP4fcBcshzCZDcd9b+xK3SzpTtMEr26cNEvg9OiZk4TgP1SfSIFCC5JvXHcC9T4iFGi42tUmU6IANVqDpAV9vvfYeMuUeVrdMcvkaeJWwt59l0LV6lG4DK+2nr8njHHQxlU8DHZt6pR7S/6aKM9gIYmYIEAwwnILzwyXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgoaKCA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdJViQXm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3ASrl913445
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUEk8+imaWpqVm7FWfHPYemNpfkMDwtBIiNTxavoxlE=; b=CgoaKCA94ePw+UKL
	myGNpF/1AJWyBIhgjY56YvHr1Lbup1cbeOprAmZ18owkeirocUlqnB+jk6qsYTGY
	mv1yQD1tUh+4maMpes0PMZNlCr2KR6eHq14Db4MCgLh2vBoaYr5OmmV2Ss+N9xln
	sv4oqBxfb6ncegvl40mphyGjFLnrTY19qlcGvsdAcnz1mGm5wXz0DFhQPaIfIgGu
	DNEcOLgYdOKJqbjyBlOb/gTghM8DEv2ZqpYQZkLY/nDz5xJSFZgxpXl1gdWwyIYA
	fqGe7ggq5z8eQ3aqPra/PQaa18P28fCzXg1P7wv42jrsFBylHpOfJO3o02nZ9xSc
	C5vozQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2jyp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso100963531cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573629; x=1767178429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUEk8+imaWpqVm7FWfHPYemNpfkMDwtBIiNTxavoxlE=;
        b=kdJViQXm4K5DVXazsm3a6e3ChKmUSy9F5yotnE+RejnW9+DYDnTTwyqrqRy8FSZMJr
         DQFK2zkyIQ42SX8rfRvpHiZabWWL98W2qKH6ATC+N7dF1UuUEulWZ7WNd9uLXStK+00j
         AoSBPrvHyqnA7hQEYbo8tm4A1yi1+ZCcsZ8ULKC8b0G+oACvyq2XpQ0ZW0YOUXMrSC+1
         +25lQVolHwGZh0uNgzRVNa6qC7R+lkt7i3bC8PmmniiV6hYx0/oovilivb1SeeBuVdvw
         gIxB2dxeC7uEjFF4M6UrBbEXaLqMyOrzoAtMkv9e6G1cWK6E8Kyh/I1ICBkilNQpk4RZ
         F34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573629; x=1767178429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUEk8+imaWpqVm7FWfHPYemNpfkMDwtBIiNTxavoxlE=;
        b=evrlZnlhqLjaZUy5zVbOwsayWaKLsxII93syi+g5kSjtM1hoP52VnvhEOR4qnnyB8x
         Zboo6oyWXxYaBIJu6cra1QZtphRMAdhGXRiyAhb1dk4WWkB3/nmYpNCSX2XZ/9dhKgl6
         5daegeUZiZOX2L4rtSQqPvAVCcEvpxAp8u+ynfwPQQGxEhQS/8ASAdKJwoBLMQ/+GU0L
         aJGkgcDSN1JcLiEEuuu8ny9sEyqeW+CH04QKYA4R+NEdBoRpfghG/HlXb2bA8JKv0KNd
         0p9pBt1sqfeJBEGNT7JRIrKkxF+l0Qe8le6rDCdvmtF+1yAb4fe9Ytu3Ag7Z7IvugFll
         jDvA==
X-Forwarded-Encrypted: i=1; AJvYcCU9X3RLwJiiLGkgXguravJgbXW7FRxc9bfHZd8mwiV7CIpowc+NKelHLsZ3Zf4rhQqrdtzSZ6p+XBVDXHUB@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcRcatS8z7Nd0gsL+75xWpoZormoRfYZOsC5NiSZG+VkcohZm
	/s3zzGhFiSwvCTR7FVdRyRWmAqZ2yyXdSQ/e164ABwZHgnrM8vcUni6V4kWWOUy/XeL/EnwqxRs
	V7nBtDTHI74kRDEFIlae3WlbY5qrO5CVbA6LZoOdmfec2eIfn2izAxGkRWtfN0rywNDA3
X-Gm-Gg: AY/fxX6RX4cK8gDTN0fvxYmqWuBUD9ppATcRoTLQBljhXN6E1PwPrAeR1fjzPXKc7+Y
	o+i4WFA5oS7z5bt9qZTGf3fncTYT1vIeUsUrmF/6Drnadl+WaP8STz28UYxGalVgj+iHUGJ4X7H
	c8xqRWwWSxtdLqgCkO7eZmK3kUGaZOffmCLSfu8vM066Onr1WCN40AuGHlXYW8huOt8vSO1Kjkp
	FFRIpfg2bPGv9gEx75j/3o/9kOCtqN9FWG0yB3Gxl/oRWTvX4A8JOpu4px0aDe4meGcVxzK/TjL
	1P7p0A257JC/9Mo8jJBJJDPylZMo1Zs9L3LHNzJFaW+REF2l69BZr5fknyZCR+3cqzUFt6AfPmo
	TPfWi4K+lZ5EEuTk=
X-Received: by 2002:a05:622a:190a:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4f4abdef53amr258486121cf.80.1766573628732;
        Wed, 24 Dec 2025 02:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOA2TrTt3Y5Yxhu2gzHGVIVp1sBaU/3OkerIWR4tWgNUNp5QoeJ798knCt9F7yBPv2aHBA7A==
X-Received: by 2002:a05:622a:190a:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4f4abdef53amr258485851cf.80.1766573628268;
        Wed, 24 Dec 2025 02:53:48 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab86cesm1737562566b.19.2025.12.24.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:53:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:53:27 +0200
Subject: [PATCH RESEND v5 1/3] dt-bindings: phy: qcom-edp: Add missing
 clock for X Elite
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-missing-refclk-v5-1-3f45d349b5ac@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QrTjRJ8nYr9W6PrQlc/hk+jiJqNSvuKkuj99rkGdvAk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8Y07FYpe5du9vHER+Ym7O1WVf4E+/pH9ssJe
 C592AUFTEKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvGNAAKCRAbX0TJAJUV
 VvUsEACwiVci0YOxDy/aKhNSSkugMJ50g32aB3/YY75XR3PF9Ts7qM6Nox75klK/54Rblt5W/uh
 YlgZcdbn4bEk+OYaCuNtZFN4PnoJHRqWisLTp53jKDVKFQBTepE5BoU7IED/8V7QtCoYWEiSNVp
 1XfjePDDG2Z1LwanG6NN3NqVXeS1cwAveOIR/fCH3ANx4+N8LVm5WTNvCxelf4pugpzfQn/Ksd5
 EE5rkx/UNw74zMqk1xbd7T4VeWVhhV/QvnLHIYROp8cLEzX0zljRHdi2kEFSdyiLZH9FhIN9V3F
 VkHQfZeYuTVegHXZnikINHMl6dHQ9rl8qyMubsGqyYz6Ss1aOSMg1mMVA+nwYRKmpBDgVmJ4i4p
 BS/LuamWSOBlKeFsLCnG73WVwy7Ld856t7eVkLxaPYswyOrMBD6PBc0RdohtFvhn5x9l66m5ALn
 kGKyE1tz2KL8cagudV2tBvJaRg1b7NPUVGFAlcwmAza9EaSmLWCZ1aSI3sFwVBkjBndXRwwJCTM
 g3NCvPW9CEMjID4HuHHdYKSLfbougUg60iXPl2bkTon4SIAc+h9UsxOlaA0yvu5AiW0Ms7dcgGE
 c3+/H4nYN/wTVbyKOkgx7oOt4TzG5KCCKLxaLEe5eDbqe/XjPoAnEruskQmetsg6R+3FT50dXAr
 enAlRRk4ht4RhmA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NCBTYWx0ZWRfX9SLVN+q0YdOI
 IzQwZBrIlgdoXV87o8GG38Q+NlQ8azWvF7CaUerNKrl1koczbC1WrDT4RcSj+6rUpfdDrzfhMWe
 rP9cU2GltJBI7kw8xNqjnvmhI5ATHflgU96v/pEvS3Il4xvKuyEPrxm7EV8BMgwNmaJbkgW2XlU
 cIWfR0VfWps0TzAw76Q1DA+l+LFbJx67SIS3wkgzChRmcEoGVYhSUfTvbFrd4BeG2gqVZaWJSdC
 ABOHsi2PSQR0CDS03e75XTfqL4LF7xuawGkwzXAGyTP/H6WyENrRbfyL4smhRHH9c1ekUAcuILc
 oehEYJo7UFO9810Qil9N7AAeUJ39n/Rd8LB+LxxwH13m8EZqQ6XF3gx9c8ysYRxHvg3vs94cj5D
 nADiKFrM5fFpA5dAMCfceahg9sOndmB+9n+/tTnv94hJmIcrkUaUgCnsyURmq8p8p9IicF4xZXN
 bmahNDIFGSGqjZwSwyA==
X-Proofpoint-GUID: m5KnjjrwDRIWmEc-pbz73TG22yu8u_rL
X-Proofpoint-ORIG-GUID: m5KnjjrwDRIWmEc-pbz73TG22yu8u_rL
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bc63d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=tBDzFmnqMxbdcKwNnfgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240094

From: Abel Vesa <abel.vesa@linaro.org>

On X Elite platform, the eDP PHY uses one more clock called ref.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So attach the this ref clock to the PHY.

Cc: stable@vger.kernel.org # v6.10
Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index eb97181cbb95..bfc4d75f50ff 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -37,12 +37,15 @@ properties:
       - description: PLL register block
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: aux
       - const: cfg_ahb
+      - const: ref
 
   "#clock-cells":
     const: 1
@@ -64,6 +67,29 @@ required:
   - "#clock-cells"
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1e80100-dp-phy
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          minItems: 3
+          maxItems: 3
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.48.1


