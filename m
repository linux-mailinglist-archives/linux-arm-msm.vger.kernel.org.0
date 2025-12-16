Return-Path: <linux-arm-msm+bounces-85397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BEECC4699
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6AD833034130
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF528322B60;
	Tue, 16 Dec 2025 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBiIfT1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNU+YdIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5902D8766
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903700; cv=none; b=gQuRZjeBnfzX5LElWgFpgBQGX/eaN/GWefOlXU+1XdD18/nKz4SYKlfHMMN0GQaiNw1+25QdsaQA9WSkND06GCu8jHkonK+q6Ji5VwDO3BfnTsC2Aj9BNDjDFrRyx90L+f+uxjV/9D+WLtrMYs5lsvxgZdSV+YuPG8AFFNujzEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903700; c=relaxed/simple;
	bh=aNwFCUNIbDncr7hAkVfbp6kaJ3wx/LUFFcUFA3kWKqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pe+QTtf6GLMypBSwCuQ+gjT5z15GEOb2pLQ07PSHQR0oMV85OIcS0l2k4mDgNlY5uS0oqqR8ih5Qn4l/cpZmHW5l9UZLtL3PUdFYDI+cU2Yn/ysQFVyALvCtltJE6FDTbY54vy1bgOzV8jCnu9IzdNtZzj3sh220nwTjFwGDWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBiIfT1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNU+YdIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGCcLQC119470
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdAzf8gN2AYVhh7kbMeRbuNb/cJxGM77XiBt/2xmSas=; b=gBiIfT1a5sEa5fH+
	wPgo7pnqeKyDUKRXgGXoyUHCF8a604MWE5XndKmZdfwUe7URFN8Xelx2mo3DH+zO
	RvxYQBqWqWEF/tMf4/b2O7R+tMsKMwBJbRpfqIzH1IC6n/1bInjnhY2D57xk8+Qk
	YduvZ2cpa4Z4qhO6Zj4809SWbz5gOPkF6+87FXUNi+MeU7ljIk4u+9aL9ynVA11A
	LEE5QvsDP7NDyWsAk3gXdxgi90pMQs1TevuCy/5gIPt3MWjlfbZhubsf9eSluRtI
	elz835V3jd9UetnqLdq8WGkstlD49FghimAU/tYasW59yHtT6EKkQwywNGat3iQ4
	9GmvRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33xj1w3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so127658411cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765903696; x=1766508496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdAzf8gN2AYVhh7kbMeRbuNb/cJxGM77XiBt/2xmSas=;
        b=FNU+YdIreGV7IN8tnfUT5iXp8aJ6JdgE6Yob0LHv/DNvIJ8Y7cVi8hmWZmi1knZZiB
         ouMHx38ODUoIbdL/Byw6UJ1YrSz79z6qdNddy1s7T8f+aIPpGsFqhc5DBZzTYWnoxyn8
         m015OfyHVWHOWFvfjEvpfFYzq7H/Ex3vimMo0bVoVZMUPqHhy/Q/nTzKKq3JDvLQ/93F
         mwQR3mC24eomRj0xNO7LXQSRFTtydXsiu/z7bHGbYeCQ//XGgBRhpCZR3XsC4NSTWzM+
         1l6QowECG9LYe4/jslsFHhs0EfrazZlo+1z3WKaTpTd/h37xlsVVZSHwgma0bEMYn36T
         WdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765903696; x=1766508496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdAzf8gN2AYVhh7kbMeRbuNb/cJxGM77XiBt/2xmSas=;
        b=qQc8rFKrPfMwfsCFnV5bAz0sXmdZPtO/jnQcwAyt1bZuaAIwiZDa9I6xNe/9/X6a6X
         t+yWOkqtJkVbnuhWQUcMM8JGmozoZTq4PidJr0xtflvHYig84kFzAXvpfKbuKMhGYpp0
         3+Ih+1u2428beLbz1oCk6gruZn6x7/9cPyW849RXSajxiLhCgfyiOi5rdJEeprYguM5h
         7ul0NtFJM/iOPnfJN88PYjUN4q1J9kwGKOKS4QSYir6dKFkm5yaUgOY6bnCf7HKsutWi
         sQm/TuTvFTWreA+9ypRexLsU2g+4ZVV6OWuGyh8NYc5KALdbBxO+QbjBLXaCKmJAqDz5
         VcGQ==
X-Gm-Message-State: AOJu0Yza0uezvYLxIILKaLVg9DJ+cfk2V2mxcOk1/Hmucf6TtKCCMyLu
	AYTrffsCHEIjy0tjahNauRjgaXxMP9Xr6x5Jdaow+WydTyeDVznqquT3q9PmYmMCimspZlMHnA9
	4PGcq1SFori8ZhhPdN50hEOQ2m7NTi17v4PwwnpglJkRfsp4Dw+2odIMgSrwPMC4i3t7251gx1N
	BP
