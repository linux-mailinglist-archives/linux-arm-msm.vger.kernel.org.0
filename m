Return-Path: <linux-arm-msm+bounces-103126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sroKNVwn3mltoQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:39:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 818123F9737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A55B3064354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6623DC4AB;
	Tue, 14 Apr 2026 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqDlvNdq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBYfRotR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AC3DBD48
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166604; cv=none; b=k3jGLoUKvmyTE44iZwgXRAU92g4sSpklp/133RIEdNKUMunKhGLZx63O9XGtc/Wh/bSnwRfiRC9Ff+cKz27zdYsYjsDHJdYtA9ev4Vag8bLqY0zfCNwZpWsx6O71zfNu35GtgDhGW2JW3JHhypnwMWyaDgFwNUUN2iZUnGDZkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166604; c=relaxed/simple;
	bh=LIMtwT+c3MEB3SSyWEkGsNB/RdOBMnBdyEU+dEeZ4yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caQIj++QYBvzwQBTiDzl4gkgI4OSzIQWQZ6ufU/yNMFxSpnYRB/x7tXQJz7m4b2BfJMhNuWRLJslyYvK82qWl3xuknuFbCHrJUUepVrYUv3oEidb7KNJef5VJq+D1xELxHeR3nBrWfce3yE/0xDBQYEW4OCjpRa2uMxteqaKdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqDlvNdq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBYfRotR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA442h029991
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCKWeCYPS5rzMMinLRc9Bto3vnstIYaxholLrs8CFyg=; b=CqDlvNdqpYyysF4K
	KRc7IirvI3t8vn0EdIN9ObmNwt7tgS5b1d5/cXws+W/OjncoofjZmfPQvx0YVnzO
	huBhzes5sP9HPV8qEyqpsgXfxO/DPLBVS2+VduOO7dnVlXRp70E1tKVTutLx4GJG
	NYuS1PkK20rRTpTsxhPp5LWFBtFhXUfOssvEjjyiaI/ud4TlmJn/C7ADfjpswBW+
	XrHmBNZrv+BOOL2iOtUFo7qTvf+sgw42tWrcr1Z/9P2U7JEb+I7IdrDUd3Rpxywx
	cLFShTy3Yg0UiWhyhimB46GAQ0+cJ3PzdjzIUCXWeGD+UDGFkgk7suqz0XvKtwD2
	LZUevw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmg90a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so3725153a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166601; x=1776771401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCKWeCYPS5rzMMinLRc9Bto3vnstIYaxholLrs8CFyg=;
        b=VBYfRotReMH3HPN7+pajLJuWYuKy1iHL9YXMmOki7n8e2qTYYnRrXZAfbK8gOEDdTu
         r+lQPZ+ZrnnAbPTATG4PX3K7fLHu40V3KTQ6DwzwLN+Hf7zK12fcCO4kwzw3fVJm87sK
         ZN5xpaP1BvzxZ2hIKDRSUp8ijfgnEwspVtbbCV2XGthlt17t3eoRU3vtWS3tW6JmzjfO
         ZEpjEK6CM1YhFaijSqdJjqMGDttLgyvRC522IZWLhN7vYwHmd5frXB2hhpG4OgurfMt6
         PAu78cjz9YoqGPFhnNc5LbKD7oc3vgdKZ0BQFl36O0TsB+Nvr7HA6NChuDenBcm2JYyR
         eFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166601; x=1776771401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qCKWeCYPS5rzMMinLRc9Bto3vnstIYaxholLrs8CFyg=;
        b=pgZYE9zZuaEvjeNQuJD3I/cHd0DbzrB0djFT/lXF8tAf0+xagxxqhjuKW73V947GUC
         PZNTLp00fwZmp9OXlIkXFpSmrNTQbtfKETQOS7zAVJKS1nvjHVHrvzyTtHcyomXFm+Ck
         oE1tZDOFT3DIjCE7ZxWoJBUQos1hwZIU0obeEEgu4c/fPMlF74ZuwLV8QAQZjWZmPe5p
         48jpTmp3L8ecC5Xmlibp2RNdCtFDFhfY/UBo/gJVRJONk/VOagidTQUKj8lm70pputUb
         tBBMJQ+VH7RNq62WBVLmqzAXk41vylY1kTJU3Wbf89J8zaWAk/xHBekCXDTTfwlfBysZ
         0sew==
X-Gm-Message-State: AOJu0Ywx+hIUmPbVltTSWzArV+jYCKXqWUe5/bJN6xAf/w/ltkqbNl0f
	D7xvC0LVA878qyYW9XlfPxMn21sgD4fl4+/tbH2nP/sFDuVm/xgZaqCmaGSeIAJGVaqohz1TKs5
	dPa8WJIG4uniwmAhO/PDTH0yUsPwV4wQEalIHZgbxIxr7P+Fv14tNwejl2TiZHWgj/ebn
