Return-Path: <linux-arm-msm+bounces-54375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B2A89A11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87C816AAB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71809294A15;
	Tue, 15 Apr 2025 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxJ9vVGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174F28BAA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712820; cv=none; b=RvFxcCQbhWyqQbu3PXa42PvpiHGfNIuR8yOYKplsKK8/Uh6Ie8sIAav68luofioobTNJ52Yy9gpYmm08YbcrsKAVteROQNgCoIqrnc8xmH8ZXGXWLca8F5dvvrai2tp164pclZUnRiKh9uAkrwGQBl+j66mikweWHNeNbsvc3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712820; c=relaxed/simple;
	bh=KHJ7VZhN8rw3VfAx+BGydOiTqYcD3AQrJrNdTioIkBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOqSmiAk4uknGBSYVC/1tuOalgHladDKktfgNY83IKIfdZoz60iXXUPnq0OrK1oRrExAZnsZREfVYzL4EI0ueZxgnTlQUh4B83ybKF+G1sEk08bDA9rrQxFFl0r0erVFQ4TJuPIxT+N47qagfBuJqG2qZqXnXHaef6FpciaYF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxJ9vVGU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHXF013134
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NjQe/Cehh14emWoioDAkyVKlMIZtUYyZlfNAc6nIWk=; b=SxJ9vVGUL9vYswht
	OfjHueH0gUGTM93RKKKe+WGNPECTsRPU5A+i27OYqHaJgwyLKScMvNSvG8vE2CXW
	J0R4BAgV9nHeIaOZf2cZneHyrBUvORfLMpnJUkedb2pot2MRWdVQZjEY33u2iLtJ
	RmLAVkppwQyH2GE0udjPd2e2oL85yZgKYg0c4/z+lg/wBQQaXSjaKxLFA4GjYDrY
	MQ0lrqeXaDcwwyqICXc0uXGiGYCsU/6vuNjtE8sfVVArh2QfzfXENuQQzmOxbHRS
	B5xyH1G2BFCBHFvr+pJE3EemhxWJo7177tnMirSSTtLuVqAh7C7QeFi0EqranlY4
	rUVwtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fnhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so864134385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712816; x=1745317616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NjQe/Cehh14emWoioDAkyVKlMIZtUYyZlfNAc6nIWk=;
        b=Yn1geumcTh44V9qt+cC1oTCqlvEI5sAXgKhXdukEIBB41qSdgq3ZZnsWLhHqwZtZUI
         DZrHxWpEEmHZzrUGRjwd4gfeGx9nTFfxKIRmgwiD8mKGXrOYW3UaR0hB/uJX9W5YplGB
         RWnXV7fQxw8JzECgvfx9SRmYGiZ/wVNVfbeKqeLUGwJRXj9vwh/IhGRPPVUdFlVBG7yl
         fYqUZolBuZgfsnsLEDbqqazEqXmTZjUoNP8+6EZfTEaxKnB94iQ+awEGUBGBlDrBG0tn
         GKn9mpnDOLpobUNyb7fdLTyEG400wpsK4zKXG4xUgx9DmnCaiogzcOSnHzvhbN6z/f7d
         S4ew==
X-Gm-Message-State: AOJu0YyxqeUk6Vzlyw866bBal6eq8YWZELI6XUaqlgmzaeRPOFeJqjJi
	2dFxJ39r44HelO22LKOlHZlG0HKQOK+3dxD/+6HWmdm1UoXFjjFYsz+QymJFtoOObUjnAJxWx94
	XmrAm4BqNaBaVVmgUZb1MmAFb5q8V6Isvp3mEuZ2t/Q14N3b8NuEHbyTPraJCeKz7KHvOx+k7lK
	r3YA==
X-Gm-Gg: ASbGncu99rjOXQU/DgXlEJ3Q2/JVgPDKrphSNkLOpV/VfTKTo6QzphhBDj6QZ6kh82M
	HztwhapoR/b8V8OFJhd8tsMj3Ro3E15zZwXParDMsXoSMUZ+oMJgAfcvT3tRVPQC/odqfo6adS0
	PbEvicOnu1DRyL3fprcacigJUpj3cuBP6JvXRETAzK2EVFeQ5tHuc7Y8h/vwJMQb6whokYmGaWu
	Oz6DO7LcBD4ZFSMXoIaH5eXeEJbWvy2OMFTgvxnIrUVxbZJFVIcVcpNSFbTyjsW4ZMWKxq7ZKFK
	fdCyOoEw4CejIQSy419oSTaxAjePPGnwRbQ8cGq44OxT1RIWkiFv0QWARLtvtkmODLJJGnX6Jvl
	56qOSjoKv8VVNlycgmsTNdnbI
X-Received: by 2002:a05:620a:4244:b0:7c0:a264:4de1 with SMTP id af79cd13be357-7c81e02a3dcmr391831585a.24.1744712816249;
        Tue, 15 Apr 2025 03:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1dlRojfFTSAw1KzfFhkgSfB++VdMKvftNZPaHwRR8Gxr2IPTV83OyfO/501TBFtv8koK9Jg==
X-Received: by 2002:a05:620a:4244:b0:7c0:a264:4de1 with SMTP id af79cd13be357-7c81e02a3dcmr391829885a.24.1744712815956;
        Tue, 15 Apr 2025 03:26:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:07 +0300
Subject: [PATCH 09/20] arm64: dts: qcom: sc8280xp: use correct size for
 VBIF regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-9-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KHJ7VZhN8rw3VfAx+BGydOiTqYcD3AQrJrNdTioIkBA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRcp8T0wB1v8Bqmdw52kn+AiNkrsNC1XgLKb
 bCEVy2E1vuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XAAKCRCLPIo+Aiko
 1cPQB/9NmQNmJ588bnUVmcmkk4bsmhZqcZq4sKvvYsAYwh0cHfXS7VtPTt/Cu95sFbrpQmajBDD
 aSYIjKvPRMimFU6LIee/jmyRTD3p/Z+PcMEvvkRgNRPFnVu4XBSFoYHLhC69gvs778SmLhCqAqp
 rNsjeSX37TFFyPXo1c1cHBsaoQXwA+U5qbIhHxnljSNwWPq7AuzCEVIDn8+cIDkeb3s458VUOzo
 6Qk6tO1Ki+4AF+2PJYHZd+lTRw9Zzhkg93Lv9Lnq4aDY0hjjT1PTswQHF9MMsEt+cagwdd+sxcD
 jb7yzVmiY5PrTqDNT8WVYIM6hpVQdud6gR0eFx4N7MZzuPS0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 91mRB8Ql85qdhyDcU0WJ8xZcIeJH-YX2
X-Proofpoint-GUID: 91mRB8Ql85qdhyDcU0WJ8xZcIeJH-YX2
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe3472 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HDgN_FK0fIBovgAwvSEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=803 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index f57c23c244b6bb8a5502493553bbd17372e57b0c..35ef31d4ecf26125407bb64dd2de6e777a3400a3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4141,7 +4141,7 @@ mdss0: display-subsystem@ae00000 {
 			mdss0_mdp: display-controller@ae01000 {
 				compatible = "qcom,sc8280xp-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
@@ -5459,7 +5459,7 @@ mdss1: display-subsystem@22000000 {
 			mdss1_mdp: display-controller@22001000 {
 				compatible = "qcom,sc8280xp-dpu";
 				reg = <0 0x22001000 0 0x8f000>,
-				      <0 0x220b0000 0 0x2008>;
+				      <0 0x220b0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,

-- 
2.39.5


