Return-Path: <linux-arm-msm+bounces-52692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5DA73FAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 22:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA8517C671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 20:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEDD1FBEA2;
	Thu, 27 Mar 2025 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUxRemTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E21F941B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108909; cv=none; b=TG2I2MGUCUf2mXqa7PR47VDcGFJrNChi+zx24lqgn/DFN8tO8C6a60b2PvkoZ1bSXkk+WHVoTlqIbc5w/jeV6BqOaGNGp6qYudTw8KklGolK6LC7hXOmlMLcCa+a/h7jydiizBxplQscLTI/kf8gOWxxfYUaDHVFK1kVr0YfBq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108909; c=relaxed/simple;
	bh=U9BdzzhWeFpEO03ZcdPUogQJ2eXNj04FLA772lDCFGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVsypb0OU8o/619Rj0iie5uSyOfJaixTu8ADqJ6APj75LMDKqBvQX2fpXKpmE0WY6CtqDQrgL+WXS8CLuJRGEWHXFlzbTgh5jIE6DTnUTNjyq/ty7Ybn2gGt1coNH/QU2o47Syx8PKgJZ7lz+Vh97OUqpEojUqGHOaAU+eGGe2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUxRemTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REV3O9005301
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 20:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZL2J7j67fkYh+i4KJociVMY43u3MrYZFVTQ4IabZiE=; b=JUxRemTsSogy1f5n
	SiRsW6BUwBlwwJQOcJ8z23Ozz7FB8oiK9WFuHmf54ntRAQbqXqJwwoXJ1LUgLAHo
	ZXcas7ep60/Idm5Tjo4O8k6eh/+366fMHehP2GbhWU6HuJ4ZiVC2Kq5FP9begQ+r
	vLR3JDw3uS0DhQ7/AXX5EdHEaONls3ZtCLTA+12G/PoF09BUJ2Pk24EyY+8nZEdm
	G6K8VIhUbOheT/e0GJ4qzODwhAYFKf1imM4RxwH2LAHkv8viGSWmBrGZIwnCTjLw
	z5wBSaeVq7P/DjBiaTXiqoyA8JcBxBJTeojLCdj8GSY7lenaMtQJAo5At6/V/32x
	vdMqxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktengnfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 20:55:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so2335446a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743108904; x=1743713704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZL2J7j67fkYh+i4KJociVMY43u3MrYZFVTQ4IabZiE=;
        b=dUwDgB3EsRydQeuW3GvzS/7CE2KUpc0EqHgJVpY3OdCYuUyKtQFlWt+ot+2624XBR8
         Cin50B02uZKQL5xim+I18xlPIOTz0mfCYp/YkJ/m2IM5BP7Wru4IyRlHTG9YTJW/QQPd
         Km8j8i8mUehD/Am2/GA9jmrc+qoOmPclVabcHLeAo2j3NmURJ3NZ5IPuXG/OmZ19Hi2x
         wBKx7bEbczP+oNrmkb23MC1bNMDWnjaHlf6vXGYcqCKkH0n3UUvk1r1hSdf7kKE+U0dO
         fVWopsV2+E82LysJ/BR0hM5R0OTi1NgbYcHRBEQ5jiJwvM9dfyS7R6+VU4z/h+RyRdDk
         T17g==
X-Gm-Message-State: AOJu0YzruLnvtY3HaHM/xKutWVDMgxtwqkTlqG/H7T2U531bTgWknFMs
	9/OTeLwrBejRCQQoxoqG8U1/ZsTyWd4yCA3ExZ8qmNTmkjPYiGDFgt6FK56QTCju47z7VoI6xfv
	BzQ/kfmdQv/MxdJB5hovdzmiueswYrc7lF1+ltEbNZ2aptGzCcu2tyrYFBijXswE1
X-Gm-Gg: ASbGncvVZzyOPft7lMhOa24fwtooWN/HDsfm5zoqKeqMcqBzZGtx3nhgJccsvF0rMIg
	4ZhUHHOJktJggdU2H8pB0/kIquRabvL+NSje4wm1eIODsPr6XIGkpVpoF7aNkUTYgY4MwDkZGIC
	Ti//A5OVGboCZjSBywpqABm43ZuXV6P4vjdg4ScD4Fnf4c6iyaS+blfZO0IT3HZX4UdvFvdiIgT
	8w8ypByGKNSK1J220HW5mWwxnhxYdjEu3kS0SdHHCo2DVcz95t6Hde+INOZ0sSlxBJK01nHg3iR
	TT5/sXIBP/BYaHvQqxA/O29zzlA4jNVrAg83ifnIMPgcCBb4pk2qIrfZmW2MCIHDGE95hyw=
X-Received: by 2002:a05:6a20:9145:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1fea2f985e6mr9089552637.39.1743108904029;
        Thu, 27 Mar 2025 13:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeWk5YIjRb7LighhOG5PT8QRBGUHODIFCxkwgKYHselhxMyeDWhxxLY5JxTwBRj7OMdUcaDQ==
X-Received: by 2002:a05:6a20:9145:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1fea2f985e6mr9089515637.39.1743108903558;
        Thu, 27 Mar 2025 13:55:03 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10da3sm330889a12.66.2025.03.27.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 13:55:03 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 13:54:30 -0700
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 MTP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-sm8750_ufs_master-v3-3-bad1f5398d0a@oss.qualcomm.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
In-Reply-To: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743108898; l=1323;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=MdjD8aiHN7OIuRznvg54M9HPuWn9/2mgRjQBVr1Q0Pk=;
 b=5T5ASOH7NkLgWgE7q0nmKRiqY5hB453mQWJyRvMZccbsIEoVlAaPpIZiCsEeCwYUlOkTUrM6Y
 CXJLyGLYFIWBmkxh+xrlpJHwai65gRsyY083J1n7VV+80/UKfQIC4qx
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e5bb29 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YBlEHuN6XgywxwcP54wA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bSIWih-_ICRdD8cqK1EunSI_ygCHcfBX
X-Proofpoint-ORIG-GUID: bSIWih-_ICRdD8cqK1EunSI_ygCHcfBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=706
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270141

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Add UFS host controller and PHY nodes for SM8750 MTP board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5d0decd2aa2d0e0849414534cdd504714402458e..90abdb9da183cc6fb93d2a28811baf4e348f9831 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -806,3 +806,21 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1j_0p91>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 215 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};

-- 
2.48.1


