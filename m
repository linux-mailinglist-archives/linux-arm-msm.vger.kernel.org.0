Return-Path: <linux-arm-msm+bounces-102400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM+sKPkX12k1KwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:07:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8513C5EBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E95303DD79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 03:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592D336E47E;
	Thu,  9 Apr 2026 03:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Px63diYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7837104C;
	Thu,  9 Apr 2026 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703739; cv=none; b=H3HGdfTFd1VoB2CeYg+4fTAC+9LlCRieksGcFzD8dgS7fqswyc4YgV1TPRrAoSljLPuVq6EJNj7WvPWMyZeTLS8z6wscd38S74u5uVUwkA+YySBN5W/+I8Og+g21KSrIMKKFSMtzdXsCxeWo3zORX3DyPpqxHKKGMf+orRlnjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703739; c=relaxed/simple;
	bh=+i8zsLocgwfpR8UGuaTMrkhGu9f6r8xr203DAJfxuSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bkQUGf37WkzL9Hw7/28rXt86D6Wa4A6u8q/6S41Awk41n2K6Gc6+uozirxmEAoBfvBdza/AJ9l/47PPML9u2oF94FYWYv2bLP1OBCz8R8HTHIhdZH/9SmWHAKKGnUMgeSIpi5coZNBVvJKmQbDuULa6PvlDMFyQ/v5SOobxDrYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Px63diYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638JefI71727438;
	Thu, 9 Apr 2026 03:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jvMXIof9D+X
	K6DorwB7tpGBbLTL2RNBOxetfcoRyaws=; b=Px63diYau0IlzkFCpp9OL3B+PcM
	AhB2SWHvZIvfA7dRNU9RuVsikT0ThThY0F7Zzyvjtm3q2JzOkf/GL5VtZhEcWHcK
	gm6MRXcaE44qfJuU9uyASy5F12PBU8tNF0/tAb+sybhIk1Ra0Lj1D1Ad1oNGAZHk
	ihoRc2ylJZeyKcqR2xIO2wirYC0EhySoNK7DBBL/0KbV4V4fmcu4qfHvBRkFNxls
	Bt30qD1Jli7o8pT6BkUyhd/bB1vTwhUdE5zFkwoEd1O4uYfEYvlhqnr4SRD4EY8i
	Fg4sungZwkSb7eyp4YsIJBBT2F6FvfGuP0pFLdcrAX4bZlKi2AywKWBKt+A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrs9c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 639328h7018149;
	Thu, 9 Apr 2026 03:02:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4db3njt421-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:08 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 639328ex018142;
	Thu, 9 Apr 2026 03:02:08 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 639328Gv018137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:08 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 1799322C99; Thu,  9 Apr 2026 11:02:07 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
Date: Thu,  9 Apr 2026 11:01:55 +0800
Message-Id: <20260409030156.155455-2-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
References: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAyNCBTYWx0ZWRfX5hF+Rk8ez9hV
 Fc3pbnfSMRt8EeDp70TeH9IH7t3VLjaC+pobchjx/OUpfh6muEmi7sL/A0eO6+11w0aPm4eRbiZ
 HLHyZjNvY+TYDVO/YA4w/73JWwhU5GugdrXhXOvyjEVsyN9WMqQauhQ4Ad2vDzAf+n8jummMInE
 cHClE8al7AgQAGxuYiW2hb7R4hrVIm4DFFKg3nKCXGr9QKHmdXiVvMqLN0Wdgxt11fx95hKkDTg
 3ZXJpLlqBdKIbuadg3GsEm3t2wGiLmhE+HbKReDcovgFGwNdtCAdipCp2cZYXVaIYro+JkH2urV
 YXoavaEKfkp/GXiyAnpFFxcXaOKdUg5thCyYsb1ewqNKeiq1I2G095SxXBZgRdwbU6Apt9zdGLR
 fSVNYuicbqCeRNm7tNsy40tp0xMz9Y4vBlkLXDr3DSdR3H+OtO8zPUU5WXJez81DwGORxPRp2ap
 NucCtOHJfJwowHrJ+6Q==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d716b4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ZmyhYFDlZrQhgxRmxmAA:9
X-Proofpoint-GUID: G__0xfPePIjMM8deD3msG5DRkUnz0GSV
X-Proofpoint-ORIG-GUID: G__0xfPePIjMM8deD3msG5DRkUnz0GSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090024
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.6:email];
	TAGGED_FROM(0.00)[bounces-102400-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB8513C5EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds the Generic Pack Router (GPR) node together with
Audio Process Manager (APM) and Proxy Resource Manager (PRM)
audio service nodes to the Talos device tree description.

It also introduces MI2S1 pinctrl states for data0, data1, sck,
and ws lines, grouped into a single entry at the SoC-level DTSI
for better reuse and clarity.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..64121316ffc5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1610,6 +1611,20 @@ cci_i2c1_default: cci-i2c1-default-state {
 				bias-pull-up;
 			};
 
+			mi2s1_pins: mi2s1-state {
+				pins = "gpio108", "gpio109", "gpio110", "gpio111";
+				function = "mi2s_1";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			mi2s_mclk: mi2s-mclk-state {
+				pins = "gpio122";
+				function = "mclk2";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -5132,6 +5147,45 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr: gpr {
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
+							iommus = <&apps_smmu 0x1721 0x0>;
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
 
-- 
2.34.1


