Return-Path: <linux-arm-msm+bounces-66798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B606B13083
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1701898129
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEC8220F5B;
	Sun, 27 Jul 2025 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZynjd0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB07224AF0
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633553; cv=none; b=fyRgN3iOyihCfWA5ZqHSmxDYWQ2cIvpOYNmikQM3jsY1AwRr0j8cTy7BCh59wfSjeJAvV9ZDgr7PxtOL83CVzZQ+ibhm3Fz6T1vg5LELcpAfmHEspmfEUbC50iJo6tKRq3DQE7yAWfX6YQCOoI9966kpabTNElzx/XOE0C63Jo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633553; c=relaxed/simple;
	bh=TXtx922bW7Cthax35l5eL6qlXJtqJfd163vx/p8QQUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jiClPvg8BfHB7LTLmvk1Vkv+9qqT669Cfem+vOgjBvtlNtvxOtspWh9MjdrXhbnC7VOsqWUE1neBO2yguNC9bQw9pZYyiubk5orrc7KSptRcf+SxpWPljDLq/mKMx9sEfrjkk/A1Jq5lx7m+YqRbDUXX6hZZ0ltSnbmYyCNjxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZynjd0b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R7VtrW027753
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=OZynjd0bEGHbnJJ3
	IWW/B+kDbmJVKigmjkl1uTDl5LCq3FVamQjo/ab340CcnS6W4wYsKSqRSuDZ2xkI
	uz8pouY58AIthEQHNdVJwGEj59ZvtTQXhmLF02qtSg7q8eiTg4WaYmnR/CIQ5D0B
	1ZqsG+u5s4c+Jsx5dpDME/gZh48EggAr8o15CvWkLUA2/YO78dQ34EX0bxrsGKGw
	OZJ21VI9E33OgyfTJcE+YqK9O+ShZptev+nOH/8JKUHXN4NtqY4X98m+vKoXn8rh
	yUXH9MTJfN6Mi7Y6Nv9MoR3L0UOP9zON8kbAUOP/PewWsFd1oJ4Vb2E9CEwYx3J5
	Ylt8dw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr2jp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so37088325ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633549; x=1754238349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=;
        b=MNorfJsXnb64UPeyPY9NZMQHdW0Ihrp2LCAwsHUWtNK3gYQsQe+ywtfLwXzFYSTzbn
         bWfol7b04FXSTaMx8cQGCYcSyf/9mjmSq5rR/pMA+QsGpbTrv6IMrbwwvfhSZ6NtfPwS
         iIFyaQcdxeECQOOwI/fPXvT//M+wB1weEjz8X6pbQ38k8QziaGLRnm2/EVrRR+sOsn5/
         9yY1UxQEzL52Ehd/zo8gmSvH9gfoVb+W4vAUphmkseUiKRyMNe+7Vt+e/beQIg8KKVdP
         IyrxwzsZLi9hw6rhq8k9jHOS9MBTFjqJjs01nvzQtsNa7103hGVUKdtoN0gYtGBdVr+I
         q/yA==
X-Forwarded-Encrypted: i=1; AJvYcCWtgtA6D4lN25Ss/B2nq4TDL/5J6QYtlbQBRB5dqm2oLb3oAM+YoQS4B13eZdJHMFoV2qVhi3wGGio/Uh6H@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBQazsEwlaL66fu+eezoGen+y1nMm4SGa6n8K5f+WOyVieTQj
	MQS3GYB02OIVIn+Qv4WbQFAvYdC4jIjuH94mT7yjcTAilRDLOuRD+heboLipTvpGepNFB85YpsZ
	AMfgXD2LD7Il4hSRJhWxAjNMl7he6f0fgMi1bunGUUnVJHCVOFltLGDL7mXgLp3tky5tWioLw3A
	Bt
