Return-Path: <linux-arm-msm+bounces-54901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7456A958CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 00:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8159E7A3F16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 22:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADAA221FB9;
	Mon, 21 Apr 2025 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inqe26SM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42274221FA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272847; cv=none; b=QFhADkLz7ZUBEE6L/bDJ+PzXK7VlMCN3R/EqaT0WTqfLJj8zJWp5hMA00MamaeyMt83cEZga2Psyls+qeB0ryaAoqTirHooYR79MY0XjBPewKwS/hV3+TNJfml3Bx6+YgLD/BhODtW0WneZN9/kqxIvOyWQi7VIY6y12q7BUa14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272847; c=relaxed/simple;
	bh=V+if1JLkseIXHxqMs/xUBPBndUeGFuwmXk5nZsv0vMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acT0LMawGO34CUgie48fEydDI6a+Cw3kQ7zvLrfFayFS+UfVdt3cX8Jiv2RPLvMeL4YyB2Di1J3gw9BdnFcsNfMCBROzgvXK900f6SNm5fuUE0uwkX9ZX6Ihqm8G2iKiamMfWJCpJR94aX2t2BuIUR69VZ0o5WyK7DNI7A7eoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inqe26SM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3mGf021010
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=; b=inqe26SMWzgk+olk
	8pb1BlcpihFC1gP192aJ1bTHekvehUB5atwg8oPVJHx45bycmq//3/05qtgYt5sj
	sqod74pnbPzZnGqQ1Tu4++7hglC9JaEi9Ncda4LPdGgPlqFdutsa+wPr3ZHOVg4z
	UGJRPhvg1xDpvhmoFIr4uOLPr5SicmhxxC2SZmFSpkkygV3f3hoQFrWOlVLGBxhY
	EzYTExkAYKDc4EGCku7UPeBBcA6zKdZ2iebVNVcSZKSF2ol/zr1nWSruq5/hzlDi
	DHsX3HNQT1D6RMTi3yV4mm8JctTtOEDEBnVq68g67O1H8MpHp08wp0yCOxrC9z9h
	z+OTvQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qwkgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7395095a505so3171200b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272842; x=1745877642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=;
        b=vQaCDSaHkLB240eCjPshB2IzOi14zNTWUhsevP5Z9N1+megYJ4SNv+8vZwVlt+vEDJ
         mXBnpIJXxjhBwBvuiWBURJi63gezXHc19aAz+uZGvwZN7dWiaGX/xYZGLk9dCmXBgtM+
         osnOHCwxvMyOqAChn8vRytEpU39eFzvM/+QO/0nS4WZuqQSp3/TrSHJuSFDulUYQTIAe
         b2upWoOm121RwbrL6u8xMayI9TCtKhmGUZxHRzFiYkMditG11VWgafSomuY7ka4A7cVm
         mLMVRxdmMnh2LQtzJnJPaNlkdWVwQkWdChQSVhU3JrTDQ4JbFbh7KH/lDczKm4HT9wwe
         iYPA==
X-Gm-Message-State: AOJu0Yxjc1TXYBS1fLOUPP9uD5xnrgFUjZiHTQuFzo42buGslIbqTXiK
	HkYJhf9s1QCffL/9zmg6ZUl0Lt5LTExLFVbIqRxawIVYPhzY0xlWxlXC192mH0UKgLAGONNV1MV
	q4+PyYqDnGa/Ue5gDfi5nrMIel7Iz2HVoJ0E60CNpyUOtTu7l6C0v3bENN1yqLRQx
X-Gm-Gg: ASbGncuoDeNf8eNToATMcBY381KoSSXBt4N8iRsYjIeoBnPz/rsh6keY6n62H/79542
	Jq89FYg9D/GpX/fspoWsICIzrjYF7VW+LfLcC0wIFHWS4NsDOuWGd6h7or1hBPCtis2O91L/jbz
	R6pjt8bl+wKXWdRT6IVq7rF9uBkuG1ji1L4+5Taz6rNj/+1s3GIZ/yEs3PNqj6TrVoeG1HSBoOq
	U5qU2HuZOQtrv7xNMYy1w1aNn45n4gBHIgGP39IENwUT5oF3crJIDL6cYoCzMgwxQIc1+EbhiLc
	vjNU5yWHPsTTUwMeIdyD1f0jRpLI4OoMSHDZDgK0NPRSnA4QiPD2Wf5Y3ZpDhRkd4aI=
X-Received: by 2002:a05:6a00:8d86:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73dc15f1a87mr18386200b3a.24.1745272842534;
        Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3LJ/nbFki9xpBGx4aK9cppDDFvMSSRS0eHYF1pJ6KN0f3/2PsOfl+A4A3toEqxCnFOpG7Lg==
X-Received: by 2002:a05:6a00:8d86:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73dc15f1a87mr18386147b3a.24.1745272842129;
        Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:17 -0700
Subject: [PATCH v5 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-10-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=899;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=V+if1JLkseIXHxqMs/xUBPBndUeGFuwmXk5nZsv0vMk=;
 b=P2msdcQ+cRrE1nqqLOLNemRor9mB4mfi/qU6Jdv8heLzSYFu9kZh7yW0+lYDdXdjlRFRSNa0F
 7kXdxM9uxuXBejERREp0R9xpV0FE7WRSvokr6+5C9Oawzj9wlxiv9qg
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6806c00b cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kAC1uNjDR6N9yz4uFL8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ymhMWh9sfa_pvfJXn4-VDMQUkTFBPctY
X-Proofpoint-ORIG-GUID: ymhMWh9sfa_pvfJXn4-VDMQUkTFBPctY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=515 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

The SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
SM8750, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e258908811be082f678099ed2cf4c..f0ab5ba8df045bbcbab16ab736342f3d261f4297 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1575,6 +1575,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1


