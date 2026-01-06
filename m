Return-Path: <linux-arm-msm+bounces-87651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D652BCF76C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4243230D2D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E0C30C60E;
	Tue,  6 Jan 2026 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrvMEVvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPvkDFHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E430DD3A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690288; cv=none; b=ZyvcHpxOdvkROurIKjDndr+dS2nEIF7JERhEhVgyNxIEdiLxpZlLPPqrGBdg7+58HBnhU/KerdoauAsDAoPNj4EzvPbNkXuUMh77UOt1vi7WMCMACxF8CMzjAF9DsUMNmCPEsht4RbQIWDuyzXgbwe1ADSKWA/LkmQLZ/f3a+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690288; c=relaxed/simple;
	bh=uqFW8puCO0fUaXKLgdQhR3LwSpiQJfvZ21tQNaUkeLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfCsLVG2GaZ8AAtJ+chW2+U+4CoPNHHhgSEfuSK2saA3Rp+sFq0Rs/aAeU36/Jir06gl0p3a04t0yzLUDPhie3/TpSa0iF16IOwCejJgbf+JWl6bACpTlNCOo7eVciwnqvlB3OvYL9IarLfo2q8W36LZ1rlJb8hJOPHqotJA/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrvMEVvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPvkDFHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QGEx3052947
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMjYCueNFemsZYYgy413EWXcSrM+NfgEUoma/TD3MWc=; b=nrvMEVvZmeXeRyX0
	7GC6JuXsdbv91Xtgp6wR3dFfP8xscwbf52vEoXLwB2NF1Ku3taLqxynRhMhc5fSS
	J2yINJCiHLN++vcq8I5vgYrX3gunc9otdqEZ4Wmc4XsBC2RyHQ/ezuwBEKdydOGk
	FCp3ipWEyE6d8QfDtjznQGfr5JkFGAk1SnXLde//kFQYU6UZ034JH4lwdmpQBoy2
	nmuowgkM+69914R/qHTf+4nwd7F2xQZugsRHe79ht4Xi9FI2Ha3LNSGXNx+4P5pL
	cc8HT5gVBvsfAcrBqMsowVZZKh1ONZ1QVrK6a9BTXB6tDqd5AunFBixss1+12flp
	Pn4tPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9sf5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:04:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so190532385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690285; x=1768295085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMjYCueNFemsZYYgy413EWXcSrM+NfgEUoma/TD3MWc=;
        b=HPvkDFHTFCa3juk0tFNGMVybPjbb4Fa/Uw/EAsvrEOX3bwOjuV8W5pGRz1PTegMBhq
         YuLLbR3txZ9qE1Io4IUrRX7Se5etDrzbi2h/gkxopupvPezdAQ1Hxq42m2ECXLHSmYl2
         sVnS+ct6M7Q/PTCqG59aofL78dbuMpdc4V2x1/218ls6QZ2PWRX5scQrvlF87Zq2umwl
         /pnTm1sBuXYlZM2SjMVeu4g8wIKfJUbA9Bf2SjQHbm/egVViv7o5nhyERZ8mHO15Xhco
         KPLhc6rSbNe5g2hRC5vb8gG3qnv3CbmKdD0UaEhrttItI9IHP8/jlmJ06fx0JB4dMNYi
         U6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690285; x=1768295085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vMjYCueNFemsZYYgy413EWXcSrM+NfgEUoma/TD3MWc=;
        b=rhc5VwwdZm0x5/cxrCejzj0sTf3RlLoo2po2doFitaTr9VrqjkLXzMrFYuf//4znwi
         L83MCX5v042rkGWHqB4RI72uAtevqaghEpPceEEzOD3ru4ilyMP+OPqjC4hDnH8dDj4Z
         jLkb+mkK944cxshZo+Y1fQq5XHVRoJtw8rOt+ofeIxbY4sMWhq8bRaJ1Jn8SWt3SzMTy
         Vl2+tMU9nJbsgJL/rAMaQMezoXkeQYFqMaqeMso0S/X5Nv3O7p7BGFgI0/kUoWhoR6ny
         aeoIX217KnE0aKMoeNT/wsQOriS+0JgaDSs1hY8ZIEalhNAqvsmaPGxE0UAEMAJiBQKN
         F7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/sIX8IvPeNFvsWBfo86nV2wsE3kdKRwjzyn6O4iVIcmEmR5FfTn8CX+pSjuoeaEbnKCjHwkhsf1aqYB1R@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYY4FXO0cDJDUHsFH+J4+R9H7QRijH/iSOKcjxNXRlnRRTCNs
	RH7zRMoG8/iJgfCGm160Juy8bLtw3OQ9wSB2qPzrE9hy3Q1wcaDjkZ9KMKF344sLLTgjhrkU3Zp
	gLOjZhs5YGAa/a/l7opRnv+TkZHkZkkOTATb8VX7uUFuCOPRgHkmagTJpkicDdHec/Y9a
