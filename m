Return-Path: <linux-arm-msm+bounces-74267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F19CFB8BE10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 146FF1BC7CBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECBA238166;
	Sat, 20 Sep 2025 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyDhJLE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4C322FE0D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338482; cv=none; b=DNg9Shudc161CzlE6Etx0FQLeKE6jWtlOmQHzEjxMDBaxiDvylKL3YmMZPySN/HbInW7thWCVEJVGriYu/PjPFo2G+zGlYB86j814nJMg3msqmu8whY4Y8rSRJjkytEpMn1op15jIlDTJUHvLscGWCKZvFfcruqlSZirQvDRcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338482; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hdqcy9hVSznD95zCN94jcpJKHSkGkk//cHQqKNASz6kRB27s/XawLeSjhsDUYZLDdBQsqK4ZM/y/wmgJxArLjmWMbif0jSsItjRGija5BYCdQbKnmrAySp6jMFBZga6jVdApcixvo97VtmGAyMoLWaxzJFPIDkTUXbnAd++eD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyDhJLE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FMPh012577
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=PyDhJLE+UFGTK2DP0UZR0iYLQcs
	NBnVt5bmN4Jm7ZJ/Y+yWzTgtv78XS+fUkAruXHkKOiWjdi3y3tvUGoBuJV5Zi58y
	dpw3Bivinq3lm6qkgYEucNQ+d0eUMyIsvEmIa+4ienTbKFAUhrxOaTD4a/ssNudU
	INNdgP9YjzR6pB3vsjj1xMBf8zu7kUwkDC+p3iUfPSscZus5JYwHD+Ts4lzUNrH+
	Fw/H6aMGwQ4c0wtwMrb8u5yC2EOXrXhDVpb9SjGq3EcGlo7kmEBlJ14ZObFaqcTO
	EGW6TXeqcr2BnviTPb1Zl2dVZI4djNevrc0FITijT114mulYRfEuhnFT8Ew==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x3cbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e12c8feb9so1499118b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338479; x=1758943279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=KKds6fBeLkygDILqcYiJshScAY/s6K0JQ3Lmu1C6/TKpKO1RvlpkB++7uqzrEHgTd5
         wieVS9ZTRL2lKqMXo2Wwxqy+3NG1B9e0urHx+qWLSIyG2ULI02eDwV7geMMfMvildci8
         ncHm5ao/Acq2WCsjpnBpY3iSnp8hHmFK7aruqd9VEFPv6SqFKHwqvaxgy4asRRzg0tQP
         Ta/vysOzs637Fth2QV2pxZdAxAS0NA67Qn6GInPwDu/oA9AqlJxziiXHkJqCme9/GIIG
         p5b+VE+m1exfBgU7CazL+wxFAbF+0rS1pec/luDk4PuBq0sTeQM0RXxy1rYn0iZhE7m5
         6qow==
X-Forwarded-Encrypted: i=1; AJvYcCVjPVTTYKAiwn9JYNznHSdPfFy0rmQrUtEmSFGMVr9Pr8unf25VFJRi8X0mHZsH/imgobLY1BGkFVI7ATNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwME3/Uj6Ei8kCfvPjyZv45kTcn+24E3PpPxO5kIA42pcc/NRbT
	Jdk3qUSpzL66m30u5tD7HQjC79w2iWzpvbByGDTJE0aOwXIO+SRmzlPKV2UkHFfjSlwOp5lKWlu
	8PZGztIUMC5cfTABSzO9MbB4HJgImyErkS8okPyUMCL5HDlxus30XWzwATqYrvqLtTgtf
X-Gm-Gg: ASbGnctMDjM3HhSJVeyt6iuzQLxERbCkt1cMYh00rYI52juQc7ETFyk1IZCKQbBt94m
	fPVniWJlYYc9lG0zDNc+BZ6yY10JjwlXQ0wQVevTIaDI8JQU2LIZm9ely7JZSKHFFA+HIT4qa4p
	80TT0RG4NNoXNaJN+eChnYQ1Q2HKx2buJ6KYEZMRW8NS7sfnMG6n2qA4OsDl8j3Gi4BaJkNbm0D
	zpxjkkRLB9bDY9NwwAUmnCGblWEDeRjoKN4JWliMRSCwRarbFflp8MQpiIfuLGnTQLojhBi0yQ9
	OOweZjsPBrE4vWl8rkVIk/KjnVsTkRAjnBTfNiWaYK92pfdoVJYX83OBiqOXdFs49vsP6yHOYA1
	yMzEcepp6u8//gAsC
X-Received: by 2002:a05:6a20:72a2:b0:249:d3d:a4f0 with SMTP id adf61e73a8af0-2845ed1da85mr16281122637.14.1758338479542;
        Fri, 19 Sep 2025 20:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFetA3WDam0Qho0OajI7y40pyPQFuw0lP5o44u6ANcRyJ15kqRkUGW2DaxpCx9AGXT0Vc6BNg==
X-Received: by 2002:a05:6a20:72a2:b0:249:d3d:a4f0 with SMTP id adf61e73a8af0-2845ed1da85mr16281090637.14.1758338479024;
        Fri, 19 Sep 2025 20:21:19 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:18 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 4/9] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Fri, 19 Sep 2025 20:21:03 -0700
Message-Id: <20250920032108.242643-5-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfXz/lgzV4y2fAY
 VTlDf611y+1o14W5mtA0flBdB8wkI9OMl5SgjD5UAhTpxfwocbHSIxGhOdwqWttPJgZZN0erBd/
 C5uzZdBFOAbrxnjogPjtLtjejK1g6knY7lvL/7kgZrQCSyVLuXgyn3vLDojP4DXFe//hnncixgm
 NPmsuij9nQKnfNp5GU929MSy2BsfdVmV3hDpqQydIpFE72IOdtQeVG+V1Fz+TRHDa8MQKc+hSou
 SKNytj9gOVkEDf/sHDvD8I3rOmzxKLzagT+4hodVAHQjoq1g/+aytmlRrLMBivXDSxl6CQ46Hj8
 hjF1LBOiTlE6UkC6jlETxZhK3YGaNOvSZeYQGA9ZRoR6zZaiOnqTntFXHlcpg9GUNFN5CzsWK56
 59CyOp8a
X-Proofpoint-GUID: pluHmM-cD54hImbVRaychZPshn6Z_bM9
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68ce1db0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: pluHmM-cD54hImbVRaychZPshn6Z_bM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048

Introduce the compatible definition for Glymur QCOM SNPS DWC3.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/usb/qcom,snps-dwc3.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..eaa0067ee313 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -24,6 +24,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-dwc3
+          - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -386,6 +388,28 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-dwc3
+              - qcom,glymur-dwc3-mp
+
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+
   - if:
       properties:
         compatible:
@@ -455,6 +479,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -518,6 +543,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3-mp
               - qcom,sc8180x-dwc3-mp
               - qcom,x1e80100-dwc3-mp
     then:

