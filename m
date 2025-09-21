Return-Path: <linux-arm-msm+bounces-74332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF83B8D623
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 926604427EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437222D63E3;
	Sun, 21 Sep 2025 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FteWC7FS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B72D5934
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438708; cv=none; b=S4yh0b5ALj91yDNTY64+1G55dvM1LSCB43ClO4ZwkmVhUrCmTeS2SxhM5RsqSCSTchdtDgY35t/+CZo1g0u+4URU8UnOwCfm6FiL4LoHK4nCQG4pJPNwBZrn9XwPBWV7esDN31srXxapUOcVEcfBGaJyhqLge0s3xQTvDb4Vrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438708; c=relaxed/simple;
	bh=qCEQM2DB6f88IU0QnUh9B721GoRdDOJ5sQGEUrhnDMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3gLNSopRSYYDEMizla8QqSnQu2wc6CxVnvQz1nJOu7FF/qez1jk+BxRSZch/7O+RvbojrbIRHPw2TLBA43ZZCmZguqUI3ot75Znl+AqslQucN7NNeC9KcvJzinQ5FDG2jFFss+Sd+z572HeJi1XxqooKV6TpJtAksWeehawd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FteWC7FS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L5NLJZ010749
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZI3/sTOd53UxwGm0A52HiBP54BTXnRIEQmLXh5SLBY=; b=FteWC7FS67Uh2fzd
	4P7u6hi35ptCV57iVQJqI9MWb4CovprlS37vw0xOvdk83Z2b3HDAuK3ljvt+o5RY
	0sNM1UJAzA6h7NxDg5E++HncLd0iCw93qEwbbVcKhxhD/dSubbNN+JkwqDerPpWl
	B7gIAwLKYKJ9fGqkvZo/vhdFtacsRFpzuomI2pUXuVPsD+XWGGZm3f4K9yU0brAK
	VZ3ytxLuHnjEuFx8uu1zrwSA6+FCooRpBlawxgllWND0UKcdqjUFVnhc6nIQVkzZ
	VoooWAKJNC2PiejwJD+m+k4X2+BHyUIZYykW85YH75OKfe85Cm2HtaCpQOCkzB04
	epSAsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f9qx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5d58d226cso74042491cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438705; x=1759043505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZI3/sTOd53UxwGm0A52HiBP54BTXnRIEQmLXh5SLBY=;
        b=AeeCFdUEmozmJ107kOuuL0nGu0MQ8qjxevcSUFhwm4VXNjVA36+Z6Va6ej2MTP0qM2
         wBc4Ir772eBOFXSIkfGT5FDXi4gnXiJ20+QVMHRTj6DngaauVvSPgiwyK23s1xPXEsAS
         lmsvfSyAlUhE9Wdjur9QfwGLaRQWQm59aEv6v+SeQbgWqLRuycqrmw8FpFAJPiIjUbB+
         X7BuEo15i+Jz/To0RauYi8xEjeD3h6SS14FOmNe6ym1PHnUuoSC0y2A2vGcnCI4miU0/
         ttT3qARFizmctVoMMlRS3pJfdAVE1RpyZZXoRwXTQzfxMtJdZjDJ8TNoHznGJs3zMyyb
         uEHQ==
X-Gm-Message-State: AOJu0YzkVbGRSVFxvUmJAyllB8yJRY91Nb5dUULLZiZViXWtLQSWVv60
	xZ/7puosKOzczzKXVE9XghUWLLt0IrOhXiRzCF0tGhBDN66725xXl7T3ah/rs9YLB0cGcAr1cio
	DuzAKvOepaSvCDIde7/XLj4OnYTTuJr+iktpBERSELXq7/H1sV1qntfzSgTTWtaKUCFRg
X-Gm-Gg: ASbGncsOkPYHtMcVVjsFDMD0h4Ig29Cf96PG8lZmIsz8Z/4D8si8zS+7YPZ/5ZM5uDk
	Lee2a+la7D0Q8RR0lS7tdsNL6geIxEhf73VGC/iPT3ydnNArBIP0aZNqn/bmMa8mEp0s28IkxjF
	jEVbWL9GdalWFwQ9VtbnOhKu0To2VXZeFLrW1eQCTwMdlgBXucq3EjtUXdNugIcWdQQ/40behTA
	o4Mztks+a0b5vCcJPqbQuDLHSZg13eL0GLIs+drmPJktcQCTdplUB+wwl0AmJve0ZhCV+AoQe3z
	qSMhM9R3cHnkPr3FVr/vua2udcsHbwqifoA+nmp3s2oqIDZeGnOa+T8RGC362g1ZNTHzHrHGy9O
	2Q/rNdX+URuQGwCmjJTzeApBW5YT/mYKIRjus9v/j+50oZN1YXDbF
X-Received: by 2002:a05:622a:5e18:b0:4b7:95f2:ddf with SMTP id d75a77b69052e-4c229dbc347mr47103411cf.45.1758438704691;
        Sun, 21 Sep 2025 00:11:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8igKf7oPEZN6ecPgg1/seoDl0exTVNvJeCVzqaNoTDKnyzm4uNnLY4vc+NsVP3OVYIVBGyw==
X-Received: by 2002:a05:622a:5e18:b0:4b7:95f2:ddf with SMTP id d75a77b69052e-4c229dbc347mr47103341cf.45.1758438704280;
        Sun, 21 Sep 2025 00:11:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:23 +0300
Subject: [PATCH 07/14] arm64: dts: qcom: sdm670: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-7-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qCEQM2DB6f88IU0QnUh9B721GoRdDOJ5sQGEUrhnDMA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UhNq1ZeCcT2DxmV9U+SRXxrfryFhuhPp/Uv
 Z2uVouXhBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIQAKCRCLPIo+Aiko
 1VsvB/4vCprWpiGSewAa+7hJuIhqBJDTEYP5gFk3jzJRzLpQra1O3jivB9iWQ7UBa9SHHD4QzLR
 hC0rSkgR49HD7CXJ+4c92+xjEu4q4V+bIxaoP0Hoc8gq7II6QzhPgPtbCcXll4sg54hyHdoTgi+
 tLfZz+Laxuugux8mjDoj8WrJUAs5xR/mTDaBWE9n65FBN97oesTCH2wlPuJ2KMY2Z/kWnn+p2Lg
 TQ4kxhTnpm3HVTlw+SxWYqVBeGRotAcqe8WibpsvFDiRFRVde0iYM2G3oMl3MMHVaenF2W5vXLM
 DAiDxEczfsmL+R/oXuCpLM9hQe3o5zQInAnpKrPUBlOhAYeG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0G5xexZsp6RkACna7lGDimMK_X7EOmsW
X-Proofpoint-GUID: 0G5xexZsp6RkACna7lGDimMK_X7EOmsW
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cfa532 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JxVd-jRfK3spBIq9QYkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX5FFfvObh86tq
 s1I5b6Jejs36fRsdOWs3id4F4lADSsSsRpnIb25yED+OdWKg+mTSQEaoFy4UCh9zftVvr99EPJ2
 e/LmKS/IQzSsFcPyr4m5m1ztG77BHAlFUJZEke7Zt/TLdnnFh9Uzc9FmAUMmQVrqt1/ArfFhLXG
 KJ6+LKYSMIWpjy4+K+Hxyp6lDjzsDgaqQ2LE7bL6QXbuDyFq3Lq2jknRdXXqvjo0M+FvRmEXFW1
 uBCNhf9o80QfAnxDUk3lMkCngKsg3dkQHhTIG3S0iAknfGnmSFO+gLAJJ/9XMJIj4YX1JEvzdh0
 rmEqK8A5SpyuaFDGYqfSHFj6yb6NnE1b9Z07C4CS+OJx7aQkqeVXlKNW1Y22zTzSHVqF6aqYT8C
 3iWNWhHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Add the refgen regulator block and use it for the DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c33f3de779f6ef457a3336fa4fbe39175c378cce..c3264a31bccf25fca9eae7fa7734ff43c9db410a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1124,6 +1124,12 @@ i2c15: i2c@a9c000 {
 			};
 		};
 
+		refgen: regulator@ff1000 {
+			compatible = "qcom,sdm670-refgen-regulator",
+				     "qcom,sdm845-refgen-regulator";
+			reg = <0x0 0x00ff1000 0x0 0x60>;
+		};
+
 		mem_noc: interconnect@1380000 {
 			compatible = "qcom,sdm670-mem-noc";
 			reg = <0 0x01380000 0 0x27200>;
@@ -1926,6 +1932,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				phys = <&mdss_dsi0_phy>;
 
+				refgen-supply = <&refgen>;
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2000,6 +2008,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				phys = <&mdss_dsi1_phy>;
 
+				refgen-supply = <&refgen>;
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 

-- 
2.47.3


