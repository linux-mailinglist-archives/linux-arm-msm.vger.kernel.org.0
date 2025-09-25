Return-Path: <linux-arm-msm+bounces-74955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B4B9DA9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 710A01883A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82B42EC097;
	Thu, 25 Sep 2025 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtBbMGOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367632EA15F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782022; cv=none; b=lSEWUW5qWtNat1Sn9EhwKuGW3as5fggfm1juauizRbIFZnNyeEjuyOS0s+wR2VORG76Is53LuLkR/Vr94Ji1Jt/3b2+RmK5lIIQ/OwZ+MTiqsyDPaLuepEMTDif/h80Zlp+CXUFsBqGgdw6q9fPdE+cS0k+J501hP5OnxYchu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782022; c=relaxed/simple;
	bh=D3joMpRcaeR3gLLXU5PCwDBHjh3jgbSRLlNslB9/hYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mmUCX107MaDBBexapPnN9BG19ZDUobw1I3iNl7GyYnE1A6S8PlT/VP5B91L0IPYftrpfTcLuMMXvx+jBBKJ2a9pJ+fNNyj9bgHeedcoXJHAuihDGV4rckV63mQZoYuY7orxoQI/orhTtwtz9ReG+LLjjKe7qolaXfxo6PIFOe9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtBbMGOI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aJ5Y027521
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4p33NgPxej04es67Nsx769+T5sIjjSqFb0zB/Kwm1+U=; b=mtBbMGOIfkJgAr9D
	haLftSO5c95Rgo9Op2MNtfZdUhDI906WbgxGjjP7fSwSyR5aCrv9IzavVGtgvkqo
	C0mhf5jkBKkXDH8H6Sa8rF+baFxfPgdg3vUZw2U/5039TMq1vZiVzrQm/VsgnBC5
	ixkgGm9ZrLTkdq82gRcurIgybL/J5/zrWZjN1CpTGOFJnF5f70b4BuM9Apd60dbx
	g299PER+d7dQZFORsctT7mWeX+/38lTsT8vISzTbZ0ed+fQ0k7rGg5XcucrNTmfC
	mjcOX/JIF50+X+0WZRRzx5HBemKYKnCAQeyOQF/1YCfk2U7NvkHfRjDHriB83iiE
	CxmDnQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup08uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b554fdd710bso430925a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782019; x=1759386819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p33NgPxej04es67Nsx769+T5sIjjSqFb0zB/Kwm1+U=;
        b=Sp+xF1YY3kYB8kZKgnFKGXXz5A0GfPEsMfUeVi4+oCq313bLR6wPDTcY8MJU+tOzwY
         8Lg7JgCxKFtaql87QHTvtMSRplmSPiy4WLySF8cpbfl4qsBw/oaJYdrZ3vMweMM85A7y
         PvWArmFmjIeyd+wCaCj7aEr/9yqgil9OvpjuNnsK7NjkH7w2ukvnrkMAcHxEl5g0405v
         dxcPNyKzOInIoQZihJbquMsB8sA+gQJ7t06PMTJCmlueLSiaGAyy7JFOT/51aOgc6J4T
         9Z3hXAlRRZBuIBKsTVeXX4kVLhyb05+ghNtrsW0F1rFTJKNiEG6xpmWrEzxM4I7yXxtB
         /1/Q==
X-Gm-Message-State: AOJu0YzDmbyaBHcAQiuxz9g1w8fRJwgelNt8HnLRwGBR0CUkvMZrXt/U
	L+mWFgZnIAtT4h4qtHL7ARSkgmn+yaMqfHC2H33PH8XZH5r3oC7xMS7kFuaiXm1el/9GXVufYP9
	QDFtrOSyp8kAUyHHfzNlyeaJJyJM7l4fn2VDkR0889iZAf2rUubFo/Hfr8Ro/PZh3dYqojUhpXy
	gs
X-Gm-Gg: ASbGnctQkwO8bZGyFGbhjwAh17PjcaJmm+mBvttYSZJvBc9UempyqTKP04AbbO4H/PU
	nPQulemmZCfuo+X2guAUguGSjxKyIozSwYc/Uea6eO28PhkCWWUtf4gn8qsYlT6x9wDdGRbgyox
	hsxzyN9WyhR+4Pt/aavhC1gFoNNWeiruIwSla3iWclJ3AadHudAEJC/8/sWftBqQwc+hoc7icIP
	sDAQAYT3uDE0VZ8UY/Zz3voqwx94u1bGC1haFv+s0rvsaWJ3atnmQk8Y5PLLxHbe0wNZebXWOX6
	50XnbYG5vhREVSPXqHe+ZBUYlLTA6m+9xAv6txQp3nqq5A90c/SEIikd1PIYHx/pEyjNvdXBzJa
	u5D0mYRlqT2wAg7PWtu2/AZzY4ug8UACEqgtAXBOJwaEHg55hu1FOp433RUnN
X-Received: by 2002:a17:903:37ce:b0:275:6dc5:a288 with SMTP id d9443c01a7336-27ed4a92b0emr22691025ad.45.1758782019554;
        Wed, 24 Sep 2025 23:33:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERBBtNIkEadVPyIyV0MU16VoZZQXNC0U1MspK5LG8JkNkvmuyDKOHUl6BMSuFkRok5bef9qQ==
X-Received: by 2002:a17:903:37ce:b0:275:6dc5:a288 with SMTP id d9443c01a7336-27ed4a92b0emr22690855ad.45.1758782019144;
        Wed, 24 Sep 2025 23:33:39 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:38 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:14 +0530
Subject: [PATCH 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-6-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e244 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nkVSH_9X_D7H38LkyDMA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX16p8hH3Er71M
 wl0ly0ACyFPHolkVRHKlz1QBfwljg+Pc7Oc0s877WZ4npq/C+cUsFDKgnEhpaC8b/DBKSJqCFoL
 LsHKXI0OSZY9I8K2NQzjndoN0075NU18g1uye6W9A7hFLIMtZO2OTyDJezIia3M1nrSf1sX+iIR
 70eYDOJ306sLs7yNkWJXKDw8fEi2sSnVOnHP7xQ0RSqrf7BI1bUEcVrtQI1uiCP0hsIWw5n3BOj
 XjOR4iw3SrRzLu5/z8WWliRQXTH7xoH5bbiGf8FgV0mXTXCJnpDAaAfE5X3Ry9B1mw4zBgt/5eH
 ABEq12Ld6q6six4gbeVBSRSIro0PaLZKN1CUuz6OX75n1ALhaEbMfy+602ERN2DH5s/ZbpgkO7O
 XzAebTEF
X-Proofpoint-GUID: YQncec3_ZXldrhBbg_RDpoADRsIZfN4H
X-Proofpoint-ORIG-GUID: YQncec3_ZXldrhBbg_RDpoADRsIZfN4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Enable pdp0 mailbox node on Glymur SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4065,6 +4065,14 @@ watchdog@17600000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pdp0_mbox: mailbox@17610000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			qcom,rx-chans = <0x7>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;

-- 
2.34.1


