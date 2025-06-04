Return-Path: <linux-arm-msm+bounces-60243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F09ACDF6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F9671677EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F74290084;
	Wed,  4 Jun 2025 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQmiL6DG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9128FFE1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044436; cv=none; b=RRSyUaDpYcjELMCJEc1G6To0gUUPty6uKfxqXnlqtVAQZg0XFDaFaj29fwaBymA67H7EYeHCEs1BrwjFe4w0uWiKfJgEQasgNvKT7BGrBYK95Rq9gan8bPGpeeIDes3CGXINn+1vNKF+USuXAxj5K31Imes4sg6GYTShUEeURBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044436; c=relaxed/simple;
	bh=7u/4WQVJV6Q1LUX42Cje1CNsKlezzEWMHTw7z3WPsYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOYoBS822qKBuryYv2ec1Sqc4Ywp+xRthRKPEtXOVCtjFS0cMwS4EpLVlUoGBy/w99VvHM6P20LCA5OKQ7IEKLp58IsbIM3n7HOjVwH+XWwk7ij0Bj/xANGhRU5ct3nR1iFd+8KeI+uGWovDvaReF8PEn9fyUxRHNS0ZPamGKqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQmiL6DG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554Ahnho023019
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBg9q0cvHs6bBUW3z+GWBUixT2+oyHe0R+AnONY1DwU=; b=GQmiL6DGk/SNrXwo
	PRnFeaxnyN9WWKQRFRUlx6Lws8DgRvjN4egTrmsCIjS7TAdKyY6s3sdeFdvsZRul
	jszQl9l3SqntxnljW91cMqRkNEtPddtxa9mp5afXqiFbOWNP5XcxtIQzoqfyAKVo
	+7I0HDko3m59f+qXUXeWOUboB4QYuwgNIkTwBiCMJFDTPxag3CE3CFZm+SD6oIIc
	1eN6zNePR9y8umojS60FGsUa9ypchOKq86lDsvReGXl9fdUOq5l16xsc9UAARtDe
	u4+ICVbNut0c76Qj8QeOruIzdQCoN01BZ4yAfQjXkugHweaS5p/ireqLs44K2GWb
	TEM3/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn00ej5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:40:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d2107d6b30so297697885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044433; x=1749649233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBg9q0cvHs6bBUW3z+GWBUixT2+oyHe0R+AnONY1DwU=;
        b=W/61sZ7c2JW671FGZO2/ICSMh0FotIU32tKKJjTrm9EBefXhWqwucxlZUiL+RMn+J4
         pn1OS+0qa2HcYAxVhppFLYp9JVmTUvRYQhB4rY4/fQhmFvlzqBLwIaHbLWCQMETKtM6f
         M0DuBRYPwOFO+luB32Y4Jd5h9BBgCn5/binofcMWpQ3JYvAR17CkfQG3fRQfzZud1owN
         46xENHu/K51c93lxpKr/q9yZbO+9PPDI4UkedRtCui+E+3/AZU27KZVOqwaK+2Y2+0Tl
         00Na3WXJjy4zzctMxWt0/xg47bv/J+yu0gZCjv/lQirhSDxPAIOmBHcAhxOL/afUSzsJ
         zWiA==
X-Gm-Message-State: AOJu0YxzU16oOQNyAl4Hih9DgCxiiCEdYRkYfXG/IvHLi9I1CD4J8x5f
	l4XKxbfGs4N6iha1dQl3cOTS8U5qwzyytah7+cfRZhn1yNKCtMRsEEJhQwM3Mj9fSXUrs2LU6Gj
	0xbElOAFFJULBrq2OyDQWkjT+Lx9L6OpMgGXV/FJHoWMhqzMRthtMSN8ZOp0hUoqPKqMa
X-Gm-Gg: ASbGncueTtdQBFjr3zYUE9IkOXdjTafGmrxp6WcdkQAiI/1MBzO+Bb1zoeUHqJN1CuL
	FISmx+AMifXD+8jUrTqEMppy+HSIMdbv6iWK94gUNQvUsQ5ObTITfC96HzxPrZxghgJAVlrwabO
	8v4xongk4DadXNo51nEMMKtobkeDyIHNEXD5QyqQP6njfPJz1xGLubXzhxftPPnmMOQtn2DNLMt
	pDd17HFoCs8olTSA0nQMn+Gy8wfJR8+USFpTcYbHAXHV2hMs0Sj0K7YwX4QMteSlnaget5QzVhl
	PIK9LjnJEtL3Nur1MADi1a9fll22/M4xMJL57UWyF6dFkNrRJZBQ3ogHb/5p3XQ7vpfebEhjbP3
	iH50SiSPyXVPRit20QZK1c2XnXpbf8bSBKpM=
X-Received: by 2002:a05:620a:4050:b0:7ca:de42:4ae5 with SMTP id af79cd13be357-7d21a8dd0e9mr391901085a.55.1749044433293;
        Wed, 04 Jun 2025 06:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgZhKgR7NcsV4gPQC4U7eu5LVKicEIGDkAGddV6FnPtO2Ourto5KqAILlFQpTBuMoKbS0SYA==
X-Received: by 2002:a05:620a:4050:b0:7ca:de42:4ae5 with SMTP id af79cd13be357-7d21a8dd0e9mr391897485a.55.1749044432931;
        Wed, 04 Jun 2025 06:40:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d376sm2311966e87.28.2025.06.04.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:40:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 16:40:29 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-qcs615-sm6150-v1-2-2f01fd46c365@oss.qualcomm.com>
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
In-Reply-To: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7u/4WQVJV6Q1LUX42Cje1CNsKlezzEWMHTw7z3WPsYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoQEzNXkMSHwY0jitLtwQ0+uoITJ/85YMiujGcJ
 HJDAle6PTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEBMzQAKCRCLPIo+Aiko
 1bXbB/91MD2tZapdUU1GIwKguEd3U6jlN2ZEeEYIK8zwVlML/LAAr+Tem483yqFnkRBx0mExp4O
 jX88ZuZI7fNEmyOEMXfWcD3zrKTWhUiW5aRHnEx6nPK6oWjFrDncwFEzkuvYPePKegmDgB1f07i
 kY0hwhWp8zLclmzGHiU7e7sHTrnNzOMKp3tDQ4cIIKH2hBK58H2dHkSSZtRnwUbKPl2Vgkwt1LO
 ihscXU00+TGkxlQP97IzF7BfnCFYNpIPgKq0/l1+k8/PwJrOoOTeiMXhL2twEjEk8jreboF+hba
 ose4Q85w5lgNy21TLblskiO4acH7mW8TxPRz0dmOB8Bq0eiz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: y4-eSHabPN90IcA1xfyYsOsR0nX7B0U6
X-Proofpoint-GUID: y4-eSHabPN90IcA1xfyYsOsR0nX7B0U6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMyBTYWx0ZWRfX6xkSyt6ABaVz
 Z/nctYM5tlJvL9ukYzYIzN8dlX08FifvWDGOaoM/tujs24ALhYW0jL2kqCscwfG2dfUNrcsdO3G
 0leQfcjpMvvK7mFdrYVlYjYuDefcP99c6JI5XADQWdtVfODp1/dNbyk5kncLFIy2dwxKJnXb5x+
 vvaxWok1S/8CKOFyd6s9qvaV6QHeIO33u0wNy3ZmH6ACoacpG43Fb1qZyrOs2ZSC1ikj/bld+S1
 gURB4mz87z/vscpB7QUNrZPenKvS1flYNaB+EKo7ZBh+o22i08k0haD4RcOQ9WAKfjiNizU5FP8
 HZw33u5BSAMSQKoohaxHbEA+T/MglQaaSS73oZf3rgPdaUUq3KKa+eGOKZxPI2AOGMFvhktnk3n
 8DdUwR70FDmdABDEh9x+g4oLhcsTUsRjfO881Yzm1jA8V9AdEMdEV+91nZ6BARkuj1zYlXBu
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68404cd2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=F4Sl4XA9YrAWyvOGJFoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=981 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040103

The established practice is to have the base DTSI file named after the
base SoC name (see examples of qrb5165-rb5.dts vs sm8250.dtsi,
qrb2210-rb1.dts vs qcm2290.dtsi, qrb4210-rb2.dts vs sm4250.dtsi vs
sm6115.dtsi). Rename the SoC dtsi file accordingly and add "qcom,sm6150"
as a fallback compat string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/{qcs615.dtsi => sm6150.dtsi} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..c8471a2c56c5be0713c1678b2dcc923d69296db1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -7,11 +7,11 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/gpio/gpio.h>
-#include "qcs615.dtsi"
+#include "sm6150.dtsi"
 #include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
-	compatible = "qcom,qcs615-ride", "qcom,qcs615";
+	compatible = "qcom,qcs615-ride", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/qcs615.dtsi
rename to arch/arm64/boot/dts/qcom/sm6150.dtsi

-- 
2.39.5


