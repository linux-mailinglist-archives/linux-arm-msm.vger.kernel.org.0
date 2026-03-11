Return-Path: <linux-arm-msm+bounces-96916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKCGBZcxsWm0rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:10:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FC2600E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0B8B30476BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C17D3C3C12;
	Wed, 11 Mar 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPZ5GUWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03F3659E4;
	Wed, 11 Mar 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220177; cv=none; b=I1hoHdX7qblGWcz1fx9y4BjhnpZRrSGVKgrBk9IN6kpVrizapc8OYc0QIJqqZkzJkIsx50hhWYDxuV757BnA4IhX0JCqJS5zE5LU2IRUn2NSU+1PXDe3sjPCPKEY2J3BWz9in0XAt7wSqGWjjjbmwJ7UMtxMQJSshcH8Hea7xwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220177; c=relaxed/simple;
	bh=AU9ivEX+BuCYMmmOUFin+6rA4mF5dW4/KhPoli36HY4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YoX4jUyGtp3b2tIqtY+J24sZcaTZUlQFwsxxSLZS3LQJaUjmKrjH/g2i2oVeWNjwCi+xu77ZFenPMxXcQ/Ee/xvpzzDoWK/WNpmdFT8upnXGuOo0EuMuzfKEAOB0VxnqEjTw9raCVdCRhcWSe5g0uTScnavmzIvzKnk1enRGzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPZ5GUWX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7Q4oc2030858;
	Wed, 11 Mar 2026 09:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qc72zRMJYB5xfq+4VzWzfmUItq0LEYA1CWF
	7Rm7OGwE=; b=FPZ5GUWXdf+8RVAaqZUEy9PcSZuHVzv6g7INjrqsX/7K4pSA4kw
	zBwdbn6DQsgnAFIxU2d5VNm3BnD8CMAObty/DV3s4pw2he/8eXDcfH4FD39hnrsO
	NcxP3nkaD509Agu2OU/uxDlsgB81OSoz2OAtNRkE2SRHS5qhaXMDwByy+zpuKDGa
	VVYzTcgo8PwBnCQZ6ULlFPaV5PAgzzCa6MJyY9VGMwphRUxtyceTlvJpZsnASycf
	q6Mqd8OXMwRYdP2IzNlLgdHCrDixS2TmV3nPVFsmwmen50PanchSIU7MZUA8brRI
	PjTrEPiYRRa/H+dTRuvUG40A9ZRB380t4hA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h0cf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 09:09:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62B99Oqc030582;
	Wed, 11 Mar 2026 09:09:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4crd3mftwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 09:09:24 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62B99OtF030575;
	Wed, 11 Mar 2026 09:09:24 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 62B99NV2030571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 09:09:24 +0000
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 01AC15D6; Wed, 11 Mar 2026 17:09:22 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth over both USB and UART
Date: Wed, 11 Mar 2026 17:09:21 +0800
Message-Id: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NiBTYWx0ZWRfX9EZqZ65lQ4dW
 hoWkRhhyYJbMdCaKNMRqJ26/9OusFhRCaKXxhW9THFvGMr/qpbSl04Ml7RCk3fCWfb1trhLmYEi
 6LHXApdBi4Kbfmzcqy702cp2GwS3B7lu+4JCOJUxYmJATlQ5sQzX177DfFKPlp0A4immulxIoa1
 Rqb/bnF6dGlytMlcDpZQS1zGZv6R0hPy75jLBefC4e4NGtKXUaRwe7go2LHxtZkNY8m4UpCmLC5
 lmj4Zi4cuSlJE7wPecAgtWWWk2Y53JCglsHvYPDAxJTCmTRbpQX1Wcf6kKAaKgXrfk5bF0DiXy0
 4GhQ0zsL03F+28CKRBQctrt0STi4/WTMBYkFKcD2f30d0XmjHsMwM1YZ1QS8CDAT5x0B34QUe+k
 ykArT3OQylLid7LTxAOOsqV4s2t2m3q7si8xtciq83GZHiZVxCDvKUKfB8eCDLVsXsH6kd3XOO9
 LzBFhT6+EenZEtVx+iA==
X-Proofpoint-ORIG-GUID: ocC8inIoh1FTXDsfk_aNHGRV609KUNZK
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b13146 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=HMaGmTrOzvxuP8ZxLMIA:9
X-Proofpoint-GUID: ocC8inIoh1FTXDsfk_aNHGRV609KUNZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110076
X-Rspamd-Queue-Id: AE2FC2600E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96916-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

When Bluetooth supports both USB and UART, the BT UART driver is
always loaded, while USB is hot-pluggable. As a result, when Bluetooth
is used over USB, the UART driver still be probed and drive BT_EN low,
which causes the Bluetooth device on USB to be disconnected.

Configure BT_EN as a GPIO hog so that it is controlled by the platform
instead of the UART driver, preventing BT over USB from being
unintentionally powered down.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..60a0b3ecbc1b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -647,10 +647,9 @@ wcn7850-pmu {
 		vddrfa1p2-supply = <&vreg_wcn_1p9>;
 		vddrfa1p8-supply = <&vreg_wcn_1p9>;
 
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-0 = <&wcn_wlan_en>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -1398,11 +1397,12 @@ wcd_default: wcd-reset-n-active-state {
 		output-low;
 	};
 
-	wcn_bt_en: wcn-bt-en-state {
-		pins = "gpio116";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
+	wcn_bt_en_hog: wcn-bt-en-state-hog {
+		gpio-hog;
+		gpios = <116 GPIO_ACTIVE_HIGH>;
+		output-high;
+		input-disable;
+		link-name = "BT_EN";
 	};
 
 	wcn_wlan_en: wcn-wlan-en-state {
-- 
2.34.1


