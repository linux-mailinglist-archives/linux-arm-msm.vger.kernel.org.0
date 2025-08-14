Return-Path: <linux-arm-msm+bounces-69160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80429B25FEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16811CC49A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA742F83AF;
	Thu, 14 Aug 2025 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2FiVVJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FD2F83D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161745; cv=none; b=dgg/Pdj+5AjoCw8OQx2gtbBZ34K3cBOYbiN2p97DRrcVGS0/R/uGg9hqsmaI9L2aCZgZ2m3UNLeS/Qpw8OMyuU8abfmHSjJTH1NwXf8mbeuPCrPEEnF8y/9geK1Vm0kOXqOkWqlnq2BHlXYey/m1+wXDB3gmvgYuyFYOdH65hSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161745; c=relaxed/simple;
	bh=k5yys5S/tOzjXlgUJKQ4zkuQnkiWv7sLoLchynvE9P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhrU6GLjLRGMdOz4+SjYuMkKy+M0UPapJe1+f1Ap292D/uQoapFZnVQ5Hw6Ho1AhkRbpp4HmY2mYXxVxXureG9Uf/mj2vReRV7SLiAzDal7vv8sr+THLaPMx6rgnvVU5A8UfSUyPEnmWiCmf2iGVrQpkBrn0mbqgU807bqDfUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2FiVVJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMQtdY020594
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbEF90318nog9hDoCsADIQtD0XbfSf3YmxtO0d/NH9Y=; b=J2FiVVJ3mJIYPWZW
	J0stjzC/mNXyM7gPtnfIlldM3Lsn/lJzZ3InfgRuBfjzoPhG3lqMdc91Rf1WfB5F
	NwW0YYuiGagQiQbFfP/Aj1APCt9QOUXjWL2bqEWHqK03dPxEaDk/jsy8eWoBG83x
	nr4TXMUfiPP7xMw7Mc3xXzPjhDR8PH7QOlk7cLUU86XlO87uorPwog0YdYCezC+F
	iwijy6CX4TZQ837JKYUnhEWykLlGWquVJOajjEhy3EQzUn1HHqSFwoa0uEdFZWP9
	5ur01dSBIG/ByVznwpiBL2a9o17P8k6NAUIxo+3aPxk49Oz+JAvgV8pTaBX6ALTP
	S0zCzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmf0dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:55:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458121274so8787945ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161742; x=1755766542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbEF90318nog9hDoCsADIQtD0XbfSf3YmxtO0d/NH9Y=;
        b=Enlj0TDyq8Co+SiOoB6RcwbAJTv+Zl2fwtaf3eZpJhxMrkTb0QkUNmGDWchhsO2ezd
         b6t0GgRfrevHAcLf8Fsw5SkSe2jkzWI2mgaFepy4yB9A1XpIyWaTedvHznnulb3ZkOLd
         Xnjh54jNnBFd8A+qz7EhLxLBzaPbUkx0rMCBpHzpLIG1gURVh9UA6fXL27h+kfu+AJFX
         1EQJbeUkLaXfIlgDhc572AEEMjdNKBr3X0IkdW4ahLGBrFtTgqdUoc2OwRvyGFQXoZg5
         7Wk0bNLGhhDihoV/Zr1Njxw0IQ0yBrO4/hNMyP2+fvua2EmEl1yVB56TIF5rmbVyo5y0
         yXUg==
X-Forwarded-Encrypted: i=1; AJvYcCUxIXTB+5RM0sgrT8hotUssCpyaaXkKb34+eO8l/jisu8yI7SwaroKWSVNtYqYi684FDWmPbLtlw6trRzA3@vger.kernel.org
X-Gm-Message-State: AOJu0YzbnODxeM+wku5/1gQs3vjW7KkEqAGxveEojLCbvCKYoCYotInj
	QS4Z+UKEVCS50tmV96G+UqQtGf8DB3o+MuGQkzKiXRVhbFIgclPZV7NKdLCB2bU4quLzUsdBqcS
	c9XtQJeKu+CbAQy4dXx99LJRI44L0PsIVTyiqMtUQmhlyKQJ5qmslTCrrOySk8wgiYvJs
