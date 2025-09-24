Return-Path: <linux-arm-msm+bounces-74757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B3B9C9E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4A59382B76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899B82BF011;
	Wed, 24 Sep 2025 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phhJzxyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAFA202960
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756919; cv=none; b=uBPi0wE+y9IsrMvwzSJen9fwYswBUAlHOWJBJE46tOyZE/QvSMiW3dZXjM6KHCxoRTqEro/+MR644Wqa3S14Hp1VLtmCV/fxaUUf2T5PD4HoGBUcgaIc5ui0IySRgZr4hFSrzcTtuLQhaZdjjd2b3ZQge+o2jkY/97hRlMmYfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756919; c=relaxed/simple;
	bh=hU4ophAaEAd6H7eRZm1uuGkEAXFGtcDMUcpBkxQVHUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0IlU2gdnf9OZipx2D0FDSRUvnElqWtgy2WpOW6k+X6V9EhBF72etdTb02rpVb/DgJBISIr4WnyFYAbnPuNCzm0Ex56TOq+ea0RmvlpWfwCpajTgkO7+XNYEERBtcWeykfs/K+eiZ5R8qagZZngDyxV0J1q8NBsrmLBSHnGxeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phhJzxyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OChZe5021646
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWqICJbVMy0RpODDALIty+rOGzCBRBu0xbDRo92ujfQ=; b=phhJzxywA9wrOq6t
	Cyty256UpxzAYkUiVTu9ZbneuG3pkOZBj+WsJ24fsAo5XF1pvHzwRqPRNi/nlJOU
	2xOzZaUSGo46reGxoTJ3VT2mp+76HBDPrMrdQjJbzUZJ8pA9HIDlKxAPiGbVrdMG
	9xXRxdPOPbe8QE8jJCZtGceKkgrI19Pnol1BlQyb6/Z7lq4zN0V58BFbFod81WOQ
	zjMx9d6VBrAEE6TXIa7LYQJBULY6DdsDPUtXoHvoit9/Qzk7YN6k0skexPLc1Y7W
	1Rtx1XarO7FBQUeGscxGHDazh4Hgn9S/kji3+y6d5mo+zw+OkgkUBD1amkYlialb
	rQTqPw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadkr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f29f473a2so284516b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756909; x=1759361709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWqICJbVMy0RpODDALIty+rOGzCBRBu0xbDRo92ujfQ=;
        b=ehwBOwl1NhiJqNywYy2ZWGlgccQFQnAb2ZRA3BZWLPLZU+JJJ6wr08fddjOaWl+tvT
         3L5FZWoFtAHkt2d149ggXCJUTfbXndzh58OLDNOhvLY0qVZnCugg9PMGnjRkswwmVTVM
         0iU/J1aetk1wPWZPjNFOdZhVDoFZT+PmJXANBl8iEg+49YYNYonF9RlwD1BF2iuxpwLo
         Dy0SsHzQus8VSGGD3eNqPS2BwJYlbq6I/37O7dTpKVX0uXe9AvR1iqCBarJLaH8h3VDi
         FyGz0YAcFQp54yQqSlo4roDw0P150ecuBMZkcJxHIVvBv9B0wUxf8fwOauzXSpOYMCLT
         7ylw==
X-Gm-Message-State: AOJu0YzaNeTZu/fymP2lE/kG/bj3QN9tS+llU1d70lniAXVSFb8II3wW
	eOviqtfw2JSetgSd6sZZbRL02J/STtDqOElWtZl9SjMCNmEKbd8MDwFGkz9DNm/TgeH6EDZx1yX
	6+P1qxFR0vVFqDYEzO7M9liqSkatiQHStYW2gQmznN7FbodvgVP1j8hObXeoAWaqkDGVf
X-Gm-Gg: ASbGncubDKytbLSaOQf7rBKI5t4qOV/uiSXzhnpXESnVDxcp+xSwx140A7GgjiVvvQu
	MewibErVHl2LbV0UgUSnejYODEaceFBvGybNquvBwKWQH4UUXA112SJy0BXXErjyHDcAzgoSXY6
	22BcmefnknqB84EJUv7fW5xDqQ+xzhB2IrCfLSR2IgcbU//02QycrlQUjjET2EQCiVjUuPxuyNB
	Vns6wer9lxmJjdtMYACeqFAknzTvhkxI6dFj2NgAq4KIYzZqxX1j9EQpzl7U+IQ1Tc7lO64z/U/
	6gwhOch6GJ8UGUk03Xcop4rHYxJGhizDZR4CB3PqWLNQJa5WXKOHgwi6PhzQDfgn7vUh5/3oOl0
	r9/Pfb7ezVyZztQA=
X-Received: by 2002:a05:6a20:1588:b0:2d5:e559:d24b with SMTP id adf61e73a8af0-2e7cdda1022mr1646283637.32.1758756908652;
        Wed, 24 Sep 2025 16:35:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiJ/zMalK4Rfhi+KRWDxvhLRY72fdHDoPyo5I/09BwNd98hpdC08x8DXI7JsGifufRFFlfPg==
