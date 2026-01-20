Return-Path: <linux-arm-msm+bounces-89765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB73D3C020
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C30F5504959
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7EC38BDA9;
	Tue, 20 Jan 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIWWyzlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSIYmKeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A923B7A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892830; cv=none; b=IPCkaWfGxrcLR7/b2zCbTBerJjqhvLMAl7jilDpJ4tZFNU7HXR2NxuMinySgXRrqAvgpD8aDK4PlU/TUtpWJ/Xbc1IyYl13P3pSpPDDJQsfXVE3UfsJnz0AIQFFR4mJlU3HmcOKwDIvnUGCQfxTaKeNDfGLzZ11he669zGPddbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892830; c=relaxed/simple;
	bh=Heybbx0oLSiM1n7CM/ikkK7NiNFSOBj3WsbNoCr8C2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gA61zah+7BEOhpVUOWM/NSfqz+sYxDp7ROv/N1gIDhZAqozENulqNb8oMvGhLq4ZJZiq93g9THTC+1jvDtYNrWqXBqvlgRiIlxoQ8F5ekdEBHFh8cZKU3jPtMzbousmGiaGDdnb5/c+azYOJdq5+QDev+UeXWlKtpObWUKrgCH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIWWyzlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSIYmKeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K71ade1408539
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LgmaNJfrCLG7PrqhwEP+tUt+Itejs18DV5R
	fEVDgXOc=; b=JIWWyzltFbzDgHnyLVCk0/SUn8SXmo+xkkuoK/C8km0yHpePeSy
	m+fF+ZJP7YlzUDGE9PUVpM2A1KzbJveDzaykkl5tREWGP37ypnr3BFXt6LGuMCn7
	TeAdwNW8myRjgoXTQs8tcw5tkl7xE8hBKP/YFtxkrBcI3p9lc/+FAq2pvoAFX3kI
	jDTFWFsa3R/HF7ju2pljA0iJ0UcfafurtkUsDBisFLQh4a+Ciik8CL2LI8VE0G3E
	jgVC0qRtJvQoxq7r9C1Wl2Q+T4YWg9WiCKhL5Q5hAc/tQX/RXOzxPuVoFP8Klnzj
	McXU5Gd6riwPegXqBueaR5VhWdfifGi2+oA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4y2r0df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:06:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1233b81a92dso5471081c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768892818; x=1769497618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgmaNJfrCLG7PrqhwEP+tUt+Itejs18DV5RfEVDgXOc=;
        b=DSIYmKeIvVlA0doAbx+98dIew2F0C41S8E7iGRErcVOkOLpcYPjfaJUAGC8yqfVqvv
         APDEs5j5uo9VcwuwM4uSRNH6Gu3KnRlnZ2ESEEVeF6gA5mu5Lw2Z0LQrEJgxkT1uBVxD
         HEj1kTY58rirMRf6UM4ZqH91befL8KoE5EgPYqH6Trl05D5eYsE0rNrXmaHgj0N8Nuy5
         r91E2m3XIZsjPQbLMa8hICcZ6US4ZGCo6De2sHZWSgMcP1tIK4SFz7jvcTQhaUhKTwLq
         SVt9uOzq6PHd8fghGKkfJMiTfe9cH9+G0eZAT0dmGOEW+UuarPCjPXJmX5se7rXXtGje
         MSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892818; x=1769497618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgmaNJfrCLG7PrqhwEP+tUt+Itejs18DV5RfEVDgXOc=;
        b=SmNFYyQgRg208Zu4bJWfyfuT7Ler8iaHToQMoEHHBNU8nRd3+s85pkNLOAf1+aAzCv
         1+vUn77vUd2NkFeqUunaYQ2vg4MhBrsdPtt5PGjTblmCmasISqvl5nQEtvFnWnPb0FOj
         Bd35tWf/O6MMhsu0cDSG8AhG6RHVWW+rKgoTV5iww0WTDuEG4R/T46Po/MgamNAVyhp5
         kZ5oUAt+3Y7ai1V3jWxsHKmxAndPysVoEy9k3aCtZcT9jd5WY/Dw+zgV7Zn5bx3FbQ15
         889rojRKcwcxgBcTT6ML2r/ImktqmQTBTV/7kUqF+rc8JUgMFxuhWrIleZ/SmEl9vUd7
         UbjA==
X-Gm-Message-State: AOJu0YwEAfxuzzOREuSwq0F1KwcY23byOoFTTLv/qMQgQ7Vx0tL7FkK4
	lbOvH513GhI5Os7URpJo0mZUeP1OcKK2p3mpCBeTdqEhlIpdTew4iSWDCF1+wW2smA7+UgyChdp
	zciJZOluXzgzMbrNbIG6M5KrFOcR7SSm9M/Ww1/J2DyJ+sCEgfPkW084zdosEC8PEFg8Eypg6BR
	OXj+k=
X-Gm-Gg: AY/fxX7jTUrENMWI4SQUekYRaTTW2qYc291N+uBNKyRZ2QwLVZzDMC+BwQ1RfO6+vef
	S8CTcWv7hTPWoPq4LSRGABOydyFWsivOz5U2zThMv/HtRESWWpUKW3fdg+KO9vCLBP+Iey23o2R
	JL3OyOLFXQOyGZIKnjvzAaJzymw4XTW3we858pqnO2sarvPe5dqAcQv6oeOFHN/QhUjMuU+5WMv
	pVprJ+uJP7rnqUrAhh46xIVgvFmEFqVi8g7YMcu8VopSMJ5nk/5Y2MVdHSMixC2vLvmMcVXa6IX
	EtUkAlgilZQH2RNT2n6ex23cvBU8rN4XHIqst1MRSddEPw7Ga8Kgty8Nba1BElnh+dsRU3dGf8p
	osF2a9exDkgKcKjlqoPrRDRcpAF+v8rA/W+YmZYnPYaHevn/04K++dj0kfif641F57Q==
X-Received: by 2002:a05:7022:2381:b0:11a:4ffb:984f with SMTP id a92af1059eb24-1244ac400cbmr9688053c88.11.1768892817733;
        Mon, 19 Jan 2026 23:06:57 -0800 (PST)
X-Received: by 2002:a05:7022:2381:b0:11a:4ffb:984f with SMTP id a92af1059eb24-1244ac400cbmr9688042c88.11.1768892817046;
        Mon, 19 Jan 2026 23:06:57 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad740c5sm20492756c88.8.2026.01.19.23.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:06:56 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
Subject: [PATCH v8] arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride
Date: Mon, 19 Jan 2026 23:06:49 -0800
Message-ID: <20260120070650.3192679-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NyBTYWx0ZWRfX0J3cv1RpTdpI
 zum0emCyx/1rtmO34yGGPNiJAGoU4skVAkk0kryul2L9fwociwgECYKd8LAKdyJ+X75MgeYec7p
 jCH3hz0gLfoOwe3o9HE78ks4qw4xN5AR9ViWbs4G9GIeNYtCMTflAmsQdNBIW+LhjUAK5KmW87C
 it8udUIn/ooYxhaggi4YYR+w5Tb/Xs7QhzcKgkbXX1x/zJIq/YNyT+Wpp/1mgQREhDwfBqMTnWK
 Rw+tYKKWRkTQgSiOWag1ohhLnm8fVQDdNWkIu1dUhTdwyWzDe6Fq7XxEdgvgWevhbGLFOa4Jxl4
 +O8vlJTZqSGynfV+aJAuFtR87pDbydnsHwR6LlGU8nZ2N3R92uHwV7xKY6AgrJmSrdDvYPLt0+U
 v0O9hgQMXTs3APwaIagIx68MlwdHijJ8xBPVgDUijf3XzgR7bMNn3RS4GItoiIol0Qfbhks1KW9
 /ziTbu1yX5CkztN1m7Q==
X-Authority-Analysis: v=2.4 cv=Ds1bOW/+ c=1 sm=1 tr=0 ts=696f2992 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=b5B5FA7t-L3a07aDtOMA:9
 a=Fk4IpSoW4aLDllm1B1p-:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mcAmQZaqT97a-2MlWAOD1pdaAGYI7GhL
X-Proofpoint-ORIG-GUID: mcAmQZaqT97a-2MlWAOD1pdaAGYI7GhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200057

Enable WLAN on qcs8300-ride by adding a node for the PMU module
of the WCN6855 and assigning its LDO power outputs to the existing
WiFi module.

On the qcs8300-ride platform, the corresponding firmware and BDF
are QCA6698AQ instead of WCN6855, which have been added in the
20250211 release.

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
This patch depends on:
- PCIe
https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/

Changes in v8:
- Reordered regulator nodes to maintain alphabetical consistency (Dmitry)
- Place wifi@0 node under existing pcieport0 label
- Link to v7: https://lore.kernel.org/all/20260119090758.2780678-1-wei.zhang@oss.qualcomm.com/

Changes in v7:
- Align regulator node names to match the existing naming style in the dts (Dmitry)
- Link to v6: https://lore.kernel.org/all/20260119080125.2761623-1-wei.zhang@oss.qualcomm.com/

Changes in v6:
- Rebase patches
- Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
- Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/

Changes in v5:
- Rebase patches
- Flip the order of property-n and property-names (Konrad)
- Flip the order of bias and output property (Konrad)
- Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/

Changes in v4:
- Rename the symbol pcieport0 to pcie0_port0 (Konrad)
- Adjust the property order in node pcie0_port0 (Konrad)
- Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
- Specify the calibration data using the correct variant (Dmitry)
- Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/

Changes in v3:
- Complete the nodes property definitions according to DTS binding requirements (Bjorn)
- Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)
- Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 105 ++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 68691f7b5f94..864b32503d29 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -24,6 +24,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_conn_1p8: regulator-conn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: regulator-conn-pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -33,6 +53,68 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_conn_1p8>;
+		vddpmu-supply = <&vreg_conn_pa>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		vddrfa0p95-supply = <&vreg_conn_1p8>;
+		vddrfa1p3-supply = <&vreg_conn_pa>;
+		vddrfa1p9-supply = <&vreg_conn_1p8>;
+		vddpcie1p3-supply = <&vreg_conn_pa>;
+		vddpcie1p9-supply = <&vreg_conn_1p8>;
+
+		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -327,6 +409,23 @@ &pcie0 {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		qcom,calibration-variant = "QC_QCS8300_Ride";
+	};
 };
 
 &pcie0_phy {
@@ -461,6 +560,12 @@ perst-pins {
 			bias-pull-down;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart7 {

base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
prerequisite-patch-id: 0e8aad7b8514142fb33c17829386f17c3a55127a
prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
prerequisite-patch-id: 4d16e87cf6213d6e25b2c40e2753d4e629778d53
prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
prerequisite-patch-id: dd3bdf2aebda74f3603aff24a2c9aaa7f4fd6763
-- 
2.34.1


