Return-Path: <linux-arm-msm+bounces-62160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C211FAE5C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D66B17F5BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D75257AD1;
	Tue, 24 Jun 2025 06:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvNc3dEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BD256C60
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745134; cv=none; b=Y6pNueruligKf73rifoDIcgSDuEfqO0gL5SoqUs8cJzLs9/1XnMO4Nu9gLFzB6le/i0B875ZRXFTvtiLJygJFzrR53RjXC3Sw0tdwFJ3vrny927L0E283fUEYHM0F8URkopEdnnRj6ZI90XAvauImv1yQBLLFpjVztfrDFw+3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745134; c=relaxed/simple;
	bh=f30cw/8H4EXiyHfPv/hWpyXvXZsxpbdm/rrj/jZvh1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OWLhI02IrCv4z5HQUNdJAflB0iUbxo1ie91kb1a16lN924vMcu1fTusY+GeiwwYwUKE5yHykjl+gN4EBhkt9aFj/4mgzm+Os5KrXI//hbmLZ4DZ//8y5xM5P+pPbWQlVpn/i87mYgENGN5u8gyA69pGtoKTUzgOpAc0YeTfTqio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvNc3dEu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHZfNG021079
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k+EDEHFqKkj
	GqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=AvNc3dEu9OgdoCaoXkLzUHZ9gAj
	+LCOuG+Ek+3UbSK0O5HVWs3P7rPlKIuK06AzWOuJVuurAgScQlqx+6uwgqnbYwWk
	gMR4Xg0YvkJNPtddMgm3TeNbvjoXiH+14q2Uf6qbEqctSkKZmosPcQtH5SLj0drs
	O0LriF3PPIkkbALAq/zfaliTCFIhsVaP5e0rnXM1epymcQ0kSJY+c14kkr07XjdN
	DKHO1WLB9rjEng80kwup4oarH7sKQLacQRpFDuT6fNFiziY6DgeUIVyzU6dPqmiZ
	z0ykrvfoxoYX0De1qBYD9AqxSWXh+fFM+p5YoNHi1/57VuaGvimCWj0cppg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3tv64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2354ba59eb6so77290105ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745129; x=1751349929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=;
        b=wEYoXfhGKJFq3LjeUi3/LVOOshAPJ9l5HMGXYd2Bh7m5o9OU7UJ30OmnWDzZGLTy7C
         nzGmp7hSAtXnpbbQ5mNowk+YreFQIaW8qQNftuyRQkzQ9qyY40T0RuM5+UKOw7JuW4sy
         V2tTKHVqILSnf033ApdNeaw+v9Otm8vrcLo07zkBe6gZ8FCLDTcKhyI9NwIiXyRg13dJ
         avh2xn7A7tzRdbzhfi1xX5BWsYqeWGlMoI6p4nxl7dvap+yyQkljHy5NkwyNsYoxxq7R
         ppnZyRyZDgZazNtRa9Ai+Vm9KfIlVwhNIRbo22bqZn9U382ZrXjnQf6afgIlAXNotluQ
         ibFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDsst87pbJ70XBRnX5kuf+6Yspil6EjFHYOVOUyPLHz4g1IP9POQvxqrKcbCt9drqyTx105H2SgYM0JP6e@vger.kernel.org
X-Gm-Message-State: AOJu0YwuK2oWGeAJ5g+cbZME9Sm4rs4kuBxbXVdBoc77eaLU2h8pVATP
	swnCX/G3ieISaPoBzstURymBMiXEA361uvGlpGBLBqZ/ZThm/yU01pNYCpNCh6UdeYW5fSYOO8g
	Rl8EzN2FXBwiyPSiqvLd4Qs2sbU15mKOhbej5lJqRem8yf7T1JRuJhKD2aDfEi8SQ11LX
X-Gm-Gg: ASbGnctBFLOvdtRXuKkdyAaJmPnvvHUMvLmDBiXNpdAnceuERhj0Dv1GSmpaBrkGSnI
	dF2BDxmlDTWhB4xUlQ4yNSNxATDVGsp7UvszTmif52PeIHfH91AyGAbv6sYIIOgKV4H8MCmvvuF
	RbUiCMB5QM4NW8onTVdJPgZWKRJswrIVm4U/oQLWwwPzfzwWqbU8Tmp3vERM2cWiV7C50hUHUY+
	AD8HDjYWJwYlw8OPWI7n7oFD5RAbJzbQuRP1rkHV2maoK72EsB3izleXpSyA8FyGtnVvz23K2x5
	+RUlele53nsukKay8V61/XzoaAba66iKYmA8C6itpv5d/yFjpIJPE0ENy0Zg/WOrdR+gBzekJe1
	kQQ==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr249676975ad.31.1750745129471;
        Mon, 23 Jun 2025 23:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8VGvDMCZ73CeV5AtTxJ9YBH3JlGYKE++/duwsSfivQtp9438F3OMf8ih+tv26WkZtIRFKw==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr249676745ad.31.1750745129144;
        Mon, 23 Jun 2025 23:05:29 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Tue, 24 Jun 2025 14:04:38 +0800
Message-Id: <20250624060438.7469-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX+M/xfKtIP/2D
 aFPIZU5a7lfYyrLs21tN0p6I7DNd33xiZWqo56TVpomWoavzdcnOMrw0vfwde13s+Vhf1KCr6jI
 fcnMROIsdZvQTcrypfPsH3suvM2du/HkxA0vezzPukMv6TPLllffT2j8U47oNVQ4yOP/ooqgb59
 rN6cRvaROUIq/mlFu6cmBEAg/S/7kscQjftSVMFUrsS/zVdTbQva64lKBbvn5TbCh8pj+/hspM/
 crmEr3GFEKJjd3jEO9UGyG9BrxNEiPTObCuwQxwlj7Sad2ggHfRIwaK/PBTsIu4qVSxbxMms/Ss
 HbtBcogvMAR6qVvjOTJrGWk8NxWGuBqweIHadwofG46Uwvgnnv45bYAaCDXzV7QcMN86wE9u5Qx
 iPmmSYxurXYNgHCtQBY1hBBT3Qz/U5jY9gE/CIBwrbpDT7s8mx1sL9NZfO+8fxFSUk5YV1HK
X-Proofpoint-ORIG-GUID: pjQzyaEK39DKCrjNp7VEgOX7O9IAtlcu
X-Proofpoint-GUID: pjQzyaEK39DKCrjNp7VEgOX7O9IAtlcu
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685a402a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=818 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f..44da72cebcf4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


