Return-Path: <linux-arm-msm+bounces-71190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF578B3ADB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFF31C83427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3E2299AAA;
	Thu, 28 Aug 2025 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Y2KGyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FEB26FD9D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421304; cv=none; b=LGaT95uBGd+ui8you3dI1E6g6rnBm6AW40oQMfyNFDXS3LdT6j2s4OAbVvdtZSVqk6u7otCwM7TUJP9FW8Ro5oywq+dBl8IxZBXc3e+6L+ulRSp74exXxUsRihvNSuSTruKPRDf3o4QpKNw8iN1a3Gy6duGfODx5nUGaTB37tYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421304; c=relaxed/simple;
	bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExQs1JjdMhJz8grcWmVWdluFN8gXgLpmtBPdp2wq6eGh8FWP58OZxb+rv+2IGRAIDFoHu04MkO8ey7/wFI5aF9Gwpzg4n+wOgpKRmHz5l0HFd8QH/oyNB/3CtJ5NhIWR8gnpEMBRFeDWqqChzGtKE1+LVx5ZKGd2fh+P5Xfy5cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0Y2KGyf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWckq014614
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=o0Y2KGyfjiibXHyi
	UHvBhhr9jxTNElF9xkvZ4X+sHdGNSPl0hXxnKjesSzv093yBTrlM/BIrCNUTmwl/
	2OzZWaosrENu6C8wGf4F03qbY86yymv7jRH9QLb0+m5NX+ch7HpYFAqy415vKehl
	cQS8Dr2sy1du+MjRZDAPiqaoNi+Osq1kKksLyJyVyCEfT8qlhVPkzPC0JRcKGNeT
	FxmB13pRZP9dzagUQ7uksPuWUyF92hoBw84aGGmho1zI/wjhJlXwjLzxwcQHzW7l
	996WyGS6cYfkqCTwaBCh4BtWwRx39En9qkkRdycahWALxUpORj2MIzJGGam4CcnG
	hkMlSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf49pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b29a0b8a6aso35156021cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421301; x=1757026101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
        b=Dp+hF27M4TMJQwwIZdBCHm8JcDmucJ2mfIQPCKJrzEH44dnuLfa0CjUMK6NkXBXpqT
         /SoqX83Lee1x199wIEUeO7339YEpYKa4Se+IjRF7QlhKqo60Sclo5XVrgye97oRLCfox
         JUho7OoK2h3LKcu+8Bl5bV0KAk5zYNHv/76hAXKz4pn2qLDPyQaE1n0WtULhG2j9n71F
         e06j+iRCl3zMwkNCZHjCcNjo9hhRRIL6mK0uWg+I/uT7AvITsU5XXD52Zt6kx0uuvwtv
         zutwzvaopepCaudrtR6cD4QtrssTvAVUVf+iUppHNDH/MfBgcMW6qOMl7zCoOZ6Y6HyU
         NfKA==
X-Gm-Message-State: AOJu0YzoIKsQglKAhxlzhDrvraePWNkhoLBkKPPnIavroQGXSkPxbCPq
	M4DhGQX74H+/UPDwJPhCOFfbeQYxywnVCr1xaS8OhL06j9rGKUxP13VbsTGiFR+sFQhgjRmy5Pi
	vEYqVBcR9JZB8vjmuZFu0PCgHXtG/qwUpcnxlR0vw1mhASOHszm86NlwPUBKzJiqb6o8l
X-Gm-Gg: ASbGncsKhdpXFxPesTBSiZQxKXut0G0nY+LApd5lBHRKizYbH+n4nEtyw3KnDmGm3tG
	w4xnVzCelbj1OvZX+ZOl+CcM3Xo8xDjqcKUQcQ6PWgFv7dIdGDNE25SF6jBXnjdnBuEUmv9BzNr
	knnrTl0AKQ2FIwMSyltfidJ2TeeWkWluxfh0UZrCtLKRyNEnTuZlPpN5bjp1ODoB4t2qBIDbuNg
	hBL2MoQntSdWMbhlj9qOBG0cDzMj1HNtvQzHwJeHUl9ceV3CdNKap6m9tDrIVO7blVVyeeeCxA3
	G/VuqYSpv2nRbwe3SZMaYthYEe6Lx6qx1b1WDZcLHRtdB6AYiaWWPEFrWMII9Bu+IOpXNT7do89
	uHr9ndeLdmqUHFb8oZ6em3OWDzX7ftn5OVElgsjif/sTiGMTHeYmW
X-Received: by 2002:ac8:5810:0:b0:4b2:d35a:70d8 with SMTP id d75a77b69052e-4b2d35a7edemr182346831cf.37.1756421301205;
        Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdoOUw7ATcWGp0Ua6IH6jvR/mrsJOnfEZJvEPJmeKyRsASOxjwEQ/HWMxbA6oMEFqxqL5e/g==
X-Received: by 2002:ac8:5810:0:b0:4b2:d35a:70d8 with SMTP id d75a77b69052e-4b2d35a7edemr182346591cf.37.1756421300738;
        Thu, 28 Aug 2025 15:48:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:14 +0300
Subject: [PATCH v7 1/9] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-1-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNywCsqu73xOaKt7zEWE4x0GdbQNxrAI+KeSj
 JntiOFcogGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1cijB/9xZIf4Hhs5tcWo1x0n2SHDJulufkTbQaT32JWduvU4+NIjiogvLNlUCHiNRzYkmbnfiw9
 wdOKNlPthTIz7NqebuGtuOAUCOtSqjrChZvp6oVoM2lIczNKhyvqUmeJl4ZiMq7NXVbHGkVz0DZ
 z+iu3EW4P4hCn+/34/nU1sKcU8C+0jQCuuYZqjaFBnJ9KF1xF19aemPYflg1xWMUeZmePYtqA8O
 gAMb1VCsHmSsKvwA2jZ9fUj/+Zoda1bLuf05yCL3bre75RmncJWAmc2/sOiL+aBRCw4LekT7Dhv
 uCf8aVotEO6WN+Wd1hp2/+nKronI5uZElKvuVDGFCfcCPgP9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: q34bSyUEp8jispIISWORRx-QiOdt_cUi
X-Proofpoint-ORIG-GUID: q34bSyUEp8jispIISWORRx-QiOdt_cUi
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b0dcb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX3dPgWKTb2zuc
 wU51tR8wkuFT94fINK0sNaWztj2kdfaFy/LCSFDZgi7ksjY01By2ASrLyehUZHU7IxteapxhYWH
 AQfCAqVvu+3xBaLSJsJM0aVkvYw6iXXz+qPML0uHKqUEWNT0VJFQCcmCgTjoIDKcwuCv49BXr+G
 vLMynM+/jEDG0FCvd17PXqbjjKd5OyKrksv6rzy4X3x6LbpVZUgevK4f6WmkNh1ty0XnKl25K36
 tSJw2+u+q56LHgSkgu/xcpX6VlTsDISxAu31P8i6Co7j/yfRjnDEKWiCqPPmpvJn8L/zsl9eM1s
 KW/7vv0qD8ObdgHgaDQE4M7ltbk3utT92+Txw+I5O86BidnEJsWHoicej2yZR2+/d0bWqX89X14
 g+nDq5XW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.47.2


