Return-Path: <linux-arm-msm+bounces-75634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C6BAF6B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 09:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DACD21925575
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 07:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA2F2727FE;
	Wed,  1 Oct 2025 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNRpy4Rr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9258C2749DF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759304056; cv=none; b=c9CDvz6ps2RY5Xxl56rHYi5rZ466h92XrvalpxMACUrvuj2O8WdkdGaIiQPsDNsKMUnfnuPfb070ZZrsIMGKgyjshu3cKFtgCDbaTK6kMsnoM1YA5H4L5NAVBLAk0LB/cegZb9vVroPmPl1NRTxCyUGoZXM5AIv7jo5Ccc6+lck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759304056; c=relaxed/simple;
	bh=8fCLXWu3MGxxQqh4/DRKlu28a5eh5vLEq8h4kXwAYfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FdPCEeRsJMl1RPYD4fWwMpx87UILSoZJ8P+XjFI3+i6gzz1U0HZ9ttuHE7O9PjWpyrGGg3eA9LgXk4vDJL0wEXjStH652FgcMKOlvXRaFof0xkbo1nnN86sGDV5CpPx3KHW4qNJHyIuYGfi6ehJzU3F05Sy7/bSDUabePWmIWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNRpy4Rr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMDI82001106
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 07:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=YVYgJqy9pl6Jh6Ezns5hMgLaW2BpmEvKFteq7/wkIuU=; b=YN
	Rpy4RruWMCkE7UPl5goJo5Kc1WvrH+MwRjgHQqDtciTdBcWmdDcGBneKOxPa4zuQ
	G7I4RvfzbxXOjkkMnzy1VsdPHTHZ5Ypae2He39laEfogU36l7tvxqsTdWPFyJZJz
	LSJo42y8tFDiBU52viKjsUTl/31q0SkEeNlHXXN8PG7hDWhoJEfZhZ+1HM664BF8
	nFdaG0An01hlCSWCy/TURar45oNjQ6IOGz+ocZAH2snxCb2AmKzcz43ql87BEd98
	64aSFA3pyFNnuTT8hTqawcL0/oykvlffU+3nrHE7oTbSbt5rhOnf+mmreqj1l8E/
	rJ+2hBFUhGZNqkMZwPhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr776n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:34:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-252afdfafe1so70467915ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 00:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759304052; x=1759908852;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVYgJqy9pl6Jh6Ezns5hMgLaW2BpmEvKFteq7/wkIuU=;
        b=GDsR+ziNYr6Ds2O8rlqg8VSy9d1bsYgwHmzhmj6miIG+M9o7TLYuwWDWZ/EL0MqyB0
         z+rE+hz1somszxaE09V+cAP9qnBmDJ20LtoJzBy17sb/R1fLbKXBe7vlPIWsSxIV/+IE
         uCWKnVuXPkwpu0vXgOqMvbh0Iy1L9Asnbu4G+QNb/xoq43wNvOVTqdD/gwF+VYJy2k4E
         Hr3y7juIXIpKqQulRugEuZiHr02QFASWI9tEHDPhiQGohL9d7gezB6rgkkbW6WpIMWMs
         9o3TJDbaethVZms5al0AQwKFTCbedS1sFr9SaM6mzvsamG88w0OqWoM5AUsDunvs8Fex
         zv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmkj0qhouUPbBwM7zcYPI6L/LCZLzk8X0hmFRf1Kz3ihxG5HPvwMclHQf1qn1StrwdldjLHNF3GeFkB4Ki@vger.kernel.org
X-Gm-Message-State: AOJu0YyPwL6r15fGOUeULZdVE9WMhuaP+ZlYMmBeg5gjHrFycv+k4b/L
	ga847lzjZrz5ARSmxtyc4HS7/wuEw0HF3FX7N1cnWGypHU/m33PmgCJNT+57cZOH7o2HOsCesA/
	UueXrxg0VVCJw/0lAdv8xX3/mujxRKFbR9lZX4b9Ul/X7HXPKieaSM1iDEASBCdkXxZKq
