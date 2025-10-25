Return-Path: <linux-arm-msm+bounces-78765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828BC08602
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA7383AF817
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8530E288D6;
	Sat, 25 Oct 2025 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2bqQIeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C841A26B
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351021; cv=none; b=Vn66zUC7Alx+nWUhWuwMoCSnzdoWtqZArTrAhvWiNALaGRKGo3K9Cv3H05ArHO5txjsCfe5IJe8H6WcDVn9SuF6bkW9f2P/kjlp9SqjOOsBX+npg//ZJdaWEOvRFPlh8BpH4Z65dsGFhHKA2YjXV8C4s/D7XKGvFnU//PylKSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351021; c=relaxed/simple;
	bh=8PnTazA4dzV2y9nHuOhCjNJe3e82OR5ccqp936rFihg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cYWfbGJUfa7Cf9/LT3OQCubo5mjNmYJuYlJCT01DUjSw7qr/vhUe4GpeE6/eOwu9VcjxAJ/uOfFALIratdkqWYEWOUt8r9praMUkGyUaKqdWYk1nrmQRywHljULFNW+3vKHa6tEq7HF+ClTL59IiMdN9et8/SqKLY8cEtBlTrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2bqQIeQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9i77024554
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ANsLFbLhxWAijrZcc2ERGH
	28beR1/GNXIV7Rze9qcn8=; b=B2bqQIeQ6bU/64Y0+jVb8+csXbc35aBVVytB1Z
	3uRBzPpweYI/aGGCkl30cW9lrTgsvRKjOMgN9H4LF+0/OLhDWMkZhMgqCc4dc680
	rkt/TGtd5/KzxNQpTeYmuMh/fFf7ybLLxfW/xdtBKtxXGlsn8YcdaQy3ECluK4hB
	EZQGC/HRbwtsCJg4usV7opAWzwi2qfmTKaugZpjKhS46X5+Ri2A3XWZrCuezCtpa
	cc6rvTBckqQyZNuNZ4qQIlE43DyUAzRCA+lS+jWto/6tS+gH1jLeKvayA8msBSFa
	cXTXGpLpf4ax0avw2hYErZbA3r9qb3BpSm79yLG7B77Ayy3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8qstc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:10:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so2041593a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351017; x=1761955817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANsLFbLhxWAijrZcc2ERGH28beR1/GNXIV7Rze9qcn8=;
        b=DzH9Fz0dJqKhH9R0RdABfEy9mHguF9kW4QRRxc2uwocNXCoGdpB6Mvge6zciD3Cw0H
         Zgo8BnrG2DCphtUnDv4F7AVIpHFOdtkjScYGG94vfVCayoW0deyJpOuXdVC6zcOU4BBZ
         rG46+2/KZuigb2HnIbUeP7I+HGgbfNvc46LDv6JekSiuy4sNcb/Eo2Y6XZqe3UkOUyU4
         sr0n/+tkn/U8IUbalrZIRfA4OeaPF7hmd/M84wlNGEKsqhU29umyRLv5VUjWgUIxfM2Q
         Q4iic3/Y6wXRD8VUo2d4BrpG2Lwcg+DtjtH+df77AiqPD4F6VHHpVSo9cv5bMuPqvBrM
         Jl1A==
X-Gm-Message-State: AOJu0YzL5U5Eq+cNgmVicvN1r1SuEQPCg0bLyWuaR88aUWROrK0ZPZDH
	/v8RKWV75onQDI+rlyVJmKD2GM+xVyNCjOe6KWcshAWrvxTeO1gAarnpvwS9gUXOETDWts5u3Xt
	4kkNzqGI03BUEHkPKF0VHg03idarzMFsEFFFf+evtIfUWHu4TUagHTrqYVKuOA8I7oLVq
X-Gm-Gg: ASbGncubptGDWi926dH9oUbWto/hLj4vt0XA7bKdp/SAbA8KRHUVCPjAMBfX3S06bsG
	H3WgeJrabYXkWh9AUJ76rrtvMLa1FrtQDLhr89MHq1VIPStSeeiE0CvQO0wOS/og/2jgAKcq5wX
	6yQsIc1S0lUHQUWiFVNkr68i7LPXYVqlyNij4dLTFE2k47MqQYJHDYiYJU4MfmuBRMaLDDwhzjq
	uvGh+8jiqZl2p7v//MGl/wztcqkTb4Yxzil9bCtN68MDHfNoXpGktYFkP7A6f7Izgvx/HhZSfRj
	+KHSApdrs0izR0pIS9Hz9c+qttk4VgS2sessm0J+55Z59TwYT1fT/HlHnTb+D/gQeWim1SRCkn7
	jBTd4bO+IWleO7Cj7rntm6MsCgKwnrvOlqqbW9ZzKUZdMWiE8OhA=
X-Received: by 2002:a17:90b:3f8d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-33bcf861b1amr37765330a91.6.1761351017428;
        Fri, 24 Oct 2025 17:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSm8h4NvRrjWOJX+Cx7vUoe1BpJGKUKqYtf8siu0vobIYTvOkbI39G92U0hrTcdKBmU0SyBA==
X-Received: by 2002:a17:90b:3f8d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-33bcf861b1amr37765303a91.6.1761351016968;
        Fri, 24 Oct 2025 17:10:16 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128885524sm374772a12.19.2025.10.24.17.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:10:16 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Fri, 24 Oct 2025 17:10:14 -0700
Message-Id: <20251024-glymur_usb_subsystem-v1-1-bf6faf63b566@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251023-glymur_usb_subsystem-6ee90473506e
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PDO1EtSjxg3hr_9AdDydCYKwXV_XDtLl
X-Proofpoint-GUID: PDO1EtSjxg3hr_9AdDydCYKwXV_XDtLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX8Lk42/eZxKWi
 qbOKfMQk0w4zJrSJO7lIZ9/79OyraVD2VCAE5A1KQcjGEmJ9ufHJCbj4g5DE8KGNvx1T7E/4i6S
 kUQ0FFjAzz4CM8UU0tTUV5QGIoYPcjpeb+c2jfQCMIP9JMa864UAAhBc7xwuxz75KjD9OMV+MJc
 +4OdEw7xqYODsflkq7/KL8BZVMu1d/B0geBGvi4U5ar+gNWfOOBJ1bTCfijTFikyOLb38u/upsk
 0zOn4L2dIwtpSsvdqW3meyoasFVZY5qDgQE5tvYHJ7qPEl3ZNQRzxlGj7FRvrKrWNCvQ7d/HTmP
 rMaAmquyzjU+5MqQnCLfqXj7RbvXTYuuP6dhJ6LON8+8vsIid8joRQn6TLFU/z46loMbN5NeOEP
 uitZ8esJdPJy53sjgLepKOMRWJGtvQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fc156a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=d0k8rClLaaXxmoyBG9AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

Introduce the compatible definition for Glymur QCOM SNPS DWC3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Requested to split from original series.
Link to original series:
  https://lore.kernel.org/linux-usb/20251006222002.2182777-5-wesley.cheng@oss.qualcomm.com/

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 26 ++++++++++++++++++++++
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

---
base-commit: 5d603d197cef9339ba640089f17aa415b514dfaa
change-id: 20251023-glymur_usb_subsystem-6ee90473506e

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