X-Gm-Gg: ASbGncsfb/bYdl77MNzHBFHbukj1SRtyqkZGS4MhgFksPPZUzQc0oFHJXanRa9OU1qH
	UZjXx90VJMDgzyMCb15nswc5wYzVy/ApgKP2ojsn3zCFN2wC7/qF9h1FxoFVj/xKHVPsACattqg
	LTTVDpwhhsRPS6YMtIUPXK9BBMUV1GhiY2IxfG7+IFMc15uw4lehx8hRhx2b+mPByMBpeja47zK
	v2PBu/36ZNYLPumrQVDiN1TAYnzRwU1mbNeV6fagCI3rxj2cjmdCFUAufavTcKbnRX4ipIyjEtM
	+/pKkgCYkHPRCmmD9TAWAk+aDZDuc07cogzUv3O6pyVQVFNGx+d8zHa5a08QxMuR+mc4bFb04l8
	R
X-Received: by 2002:a17:903:1107:b0:23f:d903:d867 with SMTP id d9443c01a7336-23fd903d9fdmr68042005ad.35.1753633549291;
        Sun, 27 Jul 2025 09:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL3wWdtZ6aYUyxBwD4I04sxzmNGeS8xOyoLA0/pGD4nypDDQZu/utCQqLS7ndqtErXNjHKbw==
X-Received: by 2002:a17:903:1107:b0:23f:d903:d867 with SMTP id d9443c01a7336-23fd903d9fdmr68041555ad.35.1753633548710;
        Sun, 27 Jul 2025 09:25:48 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:49 +0530
Subject: [PATCH v13 06/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-6-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pb0JW5FgpXpfFWALyentRdrGNmebMgVj4WCNzS0Y1bY=;
 b=q2Cpgc5X/5vvp5IW+bSMM73MNGrPdxZ9TyGWHgnn7fEPw/7YCTssgw97rASyUi8M1FNatC4RE
 D62Y1b8i1PMAAg0ElzQjqtUuEhXWnmNzMVrBj50GG82dX0mbqehtdl0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfX+sP9Xmz9M+xZ
 v3l1MlrWlZffXEmiErnM6UZq5CB7G8VUkVHTbF2AesbR/Bx2ObMkjsxdHwT1Abz7kQNSwVqpo3z
 tRA0MUwCqrZD1izdHeg+S5FRlXfu1tLBpYLL8E4uPrwyBsTQdPjOtElm44xqbOuAwUi14uWEryX
 9qQSHDwBWvqdNewjKrBidSteFCcIv6Aved/hP4mesAQrey/1njHuoOKQ0k4wBJPgoQ9NZTYJxBc
 pD9Ti4qdYPjMWU3uAqGLBwfRmDifL76zqpFYcecLwSD9D1FAMLQuOHJDfA2e4ccr4VyUpYAhP7V
 PFT/i90yEnUTfspqg0EBzyu01gu15FTotp9EpGeqriQKM4hBS35lvMGDlm2q8MhWlhjeTjUwPpF
 Tf6aikHDkW90JQJVWxZZmA7qG24UDhWGOpwhaw4uOyQcfLOhk4Yj6rlXzPOkEsEmkSEqfZVE
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6886530f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jkgBGv0OaokcZQQQ1IjPXCCVLHoPI34V
X-Proofpoint-ORIG-GUID: jkgBGv0OaokcZQQQ1IjPXCCVLHoPI34V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270144

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..da3a584c76b48e313a5d4cb7c8e0c3a3628fd1bb 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,27 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx
+          is the name of the magic reboot mode, type is the lower 31 bits
+          of the reset_type, and, optionally, the cookie value. If the cookie
+          is not provided, it is defaulted to zero.
+          The 31st bit (vendor-resets) will be implicitly set by the driver.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +158,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reset-types: false
 
 additionalProperties: false
 
@@ -261,4 +291,17 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0>;
+        mode-bootloader = <1 2>;
+      };
+    };
 ...

-- 
2.34.1


