Return-Path: <linux-arm-msm+bounces-87985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C0D01120
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 06:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 513C0301AE36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 05:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A2A2D5957;
	Thu,  8 Jan 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d592vm40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kr2K6Op3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661492D8DAF
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 05:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849914; cv=none; b=pu5SzCcohUUkZoeeGLnv1vxJu2tE0pnpgcO3y1TCVJxbIYYqBKb7bdbGaeiwl+wFXbOeyiem4rRXvehDLWgpi0E86KGMq2Ld3rJZqe99Y7N1u6qy8oRwqrg8qU4xqjzFEr5h8IJtptn5Z1zWEh70ZsjquokZI4Z+O3jXIRJIoH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849914; c=relaxed/simple;
	bh=rZxcuRMFvn9seq8EZmJSUEszxkH8Qa+HTYKjCVP6T5k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RICL2Miq8b6gOnQCUyUbL6guIcoi2lVW1lc3/qBKgLe3OlmoEjPSZXSArbUN1FSvCpX1k9LBULxNE1UDTADPnVAbPYMG+nKKwiLHkh+Hc49SHIpI43NK0DQLVeSR44mZuLQwAPF5+BfOqvy2coEKxzRJ9cAs8Ej216r3MIPy3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d592vm40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kr2K6Op3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6083kCGs2453910
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 05:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QiKK49SklwY
	0WsWCb06XGTvckoM6EZlMeHafpb8hvoo=; b=d592vm40mu4/0DACTDUa4lEI6VO
	AjD8LoscyxcC+ucmuTlZlyWzI8i2JcwlryW6jWgizcyZvDKx/PWnkVXXBGeMHZzq
	tte+AOfSMrdKL76uXRe9lStD/YQX9x9L9DyJfZRfLLHyFizzDyD7lIWitFGMr3YY
	YAO/OAEEUpk5kRrgXp9DK8Q1PmWl0642J0+nhp1yHI7fmzrIaDbZvDok+jXWw8Hm
	P9vDO2FygZvZ1Eg0CWY8joK/AVqVmBImpTyRjB0DgmMt2/hGKqjB+ek7OMzGemJj
	6PKPEuXto1dmdMZn2RX3PZ5CmK0RDjdYXZkhmR/QzNtx5QKM0cEOxEVqCTA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbketg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:25:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso2829764b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 21:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767849912; x=1768454712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiKK49SklwY0WsWCb06XGTvckoM6EZlMeHafpb8hvoo=;
        b=kr2K6Op3q+dVN2qcJfzOWKy6LwAYWPYSGkfomBqfJV4U2wy6TuTnlSiuWPok9isJq+
         JWFh1YJvv2SLNgNPIZfYiic45x/FITajzD8xi/CRtH1aaMgKAXBKGUumYmiCGJHl0Yng
         FJn6KIUCakGj/lIHSZ21h0y5Bi/VW1gY7PZdKJliYF6csW2B8BXb/c8O6XlTwT5YE0CJ
         giKGoo9bjQire+yZ+COLdVUkPp3MnaarxQJxBBDnwZmdTYyyJiYzEYHgCGegrCWeT+sS
         DGj4T8PgrgDxlkKh6Wt03i/BlocVvvwdxt36xDveNhnbalFbR8SZoaphprM6eIpvZE3B
         PZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767849912; x=1768454712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiKK49SklwY0WsWCb06XGTvckoM6EZlMeHafpb8hvoo=;
        b=MJtOgDQdMet8M+qjLZMcqXjNijaDNdwn+iNBPmwJx22z0C4GZvb2NSYOR0XKlBmsE6
         TDvGXnWyy7pMsoza9luHkbIIPreBTJlnmp0PSuDzvZl/HMDjz5xkLWkSsNhqtZhkb/cE
         eqhYYrVzVbyEVI8WNFPuy9PXs1zP834+KvxWvij//4DCq9cy24Z/fhlocl80DhGHVpcm
         gYWkpZHdalRThPdoFpOqAOoMY5VE/jhGmS41UwpIr9b88VO0rLwUCdyWN1pX9ldADR6F
         jcpN3MwZDNlDQnFRWAHvH1pta8zDn6UUvTr7O7y5r8yTCRT3bFoXnRuulmyfg2B9Y7JI
         NvjQ==
