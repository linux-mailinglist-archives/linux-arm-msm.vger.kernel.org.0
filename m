Return-Path: <linux-arm-msm+bounces-74333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2CB8D62C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FDAF4E07E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DBA2D6E50;
	Sun, 21 Sep 2025 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYPg1dRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0252D5931
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438710; cv=none; b=ZyJ+oHCGK8DbeyTTySJp9jG3IeREmpTb8ph/qE8kj/DiqXvbfHRH0jpYFXtKEhIXGRu+vCY3mpsm53WwqpcnT0LHWRmDG4q1qqu0mpNJ7IwIqskQ4xfyFv0CkY/LUH99EoYkD0uwmu1uwnxvWLdC7HDO5+jH53uV6MXT1LrS19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438710; c=relaxed/simple;
	bh=dH5zDy7VUD9yayW/nCKHYujiIfeBm3+RJ2GxQfOniTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsllOYmF5SwJuu8JQvyev1rUIijUqVSRysxc9aYfpNvvv9hka5felJIBf/g/aRXrtvhVbFnS/dRa91E5dSrtPRHhhVE3pZEB3012nCi4EFbQTPH75+BGYGzgAJZQahi2TWJk7hDMFu8JRvnnLnz2XGs6mNNxMP73Y47po+Qs+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYPg1dRV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L4hhPf021961
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqlsjbMZMz9mmyTaernm037BptHePAW+PBRltOEVI2E=; b=BYPg1dRVmmTFlWty
	AUni2WggcyGhTVIRYP4JwbNZQpjVQasxoZoxljL4D8Ev8/X1Z1nXK69WH8tRmdl8
	UUwKVw5CqDOZM71eSfXqZN9G5w9uEuN0xcSk2o6J6EGXWhDzSGIVGYv0vlx9hgSm
	WMcLTQc+ckxAG8AdjptFrgX2ZnbxBrYPrMr6T0kRbJIVMirPA6Gucas32fihcQyZ
	bpKwzTmgnsirLlhUd/sQY0eGZFkW0oBD5teT6Jf8xUx2Qr/RUYkFXiQFH1CKkAl4
	M0P5mOC3ZNceI5y8ktDn5J8A+sYDt4r2wuorimwBNYPU+C3ud3JwNICsnQ8oQOU6
	ty8mLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499neksnx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4bf85835856so64965971cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438706; x=1759043506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqlsjbMZMz9mmyTaernm037BptHePAW+PBRltOEVI2E=;
        b=Httw0ItJgZd03dkMUAazAzR+eoo6MA6rzOL0ThX0l01ufsOyTlWe9KviG4zGdfV/zd
         Q2ngaoW4dm5fsR2mJBQ+iaNeGJngmBRCIJYQu9tHv8CHaNB6w+7U7yDDHCcV79EjObtg
         932k5OjtM4S4a8fP24TN1UxhPqQ2AxvvLuxuGmWWiazyuK9XPMrHKmyAWiCX9VjiPdQE
         liNVfprQ7ueugU2kakMLKeLH1WNVQUWZhQSI+s8HwSQJRsUCcVWF3x0J12GPU/M30MaJ
         xjUdBm1GzpNrWRKk2CBAsCb/LB6OqTit7yPsjH4AzksC9OIxZ6jb/m31NvvHd0SO06QM
         hc4Q==
X-Gm-Message-State: AOJu0YzdWnOeZw5p+br0RdBCHri95N0CHKQoFp+XENMq+Fop/G0a3TzF
	RrJP7cMz6fFObiv9uTT1MayCKpdk8ov1wVB43b7f7YAcZaIJe5gwzLsjx6jPATRqTo1rfB9j41V
	9VAoXa8bF5un7fOiu4iFH6fbxWgSOEt4MxXSzWUlLQVYiJ3vL6WVcUvWYul6+wi8WP9r4
X-Gm-Gg: ASbGncvhXtZhuoPtUtnqyDV9cSdCmpGnxu2dj4QqHEIf9LGKHh8TDo71vXPolRrcsPl
	86UMLfPoj8X6KXLI4BZm6RVY3GZbdmRGlPw4dK6HYzn+ESiI1npnkjDRpnHFWHqxKJB9LNV/LMu
	/6+erI7cO1Qal/JlNre/QOFOLymAbWiJJYPtgClrR4eBd0+0O3ECBhwSrVtCXzsuWaZFB4Bi+Ka
	Y6NJgC8prvFFDOd3gmNDLWxmfGVZVG/hLtVAR1fRLPJ3bESd1WNznUcpWEAvSWUGFnjqW+fK8jE
	ZCGVsJwDphB6TLXPZ7aCq5H720Fvwsvli1C4hmSXl61FXu+IlXU+uuYt+taN3mdQ6sUmKFdTeWM
	AJi0OuCcuJxHycj9xuaWcmEg/kdYdVA7f/UuzLVRpIRu8lM+r5Twz
X-Received: by 2002:a05:622a:180e:b0:4b7:a6c8:86fa with SMTP id d75a77b69052e-4bdada0c06cmr132862451cf.23.1758438706378;
        Sun, 21 Sep 2025 00:11:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUoC202BESBSIni7Km8zPC/R+Jmp5Eq+quRe+JB3CuOKMttgECu0oKP5uHWqThBOmZMU/VlA==
X-Received: by 2002:a05:622a:180e:b0:4b7:a6c8:86fa with SMTP id d75a77b69052e-4bdada0c06cmr132862261cf.23.1758438705912;
        Sun, 21 Sep 2025 00:11:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:24 +0300
Subject: [PATCH 08/14] arm64: dts: qcom: sdm845: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-8-9d93e64133ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dH5zDy7VUD9yayW/nCKHYujiIfeBm3+RJ2GxQfOniTc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6Uhe/o0A4HByjbkgdx+p9sBj4VI+bHYfaFi7
 jOkdpXJ3jGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIQAKCRCLPIo+Aiko
 1cYeB/9zKbrlRUuuyFA+pgTBBPi1w2zvemFL7Sfdj4us7bG6C/HtNTb6WN6zIqVCZA/ke5lHN4L
 tEBdZqtL9m5OE52djh5iRClWLT9STB7t1wUA/2OYbTvNEkKEJ9uFS2AY5WdH5qJqSvXuPgDpVLs
 9lSyW0D4HWkhzqSK8tbhU+XWe/Wj3qX/bP17v2sDQx5BqelCzT8z9UTKQ8mpZPrceuzrbLRzsfX
 DVwCROg+4Qb5cUvlG58jYlm6YPTxkcyPrgpcvqYkU96nP+n0x3qAUmNBgH1NDl9rrT6k8C8Mrwj
 MeYltGf3R0tHi8rTFmmZfQJSdCII8FRg7g7zWj5X5jqvabYR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WAiZvqZypzmyBmqAaf2pnPGLf2KE2DhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX+XTZg8LUG43i
 ygl2WcE0kFSZrh3RziThJlCTx/3Xvp6SaDacJ4OcX4UXBop4voCUB8DOmYWpYxnV2I1VnMrwaRV
 0WvFqMMw0D31i27Al07gbgD7I1kSxEcg6VrzuaGXFrIbzUepHIKXgHBz3zhSv9KKcWpLHgSr4o/
 efaEUlRCX9mDMCFVXwQpor5RZa8c/btVoi7l+vCdIQuOq3Nt5YAPkzUxiRlu5A3MnSAQhkzZFLx
 tAqalf1z36JYHazSI69pXN05JYzxyUMIaULT25TtC6MoS4FKPROUNqlJfBI7TXl7lzcSGiXHUFT
 dRLEotuXzE/hj7zv0YS090CYca1YKB3VEYPITE7ugesJtRkv/2ZFoZGa5lEydb4Mfux/sQvJR/1
 NgSh54dh
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68cfa533 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qPKPcSrW1Izi2Xt96l8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WAiZvqZypzmyBmqAaf2pnPGLf2KE2DhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041

Add the refgen regulator block and use it for the DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 13c9515260ef171121607e1b8434f64c4934720f..1c3a7371a2d371f78e13a5b0bc400f79c62d210b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2218,6 +2218,11 @@ uart15: serial@a9c000 {
 			};
 		};
 
+		refgen: regulator@ff1000 {
+			compatible = "qcom,sdm845-refgen-regulator";
+			reg = <0x0 0x00ff1000 0x0 0x60>;
+		};
+
 		llcc: system-cache-controller@1100000 {
 			compatible = "qcom,sdm845-llcc";
 			reg = <0 0x01100000 0 0x45000>, <0 0x01180000 0 0x50000>,
@@ -4750,6 +4755,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				phys = <&mdss_dsi0_phy>;
 
+				refgen-supply = <&refgen>;
+
 				status = "disabled";
 
 				#address-cells = <1>;
@@ -4824,6 +4831,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				phys = <&mdss_dsi1_phy>;
 
+				refgen-supply = <&refgen>;
+
 				status = "disabled";
 
 				#address-cells = <1>;

-- 
2.47.3


