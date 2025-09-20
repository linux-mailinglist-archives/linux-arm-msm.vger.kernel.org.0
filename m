Return-Path: <linux-arm-msm+bounces-74265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC20B8BDF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96FFC1BC7CE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2666622F76F;
	Sat, 20 Sep 2025 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RD62JpHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D40222580
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338481; cv=none; b=G4mYeaLFrsIX3frXKE3OVElVMHdHETwMMdO2nYHRXFIDTqxeL8eHHEdFRCs6DQVNABUldlOIIc6Hg6ey43EulccepxYbZC7vAnFNYjoIeadJ581iIOxDnxmQXa4P6+oKnIgeMKcKnNbpoblxZrc59vrvwOksH2jBNVeBueuK8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338481; c=relaxed/simple;
	bh=YDlSoeRw2VbtYRMNUeSZVwJW+SmI0llmlSIr9kcNQWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sf65V5pwndheJPJs+D/gbhYmGi43srdfCoBh6kfhlcKXvaiyr3H0JFwtkkKxJbaB0xN83xUyuq+4eP4GXTCIaVAZobTWvJFW2rF2SFKtdXhMi4jn1UiFKmXEdN/w9MZpjOQ9oBdpHTObpxM/kHvWuyxq+gPdGGVeekLklKaRRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RD62JpHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3Al4d009404
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P4afTs2BZob
	5xp1NXhLP4wPYTnI4iHBaCCe4NNMHtss=; b=RD62JpHUQDrLOassI4J3yoVNtA4
	Xpfd5zUsF/IkTIdzVGulZKCQZvpHKcXFoep/5QXSItxcCXg3CcNvLlk918glR11l
	31hneOnrWcaeS5nnlz9zw5OPM/N1we7G/muPyXtDwOKp1Q0kkD4SfrgHNLHpGQ7C
	GxL37cVPtNsVoyQh5nILm6qJCAx4zV+TUh3xK0uVl/jJyoJir5tsTMCZh/op2QPD
	yMEP93rS/TRF8skqZ7NUkYKvE56XtXE43MysOF/PZk63L1dvSmxmn3B1tqzvAgoQ
	AQnbMd4PsPGu3T70HG+53huNp6C0EpDzragSEGsm+8J2gMdfiLi7pmihWeQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499bmy17pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7761c58f77fso2606829b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338475; x=1758943275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4afTs2BZob5xp1NXhLP4wPYTnI4iHBaCCe4NNMHtss=;
        b=j+gfPmbhdLMwY/2D/15af03jcP8esW3mWGzRUm+C9VTpZoXd3A9StgM6rDKqd57sFc
         lbWhQzsxmoisQBd8TXBYFksf95c2xYkY3hIiIkfT6oub2fbrc8u7nm78uuCD394pTKK9
         ZT43k9nXOkQ0lkifetxguEzl9Z2lxog+KFJGJ7fUVhmA/ZerWJx583X61OQ5IwP/HzfT
         oGzOPBnWr5rIzmDEer07vuU2M056c1DAfwQNviPluJE8P7sjxpk1Uy+r2pQomfJe7jXD
         T0CZruZk9dlkBExbMXHrCdMSYbat7XYUS7L4alQ1SKa4GfKgJ6DZBOXMZs+LMqpQzrK/
         99Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWuMV9GUTy4eqic/mEPEQnQuGOa9aVLNOPK6tpPfUDw4JENom80cdqyQpkqEnuoaqcpfI4QZsEkSAxBn6ya@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHv1Gd6wjWBvZpe09YjIoaKCKO1Fcd3UAWY3c5XL1Z8leHHH7
	hpGoGqpwoRKvzgK0S0GH2MfgczBXwqvH/W/A85E2XxTzPnQma1dh24EEGoJDjthHozpFgCFvbK5
	582tETktORJDFXkC6A3eR8ohg9fOTocG+qrivn4PAsIUcbheCrAT+7q5xWUXjHqszgp5W
X-Gm-Gg: ASbGncvSWt//CYan0aeIl0/+0IdxK4STFJDLZyyi090C4Hg5HNtoxuWbVL/PTlxBD+O
	qrn5aJiepLtRJ5SO9vhDDM1P/Tv0onvaKxTXTWhGzYBIRxvwpmOZKy94B/jgbAFcczUsMKHelvT
	0NtchhQeb3Qi1c3rkVQhYTn6OYQ54IQBwqVrdokoq/dDPdPGYHk+P1E35Uusa4NLklrWPh9oKdZ
	WGNe209W0QNU8g7x5GYA/Ew9NPXYgT1/QuXT7z8xWSP2QV43+UWu/dLk4jKpkLyeFL+HLLHsBD4
	R/f4cetllm3ZaiwDZkW+Fn88QSlhTmG/ClUKLFCYfCSjbFMVYtivTI01b9K7Pl6qgUNlhfUZb+O
	kKICbx0apWJqtytV4
X-Received: by 2002:a05:6a20:12c5:b0:250:e770:bcbc with SMTP id adf61e73a8af0-2927480f320mr7972241637.50.1758338475170;
        Fri, 19 Sep 2025 20:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjG+ljXA2NFGb12pwEQzj9q71gZ/HW4nxBM/YVfEycE18N8jKbIJHZotVnXmuXiSTZeajTQA==
X-Received: by 2002:a05:6a20:12c5:b0:250:e770:bcbc with SMTP id adf61e73a8af0-2927480f320mr7972210637.50.1758338474766;
        Fri, 19 Sep 2025 20:21:14 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:13 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Fri, 19 Sep 2025 20:21:00 -0700
Message-Id: <20250920032108.242643-2-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: INcJPfEXx7DIkdCYiYmzCxByH3TpTWZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDE2NCBTYWx0ZWRfXxlfZVmNR9uBp
 gn/+evIUjxAx9vHu2L0+kOr3MtwKAeJINuMops0bEj+4vG/XbwuDuMuEEevtZm0WOBeKEnAxgH1
 yA6V1SmR9uw4Lv1aaZLjXsHrKLuKN7fizRQZI1mgj+XqJnOwJdz/QudeRWXMwLSQKBSIZJ3ieCR
 K5f0cPcw8m8FoacxO0RwIZo/DyLZWuhAF06H2f1MrKu1Mtjgg0N8mMsepH1lAmu4IUaCvdhHzsU
 EQWekjkkIAxSYHS22W4Hx1sRmq3EydLOLUNKoEVv4zxrB3uJRRLLnIGzsUNRtDyjwsHa8sa0Plw
 NP0FMiPeNT2aBOxtmsS13Bxi1GZvB/AF5ge8KytlHzjDleLc2myfkpjTaW3cbXYp4AFHbkliHVf
 sThKk5Zx
X-Proofpoint-ORIG-GUID: INcJPfEXx7DIkdCYiYmzCxByH3TpTWZr
X-Authority-Analysis: v=2.4 cv=ftncZE4f c=1 sm=1 tr=0 ts=68ce1dac cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gJ-VRbHUVreD3CQON-0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509190164

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 45 ++++++++++++-------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 38ce04c35d94..e0b10725a1c5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,22 +15,28 @@ description:
 
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
+              - qcom,glymur-qmp-usb3-prim-dp-phy
+          - const: qcom,glymur-qmp-usb3-dp-phy
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
@@ -46,7 +52,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [cfg_ahb, clkref]
 
   power-domains:
     maxItems: 1
@@ -63,6 +69,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -110,6 +118,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -129,6 +138,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+            - qcom,glymur-qmp-usb3-prim-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy

