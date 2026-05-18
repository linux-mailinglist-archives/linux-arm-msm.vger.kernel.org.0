Return-Path: <linux-arm-msm+bounces-108086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMtmKy6pCmra5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:52:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BF56675B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E71A23000A19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 05:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7753C9888;
	Mon, 18 May 2026 05:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7mIZzQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hww2pYrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63C309F00
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083300; cv=none; b=Dpuz3HOIMX289rzt7/ynShKONatHKb0wz/7XYpp2fKHSOPNbUjqMsVodJ76qq8Mr52CogSInm9KAtzcm2s52/EH859hBaC8iWGmmfW6RUIMiiIBFsDUleguGGSwFEck8vyh/m3AGNAWhvcnaP0mClCwIVCo6jqIww2GiZlxSjEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083300; c=relaxed/simple;
	bh=vHEeoA7Tb+W7OBFkM/tkJ3dWuRITf9w6E37bqfeeKuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P6JaZXZmoVh8Kx5L6PPBZ8TIi22SZq0EVIG1TT42eAXqSPhoZsTfEunm/XzkRopnRV2J5JZF1GMAAM7mggz2VVgo0O2dl7GByxnexVoU12KCflk5zsqjhIEhAORwyHNh2pou4odJdGiG1XwDlSzcaUuX3FqxmZJpi7KAT/b4cuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7mIZzQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hww2pYrg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HNu3sF3838563
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uFwT7ZuKUzG+Ii/CDd8GWo
	TzmC32Mo4d+kGOQPzqcsk=; b=M7mIZzQo3foXX3fWMykaBXLB8puIgNKY/nJNnq
	41DqaZwajWB55byKXJ+9ZShntIln+Zq0KeT7MGy1ec8sSyAMgM0Cr0CrN7XPEWms
	iewNXpOkLk00ur57VWbA+IpYUyfgJiGY9HqTwJgHAHyfe6kDFM3qgYpWj6Kbqp1M
	T1Zw8+r6S41d2Ge79QS0ty4pZ0fv4taebpuUT1zhG7dDEd4TbLPiwWuNOAcitUzo
	x7dOLDOfDIKzoNubu7ny2/I+esO8+bNsYO1FbBLHp4S+cB0U4JzJPQjBfVvG2r2s
	wnm3kPRjbsIEqJw+ZpiR5Ov/S1ozJb+aD6rdQ6/oSvYH103g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7vqmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:48:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827bda3052so2917462a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 22:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779083289; x=1779688089; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFwT7ZuKUzG+Ii/CDd8GWoTzmC32Mo4d+kGOQPzqcsk=;
        b=hww2pYrgy/S+VkVPKKmDM5s6+wIzkNiKO6Hpr8B1Ag38cY6Rl5+WmxoTCdvijUL9GJ
         hKfIclvrlK94Um62rAUYgD8DZm7Xbi/AjdldB4Xw7eRtax0OP9y3umnqE88W8vQZ5mBc
         XHsvHBjpZHtREtMUeh9ZonVgEXQ9mDzuf3FJSPAevunIylreAno5/Gi2ThJTxUMY6u7K
         ObqWWkZ4624sdqySSbbDpYQZVA0jw1I+UA1TCx6VHU5VewKrB4e9uB0OO0AR29dm8aW3
         +UU8rufAcf1RqXHf5u2MwNxLCSBDzPEs7fuJb0EnzTMEw4Cyr4dKYknPddykyaTpJ7Pf
         i5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083289; x=1779688089;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFwT7ZuKUzG+Ii/CDd8GWoTzmC32Mo4d+kGOQPzqcsk=;
        b=M4cjV/Y2ddksCW5fNo5anjZxaYt8Bo0P6y9JG5/8PxD27jV65L3AmhnxhQ9/amT6zu
         0ao0eRwgZoQyO0Hdk3352u84J/w7cE4QR+G41uav/+mX76ZAIiQbQBybY4Qj21F06r+C
         nK1RP7NLy1pwR3F1PCsZR5OldjnKRsefXhWrV0WUr57puFpQNm3IVH+QoOCmCWra9jSK
         Fgbcgo5veCRldSl8tOZ6bJradlqu+HJVNCtHg1wOM5nFgQl9cUkuriV+q1NG1OAJhdTr
         QBHoP+3vc1+oDKP9rsL3YewgK9ezOIbNhRO0W29rUVsPdzQ+c51b2EMzFxML/Dw7dr/p
         AufA==
X-Gm-Message-State: AOJu0YyTASJidqSIbATUDwI4c1Jc1eAUeK8oxVks/iNbpj8Z4+iyjHBm
	Kup4v7Rzyohps8NRbZD+OIvfIZSCWFU0sA45v3FYtzJeG0FPXOSxIRWb0arkB6ryDwB/cBiKboz
	tsxu8lKGWiWi67Vwxf0iErKVcggFoKYWjuKxIQFkJ6pxvbha5i4oBSi4yNM3eGGAo14Yj
X-Gm-Gg: Acq92OH7KI8jU51Sb+AJb1zN7PSc4wWX2mao8qlcaST+lyC8w9XSboivuQ+Obfjmfjl
	e/CCbLLxJsYTTNcUheCwoqDu4Ft+gu15svtTc9aJSuizL38gxgobwSG/Zvv573cN2uhXhxi5cu6
	HTOthJ+Ie1nXvkFZfDv76fWUSHJwa74htRrSpYWb1y4q+OPYaxkQ9lsfZsrRcciNsL2k44FIXfk
	E6orbxy1H0KbeUwt4wu3uyDTRzcoFMrrc9xv/63/4ykx/PSDt5reLJSJwZ6gBXeZPHwsXTll+RL
	XSFyyVY5dz/YYAsWtpMoSGv9W1nVqtE3yd1qJL62jeefBN5b6TVovQK1TqloRIN1h8nOepK1GNR
	lk7be1N2TtxdjWoGcE4ezi/8ysEalrx9u6V2eqbMpPc+pG6Upj0dh61iF9jb/5Z5egleYdduOgY
	2xU7OCJI0D
X-Received: by 2002:a05:6a20:748d:b0:3a3:1164:c7a6 with SMTP id adf61e73a8af0-3b22e81f7a7mr14880628637.14.1779083288616;
        Sun, 17 May 2026 22:48:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3a3:1164:c7a6 with SMTP id adf61e73a8af0-3b22e81f7a7mr14880581637.14.1779083287850;
        Sun, 17 May 2026 22:48:07 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm11970059a12.26.2026.05.17.22.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:48:07 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 18 May 2026 13:47:49 +0800
Subject: [PATCH v4] arm64: dts: qcom: glymur: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add-coresight-nodes-for-glymur-v4-1-45f54f441899@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAWoCmoC/42NQQ6CMBBFr0Jm7RCgVMGV9zAsCh1gEqDaASIh3
 N3KCdz85P3FezsIeSaBe7SDp5WF3RQgv0TQ9GbqCNkGhizJrolONRprsXGehLt+xslZEmydx27
 YxsVjXia5NqYkSwUEyctTy58z8KwC9yyz89vZW9Xv/Vu9KkyxUKZWpa2zm7YPJxK/FzM0bhzjM
 FAdx/EFZg+exdMAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779083284; l=23691;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vHEeoA7Tb+W7OBFkM/tkJ3dWuRITf9w6E37bqfeeKuI=;
 b=xPuAbAbeUonMvyC3rsaJyoLeeoQi5v2EQC4Kpwg017S7d56qZ8GAmDXdHPImi1eBHw5V5fRCJ
 fX0MeCbg8UgAuiWB26Si6bZG0FD3GR+Gs7kspS0wbRzqm0O3l6hTcmz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1MyBTYWx0ZWRfXwB3hEZ3WlBKk
 6zy04idzp+KHws/r1SoWmA9liJ4lE7qNK4bvUM0xJdb8IwCiuJnwmCKAF+jiroThco0vd6WTajt
 XfCVRMu/DcqZ9Acupkv3rOe8A5llWvbIsNgIyQ+CgMY0VD+12DWn0C/XDB5Q840fG8Db7VI3yg6
 423s0Rr6SMl++FLK22mOlBhBJRQFcLgsyXvnMg4xyvEoILQ2drfZDzxDjCor4/HZBREo6XcdDkz
 oyc3XvkuqxrN1aSd9uOgv8SWMyHz9sZBr6FcuVdjv41gmUdPBLSfzqUJ/0vRJt94RGGARuFnDLT
 3S064CPGzbzrVdOXNXxv4FpuQxK+LadBQD7qYxWcc0oppKVFiiMYE699GrYxKZHE+qXbSY+Uv91
 3IYxg7SSPCcldF+orF04a+grHOG8YfXINHGsYCz1ZseqE3vedMkUzhie0R4kTvJgeGrJfM+kIku
 EWr59+vVet9LKKd0ZKw==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0aa819 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ym7NTek2rUbMElXwnXkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5yRxg8bI36iQzMGfHBI70AZNSMTzOm-A
X-Proofpoint-GUID: 5yRxg8bI36iQzMGfHBI70AZNSMTzOm-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180053
X-Rspamd-Queue-Id: 0F9BF56675B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
some small subsystems, such as GCC, IPCC, PMU and so on.

Delete cti_wpss DT node on Mahua since this device will cause NoC issue
on Mahua device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v4:
1. fix the wrong MMIO size for the traceNoC device: tn@11200000
Link to v3: https://lore.kernel.org/r/20260515-add-coresight-nodes-for-glymur-v3-1-83ab39db275d@oss.qualcomm.com

Changes in V3:
1. Delete cti_wpss node in Mahua to prevent crash issue
Link to V2 - https://lore.kernel.org/all/20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com/

Changes in V2:
1. removed two cti devices due to GFX block is down
   - cti@11c42000
   - cti@11c4b000
2. changes two TPDM devices to static:
   - tpdm-cdsp-cmsr
   - tpdm-cdsp-cmsr2
Link to v1 - https://lore.kernel.org/all/20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1097 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi  |    1 +
 2 files changed, 1098 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..0c9165d738cd 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -341,6 +341,18 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	dummy-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&swao_rep_out1>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-glymur", "qcom,scm";
@@ -5501,6 +5513,1035 @@ rx-pins {
 			};
 		};
 
