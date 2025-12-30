Return-Path: <linux-arm-msm+bounces-87030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C1CEAEF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 00:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 332FE30060D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 23:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC521330654;
	Tue, 30 Dec 2025 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyHOKL3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE07bxKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392812FFF80
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137796; cv=none; b=SfxaW9MVDmg7Cdc7v/DbZmlgPTln6A1mzFn+3aKnvIN6Il58UzBr6RAOpaaNuaBtcFKm3KWT1KuTcGMNB8A+BGiBNcz4omT1YZhKR8P0fd434r10BoIeQ/66b3Lp2dqa63FtzUv4oUU+wgxC6g/GQa+IxTcpXhdUjlBMuDpxQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137796; c=relaxed/simple;
	bh=8vfZDA0+eLe1oxx8QbS4fcx/NwTCXaa5C6ek/BD4aCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxSgtLNcrYsP+qm+ZA5Uc4rGvngSwyI05nfU668/5pF8YUnxSuN04+Ac7Gt+FMawQ013x/W2Qjpw98oaKQ5rq1Y3JC5qwEPIevH0oDnkfa1ts/sfqjLuZcQ1l+EAwSFZjTwS+XMUOGqH4KqE2vkt2Vl2e/WRjQ1/P6lYW6Y1Ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyHOKL3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE07bxKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUEiePP3540739
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=; b=ZyHOKL3hcpp7i4qp
	0GIrq1tf5hu5F/14rTt4lUV1lZd0g/8nefz26aBytS+Bm3VE12Jtjnh6syzFyadx
	Bco4rsrmgTZHVZGfIYpYM+HNFdznF6j8Xs0eMNQXsoq154cdqvALhkqxo+FV9+8Z
	M65IziGfNfQlMzR6MldybzIwCh5CzeSPSMAg/hMVIBmhWbVzMoUEHC5DThIVpadC
	fPoYi9HvvEkzFZsHuktLdol239sG5SmoBuygBI439pVIpIdpcKMLK/ZD8Y9UXmDg
	LS8zEID76r4fhShzaibzWnFPVW8LYRx+YpyEVWtFDVCp8Z5LuGoxwnA3+w908wRu
	4q/76w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yj98c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 23:36:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1f42515ffso262566261cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 15:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137785; x=1767742585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=;
        b=EE07bxKM0Xa0PwrTaF/5k+J+jnvTJmAWXF2DVELKMyhl3yNz1d7jTL4Q2gprbDUzaw
         AzoYP+Tjd7z6NEky4ZhQn7k+ldJUVBsKZhfcP/9wNnwY3T03fqL3Nt3vrCi3ivogt8Pr
         kn5QqFQR3IZ61QDCNsYXnnOre0vzRPqCq/EWEKiSG3BNQHV3fSxZ9552wLQd6bbAXSuO
         hBD9B/TwZO+siaLJ2oV5SdE0Iq9fyD28/ZBa+q0bSOZyC08XNbkCau4fHjymajM1367e
         vedezsrzRICuE/TS1/ZOoXuG71wVcm6aitvwtyVBdKPuO6vT0sX8pjNB0s3GfRGoKt3w
         1ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137785; x=1767742585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=;
        b=AHymxej6JSIMoUCnvZCJWPAzp52MOBC9v3bu1sgdF9tvzgdV8xwENSsvji0NypXX6H
         rYCc+ATDlv+DuYd4mmX+SMmSfEcze2FhNyYyaTMR+POaQm9TZHmO+6aTZ5TXFkJxwSYb
         MLkniRAFCk11RSyvnszLRZbfAjghM4MLk2CzsmuIUFvptNqK9oJsj8NFfkITu8uLrR8L
         zbfzo7DWLpzXsuMphn/jeXNcy67p5elw4bM/9CFqDiFBrAzSjStqa0EXxVJAkgwZ+Eqj
         bUaImbU11M/mE/spZz7SQEgCyJxd5PMaG887HmVfKSfbXLtFSX9XpolKRrTUco+Cra7h
         U3yQ==
X-Gm-Message-State: AOJu0YyBF5XFxXw6uYIEKUkzxvrKvma4SulmlgJN90EKj0s7MclMpzWj
	QptfGuDUPkZj9LoFLCBAC05ojh6IpY3DaawtyXUCg2uZKG99Cdwf/xs+TLwF2JNXlVhOuDKAB8b
	nnjqQ2t8pyxL4xjlG6tKvGZSa/MiKjFoFDAGfi2MLNo7hOxgHYKXyK2pJzMam1CbRuSP0
X-Gm-Gg: AY/fxX6WhbTnbLSABH08XnYXP9pVqS4OBgzN1DXoHmtnX00xKyn/hEePDv7E28VJY6N
	MQPqZm3VKRBo7cXQ+9mcPtGHM/PYPFfgtgkQQR957fO1hqfCjvFvoRvBe+oirGjmbw808+9PiNd
	2CtwtJrP794VAoNp5dt5mb8t5rskJnHKGYUwTzYBRaveV3MrTstRMoXJRhASc+tBSLEE5Pnayrv
	i2RcBg/vmh6VgeZy50MgpmZ1E4S+MMjenQTKUPuyjdWrTJ2wrAifOKQ1GkpZzEu/C7Xwh5rKnWz
	5n+og5kWPFVfK+fSxrpT7r8JTU/5WB9bzvZx+OOzvh6SPhlp8KNDn5CG+2taPTG+fz2+0fqxWWD
	7WYZrmsj1hpamJXzFjY0H6FtRG2ZpMZlS3+x248WuA5j0EoySA7C4EbId+cHQ1u16d+vUaAPv3g
	f73xdPhHQE6D0QlKvP+aDHHeM=
X-Received: by 2002:a05:622a:cf:b0:4ee:1e95:af68 with SMTP id d75a77b69052e-4f4abd1da6cmr579228071cf.36.1767137784784;
        Tue, 30 Dec 2025 15:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgR39HskKDK0VPENv4JCEhQfvh2ZibF0b4cYURAUkvz8grVJGOP6SkuWxVIrZPWDN84BJ6pw==
X-Received: by 2002:a05:622a:cf:b0:4ee:1e95:af68 with SMTP id d75a77b69052e-4f4abd1da6cmr579227521cf.36.1767137784225;
        Tue, 30 Dec 2025 15:36:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:36:04 +0200
Subject: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5614;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8vfZDA0+eLe1oxx8QbS4fcx/NwTCXaa5C6ek/BD4aCo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZI4lN9j3hTM6s03asXMy9bNyhf/3Jm0nFG5vitli6Sa
 uVTpuh1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi7j/Y/9nxJ+x5+6+5R6ff
 MV49rT0kL2PdIhaH2VZlUUnLHK69OHCxX9Yy84FzdMWOxBeZF5iPByeJHfEVNX883/XVzW7m3pz
 D4lmdy0vjpi9N2xrGObuh3qfDMVnv41qJ/LfRt1UjpQ88DTQS4uuatfr+3SM7H6/dEyhWyfHQmz
 fU2bR5+STlbaUGN+24P3D7Pe0svnVeVFQ75mx2Ss/WdY6H/i0I0Q5uObJ0xrLFrrsaparUtOYxR
 r1l97zlEVC3ILCVtZtLIY7hom720pM2a0y8Hp5bbXa+Y4Ze5tz9ReuFLNfWORx2zJl1sHzZXNbw
 Lmv+mTbeH1g/3TzCkBna0x3w3Jn5XsHuIpOW+G2l+hkA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=695461f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=daeKR1c1ZtUuBhPExssA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Q5o8YnkFkamzpMdKiGWz_ySJrvAT98Us
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX/8ZDsui1C1CH
 nisWRd7Ni1EILv8zq3N5/AIvLuWDGv0cy4a7cBEPZ/b6kLkUZ5nV1R4koqbMhHwJ8a4mQfsU8cc
 +mlMQ03n9zg7NSnslQD/3GQnTBXKCxrnaC3hJxcYtl4uSM0CbwXNJj1tJMSmLjZRcKgZBH7pouD
 nW8Pyeexl52aTpyNLsNv5SEpj1M51VmHxhatl4YbsYWj44QnpDHax9W6uid6M0HoYKl4TxCuS3w
 HohUXaEr99VmkOfCtSfkyXCI2qrUPCkHNDm1Kqxex8JJKdJq+vJqil8vloSGQHXp0zgX5OBsr5z
 CP09E30kySW4t2v3h7+fISTk5xdMTCZR7u0SbxWzSe0VcMBigW84hwiBRNp3Q1Hnda1c1dY3saK
 KGKmreayYmFwnjB+pQ8llbC/FJL6xxR2wYZirX+J2PKCsax0ftJoiagzgLwZLo1c8/qK4yumxsM
 kmUDntokv3YhylEoiMA==
X-Proofpoint-GUID: Q5o8YnkFkamzpMdKiGWz_ySJrvAT98Us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211

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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 141 ++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 0339a572f34d..18b51a1236de 100644
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
+		vddrfa1p3-supply = <&vreg_l2c_1p3>;
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
@@ -594,6 +632,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	status = "okay";
 
@@ -626,12 +668,97 @@ lt9611_irq_pin: lt9611-irq-state {
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
 
@@ -705,12 +832,16 @@ &usb_2_dwc3 {
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


