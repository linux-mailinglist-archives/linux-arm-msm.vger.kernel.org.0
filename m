Return-Path: <linux-arm-msm+bounces-71831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F8BB41D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE3DB3AB184
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D1D30276E;
	Wed,  3 Sep 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5ZoMyae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17E3019CF
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900114; cv=none; b=Mpx0G/2mw0pgHyul3YOtbPo0nuFQ64ywNV8sHK8KyjFB+zGXZIfaeFVbA0cHZnKGfdQhfQgv2VL2mFM7JxGSHrH0SltPLZQaOML2HhRSOfXULE3xMBSPI3nBVdh5UF+DTu0gZiq4AJPkSTkllAI6+TDnF1K0nvafiqrmkhrO0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900114; c=relaxed/simple;
	bh=Q+4M1gxYM9HSpOhjer1cCvNOrpmuy2jkOdR2r3bDUIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buQm0kbIBWoxn3sHoTfWbnvFkrINsV4A5nIX7pBu221LMLeEufg93sFnR/BZZMKRJj07Y1LVGqmUcNT0kMvjFsHogOze/7026UmNUr9Ca1UZVb1OdHDXfczJ+iqUyf0hr5c2+tU/XH1nxP/uoB4s4RU035YtvqI0gb3Wi0mvi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5ZoMyae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFPKM011462
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yoLPIunPhlxXFE1YCNYajxXEoQDgef9KEiYtHFNANU=; b=V5ZoMyaeQ/IMBAZS
	NSftbvkO9lVLdFO5Bi0+h1D0e2XRtjZGPbUKa/MiyFhRBsml++Cdlefsu150yOpb
	LmU2ZdFqVbpnklrxTkFpG09MEkybAzoF6BRU3KU5sQ/hDtUIsBQyH7O//KJcgKaP
	F3ytORc+yQILisfLCCWrW18NZJJLRqgqlOfiLWzQiA6Zfc24MOGAXVC0LLDtffOu
	P52k8N8rB4hqhd/j51ohY9TLgWoCzmzJdlynX0mH9/SvQrFZH77bXIIESWFZ1MEj
	2VQKZcNTQMzXMZCy5rC7yAwje0LReENfZrBR0BS5gEUhRDd1mFlM5ctF77VUOqto
	o0WhEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjkens-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:48:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4d48818a04so4074649a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900109; x=1757504909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yoLPIunPhlxXFE1YCNYajxXEoQDgef9KEiYtHFNANU=;
        b=tbm06z9mV7A0t5r+bN+zZJDQDTCSjyZiE9PKBAgUpA71z3sP1/Dl1uYPXoKkiLSKUI
         NgDH1jzV7/RFznn3SpxABu4+JVSVlzKQK9dSWKnj2jgIobcrCn0TYJvqDftr98lH7PAU
         dMO50f8XGHpKRPt0lqRKl6KPJ2ZnPcbHN8G+qzunzejfEGUGgMgf8yD7TI+aZB4Mah/v
         43rWbmF2ngXzmxv78VnXh96u6SUZdGuhMWy9IeprlDNl8YOXD4cs1Y6Jkv/xwGmrPQUY
         uNA5+S+ZH1bnS+yOK49UPu4uCHESrvw4Ny7KdJQhQwFCYK05EO2Bp3waNtG1otU54u8j
         Btgg==
X-Forwarded-Encrypted: i=1; AJvYcCVR2yH7WAx/W/Uf+Zf4ZYiNRJiXiwYZkzOJSpvloUVO8KxdguIddgfIftBGAKMMR0j6TB81C7dzUibaTkdH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zhBzr5oqPbgwoEv6KtUoDZzMnnPi2d201WyADcDXw3pCNPDl
	dy5RrkSpa9go8YrkDBCsiSn1Xasz6l6CJO73YKmMJ3kETK0Dzn7Us3CWtAW5g6Aw0kmPbbPkXbL
	HyQ5sU7bPiuvOfdt5Vb4nhS+OlC4ANcAgWeBHt3eb5honx0DV2vgBwpb6/mHXeh91pcwo
X-Gm-Gg: ASbGncvY61yw87M1aEFcCIGpSHXQYp2bPlhbdHKXCki2ZjkqHGrztaXPiNmK1NmGbRF
	NMzvpgvGUxoqlL8V8mjSUKlOpF1lf2of9eyp0OtwmcGPwNC9DnQGc66dQYTJG7oQDui6ymv8kVx
	0tR4I9x1QrqYIytN2SAAaTZ8czKoT93C2y+0ci3n82JgUBbNSE/yOdiaZYJgrCH9+9LrhvQFkVH
	j41pD+RAXXisDUz/L0xfIo+DpHE4ZK6lBo4MbeOzwbBHkrXQzVuO5avJRb8LXDaWYIjfqFyVqBb
	FbFop9bwy1us3EgLrNps2qfs9kZNK0MK9EYmHaUcqp6vPfYpV2XOqQuJkw56nvRC0fyd
X-Received: by 2002:a05:6a20:a10a:b0:246:4bd:b1e0 with SMTP id adf61e73a8af0-24604bdb601mr4899141637.11.1756900109293;
        Wed, 03 Sep 2025 04:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAWInvuzPYzNObB97vfhFOKCVNEC/bk/7+AjIv2wJlRbSZhoDyW3yO6kIqh6YF/MAAVsUJHw==
X-Received: by 2002:a05:6a20:a10a:b0:246:4bd:b1e0 with SMTP id adf61e73a8af0-24604bdb601mr4899109637.11.1756900108811;
        Wed, 03 Sep 2025 04:48:28 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:48:28 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:13 +0530
Subject: [PATCH v2 12/13] arm64: dts: qcom: lemans: Add gpr node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-12-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=2037;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=U/3aiQXpOo/u0LdqKxwMBduUHkRjUaNYx/wLMpz8xkc=;
 b=oknvzwqjjZHQ+lM3hzDmbgunEZPkHv8q/ZeUVHhRQ06P+pw430u+f7T4pnXpjUGz2rrAewx4N
 DQTGHRuuSd5CnIsNIR2doOiv+j97FbkbvVtyredmF73OecIYOJgyPRa
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b82b0e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vHYnVJDjh8PKMNTngWAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: kD-xTfG-EqMmBmqnlPGZzIpgiPJNTj3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX4+os+dAB5Q0j
 VNhbeaXw6XgJHioGzidHDR+ZdemyXmP0Bn76t5X/iYL8eTYbJx/b/ft/BIzrrldDWlUjT5oI6St
 5XDBP5y/Ld+QdoN4dlaaHMz3sgjYfhfi1np/yeW4tU7Yry/jY1iDwg+C3Y/2823S1LALJ3yAfqW
 Vy3uIgDtKSTSri9TsyemoYWDBBlTodC70NnOe2NVK3cOG8R6DKBWfNdpfHg+r7aytDkRn1w98ej
 BxTgBMuWhD6WYCaZ1F7wI6R3dOdXLtdst39cfc2DWNn+93211p1rYmUPN0W9o/A1anwVL3/Zkf+
 kgwxDzqgJowU/LUaZewpExZ3kLvtF1e0W4JgMcYvV3potxyoe88cI0Gl6ZP+tdJZU+SzjYwRMSb
 lhjeNiR4
X-Proofpoint-ORIG-GUID: kD-xTfG-EqMmBmqnlPGZzIpgiPJNTj3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 9e4709dce32b..41003d8878f0 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -6700,6 +6701,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};

-- 
2.51.0


