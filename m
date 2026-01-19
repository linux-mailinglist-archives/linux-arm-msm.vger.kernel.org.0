Return-Path: <linux-arm-msm+bounces-89729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F9D3B41E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49EE83153B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFE5387596;
	Mon, 19 Jan 2026 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+48wByP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIlUPCJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8238A720
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842503; cv=none; b=WHkFufYmkB/SmKZugKzST2wziIe6szOCSehGahZYM0aLHju9W3csBw8Xf/AUw3dCVanIlX5mnFrDI+gOoNghRbxRWXoSkstzPkqcDyoG+avWXGW9ut76EcVx45hPql6WGLkK3wyaRe3upiFwWSoMOYQosiwDGcY3zDGq9AwPtyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842503; c=relaxed/simple;
	bh=q9y+Dif9HlWdcnmMDM5hAVRBaWF08BPAccXmvU/QVEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uM3dlhS/24Adg8VfNr0WvvX6vz9laBCjam5lwNfZ453spjnM2zJGqB+A9c5IpnrPsET/C9OgBWdX7FXPgdV+ANLfpdbXGri4s389DnacfdWxFhGC5F3oopcIqL9xJLCmRUYx/aEcz+WQps7VZgaCvLKNqp1YBPBFmpww3iIufQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+48wByP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIlUPCJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEoUOp2305843
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=; b=f+48wByPlf+opHLs
	gY4ySKU8LbHbYfXr2GoJGFQGupH5cCyOJ5q1VRzqkzCO+S9C/U10Ee8us+fHco0x
	arrDfJF1xBzLLbMaFdBzcwyBg84ONmfBAfeisD7VW8YgGqQv326+zB7SXFuQQJ7B
	8hVPIPf44hX/iEMn6vSyz+RrozG5REyHJMggXxOjO6gaYimTRZKpOR3ATqhnnyPh
	LrrCUjnwBvT1fcQCyWYRMDbB1re6QsT/bwqCGWMJwi1Pd9vTI5Y6/WWZ9qTepsL4
	sZwewb+4Mh9e09EH6wkORbLIPPyMrGQYKXgf4APiEvQDQLVwVEP66qRa98NNQvTs
	oEvKUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8dt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:08:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1368374385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842499; x=1769447299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=;
        b=eIlUPCJgMqWYR4GkFiC2RNbNlD+zHT6S0F3RlJZ1r1nyEk7kH3i9nBpf+K6fPNUIdX
         u8byY3FqXemgzxfVBBvTNXtmvpsVQx5kmc5prLvucONtO6JNqx+V++6+UkOnyq+axryF
         /sxz3DFDn7e+R2tkwoMvHVLN/4xoVB18O8TyEphbEAgQqZi/8TtXpwpCrfKKOWYAvtQI
         gsa3LhqLZ0pqoKcf+Nj1k5ISXeCeUCzXYCgtaWMls5UQ9xvKQ8D1sWWkeXTh19MLIcB2
         YozqPxCqrrMAnqZ5uS5Yq2tZBqMozqzT0OVpd85mqIPhIytuSEL88hY0Dk02XEzLuYAw
         v19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842499; x=1769447299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=;
        b=Q5XW/7XhnnuqAev70xhaJUkcvYw2BQ9c8enlRyZxAunSlFJEzV9M57nPWMi7J2VxP3
         62HtMncapKsM3cOdqcuwex7CGCvyfJkEuSNuJg4mi1oI18sYe1dvulGnhpxCEBHl9Q/i
         IoPDIFT4x6w0fwwo6AKcxKlTSwatVjj5qJl4984WsgtUN/X4s7fU4dxkCmh/OMyQJteJ
         UwV3+KzXLXKUsNgHS4EY48gONiDfxmptzRYAa4s5C2y2jR8Ap4tdI6E5l9TVUhe+9TK2
         kwmmQ/uL30pDTKavb4NzprExnZb9o6tEJZK9P87rMPQa5cZUWVde17ERWnI1kgeOaU5o
         aitw==
X-Gm-Message-State: AOJu0YwvvyMVeLIpxMkDey1ZKWtgYxSYlOgV4HNl16CGg7wYqkNX3rU/
	wiCHXvAjQ1uagrJ57vAcQN3dIdjPn+jregpU3D7lqHkBl+EvmMKtsskrc6hSddgbKCA0z0m8ibD
	qa5tRTcBGTXre7D9CUK6KEqc+afXpeBJs1Dw6gBF34xpsdbECVa86fFEI2dkfRfXOAKQU
X-Gm-Gg: AY/fxX6B86Gxd2EzOglkmAKKDPAz9eMfqHZ2A9bGhSl05/ZyNGx09vG63nGy3Xxq2hk
	w3BCFfC1DowC2ruclC6+RUIAZP0bSLYmbemifXgkK+S8Cj55UQxWQMf9ACXKZCwzE+OGZjEAEaR
	X22+ohDmLIAcXimZJABhWdde2yQ4+W98Hjn/1wMqFvDy8eSH1eO+MasGeQE6kcvXfIyp9/mkcNg
	7FWUCHQsbd9L3jz+/bXTq8WvzQhIYE9sNqklITTY9E70G151M69sLr/bRpjHVsIhI5kKzAJ2JJ+
	fBpGesCEKiz/gutON4CB5hJC7OYeUyjNAqjAyYfV8F81PbKBIr8wVcovRfx5/o9QMhKqRiIl8jk
	Z5YesxSwRaR26LhNrkDQOHxt7tJDjOrl1SHUTdJbJSX00afklNc+AJJT4zO+XQwf7XUm06ULo+K
	kttP5lTI5wJ4wIoedYmYqOYNw=
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr2036785685a.26.1768842498555;
        Mon, 19 Jan 2026 09:08:18 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr2036777985a.26.1768842498023;
        Mon, 19 Jan 2026 09:08:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:08:02 +0200