+		stm: stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					qdss_tpda_in1: endpoint {
+						remote-endpoint = <&spdm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					spdm_tpdm_out: endpoint {
+						remote-endpoint = <&qdss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel0_in6: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1102c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1102c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					gcc_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in36>;
+					};
+				};
+			};
+		};
+
+		tpdm@11180000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11180000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11185000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11185000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_dpm1_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11186000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11186000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_dpm2_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in6>;
+					};
+				};
+			};
+		};
+
+		tpda@11188000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11188000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					cdsp_tpda_in0: endpoint {
+						remote-endpoint = <&cdsp_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					cdsp_tpda_in1: endpoint {
+						remote-endpoint = <&cdsp_llm_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					cdsp_tpda_in2: endpoint {
+						remote-endpoint = <&cdsp_llm2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					cdsp_tpda_in3: endpoint {
+						remote-endpoint = <&cdsp_cmsr_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					cdsp_tpda_in4: endpoint {
+						remote-endpoint = <&cdsp_cmsr2_tpdm_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					cdsp_tpda_in5: endpoint {
+						remote-endpoint = <&cdsp_dpm1_tpdm_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					cdsp_tpda_in6: endpoint {
+						remote-endpoint = <&cdsp_dpm2_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					cdsp_tpda_out: endpoint {
+						remote-endpoint = <&cdsp_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11189000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11189000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					cdsp_funnel_in0: endpoint {
+						remote-endpoint = <&cdsp_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					cdsp_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in53>;
+					};
+				};
+			};
+		};
+
+		cti@11193000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x11193000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti_wpss: cti@111ab000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x111ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@111d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qm_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in35>;
+					};
+				};
+			};
+		};
+
+		tn@11200000  {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x11200000 0x0 0x3c00>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					tn_ag_in6: endpoint {
+						remote-endpoint = <&mm_dsb_tpdm_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					tn_ag_in16: endpoint {
+						remote-endpoint = <&east_dsb_tpdm_out>;
+					};
+				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&west_dsb_tpdm_out>;
+					};
+				};
+
+				port@23 {
+					reg = <0x23>;
+
+					tn_ag_in35: endpoint {
+						remote-endpoint = <&qm_tpdm_out>;
+					};
+				};
+
+				port@24 {
+					reg = <0x24>;
+
+					tn_ag_in36: endpoint {
+						remote-endpoint = <&gcc_tpdm_out>;
+					};
+				};
+
+				port@32 {
+					reg = <0x32>;
+
+					tn_ag_in50: endpoint {
+						remote-endpoint = <&pcie_rscc_tpda_out>;
+					};
+				};
+
+				port@35 {
+					reg = <0x35>;
+
+					tn_ag_in53: endpoint {
+						remote-endpoint = <&cdsp_funnel_out>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					tn_ag_in63: endpoint {
+						remote-endpoint = <&center_dsb_tpdm_out>;
+					};
+				};
+
+				port@40 {
+					reg = <0x40>;
+
+					tn_ag_in64: endpoint {
+						remote-endpoint = <&ipcc_cmb_tpdm_out>;
+					};
+				};
+
+				port@41 {
+					reg = <0x41>;
+
+					tn_ag_in65: endpoint {
+						remote-endpoint = <&qrng_tpdm_out>;
+					};
+				};
+
+				port@42 {
+					reg = <0x42>;
+
+					tn_ag_in66: endpoint {
+						remote-endpoint = <&pmu_tpdm_out>;
+					};
+				};
+
+				port@43 {
+					reg = <0x43>;
+
+					tn_ag_in67: endpoint {
+						remote-endpoint = <&rdpm_west_cmb0_tpdm_out>;
+					};
+				};
+
+				port@44 {
+					reg = <0x44>;
+
+					tn_ag_in68: endpoint {
+						remote-endpoint = <&rdpm_west_cmb1_tpdm_out>;
+					};
+				};
+
+				port@45 {
+					reg = <0x45>;
+
+					tn_ag_in69: endpoint {
+						remote-endpoint = <&rdpm_west_cmb2_tpdm_out>;
+					};
+				};
+
+				port@4b {
+					reg = <0x4b>;
+
+					tn_ag_in75: endpoint {
+						remote-endpoint = <&south_dsb2_tpdm_out>;
+					};
+				};
+
+				port@52 {
+					reg = <0x52>;
+
+					tn_ag_in82: endpoint {
+						remote-endpoint = <&south_dsb_tpdm_out>;
+					};
+				};
+
+				port@53 {
+					reg = <0x53>;
+
+					tn_ag_in83: endpoint {
+						remote-endpoint = <&center_dsb1_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11207000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11207000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mm_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1120b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1120b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					east_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@11213000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11213000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					west_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in33>;
+					};
+				};
+			};
+		};
+
+		tpdm@11219000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11219000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					center_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in63>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ipcc_cmb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in64>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qrng_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in65>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					pmu_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in66>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb0_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in67>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb1_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in68>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb2_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in69>;
+					};
+				};
+			};
+		};
+
+		tpdm@11220000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11220000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					center_dsb1_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in83>;
+					};
+				};
+			};
+		};
+
+		tpdm@11224000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11224000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					south_dsb2_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in75>;
+					};
+				};
+			};
+		};
+
+		tpdm@11228000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11228000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					south_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in82>;
+					};
+				};
+			};
+		};
+
+		tpdm@11470000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11470000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					pcie_rscc_tpdm_out: endpoint {
+						remote-endpoint = <&pcie_rscc_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@11471000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11471000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					pcie_rscc_tpda_in0: endpoint {
+						remote-endpoint = <&pcie_rscc_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					pcie_rscc_tpda_out: endpoint {
+						remote-endpoint = <&tn_ag_in50>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c03000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio4_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@11c04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11c04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					aoss_funnel_in5: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					aoss_funnel_in6: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_funnel_out: endpoint {
+						remote-endpoint = <&etf0_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etf: tmc@11c05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x11c05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etf0_in: endpoint {
+						remote-endpoint = <&aoss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etf0_out: endpoint {
+						remote-endpoint = <&swao_rep_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11c06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11c06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint = <&etf0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					swao_rep_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpda@11c08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11c08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&swao_prio0_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&swao_prio1_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&swao_prio2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&swao_prio3_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&swao_prio4_tpdm_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					aoss_tpda_in5: endpoint {
+						remote-endpoint = <&swao_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio0_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio1_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio2_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio3_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in5>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",
@@ -7132,4 +8173,60 @@ gpuss-1-critical {
 			};
 		};
 	};
+
+	tpdm-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_llm_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_llm2_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in2>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-cmsr {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_cmsr_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in3>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-cmsr2 {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_cmsr2_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in4>;
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 990a02c6afc1..22822b6b2e8b 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd15;
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
+/delete-node/ &cti_wpss;
 /delete-node/ &thermal_aoss_6;
 /delete-node/ &thermal_aoss_7;
 /delete-node/ &thermal_cpu_2_0_0;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-add-coresight-nodes-for-glymur-49045aa9ede8

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


