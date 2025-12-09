Return-Path: <linux-arm-msm+bounces-84771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C1CAFD6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 12:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8559630319AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 11:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD2D2F6591;
	Tue,  9 Dec 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTk8s74I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nh16MARp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172362ECEB9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765281573; cv=none; b=KvUiuUZWaY+Es84VXB1YF2jyOQjPX2fETnms2Dezlwi+AAp4mUIPyCVYtFQBb6OXjxN0jFadip2aCXUAARWPtg/D0QR96+JUA4d/dYbig/aPDxjvd8dlw4znPFF/WgVCKzv2QZQqdSh6Gx7u155WkIoW5kzebGBMN2XMskuc5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765281573; c=relaxed/simple;
	bh=zqcZh0ks9xBgoiWo1KxG1Wb2qYapGgk8e5A424YueNc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=blxcjOs1wML9iSHDpjofRRTVzuNWGU1OCl0wuOoBkGejzoJkUpeB9GTO2Xzs2H0bx9ceNgT0zH/NK4eCEtr/q4RZS4HM62YGpwUH2sQz6t0+gpvReAwGHIHBNdcdt/GttU1ysUGutvryzpCGHdb7zOZqysQiuL/HtzyyQ4rkalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTk8s74I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nh16MARp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NDme3870846
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 11:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1kNJZd8sDXgtxnpGisyMvoGTS6/Xl5fuNU8
	9fvaQrCk=; b=mTk8s74Iz+4Q5kS0/QrHvRzcVIV+NcmnOx1fCLa/KDXOeAb/IPc
	iCAnV9mnVFgngI0Iz3z5Aoe0Y3LM2p4udJaPSPuwYvm94qrtFUidMfWV4JCFfR7I
	LirRPuanC9biThCa65Xqbzifmi5p7Z0ziwZbP20f0pKVczoBazcZzbAKS4d0Yynk
	cH3Hg3TSYSTDhZMjeFEoDjby8eK5EoCkMHT0xqfI8lhxbKxVkC8t9QEV8nRJz7n3
	Xs8eCai1vy4XzkEx4uCt5U7R7QNqM49QN9IlwX7WyAjqaYPy/yJnv5DBEVEhsOZ1
	mIm8yKEV4M2En2pKDn2MsmnBeiCpiGv49xQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgs9rgq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 11:59:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so5782482a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765281569; x=1765886369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kNJZd8sDXgtxnpGisyMvoGTS6/Xl5fuNU89fvaQrCk=;
        b=Nh16MARpAd8ndRE+ijJSXZss9gjXITSHfrpv8IJoR+ftzVzQv0DAcpjDSDEnNFi484
         EAZqsTOWZCCo6eRZ9DbJmtiMvUNoWGAYNyARbRRhRs7NdecuKD+7G2o3oPL1G2IHCN0n
         uLdZmcO4PfTItARgWSX9T+RNj43Ifj93G9rJKnGvT0Qmu5786TWQ0Wve7IZR8YuvIUit
         Xgp5g/pf6QnrRlrh+OUvxv0MTPttX0+HRTHtdEHWEXHTKTQpP8xEDJP2rTXV4FsppIj4
         fzdl2LvHHccal0OZM4xhkz13wEXJ5SPFq0t4beQZ7SzbgbZG4NbvvdkfoLGx8FIuJdp5
         thvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765281569; x=1765886369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kNJZd8sDXgtxnpGisyMvoGTS6/Xl5fuNU89fvaQrCk=;
        b=PIwhUvf4wm9qi4vaA2vAApiYTHlXwJtsI7MLXNdNWkxfkJiwi07/xC2GnzCCt9g2qm
         oY/7E5nukgi1lhEdFjt+UqlkgLmzRkpo0BBm+MfrK3yIKGdMvKte3ty3yIxcODOm56wN
         I61d4hVZTuUtpYOJ4IMvBNUE4V+e4YCbvpBqinjYz7Y+uSlEPjOECKyRAq2wY6Zv9xMR
         iizjeI20ArcWZXQnFcFi4xDuj//7ErJRjXXYzzav6SlFNeRySmR0jfOlrLhnL06Ur/u3
         42/zYx37Gs/BjmpfXW113EeyXXCCMLLPoczYbxJ1LJGluugyFjrCbsIdzm9ZQQ7dRONw
         FD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh1Gau36cDGFYPBkr4ljvI4R+PXgsjI1Quu82Cqrki5a7YJSYaJwxie74qQ7GrcVzPR/PzMtKj0qUa1hzw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tgMBnkpmHdnVo44w6ak1kCYri7hO3bhAX0hf3fYb/104GyGJ
	q3SdzJgW3QEgrqmAQ0KJG0Ne3aa9nMWkwfM+aOjGbARWPROPHXaVw62yJWfwJjBC5qozrbADShj
	uOfxkmUeNyCEbH7m1Lf6LlMZQ+J8vIYF+qIao1Gb5HV/+qR6lHYQ7MdEcyv0SJ9omQ9/S
