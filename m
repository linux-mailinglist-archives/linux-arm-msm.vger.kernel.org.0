Return-Path: <linux-arm-msm+bounces-89114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A564D22A12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5C423052476
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EF22FCBF0;
	Thu, 15 Jan 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bh+Wb3WF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCjBuaZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB82F12A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459773; cv=none; b=HKxgNXCV67Jcw1pX0FZWuXZ7NDwX9TSK+wig5KKGA3RdOupF0hkLH3E8BdZZvq+SNrAAoeEbBjDZRglY1mu4H8ycFAVyB1vR4xv+v5b7U5GSoyTDZFr8LCEIUhxH2AFLdjeGyAldWBbmbTPDWKLzGQbpno8rhzU/qB+tPfqg0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459773; c=relaxed/simple;
	bh=xp2OoNJ/JME6lm3gL5GdAzpj7J6D/7fvnMTRotvZFng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9wzzOC3Z0hor16C16cKFXGUowCXKx2yaHsCBZu2KutoCSJ93uzDshHSjGk3wwhn/FzZCFdDy9MgWBB1cf7ZhtLAorHxg3ASepGS0WMr+H5g/llsUfRNa8f8MyjHyfOM/ejSy0pEHvmWMA3FHLPbb3TNkMb5gHNosuHXEqfUWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bh+Wb3WF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCjBuaZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g0rs2074728
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DwRXuth5sOfxC/h8qXw02imj+yI96ScM9yQouU7S5aI=; b=Bh+Wb3WFRMM9n0G2
	TsenAl+7U+YDDin/JWpnvDapA+EjzAaub6WORTlrypbXldYV7zrBK+P4Ro16G/8M
	2vV1gYNqwVKsJ/atjiJeJTHjOjk/zjvZ6umX/wGKZbCs3crRXB3rob6LeoMiAv+b
	HHFZzbBxEKFzzystF9sIeYKqAJMcvPj5jVYDnJ96EyQL5JQwfIQxz1pvnoV4Bt9W
	ZpDiO/NEFKPVcp9O/eSGyc/iAI56BUGUw+w73Elm5fAg8QeGRPE70RAUUzvgqGTB
	vsmN9gelhQeSxir3ZqwgxkuAoPfxhqoQcTp+ChFQ/UeVSxBbwR14+1AIGSk50AsF
	2W0EKQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hfny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae32686ed0so4712065eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459764; x=1769064564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwRXuth5sOfxC/h8qXw02imj+yI96ScM9yQouU7S5aI=;
        b=iCjBuaZmKxyBoVdbM8p8Y8S+SBmQ2hwEOZ/xNTwBvB1+7jUU6/lcDjEs1lTHuqnJlJ
         mTxj70/TRSIbxcIUbK2jP8nrlhTOesZVIf5l15BGRh9+4Ad4AlKMh32shcFyATqHbzmv
         FFHZzXh++tNWnik+RGbOzNcP+IACyo4vmRyZ6S+GoUpjUhXKvp74NalS4ZpBc3ZuuTbZ
         AEjzT9XE5Ruf2ifdvXUYkVoK481tGRwImBA+S43IAZKWpdh1bOBAPjZ8Hve6s4eT4MIU
         bgsVcgsbtc8ypQqFe8om0Q0UhkeqyEFHwI6oeVkqht2NAAEItGdI5kpJ1ZpfzwErcnJg
         01Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459764; x=1769064564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DwRXuth5sOfxC/h8qXw02imj+yI96ScM9yQouU7S5aI=;
        b=qZ5ZBj80R4WgKaI4Uiph8AkdxJ6ZGesKSr2n9NDdA3MuxL5qPgSVrTOUHnEEhKVBdz
         xEytHRSvrB4Y2IdTURVymISWqBeCX/fapzi6xtHaSah6N0auenofYDj0sHrxtcuUpoh/
         PTjjV+IDweAPLCpLMIvgZ5+eMtykW1dRFJzEWjFmnBy5bUg/gK1m8U0H6KqLwXK4NWUJ
         AQkSsmUHW/YwiLG8SE822w91hhhJ5rMM1I5WqFSwzECW1vVeG9H/LfF9u6icn5Vf/EvC
         a9PHhZVQcaaPDom8n4/vEwB6RDs5WbE3lDtd9v7q740zxSmkt8qsX+ip27Q3LKJfGo0L
         MxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo/X+bSITrgCKrE0mWbfE6OHd5HGDMeC2YmKXS6uuPMPMKn1h9gz3n1PPFMbBS1WogG2bISnE2G3aoHF0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YykGvDYDJeLXaicq/jB0CI/7k1BC4trB7p150dL8pSPu9SHbTdY
	coCHj0amOlqZAtuTsT+tY0vHcq1fzfLBLgC46b0nIZEmqHibCHNiGkOKLWZ5e3aiFrJrSyFoa9Z
	9yVGxlNRi7uivd/SljRyDHR3nmcfGDThFMqb1H1pJBujFac2bksONqXumtK7aSzkZhFNR
X-Gm-Gg: AY/fxX5JCtJihWsE5Mkyk7QFSgDYJwYVgozXNyhQFvJ4aIpzxrlzINXt/YTHaPplhIJ
	yPvdYvUVGMgnpZBt1OHg+kBQ6hvMF0LQ1x/KavdijEpAnwX5wTMH9YOKh+hUB/EF+Imbv5f4qhP
	AGaFanmuvnPl2TW1rPfakH2EIGNHIaARiYBS+ZdV0mslNw7cQfmWh0xXMaH6g3gk0Dufehn1lo+
	kiccROAID6Nc697btJdaYiWI19bDFe2yiK7140wjHY6+DLF6i+tadeoRILCWBbKdyFkZy4IpCzs
	dz795cVNuTJrR02MlHA67u39BrRYSDUdR4Aog+Y/op2q9xNklusYL3fSbzNozHGE7g3K4CgcrV5
	xdb4m4PPUxe6VsPok98YklfFi2ck3PSMtDWGsAp8UQWRDSHBTL0cHMYjNQlqr
X-Received: by 2002:a05:7300:549:b0:2ae:57c2:7c96 with SMTP id 5a478bee46e88-2b4870693e7mr7578625eec.24.1768459764278;
        Wed, 14 Jan 2026 22:49:24 -0800 (PST)
X-Received: by 2002:a05:7300:549:b0:2ae:57c2:7c96 with SMTP id 5a478bee46e88-2b4870693e7mr7578593eec.24.1768459763708;
        Wed, 14 Jan 2026 22:49:23 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:23 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:11 -0800
Subject: [PATCH v3 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-9-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=4376;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=A/wP8vKRq63n+rmtODpcZTle9QOXAomtcrBdNDPUjzs=;
 b=vy08cXOkAzQWjzy/Yg9fC13wMA1bkLb8PJ51Sm8d1rq/tJToVwJspoigcvchUnOq/OuiR/oIU
 5I4gKtzdt8+C7/Lj7L+EESgQAB9Xd7XsLHWbPeiwGmPjDZC4Gb7YOkC
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: WXJnWuHIDs2eUuLn5lqz5Dytv-LXufQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MyBTYWx0ZWRfX+6zUSFfwxVaS
 06emxQsn3L1W0HIoxIPJ3cG1pkkhAWr9TublGrrtPH2cwslD4hAIIUspIIgl9x28ZY0mH4s6W+4
 PrB/bcF+G8TrovYm1XKHbWId3u+MiP5H3nHsGCRW/52WuF7j/BLhqQ1OBV/nQIfV1NAXF0oW4W+
 UsuOzLSQD7L2DMtj8z8ViagV4EnT+yi8t6HLRWmqXJV6YfIej7Sd3sJtUL2YTASVZc0zuXyEQtE
 XtDunD1Lg3aGjx8E0YkLF9206pycY5wfuaG76sLxwiHjFEgMIOVHFIgP8MYKCHiAG2uQGAZ9qd8
 PMxoSfbq+J4RcglYK9dmFKd1Ij+inz0lX99JNVHPYlYkv/rlW4Z9RyLt3XjXWnQi3esnAC6LKlp
 wrSQQ1h/fRbSeU7eUGJr5zpYmuNAOx2D9NOD0kRB43HPCaNAX6moheOuZyH8lzfinOBx4GcazXA
 K45h90/vakQA7Fi5gsg==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=69688df4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y3HLYP14RHR0fgYgac8A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: WXJnWuHIDs2eUuLn5lqz5Dytv-LXufQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150043

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the device nodes for the multimedia clock controllers(cambistmclkcc,
camcc, dispcc, videocc, gpucc and gxclkctl).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 102 ++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 30705483ca20..8689715ae24f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3,7 +3,13 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
+#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1594,6 +1600,24 @@ aggre_noc: interconnect@16e0000 {
 				 <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,kaanapali-cambistmclkcc";
+			reg = <0x0 0x1760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,kaanapali-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2569,6 +2593,46 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		videocc: clock-controller@20f0000 {
+			compatible = "qcom,kaanapali-videocc";
+			reg = <0x0 0x20f0000 0x0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,kaanapali-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,kaanapali-gpucc";
+			reg = <0x0 0x3d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;
@@ -3139,6 +3203,44 @@ opp-202000000 {
 			};
 		};
 
+		camcc: clock-controller@956d000 {
+			compatible = "qcom,kaanapali-camcc";
+			reg = <0x0 0x956d000 0x0 0x80000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@9ba2000 {
+			compatible = "qcom,kaanapali-dispcc";
+			reg = <0x0 0x9ba2000 0x0 0x20000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,

-- 
2.25.1


