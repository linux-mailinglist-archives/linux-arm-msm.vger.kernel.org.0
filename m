Return-Path: <linux-arm-msm+bounces-81606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37735C57A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678613AC415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC23D350A1C;
	Thu, 13 Nov 2025 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYJZ5m7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIsglkP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E52EFD88
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039394; cv=none; b=ZRvJNwkdsgNFmLzmPtBjgAp1kMSC4zMuSmDzMc6E/I1M47JsGb59EURDaaXPl8Uak/W3hM75gIK8FMD9Wjp1HZN5OyUV9j9XYgGfk2/0Cr5Wp2kUhgMZBk+MZeO9bifz7RhgPJIe9u7yzMsjaodqITY8wgCO4EyRjL+HURrpQ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039394; c=relaxed/simple;
	bh=Tb8hlY/ue357UAGp/YbnSZgOfvuSUTCaJDEbEWWhvQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EbwpVqQ/L5NyPu1GpA9cVdUxoBm9s5Idb8f9ZUo/YjOAWBUAmbZEooKWlo4uaAW7l6VeiVVKvUEmixj0DaN4sR9L805nH33+JJDmGkfupiuZkub4MUk5smcN/uViMy/PxlqCyzEm4mAHJPtNE8R+ibkcZ1elRF8WdbAti3AdXKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYJZ5m7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIsglkP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADBLme8174703
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X/Fk/eh9ArwhqLNgg6Q/DG02wpChZB9VVQ1
	LQ1/+140=; b=mYJZ5m7znx4pIAhrPniqUBRcDKIxRfPK8Vz9GDp20EsJRCAnfOI
	61W7FO5N4wUijHQ0u4QrNro1WR+KV32FRJWB7JCrSBHdI5fqqQBrqJ8Mt3ZHCOek
	3lLvr/d01eWXHHi+vwc92pZI4DLcqhg4lF4GMrT8dUwQoL0L5ZxI5Zfwj05qQ6ud
	9JBhcbml0WO7aNVWm778mhxIJdC5l72saKZzMpA2rUs9ohl4SiZBXClAdvPXfymp
	ZRAsstqQr+FiIAtqW1tnltw8VzWED+la5KwnQwNvRiHIqjX/vXOWvKfF/vCilta5
	+OMFK8v09Wg+y7t6AIAHUBNj00h4T1XDUHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aded1r9fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:09:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437434f75cso192787a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763039392; x=1763644192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/Fk/eh9ArwhqLNgg6Q/DG02wpChZB9VVQ1LQ1/+140=;
        b=ZIsglkP/Z0993oIJ9JDDFisIkLdtoSo+yMr2Go6JqATDqD3d4dGotw40ggf058G6TN
         x/nzCrfZYmUbLppW8uN3VbWwZczlTNwWxLR1qTxkSghB4Ir0T1tGKQkIpPOIxC/2FezA
         ieDyr8rEPwb9HDIcWN+KfLPtuqQM1VR7W+lef0YOTE9T6fWEq3gc/8w18Z7MWqCbsDOe
         /rIP8e2Yf//ESFiUWRq4OEtyv18y7dHY1d8KK+14BB8Ac+jJRgz+9hmWjL3WrgSQy/xW
         XA58EApS/XdEnbAfCTf3GjROtfnYPIQxbrZhlprbxXbusnTpA0TYfZfEly9II5fTKB10
         kUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039392; x=1763644192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/Fk/eh9ArwhqLNgg6Q/DG02wpChZB9VVQ1LQ1/+140=;
        b=iwqQRXIBKyTkNzwfV6noYrM+2FbZtdtNSgEbIx0fzXwBqKtGZ5UN6FbHb9SExAbh2L
         xUTOOriedGbV6o5NxqODpjsKvEJto/Pmt5gbYjReZTYwWSdLkeNukfaSMTkwZ9koFx7A
         H3YdcEL1tMl31hB8Z7ye2V3dX/CyVPBRiL0NecX76S2jN9AJPr/ivQ6DrZZnNiNx7exl
         udlBRG0xH9Y5e5YCkjsODvnBP4tRbaP/Wfd04t8uwPS7yqoXtFbmoVkiReWQeHilK7HQ
         W54K2pMFgOfo3i0lmxIpvdkXGxh4Gzrj8I8V/d3X/9YuIw9SJYdvzOkV8JIHbB1C/yO/
         de9w==