X-Gm-Gg: ASbGncu7nceQGo89VGNGYs0Flr4t/8RT0b/TT4nbb40aLsXCym9rY/sxei8dkVr8IUS
	AtKHSuK1ZgKiBOqE5J8+ZfzWg2+Q2XXgep7MuTVEwznvqGU44pvTy6wIcId+rqXJS9Vbn75Gw72
	vkecf0hjV+r1t5dTwLM56VtmGt1cWbfpdZzaGQd8I8aRxOxmVGN/hc/bhEVVeG9/t4uqcajWZTH
	FhM3AMTnpCz0raFglIIal6/VoOesoi83Nw9HMtC+p/znqs/jqeC+zPRm7lRe0ZOiRbRwzk1Aw4u
	s5vTZYh4FM9JL4lVCpPe/K4RcFb6RS2ihaKBxltTXQ5K7VyYwcA4G3NUySS1Ytnvj9P096SThwP
	GVl0=
X-Received: by 2002:a17:903:1b24:b0:267:6649:ec17 with SMTP id d9443c01a7336-28e7f2a37c3mr29063355ad.23.1759304051942;
        Wed, 01 Oct 2025 00:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCLP1TOKpobDKWLKfNm9Qikln5EHMckIY7xiu+WSlRq7tmz7s1XxvSY8y3mjf7W0+v35p0Ng==
X-Received: by 2002:a17:903:1b24:b0:267:6649:ec17 with SMTP id d9443c01a7336-28e7f2a37c3mr29063155ad.23.1759304051505;
        Wed, 01 Oct 2025 00:34:11 -0700 (PDT)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6effe77sm1642127a91.17.2025.10.01.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:34:11 -0700 (PDT)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: interconnect: add reg and clocks properties to enable QoS on sa8775p
Date: Wed,  1 Oct 2025 13:03:42 +0530
Message-Id: <20251001073344.6599-2-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251001073344.6599-1-odelu.kukatla@oss.qualcomm.com>
References: <20251001073344.6599-1-odelu.kukatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX7FqLA54I8L7z
 FOOXsfjXfMbP/eFWRY1LyUq74I8t2iTAjJbGP1IvzkstJY0tq8m3jYucWChFdBwWETE2hIgwZ67
 TUEpAOBZV4VL7xOaDAGb3MWWbMwcVPz1QrtggXdj4fN7PhT8eSkyuqsbtDV3W4yF7RpxNSNQs+x
 A3S6owoN8mfl1vSiFlVOf5eWhzxXvOOsLPAziwrXt5jlA6FWynJtZkhU5OQkQExEMv4eUXhd8Og
 HOJf/UpHmarUp8OOTaoMjR95iAPvId9riQb/f8qw+tEngJ4szSOZvVrJ7K5vKRdb3xx9ukaaA4u
 W+7DB2lODgmPuPygdil6j/d41FMcdV9YJezKZSdEAlaVhd+FLNaYkeGTfo9KEPEtdKB4n20SKrh
 bnuRmmBCNk/bGQhY23gVYATmsvLO5Q==
X-Proofpoint-ORIG-GUID: NXWEs1qsJJ7Nk3c9eFU3X2viVlZK8enR
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dcd975 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=8b92ao9AcM591oi5rHMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: NXWEs1qsJJ7Nk3c9eFU3X2viVlZK8enR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add 'reg' and 'clocks' properties to enable QoS configuration. These
properties enable access to QoS registers and necessary clocks for
configuration.

QoS configuration is essential for ensuring that latency sensitive
components such as CPUs and multimedia engines receive prioritized
access to memory and interconnect resources. This helps to manage
bandwidth and latency across subsystems, improving system responsiveness
and performance in concurrent workloads.

Both 'reg' and 'clocks' properties are optional. If either is missing,
QoS configuration will be skipped. This behavior is controlled by the
'qos_requires_clocks' flag in the driver, which ensures that QoS
configuration is bypassed when required clocks are not defined.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 .../interconnect/qcom,sa8775p-rpmh.yaml       | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
index db19fd5c5708..71428d2cce18 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
@@ -33,18 +33,66 @@ properties:
       - qcom,sa8775p-pcie-anoc
       - qcom,sa8775p-system-noc
 
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 5
+
 required:
   - compatible
 
 allOf:
   - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre QUP PRIM AXI clock
+            - description: aggre USB2 PRIM AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre USB3 SEC AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS CARD AXI clock
+            - description: RPMH CC IPA clock
 
 unevaluatedProperties: false
 
 examples:
   - |
-    aggre1_noc: interconnect-aggre1-noc {
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    clk_virt: interconnect-clk-virt {
+        compatible = "qcom,sa8775p-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre1_noc: interconnect@16c0000 {
         compatible = "qcom,sa8775p-aggre1-noc";
+        reg = <0x016c0000 0x18080>;
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+                 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
+                 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+                 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>;
     };
-- 
2.17.1


