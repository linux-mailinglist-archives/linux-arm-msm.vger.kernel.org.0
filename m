Return-Path: <linux-arm-msm+bounces-63363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8AAF118C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA2537ADCF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1B8262D0B;
	Wed,  2 Jul 2025 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQEIm0Ig"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3680261388
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451490; cv=none; b=LLtYb5iMK4bUpGAmnHHVSzqSUE7h9GrYBP8v20GdPf5BOm3PDevl/ATFhwonbO8QT4Ugi68CaUjuCejcl0Q3a9rQe76wYQ2YT4Hpx1RfgKh7HryruzNlH6HWIz+joV1P/7fG7J2iyB4veLsv4sp0ZOYhxRUf9wA+IWQRiRg+aUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451490; c=relaxed/simple;
	bh=wQhsflpGUJsF+aNy/iW2kaaJ5se0e5REu9ZJGt4Bxr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEi9aAp7SElaIAvRAQs0132gyoPmFBw9oIZDnGS1ymfXYzaI8+r2d0TuyOwteb0K/4ip5O1gWXY7p9ypnXEASa5V36A51K7G6xIIzajNuKUCMEcqbYstEW0tHvywop4F0DSWYLxIbRpY0CdyuPhH395uYEwCmRcyqo0vxNImEL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQEIm0Ig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5629iHEF021088
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTRlJy5AluWIif9amlNmxw6fYDtyppKSnmMprtqf4AU=; b=GQEIm0IgtuBprJEQ
	JFmCsA8OA0XaxjzaT/6iKGDQ85eDaG2r/W65EbWw4SD1nrFIyDnNb7zqk+K1wVWs
	tVqUL37HqmtJON9+xL0YuhskbsUq+yv/0hP611N/9tksMNj44CgoTctxOFaRlfOv
	ZsDJo5VB7Q/d4jOA897+gkU6elWRuwfauXIuiw3wZAUXhhzQvNRKmqnaYwPYebch
	+oBLPSBkoWpKWNeOTB/j4DaS/FdJZMruuVTaRaf4AaccMRgueE8EXetnW/qDkVy6
	h97Zl2R/w3PZpyyItp7NqC7ZnEG/qh+l8ASLaNpe5U+JpNG/mYy2Yd7x5AkUX0wy
	iCvxcQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2w6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:18:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74ad608d60aso4037649b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451486; x=1752056286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTRlJy5AluWIif9amlNmxw6fYDtyppKSnmMprtqf4AU=;
        b=lUsPfrw9/uTfCWoUyl3onz/dW/VFBoTJrLP+v8j4aD5kbjNue5razE1F3x8nKEmpnC
         /w3ti6Z6C+3QzrTURcuoWo6QETQaWzttt7+OauL6IHIUCGSUvRiUxNAV72zy7WmvI/Gd
         x4rebcCBQVu45i8+0X5Vhiw+poLym2mDm/sHxc62N/ctdtcJdwUYwcr7jcWVZX57M7ew
         bkDmZnFYCpTgyR4JPJGaY76jk2jJDPBQn4STuzktAsFOkzuQcV/Y1JTP+fnmFP+r/wCw
         ZoPSXIDvtmqxt+QZLalpeGruoAjfVw9U4DEhRHQFuifx6ZToWMxQePcpycoJkiN+SECE
         0b1w==
X-Gm-Message-State: AOJu0YwePK8eKtUsmLk5iVAYY4lGDxbxIJpD+j+uJWC+fn6AFkwMpD54
	CF+Axd8qqzQBTup/tPrwKHikgOjWCb/+nSNOPnfDnNGZ187swS5OFlW40P2p9aOk8wB00BtFZek
	Ani7EQXaL0ETLKBzmvS5iDlNpPeilbRCrx8L6fL2O5MoMvYa87msBG/yx4Ti9SBKdQssu
X-Gm-Gg: ASbGnctIXvlU80GTWmqVajNYF+SvbVG2Z8I4KZJRxNVq6MA9J2l9+zy+pObZtyX4fSR
	BncwWr50JQf+NOXIR34w8TNa4UyDGWwt4Wc7hnUADAdNAadY8mJS9fcyN5is9eRFCknpBbj/wkC
	VPT8nns/izey1qtUFzzqZYm74z5n/JFq+1ApcUwi2mCYRlAbFNz1M1gT3id5UHAEmJ4Zorgws5m
	MHal2wD4M7AGHGVjWlktd1Tpd8USA98xjUp6zzFbyBnSXP90bxFYOAikJmVRg1d6dEtaMRvSCSc
	Mp8LWbku8tw1xOcfA6ODCpt+wWQdXJouUIfBf4EqRwglE0Ka1bcsq+QkMdmMvGpaMgXEPNIxAEB
	wMpAdB2fyKvtsZaAoFMvgcQxsJu5Cq7psdmnkD4Eu7qvLkGqZOVaTWzvibg==
X-Received: by 2002:a05:6a00:2e23:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-74b50ff2460mr2719925b3a.11.1751451486504;
        Wed, 02 Jul 2025 03:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMQEdvSXHqqhuaPgtstQB18HJ3z9tqef/wqhHRt/9fj8UJtu6zQxc7Ajq9lHSgUS46mwo1w==
X-Received: by 2002:a05:6a00:2e23:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-74b50ff2460mr2719897b3a.11.1751451486133;
        Wed, 02 Jul 2025 03:18:06 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:18:05 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:39 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-7-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1241;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wQhsflpGUJsF+aNy/iW2kaaJ5se0e5REu9ZJGt4Bxr4=;
 b=dlEJCwIp++OqsutI9yPrAT1bCt3t/bafD3CsMNbdS9MjMOUztfbCvJHjqTDengumkaXwyejs3
 SrB/oBcCpR4AVsG2FLFkPpnOAQfNpJwojGRJdukN6NKJexJ4ydDezYr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX2pueHrSGSAHV
 XVefK954CfDG8WoOUZGcGjDlvI9ZPrjKA0EI7GUeZE3L9nTA4+j1PGdONdH5NLj0IgyYzbYhrj+
 Gx1NeJW8RzBakJ2MYjkirZvcdo3JRl+5sz31FB1x1CS3VBf8OxbuORTysPmGE2ZGgUYi8cP2yWa
 5n2/QWX0bSSkGzbpXLJ1v2+46KdcOxOsKrLZOOkaX3s72FMzssmam5dZtpXHKf0kYgsH4BRzCUp
 12fkJt4VZWTQ2ur9mulg/FyUjMyIXF9FFDo52+ouN6L1wW0tmRmmYFSjOYqslIw8WrMgr8yPzDv
 xc1nLe4whPEQS85qS3GWFX+eAAwHWNQvMPCLeFKn8ERa9vTiH0bwjYZ8P4WVKqcvePQMlVOTR/R
 Y0UFrWXv/eCXEhtWTBsJ9BDM11ofoyHK8PX5AUtx6TfR4a4r00kcPS2RE1delqYRZvbVJjOo
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865075f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: aXITkrf6wI3myPTafu-TSi-RsGJup4QP
X-Proofpoint-GUID: aXITkrf6wI3myPTafu-TSi-RsGJup4QP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=827 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..7fdc003f210e5a69944b00361a16fbdf58f39801 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


