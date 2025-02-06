Return-Path: <linux-arm-msm+bounces-47060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B0A2B690
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 00:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E19D21884073
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 23:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770FA237717;
	Thu,  6 Feb 2025 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0eVWQD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76DF239094
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884556; cv=none; b=Vsxv01eLEe41APgHTxTV5bOWH960vXGyR9pscGnU3dhFizvxoyFDei5DZh8wbAThqX2TI3gnwftBnzuFFoY7dY7L7FYqyp+Z8XHuxSbx9ivfb++cAvLb5E29G24KrAQj7LyZB0KfeWNo6cKuKgzMstpSIlu0QmeIGXhxtDyV36I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884556; c=relaxed/simple;
	bh=s3bIi9NJPl7GvWtItHLAYMBhKKwwbJNGn6/L6WX4Qbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmGoaDurryk/37gi0VC3Tpk5SiOaNgMcNhVEqQHNrJznuiZzsMlhZPtAkgwNAVjyzmTc8vQgyHgavYe5tr+FeB1IupBAcLmhrMHW2JTZPY+PB+Izmu1YI+mRHIwKCMRVbbRLQOJiioywQpVRMteG7HGfF6ewaSf2TeoBOOc3HP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0eVWQD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516HrgcN015603
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Feb 2025 23:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzVhPReZf2sVqu2mJY4+qLpMOX5OmiFM5s04YydtgQI=; b=d0eVWQD3ua6HtQp8
	9IDZYbBqVXmbreERzwSspr2JPcgwfVaJQNXenZ2/XOYn9h9IAqPB6Mf1OxnOFYDY
	W7P4iYaQZFyUcBZToaqWhZthTvUbMG8wrZy5xqijINdsZeC8WeygGdmkVulgtEMQ
	a9TXxcGFqQ+/kNGe5/puZgcoT2B6RdEZZch2MQ4Rlaq1Fl1UGqcrg9jwapco5R0n
	XcvCd7HiYC4UWquB5UB29P2m71OusRXitKCS9g4cQGx70iQF3LFmAzFEV7DVHauj
	ivAP7vjZ9/EP6WNnzVqiuOO6DZvSfuZmH07plhoAXPFj6C8G3egjoR5UqRGqKFKI
	E56KJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n1vs0p08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 23:29:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f9eb31238aso4669397a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 15:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738884552; x=1739489352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzVhPReZf2sVqu2mJY4+qLpMOX5OmiFM5s04YydtgQI=;
        b=ZIYGUtT8RZOmoSGz3NKvMvkSQIac6B+GxOGqFFvzzjN2QBxTdtbyrufgln0sT5XZjx
         CiskDLy2LNn8iut/q0EWnK9dhlQ0lXDLTrTDsQo5a7kQR2cs+556zTHb1EnY4nFXXs5r
         2sHpkguymbLtlgUXUqLcz/U1q2/H8rmp4oG6dPuJrN+/vrsJazYSFvkAGQCh9YY7+OFt
         bN6bW3xnamaeun4409zpM0ZxuKvH2cMra7UsJ59EFpBYb5kK98JZc4QFa8cS50V2kO8b
         jyKn0h5RmVzy4L1sfNvLJTdVSGFI38A+nZXiCxpufARZBXfLkP6yPToxzwCQooelkmpl
         aK3A==
X-Gm-Message-State: AOJu0YzdQeYld0NFAKsAkdF7zgXFqL6Ne0+owLaKgbocVYnf+kqQu3Md
	Yjx3UKYhbPYrcqONwoJRpxe3SY52L8E1b4fgyADD+GRKGX4J5FfqTDC4fZxs4iZwWJszvvge66H
	ZUfeZt7A9ar8GsUHbYGMvBEqi0U2Y6mDnpvLmbERfQNuWGwsTahahZjHlnnHQmNJ2
X-Gm-Gg: ASbGncsss/vS7/9vPM224oasblRdK1ksGtsPCkWMgFADbmIDN9udd3UDKjKMs2Q+ppw
	JdlvJOG9NmLXhmHxIxOu1e6FsUDHksNdVqkOh+gkQzVNUeIp5iaSipbYaoONGmtrGeknsBGRFOG
	wwSlek45plpGb2OTg3pYFK24XVjr/mRazLqLMDOwudeu8mUYgQOHLUpgrT8HLFVTS8t1PuYE2Cv
	MjjbzcoGnpKbhek+XLBQwXPvk96MCZsl4R78dTksi7nWHdYS4Z6EsXsOjT3tXEelziH2b7dEM9p
	nioKfPFxMrQs3dvUzPx7eu4WeRznSdYrhIVVTW8f
X-Received: by 2002:aa7:88cb:0:b0:725:eacf:cfda with SMTP id d2e1a72fcca58-7305d51bfafmr1883478b3a.17.1738884552220;
        Thu, 06 Feb 2025 15:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKUgf9YEV08t4p+ocW2IVUib9sdQwfg4g7HFAwuaqDpN3Hq9K+Kipy5UkLkFmKusvAFsXZzQ==
X-Received: by 2002:aa7:88cb:0:b0:725:eacf:cfda with SMTP id d2e1a72fcca58-7305d51bfafmr1883423b3a.17.1738884551746;
        Thu, 06 Feb 2025 15:29:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f6esm1845905b3a.74.2025.02.06.15.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 15:29:11 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 07 Feb 2025 04:58:56 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-ecam_v4-v4-1-94b5d5ec5017@oss.qualcomm.com>
References: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
In-Reply-To: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738884540; l=2049;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s3bIi9NJPl7GvWtItHLAYMBhKKwwbJNGn6/L6WX4Qbc=;
 b=A6+UFleePIXXF4FhpC6Jr2fEHw1pX8UFKKV22d5aVWXk4TucvDFU0J2PaXvViYDf6Upqnguoo
 xebRSc2gt1FBu+mKnspdruViK0xkR46WpMKzqX8d6pK0kjbkCuchmmG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: kyik_kFsNigsVgDnBzMpe3_AEuEluyhI
X-Proofpoint-GUID: kyik_kFsNigsVgDnBzMpe3_AEuEluyhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=709 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060182

PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
maximum of 256MB configuration space.

To enable this feature increase configuration space size to 256MB. If
the config space is increased, the BAR space needs to be truncated as
it resides in the same location. To avoid the bar space truncation move
config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
iregion entirely for BAR region.

This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
of DBI and iATU register space in BAR region")'

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b..64c46221d8bf 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2201,10 +2201,10 @@ wifi: wifi@17a10040 {
 		pcie1: pcie@1c08000 {
 			compatible = "qcom,pcie-sc7280";
 			reg = <0 0x01c08000 0 0x3000>,
-			      <0 0x40000000 0 0xf1d>,
-			      <0 0x40000f20 0 0xa8>,
-			      <0 0x40001000 0 0x1000>,
-			      <0 0x40100000 0 0x100000>;
+			      <4 0x00000000 0 0xf1d>,
+			      <4 0x00000f20 0 0xa8>,
+			      <4 0x10000000 0 0x1000>,
+			      <4 0x00000000 0 0x10000000>;
 
 			reg-names = "parf", "dbi", "elbi", "atu", "config";
 			device_type = "pci";
@@ -2215,8 +2215,8 @@ pcie1: pcie@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40000000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>;
 
 			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.34.1


