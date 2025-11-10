Return-Path: <linux-arm-msm+bounces-80940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A439BC45714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEC1188FCF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0262FD7AC;
	Mon, 10 Nov 2025 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFJ8W1a7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwXl1nVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE92FD7A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764637; cv=none; b=mdXFNfoQP1bP8lB3RLbl/Xb1MCxtruIFXEsZyEu949Ez6L08+VwpKDodkDM8h8B2S0Zdg4zZIIUa+ZZOXBZZJGqbZp1gjNZQCuJQwnI/S4efcsmEvQccxzErHHfyutNh/OM6ERiw2nvv2bx2rCSXq1Gpz7PKFeh9M6LAt9DZ/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764637; c=relaxed/simple;
	bh=+CyPHp2jOdO2VvDF9neutATNGZFt/Ej5MGAS+XUjkGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCNQhcYkj+zRXXSfCRMSHOWEF66m78IQEwHG4eNmmbl9boDVNHUHOiYSYXUlby42A3vEdws2U2PavBIc/BRhwdirPKXxv6dRpENW9BA45bYfHVwTbUoxvhbQimKkow9FhfYC4xkiuBroOWhXIyY2n3PNFSC+oPyu4N4oyI2pxN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFJ8W1a7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwXl1nVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA7hJMR2861333
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uhbs7Tn6ski
	4RnU4v3cJMobbOt/zkIYVDr76YeAoJNs=; b=CFJ8W1a7LGhxC7fK1yXonDNdVat
	YgPndNVCGCFmy4gV4TKw0Ii1xDxVkedqpEZGnh1/SJvq0Z/waMrV3tuzw62KYSsy
	T3o5vAokSG2hCQqmOdQGiS/QAagJGmP7gT/Ng6mn6gPWShjB4k+f++j0doyM4N5R
	IMX2uIBA5R7r0cnq2dSK4emOg9KIJo4v9iE+zpUNxZfu7iIeIEalfCVozOhGzro4
	zEj4KpM+h14vLPw7/kspNepGPRAN0fmDflrm7chPzhzZuuFnTZDPYBpHpRzCOE8o
	35NLt4izpLsrep2acQFe2OuJ4jTcceqSjRoxa9xAUuhX+SM5nWfGqOix7iQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abbwe05xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:50:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f89be57aso7521655ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762764634; x=1763369434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhbs7Tn6ski4RnU4v3cJMobbOt/zkIYVDr76YeAoJNs=;
        b=jwXl1nVH4UPPWxBJZ1gorEf1cxxawKSuxu0k2o40JT7gvajuE5WeFaZoRiClLevJWH
         Lev0NNRVV5ESSdcmRfTV7xW78uK+3zO1EWMQQsoMYpQIXkbdFnpm9n8rmzUYjtkYiEW1
         rUFNXbLyYV1jP1TVx+0FDfKejXHKFXc8oKZoo/ero3QGiuBih11KRyqagCV0m0s1pDuz
         TWHf7slTutc5iVUc38lkvrvtzNM7X4uEphFOOAKVDdnxBMK/LDQJwDevTttAdnQGdamM
         +/+zH9oUHkiqnJLbZhye0RyKsCuOCe4zBHwkQMQf90L3L+r/HJf41n5rJ1z00BWKln7d
         kBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764634; x=1763369434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhbs7Tn6ski4RnU4v3cJMobbOt/zkIYVDr76YeAoJNs=;
        b=OeBLOePregzCS3FnDbbKkfeapcYrAC7i1p73yVk/umEHxCBnJvYq9gx1x6ge3wEhPb
         XOnWiozw88lZqOVi3TYowkFsVQR8yfasgLbY2qW9zAG1dJxxkojVDeUsKozJCuC1we67
         t+R+LdYR5haMm2qo7rCnvUsYmfR6yjC7BwzPfYONHD6AWEjk1N333Oapupowx0kBlQz/
         uI93COc6NqixiCW7yOHb1njS/R2l1L3BtibLi3AdMNOK9s0ZFgGKQccBfmIOD9yc9ELb
         zTiD6ITYKKRw2uFBJpkjilgfHJK/eqtLLx6Xj6joXWbO1WHQBY/BFlVoBYaI7XR5dE/w
         6ADA==
