Return-Path: <linux-arm-msm+bounces-63965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E404AFC224
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068784A6CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B758F21CA10;
	Tue,  8 Jul 2025 05:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFPJ3RUE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF5221B9DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751953168; cv=none; b=jTZHcAny/esZFz9N0ITxTJEiy0TR8Ovh33uSCtKqDTByfCvjFLWxE90Bd26w4el5m3LTQS0oHi8bgXcVLaDMxeZuOv+H1d9+3w0KVTjrQCrw3uC9bEywfCHG4HfQeuNlBjr0RrKPD4SFMvUsD4wVgSJsMWOler4ctqgZWFLJ394=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751953168; c=relaxed/simple;
	bh=lT5PB7dXwIIXFO0i8eyvOSJB9GAulplW7fWVdwUDmgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuQOesOXcaAEh4qY2tOxD/vdUnTD5KR8iMCmiLl7JRTaYGKLNRzsbshggP1YHTmLe/kS4b8C7MedO4NUZ/Lbr0oZrgDk4BJfyxRisB1zkdEWkatyaZKe1dHxPGdQEYgS6rDrpSgZSspKwAT9x17y3RV7vYD32Y5ptROU0e4ZQvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFPJ3RUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567LYCgN028001
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPfLV9M00qAl9d8R2iZHb1VLVS8KvkSc9PWuCfqic0M=; b=nFPJ3RUEX5ODeghr
	IglHjO70DUVRFBOWRxhYBVsK39hLT2wgPFfWODrbCoXI/cTseCQ0PbBvkEeSdskf
	f26x5S0T/M0TrdAZuFsXuZXRllfEpqOfcZvfWLpBTWG5Da0yVMXc7QA4JWkPxV7S
	qYA/pj6lXHelxgmvwu2DVvL6WQY/57tFVcOW7brtwiFUOiXqS7AY0D4FF7U/pg4V
	lXhQchHtDJVmwL6H33fbAW57Ft5m7i2jKo1ZhuT4z9fZOkXYEyn2PCw+wyAtisW/
	W0jF2UpQWXBDgZFGVhOTRRLQL8RxvGrII//89nJ0H6RHNUAoLjX0N3nE/UEaDoiY
	ohkDPA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b349u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:39:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74d12fa4619so1450323b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751953164; x=1752557964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPfLV9M00qAl9d8R2iZHb1VLVS8KvkSc9PWuCfqic0M=;
        b=PlGNwtOYDRpvhL2mHz7puXwyFJCUyoljsCTrYm/zFwqlbksu10ctEaehNKDe3c5vr1
         D/BLkp8M6IdNdd990pG0t+dxN6LSxNxRCfFhuxmHVJVZeAGCuZx5mW4gjQ6u5ywBPEfN
         G4urW2I/gPlZiaREVRVdkuTUCYDCL3PHMlDbgIMHDml+LIz0jCS9kTrNZMixXdg7NiXp
         yUcIZF7PMweUJ5kBDKYgolEUvg1pEKlRjuFEjFXX1kLxZoGFx27NIElReEdW7vZW06gT
         hz0rzmONEgdVb1KThlB3KGBQUmsW3Nvg8cqFvYhANq/DojY+Tm3rvnnFmHWyxsYSr3fz
         OqEQ==
X-Gm-Message-State: AOJu0YwHQHS+3gi86dUxqo/JGRkHLsqvr4OLmMU0zBp/RoPrqpDuioFt
	D3Le/ja1zf0FawEaGo7J+xVXSUIZaEd4WNAMmcFSs/v5UFiN/4Nt8eeNu5N/Ovu106Ihf4Z5MPa
	SuZwrr/aYn/y3A5fnb1FX2scYaWWOuqfXbRILhOnVeTfwrKC8YGqyjSN4N9aHEnP59qoN
