Return-Path: <linux-arm-msm+bounces-74951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7DB9DA80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A472D7B5674
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A10F2EB85A;
	Thu, 25 Sep 2025 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2Ya2sVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6685A2EA147
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782009; cv=none; b=R7eedgdJkpumv9g33sUeoJ5R5Tv4te7NC7b5LJvSgwU8wSEy5xaPGHCHvlCVx2DaqPIW873OuaBtgcGmH44QaZidphDxA4GHWKMvqF+F0ognv4XUOSKAhtTxMHipvQQFDFvrTt3U7RtQ1jWvMoFUBQahVQqHCRlq1HRM4Jl7vEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782009; c=relaxed/simple;
	bh=k8/lUZ8NmYXRm+gPL26YcHRuOfJFQtIkV32n92nOAuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmUB/k2AsKIvPy3aTm56QPREFkzJ5VL/Bf36d5rbQltG9Y2YsfLXWppURllZYJ5lxm8Q7Kde+Gg6y0xbKccb5kPDJNJAk5JcijAs4eMHHrLT76i7i87fETZsjkydxuXdbIFsnPsSVuJlRJMGl0nF6ExXLRJazKtXRx9YwDmMAFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2Ya2sVo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P12CJV019934
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h8U5iWeRpBsKn7Vy1xPhS5J0u1ez7iSlyb86KM671Vc=; b=L2Ya2sVoVmF4z2U4
	Q5Y6WlPnXriSAeElhX+f+cTlLEMPMX7IgYIKosN5DvnKi7drIRvK2X6cqCVrKZnR
	I5/+fzvTNXyXIEeUICxg3HtgWbP+S9GSBvaqOBOb2nJpozVfsaT9pI4GtuwBSnDG
	1vr2M7NDVo9I0ve23imjBZIZS0GeSyNdEC+HRpAzcLUBNOAJbN5id/qMPG8KVUmG
	jOPAdYRxU5UtTCsBWo2pHjU8ADyoQigx0woLYZJVCE/ptSNekeo/vEeooZzGWFYR
	PEiwo/Fm0MUCvkQguf/iEtAOpsnRAgYfmjgl4burhzKbi8B4/VF+2EwyALaWZi9J
	On4SqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe08uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2699ed6d43dso7406135ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782007; x=1759386807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8U5iWeRpBsKn7Vy1xPhS5J0u1ez7iSlyb86KM671Vc=;
        b=SQaCFqmjWKY7iefK5dYkWSNRtIy7nRS0+iep9Ta6JKj7loWtSFN8sdTQXLda+ppB9h
         VsorfgbW1aLpercYZWfWmr2cVFNgE6V2RGBvXNQ4tp05B/hCA3uVSjAYIeaGR8Myk9II
         QCPwGkcXF4rpzDSheqnst8xld8sx9mTYfRAAAGu6TM60hnVSDYAF+upfTvQMGNNGozyN
         ZsgGspmCLAzcHBqT24AdqicXqNG1PWOO9z+R0E84pja1OSPzaUsg0J0KYloP5X187tqC
         Kzdl+a0peUD6FA+3+cVe/S8g5LhFz0gO0K8fEAgCZjyUctB4ONxCBFkAAORkzjiPisJw
         njVw==
X-Gm-Message-State: AOJu0YyCyEWiY7USfcvOxEfHMydVgeosG+PIal4aIgSllrI2JPyGr/Xq
	RqGGfNNqMCKh/C8yQc3i822ViXcZsBSkIEJm1S114tRQg67dHyzmF8Oo2683QYZO1u/s6lA2J9i
	q8sE2+AxTny/fIWPVriNGBUJDoOcalgpv4GgXa9u6UEgxI7sPVn6/0EaOTPYdD+dkrhxI
X-Gm-Gg: ASbGnctuXv2dZtgBwpTFPPLF5pKSbzpraY+HVtriRz6N70cun3JVMM8JH2gT8/VXY94
	+gSY5VANKGoMUYg7P6PnTxKO5zuV8g98mY+CMpEvnKgPZp1/Y1YIczEaNqLBkFoEUo/0t/qAejz
	Bat950FsfFnKj5zMsrOkerdIDWx9H8yDv0hLvPhrXz5BopEq7dRsqoWoIYBgPxK7FQRhmlsEzmx
	69D8uZxqHVEgM8chtQSWTKCDlGsfT8nQXZtl7mD2SSfSNJBFAdFbv0XM79Xm8YQwRqnO4Ap0Bpe
	gmRemJyD55cO9zYluV6iaLHqJGFH26124H/kQOwuE2fu0SGo6ronI0gq2zs0aA4HPbgZ9+Rny/Q
	btTWoqvXs+93jR/dr9QT0rk/t8pu+JqOWHthPknGebJ1NR6vP7cG6xAjIy07D
X-Received: by 2002:a17:902:ecce:b0:267:87be:505e with SMTP id d9443c01a7336-27ed4a3748cmr24613015ad.23.1758782006780;
        Wed, 24 Sep 2025 23:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbxr43vagnMchkFIiO6iZNE0uvuLG3/tVyJKTSBHe556k0oxn1FxmN9aKvZFXfNnooXpBU0A==
X-Received: by 2002:a17:902:ecce:b0:267:87be:505e with SMTP id d9443c01a7336-27ed4a3748cmr24612705ad.23.1758782006364;
        Wed, 24 Sep 2025 23:33:26 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:26 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:10 +0530
Subject: [PATCH 02/24] arm64: defconfig: Enable Glymur configs for boot to
 shell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-2-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: tDy2jSD0Y8bRYOdRy33IObFIol-hFxEl
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4e237 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aiTWul_IyTFgGyK2hVEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tDy2jSD0Y8bRYOdRy33IObFIol-hFxEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX+YKf9ai/+N7G
 Pkgvg4xhF9SZ/+7CXUirKHOKVxPOFCluEZgpHLIRVl6PQXFunn5Zcm/M6kIibxpUcfDenSTd0cj
 PjGdPwn/JmLLtX8JmqLwZrsFfbr+DHD48W26+fOLJOf0p+JgJ62EXgMWImA34G3SEs7I137BLOB
 TTKNt6J0S1smmDlaIWdYImCdpt6unFc3Cgh54CmZFOg0HZfw5hMu+AXrXhZbU9/+Q8Wc64sgdDk
 4E5KWGkYFh/5A2wTrlm6VObTJNCYdoWxFRZrLTnD0QvMMn7hjRV7GUHDxCx7T4HZ3t8Y0Q3wZLy
 f7AORNUdaLQAi940E0uwLVQZv7S8vjm180v2maG5qUV5zML+EW53T5b7mivniHWwA7ptYi6a8j3
 ZNY5qiaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

The serial engine must be properly setup before kernel reaches
"init",so UART driver and its dependencies needs to be built in.
Enable its dependency clocks,interconnect and pinctrl as built-in
to boot Glymur CRD board to UART console with full USB support.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..9dfec01d347b57b4eae1621a69dc06bb8ecbdff1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -616,6 +616,7 @@ CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1363,6 +1364,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=y
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=y
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
@@ -1641,6 +1645,7 @@ CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
@@ -1718,6 +1723,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m

-- 
2.34.1


