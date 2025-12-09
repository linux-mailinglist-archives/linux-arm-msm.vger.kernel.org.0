Return-Path: <linux-arm-msm+bounces-84811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C26CBCB1633
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B359E301E039
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602CF2FC88B;
	Tue,  9 Dec 2025 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa5DgbI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZztWzG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300C2E975A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321794; cv=none; b=P5sCSF9TzEJWrTRBxExvW+BjU3BatgF0+pLSWaaW/JwbSIvByVYhIxz2WWoIDWt2xeIdnYJKsvRWxp8grVT30Efls9QhjwGQ1wim6PSb4WmY2ZK51f5Uo+ipetA6ji1LqNkJDybyPuzzfWgevLz4kSBLC+S8fe/yGCA0wDMIiaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321794; c=relaxed/simple;
	bh=jH8qLm7Sii7OyHm9qUbpFfhrLEf6fPbej6POc1YiYy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTVTPX7yA5gTEggHWZSLx485jY/5Z2y+EB0DxiTmT4sYH3PdQi0d7WuUQL9RN8hmJhADn+GCL134o4f+A0LW9WuRMCWX2DCEL3LMzWwoohBUg1Tr7BgC/jqoQKjA91+xzWg/BfCXHbBm1ftnKx8gjEU4v1iusxg6doMqoIX6zUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa5DgbI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZztWzG9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MljQa533744
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Xd/vwux6cs1T30tuP48FUJ/7ZrmR2JxGz7ihulzN5c=; b=Aa5DgbI1ekmXFycL
	qos9nrCADGf79nCYdCLZzemTbyKt70uis8E02mWkULSa0hfgtouTBD9SxnEkfO5U
	qW9UUfGQTFX5fi6O5JQ6+Uy9MX0ipSCYMmqqOzonGqIpIkFZsKhKKZ2jf+XjWA+2
	c18eDPkKdnH+sVgh3uUu3SLpA7xExazG/v7H7wl3j5F6zZ7L77hN9zqMMKvX3Set
	io9duhbNLKyjNWEO42PJnn+Xv0H8e6Bp0g2ufrRD3m+x6PH0+Kah5mKCrRWcw/7J
	KbPZHLy47v0ckClpCx549Yxjf9rmiilxXDDv+NhSiNEB3XszpAaJc0MW1TWjoYDG
	DcBV3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgqrajda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso6926549a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321790; x=1765926590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Xd/vwux6cs1T30tuP48FUJ/7ZrmR2JxGz7ihulzN5c=;
        b=YZztWzG9x5JMO6RDtp3q7/2dq+CI6K0AGwZLSoioWhfx30xA7W2AQW9Aa96Bt1x+lA
         5exAWYqY4YgEsOOY4haCOgmZS1aBTaqzozHFk6AVctJQbFcpgxMoGsB+c4FtEjuwWg8k
         xQCwG4DWzNVbvks5jNQOqC6DQi+7W8hLQzcX99x3qQI2PbqVvjIapIZRnZsWGMRomkSr
         hdhrVQtMc5gyCkxHBhROb2KbAwF0X5oAtwRZuvi09IwnrnFJGercZQi1JQrr0/lL4ul0
         lpqhKrNDNFfh8B/Z8q/LEDGH0JXtiT5b+FHHjoFOn+Ya/LIlwCSgdgrrYrb1zdPhM0LE
         u+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321790; x=1765926590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Xd/vwux6cs1T30tuP48FUJ/7ZrmR2JxGz7ihulzN5c=;
        b=Bz5U6X9CDdbd3nTy34hYlvcwntVr6VZcH2u8d0ZYjMTNKlFIt7PoUjhy+c4HFuh5Zj
         OrGh4zTVDIGdsV7yNla5Fuyold/RQxkxx0lp/e+9aVAw5ai2HdXPW+kCrJlsb+6Ow9mw
         6n0P28aJR5N4f6aSernKnK9aGHZlk81ULCBKf2Bg9F9jrOgtXdTM2dxqNsDsFCyyT1ye
         5LChlzqgbus+7ka5pCzjy+kZQ4fu0xEDG7o+nE/ocFBe+2amw6M/XKClSWRzF3jKbame
         IKHGj/ahVwrHSh6gm7DBMB7uWHr/19BJC86JcYYiW91Yulr58XdWk2S/9Gf+cybzFEna
         9mkw==
