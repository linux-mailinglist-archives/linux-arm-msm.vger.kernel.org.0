Return-Path: <linux-arm-msm+bounces-74514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0214B958B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 13:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631EB2A6017
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 11:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3443321268;
	Tue, 23 Sep 2025 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnOabaAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987628032D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625337; cv=none; b=W1UyWvvEd1it9l5HFrWnhe2BaavP5I9nUy/2sAxcNumQFZp0c+ETtQNgRkvNmZUHXP6WG0XgBEeOO+2bjXJ2n9SSiXxfsKqI8zRKBCqEdyF97VPFscoije7/dAKL1uekqDDu5cVj0kMtvljVX5vn6jfXeSK5zBGIAbTTg9r/mwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625337; c=relaxed/simple;
	bh=iLMoVlJmYtd6HczEdyExEbXAySwZHYx/WHqezGjTXaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0JqhB9IkP//HLAyAycH+cZsSSAR68T2qK2xcZMA+OOqYMpAY3pKN2+dI3qj+gTi34a6vLtMilkOVs19Ltjiy/gckXWnVVOBbeHRbleHLVkTy7YVpGSJqGklYtdH88UZA3nSYJ7ZkTsXalYjVA4+b+DTXR3tr8nA4Qhk1uFZatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnOabaAs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H5EY015973
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OwBCFG306qly1YwPCrXWNZ696eFbdWgQ4DKgQjVJ58=; b=SnOabaAsWz4fAjNz
	qUaLCTf4aamHb8zY7SmNh6wWcx3oLgl3w0rdG6QxCylwH8ucpPVRZzieqXHp3dI0
	N6mHs4zcewGyQUKQz1YKXF21iHb2ddjDlOPkdvmgKEe7CCx9w1cDLzPuPYcHoHih
	mKMp01GmzEJvZz/hxuBQNxLWY+hjAIp/PxOMK3VzXtR78YMVLy6L1qJvwzwAj9b9
	oGXLS0QqRJvmmIx1CYVFt9oxbhY8/85X+0we9KdlEsy2JYNssZPmZu3O2jL9cGF0
	ursFMo3IHcNn0k+U8hmjckrP7x+RhRS+J1wc5P7caxcnQeOOVQ2u+nGIkgyGEPXh
	6zJbgg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdseq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:02:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78f6250f0cdso87712326d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 04:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625334; x=1759230134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OwBCFG306qly1YwPCrXWNZ696eFbdWgQ4DKgQjVJ58=;
        b=UuFsg5pBAXgAPBe/CcHZC/8bI5mdz2p0MrQyt4F6tj2lwqmFh4okiYEUTW+leL6FMi
         xsW9J+cU8qqlRT1htB/PI8wLYGl1Q8IhuNWnKQU7cSs3taBTyn6T5js6797r8EFiwPv/
         ScGzh1+FnIm/GUNTpIDkqZ8B4pesiYxQMgPpy2m5iTloEt80/ysQ73FP18XJd+kE0Yy8
         AP8UbjrAaEK+iC5ir406hwp1K3Zzsnjy8jbbdi6l+T0RD6xy+kA2aH1QOFvKKDDjmZCe
         gUEao4lWvxdjo+Um9vI6E9h7xNT57/61olOs8U6VD7VzwTE1cqCIrzK0y4TOxPyhHwKU
         HufA==
X-Gm-Message-State: AOJu0YxG+TFGbUw/2FzPLTri02hzr3gJCdxB7nO7SS1NBhEQmiZEAe4b
	QByhUYIQmVKa7rGf4HuqPcco5K3Kvg8uIjI6hqjx6lIrCXbEczlPmfQyFLGIqFwizbTd6xgo4l9
	bFanpvo09DMeSo8mgGGbf211wzoizMaJ7MzUM9itcMKvgibc+uKBzkcJ648RCgXY6lGHO
X-Gm-Gg: ASbGncsbeItk/xJOHHBMG/k3UWiCQCRsKFItfHLj8hfpQYe5IKNsXhPtf7uOzfReZ2r
	JsrYkdA31y44N4vJDY9Art7dtAqP+QwiO0aH+uiZEKrRPAW4B2WTIscWKxer+rkNw0soYg98+Sr
	McTN9Q5bww7nQFPboKRO9+DZlwXq6626u6vjYH3zVyTtMRDAKbF7nFty2dzYoGDDsX1hlKMK+QA
	ElzWwcOhvSIPGCQwETxI8xTBNJ/gnoghwycSrOaJ9A12D1xUIi9SGYvRm1IpBjS8ZO6u3ZBc8f2
	11VwsGxYVp4dSAyHMWFyCWOd2Ay+MCueIGK5S89FpQ6iJgNXVi2lMlRR3Zahm2QjUT6+SxR/UJP
	9azKv4B60TzMEG19pFd+YIX+z+59DT6k4I0ZzOAIVsyoqzfOdFez/
X-Received: by 2002:ad4:5ca4:0:b0:795:cb4a:9b7c with SMTP id 6a1803df08f44-7e71582ac99mr21921126d6.35.1758625333703;
        Tue, 23 Sep 2025 04:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgsCw1vfrpAdR5i1dbQBrqcURljcwF/F/6Z1lDZv+2PnzCx0GYBvjUf6cpkba5O6048hfA+w==
X-Received: by 2002:ad4:5ca4:0:b0:795:cb4a:9b7c with SMTP id 6a1803df08f44-7e71582ac99mr21919476d6.35.1758625331346;
        Tue, 23 Sep 2025 04:02:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4537csm4075975e87.27.2025.09.23.04.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:02:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 14:01:54 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: rename qcs8300 to monaco
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-rename-dts-v1-1-21888b68c781@oss.qualcomm.com>
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
In-Reply-To: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLMoVlJmYtd6HczEdyExEbXAySwZHYx/WHqezGjTXaQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo0n4wGvN+dWIo7sLxDKaAwiz8WW3t2teh9HSGa
 NkEC1KBpvqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNJ+MAAKCRCLPIo+Aiko
 1bonCACGVxHN5ydariXpov2ySAg2vb8owrTn53HKYFizfb2RNQwOor96v/5kugFAX9DwckYduhL
 bJhbZ2J5Vh9lXvXUWMkvKtv+9sB+Gz7AMrNK1FIkguCqYseNRhB5EL0xbOwMTFTFDG67LlhqAGE
 bbPZ/3lw8TlgtN7ZwprAkIdRYGfmhtS4rjU1LqoLnlB5oilmcotjAb0Cg1dlOxnM+SfC/M+tbO/
 eglOx3/+TnV/kHUnsnwZXITaKsBiGOAOwpxR3UVvBP7yuNU9vdUT9nNV8bggRPJpn7NGpE+2DCN
 elUEqkVlb7uyZ4nWSgT7C7BOER3MqrKDgm5PrAa7BHDgM/8n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QLJtw0tmGKMFGCUjZ1cFphA3dMWPrsMe
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d27e37 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CGs7eBeCNeLIcw_ASWkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: QLJtw0tmGKMFGCUjZ1cFphA3dMWPrsMe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX5DXA/UWe/wsa
 Ks139c+JNflIatay5MGDAGppyv4REb4diaFCyVROtUXypIt/nHfIIMBD+Eiq6EMP54fgiPppVDp
 O1cPx3NmODRN36CNvc7mS4uUH687QyOSxMxoNsM/ZOsgJikfSOY+H134XjDeSnwbxqZP9+9mPS7
 shbwbCDXr95fBxp4nIFQuq1kiYIJ1Go6Bbxwgm12ATbwqio5NTQnM/OklRgy1dAO6rP8s+lpL53
 7sSbxVj26TkzKisZrN0R11t8zbS8ALR1uCDnankDwivXPlIWsEE7QBWGOWI5YZKGWvEnB5V+IdD
 at2iA4kWnfc4fh8Xgke2MGpWMoeJ2/NsX1egymCh806z/dg2/1vbVBqMfiARYHoMhNCCGEVJjFi
 o18mWjn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

The QCS8300 and QCS8275 are two variants of the same die with no
difference visible to the Linux kernel, which are collectively named as
'monaco'. Rather than trying to using the name, which is not always
relevant, follow the example of 'lemans' and rename qcs8300.dtsi to
monaco.dtsi (and qcs8300-pmics.dtsi to monaco-pmics.dtsi).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts                            | 4 ++--
 arch/arm64/boot/dts/qcom/{qcs8300-pmics.dtsi => monaco-pmics.dtsi} | 0
 arch/arm64/boot/dts/qcom/{qcs8300.dtsi => monaco.dtsi}             | 0
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                          | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index e72cf6725a52c0c0e017be800bfac1773fad1059..d9e9e65a137da73645aee4a857688a4730875347 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -9,8 +9,8 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "qcs8300.dtsi"
-#include "qcs8300-pmics.dtsi"
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Monaco EVK";
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
rename to arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/qcs8300.dtsi
rename to arch/arm64/boot/dts/qcom/monaco.dtsi
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index cabb3f508704bc9eb0038bd797cc547d0c8cb3ed..9bcb869dd270603a34221b905f0946e8af028433 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -8,8 +8,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "qcs8300.dtsi"
-#include "qcs8300-pmics.dtsi"
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
 	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";

-- 
2.47.3