Subject: [PATCH v3 8/8] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-8-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9y+Dif9HlWdcnmMDM5hAVRBaWF08BPAccXmvU/QVEU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTu+r7ZJA1o77mk2TpRuSO15tDHIS8rMPkZ9
 kX3ms7qDI6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7gAKCRCLPIo+Aiko
 1dcsB/0V5kFzZwtHIqSGvv+1cFQ8ebww+6MqvikXSDrDO1RMot7omECcZXXVKK2xgqClME1XrqT
 X2sAqb7wgrXIv86pjCbwJn/fpJf4yPriyW2iHXOP49Mv6UN92sp1Dd6vRLouPWZQSmpm+yVJR+x
 nqSsorYmy1qjR4FdBIw0B4deuluimVT7jG3zH/Y0hWEbUJzWGSq4IuhzJIx0MTQ3mNrW+M0n6qp
 hmvZBWBcI4kbLGIa9dqZjOmn7zDqLCYoktL1LL8M1Q3KAagSRys0XecyKNC+3iOudjL98q8BByS
 YSAi2JLZSTtoRLu69lpwNfPGxWEtMKOxuoSj7f2gYL6ORUFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e6503 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=daeKR1c1ZtUuBhPExssA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Q67_cNgsMy4hwQG6lkNCtVsqh3FcAnQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX3OhFOPF9U2fR
 trEyfvCIwO0fGIuZgwLZGZqD9CQ8e1Ce7XOybDZ+G3wg1LYKI0owI9FzRugS1m9GSMo3LYYiQez
 otXW6vsTY0g8irdKqoeIdDFs5wnZoCaKevTQ11Hft06s9bZYyEfshzNYxzmT/QEdf3QhEQD3/OF
 hY+G/dm0l+f7g4XbeGGFkDZNeS5m9/Lds2/oAPQvNuscDjukBTOE7k4i5FoWwQ98zDcvjV5iYqB
 p0WCzz5doUySxpeDcnUAkenKpf1ZjVkLFqZL8MiQ3yalClGZ3SJExGPlOqFp0eTR8V6MUnCJqh7
 OHW8f4i30I7Um0dVCYpBKlI27deqrmzqhOluy1FEAIxVUHK3HAC+dn9pRYkrwq0GXv6hhE7ZJQx
 QlYZnKl3TuPoedGjNsaHyc0PgkvHJt5yLuXjj0TtsnMyYouMaTkUyn9MHWz5q0ANI4eDKRE/8Y+
 mO8XyG4iuRhVlfK6ZMw==
X-Proofpoint-GUID: Q67_cNgsMy4hwQG6lkNCtVsqh3FcAnQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143

Properly describe the PMU present as a part of the onboard WCN3998
WiFi/BT chip. Enable Bluetooth part of the chip too.

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

[   81.510709] ath10k_snoc 18800000.wifi: qmi chip_id 0x30224 chip_family 0x4001 board_id 0x55 soc_id 0x40060000
[   81.521713] ath10k_snoc 18800000.wifi: qmi fw_version 0x32040163 fw_build_timestamp 2019-10-08 05:42 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.0-00355-QCAHLSWMTPLZ-1
[   81.554143] ath10k_snoc 18800000.wifi: failed to fetch board data for bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk from ath10k/WCN3990/hw1.0/board-2.bin
[   85.467464] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   85.478132] ath10k_snoc 18800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[   85.487223] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
[   85.758168] ath10k_snoc 18800000.wifi: htt-ver 3.73 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   85.901630] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 141 ++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 1eea9c5c6684..6ae6e07c37df 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart2;
+		serial1 = &uart13;
 	};
 
 	chosen {
@@ -66,6 +67,43 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
+	wcn3998-pmu {
+		compatible = "qcom,wcn3998-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l2c_1p3>;
+		vddch0-supply = <&vreg_l11c_3p3>;
+		vddch1-supply = <&vreg_l10c_3p3>;
+
+		swctrl-gpios = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -598,6 +636,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	status = "okay";
 
@@ -630,12 +672,97 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 
+	qup_uart13_default: qup-uart13-default-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio44";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		tx-pins {
+			pins = "gpio45";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart13_sleep: qup-uart13-sleep-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio44";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		tx-pins {
+			pins = "gpio45";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio50";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart2 {
 	status = "okay";
 };
 
+&uart13 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 46 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-0 = <&qup_uart13_default>;
+	pinctrl-1 = <&qup_uart13_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3998-bt";
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
@@ -709,12 +836,16 @@ &usb_2_dwc3 {
 };
 
 &wifi {
-	status = "okay";
-
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l1a_0p75>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "Qualcomm_sm8150hdk";
+
+	status = "okay";
 };

-- 
2.47.3