X-Gm-Gg: ASbGncvHO0Vcur/A4m7igB+n+t2eTFV9Env2vYb0r19h+jj/7+l6ACD8gyD6VWmZr4M
	Vph9DV4EtEI2J9PTfFg24Kgpdvt6ztB3iKRBn4aJqqXcrqxzeusWlFg/9YuykeR9TX0duWXcI6h
	3FdRrtnW2zYMwYNQWl45L3rQKy3ibO3qXequlMgj1oYB/BEogYJndJruCOAlf7FwzjUNulAHUOb
	uv4Bvz60h+G24xdvqanqsg7vS5+fuyu7ivemx5dzIYNLiX1BV2AKg6FyKiSLupPuB5mvns3Ty4k
	clRNwEHNCEI85/mV9fAQpMynQyHRPV2N9xTwS68QINtxRM7aMgk+rOq1Gx/Ba7EQ
X-Received: by 2002:a17:903:2c7:b0:236:9726:7264 with SMTP id d9443c01a7336-244589fd996mr26058225ad.5.1755161741885;
        Thu, 14 Aug 2025 01:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhhmn6pyRq7PhG+dhIixzmgtZrhrr/8b1TGvv1xeW4QasfrlEgHNF+mHspELB38yIpIlLm8A==
X-Received: by 2002:a17:903:2c7:b0:236:9726:7264 with SMTP id d9443c01a7336-244589fd996mr26058065ad.5.1755161741440;
        Thu, 14 Aug 2025 01:55:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6713sm345395075ad.12.2025.08.14.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:55:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 14:25:23 +0530
Subject: [PATCH v6 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-qcs615-mm-cpu-dt-v6-v6-1-a06f69928ab5@oss.qualcomm.com>
References: <20250814-qcs615-mm-cpu-dt-v6-v6-0-a06f69928ab5@oss.qualcomm.com>
In-Reply-To: <20250814-qcs615-mm-cpu-dt-v6-v6-0-a06f69928ab5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXxzIncLYQaB1H
 iS63XyWZSkBLhH7ju6xFaFco8texZix0hGCK6zj/EsvurlReJT52adCuLXj21oiwIM3iNdslFxi
 pmhMZok9wNy/1EKOf8wrZ+DjS33OCW1ZLba4w97z8ZE1fs4UY9IGqKG32dm9JBCh7cvWR+JvQJS
 Hoh0AHsrJAb43vsXO0EuW+yD/PfDYbgyLFGGJjaIymn/yeIlVR4Q3hLgptfsXsQAljVk0KnhuB4
 sPShXu4TkN06er5oP93bl0UWiyQrweMdN//O7F1f733ABY7SIpOdpmnrC3MVWaPEvCSTnWOX8xu
 NpJJ70SK/J2f8wu6cmZyT2Vj4bS8u5NDh9MkGPFLOTHlpd9DdBu8ghwVOA/ppKEPQlGHN7yG0Dl
 aLu5dnbe
X-Proofpoint-GUID: kIFnwJ1F1Mu6Hnpwr-Uh7ThlLJWOrA71
X-Proofpoint-ORIG-GUID: kIFnwJ1F1Mu6Hnpwr-Uh7ThlLJWOrA71
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689da48f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eX7r7zjc-4eniw70hzgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

Add support for video, camera, display and gpu clock controller nodes
for QCS615 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index b66bc13c0b5e337bf9a95b4da4af33b691c14fb5..917d67a6a237a0aee3445212e3457cc723ab4276 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
 #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+#include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -1659,6 +1663,19 @@ data-pins {
 			};
 		};
 
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,qcs615-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GPLL0>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,
@@ -3520,6 +3537,46 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,qcs615-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,qcs615-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,qcs615-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,

-- 
2.34.1


