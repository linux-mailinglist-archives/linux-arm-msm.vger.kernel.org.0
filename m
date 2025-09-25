Return-Path: <linux-arm-msm+bounces-74939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65839B9D9ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CBA4383A65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B4E2ED14B;
	Thu, 25 Sep 2025 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9LeXD90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65752ECE86
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781789; cv=none; b=d8eXznDZrXPK+A2VmQpNg2QXNNnAIEpF70U+GHL/rQX4Y29+L3sGNu5p4aiAppaqqaXae0JktxJp0p1CqLGQ21JfvWEbg9XMQt4uLWpiP2rVPVQovK9D3a/BwyjZldSpmKlGLPc8AoLpk03mG9mgeEl1G1jAhYayJVJSy+MHxuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781789; c=relaxed/simple;
	bh=yedJEEqL4ZUtTo4ypXp6TiEKX/zqnJ9N75AqBUCVR0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzNf33aH8mlfusMCZN7iLcD+MLXjU6Xc6NCl8N7asbd6ec66Ne38EJdsjJS+Gg8Ge4aIOECVct8EJmEFSASHd9mB/Fswb9r7SriZiW588mGZCkpOTRX44zQuNHFaVGduGFubYWALzKspuOl9jWdNIvJVhbbYefNtk/vt5UktqrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9LeXD90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONZY3b027782
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+AtpvCg1CmpAe9sYGyWQJouaSiovRLjPzDEo50wF9Y=; b=F9LeXD906u/wjUQ8
	eBiHfssonfeEkGphJ5NkU+SnNgnJLb0Yb4vtRMDdsnt50U1FCVn2aEd3WyfF/srQ
	wAQhk7e6UxPKuksf83DaSCw/VkJ+OuWcfd3hRTq9w3mfnbpOf57A7OZnFssETAHk
	M3Lf6xeH6PoTZL4mS+HW4zsLcOdLvQ3V1iDfr6SQ69cqpn9QvKodDyfztq4IcEuB
	SIFeh11L10ldsqsNj1EbYaW08CY/K6QGsccnWYql4ee9qi2VTQuCzAGUp2fNaGii
	1bvfSdG8qSSeAxBf4lm5pGA7M6AXm4uKhBEgW2tMbH9Zll0uUTrQmcF0oqt5V9Zh
	316MaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnycd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f3998c607so1049112b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781785; x=1759386585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+AtpvCg1CmpAe9sYGyWQJouaSiovRLjPzDEo50wF9Y=;
        b=VAJr8+9JIBR/RT1jZb3x0biyq8D0CJlg0LiWlZXCXTZHK5vCI2ZRhrNCyvKkwXonlc
         IKMoXr4M357rV+8zlmruGS5dPcs+aNNAqdxW0torKFne4zy6UoTvEwP/zDdrIiDIHXAq
         hYSFuos1YRD7qq0C/cBJINKKumuSKgIQQ9YOpGVdsJDxTErtjICN3u5lQzpQhPRzDisg
         afJd1mYPfJXbIXJMzrZm3GIAmRiHOiWc86P6PTv8n5jWglsbHed3YAYdLJDN14vnudnD
         c25etXtkmrmwlN8Y8bj7iTOUr4tsfT0MDJ0jNNmyPCmk95rEt/oyuxaqjjbJlG+0s9Wc
         AD1w==
X-Gm-Message-State: AOJu0Yyu4GmMF2+7esynam+0YMuSoiTw6kZF81jSlPQ4GoMLXvpV3s7N
	xjpPq6pzLzLd8NRPxUVeLZAgFizRzojWvTGQZ6DkB1m9RML6TKSV+zWCDSoXV+8UnD6if8bx30R
	rzRxlSdKb1wAS4NDQCaBqybY2TzjlQTe9TdqkkXPXKBkrWcw4t5uNRdcsWvroNguxifzdp3l4A7
	U7
X-Gm-Gg: ASbGnctSyNQMP0woVNN1x909gsnlEpapjkX/59y0WySlrTZUNZVt/MtFqLQDsXIlQUn
	5mnxSz5N1Fk5IMml97AYJ4h3biT/6KVGiTSoChw1lMMn70t225QdAcCowJvz6BHIor2qJ3/zh/o
	dnn2XMnmnz9X5yei0qvjhNeE84s6dj93t06kPJdQUEy/0/DVbAm5KyQ7VTMqHvIpQzEkD6b5MAX
	rgTLARhdJ6fyGaEK5HS86326jNlHGZRLBLkH7AZ9QK9VgGJYPZRJhxeLNdsFDFwCJEmm1s77ihX
	Oc6uPkYU9Wf+6snSpcoxRK6kgke+cnD43qqkVv5mpE9p4ug723o7eE3twKnihCPX/0HAD//P8iM
	FHR8jlBG7Qf2CAGJy34vDDsD2UwUjdU31SI3kJDmXTREQekbUlai+Fwgai5Ic
X-Received: by 2002:a05:6a00:2290:b0:77e:d2f7:f2fb with SMTP id d2e1a72fcca58-780fcee1bc7mr2232456b3a.23.1758781785199;
        Wed, 24 Sep 2025 23:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3OmDcicH/EzzZH4H0pemOdU65gxLkrQqE4Ny7buYCJovyC253xgahgRiTwAHjEjzY0LZoXQ==
X-Received: by 2002:a05:6a00:2290:b0:77e:d2f7:f2fb with SMTP id d2e1a72fcca58-780fcee1bc7mr2232436b3a.23.1758781784763;
        Wed, 24 Sep 2025 23:29:44 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:44 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:21 +0530
Subject: [PATCH v2 15/24] arm64: dts: qcom: glymur: Add PMICs dtsi for CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-15-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4e15a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-PhwRXPgPXS4kyLjRL8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: GD2wSP654j6beWb1AmSDh-ywBie-eh7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX/aznvhxRgvEv
 TyXCAVAkdmXlPlkv499g6zKyDq3qnb78HxvGBwY0NAMi7ZJIJEv3nsfHPbsDs9ezSdZRWMgesC3
 9wxQsiFMExTxUhvGh9TdDX3mIkrvK2r+JINF3gHvtLNIZpILKag4CXr9JtKR3ltrj8S2Bayk5r4
 PCDPjxAnYaV6x8+GzYH7sTTaKDUjJf3S16RcQ3QrjGZ+C1I1/uPc7RuqlwboUPvpgG/upGGuVyO
 RpQHU6Y65nhlWb2U5e4SJwRRu7rCytWQblRhDYtVw8ENYeo6a5s728kGut7NBkH0g40BB9nhq4Z
 mNkfGPJ3qUXegavXBJoxAlwexGmQdj/frKaDfaCxt2DAKyCtccaD1FgWkfKJUtMn/j0pEpIAFN8
 wIfZoNUM
X-Proofpoint-GUID: GD2wSP654j6beWb1AmSDh-ywBie-eh7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Include all the PMICs present on the Glymur board into
the glymur CRD DTS file.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts    |  1 +
 arch/arm64/boot/dts/qcom/glymur-pmics.dtsi | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index e89b81dcb4f47b78307fa3ab6831657cf6491c89..97f6eedd7222368f5cbfdd02e9c4d87261d7f19a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
+#include "glymur-pmics.dtsi"
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..59dcfb67a203a7c576406037377fc9fbdce51a97
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define PMH0110_F_E0	0x5
+#define PMH0110_H_E0	0x7
+#define PMH0104_I_E0	0x8
+#define PMH0104_J_E0	0x9
+
+#define PMH0110_F_E1	0x5
+#define PMH0104_L_E1	0xb
+
+#include "pmk8850.dtsi"	/* SPMI0: SID-0*/
+#include "pmh0101.dtsi"	/* SPMI0: SID-1*/
+#include "pmcx0102.dtsi"	/* SPMI0: SID-2/3/4/6	SPMI1: SID-2/3/4 */
+#include "pmh0110.dtsi"	/* SPMI0: SID-5/7	SPMI1: SID-5	*/
+#include "pmh0104.dtsi"	/* SPMI0: SID-8/9	SPMI1: SID-11	*/
+#include "smb2370.dtsi"	/* SPMI2: SID-9/10/11*/

-- 
2.34.1