X-Gm-Gg: AY/fxX5sFNAE+EhwdkvNsneTUrR+LNaCFqFiReeVN0P/OlP/EGqhbA+1JyVMAINdp15
	TEGdWoRJnesC1LCZnr4plYaUhZ4WIOcw9HHmo0ZfEv6qkbeVEBgV4KVPG49Ret2xB4Rr2/jsvB2
	PTWdIe0r1IMsfRlQNSKTc1nWSdGYDRIuDPGyVWLhNCe7/VtmDpxnB59IVsqeUBvJoNdqT13LLZG
	LK/FHnaMAPFOxp9epdnHy1XJFRQkn8UvCQsjuCmt8ktBYJZJDxCeRMQmBzI1kmsxJmkn0spTVmy
	C5Br3OSuij+CyBtq664CWgN8raRXgrEo44e6IhAP5aYKwj6rFMictz/OnHVAmxw1AahWIekENBI
	I8Ya7WID3JvpWLjSI8te359g1LSdBAXCuK/Q6pb9nn5UlBLSUwC/fHtTKYrxat9Y1PGpeMOiNsN
	R3
X-Received: by 2002:a05:620a:bc6:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8c37eb4c572mr307820385a.33.1767690285008;
        Tue, 06 Jan 2026 01:04:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO2vVmcmA1kzoyToPbJj4mzxCeunHud+/7B9m4HzzAP75SxP2QWLREZwAgFtlSyPzmf/LG3Q==
X-Received: by 2002:a05:620a:bc6:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8c37eb4c572mr307817585a.33.1767690284515;
        Tue, 06 Jan 2026 01:04:44 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53113fsm134368185a.41.2026.01.06.01.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:04:44 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:04:18 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150-camss-v3-3-d1d5c4d02b0b@oss.qualcomm.com>
References: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767690260; l=6653;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=uqFW8puCO0fUaXKLgdQhR3LwSpiQJfvZ21tQNaUkeLE=;
 b=WJR4Fft1zkY7INI28MoVl5mqpTtUCkdL2gUw3YznumgtBjD46nWEgLO5mWyIl+2fHLKuQJHKD
 wCSER48/4YOByMbV0YAuh2eq4gUSyxm5mlpGtv9PZ8umelGf6DTXRi1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 3VruBQcWg30JKVEiklL301IwwDCQ-PMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfX/M+4wWxvgAZd
 Sfvm9RZqvZTkjLQYIFc4XMIVslShjRmkEfJZpovLKPbJEkp85CjGhmqMxPoRaNgMuNhrhlHtsyo
 R8pW6zaquYYqPBwJslYG6gLe8hnfLxWjM0GXMv1bxiBNMwbv5jcMuN49ZDnRPO6U+nCgjiL5IIz
 ogp3W7dPLZVHMw9k8oqTmQbe+lFASFdQ5ScwuGREqJHNJRZMInVpBg+JYit0ZK3aE0wpvD72AMC
 j3sp4hy9zGzNdsC3zAGpn+5OPcKCuA5/tS+Jwg4BO0YvK8c46K2udXZ/XdqZAVtILNyQh6N+7hx
 fTTEos5FdMIwgmu/W4aj3aoBzZ46uOKg+m1TndoiJcQ+KkRES+UAQbnzUh2gosC2c4LbkDiF/4W
 kPCrnPEjyHH2u4QAglS00HXbSiijT5Pj/aq8Lao6fEW/VbuBJLKVOaM6EQxDyLN+KQfaFK+z7qc
 FR6kt2ZgmXZkUXhaPRQ==
X-Proofpoint-GUID: 3VruBQcWg30JKVEiklL301IwwDCQ-PMi
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695cd02d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e3136229f9015d49e2be22f6b28f1e842f4..6368e0a2502cf41acee0783dcd2950099a29f40b 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3785,6 +3785,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


