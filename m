Return-Path: <linux-arm-msm+bounces-53475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCBEA7F89E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 10:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D514319E0B6B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1ACE266B75;
	Tue,  8 Apr 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E09Cu5Ds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBDC266597
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102220; cv=none; b=ZyvJEvOg6Bf5jRiwJ/nP/5SkmqO2npDR66+uGUBb3B2m3yJDHGg5oQuD0nZ47B84rFuQtjYgIok3+0UgVC8pUkg7a0VyHvIPnnZgohjYVg6mwZBfyRhoYgNM7RR9hwN6zY962lkTw0WAN5LwlH4I3L97gxlcGU3I8eN4iSxJRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102220; c=relaxed/simple;
	bh=+M5Ku3V/2ZgH8reYRD4cDg46YM3sTBrM/dc+pGgazj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJWBVBqapbPKFDJwLRGKycgxSzLC6BeWgUjQ4xWB0UX+3HRuwGTFU4HgHkUFieho1IfDABvaorKKKDFt0FgA4u6OB2bL+TVHryiPy7lgmJuS9fHlMgqCTjEHhVouHxIyrI4c0ZppAxKlqMMi/bQ9iOsNok9L5uCJV0ewfSGJ0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E09Cu5Ds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GM7P029517
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 08:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIafNc5B0uFyTj4pFbHGkfv5h9co1W8oom8txGvYqss=; b=E09Cu5Dsa3e5piL2
	wuft4WBh7/hxwXwLPNtk5rZLp0SQ16rTBGrDUXOoNC7UzssjcaQga0kyL9BYYAep
	+qCqfxE+8EWc5/k+r5YhWTVdQz2CK0BT+B3dtfOFy2zvBYrfDc0okjLRd4mN3VDg
	W7CdBtDQyEhnRLhOZoWqTOYNaQO2mpU7weZ3xvpYU5L+WSaxj8a3lfzgkAyO8pjs
	hdXVyIpXOVmSqgkGN5hYuyeUf/+KVqqxNA/lWByBGv/+y5OCB1NkmSrUVLBXfDMY
	pASfwB0eZpAPYe4zDNdXirBmwQvUkjmcg1z58RN7GsalVjjFJYU5LzGM1wCpT9KQ
	LIGw8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrf41m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 08:50:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-306b590faaeso2437060a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 01:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102217; x=1744707017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIafNc5B0uFyTj4pFbHGkfv5h9co1W8oom8txGvYqss=;
        b=msNHwoMpCLbZib0e8cD7oOVRdZmDV+5lyoFcVN4uxWkj3Ur2zLG8twM/DU3nAi4wM3
         jkgr18KJdSDS/WqlhKt5DZ25P6Z6+a4VhzC52FAxre+sUekoR0HtqlcW1h9vyaQAIIpE
         ydNbEmJyIuR8BI3BWb5PSreCLFeBFZmFxCTTZI7+u8ldVtlnpXD7YxdmoldFrWpTpOs0
         gC69TTDVlAs78H6vzxp+0tecqWj+vVCziZGcmdhPQ2wnzuzIyx9zXt2ygWqjeLcLmgZb
         ZunUjAx5LCnwuh3Hhs/q7fLm1QmQDyzMrjrNghcYJvPOewwnsOGdM4jq0iA7f1XpHYc4
         Ht0A==
X-Gm-Message-State: AOJu0YxmldTZKnIi73RUvVKZvJ7YIZ1OGils3NI4hy5sSMqPJ8SLepr0
	WngEhGIP7Lu+tCPbQazTsK58oGR2mq9uEXcni8gflZGK6g7oxJ+rr8SCcxC8q8GWl2qdmAwDPNn
	9XklP8j18kS5sPNr0g+EQ/GLGZQku0XklhEyE0dKsA8kvOQKTl9hVlDdbrAuZEvlG
X-Gm-Gg: ASbGncvjj2fOBlWM5m9pAH930kDAZnlvVYov8APeA5wBTD0caRTPjMVnmvdB1GZlLX4
	ExBH6rj9U96Rmry6Ts2+BiLarrslcH1wUBJDy/l9gZXs/gJCM7vLTUyN1XqQrF8SJuEQE86iGFA
	tdVq9cLK9W5r5CRBcxqGO/HFCh04E/plKcJ1dciGiJUZsy5oXqARyiDVL1jmPp/fP9zVGSlZvny
	fezqTf4osuYtadcVOssaCTuMogRhXE5/jDmQZCNRSSMYgX75FWdUB5u2aqmS6zEbH9WC4Vm2//c
	gTOJrFziouY30Rj9uO0cq07wIvuJ2ifwjxovCgBebylgwCYPrYx0RFMYD1SB7fVLZRtpKQV2hyv
	ZL+PLNaSjwW0VBB1dotLfnadF7IH3Fbdrr1Uil+ux2tTMCGv4vao=
X-Received: by 2002:a17:90b:4ed0:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-306a6112960mr19270195a91.5.1744102216771;
        Tue, 08 Apr 2025 01:50:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRUNDYB+yarDU6q68NuoE5/dIMkF/S2oo9fTuJlocaMRj8JRYHIUQMpf1GOLYUpK4GkW7rEw==
X-Received: by 2002:a17:90b:4ed0:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-306a6112960mr19270164a91.5.1744102216388;
        Tue, 08 Apr 2025 01:50:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:15 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:54 +0530
Subject: [PATCH RFC 4/6] dt-bindings: sram: qcom,imem: add the support for
 restart reason
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-4-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=1707;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=+M5Ku3V/2ZgH8reYRD4cDg46YM3sTBrM/dc+pGgazj4=;
 b=FDnKNdyAhSoRBqI4r5xDjLdWczl6jHsBMpfCkPV/dGjynr4a4W1v5xAy5BoD9anGt18rCAg4r
 Z0FE9BbQvmtDg6Q+5WXUChdkUj4EHsEPjtURnUyPm3CnSpw9jH3V7QE
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: B_hhgMqxRXhwADyS2t_mBpEP6pYUho7j
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f4e34a cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=her2qdqp2_xUa3hfgHoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: B_hhgMqxRXhwADyS2t_mBpEP6pYUho7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

In the Qualcomm IPQ SoCs, system restart reason is captured in the IMEM
location by bootloaders and Linux populates this information to the
userspace. Add a child node for the restart reason in the IMEM region.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../devicetree/bindings/sram/qcom,imem.yaml        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index dec1b1ee924cf1386f559eb262ea864f2788c165..c3dab5fbc88c1515bfb3585f18aed9e01ae36fe4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -56,6 +56,10 @@ patternProperties:
     $ref: /schemas/remoteproc/qcom,pil-info.yaml#
     description: Peripheral image loader relocation region
 
+  "^restart-reason@[0-9a-f]+$":
+    $ref: /schemas/watchdog/qcom,restart-reason.yaml#
+    description: IPQ SoC restart reason region
+
 required:
   - compatible
   - reg
@@ -82,3 +86,23 @@ examples:
             };
         };
     };
+
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        sram@8600000 {
+            compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+            reg = <0 0x08600000 0 0x1000>;
+            ranges = <0 0 0x08600000 0x1000>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            restart-reason@7b0 {
+                compatible = "qcom,restart-reason-info";
+                reg = <0x7b0 0x4>;
+            };
+        };
+    };

-- 
2.34.1