X-Gm-Message-State: AOJu0Yx+hlseF02HciMHEtFMC6t23x+0qffnAUyS2G00WKJhLRsC7IVs
	gPr0xGe4JBVcUVcngLlWM+9jvLoQQh/A5mU03KilqemzBqJ3rCjwq6/H7j8wl2xw3PVPjratOXP
	OBn9jg8z0mrjZkslm7FYvTkbnXDblA4/SJS+r49cdF/jwl7BVCKZJWHRgf02Me7XFF8A=
X-Gm-Gg: ASbGncsY9ha2QHGcETirAx2cM25PWgw7Xtp+t7UjZcBywhZhDgRpGOhSJMXe8ffffKc
	sOwV+rDOswAJn4Jc0oYGAyMbnkBC2A/zuM4/fc+Ch2tu61GW3gbh2S3kW6BfOPNWfShwDtION22
	hxC7Y1SmyjPigQ83BaPfVnDlKBijDPm3oP07aTSKX0EsRkzLftzbWVcu21Mffe81+Fzt9lMbgEI
	S3VW/NXx0qWIJIne6ygLk4kaz1QRm+O2tnwFG/9P4sHIq6RLJtwEKG1TbYhYRYJzflVduBe2d90
	ABo9kgrO+73twwEXU1Fcr2RGeV4ZnL6oWYjWJBgsQayNr8AM9Q3MH7wy3+2O7zNVglTGU4GFxyw
	fPcFKqgZYp5D3fOejpMzD7zwvsrWAeQ==
X-Received: by 2002:a17:902:ea0c:b0:298:f0c:6d36 with SMTP id d9443c01a7336-2980f0c6f48mr23902465ad.5.1762764633808;
        Mon, 10 Nov 2025 00:50:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETf0mXadMDjoZhQQFsk1tltO4R9gYJeZwT9t9NnZeY6umr0uTId1kF8gfBv+Qc6hXryBn6PA==
X-Received: by 2002:a17:902:ea0c:b0:298:f0c:6d36 with SMTP id d9443c01a7336-2980f0c6f48mr23902285ad.5.1762764633341;
        Mon, 10 Nov 2025 00:50:33 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f94fsm138691365ad.40.2025.11.10.00.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:50:32 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH V4 2/3] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
Date: Mon, 10 Nov 2025 14:20:12 +0530
Message-Id: <20251110085013.802976-3-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: szkCpJkz5TzBlzXYtCouMMPOCVX6ChJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA3NyBTYWx0ZWRfX6RxQBDIcCTin
 WHj2d82Hx569hh01KtTKec/HYWRud+o/GRwDuL+ZsOdaLeF7W3BYjV4n5aOT+0aYKhpZX2NxIKe
 VeIXAS8G6DX/16KWMln6wljIareYZy34BScO12IVP8Lh6MVBnRtM8CDKmbWMQFumQzXtvT/9iQR
 0RBSMCvyz1OfJEMiEKoaYsRQcb9x8+7zofI95vdgi0Xg+N7QjEQKQZGuR9pHLtCocEgeyWf/Ct6
 R5YYgfRVsziolti2Fa1SjAx80BFdwAnOmKy+x5AzLPce5DTFUtqCPtg43UnTgBW8m+1yLp8h7wB
 AvZu37JhlC6OMN82yM/fsoWsj/JBUmCHcRGTfbLbKUP1G5Xu7LBdPLwkBY5N/1Lfs/npNPBqZ1B
 cied8HYfpzbBLuB7j0nRHx6iqjfO2w==
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=6911a75a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=eFmxIRX1jiqOf_WZ5FQA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: szkCpJkz5TzBlzXYtCouMMPOCVX6ChJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100077

Enable SD Card host controller for sm8750 mtp board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..3b87a1af3333 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1030,6 +1030,22 @@ &remoteproc_mpss {
 	status = "fail";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
@@ -1163,6 +1179,13 @@ wlan_en: wlan-en-state {
 		drive-strength = <8>;
 		bias-pull-down;
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart14 {
-- 
2.34.1


