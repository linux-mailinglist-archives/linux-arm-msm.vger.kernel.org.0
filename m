Return-Path: <linux-arm-msm+bounces-118944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j1s7MJHQVWpdtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E227514A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:00:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cWvwA9Kq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118944-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118944-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AC9B302AC0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0527932B9BB;
	Tue, 14 Jul 2026 06:00:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB8281525;
	Tue, 14 Jul 2026 06:00:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008840; cv=none; b=QuCnk1nE1rVvjd7YBclNNjcgLhTwA5Ni1By+R7qQfSFw88YCfz74BfIcCKEt2hjOYwuyTDbsCb+YHkITN71TG78xMbCuKR2Bms/bdu2qN/CJDfio7ll5sn7QGHMzjrMohNmqHHHxO8ADdpJazOikO6Ia3yCX5/Rs1gr0xy3FotI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008840; c=relaxed/simple;
	bh=7oH+gR1DLTk+In0W/qPw987FcJ+I2dfas7MG9nWB718=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuY3W5g7ckrw8SL3n/wg28qA2a7cGEybgHxUgs8MaYIWfpWSU1b0jsSLlj2oQeTP0UQeL72DrkvOkEz3vQDthwCl7P+abnj15h3ARE0OWgPeVSw/8N8MnBSVdiLZseFd2jZVxLm4M7QTRUNTwimKdsxIHl7/tzeQPoZ0/zqArDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWvwA9Kq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E385cp3556609;
	Tue, 14 Jul 2026 06:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgiGaOfkUyBScD3f7zD12UvjTThsOJ7h5ixezSITWJk=; b=cWvwA9KqqPQw0tx4
	Fj4F/PKWb8fuhEDM1AWR3j8F+XdNMJJE29N9UUGPNlCvGN+adRD9B8aHvSmOpzLB
	2VbZuKO0S/rAzEylNFjcJDha8r8a9jJtY8ulzw2lXt58JHcQuiLOnIaGy3kNGqcN
	AUQ1aLZiJGFt14M0jwrJo2EVQK2rMIpi8eDaMzW66QaTUbNGF77HXfUTFsf4jKVd
	ONjejDYOR0WE6EsZwp4KFecjHjlyAPFpq6svxkFhQlOa7XRjId1WCCNpBEOcKM8M
	OfxfLiBtJunlGT8TAyCBlk600D3BBjJSrY8BgzbslpVFfMHFTzABgDMBlhstcOtf
	InNn7A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct7mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66E60XjD005691;
	Tue, 14 Jul 2026 06:00:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewjjha9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:33 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66E60XhG005669;
	Tue, 14 Jul 2026 06:00:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66E60XxN005660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:00:33 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 8F236646;
	Tue, 14 Jul 2026 11:30:32 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:30:18 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-shikra-cdsp-v1-2-8402e060809e@oss.qualcomm.com>
References: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784008832; l=1925;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=7oH+gR1DLTk+In0W/qPw987FcJ+I2dfas7MG9nWB718=;
 b=lHFqbIHtO7kVFcvEIo3stmftpXMSGajO6F6Ln31fjXW0GsCow/s+Fq9UWeg9d6BEzV7/7+6iO
 /vuM6DfyC2TBR99T5nni+kjkjtQ5eAJ0mA4Z4VbCQqmLXT4guAYNUgK
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: z_wrDujMD-uOWBJjCoEywWWLVbCZzND9
X-Proofpoint-ORIG-GUID: z_wrDujMD-uOWBJjCoEywWWLVbCZzND9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX0bFcAJLT6A0d
 7piCE9/J+Ml6ryeABVSKkVxxJNAGl2iBif5RnGADV0urMYeF/1X7zPEwJshLCt4Mj3HhhVtJA5P
 uhfY5o+0BhQ+x+HXRDAZtskTBA2l+M4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfXwh6nPPG5sLAw
 09IrJfW5Ug13Sja/WQhDnbIJWeDVkngUyM/SUwRrVHJurzRgLPPMZ2hQuV6Z1n5fLhYOg7HusWt
 eQgcs2sFJrmBD2SD5GteCtPyhUlq0qi90iUxvzF1NekPw/HIo7w5AoIwJODVhFkI3njIamQVoO7
 FLerS/a8eAisp/xV5XNY+Lf2VYc7/2PNyZopMBa8A8F9Kth7gcFyTpYS/qlYzjx+MHtpUiSW0La
 I7ZVpIspiVBie1csxK8xu4YNzDB4aXtq6iVO5RjW2QsY2/fUv+KSfWouD7+5c11cgpJkio4dKU6
 NnP00rxO+pVO2NrgtnfQQk2h4yXlsQWEqAUFZT1I27ZDjMEnqa2a2P3gHIy/WxJHpKLx2c4iMav
 JcKggz6oL6JSNWN7481+vUNfp4wpEK8UbQPy4HfyHHrIH20JKzWEDutOwZ1LAME2Ovx8rd6nWQ8
 EiSyowffWB8yWsEjGcA==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55d085 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0LTQQJHg6IV3-xL2wicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118944-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:dipa.mantre@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dipa.mantre@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dipa.mantre@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31E227514A6

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in shikra.

Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2ab474f18af7..d54ac6ed6ab7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -1898,6 +1899,8 @@ remoteproc_cdsp: remoteproc@b300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -2401,6 +2404,8 @@ gpuss-critical {
 		};
 
 		nsp-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -2410,12 +2415,26 @@ trip-point0 {
 					type = "hot";
 				};
 
-				nsp-critical {
+				nsp_alert1: nsp-alert1 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nsp-critical {
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_alert1>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdmss0-thermal {

-- 
2.34.1