X-Gm-Gg: AY/fxX4jp9y1xzNJVFJSo7C2Nil26HDlUIP8r4BdU9dtvF/6rqRjqhbiHNBAVP9Nkvv
	6ZmPxjq5uEH/sWq4huWGbM8CwxsD5Y6c+nKZZalmnrPHQu2EbpS5bdPcLfHP8aSNNxqNy0o3kEv
	CZ2/UeHwTOr9U6FBxt7sI+5s3eY1S1v6NKgI0OUXf/yIVSQaIsHbeAXpwn3AwBKXPd9RtVFqRSF
	P5iQ+EKMbYBZNureksBUeqN+r4j78w24/uG6MGcBwb1WivuN7dZs1l6kZu66dyW4kgfwC6hiiXI
	trcmxPDP1gQYFdsTypkmtpX78x/1VPvxODyHj0vbFrWPgw/wRcWB8XK8whert6Tu32GR6O6xz8r
	F1oCCXyhYvlScibNdLWkqf3kIl1l6lrjrLWHp79qDDAeVBN6eGJGx0bw/ORYUsga5
X-Received: by 2002:a05:7301:e8f:b0:2a4:3593:ddf1 with SMTP id 5a478bee46e88-2abc71f61c3mr7347897eec.30.1765281568735;
        Tue, 09 Dec 2025 03:59:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf6Cyo1K1rc6iDn6XwOAegoNxdL9rmcjWCd2hNI18HVaoCbZZtHHYHApMCXcGtZV8hyiEp5w==
X-Received: by 2002:a05:7301:e8f:b0:2a4:3593:ddf1 with SMTP id 5a478bee46e88-2abc71f61c3mr7347874eec.30.1765281568165;
        Tue, 09 Dec 2025 03:59:28 -0800 (PST)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba83d2a5fsm43540673eec.2.2025.12.09.03.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:59:27 -0800 (PST)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com,
        yijiyang@qti.qualcomm.com
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for hamoa iot evk board
Date: Tue,  9 Dec 2025 19:59:24 +0800
Message-Id: <20251209115924.848165-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4NSBTYWx0ZWRfX8X1mo5UBz0B8
 yOIIAxRXCkTyFuf+JaEHKc/26m+imOFZ5qYfnGjWH7XkphWMXLe8WenAm1V/Q0RDSKuk1kgrqZ9
 WnCSlkgsbUBSvO1GyJ72Cy3SyS082lFboHSrzmxTdLSKzimnrivuvAXRwbEG3nc/I/Q/ojuOFb6
 0BOrkdCA3jgBIo0ITcWXH3k0e9rtE5R5+0EfvpuRud/dCiXV+/JkadaX2YoufObgAAW8pUmX5BD
 FCTIroY2mr8ZoWSK0vsw4sEDTyWlOnSOjKKhr47kUlI3fxR17fwMSYcSikGuQsJ3wlAS62uqVxz
 waNclZaDGnIyNwijHC2ZGKHJOq1+EUZthgHLECVhgH4p20VI8/5kfwVIikBy1iJf5lou32NL0JP
 T79ZK8gKx2l29vkruw4ZayYIB88AZQ==
X-Authority-Analysis: v=2.4 cv=ArzjHe9P c=1 sm=1 tr=0 ts=69380f22 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-Rq5O4WasTQjg5W5yTQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: OokMIL4BdR7o1kkehp1DxDa9MRuMVRzo
X-Proofpoint-ORIG-GUID: OokMIL4BdR7o1kkehp1DxDa9MRuMVRzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090085

WLAN card is connected to PCIe4 on hamoa iot evk board. Add WLAN node
to support power sequence for this WLAN card.

Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..d66d337292ef 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -534,7 +534,7 @@ wcn7850-pmu {
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 
-		pinctrl-0 = <&wcn_bt_en>;
+		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -844,6 +844,23 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 };
@@ -1143,6 +1160,13 @@ wcn_bt_en: wcn-bt-en-state {
 		bias-disable;
 	};
 
+	wcn_wlan_en: wcn-wlan-en-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wwan_sw_en: wwan-sw-en-state {
 		pins = "gpio221";
 		function = "gpio";
-- 
2.25.1


