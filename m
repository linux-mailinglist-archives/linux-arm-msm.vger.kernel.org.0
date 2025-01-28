Return-Path: <linux-arm-msm+bounces-46347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C6A20773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 10:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DE6B7A3F7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 09:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8796199FA4;
	Tue, 28 Jan 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfLiHYa4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A841F19CC1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738057079; cv=none; b=hSqPjtORsc2jiAVWJYu11Y3rwfZ0uOQrIvtJYOnUP5Tjw+z7ebIX7JscQ5UEDxNis5+2UdLI4lQg2XW6S3EMZecDFJI/YL/deEglzUjtdP+WBtJJdRzaSN9Ghj3RKu/rqK45w3L4NGFgKd72T7c4601jfaLJtPoNNfX1BlyMZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738057079; c=relaxed/simple;
	bh=1cCWyVa5AK2/6g1dA5pRl5YsQKIo2vs/YZuAmrzjF+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=toyh/ydsUk6NvGlC9lzFErNQwOPTFrU5y4BRSAqPmlaso517/rJUU9QjFmu7h5c0l4m3mpWb3xOWYxcGeFjzQJKQZjr5ubFmXCJ+aFnHFb6JJH/V/yIwV6ScRBr2xxynuVkhMCq3CWbb9ruRcXBcB/fDtEhGNdSawi8U/KtvZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfLiHYa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1t6li000904
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 09:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3fyHfyMlBiD4pkCqczBKmlgoz+Ny2UI/7GNprFqSSU=; b=ZfLiHYa4Im3a0CL/
	VTeC+ivUktlKOvyhZYvN8TI3a1Qeq8xZu+KEZQ8DnW59WQxx0pK2rvpyUhmuo2fo
	W/zMhMHM04z/AL3THZnuxLTVe7mCRrxQCu8U30CqiKi1wT83xwAlUyyqEmsda13+
	Sb6IfLg4c9MUB2wzdXufHA88NLAZLvJX6wQUm0q/4Meqz8E/qpAWxajUiVT3zWzh
	azStLP7dsLa+LqLdp6ikPuI0fD5/eA7ib2CBJ8JW0qyRrM651frqrO05E9dgLE+q
	JE6o1cgaUKNUurlk4r7OdKAZys4ENBFe7mKxsa5y5ZbmDfiAWNLRiBIEEOTWMb8U
	UfAZ7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq0sv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 09:37:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so10928687a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 01:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738057075; x=1738661875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3fyHfyMlBiD4pkCqczBKmlgoz+Ny2UI/7GNprFqSSU=;
        b=hmssiWDC+SWibo3RekMgu2xEPIbZAHpGQ1+KD/k7PEsc/hR3QVDF0x5mNnGR/vNBcA
         wgdw6H6sUVvDXFTRclbfCfX2fs6V2JBKe2LRtwcG1LfgOFzVbdY9m64kqSj1B1ef8B9n
         Z8j1dGaUwjKSD95rF7QENmfMWxlWTi3hnVo0AtCqbzgx01BBT4TNh8/rWZ1qdM2zsbMi
         Id1tcCpjWW7q3tEt4kAQHZpVIODpvOyhi3JN83HnsVibsAZ9q6rxVub/Ch8NBmS1rltK
         EFEqlOQmAs7qL05gJ3gZVBzmSWyI/Tc1rWFZ5JPqkMOHsXc4jKd1+5GduaHmXtBaCE0q
         sDGg==
X-Gm-Message-State: AOJu0YynczTkzvCCS+FzY9Z+toVqOJTq3Z7jzHAVTfXWUb0sKLOyk/xR
	8eAZiGsu5wxipj464VgQeNG4BA7SSx8zu72tT/BKXmNM6lAbgPM1NjGBZ/DGUxxzrEf4plCT91V
	ojc8GaAFjwlF43513mwX6BdvOqoiTfeH01M5DGtR4wDoKxWQCWAN7SLQ6UfPluY+z
X-Gm-Gg: ASbGncsp/iJvyhHtFTWRv73dgNixf2h/at22kqbDp0+lm+qEnkk5fog7LQOEZVCdTt8
	+EBTcADxsFeSHLiVDij04jU+Ft6DzitOsCfxzdOwMv/GlRDPtYegr5I307HfY1oRdaCIeSdkzgE
	7QJ3ooxX1Hk97Jodg/KRldi36u+BDG9vNR9wEFUdX87urME7rFSikooglwI9MPCNWzidRh5OcPI
	Hw3nKI2ape0CAvHjyZE6HgFLytzJUo116vM39wk8/cKmayt6pYGz503O6p2yBazeBSppTPc/QP3
	eq+USKV+pe845K/VSgHkaTT6iysDlgkJx14KKuOl
X-Received: by 2002:a17:90b:51c5:b0:2f6:dc00:3af with SMTP id 98e67ed59e1d1-2f782d69fbamr54320262a91.34.1738057075378;
        Tue, 28 Jan 2025 01:37:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5sIxiF5nmw9i+VlL3P0wXzdaW4LZgy4ZJQLheHok4F3xy/YigDY6PUyHfI+AJzZrpgpjoKw==
X-Received: by 2002:a17:90b:51c5:b0:2f6:dc00:3af with SMTP id 98e67ed59e1d1-2f782d69fbamr54320241a91.34.1738057075040;
        Tue, 28 Jan 2025 01:37:55 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa456absm9749501a91.2.2025.01.28.01.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:37:54 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 15:07:39 +0530
Subject: [PATCH v5 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-preset_v2-v5-1-4d230d956f8c@oss.qualcomm.com>
References: <20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com>
In-Reply-To: <20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738057065; l=1380;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=1cCWyVa5AK2/6g1dA5pRl5YsQKIo2vs/YZuAmrzjF+g=;
 b=uMo1LPVjRGhDnEqzRL2bDPna8OgGyap9m4wtZ8NDNFEtmtezqv+aOPdParO4WZvKreg3GwbVf
 ZAKvtL7Q0dpDpu45dBkTqR1tDwJEiVZENRYJKjG/yNaJEbtQn/PN3VI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: tBnDV369qR0gUxWjMklEhhblMovw1wyr
X-Proofpoint-GUID: tBnDV369qR0gUxWjMklEhhblMovw1wyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=930 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280074

Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
rates used in lane equalization procedure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a36076e3c56b..6a2074297030 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2993,6 +2993,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
+			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
+
 			status = "disabled";
 		};
 
@@ -3115,6 +3119,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie5_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 		};
 
@@ -3235,6 +3241,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {

-- 
2.34.1


