Return-Path: <linux-arm-msm+bounces-74876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE7B9D2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A041898B8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539072E9EAD;
	Thu, 25 Sep 2025 02:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgTyJgEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600EA2E8E04
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767346; cv=none; b=oe8fkLdG4/LuAbzc5icZNhNQNVgUwbgv9b+EyWWb2KePgtO5csr/F1wGbQI7HYTxVy/5ENEDKbvajANGEUFA1s1pJ5lPhnq3Hlro2F2vqPEnlkWh2v9UGBjdOjXM4PNfNUGlkdMkE+5kPpeKfp1MTYDh4VJC0b9Qw/WjoWpGUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767346; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Klworq69fEpYTSWf7eINWYEVe2ProzOL9kv5S2LUMSTAMeH8sODlnejJfMQX1MlGeUtPQw6d1s7eGrGY9AfoIqOBc73hTs9aAEFbuUIYJYTTZSZl1s42p+Ihyl6Gm1wE7kjIMz1gEgJB8VFxz1PLR80tqkpd1cihuw3s3fHTY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgTyJgEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1gY9r019919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=TgTyJgEz5m3fgPKD4Sl7yF9a9ZV
	TAVlyJzb+FBraXJmeOMvYMgh4Nvixsx2BSJgtQ1dLDCIFdrhvmEqreb9wJaE6sKK
	0P8WF0Ip2xQVyGz4TeT60GwAEivy9JynXu4eFlYiE92HuVxCb8rIQVigRa6IgdlW
	Oy2criHyD8gRzubKKH/iLjWfnfcs4j5VdLix/eJ4qtX6aUlEU992zwPrEURjHe5F
	5YqkvCC+i+mnDOP0WphR6eoRxeUNsZTTW7Q3Yf1CdiaY+fO069rHNj7U0gHP3eUj
	v2vzpbv3daSFvq2E5DYNTv6MeCpHuoqrK//6pqI4NIH6BipcEDZEMR5Bf2A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyngd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324e41e946eso759825a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767341; x=1759372141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=DCwnkc1yNjg3dWycg3BgabTeodz2K2MWwjtUt1StqsQlIENKR7qHt0zP75loOlW8/K
         WOZEmun0TmytBgQGkFFuqZyU/NDn+wOsXPmJsRe0UvjMpIJAiL1h9DijbT6e2I29aw2E
         +7Jvv9qUZaozxpuGVoou5ctJ0OLKDfbV/hsvT31lEUh2KqXqkRTm/JPH4FsInkQa4+WR
         NBnxkesDnSAEDHu34EDQmjQacQYJbRrzAES7MgcY7Rj07xlZW8cG1/bYpV9VwugQloRe
         5VYYIAHEySnCyNxX3FIkwzHUPmybepcNYBy5JLQrymTAvH0f3jRlGKVdnjogX4FPsn39
         pT5g==
X-Gm-Message-State: AOJu0YzT1Ohn4wGRfeZhULW9ebWd0WnaIZwvJCYdEUq5ePP5G3ZOY2Ev
	1KIt8kIqZGN7HT/uCJPAn3JbvQIxj2yfgy3GIjNorksGa9KigJLdyWQoTIP2WuNuvsl9t+MusGi
	TC2yD1s8sL0Kmbw0tdWmtA+zrgZj8l1wfj5mUmORmIFVVP/qlmXnbytEsqbUvCCn8oyW8
X-Gm-Gg: ASbGnct1s9HbTu8ExQIRk3WlJ/I6BmZZliClI4lbFC/ZcMjd9NyC9+oSO9N4+k+TIHz
	flzIdVBP8NI7i2Dyqa3dWXYPWH2P/71xUjXPjI4RTDH0xMnlf1EayW9h+rSbPcm1jeusJ1ophPB
	nok/SipmF2Zm+Do1gwD3gaz8EuUcLN7V5mJIAxR9daG7b/RS9WN3PDCgO5okUNaj0mWu+mHvu54
	a2RFkeuTLHtoBnM7PY8vpYURK9A1evZnxuhAxw4aalU9pEodBJtw9CXU7eo94cRTRLQXBKig7/z
	E9G76v/7Vz6RV/ycKwXllp+iad6OhRPA8sgc5tR2Cp0AwxKlzkQFT+xa6jmstkKynRoYknFX/84
	vgNdZRfxTgGaQt2Qa
X-Received: by 2002:a17:90b:4b43:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-3342a98796amr1499486a91.6.1758767340587;
        Wed, 24 Sep 2025 19:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgS7ZXVL1SYRcZLxlWvLQ8xVEim5+C7vl+IPW388/ukbhvZuVXDcTXahI9NwjzjZtEvK8rZw==
X-Received: by 2002:a17:90b:4b43:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-3342a98796amr1499441a91.6.1758767339749;
        Wed, 24 Sep 2025 19:28:59 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Wed, 24 Sep 2025 19:28:44 -0700
Message-Id: <20250925022850.4133013-5-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 098-b8EH56QZya1p929ItU8SahC4spPO
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a8ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 098-b8EH56QZya1p929ItU8SahC4spPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX/MHizsyYbxT/
 P2MWwZ1D61CbvbXlBQAWYI/1tn+8MkXg9/8UVyQ1+K+kC10KV/aMrpcfnF9ZQxESpQkex/EAVEX
 teIMSmQNGe++VQ7FtH8OFIU+OIGNEclrNXcIXH7bIqfbyA06Glm53B06S8OTo4FoMO8oQztZfMY
 vLFNNAz5bE/EFBN1E/vakU4fe7pj7PZsYNy5gOFh/njFn4+A5FNoWfqM2MZJdwXzHG+XW+ryRwJ
 DnvQ9OP9dgy8cajXKJbZsxHUzqYyfYWNyuAHdqxL2VERx+4U/E6mMyd+K8Abg/S5ZPUYDRDtLA4
 ldLa4WD4fSUXU/V/H/Y17grWP1cQFlLAdzS0oXSqIaq6+1IyDMTzaP+QzigdkHr0Uq6utVt/kaE
 02Ur76B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

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

