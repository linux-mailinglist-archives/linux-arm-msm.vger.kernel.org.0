Return-Path: <linux-arm-msm+bounces-52746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42915A74845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86CCC16E23F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3782E21ADA9;
	Fri, 28 Mar 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV5pup4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73E21ABCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157747; cv=none; b=qRek4Ym8CTeFiZkP3uSViwzH+V/CiSU68Cez3MuhWP4RY95ZBWBjYvup7O31lJcUYeVsbi/opGuAdpVtY/+l+3ke+Bx7ovrQIsSEtvYbm+e5K7REa9Ulws4R3yzu5xuvZpA0wSy1+yjJRMlWEsUojM70mncFzti4cHO/iY/ouzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157747; c=relaxed/simple;
	bh=3xtlvs1vbdz9Lx9DTGncf10UyrhBPWHbtrA9J6tHahs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ts/sjaDj1euei7ORhheG3BCGaAF/7O1KzWLYKiPlYZHplrqv2og8BH8Zgy3/ivuWfQcoi05zTDSKh6mFd+1k+Rhv3GPgs1g547luON9Rr8mmwG38Dyw7Iw68Y3Q211tbHRmBTfjNLkmlYYtTiuDlvTupGTnMPTe4hDbfjc0Tb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV5pup4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S4HcRU022992
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOCWk2D0zXdlqRt97flBwH+ovhY8VuJGcvABkqQ95gA=; b=pV5pup4Mmye4wiWE
	riA+ELf6VMimGnr6PEFmbK/OHkV1ZWSY5Kun6KqTs7rKlXdptgaUwrMm9R4MGSsD
	YglQ1pKMhE65oar/bDlKtdF1zpMe1u12/q+jtPo86kh4ilhFQ9tOA9rD+JD6ryxF
	tRV9AByl5oWC4+vErii1+75viy1DnJfU0cVWD6/0gymhgjn1SBuRFh44L/M1d5dD
	i5rLiuxirj+rOo145YOS1qC940wtVI8kMYO57FRg6hxqnSUktnsSLb98y8OTGT9f
	etOrwXHM1TfieNBB7Rlfchuh6oodLMjpR6uhKoIak69ESH1TKCP8ZSQf/C7MC5wl
	W1kj+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9myxwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254e0b4b85so35362415ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 03:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157743; x=1743762543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOCWk2D0zXdlqRt97flBwH+ovhY8VuJGcvABkqQ95gA=;
        b=Vk1oUSMcFhX3TwH71oiz45ZtQ/8B4Py50U7O62/g2TIX3DXE6nYbQo7h9kpLGKcMJA
         K8QQ+5Gd7x0wO/4n4/YGv3hrVHXnAPqN8dyOlMncpTtoVUMUCCtiSGWsNf1av66MrIhs
         D7T1PhGyqCNyPCTAe8oExkH1u1Wg7kRGWwyNZQi2CR3hPVlJjeHg1E5yBQJGmezfau2P
         zwFsLy5SzzDA056z1zmAbgersUomcS37x8WPxtagGodjc9YJLrbjAmsDuLXSiSMCytsf
         27/geXehbFM1wE9vBklCw0RezmfM63z0zWEk46p9bgnFh+hwB/lzHNI9Vd7ZTy4EgtnS
         G/CQ==
X-Gm-Message-State: AOJu0YzPYkaEIPA8dUK8I6dDzrwuAs69tpwecqc+M4SalH9abPA28XGz
	dGQCzdWsvmpOFGpgK+qv2CzzdO/0/1aQjtp8fe9u0HTUDMKIusgktj8gEUmKTzWgLICJbIk8gr7
	KhonzCNdSbyXPiaQwEp/zBl3VAuNXaR/XCtC0/CwrzK0oRFd69c4f1QZiT4rK8P8Q
X-Gm-Gg: ASbGncuvyMTQrWQwIGCywO4txKQ/aV70XyBaouHhJfjux+tLCuQDrNje4ZduSsk8PXO
	6d6zSVLnMBy8Atjp96/NokvsDZXdCCoVkAGr7tK3IsfiBW4XJbQGkT+RoWK6mrKkNCnF37QHafU
	K0tsBEkZwrP97dEaFtg7Y7hSucMvM2pnovSOQSyKw3oXIzcTGJxwjjC7zHqlg4mYdCLaEste2cM
	8tSZiXJglJob8RJWxb6PeHxQ7Yq2OLY2d58EeMnBWaKZDHnshCjKqXh+uyo+rr2rxAms4DIYvsP
	Dq1AaCdmAEjpZbNvcYtaT9w+nRxl0htZTJCKxZcbj1svqoMsG/s=
X-Received: by 2002:a17:902:d507:b0:224:24d3:60fb with SMTP id d9443c01a7336-22921cca739mr35292235ad.10.1743157742723;
        Fri, 28 Mar 2025 03:29:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEOrLiW9qS/wbDey08G3CBHaVs8TzgU0Gb0MlZV7nWK/tlufZpQxHUCI59tzGgvJMc0Iw7Aw==
X-Received: by 2002:a17:902:d507:b0:224:24d3:60fb with SMTP id d9443c01a7336-22921cca739mr35291635ad.10.1743157742178;
        Fri, 28 Mar 2025 03:29:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:29:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 15:58:29 +0530
Subject: [PATCH v9 1/5] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-preset_v6-v9-1-22cfa0490518@oss.qualcomm.com>
References: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
In-Reply-To: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=1925;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3xtlvs1vbdz9Lx9DTGncf10UyrhBPWHbtrA9J6tHahs=;
 b=8wAQ+IxIsnfUS5TRRIA0pmea3c7X5AZ8Oj0Mp4K7+EVTYxybUsChyeiQcrS+yhnAGbNhnhVHi
 0rux6SvyIIYDmTWBwvU9bE6kNh5AJI0y6NhEwXLGTtAleVn7wBQ4lAv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e679f0 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Nj6457e6X_8c4JUAfzVJ7c6fZhYE0Jps
X-Proofpoint-ORIG-GUID: Nj6457e6X_8c4JUAfzVJ7c6fZhYE0Jps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280071

Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
rates used in lane equalization procedure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146
---
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff..9f14dd13d02e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3209,6 +3209,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie3_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
+						     0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+
 			operating-points-v2 = <&pcie3_opp_table>;
 
 			status = "disabled";
@@ -3411,6 +3415,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
 			status = "disabled";
 		};
 
@@ -3538,6 +3545,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie5_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 		};
 
@@ -3662,6 +3671,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {

-- 
2.34.1