X-Received: by 2002:a05:6a20:1588:b0:2d5:e559:d24b with SMTP id adf61e73a8af0-2e7cdda1022mr1646245637.32.1758756908189;
        Wed, 24 Sep 2025 16:35:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:54 -0700
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Kaanapali QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-1-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=3174;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=KM21eRPw1BjO3tWglGr4aBncFUF2vQ3eFtUu9OugNJA=;
 b=zFJE8FT4iTnf2yqujsSkjV8dmDKm55xtIEX4wmJa8Y4mo4yvYckHXkpnIkbGaFnepoNyTcSZB
 PXaiYpG0fohCy3P3qBf6UPHN4u46CRHhqcgVPyUghKrv90jmiWpQKXi
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: Sh0Ck1tGGMb8QkiFPCO8v5htDVZUfEv_
X-Proofpoint-ORIG-GUID: Sh0Ck1tGGMb8QkiFPCO8v5htDVZUfEv_
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d48033 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2IkYd7TCTIqYiAcLhPQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX3cCpbRtoi1Re
 VH61b1eu4NsuM7G2JEuvzDy1h8yKtP3h/RX8bCve5pIHL1JsRoMUkQNHYvdTBASNVoSFSNKYi40
 lF3/7vgV0/ucfy/g1eyKYOoi8gguC9+5I6VRPLPfvTZylVhEuowEWXq1AXqheSmUET3volAhpwy
 V9UhY7YCoNKfF1OcxazsZk1VYoWaZbDHq0nHY10jozWwLRgn5baUuUAznwQT44l3VKSjtdDWfri
 5Q6SveNTowv0Q4zrW8+5uS6/VFRfDWklMDa3BDHH1sNTM6af5nBsGiyLCcle2Tke0O3vfO5rNda
 nbE+zxPjbImYKGDvSdM7CDPTakM3QffSq12qlKvxnOfOgaOjkQgHUDxV6s0J1/tgKtIHdCdPU1/
 LcJR3cql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>

Document QMP combo PHY for Kaanapali. Use fallback to indicate the
compatibility of the QMP PHY on the Kaanapali with that on the SM8750.

Signed-off-by: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 54 ++++++++++++----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..8fa919ea3318 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,22 +15,27 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sar2130p-qmp-usb3-dp-phy
-      - qcom,sc7180-qmp-usb3-dp-phy
-      - qcom,sc7280-qmp-usb3-dp-phy
-      - qcom,sc8180x-qmp-usb3-dp-phy
-      - qcom,sc8280xp-qmp-usb43dp-phy
-      - qcom,sdm845-qmp-usb3-dp-phy
-      - qcom,sm6350-qmp-usb3-dp-phy
-      - qcom,sm8150-qmp-usb3-dp-phy
-      - qcom,sm8250-qmp-usb3-dp-phy
-      - qcom,sm8350-qmp-usb3-dp-phy
-      - qcom,sm8450-qmp-usb3-dp-phy
-      - qcom,sm8550-qmp-usb3-dp-phy
-      - qcom,sm8650-qmp-usb3-dp-phy
-      - qcom,sm8750-qmp-usb3-dp-phy
-      - qcom,x1e80100-qmp-usb3-dp-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-qmp-usb3-dp-phy
+          - const: qcom,sm8750-qmp-usb3-dp-phy
+      - enum:
+          - qcom,sar2130p-qmp-usb3-dp-phy
+          - qcom,sc7180-qmp-usb3-dp-phy
+          - qcom,sc7280-qmp-usb3-dp-phy
+          - qcom,sc8180x-qmp-usb3-dp-phy
+          - qcom,sc8280xp-qmp-usb43dp-phy
+          - qcom,sdm845-qmp-usb3-dp-phy
+          - qcom,sm6350-qmp-usb3-dp-phy
+          - qcom,sm8150-qmp-usb3-dp-phy
+          - qcom,sm8250-qmp-usb3-dp-phy
+          - qcom,sm8350-qmp-usb3-dp-phy
+          - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8550-qmp-usb3-dp-phy
+          - qcom,sm8650-qmp-usb3-dp-phy
+          - qcom,sm8750-qmp-usb3-dp-phy
+          - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -127,14 +132,15 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sar2130p-qmp-usb3-dp-phy
-            - qcom,sc8280xp-qmp-usb43dp-phy
-            - qcom,sm6350-qmp-usb3-dp-phy
-            - qcom,sm8550-qmp-usb3-dp-phy
-            - qcom,sm8650-qmp-usb3-dp-phy
-            - qcom,sm8750-qmp-usb3-dp-phy
-            - qcom,x1e80100-qmp-usb3-dp-phy
+          contains:
+            enum:
+              - qcom,sar2130p-qmp-usb3-dp-phy
+              - qcom,sc8280xp-qmp-usb43dp-phy
+              - qcom,sm6350-qmp-usb3-dp-phy
+              - qcom,sm8550-qmp-usb3-dp-phy
+              - qcom,sm8650-qmp-usb3-dp-phy
+              - qcom,sm8750-qmp-usb3-dp-phy
+              - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:
         - power-domains

-- 
2.25.1


