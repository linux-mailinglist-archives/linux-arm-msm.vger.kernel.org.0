Return-Path: <linux-arm-msm+bounces-74266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A0B8BE0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E6975A4840
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51442327A3;
	Sat, 20 Sep 2025 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JppcwkTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2C22836C
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338481; cv=none; b=J6hagYlqChp/w6e6csg3AzOlBSzjinvhdHS1VoiUjDR3o8aSmtSLy9/tar6JPrP8OP7nCp9mAPK8yhwwG2dvFfp1sG2LzdiIcMMNItbSEA9seaxGd3UbD1i8kf8csfn5bl/VSrWugfMIYnXd0KPr11xvuWWJz8I762UoSCuBvVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338481; c=relaxed/simple;
	bh=dJA73O3dMi/pqX8EKZQSD9wv7GpWdJetJbicq4mFIDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AOtWT+sgqjchjXDzSRm3ITDR6Z0qOo/92GdXmA9yEFkn71K0UxmC3XfGRLL6g8C0eRE6HNYWMZfsWNzGYr/72EI7QAEk0r5ObbEGdKLwKvkJx8mYMH5AtkzsmPZAob8FaD3eZiXIRBXU6cm/K8P6Hx+cP/sx2A6idD7tUlwF7kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JppcwkTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FWm2011301
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GML8ureMAch
	wx8vpYthv/JvdPI2pl69vuBTqtCyVutE=; b=JppcwkTGoOok13dBZ2ghU/+mHIo
	XOxwUeiHHUSOJf2DQrdj9ftC1MzZzQ6pI9PiasPTlS9psFn9GZbmfKxYfbFp4Bi0
	ZABnsGHn6IGYtEQoImjBW2dpSAWNRO07nyYJPwUy26znHVunu2pWYb/4euPQHVmx
	dip5WkJ4gIwVzDpYYtITei76v+3nvZhC7TUAM1Y5WfXgOFT6ygjCAKyuUeALP1OO
	cjpPVl9FozRpSqNKujWlTSX/WprxkdcvsTwJoa6W9exQg9zQjNoLsNq9nd9aEbIt
	D+83Jgbp4d7A2Z5eZ9oYU5NxDeYXSoO1ZchIq6SxJKVeZJ7w8CjEf22xCPw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy4f96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77d19ec75bcso2489416b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338478; x=1758943278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GML8ureMAchwx8vpYthv/JvdPI2pl69vuBTqtCyVutE=;
        b=S/aYbFSUegvxdZJ8flpqupx16CYZbSFQohTiQ7j12rDgkzjwOV08wirXWQN4KwGu7k
         KquM7Dusp6lpJz+vp1dVHU+1ADOln2R0WTMNTqHUEV0bH55z/BwrldBnTCNxnnNu7kND
         UMECgZSZ2LRGQvLLzxOuCpSuNMbxu4zqLfGY94MzRoyefy0UIroK8WcatmlSOJy8nEEG
         xmA6f+ZIcbM3Rbvxz0Xtb4e39rZIJpnfFKAQClq6z2pRSRoh24EGMKCCVuWQUCrTIY8I
         FmagNv4odJ3Kwuisiere4RDNvmq6ZM55nHS6xVxUQEC4kSvBA6s/L8NDvs3829tMNvxc
         rLjg==
X-Forwarded-Encrypted: i=1; AJvYcCWbRwsY5djEsHsCDTJ73/FkqNsKCZjJi/fqvpnBUgs4btrTd4BTiEyzv6CvUplKOn/B42L41T09zDMi+qVB@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJS0TdEgt+D/WKoYJBzwpqFFi5WozJTdobFoIt9536gPuwk5v
	2rdMkEvdliPnre8JP1txCEEYK3x0/CmKj+Yo7yEiQYOVJii60P+phTcayTdXLnhOEzSwYTZGxQG
	ppWkX1kzG8+vjp6IcCk3l5GCzL4ntpVrvQ3+ETO4bfHix6Nx/dAH22xNX92LtjKZ5LFI5
X-Gm-Gg: ASbGncsWkzwDjADx5I+jF/YN70wEUOCpXotYmhB41nzmUtwM5bGISP27xvHosRhHE9R
	v641jyl2Ctibr8enZpAzMRu/9i010NvI002soVM7VB23q1EovRgqX56tbxY0dlVbD3gxtDSPweE
	67+QGWhk7KquQsy+2IiIwRc3YDPtTbNGyVVWV1iPkZO/k4e5VA8BjuldwBfjgA1SbG/LLwh6pPf
	foMoRqmoecb5iBFJdQZKWrXKY1fuT8rdH6AKoePLFApXaFnivHRqpOPRO9gbEpTDNk7by521XHl
	ofZ1jWesoZ6uDI8v48t1Lj99sV7oe0L40HiTsJ8qPkZllzuYYWt+9meP+qZBgi3yysUieOdPE6j
	C5f0e3GGDqPbxYmBH
X-Received: by 2002:a05:6a20:5491:b0:243:78a:828c with SMTP id adf61e73a8af0-2927723466fmr8460155637.51.1758338478093;
        Fri, 19 Sep 2025 20:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo3UQ3Zyf00PaJ6fvkX8fIq4kwna0eBd+Z2NMvErSf3djLCGdVAB0D7+Mb7C6OXe9h8e7FoA==
X-Received: by 2002:a05:6a20:5491:b0:243:78a:828c with SMTP id adf61e73a8af0-2927723466fmr8460121637.51.1758338477668;
        Fri, 19 Sep 2025 20:21:17 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Fri, 19 Sep 2025 20:21:02 -0700
Message-Id: <20250920032108.242643-4-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXykFCBUsCvRSD
 3z+YlCQ/0lqGlATTPQyxpIeF19Cr4Q0ekW7LbReNArgtCvZkbjdyUWWdNwpSzS9WgFwMb9u1o6X
 U0z80wpE0P4mFYUpX6gZU0tDoBVNJ63eG62dnMfNUnbxmKcI00W8uZ1BVHQ+9qIb1Th/yxKLA9L
 QPnFPj9krSx+YzHDdH+gcSRamgog5nwWYgnQyB0CiacOEKpOk7u/EJiQiaBFVtbJiyOx7Ph7Q5D
 oeGsuM1VxFE9xlrOAidTlVBRPiymLX97Bkb+Su3D4T7ujd45sd+XZCVRk1eyryAWWPZy5vVf5uF
 Tm6DAD2R8OdARW2L00P5FJ5Kzp/GtHBQe/86ug1/ztgWnKJJxPYT0OoKdOHi10/52QuVHxm52Wn
 3d6JNiDf
X-Proofpoint-ORIG-GUID: c5vKK-yOvLZyZspf7Emg3Ch1L1Szmnd_
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68ce1daf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4j6cOweM1wKm_1e2C94A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: c5vKK-yOvLZyZspf7Emg3Ch1L1Szmnd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..b96b1ee80257 100644
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
@@ -53,8 +56,6 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply

