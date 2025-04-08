Return-Path: <linux-arm-msm+bounces-53477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF82A7F8C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 10:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50BC83BCAF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 08:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1E5264F9E;
	Tue,  8 Apr 2025 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMh5kgzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB25264FB6
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102245; cv=none; b=j6Aiewvl3I4Rne9NLa6QCtJxxccrA4dl9uSiFioY/XnryUVo8dk7NrOGtXmwcIxNdaLiUEReGCuuXSAAhEnvDwLeDNbQSOjkSwaUsHVR5aOtNYLdbLZ1JAtpk8GRK7Ud/fEfUQHAWCdRZrvn3URu73IczxnbXB8E9cjgYeDNvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102245; c=relaxed/simple;
	bh=M8s7BxCEMIKIVssuhwE1Qzjds3ely+Ku4yT4Ok75T/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8dr/rejNHNSTi8B7grLh10HntWosVC4OeasXRpYkpzVu7P9PzpiemMIfA4SCgN3McXq5vDb6OV6cTJ/NQg144wod3zpWBCK5mKPYFpMXsw1Hz1Kdxf+x6jnqAmTH0RfE0O0lgXycFDRBkD7/fQ1ks7/XGEtqFRDcCLh8fe0DG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMh5kgzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GLnY008072
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	loRI/DG6BJeyA3QEAVzMFr8Q2pNYjDeHa+tYwjZmEhA=; b=pMh5kgzktKuV5Ks2
	2YBESMxwiyrnw4nR0xSN7RZfp6utSc5b9lkS44COySojAE41hoXMvPtFm3kammd8
	jY/B5gGQq4jdI0VsopqG+f5oW8hNX1Yvv+4nYfYAnVFPPKWxeskl8mw8N1Z3IYB9
	z+6OeppTyNUQ0hLYuOKcHCJKZ0Dl7b3x0XzRj3CR+Z+bGcv6G3x2c2N50d+HlJG9
	uCtnYnENRgColE+5eVtSNJ2n43yMhC1iUyIZ3qfIhAWG+MgDbf0NTxCS1BDtqalM
	/ct9qaTVicT0SP8d2HFrHbPfX3JlgKUmJ5AvAnPo/6vEpwhHXPmiDHBw0hULq3uv
	3XNd8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtay5ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 08:50:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3032f4ea8cfso5511478a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 01:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102224; x=1744707024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loRI/DG6BJeyA3QEAVzMFr8Q2pNYjDeHa+tYwjZmEhA=;
        b=hZo/4KJsr1TO/yLbWdYwLUrZ3gAm9jRvSySF0PcFM6pPxIJRJkK7O2RSwXaV5SH9ti
         PA1Ry20BbfjAmoxckTlsGowNOc+qlWcXOxS7L5XudfnxPhkcyx+vEdQ1Q4PVgG1HU/Bi
         AGn9Urwws0UtF4aVghCY3L8L96dw3xSUB12qHidnwxsb5+VJikAhMbH8RgsMiyUW5B4P
         bOAVu/G/AiOGMONr6Mu9Qt8s2iYTtANUdQbyoGAinSnlMod5iZEUlgnMycCdgW4mmDqI
         IDn3gVThJBU/6X2jCZHcympXYjGKxNM1SdozHiItt9bEOLI0PPjYOlOGyzqEmVxttC0C
         i5GQ==
X-Gm-Message-State: AOJu0YxkFmKd7qABuOcTZs+/459Ru9ZtW5S6SnsFGqFX8TRNlUjsbG/u
	HkW8Vl+xogY07sxfAcFcsnliinQATkacISUoEPIk7GGLoY3nl2ip2btzmzedEuBVXwRQ/amzfGh
	PVu8o6y8SoTtsF13WzGOjJ8k8/WyR99Ti3Ki4zRPDnvr6mUK9OtZAYf5xOpSFeox2
X-Gm-Gg: ASbGnctm//neCp/cnClNH5KHt1554xKv86xWnvaS1dZ+6EfztKaPQhvVhJU6l2D34J1
	YQI4FW5BlzhFg4qTapV01ugr09YsSoS4CPKOVGpN+Ic0CI4uVX16GWM2NnwULVk5b9KltO7S7x8
	t3ra2KO6sUln+11Ty0lh03kRB3sazUUeDbcETahvS9Fnz3CMLLzJd366PudnnwqUMolsdTkeJXs
	pmEFtbaq4U/vtMberIb7E1bAqJMEN6JC3v/V21mOVVyU8aMUqLoFJrcTzp5xXAeAaRKgqM3QoN3
	dpAaeiTdaJlwRSIsZN7frfTLfRMGFAyUHVBH5tsrhbGzD+XP64ysMuC4/KLP0pA6qo0QZrQrcwV
	fMhlqI+XbBorxSsyS7hdIvtxcDtSkSMlBe7QbMHby8bs2qvtoP3I=
X-Received: by 2002:a17:90b:254d:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-306a48a6878mr19952899a91.21.1744102224158;
        Tue, 08 Apr 2025 01:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOwLSckL+yWdaN2uT8q2dSYvVISiMLUMwmKOZP5A/vUS1nZ9ejcw1TqflVkrhpjEqV/veqig==
X-Received: by 2002:a17:90b:254d:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-306a48a6878mr19952879a91.21.1744102223831;
        Tue, 08 Apr 2025 01:50:23 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:23 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:56 +0530
Subject: [PATCH RFC 6/6] arm64: dts: qcom: ipq5424: add node for the
 restart reason information
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-6-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=873;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=M8s7BxCEMIKIVssuhwE1Qzjds3ely+Ku4yT4Ok75T/I=;
 b=f8fhhU7k1xmVdNeYHDyzwFQAKC3YeDSuh8ItfvAVxu80upvicUEB4pbPW2s1FggobjsQtzrWV
 oe9GPtl/D1DBBF6a4pqG7f6XHIFt3k2MVzMl9mR1RHAp2R291G5zKfq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: YUPyz2QLOpfMcirOVtDPPxZfGQ7HgI9A
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f4e363 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=-3m3cBowUQCSrRBqnYEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YUPyz2QLOpfMcirOVtDPPxZfGQ7HgI9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=859 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080063

Add a child node to the IMEM region to capture the system restart reason
in Qualcomm IPQ SoCs. This information is populated by the WDT driver via
bootstatus sysfs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index a772736f314f46d11c473160c522af4edeb900b7..d399ae506748b22c1dc653d357c6fd071dd67f04 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -493,6 +493,11 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart-reason@7b0 {
+				compatible = "qcom,restart-reason-info";
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


