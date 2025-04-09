Return-Path: <linux-arm-msm+bounces-53687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA093A82DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 19:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF14C1B6562E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436E227C147;
	Wed,  9 Apr 2025 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOjUuivX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958927BF6F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220922; cv=none; b=Mim53RmQaUqaTrFMKAI0h6v70SiT0u+M+xnkNF6tFmrzMQ/5Tawi80aliOfGeBwwycunU10MmLs+Q9BuwoxvIuYDGL1+qmnK2+FDxQgUfGHNQBVU6qjKJK5fIWuTA7lnrEto2ozHzUpuAoSpTgCDGuC3+wJBoWpINUk9qHzDVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220922; c=relaxed/simple;
	bh=sz0kXCsZPP1gXa3Tdw156Uk9burhLLaP+nEGbSexEIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULUp+gBIUPaJ7O4Tg7MBFHzPEiQQYsVEi1ht0pQC/sWAHAuRMmMS9C7VgUydcJKsJrbiQ1oWUTlCB4lABQqiOaLO7C5eVm7+75mHNzw6qOgPXFSVddmXidukDM8lg8gvs3jEInPHwp970YYqhMxlSGpByx/CvKrKRFo1M/ySSM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOjUuivX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Giphi028177
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 17:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=; b=aOjUuivXd7msVk7c
	xeRu0w31+xxRiBF/iX9GmbDSL8mz0ouMyIJAx8bsZno0BvguXarPnyzGQasQqHgO
	GW2okA7vyZu7lDKFVEUlVV/Y2vPxfJzm0G2kX3ygQuAAPHTaP0oSejuztBXrz9+E
	dI6mA6Kmcf4TMvYOVv3G5TZ1+y6p5JayAdp/6YTip5x+unFzjyOHDzRtCp1y0G6P
	4e4S4+4OYUfFk2pYTR1EsCTo4wp3h4K1ZsT0rHsg8lt+c+mfn4vo/505wc0M5L/h
	yBWc4x0MNJcOHZ9unPQLbH00NG3mNVz8j9JMDFUMZ3x4bTCose7vYuS+W62KqWS+
	OtUrHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrmd18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 17:48:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225ab228a37so63119965ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 10:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220918; x=1744825718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=;
        b=ARdiKhmsP+AWRFhBXMjyLa+Vok5lncFojumyB05C9l7TP/JxPLzDRkkSyL75YIMl7C
         79Cv8ESys5fxcT8PPmrftjYjiBzvohGogSJyC6MjPqtuVBkqwgP5p9FfDIeoPPAj61K8
         2UAsOYUDtFvYp2JrcoiCRwcIXxVSxF04dhBBZHVf5b7mnymmMQFV3VoC0C6hdO5QhtcD
         GcbpU6aWo+hc3QXZ6Vw5Qh+hCvnPf2Mwlk/F53j01rOFpK+Tf6yLO4gRpvW3WWBDTaYS
         D/fDVdJK624FDj20HXW38pRm9UIcHtP3WM8ujiATJ2XOuuu4Nmy580iZ+rhXps4JfS0+
         GZHQ==
X-Gm-Message-State: AOJu0YyG+QHTQUIx84MWC64EG5J4KoZmNnL7CLyJpVe8hERcAadZSmpq
	/FxJxokTfsZDr0dOyWPCOF3GpRmGGc8GNyrP9NXUWpzBlEZAMaWQ70/+6hMWs6IEbsT91WEydQd
	Xqucy+5Ga6cZSkSCkXbm1B6unYfVgt5GLKV9lwMPZL7DF5yppO6Y2WiYpz5bgSHJC
X-Gm-Gg: ASbGncv/fNrxw1Zo93zqRY0x3OvPsoYZsOzZdPnFkJ1Qgdf36w0bUtKmhLFDJPwolO9
	x/mrA4TJwdasDNPG6vhlVecG0G7ufX/lCMYRQ6EbbAXl7xgO/Ld0vsEGrE/mooqQpi+M+yM461+
	Nd4ZEHQ1GY7eRmsG0bate2di1rL+7w/6I4dFzlhGK0ExYmaw1UMtoYtXSbj7KLWiHL7/Z4RI0XY
	fgK0FHex8gE//soic2/qDN+E4W+kNN3Ae0ycj9Zqmix1+4s55niivTN64tzo+ZBizO3f+g1Fsxw
	sosCpVi3vMPo5q5EyvYs8OrljKjG28ChEJR+eAgA5O2s3lA/URnWJHX8cpJy6fbyXTM=
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr48940595ad.45.1744220917813;
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgSyGLh2XAMOqvFxthpf7vhlVKkk1+AeWpcHVuGhAtlSIix9yvEu88v8WHZBgkrm1aUAyCw==
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr48940235ad.45.1744220917481;
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:19 -0700
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-8-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=DuT4nt6bKMvm4aZhmJJ4jf1bQ96Ec/cSqjFur5HUS2s=;
 b=+KntYU+os+cO+o4A696kL+VRqPIFmJ2KwIq6t0NqPlaQKbnrpjNAmXUNpAoeA9f9O/0QxgsjQ
 Znp4tGy0v4tAQzZB3gU97UoM6bEXtjBq4J+filtjGpOchw/of3PBvLw
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: G7pJG3Wo6o2jCPMAPL85KyYsdVjIxFCI
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f6b2f7 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zJXK8rm16J_mOy4j9woA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G7pJG3Wo6o2jCPMAPL85KyYsdVjIxFCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=749 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5d0decd2aa2d0e0849414534cdd504714402458e..3ad417aaaaf46ee007bc4c029fa9e57ac183c075 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -806,3 +806,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1


