Return-Path: <linux-arm-msm+bounces-74264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ABB8BE01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7478DA05FB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2A222D9EB;
	Sat, 20 Sep 2025 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/Zf1bqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4F226863
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338480; cv=none; b=OplxeiKrQEnQPTwIdvraAofz9545ZaFrlSblQRkIala32THzBpaQzEdlukdpNjQ6TPEKuElDm5y3YAKrLtDBmji2jAXcI8wRPN4LOhRQ1IJMZACB9x7LGPQjPEitg/mVadOeJsld2rs5mUbfc9yiA9qYMZA7typ/yZ6a6IOO/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338480; c=relaxed/simple;
	bh=FChmN2K25IEif5KaRFlunR0xe4GViKFxw/PGab+7yIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VSYTZkDMJX//RBylJmnCHtJ6Rh/vH8V2fCudqN3f2+lTjmTZILDL8Onl7SNZtIjvuQDl5gBvZdruujFE1D84KCrqW9sdSSoC36yrzAUMA+r8rkoFBXuBVAoMl3TzjrUxMo0dxpZaJrSb7ZTZlrtMXWOKW6M8BULyntySK6EW4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/Zf1bqJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3GJt7032695
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v5tmMdZXUOm
	Jw/ggIyYVsmTSYyBwUp+iA2AluiqlOBQ=; b=R/Zf1bqJRVVYzeOtR0sjwOUS/v3
	IGwo1v+5nWeo5+Lb7GTgNTJNAHDVDGVdfhI0xllGRsk6CDB03tQWalWi+0IKlGAf
	2SPbTEofHdOigiA3PSqwPzdBFtIH33Q24q7Ibrnhc5bYMQ1mCca6FA1lzdhOyRwB
	l2drZvOYXJI8BhGJI4H590RH+ckv2lkm/gqbw4soyrlr9aeGT7Tj14I52DS5AdZ3
	bQ2HPh3+MiPuxn9oEYdmlfFQ/zFeYkww0VZl0PnzSVuhC1Af7105vXss2m1hqzHI
	ZTzhuTyZ4O6SwlMSkQBXeCoPT9GLgGs2orf2DzGB95XjlDI82xKW/Jk2giA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deh3qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5527f0d39bso1046779a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338476; x=1758943276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5tmMdZXUOmJw/ggIyYVsmTSYyBwUp+iA2AluiqlOBQ=;
        b=l1XJ/nNy7ZfNpJwBkvHQVKwRbf5U9/N82nPZOwU1cSWvsI+PUDqI4O6s9DED/AvEto
         pRJ6mtsdaky6l1THHbfODveiBytBPI8k9z/aO9zwFHOWPYRFMICsJMWFv2YXZpGPtf2y
         dVjSaHwks2uxnI0rQuvkG+2UPRPV0iTlrNe/qMe+qyycRrKP2SquoUEc086xkVcQwx+M
         CpWwu651OU9Sayoywa89ztLyPOYSscQja+/HC05ClbXdkq3x0EvqfOSZaNccxR3u+NZd
         3PLi4lANve5Z9cC+cO66RfkvzLRwxiQc42NGQkfBi6uPtpa4g6IsVN6pYxCiR8VwR7EA
         Nirw==
X-Forwarded-Encrypted: i=1; AJvYcCVnnhwobUvLi4HS4E2BfNTAvygYKZs6SdIfxMfUB3eiYkE89Xy5Z+SKS4yRBvKRk3W0qxBtqlApfYw0iEWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57L5gpfiZCNB/va/S0zpLlSv4eIpCd6bC/KsadfbFfHH/7QdY
	7jYTT0MvEQivebGbdj9s+MLBJ3MFKkuugtITlOQ1h7oX+A/7i2SVeza5/zs+afi6q51UqO51M06
	9Q315QDy9pWsj7A7e9SSXb/gi8AluOfsrhGKLy+kFfUKfTI3508pvWAt98i5htEvZHnfnBaQuVQ
	Tk
X-Gm-Gg: ASbGncuB2bmTOcEINJKfBR/teuZmPKkTXt+x+JBYUgvEn4wPW/zGfkJj0VDXPuVtnge
	1WhxSsSUPz7fFP5TqrxpwY00xZg1bq+0ksleIq0mgiZIb9XWggROzBam/uWAc+YtLmVdvq8NlPM
	Xim3n1aoJb1aj0MHUJtw9KaMXWpiMdDjPwisWIDVQO34zX9MxY6wwl6s0czY5CFz47yN/ay5Zbq
	2s7sj3+6MkYotHhdZK/b5UAl+yq5A8OCecaUjQMiFB+QOp5ekgx9dmNCVcpBwuKmTWJqv+Uw3Fk
	P7xt1x/KNwJsc+U8O8Lmk9QFI6UlGP5/PpcGnNwbvSBSUixzsDUMow0prRCUF+k+YvIKAThcs7I
	lg/dkWVxuE/aOatzN
X-Received: by 2002:a05:6a20:2444:b0:24e:2cee:9585 with SMTP id adf61e73a8af0-29274fb33c5mr8251250637.54.1758338476468;
        Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOqZ5VhtjKbilxthQa6bXSwR4zCDyXQKASkb4d3QLk2LNVbpxHxAtIPLoxjj1rAPuc1i5rzQ==
X-Received: by 2002:a05:6a20:2444:b0:24e:2cee:9585 with SMTP id adf61e73a8af0-29274fb33c5mr8251223637.54.1758338476056;
        Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:15 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Fri, 19 Sep 2025 20:21:01 -0700
Message-Id: <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68ce1dae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6ooe3h3ZW61ma_5lk_AA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: mHmt0wChJrrqJhhQBJ3AEhFvRkoSkVT3
X-Proofpoint-ORIG-GUID: mHmt0wChJrrqJhhQBJ3AEhFvRkoSkVT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfXx39fsTM1IL0r
 QZl80WHjKRQFqLz57J6kzaSOkyAKTL8ZRvrT1yWXw3GIVEl7wTHO1/2FaWLKjTKIz5PLZHbfI5Q
 UMvr0ZlqJPYEF6CUQY316InAAX1m3vwjp5ioU0rAnvnMPcjnjS/iWnmWltyMLRtohfz7f88lsjc
 92xhy+KmMBTAuy8kqCfY+9EUN2NqyV4e7Pbi2QNbl2t2+MrC1rSI4ybkKociXBNaFEmtICsbF43
 eRWcBdaei1m7ysHQ+77w4tXK2XdNGwQrgF7kpo4jxkEheyoE9X/E5+NUApavXiMX8ac3jaZMuI6
 HZF2TZjVUInIqXSXaXuNlve20TTxPPo4xqgNnF9Ad5Jnk+n3Dy9o4eCYWy954OXkQilVqBG70bJ
 aXRJAzmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..772a727a5462 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -62,6 +63,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -139,6 +142,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sdm845-qmp-usb3-uni-phy
     then:
       properties:
@@ -147,7 +151,7 @@ allOf:
         clock-names:
           items:
             - const: aux
-            - const: cfg_ahb
+            - enum: [cfg_ahb, clkref]
             - const: ref
             - const: com_aux
             - const: pipe
@@ -157,6 +161,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy

