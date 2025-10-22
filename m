Return-Path: <linux-arm-msm+bounces-78271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19086BFA532
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19C904F1A10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93ACF2F3608;
	Wed, 22 Oct 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMgqM8N9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710C2F28E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115836; cv=none; b=KXvdYUza7fh6xA6Kia/6OqtCBXeukKj1ImuqMdMR3yPA9PV7qveb2uUCE3yvuaW0LsfW2Cra97eROO7ZuDn+K8CT3GGwzrgZpaZMjuVtFJodIP0+DLi+DR3Ea0VAjaItt8VtcqoBCDwkCiH7OsBvric7VUcIfsb7hPPS7rVtjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115836; c=relaxed/simple;
	bh=bMveLn8qXGEXMOOXqLmYG2oX6+KBs0Vzyv7XgzdwA4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9gPNYXy1mxJATESAgg4WTJmRXlG2ilgReorDT31jmSSrgwiR1UXS+y1rHiumzOrqwTCJUqzothVWFiSRSfGr3ua8gMMLobMMPFX31UIfbLPehXdQxewx4Eapu0gWr4Bhrqb5z32pJk0cRsvFcqQHz6v8tjkiXBq/YjGlAQmSa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMgqM8N9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3Y5YA024360
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfF19aO8xny9L39JuzD8Gu3or8NnMTbYbN7iD67kX3Q=; b=MMgqM8N92f10wjjQ
	3hWg5vMx/IFvH7roUEaeSLuVfeAkuliOuRgyNytcolmYTgqk5T72Bgp/T/M94S2l
	5Ne/uJKCur3t1nDuzHpzsaDlf3JJSQ2ZWJQSejrPpe7L4lPyEsF2sF/+vrSxU2w8
	zodJbSJ5RvLCQ3rscebtK9D+igwahWDhuK1ccx/KEnsibVXxtQdyT7ly6KJ4E9wy
	78oREBay6JoavJi4tH6GaIPwNGwmTMUGUfSbHankmXC8zbSwy1YBmH3uzyTiAuMh
	+2whizrPlDJd97JOrq5cT1Dr4iKXUdLI45YuBtWaWZA/Q4Dc7FFg4tf8/eLlNeRt
	7j385g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w83m8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33d8970ae47so3757623a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115832; x=1761720632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfF19aO8xny9L39JuzD8Gu3or8NnMTbYbN7iD67kX3Q=;
        b=AdSxew1aRauwn5+hmKS/oNfXnzCEf10BJvSkfDIQcvJ+9ihXsl+QubMXM9pH0B69rz
         k/HVOKyxiG8pUkTwexL0ig/UrphjXOTI/uaUAwFrEFKJO1ccJJ+6s9TBOyGHIFw4qG65
         6eNgJo+zJDdvsM3fXXSUKmbIcqgZO/zmDG/5AuFY1rMmGmCIRcNOz2vpe+r6xbG13ngo
         Uw5UI3easgiK2+Em6UeljEqvvauFJSRJK/VbZE4OrBYcWw3ECGc8pvt49cGcV8rEM8Ij
         EGHa805xv4avHBzJ0OpZuo5lE2flTLq5PzVbADl7967/fxnr/oEExvaJlfGKH0ZMDufp
         FiJA==
X-Forwarded-Encrypted: i=1; AJvYcCUCF8iU5vAB4ZBzl4iIl9p3dV3u+WgWOFSTPlp5GcxcAMxhZ7XlbSPrUGXb2+JCnRVjUF99EBkZ1UtQBaEc@vger.kernel.org
X-Gm-Message-State: AOJu0YxVM+bWSYlyu9aYtWfHh/JLr7RxKanF27tAlu1UGQQCI1Y+LwtL
	QIZWlfIpipw5km65PqfomPbgKU0BDVuC/QaTSrZetPr9RjWVHXOX64nmqyRiGcZsijTKfRbUiou
	yOcYeRzfxkrVEjAIehubS0izU7byO703GFANbYxqVPUv1jw59187+DR/Uby4lMuNhUsfA
X-Gm-Gg: ASbGncuNL1M12wroPCigA2Obq0Fg+DHu3AA5YgOuH4zQKfQNZiVRpRYIbk4UD0vfqag
	j0+kp4WKgsoYeULLyOieFYu3Segw6qMpK9rAn7sFlbWalXnxbzAI6m5D1caRTDUJbaIO2MD9UNR
	7vf8qpdh0jOQjbRVJpmbEB/6IixcJ4xzovQrxXZ8Ibv6fPL7SGKA/DYzmNhc23WiRPS0BakCDJ8
	/3S7InDz+aUw/P+2B6eY9Ev1MNZyGIHvX5eR7oazDBSQO/0WHL4ZI5tjrk5eZ+UH0ZP7qIaqiWd
	SaiYNq78gAwkpk0+9e4/q8NfakyAjcre8MLIvkY4McBH3YLf0LnLTr/HYkTc3jDqe6AiX1wCnV9
	cHbqiAFIhpJgQUVpkT7ZYGlwjrZQus/kAzC2RJkpBEQVkMyrs9Q==
X-Received: by 2002:a17:90b:2d8f:b0:339:f09b:d36f with SMTP id 98e67ed59e1d1-33bcf8f8ca4mr24582322a91.28.1761115832265;
        Tue, 21 Oct 2025 23:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyOzdwa6M6+VonTKVpn/1dRGshyVGeAEj3HtpwTzivtN28WxG1KsX0bk+9YqsiFARG7CtuNQ==
X-Received: by 2002:a17:90b:2d8f:b0:339:f09b:d36f with SMTP id 98e67ed59e1d1-33bcf8f8ca4mr24582286a91.28.1761115831768;
        Tue, 21 Oct 2025 23:50:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:27 -0700
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Kaanapali QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-1-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=3168;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=wyxSRIp6b2YrRKpZKlLcX2lrCBRNwJtuTyhh+0I06cw=;
 b=WfGOp1rFR/PQ0DC7AXBJXKQ5YWGLmn3QByRcDCNfXH+p43IEdWO+k1Zkx/lfO5PztnyG3o4bN
 dSW/2yFfwZTC6ouw9RtmFBhOxE1Faix6EtiB3S19NbYSpwSTKzdKx3g
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX377iKodszbhM
 kysnR7EJ49Yvh6OnoJXoUFSL06NLJej+2KjOnUIgmxl2nUj3wPZJPrabuv5r1YOypz4Bi3AEdfm
 dVCubf/8ekTsgGhygF4+LnKOn1EnD4K375/pO+0x+kPvKI5LlyxXfRCrZdCMEg2dZMummJ8Sae9
 gJHqjl/Is7ySe9GNBr87L3LAaboYFgZBr22QeThhc6mo8fXV8lQ8uP8OjXsFtZtQNOjKQQHGHgu
 VLgPLWWjsaXDZSySud8SDsWPa3klfiAZaYo0ELDitNCsvg28wAHDzgptk7c1qXGTOyh6WLOGucv
 +UZS8c8WUGvZ3BZOuVUdsvVq9DtwZl35A4iRwUXXrlB4CBLdciQCA9ZHKXVKqtvs9WHyjeLA+jx
 8er4s5Fv38/aKIIHaDgbYQy9RwKeLA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f87eb9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2IkYd7TCTIqYiAcLhPQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6JKnuir6Di93wbnageNT6KdKqfnJrq46
X-Proofpoint-ORIG-GUID: 6JKnuir6Di93wbnageNT6KdKqfnJrq46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document QMP combo PHY for Kaanapali. Use fallback to indicate the
compatibility of the QMP PHY on the Kaanapali with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
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


