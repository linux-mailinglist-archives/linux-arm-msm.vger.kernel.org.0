Return-Path: <linux-arm-msm+bounces-74971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA8B9DB4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03BB54C4162
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9172FC011;
	Thu, 25 Sep 2025 06:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPkBWe7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2842F360E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782074; cv=none; b=hYkG9Xfz4J6HgagkkF5B2cRFdWNbM6H/mz3DKvfoPJVPbNFT4d1R5kgB5sxY1qVgkuRQTMfUx5/bl+PTDgHiXuaZFwaz1+Ti8B1v25NMbShBa5j9NkQWBdJYRinOLMi6qONG6tWHXaSc/yHckbbra2RdEvR4HjdByLpUbZUHqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782074; c=relaxed/simple;
	bh=xP3mwQRtUF+y7ngL4/MSOznuYxF3R1hx7J2yaHJ2mqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvlOOIZdF2hoDxaNU/4xOVIVWcen5iTTRow3yJ4m45XT+QWsYGnLgYY+Ci6WtuXx7aus33f89leX8Cslk/3UxcYvVNsx1JL6lie/Ftgp+wGBUX3qo/VUEsS5ndfRoFRU+VIZ1BPjliLPvO6w1OYirtL2sy7ipsb1RBLdHoNIoYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPkBWe7b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONeKuq027919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+ym1GIkn6KQx+5G33RyPIpJNvqhHUVvcETu0uk7voE=; b=IPkBWe7bRuJ3g5Bc
	4vXizwhjNMd2aN0MEP05rH9cw2b75/siaU2Xq6lRYc4gM9vRIrf0+v5TPkbSYoe6
	UEyz7hGptxF7Jp47ou2Ze5O4IUFXg5n1jO/JJln9/j42hbS0wzMyL0J6Sa8JVto4
	SSAskwa40tpf3EBMKx7zcATatgHSy96HQ/oUXSbaKLNPk8elpeUiFLarrqF4f07I
	pccR4FYd5dBDY3JoV/79X2nhfSrkBUC3L5kT3deW0bABbSA3/P91e3saYIKRa2NF
	VFy38LA68Wg0XpFLdjAHMyTZ9Luu9zV0eijFOYmA+MYzrdcpCA0ndyIGqtNXMVdO
	S/alDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnyd3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24456ebed7bso7552515ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782071; x=1759386871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+ym1GIkn6KQx+5G33RyPIpJNvqhHUVvcETu0uk7voE=;
        b=dJEW/AeEkHwVUyOj154giQuwumqOCyosQ+ZWqK/8GpS5snvBaCyhXTK29R/caDxuFG
         0ljizZC2cyzwh3CcFdi9YLdwuU30b+nQVGvvXD0aMddTPPlprTLyBbczeg2gjJEvMlp5
         0af8D7cmU07oo4U5iX9mFJsltzmj5LZhb/AGWN0kKpuH6xcPCcd/N89PCBy+B2z/aIRw
         cpKh5hSYt59Ee6CqdFMDfuVWVZPzhycjA13+NVheP5U7TlFb08YKG/cXU0hSK9XBJWDc
         /b5BxKaXcbjBGw+/ra0t933bki1ghcJsaSb0PDKlnN5G4Cf6hsH2U/QEexi33dALl1rX
         QVcQ==
X-Gm-Message-State: AOJu0YzrsdHGqkvjNa0ln8XPa9slN5EH+XePsAHIwHTm7j5JHKicNUps
	OOiVZD3SkrDNHUowDBRhudu97EQq44Mg3H7c6OLFPSmExyz6l3czvgL10LGuhZlgcPBAweb7lWN
	wOS2XFFhoHptIa3KeJtk+SGfzITMH082wxJ94DHp/1o2g0QSyT4y53Dc2NokuId/7UBY9
X-Gm-Gg: ASbGncs8+kR0TUnG5tZ5fdDx16s557j7cDk+KXUGAnZuxfrJfISUIEOjmEmwIY1O/CN
	L1Ty5PwW9Y81IjAFBCFHJ1QRRblTvChOxd8Yq06gIBMhcUK9dXu4U7G4+93g+wvBccvUXsUlOHd
	kF2GE2geSgt5HxIe2sIxPCmz0bE8LveD3PEBvlmfosvw7lQFIszKZYMVbbFR/UwTYDka/Ychpps
	i5sNmThLh62YPjmY7oTMz0W4fayCGdFhgpAHvTQd2WWUc1TFfSbz0BXtxgyndxUw1Iy7rlwh3by
	1QW5la2+HTMGYXdi62E+dxcmx2SpUkm6Y1eiKnAFNlgdvuer+Tbf3tHQbh2XLM/AVBJZxs4It7V
	UWbabZKKsHeztm9l9NTuZbmRr3exofZMeOK1A5srk7Cz+oAhP5h1zuZpvIJ8f
X-Received: by 2002:a17:903:19cc:b0:269:8ace:cd63 with SMTP id d9443c01a7336-27ed7229183mr19631175ad.30.1758782071046;
        Wed, 24 Sep 2025 23:34:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG31AmtoC1Zn15KZMX1OzzSTQkrttrK7ACmhnzo6zvXHSNN35X6ayl1VDDbrvSae4re+QZ2oA==
X-Received: by 2002:a17:903:19cc:b0:269:8ace:cd63 with SMTP id d9443c01a7336-27ed7229183mr19630785ad.30.1758782070570;
        Wed, 24 Sep 2025 23:34:30 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:30 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:30 +0530
Subject: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4e278 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xJZpmU4_KKqDGsKAShUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MlCWAKHzCzMWS95l9V6ADjqT20JKnljT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX74/bmlIGB77e
 anroQ3ScNaD3CTk5ZnfWHscZ8d3fJ/6PIXmNOmd2hQif/aHaX8ZbwsAWVpL5gBAfGG/sxFn8J6z
 ZUmgSRhte//VjkE7+eSULlBMSphq/JI9B8KgwjYRyfNOLCOzhQudGJSZA6RpWPscCxuu0qc2lCs
 cli7khvnz17lNZ8bDqr1bDgBXCH6bG1EcOSnx6rgy/7WxFt/tyYMZdXQFLmRIbO3w+6n80B/Z0f
 FwIH2gCApRve/QnohOLjKyh/sRJiUqKZeXC7/OdTlbr8XlMoS2vahoA09iXIm5XifTxQcrf6d48
 IZejJ1XRWGqFjOjgIWtjef8uOu0u8krcKk9U1R19ZwO80PNFKhY01IwQbYaQ6afMOCWD8YvPnXr
 /xxZJqBF
X-Proofpoint-GUID: MlCWAKHzCzMWS95l9V6ADjqT20JKnljT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Taniya Das <taniya.das@oss.qualcomm.com>

Support the display clock controller for GLYMUR SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 986dc385200029071136068ab79ff8dd66d5284a..8a563d55bdd4902222039946dd75eaf4d3a4895b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -13,6 +14,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/spmi/spmi.h>
@@ -2775,6 +2777,34 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,glymur-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>,
+				 <0>, /* dp0 */
+				 <0>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>,
+				 <0>, /* dsi0 */
+				 <0>,
+				 <0>, /* dsi1 */
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_turbo>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,glymur-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>;

-- 
2.34.1


