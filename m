Return-Path: <linux-arm-msm+bounces-104847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCjcCA8i8GlhOwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:57:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3347CF32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B858300FB5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 02:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96D23B3BE5;
	Tue, 28 Apr 2026 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5szFSbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB803B0ADA;
	Tue, 28 Apr 2026 02:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777345035; cv=none; b=mHSh2H40uPExn9t8ZFu3w1yONUepnW/HijLcAkVdzmVeMfzWvk6zhJxZ5hNQnMFoSsyiBU7h79dk8Gtw6l/sBr2IAivfC1G/QNYhLCvHwLXn3gXjZOYPnrOz1nSlNVHf1t9BAueAS1yssRBMeVSxx37mYwfons7Vlwrdcos+aWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777345035; c=relaxed/simple;
	bh=L/EVvAaZFPWDgrJ9+dDGug4QLHaNfCife80FWWpnDzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B9IfKZzBOr29FpjlmHoLtc3m1I+GZufp1Lss0gjY8nE4kjxxW7eYUo0Gvgpl3KmeA6khg53hWhKHIkjg+Yzn4lSiL6bX4rW655m3kpt4Yei29npQLk6Ptz6geb5xhjMA7sVBq2cpcJekPE7VAg9ZMg29CYjZQ9DfttC8rjRCQL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5szFSbv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S26XRA1237213;
	Tue, 28 Apr 2026 02:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FmbRpaGk24szdgYw2AKkXm+HdRNfMwnIYMt
	Zk+/cBxw=; b=W5szFSbvMkvLD/TEh5gJqhck5aNKMWFxlklQF2ZckJucSp7YHPc
	vPP2OfXKQD2ouV+qxEaHnQOB86nIl4q6/ngiHKykTVQ6EHxDkABwdJN5zzlDeJJI
	JD2AIDcM4oxgplc4KCMDCJO0GLbYA4cJ850hp81YGVx+uavUmoRsjW7e289LFD9Y
	LgL0VIZZy0Q0vi1YDCzbf9JTS5SpoLn7J+YuDoQyN2jZfA4NWC2I8QLwqz9qhxU6
	6rWWL5ghe3BGxI/lC+f8XMptbbpfakDjEu31KYyF9KEGsozqvf0CjzOtUai6AXRw
	yLwKZXKVii52FNOiL2Q0vIpET8KkKK8W20w==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4k8cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:57:05 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63S2v2oC007223;
	Tue, 28 Apr 2026 02:57:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds66nm8r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:57:02 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63S2v2lu007208;
	Tue, 28 Apr 2026 02:57:02 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 63S2v1kQ007192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:57:02 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1666760A; Tue, 28 Apr 2026 10:57:01 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART node
Date: Tue, 28 Apr 2026 10:56:52 +0800
Message-Id: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 6QecfAgn8rAnLWTl0MC2hR6HCbxND6l0
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69f02201 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=3PoVfMXRn9QdUPswB34A:9
X-Proofpoint-GUID: 6QecfAgn8rAnLWTl0MC2hR6HCbxND6l0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyNSBTYWx0ZWRfX7dzLAE8Vga0x
 Zz7QdnvAPj0BBFyLGJYwYqwOEV/Tm9CzizT8cfRt950QJ4DSu3+FPGnnKOo3GzfTOhjf32hzaFk
 PTkf8Qxz5GirPLqmN0R/HBH7UISjVmT33t2USf2+vEAuTnMVTK8oD0/QYd/RPOduQfjsg7tBn0x
 7RPMraaSFYrriGSHi9uH7NqEbql2GAU8pjhzgWGjkaLmk4F9d8hbBHJHOd1RRjkAFR7RLNRNk56
 5hOXK+7Q7W2JximuOKGsQZwrOPaIBLNgsO9jz2fMzyVjlrNWM2eDJYE2BNPTZHMIXPk9KFGIeqr
 VHJ++4SNqPyv+WnJesLUG5idPb9QFXe99KVo+jSMzBHFGGElokwsPxuxpJXZ7PA60eYKU56O9dB
 Lp4K4osNTJ6eaKW7CO7RSgCxPP6X3BikRm3yF3lJAa8htAWYrOABKaFrJM7G2oXQzhYOJLIGkqc
 Feyu5llm/4Sph1GAh5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280025
X-Rspamd-Queue-Id: 94E3347CF32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104847-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]

enable bt on monac-arduino-monza

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4..092ca0b59 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart10;
 	};
 
 	chosen {
@@ -454,6 +455,16 @@ &uart7 {
 	status = "okay";
 };
 
+&uart10 {
+	status = "okay";
+	bluetooth: bluetooth {
+		compatible = "qcom,qca2066-bt";
+		max-speed = <3200000>;
+		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.34.1


