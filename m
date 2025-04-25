Return-Path: <linux-arm-msm+bounces-55706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D90A9CFFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52DD87BBC6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F8F21C184;
	Fri, 25 Apr 2025 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPQKad8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A8E21A42C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603247; cv=none; b=onJ1p+t1PM/qvaewWFw8/49sG2bRxi8UK7ALxYY2iOlz8/2SfP20SjJ/sQrKMq/6OMN7Bz4+lsrDaRjY8z6ivu9m5s9Z8EjMkISHtlWRzeA9qZzBC6eKJs1g0miSBrJ67xFjb+xbDE1SQE7P2ekCwivJaoBCigZaIf+G4NSp4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603247; c=relaxed/simple;
	bh=FDMCvMj7/PXLNCw1GpXL+w9RnufE1DoZqoZIjeR8HUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGeEf17bj9YkeYKpNrtxw2ypkEz3GbBlg4VfhxgiEnm+JNh4SashCH72nAvLyBHQMhTGh9VceeTn0sTmDJjYvKDjedaVdZgkSXRiyXVQlkRlgYMnIYKIUtavjyh2/RrLmFj4tDG3hZ5frNfvL6G4gM6KSUxsYRy9ZA5ILUg8WS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPQKad8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwaR032069
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=; b=EPQKad8hO+29ci5N
	HJSfcbOEZie5Zo97e1xlAqtTeSokTebKcepERYbR3CIiNftn468nuauTdYuAC4AM
	yxpHX3LkNSDtIyudDRIhAHTt55kTnQkAWc+mlGZQDUyDWRAAxVvuOg1yXLC78vh4
	6MGaT+ofKWo7DnWLlmrqruCmgCQBVgPHgDTH7ZlLMitNshPapGRu1+MHpgEsmrg9
	caVldj/irbs2dMDQgjOGMIwOINIg5POo0w3jNGKwcDZaTbBfVI9LGF5WPy9ygoXD
	Q59l0wUyvWUpDxQgN/p1FJ9S8Fbmkiv6+XK0aaFc/TKXuP1hZMHl8FQfPlecqcXv
	i1srbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19r8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so507422885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603244; x=1746208044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=;
        b=UDCoiriUCuZnXIb2ZYBVPO8O1DHhsE8FeFbZO1a8+gJ1dWh8ntbQaBK+l8WAzSFw07
         bZXYBUTgZx5O+hPy+aYhV5U5W6pWGDoVJun1gRbMung6tcUh54GT+8UC3o+VMjE7X5q9
         ASv3oMTNmqP7AaA052l1fw5wdWOoLgy+Oy3+xBTvocOnUtY02XWeysBmhnW5czVxIQc6
         nmJLkxFy2jgrLIkWrxtAxOHH7Oz7AxvK5AO6OfMefk0KxxAYj48Y4Z77UC3jAH7siuqX
         PYBBBBMBPRMaxBs8bQCpxFIyqDdPb0+JVKeBO1KEU92nXrAGBqPN6oCzAPkKfuLTJ7AZ
         ZbKA==
X-Gm-Message-State: AOJu0Yz8H9GpBDSm9k1sc2+Z0vC/XUVsSJJ7AnFoDR59YuBzplCM7Xqw
	1x2I51sMmoEXIoCNVkgUbUn6s1SDs5byzpfTMYOs4QjvknKLQJ1IceZsb7Bj4dnYu7cBAWI21/j
	Z5LjWDLGkPcsF6xIZosabgfHh+3BPx7SSVEUVbe054XY76wZoM7rX0CSE2yeDaN3u
X-Gm-Gg: ASbGncv5gL8jMqQHMp/6WgI9rK85SxKu9rqiIZgvXhxu1mp9yK8XYP9S+h2+kF8YcqG
	vIy+5RZWM6e7HR1QR5o3/tB27RUvmzG/al8EKqG7e5u5hNysfQRneiSpfELo15vib1QLLFC+8io
	hNGEr+Eysw3BIiGTEsRaAZZDpTiJz/jlMIPGoUS/+y+xKJz4VnblM3/rcRigFJmEQOyZzBCjm5H
	/ZR/wiNEldlCi1Iz52R3bnBX9LrneSOeiTBxRXIxmGbrM5O3h3QGhe/qTaoKstyEgjpoy/6oWlo
	0NIIxWRkwSnH+nrbIBByQuNKk0c+g06mYW1ys4ryJy+GLoVxWgy0HJ91VsOCbMPb1TgozYM78I0
	YmEYi1WIh0QVQpVjYnFkbCIJ3
X-Received: by 2002:a05:620a:1a17:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c9607a93c6mr549159285a.40.1745603244005;
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGNeIVbm5YyYTfo1SKrEUDYFsHhFGijcH4+jq9I2UwLvyQSPV6mMmcDq5lpZnJqcOChctv7w==
X-Received: by 2002:a05:620a:1a17:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c9607a93c6mr549154185a.40.1745603243628;
        Fri, 25 Apr 2025 10:47:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:08 +0300
Subject: [PATCH v3 08/11] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-8-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FDMCvMj7/PXLNCw1GpXL+w9RnufE1DoZqoZIjeR8HUU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbVivJ80tpTn9sHqosHf+sN3rHhgA6TY50R
 EOHpfznLIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1dZpB/9dbNHoyODZwnrfGxWAw5+Tm2ncq2NN1i1DpQvJuLY9y/mELKHs60iMFDnQlZeqZpZ7CO1
 XqPdzr8BukLZ3f/b7hUZRB5nl3nkZLm6iWF49Yeb4wDvlogAZmPMWMBUz08mzEFMekHaxYyPk8Q
 ogA5lM5KszNsYIPF0aGP0tH1urvsEAum0ujEOqvP6vr7IERpq/gYqAvrgx7oIjbaAfJ+BluWgjd
 2CqZ3bsmXZBt1Va+6CfVG+3RWok+6PC0s7JrqbwR36bQdNYPj3z7e16aiglwcJzlv01GPRYDFkL
 UrJGj2qd9oH19OfMU8WBVnFoCxlMAsbn+qOyCbaCs2VMTtdD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LxkjgfHSoBoamFcGMd11X8_XhRNbUH24
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bcaac cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LxkjgfHSoBoamFcGMd11X8_XhRNbUH24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX15OSmLlwnz7k QzZKIVBzOqTwVeKjo3ins/gCx/MUDBo00wbnDyFMlUXXayiWPJpgAJCK/EqmHcAZ7hzLzOAqG23 uN3ooUc9IngdYabhILvWF5uHsWbMbpw4hDS403kuHpmduEPWKFfe08AJSGd/tYkzRyz91ruHrCJ
 TL4O/XtWsx4oLeCrYNqCbi9rlX2VZGIF+c8vLYXqN+2FNR8MrDKvZPpPFcJXSMx08ZDZWTU6V8S vEN1NL66IuSDrkrTAeYj4DmWA0HU2h44fTA3Qw8IVER/CMlTxsJDnHh/IyL+GHlJeJG+ph+zDF9 XstWpcMCRkaMK4ExsjD0e0AEKv4zpBBzUNVMepU/OtayVCr/0dCNJsIUSpr/iEd7fz6NDY/jYAc
 l81K/sZ8D4r4jBOJm9Jo0WqH3qZDRDfxackjTl0002BgfB83bpTpBK+hdDQN23frRGaREhCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=695 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

Follow up the expected way of describing the SFPB hwspinlock and merge
hwspinlock node into corresponding syscon node, fixing several dt-schema
warnings.

Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..41f8dcde20819b3134c38dcb3e45b9e5cc24920f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
 		};
 	};
 
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_region>;
@@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
 			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
-		sfpb_wrapper_mutex: syscon@1200000 {
-			compatible = "syscon";
-			reg = <0x01200000 0x8000>;
+		sfpb_mutex: hwmutex@1200600 {
+			compatible = "qcom,sfpb-mutex";
+			reg = <0x01200600 0x100>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5


