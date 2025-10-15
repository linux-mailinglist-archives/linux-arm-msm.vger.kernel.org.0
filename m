Return-Path: <linux-arm-msm+bounces-77292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDEBDC81A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 670A8424B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854282FE591;
	Wed, 15 Oct 2025 04:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JH2ZtRT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EB62FC025
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503176; cv=none; b=NPcl2A6DaX3ndzfJJmlSR5vRSzoChynlnIuAhfYpOmSiQaq8OXVyErocFHWyywLhJxpFD5xkdnewpxVafig4ZVEcxaXGv2JBzoZ/E2OWUAiKKt+HtOYqansfXwNEbAWLHAewihH0txEB0q1vIErn7SpI1Vc5vHNEGPV6uakPhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503176; c=relaxed/simple;
	bh=R3BNXlzor3OWM1UHW0bocrQrgSVBuB1WLn0clYEcPVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=soFgKz3DSIQkSi/qjDBS22TVpby1OVZvlqc52iJSSOIXmUICSPPbJiGVz9m7WTFXScEEh1VajDDjzA4vCNHD8Caj6S149xetYI990sN8AYDTlpBrnf2pnkqUIAms0MsnjgRLEQzN58w9vgYWb3knJepqfDw7EqabWZAFc4IGL7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH2ZtRT8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2tJeV004306
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=JH2ZtRT8ZNdz9xiq
	AW2vvYos1zoieDf+tY3EZfn3FiZaR949bUCAeSrSS8bmV3tbRtr5fSPLDfngJBJP
	gJtgaMm1cH82nF/CFktTCWL3rXukYTz6rJ70xx5AdtYMEXw55Abe5WCBJlhTQqkD
	KR6lqMC7dhOlnpjBdESbXdzn2Y0QU6K/zBQ/X1vxAnY/mPW6oO6S2JUpTDHDm74r
	tbLzPWUQEZpM2/uukOS9VBtdmky4ENhnNH4l111rGiIca4FwUFkCTjQUAPrfZ9I2
	t/Pvhp0J7XWhu+tm5RHMvLWzWJ6Z8oxsBj0GR1VDwgS/Q9qnH9oLWNmliFGjysuE
	j8U75A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8b3jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befd39so23256495a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503172; x=1761107972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=;
        b=SpWLOKeHiUs0ARm7bt55nFHu3pwxa1+O64AIdIB9un4JA52897JyyauvXdTZprrH5B
         QDOOJR/EiLqX7rPOCfDroxpRtY30aeeVr1xOkG7BsWFT3UHjIhpcTUdmF2Jn/hZsWzuX
         E631m67Z5u5M1/Y4EG8Wp1FDOmWDk1xOuC/nnHpesqD/vtOzBpr7cuD7OYvZ3BJNdmPH
         YRS+wURWRiVdNtKBDZsvqBKqYSAqR0tDCWkGnrLuBlmhdty/SfPtPp+S2KB7NnbLr2vL
         bK8u47EUC4eGgSQY269m9vkdTpL7Q6QPtYOpHbu4nNMKxp/oowhu/+BvZmqWD0Zu2YpG
         i+jA==
X-Forwarded-Encrypted: i=1; AJvYcCVOoXSZu6WaVjUNeFEst03F2OIa7zASxl/yDgSRDP/yaGcUhEDcUvfSClvgXLKhlUPrHVdyWUwIvJeSXOve@vger.kernel.org
X-Gm-Message-State: AOJu0YzgV71oU/PbD9MZnvqe1yuYDmxxzS43FOLue7xKFjzTZ57wBKyA
	rJV6v9MWFT2TJGGcU1BbnXTj9Mg+rjJyxxOWKUdZxljKsSkT7/jjCP1wdoKEkUAFgIgsHje4V3n
	XL27e/KPJA9QSP9nBOehn9zHNLXJeYBfi3DqKD6+PJaZoNlRigrJ+3y2mVwOFbLAe9mS7
X-Gm-Gg: ASbGncspgaOgP5gOUlhYgEv8W9sik4jyokzdAbmTfAo4KsbT3cbm5k35nRlwXw/6Exv
	TdcQBrq9NGGMPaaMSsISCXLVlFq1a7OaQU6fIMM1ZLzt5o7t38bRBO3V0LQPpBI8n9a6MiB8Ryj
	KVs83P8cPggSpCZ+DlNS8D+QDAU0QtKH6FExRmGbHmRCze5dGQtzLohTHxHvX9K0FX4iAoqw4FJ
	dmR5FxFjVjFC5gvNaEBwZnn+tI0apl8j3o/3f8dfc9oNFPztCcXiTww2k+dPh10XVALLOR93uwX
	I+G77Hoaxr0jTVhGL2lJwEBtr9cvIUCw2p+dBTLCSa0sdVRlEeYTLJ8yy6RLuzKFn04KO45lpmp
	T
X-Received: by 2002:a17:90b:3890:b0:338:3156:fc44 with SMTP id 98e67ed59e1d1-33b513758bbmr37056528a91.18.1760503172019;
        Tue, 14 Oct 2025 21:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGvgRTzb7knqpzNaPhY0yhlNG4N72VqZ7xUOrGAMsJmJgROcSWjkXAQgsIq6bZw5DGhL979w==
X-Received: by 2002:a17:90b:3890:b0:338:3156:fc44 with SMTP id 98e67ed59e1d1-33b513758bbmr37056487a91.18.1760503171499;
        Tue, 14 Oct 2025 21:39:31 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:31 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:21 +0530
Subject: [PATCH v16 06/14] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-6-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SmkKRQQh3S8Gtdgd1oOIc80Ljvpw2jelYZ428aYXpJY=;
 b=xFWNl2F0ikA8PPaXC182saCjtRr1XUwFnvtiVQhNheBP+zjdeXpRqUdgNHkvYcVkRoh0+o1OY
 5Hbgz914qE4Dyp3XBaHoDUpnGA8R0G/mmiGUlTxticmhUydrCTYhxBU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: K7Gt4iWDq6hGrLXddcc8nvwZEVxt6ebp
X-Proofpoint-ORIG-GUID: K7Gt4iWDq6hGrLXddcc8nvwZEVxt6ebp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX1lhWJHr4nQ7U
 7zC4RtrtVc8izYcue5jqmstnd4A9gwLmQh1MoR4elsL/3ZMlQ+4OX5uuzeZEYGY807uxKex0OhK
 GWXtUF5Z18eszb+Ah2jZw7HS4vJxdPdQcEA5m1L5ViWQGjOR2n6SQQdYhWDcf20o9ZhnYcAeVHg
 ncWiENvDegJq0spzH5jba3Vju7lk7xXg3U4X1VzJu6ndgxxXkAiTfA8fPUnschYPjJY5ZtVkz5D
 0Y0VxczY0dRjTqqMVTxvydDJ2DWWBRgkBtFVTg91wZMa6TSQKlSIUSe4Jn2jta0TPECkhmzMvQh
 PljamLekM/x5Yon8+YJROEGbKpzRDPGGFfJ08oiLPH6XRipA3DCFdWQo53RDo2WyVdol6BRn1W6
 8giGm2d/kYJryfwKcV4MH5KNxaxiPA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ef2585 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

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
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..eca38f8747d320e8371c1dc37cee2287d71821c4 100644
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
+        reboot-mode: false
 
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


