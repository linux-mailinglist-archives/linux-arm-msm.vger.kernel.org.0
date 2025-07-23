Return-Path: <linux-arm-msm+bounces-66385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9ECB0FCD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB163B223C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64C5275AE3;
	Wed, 23 Jul 2025 22:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGz4FBZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCAE276038
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309692; cv=none; b=RR/yhRQtxG7yJT3r/nSShV1QH0dPJjKlEtL4+1i0G4fBcwYX8pi8ZPT8m3q9OZdOdqvb+OKrtwLJIg6FdSDG4+SHS/GRZ2vN0Ibc/+rC5OH5sGhuQHvtMdr69BZWdNMTSSudzDRwJSbnS/9XVQM84N8XHrsTZ+U2r5jhuFzCcXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309692; c=relaxed/simple;
	bh=yobzcPhDPsx3QmD0kVHyRLZVUVYnFWtqbqxe91ClODg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ju9z+yLjjmOxPxNVQMQ2TAk+JmjU0pfJPoeLrjTvxwR02c8/cpE6e6/Do7YR4pCSkxzb17Z+/DLzKzB8cYhOStlkJ5rs+jCN/LUM8YN7vv5u/mnrD1QJQeMmFL1ArGWuiQ2xiqPHmayUuAl3oov10iDWGRphBsFUBkxTv5c2Pf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGz4FBZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNkJd019654
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uNoptDQOoGH
	5/qbqlWTcuUXpcGcDADyQ6sTSlq+vtbY=; b=DGz4FBZHToUFYb2dYtqHAfxb1Mf
	BBRtIq+CjRzh2u+w0c8yyethd0+OhrxQsPwtKdo522acRs4APkHdaAayXRS2/gqQ
	xCxlEk0uoZElpOSP2Vvd6OwuEDkPwkkhCfQmF2IdIuMEFebzWiDgS9dL1enHqZPe
	1xlIftSYyOjNXBVAq08A08WFKLRNlueWYWr6i+ScwwI6QST1ULFz/mpjSMd8iv1R
	tESFyssUWiKj4huKbowKA9GJdaDzoQGLrbaBIHth1PeMg7v6QQUFhD3pj5mP9H4Q
	mKcrEKO7JbdGQjWVtA7/auEHFSH9DENNKacLQRFqyYRaA5Lr0jRYurhRn/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379ru5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb5f71b363so6313786d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309688; x=1753914488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNoptDQOoGH5/qbqlWTcuUXpcGcDADyQ6sTSlq+vtbY=;
        b=AbWSlVG7KJnVp+KsHIt76mVGa12A9NjASXkgOt9TCWd587bFW8qSdWqOZRvvBz7ge/
         Rpaa0v/Wq2OawpzGMnLY/bVxaAymgnFk51YTb/dHXMe4CcUuSMUVWPcz2zoiJhhDmUNX
         J+rLHnCIJaZ7ZwV2zWfHj3nl86gqYoGXEXL9qTD7H7lsDdVKl7v5yrsIGTMan6KNWYGl
         e1kXpMNi2anrK2MU8SapK/InEnB7epNUuIwlqtRPxyjHLsAyPBWUV4md2VbhdLMlyVyM
         Oi6Vgi14hIT1hWn2ppU+3O+W16v0I/PnxD7JToHP+B6JWuYaYc1Jdkkyle4kit8fxHiX
         FOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpWFnEMs5hCdraCWhxvL1vb3CpPjaRQ7+O1t27ABk5MdfV82jTBhKZkJJKw85mgAG8GGunGi8C/0RsECGf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mNrRyuvCHx1hSRPIfuIYiYxCDX+YfLReBPXNV3Hzb2VjvvDB
	kDha/LbEALaGslvDuOama298NVWjYnxlki1Up/C2bo0XHxHCN04h1ChcuXc2sYjDWNtN7nWAE3h
	TDkbkuVEe8Dhoi82i+qvpScXjTz68koxtTyF+Y77SEufPzZdSd1bB6jUfnqMO51EsYv8K
X-Gm-Gg: ASbGncubzhcOJSU/uSzBlLejDPykcXScTA6MxXmPLWIGynnkETPeNNX2AAdysOqvgcM
	FIB9rzeIt/ekAKNysDSwsmMF+HvnBgI6uTfiAnjvnJaYzmom9vLLQA+Hd8EAl/6BXqmqzrpQj9j
	aKd48+sIkOLh3yoC2RS9evOfR26YLpdfxay4EZArhxtDnbbb5cICZBihu6aVJi9gP8F0+koqDjT
	JI8p6Dcam//cRivpzvbNIGm375NLXOQ8n6X7U6kJbjp3nGb5QBthrA7uMf3/tNjjb3uwdSz/Qqg
	0uDQn5U4nQekGMK2Iuhe9Y2mQdGi6qShHGOAg08PKrwMod1smT79CQ==
X-Received: by 2002:a05:6214:27ee:b0:6ff:16da:af20 with SMTP id 6a1803df08f44-7070057fa80mr61767716d6.14.1753309688108;
        Wed, 23 Jul 2025 15:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA1olTvsjgTxjepYjcxQPclUkr/pDG6NmpaFEtaBbkjDPuXxMflIfuyg82gJYC8WmI1r+93g==
X-Received: by 2002:a05:6214:27ee:b0:6ff:16da:af20 with SMTP id 6a1803df08f44-7070057fa80mr61767476d6.14.1753309687688;
        Wed, 23 Jul 2025 15:28:07 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:07 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 15/23] arm64: dts: qcom: msm8916: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:29 +0100
Message-ID: <20250723222737.35561-16-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2gtjaNNb7qSgpZ_lvgacvkRcZC8pMZMl
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688161f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=W1AQwb2gymja_ggdNYgA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MiBTYWx0ZWRfXxHTrrHUYjXgX
 6aYWWSbt25UJE6MkRbt8XofzODZiQqRJ355HCDco6tPW6z7cO8N6dUx170j8s8Lr8tjbNDDU+9T
 CAuTDlsEHMbj/d/hKHJGsGV9Mz00exMxVnshTevKCt3bivUHibOIg4Q4Fdxqd05mqJ/lUgKf9dp
 Kr0uIUGDIIvrRTAA+tTa+ivs3/1rm7tBS6pRYbQMVVpTrRquP54BpHzhQu8JtcDoDdiel3fUHuT
 CVt6HfpVQmXbsRyhr629ch56Mp9AU2TgByxPQBQK4Rh+XR1pVjwoNDtUj3ZUqorYzeyJL8zoaLl
 WtfbkUq/v+h4umd1Fv+XTNsqPkJ7V9V7RDUAiuV3Tdc999Z0Ukh2UQYW0FYBDlXEboDjXM0BaMK
 aXmxyjylKLGq1uj+CdTULIxZWZGmu7b3MdaWGhLGSlhRawklv7gn6hGZps91yI1ubmDMWltT
X-Proofpoint-ORIG-GUID: 2gtjaNNb7qSgpZ_lvgacvkRcZC8pMZMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=583 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230192

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-audio.dtsi  |  5 +++
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi |  1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi        | 44 --------------------
 3 files changed, 6 insertions(+), 44 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8916-audio.dtsi b/arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
new file mode 100644
index 000000000000..fe17bc28e825
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
index b1a7eafbee31..c0a48692c100 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include "msm8916.dtsi"
+#include "msm8916-audio.dtsi"
 #include "pm8916.dtsi"
 
 &camss {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index b50c7e6e0bfc..6d9807adc618 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1997,51 +1997,7 @@ smd-edge {
 				label = "hexagon";
 
 				apr: apr {
-					compatible = "qcom,apr-v2";
 					qcom,smd-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					status = "disabled";
-
-					q6core: service@3 {
-						compatible = "qcom,q6core";
-						reg = <APR_SVC_ADSP_CORE>;
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-
-						q6afedai: dais {
-							compatible = "qcom,q6afe-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-					};
-
-					q6asm: service@7 {
-						compatible = "qcom,q6asm";
-						reg = <APR_SVC_ASM>;
-
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 
 				fastrpc {
-- 
2.50.0


