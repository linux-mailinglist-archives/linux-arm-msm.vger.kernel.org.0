Return-Path: <linux-arm-msm+bounces-99563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCXID74qwml5ZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:10:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7A03029EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FDF630EA8BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25CB3AF64B;
	Tue, 24 Mar 2026 06:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUnuOW53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E845F3AC0C9;
	Tue, 24 Mar 2026 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332270; cv=none; b=ObzHxwUZm3kKpoL8SQQ6a0tCgMdrl1h9rfZzFbL4aStqGNSxWzJyW5Q0jlkMP03YB3N+YKL4XZq2ITWkXShJrB5mI3JCtLOfbM5Mdk5Z6XwInwy3qrkpLpyfFdEmOMK5tVTOf0yjUl/dcjE3+MTh4xd0brZyoD12B26mUPcRkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332270; c=relaxed/simple;
	bh=rph/5aeYqW4Visq0V4WlY6TRCq7p8SbX8IAkemNbv2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xkj51ysmVsYzCMuRJyCOv+XD+wbYz45AixcV4d0AlBV3bHIWdin5PeMrcNjtJ8agbG7j3cfQZLBiKN35ggqFyxYsVhrc8RMxQJwL/P6Rh4o/NeMFvLI/52BBM9NydypTlIB14CCwjWMDEYsXRj4si/oSMogbIISK1U+n+RfHbgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUnuOW53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O45NTT362509;
	Tue, 24 Mar 2026 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lk48Lm5b8qm
	sYpRUVD6Bwa/8M/Uhl6EDYSWvXY5fsJc=; b=PUnuOW53nzD/PeAVCv4DB01Ltzn
	pu6t87H+2t3FbYhKkYQaiTEDw1GT226TyyWVHbvUz3VRh6HNSw0WmS4sbRT+/ywO
	oB7UIuzwNKFcAaC+X6nApT3ytZPFf//W7gNrJdaYebynCh1Nl+pVk3zAuNFc/EeX
	x8YHkS+dFhsx1N0sD6w+2iA4Oo2EffvENkP2IoN3P6Jh55MhL8R5fvvcnUMl1Zgx
	G0mfkJ31rvls0q7YqRcoWBqrYbSKznuaIjD57Gwfq6DKMjq7tQzUMR+65YoeG4n5
	UIwo4Jf2sgrR7I6AEWjEFhScwGDpMPc6JR51l/BOOl/KHhpCqNc3/E289vA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k33rur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62O64HG4006073;
	Tue, 24 Mar 2026 06:04:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d1mdmavxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:17 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62O64Hj0006063;
	Tue, 24 Mar 2026 06:04:17 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 62O64HoX006053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:17 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 1038C22C29; Tue, 24 Mar 2026 14:04:16 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
Date: Tue, 24 Mar 2026 14:04:04 +0800
Message-Id: <20260324060405.3098891-2-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c22965 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ZmyhYFDlZrQhgxRmxmAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0NyBTYWx0ZWRfX2E4schWvmYfT
 Rn0YWqnKiyXemnBMUbubfeOdLMTAoN6WwJZWvXdbdch9ERb3KICWFqgxEGXq5WzK84gVLLvZGkI
 gCFzPjeXYak07EgqKGv48RjzcQb6RM3sXQcgggcPpb7ClZ/inyyHLJqtXLGkQIDd90lfrLic+1S
 WMhtpQXOFfgkkv+psRvA9WEJhzefuyA3Od9CCJpTuSgyBtmWr9JxtvFrKsrltyP1XRgJuHFBuA6
 qajPb9WCwgBR7sHOKC/9nlJB4Ba6e7TST2XyT4U6eyJ2JM2jfUyAQz9ichiYe5t255E9DqVplbo
 g+bJDSiom5xCDySMiRtb3J4agFmQS3t3cSFwukU1cXplPHDpH5KEjh5O4762JektghTJ5s4OpXr
 TeyKmu4HuOqAJEgO9b2Bya9/Cfynn0KD1uEDynEzP2GMdQpvsjtBECe2acKDtAdnQk9ARfzKt3u
 wKByYXMPlMj6DRP7f1w==
X-Proofpoint-GUID: _2LAZdjXrJgmSNvO2m27hQzN2JXf2F86
X-Proofpoint-ORIG-GUID: _2LAZdjXrJgmSNvO2m27hQzN2JXf2F86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240047
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_PROHIBIT(0.00)[0.47.77.96:email];
	TAGGED_FROM(0.00)[bounces-99563-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.6:email,0.0.0.1:email,oss.qualcomm.com:mid,0.0.0.2:email];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8E7A03029EF
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
index f69a40fb8e28..cd451a112573 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1553,6 +1554,20 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			mi2s1_pins: mi2s1-state {
+				pins = "gpio108", "gpio109", "gpio110", "gpio111";
+				function = "mi2s_1";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			mi2s_mclk: mi2s-mclk-state {
+					pins = "gpio122";
+					function = "mclk2";
+					drive-strength = <8>;
+					bias-disable;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -4696,6 +4711,45 @@ compute-cb@6 {
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