X-Gm-Message-State: AOJu0YwO1x5dAwuIf4fAn8FFByxNmwzwc35Au04oyU+0JpxnKud0Y8jx
	+6/Kyf+gOC2vm2JmAM7SuplPKc9XAjcwYtsPwbVGubCVUskahBEMjA7r4Qo2fb7b/LlD7MWOjui
	kjUGEpkJJmbk64s8k2H1fcrwS4ZjLhvPvgR0dCrB4gf3vypL0pleC9P1yMvUJFO7mDcE6
X-Gm-Gg: ASbGncv2ZLKc4XnVrw6j6DQuxj8BwiJ1R7Xpbd8k8ybHY+yqlwu28wm7gOdVJOHjg0Z
	UF/xfpD5AfKGAcE4gsdaGqZB5/bUhbfoKfVHZCO0AO6x4Uqf1teiCZDv+kbny9bvm/XpcIP6Fbx
	1tcbB8WbHMvjnuLAkJTU8mD1bph1z5xZJc0idKY4Dt+VXjjbxeQ24JruHRzcx/Dj9WUFWjinL2O
	9mUXYDAfoWbntRQxH935VcIfBwLHQZbAhy22Vr8U43VLONC3G+YqFNmxbh0cyiRo2AAU1Dj5QtZ
	yOkmEcSbTMfiLOBPhBaCJbU6sHbpc2X89AShV/7Q7AoS4WPmpWbhGlfH4I/KHsiLcMoPBDkvDxZ
	SBeYM8DcEok9lNUBDLviVRg==
X-Received: by 2002:a17:90b:4d91:b0:341:88ba:c632 with SMTP id 98e67ed59e1d1-343ec508f1dmr1895587a91.0.1763039391102;
        Thu, 13 Nov 2025 05:09:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPzr2ytKgyBYrLp+8mgT98YfCzOzC0sfxbBUsxNvaFOcI8sAm1wPEhjrcHHrqJj/ft3JdzBw==
X-Received: by 2002:a17:90b:4d91:b0:341:88ba:c632 with SMTP id 98e67ed59e1d1-343ec508f1dmr1895565a91.0.1763039390590;
        Thu, 13 Nov 2025 05:09:50 -0800 (PST)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07156absm6132600a91.5.2025.11.13.05.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:09:50 -0800 (PST)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
Subject: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
Date: Thu, 13 Nov 2025 18:39:42 +0530
Message-Id: <20251113130942.2661069-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: psX6Wq0sUEj52qs3Lr76uQ4aG7pJCNrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfX3mpXjIhMwQy/
 meN2Sh90xr33GjL7OZ92zXK6Kj1LoMbCEo0BVICo+sZBpy+IV0xQ22mNcRRzhd5JOS8IrgDJTCO
 FSkTLJdG3XRgnPhVpxcBwgx+zbjPA/l/MtzKzl4SHwr5JaAnp5cXm4Mj8f7k/Lz/YabZwslcHhi
 +5s8eMy66jhyIsyinpwTyZkrWfVBGte3ugPDy6aoR4Con9wIODY0zGZi+XEWRglBmrlXGHfkCwt
 t1E9xZaSWsc6MbFrZrJeeS0syWnfed0lX1gmyVRD+CkevxYNX5xlDxee8iEC5WuUwTBnVtLuQ/9
 0Tp2l/rUFQNrqpy+fcAEhjj+CHImEbcrCXTDPVy5ps3kXasZ8jIXGcMxzXb2TYVxFv7xa5f6+gk
 qpDAunrdL0M570GCPjnH1HM7VkFn1g==
X-Authority-Analysis: v=2.4 cv=StudKfO0 c=1 sm=1 tr=0 ts=6915d8a0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NGL84Lcurrl29Kz1Wq8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: psX6Wq0sUEj52qs3Lr76uQ4aG7pJCNrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130099

Enable BT on qcs8300-ride by adding a device tree node for BT.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
This patch depends on:
- WLAN
https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index cd8800a59700..08b705fe4eea 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -18,6 +18,7 @@ / {
 	aliases {
 		serial0 = &uart7;
 		mmc0 = &sdhc_1;
+		serial1 = &uart2;
 	};
 
 	chosen {
@@ -71,6 +72,7 @@ wcn6855-pmu {
 		vddpcie1p3-supply = <&vreg_conn_pa>;
 		vddpcie1p9-supply = <&vreg_conn_1p8>;
 
+		bt-enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
 
 		regulators {
@@ -501,6 +503,13 @@ &sdhc_1 {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";
@@ -571,6 +580,25 @@ wlan_en_state: wlan-en-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+		max-speed = <3200000>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.25.1