X-Gm-Gg: AY/fxX4dwzvL42sL80cWZ6KZIgKG2ON355zBsaKaps3q5AaWDJTfaaVf6SZGW+ZMFxO
	dtOK2iChKWa9iMYDYshd0XDtflXkns1/z00XvvmfCZnT8twe4cwcCzu4Barvz5nzC8I8XJH4eRz
	pYPC0n2DYubxuP7+FKF+qOo7U6CUqNrZX9z9fqPglnjuvoV7W5Uze5Nmc1/sAjKUvyP89M0kSty
	6VyLFjPz0AlCeWHRiNnrVSYfTVhj10J5kQgPQCucckiqmYe4x0oPQOAF3J3KmonzUMxGdePaIYj
	kkHLFzvLVDCHVD69m975cbMAWcPBgBPYmQ12tsvGcnOWVL80NQyCKctysRJbGuimdunSMWtDqWf
	0uuKslUWCqtrfjNXo1/AocAT2AAEQQ+Lo
X-Received: by 2002:a05:622a:4ac8:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1d049f56amr185131541cf.10.1765903696127;
        Tue, 16 Dec 2025 08:48:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMl58ZsjwhtbsjqtbJdxw49czpyUa3LmQxD1wO6kz/3thEonZWs1dXM5X4hzSjVmPXx4NVxQ==
X-Received: by 2002:a05:622a:4ac8:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1d049f56amr185131271cf.10.1765903695665;
        Tue, 16 Dec 2025 08:48:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1730719066b.22.2025.12.16.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 08:48:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 17:47:34 +0100
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8750-mtp: Enable DisplayPort
 over USB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-sm8750-display-dts-v3-4-3889ace2ff0b@oss.qualcomm.com>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
In-Reply-To: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aNwFCUNIbDncr7hAkVfbp6kaJ3wx/LUFFcUFA3kWKqY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQY1GqfdE/Psq8rIySKU8SIBjffrqbXjfRpLp1
 bpdBpBlZFKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUGNRgAKCRDBN2bmhouD
 1z9LEACMSvFgG69UKgvuWDzGuFRaJYLbAd9RtTxclzsaIQZ5DNYnFDIl4cO6oQ5KXshSEwdxebb
 dJTd4cLHPsL+G4rOecQDJaflUdokZzHNmQvIc6BuTlYkPFo75n1/RKD8LeoH1kigIZ0M+QI1lNb
 Q/HhpFT8f02elz8uSAblNy0/ddLsmp6oEGf9mvmI25/GK1ib+EeIJ5mDJb6dr85Kb1MfZvIrMpk
 5rXWgndJOftkbrWypskXJ8Wpab3/QpeDVi5QIP+eXk0Q//aj3GaTiPj0U6rc0co+kIi9Iz0UJ+O
 mNKddacO4fs9GQozss2UOtIOrsIsRcpT00zBEhxNFLkyBbV4wLj/hKYBByiXxWv3k3x73cg1eC6
 8H+Ydbeo1cy1pQccBvhOizDwMgwpRrdiS1KYAUjsmitj6y6S21CBxrFJRNk7v9VZX/+8H19aFOj
 R9NsPtFBZFWeU2LUQDFgekw6mJUY/YLZWjF/BLUoTKXzo/xsX+aW5oHWwPiZ6Qjic4MIiHG9ZxO
 CG7ZCQogLBnSjhaCrgmC1PhD2cGf5nrBkxpN7PrZoaY3kEnUw+OcjrfC82M85BUIa8AFlNssMYv
 4YkhPyoz+kW2EBb+mkQgKIOvG+aq1Tm2n0nGgFhcyKJ47vy+sRx1oVcywAea6T4qvfL0aghioxZ
 SRUCbCYDpsVGqYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JK8_HltU0aYdRFOOPeUXbX183QocixIg
X-Proofpoint-GUID: JK8_HltU0aYdRFOOPeUXbX183QocixIg
X-Authority-Analysis: v=2.4 cv=KtNAGGWN c=1 sm=1 tr=0 ts=69418d51 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=19iE0zvP7ha1tEDHEP8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NCBTYWx0ZWRfX+1sQn1Uh/M+z
 Jx0yUor9xxfP0Frky1TyJZlTSAaDHf1tIZrZrMif4rP1Gy03bSzIn58IP/dhlEoJJihkxJ7Ck/U
 RNxaKSJQ+995DGPAe31FDgb32P+q/3az/1niuwEDX6PJieePX7AZc8Tdby6Es+IME/sIajD2QCW
 AvEs2lVT58OvfM0I8+ra2H1Vv6BtqyFi+/p/1BWAPGXdWERuuPVBZNxdqUbavUOCYKFXusCBGvz
 zJqMOCc9+0q0BF9PEdnEsOXEZ6y/gEHfm1vwJAeQ4eDSuUPGqkLM/PjGDDnM0FctMy6Sms4TQSf
 oGzJ2Jz/R1pQsPLDrVMWK1RczC5RWU1Maed2pHfWLR6WVWrRu9Fdm8rly3M8PZdsW4m9Z5nThE+
 wBwsgOwJz2oHnMHGAoj0TMgu6udLDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160144

Hook up DisplayPort parts over Type-C USB on MTP8750.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index a08bedd2987e..383bce57ec62 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -983,6 +983,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3g_1p2>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 11194b34e6dc..6584e324a163 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2648,6 +2648,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3142,6 +3143,7 @@ port@1 {
 
 						mdss_dp0_out: endpoint {
 							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
 				};

-- 
2.51.0


