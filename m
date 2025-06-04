Return-Path: <linux-arm-msm+bounces-60180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68264ACD7EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20928178536
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 06:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A34C22A819;
	Wed,  4 Jun 2025 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+DW+7Nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC041F4CB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018980; cv=none; b=VFAz8uIi9duHvt+hmjiXtUXPRIWFYmDBqAtGPj9TsYZ54KNnxhzMMU+K/J3jRl7l4aiCcQIFy6+ljwbFTYApME2TsUHcvHloPZqr5TtTJG7YOsMhMihUnqa9faUi1NQNmi/I6ij7ppg2aGjma0y6LvrSgcd6Zq2gJbWubwDJ/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018980; c=relaxed/simple;
	bh=E1iCTcsS77v3G62P/uVyBrWR5kONQvXzXySre5an/lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdc9CZZuzEof2/tQAXj/e5mqYiKcLew+EPQfTELUVAKiLEZA4Cp1kTJjEFUdpsjZRuBc23a6/zHWpwqQpD6AuRuOcvqy5+sQsm1SZi1mGO4Mg/utd/rcEhhSzrUwQevoZMUHZYxosjjSEjwKZ//y2qfxcU4qdPRSpC7bePDXKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+DW+7Nf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540b1o4024322
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 06:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMz4Fnkw42dvFNGDnmgQxE1WfqY819g/Fp920zyfuTA=; b=A+DW+7NfbnOVrecX
	Q/3y9hyWuoVEq1tSMIwYUgtRV83bZz7TCEntCV4GgO/zu6ko+wofK1f80tw8SBQF
	H28UK8Xoi78nzTw6yyJxLddZTrTneDGDFcR6EIZy/JMgl8seqQaFVLYY1isgBiFH
	hDaPqNOCoh4OefL4k77lmszkc3qdTVfIVBXCXqAPVzeYjwpw5AV9vWJv7sULrakO
	ftFiufoRx6clDrHMSFQvY8AlC6y9yLBmqaO/qr9wdsyTQ/oAwOu6zmqXztsnla0D
	1n1uXsySqxkjzluwvUJXq+zsWXFAHKomv+IrOsbezlrZWITO0WhCUo0icglZtiM+
	2Z6iMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wapu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:36:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311d670ad35so5950877a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 23:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018976; x=1749623776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMz4Fnkw42dvFNGDnmgQxE1WfqY819g/Fp920zyfuTA=;
        b=D/+XXc/cPFVzuy/Xs3T78hgjuIGuGuABzBTqgNEYDnlAveQ+yjnPm2vmKqUVCEI/P5
         SAnZzKj5a45GTKSKWPTqeENaheBfevg0eaQiUqIJxnYFMGTBx1q8IjUImxs2He8JOU5A
         iQXp8NKdkniILXI3UilSWTE0nyiEKCXp58gwkxraqbSuinM5hfioSw0NQno3ZtDSH2Pr
         2B73K6FgiNwxQznhIsqNVzrAnXp/+5mbUxSYdlCXbhrLNg6aHLmcKMbN8hvE0w+97tzS
         iKbYLotsxUP2u4mnH2i9xQWn1duceMqGmAIPpm7XqdygT3pRx8HohjEWPbRhoKQj6CLY
         qpYA==
X-Forwarded-Encrypted: i=1; AJvYcCU2ygqg5Nk8X0jkYoN2b3kInR1dE1djEv9qUSdYk567YbzvGlGOeAEiCkagDSkPCh0yIs9rNc1KSSZY+BCm@vger.kernel.org
X-Gm-Message-State: AOJu0YyZA6WKenICAHeFvEVi1VICfz1eUlhJSKeSjDtrNaAgIZjwY1qz
	P0/66jF2WHK47rlcvgOc876xipYizedCEKMvVyKSgzh/iUNaqrFP/NXYEbaYjFBrLTHdelqYMKR
	QDaI3nHgL6Ki0Q2pTBIW2R5GJsYy0xygTw52iAZOGhhxGOwP4CToYzANDkbx17gZuSRnv