X-Gm-Message-State: AOJu0YzZLgftkz2ypzNK6tJA3/58dLfxmv4LhwL2Ye4S69vXlbYHo9p2
	lwKe12wYsoYAoad9vwEgxMhEQ1UTSYKy9cAeV/nMi3eHzuCIW9iEq5mEkN7FhVFLoxgTmYT8Yt+
	rN5nrV5WYxrzvX7xhSfV0BwyBNiAqsrD0EFixa3rSiOwIM4bFPF+fOTrhRMMeIrKFigg1
X-Gm-Gg: ASbGncvmzkZR5YTjeqrP678Oi7iyiIzLEhEphzVS5R5Ou4DT1FxRHY22GqL0zvSPWtM
	0JjiWodvHGg/igstgzIZMpvfFPrptL4cIIFDtMu0uAlXxRBilHaQ5R9zhnkEXc82PLJDhnZ9ihV
	O9Jc59Y5NYijpmOHfzxD2a2h3ejmDSWA3tnJU67cgpgm679nK1tZQaqyLDmKu76FCsEbwPuk4JL
	C5IQgXuiE2zgM6wGFJJ7K0K5bGEgBEJbilRAHWO2MONrYuhFoat647+bW2k9D7etPLaQQ9T/y9M
	rardFHxdTxlCDTJw1h5/ueup15EAd+TYQm5t2B3b/9k0bg2LwvyNMH6YcyqGRlnXkq4wdcg23Ia
	DyK/CO+X+QRUXnFI8fEss1fG1EbSycBHl6msqki1AKQMPEki4GAQqA0MbbEedRw==
X-Received: by 2002:a05:7022:e998:b0:11d:c22e:a131 with SMTP id a92af1059eb24-11f29669d4dmr307507c88.3.1765321790304;
        Tue, 09 Dec 2025 15:09:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMl7w5yyHtPel3NYFlFKBva1EVe3LD4D/jsAzHN2svsXL0nmG4cXb9eGBL9Nkkk2Wf27XcYQ==
X-Received: by 2002:a05:7022:e998:b0:11d:c22e:a131 with SMTP id a92af1059eb24-11f29669d4dmr307470c88.3.1765321789732;
        Tue, 09 Dec 2025 15:09:49 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:49 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v8 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Tue,  9 Dec 2025 15:09:37 -0800
Message-Id: <20251209-linux-next-12825-v8-1-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4nCVom-X8CPP1Qx3tIyEeq54CvpjjY2r
X-Authority-Analysis: v=2.4 cv=UrBu9uwB c=1 sm=1 tr=0 ts=6938ac3f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3vn9orMp_H4Ea5f4EJsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4nCVom-X8CPP1Qx3tIyEeq54CvpjjY2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX5iArUKEaDzso
 t+lCXmxUKYuZHneRuNkJmLz25R7vk00K24issyl+S6Jdqkdef1XB8Iy+n3zZ0Sz7ZkvwmFxSJS3
 MKRr25PbQvEx8O0H27TnYrojexaQms/yLHJthZAWnv9Hidt3YvL2n5Jlc1Bo++hJ8wsSl2vdTTm
 tDHDDIxPqhkLtbadB5FaJUbEBxSD8gnDMukEd4cQsxdi2aYn6w3eSdzGbZfq8nELLSzS1EyCCWv
 E69LFUwAKSj04axr8ue81f+EMB0HUtE7DpSaj8xMsFYzKzSMLmEavHyytzjk1eeF7GNvoCUhd57
 pU/2QoeOR4Swxn3RZ0GznuhwE7Tjvjkehl6yxgifbnsRLyiMaJnfEKa87avH77QL79iAN8Urvyj
 35QHf3TxdIap2d/bMCfSBKOSauvHIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090181

Define a Glymur compatible string for the QMP combo PHY, along with
resource requirements.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index e0ec45b96bf5..0568f0a1f356 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -63,6 +64,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -195,6 +198,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -209,6 +213,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