X-Gm-Gg: AeBDieuVzaAvxJ/U5gF97iJkYNTw7oc65kKZZfFEt7rVHSIThuWTIGmV67Px+9x2uZf
	1lS4XnBodtrszpdosatb7fXvWNItwA1fsExbiFRs8M1/kRmbD16GOdOxyc+gdITrtlVInOrO1dl
	p+g+0u3pQxD2RXrGy+qg8mZE79D3OUexXGEMaBZywLfi9IsccvzKneToON6jxTPtoO4eAcSrcvF
	+/b52U273BVXboUsTwoXGNP6FUdyhSHzNjP5I4guDOB6IZIetqtTgDaLQmbbAfc9xOt5bQ8fV1J
	KjVG10GSStGsvvl2RM/bSwk9B2tFZLT8I/aNKhuX+uSpe2eRSZpT0p5+MP9tUrA1YqPbhlWtTWj
	i+dT+ghxO9QZX0IKEUy9CDQbn+EgFziZqd0x/v8qBU5QNAgRx6/KTkAE4lrfVWopRbsNmrsvQif
	8Tf772Cvjt
X-Received: by 2002:a05:6a21:6e92:b0:398:71c6:e8fd with SMTP id adf61e73a8af0-39fe40e945fmr17992510637.59.1776166601270;
        Tue, 14 Apr 2026 04:36:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:398:71c6:e8fd with SMTP id adf61e73a8af0-39fe40e945fmr17992475637.59.1776166600819;
        Tue, 14 Apr 2026 04:36:40 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:02 +0800
Subject: [PATCH v2 4/7] arm64: dts: qcom: kodiak: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-4-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=2817;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=LIMtwT+c3MEB3SSyWEkGsNB/RdOBMnBdyEU+dEeZ4yU=;
 b=uw1tecKtUpQ2oJDRoLQWm9XWbWOcG1RdsWyQZVI+YnoB11cLVu+pdX34rqsvoBZ41Ms048H32
 yJk7S/xpL+bDnKvMC1DO7UFZA2y3k+xU0r4yldJmIuVuJ2PrlafWXF6
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwOCBTYWx0ZWRfXxdwKxPSC8P4I
 5Vy5rVC1oYtjH2naSWMWYHPLQU1NoP21tEscGjBMooirOaXX7v8q/urtAtxFqaZ4rlXvV3UJImm
 SRkbEKg2OsSIcythIvqNEN/Pm9+6Bqm3+OaohtJ2/SUV2TGeIKPM6ORDkr+TLlEDBMmHWB+CgA/
 38FSBOLparETj6PXrVSA8lTLsSzllbQMwZQD0272/Sq/bJfLD3XTwIi6bsYCaBJd03MEmuUojcY
 QQYG03OtKMgypc5A9sBd8M5BJJgYkNVvd3870fxqWyQ6Qkj+NG4xWTK2ussm10Xcmy4ocvGnCXt
 tNVLYUAXD9GDNNJ+/YYaBOd6U3lAFFjX2bnnpPDWK0jzg6wNm6Bq6MR2+WJpQZA2QVDIvVYtk/9
 5/8UYWtLNZraLvdBHsqD7MhFIQk/RUD0Ulk6X/SwYraCA16f8QqVlYWt5wjLBN9QFGRlNi9tiu6
 kR9BMKY/ER64MOKeapA==
X-Proofpoint-ORIG-GUID: sZwCu7j93v8ptOl_njsylUaMEhCrOblQ
X-Proofpoint-GUID: sZwCu7j93v8ptOl_njsylUaMEhCrOblQ
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de26ca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ft2vuo7JNPNZdQlk6TEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103126-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 818123F9737
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the kodiak device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..3a2c28752e31 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3513,6 +3513,7 @@ tpdm@600f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3532,6 +3533,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		funnel@6041000 {
@@ -3681,6 +3683,7 @@ cti@6b00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b01000 {
@@ -3689,6 +3692,7 @@ cti@6b01000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b02000 {
@@ -3697,6 +3701,7 @@ cti@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b03000 {
@@ -3705,6 +3710,7 @@ cti@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b04000 {
@@ -3859,6 +3865,7 @@ tpdm@6b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3878,6 +3885,7 @@ tpdm@6b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3897,6 +3905,7 @@ tpdm@6b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3916,6 +3925,7 @@ tpdm@6b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3935,6 +3945,7 @@ tpdm@6b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3954,6 +3965,7 @@ cti@6b11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		etm@7040000 {

-- 
2.34.1