X-Gm-Gg: ASbGncuQ+DQEhjwaAGzvEqc2md8InUpHOTJZoOUxI4qzV31zE/P2DXgDb+yOQwhGmV1
	NYXXdxVNckRDczmpoRPGSj9Ub7IzaFkfWoaSyDnwcAuYhqJhBn+u2qe7rt+4X7bdKnqV9KxJwFi
	c98XieWfrgv+0vO5XjPbO6tu5OXJMuJbWX9gvqzlNmyhyAVOMLiPPxxVuVezgBrUeB+wIiLkHQJ
	tfe19OwR150OEyB04OvNgX5CXPkr9N8CQkpWZ7Dd9YZgzLcssRWsgNnAe/X1YBAhKJ0BL2FtnVT
	9AK3dVGZGjg67jyRRvhIycFu6vQ99NucwjABAbXHrerckYYmipWO7jGzmBn6cTqJzwc0uQgV/3M
	l9zmlYRsUcliJ7jBEFFvPyqJwd8i3Ak/QUVBvscJi4rAMCN6/VT1ijKCmww==
X-Received: by 2002:a05:6a21:6d82:b0:220:631c:e090 with SMTP id adf61e73a8af0-22b18713b55mr4540363637.0.1751953164513;
        Mon, 07 Jul 2025 22:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGChGw6sNcWe/JFiWUOFUfXXFqcpcUlbdGkgUolO6ruHnb30E2eS0cJZ1gNhCedjJUFmEWLRw==
X-Received: by 2002:a05:6a21:6d82:b0:220:631c:e090 with SMTP id adf61e73a8af0-22b18713b55mr4540326637.0.1751953164125;
        Mon, 07 Jul 2025 22:39:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450db7sm10531829a12.4.2025.07.07.22.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:39:23 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Jul 2025 11:09:12 +0530
Subject: [PATCH v2 2/6] arm64: dts: qcom: ipq8074: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imem-v2-2-692eb92b228e@oss.qualcomm.com>
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751953154; l=1247;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=lT5PB7dXwIIXFO0i8eyvOSJB9GAulplW7fWVdwUDmgo=;
 b=niksS5LQJ6TwnbzorWTwOgTbjlIOgt26OBcGHXsy3FMhrYCRiusb98n9UTlBGethU2GgMq/aW
 BZKDOD19mOdCfD+bVU+o0qxMGxEo7NDyzXqJ744lgepq3zZcealUPaz
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MiBTYWx0ZWRfX5+AuSMGNFIxK
 6k306PBlYOPCpZ4bl8JEb2jcdF472D1nJgFgj+p+g9iKgJPi7pbR1cZSepSxleza48MAoqgOaC+
 Lk0+s25Zbd/GUGHK/tM47VefdsBRHVRUEtYIN0aPcLjC9zJ57zbkEiYhPM/awD5L+iJJ6wy6Zp4
 u9socVSp/76xnBPb8M4zkC6rAS4QWuIJS1kmOfXeh5U2MvJb8Tc6pyKl4PsGkqQhxt4N81etphM
 xvaOdlFvePBETDgfeIaJfiktKT+E5hfPEHYmFEBv1la26/Fy6hn1EdpO+PN3k0bAzTBNqOWforU
 KHkyGLwbjFOhAbeIdMeunQ4UAMdJivGU9YgLZBPmnj6YCjt2rCYlidLZAcE8prXk/pvmXOOuujZ
 ljpa+UleC8wKZEN7k7pnOF2wS4iwvY/+1dPUNE+R0OBMyct+FhdFxfjGYtniDMWZyRwsANd3
X-Proofpoint-ORIG-GUID: GvnCDPBV0b8EgEAaConKy6NQTaTH2Nct
X-Proofpoint-GUID: GvnCDPBV0b8EgEAaConKy6NQTaTH2Nct
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686caf0d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iL0243cPoFzEVPe9DKIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=789 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080042

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 24KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Rounded off the size to 0x6000 (Konrad)
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index fffb47ec244899cf45984adbe8c4f9820bef5c5f..2ba07a02c222958b924c5bc178ac67f955088f7a 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -625,6 +625,15 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq8074-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x6000>;
+			ranges = <0 0x08600000 0x6000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb_0: usb@8af8800 {
 			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