X-Gm-Gg: ASbGnct1HTOdDKEn4nxTO/bpNgNQDRTqIuiE/+SJ1hRu1HXLelU3FvazUupRPq1aah3
	gdEpLbdz0aqUNcohWVhjGHF7D5X6eWKCxuNH1uk33tKyws6Z7p3xKoeI/hulo/2q2SDkngaPT6V
	iG3XIBa8O1XmqNvBG3vKNIAZyURZLaOt1nQc1hBIXuRl/8Kiuo/I6NuNkK7rI6wTwAE837W7V+v
	bRm+lSJALFRLuIfYHmLIe+GxuDG+94wits77q3E6/hQHl49F+Hf51Ubbet6AF/XoG5DQQ5g6gZ3
	yu/Ral9tLml8xXA612XWaRMCsfNAgFnyprp2
X-Received: by 2002:a17:90b:3d90:b0:311:d670:a10d with SMTP id 98e67ed59e1d1-3130cdad83fmr2116092a91.26.1749018976297;
        Tue, 03 Jun 2025 23:36:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErugzH1I0kOV1ZKQianUQa1udSChg3Br+Vd6Gcvz1HCaUItCnG3yPgl2RgODUZkyEd/0WlHw==
X-Received: by 2002:a17:90b:3d90:b0:311:d670:a10d with SMTP id 98e67ed59e1d1-3130cdad83fmr2116074a91.26.1749018975912;
        Tue, 03 Jun 2025 23:36:15 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c298esm8286693a91.15.2025.06.03.23.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:36:15 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Wed, 04 Jun 2025 12:05:58 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-update_phy-v4-2-d04b12bb89f2@quicinc.com>
References: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
In-Reply-To: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749018959; l=1245;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=LUKDegSuWnJr6hX0g+GfZVrGfuVOoWm4/cMbstjOQQ4=;
 b=ga9wKHPtEQhKKr1XnSo5DF/fyNhWYMWOOB+cY7IY7PY9EAcbVbRqkScCf9ZdnY/CTgyarhQyN
 Ou4mVQc4FvhB+agnjJWbXJump6NS+JbgDG+AzaahV89xnBb5zvNioYF
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: QNjdmlBDItBWbrszfroYZVsAd0Kjflxs
X-Proofpoint-GUID: QNjdmlBDItBWbrszfroYZVsAd0Kjflxs
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=683fe961 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=A2jF9ndpTPISZJbatkMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1NSBTYWx0ZWRfX9fL/1CkCojyZ
 C+heDdtKFFW6EEKhlk0PWLwimcaCd/f1p7HaBO6nrNYSDYeSE67RDVQwBVVLt5POhV5Ohu5zeQg
 ZgJSkkg3wFXOVvTdHLPdv6YumGEM18VWnqwLOeyTBpihua0IWS+GDRk73olWnjq1cL4yhkAFOP8
 eQ229uEXO0W2sufQkSQBPDLsxCPIydnTWxQK3L0lbamhvoKfYKEaSMuvIzVoTGrZ9GmNkqWTleh
 3lr0MjX5JvbRehBd48u2aIg/fbmnQcSu5MmXOBsr17mMZ0l7nopVl1r06S1Hg56hxqxmbY444zd
 wn24jVn1YJ5CkZ9onmbRBb4hzdJhq4EFTQiIYqpZTPgIyQ+Kr4SniLtgQtGRmDKi+yfV79Ri1tE
 t654qJUJR3HQIFrhUDqG0IyuSYDjozlP/rXnUvoGCLCooskXmuY1JwOMOGprM7duS2al/1EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=891 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040055

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

The maximum link speed was previously restricted to Gen3 due to the
absence of Gen4 equalization support in the driver.

As Gen4 equalization is already supported by the PCIe controller
driver, remove the max-link-speed property.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
 		power-domains = <&gcc PCIE_0_GDSC>;
 		phys = <&pcie0_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <2>;
 		linux,pci-domain = <0>;
 
@@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
 		power-domains = <&gcc PCIE_1_GDSC>;
 		phys = <&pcie1_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <4>;
 		linux,pci-domain = <1>;
 

-- 
2.25.1


