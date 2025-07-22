Return-Path: <linux-arm-msm+bounces-65996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E6B0D2C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9241E5608DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD712C3257;
	Tue, 22 Jul 2025 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA2DS2cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0682C17B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168969; cv=none; b=e79ZLhVq+FrO9XJgCvW0EAaBMuhW3MLp7bwPGObrqTFTpMbMFg61HNRKDI3twdyi8DhEx0lwp//7fn6ji7AVfxdlBIkGoja3FOjBAOa5Y9pRhKvN8UCBBPv8P6uB6Yf+9ieDt4ixhVXa0bWeeUmeba2z9dPnZkhRA3CqmHHQK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168969; c=relaxed/simple;
	bh=71nsNROW8nOruef5bHMWdW3ozXU/NjQImv6aKmL0T24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrSQscbXUSzVgPxkKlwXXIW5O4uccVgk9yMdjNV5oKx+zkGGGF6d8fcf7sA5WLXr6YcO2zWjU3scL7pSR4H/q4dsv5LWbGRdp2tFjme2d7OBmbvANkoXYiQ/g+gtoUjuCoHEOc5h/U5uJN5CTGQtJPUPlp9XMMnSy4tIgjjpVFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA2DS2cn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4djME016432
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95HJf98jrYhdOK50h5t/HTsn+deQ8bx6DN868zwIVWU=; b=jA2DS2cnWB8l7V+7
	ogovGQRFNcB+J1U2DHnr6lCDgPuP+LaiSlHoY9OGragpXdHErAz5aooOIGibHDz7
	lAxWJCWTqQVC9Fy4lIVdLmzs7AeNn4qZ6dMDJu5LahAW3WMrtU6zykcMOJu3e9ye
	YnnG2YS0+AHnYDN8V1rDbU8WAC427KpQ/znWKBfUhnoRGrdP9z1E0DwwmPjsjlGn
	g0WK5/4Dh2bR0x6Nq3PjEyY5SPi71obxzceQpxdnremrXZkrG7ij7lhgJlZbWltG
	F7Dq9usQPg2ntgfCtsggjoyMfyIbrna6HZwrCZCrnASStYPSCbSajRAzBALJ9cWn
	AcEWrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451ga7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234c56afe28so1456435ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168965; x=1753773765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95HJf98jrYhdOK50h5t/HTsn+deQ8bx6DN868zwIVWU=;
        b=dixlzYMQmNLZO2GBp/ybMXKaReEIg6dpGm6ut+9zlIDjJ130LRDYvpFRJrnRWop2CR
         X5blKiCChl54hmfYWXw5xCfyT3soThKLmkppC58sp5PbgK5glvt+4Nq9m8sdYazh/8wv
         jjz1wpCmxaXAsFhHmYTPA7+bfNSb/8+ezsMg18djjEfubcNGRxDitqZsKn+GihEL7z92
         75YuA+zKGJQAEDTtQHYCDtDqhBhItMH3Wy0hQig24QLyJ2NX1zqlrRu1nxEjAJ5ad+cZ
         61RJ0LWzuRQ+n3pP9ecp8PmqzctbT18vqa11rBU5d6esZ16xpNHwb39nIhzjSrD+GD55
         sB+A==
X-Gm-Message-State: AOJu0YxrkJ0+n2zyNT3FP6EFiFz02SI8tPmHdi1NMgXEjPBV9RwSo/y4
	vo4c5WZzFn/JbcVjyehTWlTgFGqOLGML+lIs73nbr89+2fBpHEHynZRhTQaUQjSq3I8+Zzx2buW
	LOdqo0CGQYMwpvj7XhKlmeEgFByk7qRvd0j55975b4wXESWo4P4ycgv+TlhU0MqlX95EV
X-Gm-Gg: ASbGncs6OUurenK5+25r8K3cU/8zkk7PWkSXiArW+BjjHYovVCLTPwOO9cBH/n9YqFr
	bWh8ojm+4eG09zKljcKnLaX8q7RCyVzNdulpsWXVPjPNACxezfpcXovMCm7erfVyYO05gLBTgFt
	P1r8vMJzkbo3cSsfCol1v4W7f9rW+6Qh1YlBceapN7guy9O0zbu7+myafDfNogNqSckivq/3bqe
	7mjymdZmIcCjo1mcyDBuDX+wWwMXC62PXS+iwB6fnrBc7bmvKOVWgPylgI1pYrCblhv/nQ0SA1l
	vPeEufsWW+tmJYeb1X0sskM7/f9d/koOQk4wPZryix6GZMVeWhqNMzPiBcekYR1FmOlj6ZTra1w
	oi1jd6Ybj0xJbLo395/oJUj8rHLn58q483EENGIVEpAlDRkYUztahgcR6
X-Received: by 2002:a17:902:f547:b0:234:ba37:87a3 with SMTP id d9443c01a7336-23e24ecc5bdmr132166365ad.3.1753168965177;
        Tue, 22 Jul 2025 00:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG70wgcxv2Og+kPKUjYru/eTK2MCHabUKt0QBDH4BfkImjNq4j8b/P4oRqYxZYzHj6XtGxz9w==
X-Received: by 2002:a17:902:f547:b0:234:ba37:87a3 with SMTP id d9443c01a7336-23e24ecc5bdmr132166155ad.3.1753168964744;
        Tue, 22 Jul 2025 00:22:44 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:22:44 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:04 +0800
Subject: [PATCH v2 03/13] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support dual TCSR registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-3-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=2537;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=71nsNROW8nOruef5bHMWdW3ozXU/NjQImv6aKmL0T24=;
 b=dLa0B1WM5pUjkW4SwnkHpZoEZpTLwSATWGvvZEls9+EyqvaTXc0lRt/0UyqWmrJRqq5wLe/z9
 j/MpgPhJxb5CZpHDFqsNvkHX+TzWVnCqfLppugMnbDEfKk+5I/8/cZX
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f3c46 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=nxDEYaoXc1MktuKintAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: aFzvEaIQGMPLS27lWbr4-zKA0C_ymTob
X-Proofpoint-GUID: aFzvEaIQGMPLS27lWbr4-zKA0C_ymTob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXxY2u+7n6Ol5a
 RhPlRomvKvJfS+SjXjSoWl8R6GR5k+QyjFdyvD1MioH6Qbo3AH6xu3Or8RdG8+L9vBIPaxw9GF8
 4nfTHSi8lbQ0SYetw0+6lOvgCGdYjVHRkuY8EaZ0maXIf1k8+PI68/YhtzOdxZbFeObU9DtsN4R
 uXss4zfipwD4hO2iKV9aHyZY7Wv0+AoKyELxY0OM8ebZZmYuNqI57RrgArTMmIb7SqYfQSCPjtO
 TGSVRmSrmh2YfmMvFvvqKHg1QhuvzmwgBn3ybCfYe7waupYeVlDO/L9wjL+HfjFsroHSVKpP5OD
 DAxhymkHp9UICzmtrmjtgX7Hm3aG2c5pSt0ujWkVruHa8YgWS/XuzOvHX3nUa/wBxhuLBaTlUVN
 +FhlZLHBrxvgEawboB+MK8HWjDpIIrWgSZ4Dwb+LQHW0BaOQUFDeGak5n6jhfo7Yl1S+gvWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059

Add support for specifying two TCSR register addresses in the
qcom,tcsr-reg property to enable DP-only mode switching. This change
maintains backward compatibility with the original single-register
format.

Also update #clock-cells and #phy-cells to <1> to support clock and PHY
provider interfaces, respectively. This is required for platforms that
consume the PHY clock and select PHY mode dynamically.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe535c430fdf792b33a5e9c523de323b..badfc46cda6c3a128688ac63b00d97dc2ba742d6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -44,13 +44,21 @@ properties:
   vdda-pll-supply: true
 
   "#clock-cells":
-    const: 0
+    oneOf:
+      - description: Set to 0 for legacy platforms without clock provider
+        const: 0
+      - description: Set to 1 to expose PHY pipe clock.
+        const: 1
 
   clock-output-names:
     maxItems: 1
 
   "#phy-cells":
-    const: 0
+    oneOf:
+      - description: Set to 0 for legacy platforms
+        const: 0
+      - description: Set to 1 to supports mode selection (e.g. USB/DP)
+        const: 1
 
   orientation-switch:
     description:
@@ -59,11 +67,19 @@ properties:
 
   qcom,tcsr-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
+    description: Clamp and PHY mode register present in the TCSR
+    oneOf:
+      - items:
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the VLS CLAMP register
       - items:
-          - description: phandle to TCSR hardware block
-          - description: offset of the VLS CLAMP register
-    description: Clamp register present in the TCSR
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the VLS CLAMP register
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the DP PHY mode register
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.34.1


