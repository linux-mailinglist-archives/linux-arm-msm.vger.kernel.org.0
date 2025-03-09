Return-Path: <linux-arm-msm+bounces-50728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11096A580C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 06:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19AA21890727
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 05:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9396633F9;
	Sun,  9 Mar 2025 05:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBwFGUOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257DF14B092
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499186; cv=none; b=Av6Hwh53Izlkb/TWJPivSFMYl8/jck5XbThFP7mrUasP6Vy0kLamy0kIqajIMeHiYBFXLnPAAo2PfURuqdhYNlki+ix3C/ZdGYI6WEP0UlkNoSFfxNkUL6bp4U9R4Jy8Z/wxDLaxPpTVoLONrZqQV4+v79H0oKuQM/cepKyW5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499186; c=relaxed/simple;
	bh=yzvYS+vDkvHU/sbyPg2yR5foiv1dbD+/nutD89aVNFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDXM/TloSyO5i5Nco1s+a+zWuSOFm7m8ZWM6LJH3cdQCoM9rfmtoxvz7lBB79p96jbbp95EJ+GD6BMtjOE74970L5UqJ1D92JHFh7It7tuKmDp1KB+tpKDN1TfSLt7CEncO7uKUAPo68M7emH/OP264NyJGjgdKHpe4Xis0Hu/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBwFGUOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5294htaj025958
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Mar 2025 05:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xd5/NY/AbI/ojxPiTnWZDegzzMxF2ObPIkWgoHjce9E=; b=RBwFGUODwevnW+uu
	Rho/gnIs/l+x2KSBcECGgreHHLXiBd51X9KyswSeE8Y9kfZ7jVguE5cCVUxEhWZc
	h4FtQ/ir/zAoc7Ec8fC683uh0eOKtCrtlkYyP01mNAF8c6ZKue0tMoOS/pA800UX
	FrF9BuENDn0OWfilECnVVbCjyqTxGlCbrti8efhP3hAla4fJd8z3ILAGgizmmjV2
	nyLi2kJXADbGvc4iD8V0TxYcoaIbxzb2zH6tag/Grs0Zc4Il9akjF23E4ZfWzzIb
	C0kpRBWhngdn2uDzMAVqRSReB0a4VCE+TBrQGVG4C7QGbMe8LJo6+3Gtpy5meirc
	RaZ4JQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f2m9pgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 05:46:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224347aef79so40966785ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 21:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741499183; x=1742103983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd5/NY/AbI/ojxPiTnWZDegzzMxF2ObPIkWgoHjce9E=;
        b=P97eOUlktiLYSfycexbpVyXhfYv9Mwc62z6xFoAzNBPcUAiWbiMzqXUKn1TDybu3H4
         501rXO3UEkzpUoecURZ3IEodMopDv22AVqvR48PfsiezZvCXVkO6fY6/eOJI2es4eZ4u
         eGYDX/8V/QMdG9w4Vnyk5lV6LJ1qrs+Vz/Lm2jJ7aiJg/GzXC8tkwrQj9tliXTpJTYHZ
         i6+3IIOgo9vZEpK6/NJehGcpETGYm0m5S5Ly7evqBFxr+4vS3jpVkSi2EqNXG5iTp6tQ
         yazMQDhp11vPt2haPHvSFirX0ViMy7Pwe7JIEHIGnjtYBr9Nf6BUjyItC2JbqXCWarCS
         KKlA==
X-Gm-Message-State: AOJu0YwP5lDLyEGysgt1B9g8xHRjuxUvCOQvHze4hA2cfkdr1LxiN5xE
	noVxhwd5yVkYmbRDDAfQ5CKmngURbYKbbYoaZ3K9Aai+uW3DzWR9GbFKmYFt+0sptbiivaQz5sL
	AtXa3OJcRf55CvZyJSR+4c6kJe0qKfhZWr5tYxV6/oOfbjkGA2Ao0IDGZOAZBHP6z
X-Gm-Gg: ASbGncukRFQjMAnCs3Du3J4TyUfYUSSA79SUA7+NULEIK3SXju83Mb6zYyI5JTKQs4H
	fRdWAlNASR/eBjRnBuTCIASLWvohubmw3Ftq7cch3m1l6mH8GH2adeq5AmSh76ls7+dCBASgnkv
	q7Bsf+hn2T8zS+wx8oHjRJEZ/c4oKdkMq+/p+pt2Fia7gy0ViWrpwqTKA01vFglkZcTTsiEF12d
	vfTdoadvlO+6gmu2YeugU3AoyEZF/55hx9oLMYYMhbXkPfUQKOVwRvIWvoR/+I/++HpYIg+APc6
	MxpJfNBE/un1U2UWtswvgbnMPSFWozQ6vo5bu4QctjG1QQMSn+Q=
X-Received: by 2002:a17:902:e80a:b0:224:1074:63a0 with SMTP id d9443c01a7336-22428ab7313mr144081915ad.34.1741499183145;
        Sat, 08 Mar 2025 21:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8jQ41ewm8mRMToOvvbPTBKa6DdkpK8KF4isFprAHrCTfOwjmsi4gJjMmDCobS1C6QBUqZ8w==
X-Received: by 2002:a17:902:e80a:b0:224:1074:63a0 with SMTP id d9443c01a7336-22428ab7313mr144081455ad.34.1741499182676;
        Sat, 08 Mar 2025 21:46:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddbe7sm54887145ad.32.2025.03.08.21.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 21:46:22 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 09 Mar 2025 11:15:25 +0530
Subject: [PATCH v5 3/7] arch: arm64: qcom: sc7280: Remove optional elbi
 register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-ecam_v4-v5-3-8eff4b59790d@oss.qualcomm.com>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
In-Reply-To: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741499159; l=1000;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yzvYS+vDkvHU/sbyPg2yR5foiv1dbD+/nutD89aVNFA=;
 b=8Jt0eDX2uQWxV+tx6Vb6Uv/IKPa3yVlq2Br+SVVptGCggq25ML51gwaCZysbJxBqI6kKh9z6v
 jaSwx0UM+oNC/wgb374BOelNO2/DLenm+S+c2em+fVjMbatR84eyUZU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: oIds5T3LBGqkGX-sJmMF0kxWi_KPHpdD
X-Proofpoint-ORIG-GUID: oIds5T3LBGqkGX-sJmMF0kxWi_KPHpdD
X-Authority-Analysis: v=2.4 cv=ab+bnQot c=1 sm=1 tr=0 ts=67cd2b30 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=DLZpj_5H-hTUFZwOGiJR:22 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=744 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503090043

ELBI registers are optional registers which are not used by this
platform. So removing the elbi registers from PCIe node.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64c46221d8bf..e556285d6b75 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2202,11 +2202,10 @@ pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sc7280";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <4 0x00000000 0 0xf1d>,
-			      <4 0x00000f20 0 0xa8>,
 			      <4 0x10000000 0 0x1000>,
 			      <4 0x00000000 0 0x10000000>;
 
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			reg-names = "parf", "dbi", "atu", "config";
 			device_type = "pci";
 			linux,pci-domain = <1>;
 			bus-range = <0x00 0xff>;

-- 
2.34.1