X-Gm-Message-State: AOJu0Yy8uVu8c5ewdihmv96j7pgNHWSYzsjl3dHKX+Z4PZpnDVy6jX0q
	A5wH+SVa1Xc6kyhiEvqf2sQnr/EDzUcTIDOV52dDyR4j9ByjF7U/3HR/PSlHrFKo++XRSbXiTA0
	nXj8PMcuKyXryVVZ3//O3CahmlXKfaJCk66vzrT1K80fQbNH+DuLubmPK6z1MzysZzixn
X-Gm-Gg: AY/fxX47Ez7DCb5SMYC6sWYe5vs1iT8JQCOg0plifaoocdOD/suKwmRDO/mNsKBKgEj
	emMm7mFdibNCNh90CmgAVxOLEnKMMK+NmcnaY6/dp2whQF/SjT5n6IWK7vBk67fFaiC6yGePw6J
	qA36ny0MUnhaWIjgClQmSLVOojUtno5f0XqvukomyYfzC/7OnGBmpBox0vRWAAmniSFzHzY96uH
	pKw0I5HZOt4jIzKCWGiAzYPLVzrt24+3RWHbLS3wyVas73NQn2O/9zPJVCF1Q3ZL8zNnG0Fe72H
	DxeQ/vIT7ueT+FlATo6a1AaW2rfZW+r9Rob6SFglwHvBWlw8EmisWj4IRar0v51xYyEUx8rXY05
	cB3y/DzCcO3K7eXZQg4zxU/k/aYNLsRF56jVw3/e20YgUX+A=
X-Received: by 2002:a05:6a00:408e:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-81b7ffc240amr4257813b3a.66.1767849911875;
        Wed, 07 Jan 2026 21:25:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMMICqXZmh5lDhdph4jSvCPF93/oOPQz1jvkoxDvv+bv35kxRIrQZx1Te7T+E+L2liK0qy6w==
X-Received: by 2002:a05:6a00:408e:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-81b7ffc240amr4257783b3a.66.1767849911380;
        Wed, 07 Jan 2026 21:25:11 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de2d2sm6415534b3a.27.2026.01.07.21.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 21:25:11 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Kaanapali QMP PHY
Date: Thu,  8 Jan 2026 10:54:58 +0530
Message-Id: <20260108052459.1819970-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMyBTYWx0ZWRfXy3PrtZkAGO8l
 1zOEVyAm0DotatHUzoSHaf33uU4BXH98v4Z1k9nE7Ac8cB4KGRnv6dAc1WE5Jhj/t424eCF+GrT
 dbpoimIfLE6VtOlSCk3H+W8oHaVrSc+i7D//BXpaYMTjtzJxn3G0Xqf9YZ+YBTso4N44Z1fD4vu
 IdjUhJGENaf56fWXY5Gxk5NU40E1H1y87golOrf6FXmudAN7XecW6djOavoSl1RtmQf5gnadKY+
 uxLtxf0E6EuX1d6LbAHcER4mDRppJ17n/f6DgnAuGK0SiJZlN39Vt3qcOx4B183/Iycs3Grklo9
 k2B3TMndVNgKKKA0w2dH/JKiVX7bt9wm8ssYSTLV+eEiJhBH6S/DGr9PggSL3nov6zo6ELL+l00
 CMCOt8RisfuvmOjSB4v7jCAS0oMQI1B0EDGS1M5CCU68q9JdCARrmbmGvsduM2VHdpbMS2fJiZJ
 SziIMJXKCMH4p2qAV+g==
X-Proofpoint-GUID: OpyM5IGsaWcxB_u7xykclKtEjDJZLaEK
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695f3fb8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2IkYd7TCTIqYiAcLhPQA:9
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OpyM5IGsaWcxB_u7xykclKtEjDJZLaEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080033

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document QMP combo PHY for Kaanapali. Use fallback to indicate the
compatibility of the QMP PHY on the Kaanapali with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 58 ++++++++++---------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 0568f0a1f356..3d537b7f9985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,23 +15,28 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-qmp-usb3-dp-phy
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
+          - qcom,glymur-qmp-usb3-dp-phy
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
@@ -197,15 +202,16 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,glymur-qmp-usb3-dp-phy
-            - qcom,sar2130p-qmp-usb3-dp-phy
-            - qcom,sc8280xp-qmp-usb43dp-phy
-            - qcom,sm6350-qmp-usb3-dp-phy
-            - qcom,sm8550-qmp-usb3-dp-phy
-            - qcom,sm8650-qmp-usb3-dp-phy
-            - qcom,sm8750-qmp-usb3-dp-phy
-            - qcom,x1e80100-qmp-usb3-dp-phy
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-dp-phy
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
2.34.1


