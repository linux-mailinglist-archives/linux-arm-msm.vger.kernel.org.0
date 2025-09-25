Return-Path: <linux-arm-msm+bounces-74841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF5B9CEFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FA1327FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDFE2DC329;
	Thu, 25 Sep 2025 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSWa39dH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1ED2D8396
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761560; cv=none; b=ticSQnzM+3ivEqLTt8BZl28OFh+EspvLmEyj7p46TL7GxYRsL2eVYgnHq9o1L0B7mtg7wdLV+6oZ+WW5mym2+YcMIUBFxhKcL1yjcehUGsyDEi/KTKvDQVC2v5vyyEHZ9VHcpBTa0XiuqyhliRaDIuRwQ7Q2sQTRhaoIYePPkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761560; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XtxJRDB6HXNN1XSYFe/lnKt1NBFNVhFZlTzAybqJVioFsYO4r3Z69dCX9NbJnYniIC+jPiQ1W71viPOpBgpQBdpltNNFSMcNmHHNb5hyQJsaBG0V2DRdaRUc/h/vr8uNcngZlQJIsnls8odYybcNO7ooD6K+DO1G5q3Ax6qaH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSWa39dH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODTo3v029717
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=FSWa39dHzVr5D1x7oDJ1YZOq1NR
	kqC4z3QlZD4ysF3as5fPvv/NXIKMrPywjeMZbY0nbZQSfgazk1HfpAT8TSwIK6KD
	kmI9zgYXBqwa457Mrrzk0xS1Z3KOT7GvopGTikzmBkLl1oRWyRzMXAQerbek79my
	OEqrxDnX8b1+MRoemETvUc9wrFGay82wkKOZOzlTenaqd6bD12A5IHM/n6JfXdIW
	SEAaifaeNf4hJWjC1hx2XQs01fAebtceiybHFljzC2J7F98+XLd906ndR4JBzy6k
	lIvsityAVOhvII5tP4Iw8XtTOV+nwtzjINiWt2MkDCG/gt8b8dYCpNG6pKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fp3k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27c36902f42so2655565ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761557; x=1759366357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=grjT6SrsvaVB/NAAe8BRYzK7gQ3HsLezJJfKJ33Ljh4GZsI+lsN6BSd+QLMs/hzph/
         82JAwfzZiBZ0OIvbosSi+BumqUhqIq9Uj/N9pyqXnYb9LNy0+NmfBG5S/7FqAhwmKwSC
         pgc1jmYKZlqFFj6jm9I/RmkPi2bixnLTaWsatWusxdTS9xPZS9tvvY4po4VrhWXolhvQ
         7vKvT38g3GAQ88wSsUF3ahw0hIeiQYUs6C3oZD2Aw70AVR24gpyydfDhM5399F11jC/L
         KZ0NlXJVleJsMPKPgKfDWi1VvLtlrQwhGQxpOwWtLUU3hxI2JmQS2dSiZMgUz2/CIpVo
         8FAQ==
X-Gm-Message-State: AOJu0YyV/aYLRTBdDOiRxiAWeRndvi4Z9iapUaiFuD1cLRUH6Skecy72
	RpPtZj6gLfA+vC+yaM4F8Y+HNxIcAynK3h/e6xothwHXoDs22XYaPfLdB5cRHYMo36dmxFyom0y
	tIG4PbjE5GHe0AqLbz8SPimul9x4sedi1yzqhHpUVaukgoIWZfRrNOFJJhkRMhoXmjhVQ
X-Gm-Gg: ASbGncv+WVeL6qqhktIDN52dtjMnCp4QcQ3B8buBiTkORw66YcRoW+eAHnJBSuGUs5b
	GnXY2GCZ10N29FO9f3gfmPdAE8BbSZymgB87teS4Z3VOFN2pKuzLepWp70lZ/VH9JqpWFLYvrO3
	z7uMqrKivNOWqXL1tAa3M8tOsLFEMdaEftknpvrUMSqnRAj/uod2J/dkljnBszpP6ns3NFo7tyE
	NT8xYveWY/rhaKYbIE0KPZlTZzS3RAFyTjRRYw+USd6rcW/WjMSw3TMSp6LrLX2BwSAFEPfJD8w
	2bUOnQSl8olnl7SefkX4rrMjbN00Q9ExoOlap3cKTftquSiKg5/qzdGx45VJ9tdMD49Yed+X//w
	BcViqiBUDh8a3PGY8
X-Received: by 2002:a17:903:1a06:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-27ed4adeeedmr12621385ad.53.1758761556913;
        Wed, 24 Sep 2025 17:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkdWp6F5xl7z3+kp7g4Jtt7h4BtMeBXJCqbB57Ib1mwFswvS7CDTGv4fLa3p0hqGsMWqWbYg==
X-Received: by 2002:a17:903:1a06:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-27ed4adeeedmr12621135ad.53.1758761556419;
        Wed, 24 Sep 2025 17:52:36 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Wed, 24 Sep 2025 17:52:21 -0700
Message-Id: <20250925005228.4035927-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 05Feuw5Eb5nnKyogpu9M9nV8qYAC1qy3
X-Proofpoint-GUID: 05Feuw5Eb5nnKyogpu9M9nV8qYAC1qy3
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d49255 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXwjPbga/KCKHq
 lDj+EsUDUBWK/OixxrLZPdzTqtNQaLmxZWbL+tTxJrGB7e/a1sppFXLJuCBIQ+5tOXp4+GQAG+t
 jQYzTkHzrfOOopoEXTGRpJvZZJa9K+UQKs1jzdXcR+Zw/0n26aPHJQDQqlvTnhmQ2pJGNKUSzx8
 jLwmvrAiAeNqFhbUHdF9wgpum6LOfIJfCq+t84EWWKTGKvzh+kltH3/2Almgk2Gm4kgsRRQbC+4
 ch5o8xGdzx/u7lA0o2r23LoIdhA8r6onsxupYJRO/CMN36awe5yKXXM6QPc2E8Gvcr/pgTrsJ2+
 9auWPGRgvMHYfftUlgvmnds1vKjEwExAfOxVwhHfZFO0i5ifLrcnOtawnQPwZG50Uu7ymmdJsTE
 nOxMf1j3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..0d5db71e0ad8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1
@@ -53,12 +56,20 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8750-m31-eusb2-phy
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

