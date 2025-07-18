Return-Path: <linux-arm-msm+bounces-65684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC00B0A836
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE3A3A89CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB2A2E62BA;
	Fri, 18 Jul 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HddTm0sh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200FA2E613E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855234; cv=none; b=Xm19CAKz4TG9N6iB8lFA0KEa1T9Pl1ClFSIl1rAyb7scuhcoUmi/QLQyUbT+FcvwbRko1cqBe5l5cn4IXodKcHOuX13V4hajQZd9StMzlKOu3fk5RAoXxuvt7ZRtQ4PshKhvl6T+bs0dJdi56d70LhZmv8ohV00M/+0yhOc8OQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855234; c=relaxed/simple;
	bh=qbZsoJ4WpXYeEtPSlbOZ2i4uthnkxzqWJFYyR6RgjZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bO9Fiwu2glyAJPB2G4P9Kkf2+gCxfTz4f9hZJ/vi4GFQJc88fEU8toCqdFo8JC9xx+aIaAMs2Hxuid+nBcM9Ao1gL8xDULLxfu/tuQIsTTLm6dzizoQUK4IZrEjh+HwyJBi0trUVKBeiJl1vgOGCdmrheA6fQnKzMEa+/11BjxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HddTm0sh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFVw5n022405
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3jBTC4AynQ+yZKDFlQILcBO8zD5iMJ+Pqbi43VQy84=; b=HddTm0shYPQdh07y
	H1wHzpgPVDXBKe268xQ1R3/d2mQoUi+p78iYcBinNl7bdD1w7V0OAaZ+Lo+6PmLz
	rJpo3F0OSEEQVpHeGjAGNbJZPScHfSZQncRzbrfYj/bOW+5fvvggfhzB9+G3EgVy
	HO30MvyE+TumG19ORBp1OzdWGXyWyvgPL3iaX63W1b20QSWWMF8XH3r9tQZqfeR1
	8Gm56P1YcNuMreHMsPpbNzCtpfKiDfQxR+vM+NQdmJHcL9iPocSfADv6gBqgOdqr
	u8fk47Gm6pC4zvhmcrJdCMA3lWYlJFHfP81fghCj8+aHLBBeZWbesI4ICKxxAX65
	vbXqWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyc7h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:13:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d413a10b4cso306049885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855229; x=1753460029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3jBTC4AynQ+yZKDFlQILcBO8zD5iMJ+Pqbi43VQy84=;
        b=DuNO1jrz8J51BbO1y7SDSUonMvYj98ZG4pEuEsXWFY6aU3KCAIlte16JrufX3M9mft
         iqXLnaT9kCFdnA4ogVgxhg2FoCfmmCJ/CWL0G9zOBmlZiIfugfKa71G9ZV4k06xt2/ZN
         OCIqIM/TbdypA5TzOSuITYtSsC4khNyIuJ5WEcK59J/5IEas2uceSqwW0Gc3GXsh6Kzi
         Rk8lUoTHDVY6WUV7gy3VBoa8qutCvWkXwVwEbWHIyIRiy5YIfBKBwRcpwW9uxKOonVCT
         4p+HV1qieVFvjQgoHW4mLrRka8eeUJOzgMfGBgku1NVvZ7fLOixjcudPxdbnZj6Gl+C+
         3ZYA==
X-Gm-Message-State: AOJu0YxsGBXvBXNsJvoiMPyumP9FwCmS2HV3KmHBiRLIUuTMLjJDxpmQ
	C1ATNIGxCkP6vAhgGTCvywTN4VGj3x9JY1p2zXilWQsnduMNHYLRxEcZV6Y5Unx/jFjfeRg/Ffz
	BAzkCcvhBNxen/SkhCnEhudIsjj+921YEPM8IJuI3n10q6/XwlX93i0ct0SpGCYl6UHcCVOUmj9
	nS
X-Gm-Gg: ASbGncsg+a2uenCh1u97vU1hf3DB/bDZWtojyeMAirnEahQMJD3FWE18qkrMc3P7IVH
	KB8DaqRoDpML35UGwEUR+6JuA7hie24NVkPFObmNUVE0jrtABepiQxv4slGhqzI4wRMcFhlpqDt
	KsYsl+oh4ri01kuFHpfrZwooq+G2yCStax33se/viuS2Vl5h2uWAGA2+mNzaKQxVblP83KHrL3w
	6w9vumc65UPo0Z6hHV25HYk573EIg1Z04Y5Xt62XiLGB08tvRUoroEIOvX6/Fe86j/VMIjPKjna
	YIX0+f17wt47dAdO845IvRN6nJmRUzEezL7/mDiBKFG94qezsd3AUCFXixU1I4aZcpZRJBMpODa
	0V+apYetqlzcwnIuph9NsWx5/pgw/dfepXSjMPocdfKN1hWcbZt2f
X-Received: by 2002:a05:620a:3d12:b0:7e3:4413:e491 with SMTP id af79cd13be357-7e34413e869mr1399588185a.61.1752855229278;
        Fri, 18 Jul 2025 09:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1122fPka/53dNADi6RlnmEas+Pvvg3ROQ+ycEnr8z5NvdDUj9fS6sYKgHvTRJw+APk0QlKw==
X-Received: by 2002:a05:620a:3d12:b0:7e3:4413:e491 with SMTP id af79cd13be357-7e34413e869mr1399583185a.61.1752855228615;
        Fri, 18 Jul 2025 09:13:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:13:40 +0300
Subject: [PATCH 2/8] dt-bindings: power: qcom-rpmpd: sort out entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-2-eedca108e540@oss.qualcomm.com>
References: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
In-Reply-To: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qbZsoJ4WpXYeEtPSlbOZ2i4uthnkxzqWJFYyR6RgjZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK3i/jyVE0ZIoibzrTm/1+blpzp8ZkkyxXI2
 lmruymnYleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpytwAKCRCLPIo+Aiko
 1dOnB/0XkwyWN4V3SDZec6oX7fdy2JHxJX5yUxi76qD0OcjvKJWJJvITSPq2Q7t+y+MeO8LA9sg
 hn5CMYqiaTBJXjMuheKlOa+HWpcSULkC+kShj+tJvNoY4VT7wJyErAeDgQhnaLLiugCLMzLccNC
 6dNJYkdLUK+ec9H6iCPZwzQrZcP3fW3PwA4xWyW9CFdLyS8apwtEr86mOwWawdNrcSrU0wOG/Za
 n1YI4j2c/kG58xlATqK1bUDrkH5RpqTFWdR6OdgY274q+ufGHNQjuztmRJ/HahZOx8A/JDxCzF1
 vp9pEVyK11RiuKRQ90xAr6DFdxwAT6r/0mmTae4wrpDLtO0s
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyNiBTYWx0ZWRfXwf2Qt31C6RNW
 XKz5Fz8w1ZA5jDp5uNlmLFGppGrjGjKA0hwQqVg64MX/xzcFdueb2GGpSqB6A0mV4Tt0SR3Oatc
 c0+8tAoZg58JwGx1MuUK4BolfsVbV2rBuBaTzUwKYteBVbsvUytOiD6ZnySdnqjIDBD7aDvjP/s
 n739vnV+6J5if0RKTXxWY5AXfngLcr+6jCYJZrXBarze2HDZALGrzeSCTObKl8LDhVCzXGYnW3t
 e6FFPrYdpg5VvuCaKPlcOm+xZxQfZv2XLo7hGgGI408PZOe9LyqKs7o/N9n0ZV+OPp2Y5yrxT14
 LetI4elxMrYDgyTR13OOhWhitr/165hXyByW8gUVjeVn4Fn9HK774wx2VRe08tCCHte++hlNAV3
 QELJsjjacnPn9VcfH04KJspFPPK2aR9UMI8S/6J9lpY3jGq1aPGlSNhtlXfPl2vLFrwgIynJ
X-Proofpoint-GUID: zd4clmzGETeY66aBsu5NqvBODSTdrKeU
X-Proofpoint-ORIG-GUID: zd4clmzGETeY66aBsu5NqvBODSTdrKeU
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a72bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lzX941RX6UCYqbaESYMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=728 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180126

After removing RPMh PD indices, it becomes obvious that several entries
don't follow the alphabetic sorting order. Move them in order to keep
the file sorted.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 42 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index d303b3b37f18e0ff63929f3fe197151c5a3d3364..65f7d5ecc3521cfbc45d6158bd6143ea09f47302 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -6,18 +6,6 @@
 
 #include <dt-bindings/power/qcom,rpmhpd.h>
 
-/* SM6375 Power Domain Indexes */
-#define SM6375_VDDCX		0
-#define SM6375_VDDCX_AO	1
-#define SM6375_VDDCX_VFL	2
-#define SM6375_VDDMX		3
-#define SM6375_VDDMX_AO	4
-#define SM6375_VDDMX_VFL	5
-#define SM6375_VDDGX		6
-#define SM6375_VDDGX_AO	7
-#define SM6375_VDD_LPI_CX	8
-#define SM6375_VDD_LPI_MX	9
-
 /* MDM9607 Power Domains */
 #define MDM9607_VDDCX		0
 #define MDM9607_VDDCX_AO	1
@@ -130,6 +118,16 @@
 #define MSM8998_SSCMX		8
 #define MSM8998_SSCMX_VFL	9
 
+/* QCM2290 Power Domains */
+#define QCM2290_VDDCX		0
+#define QCM2290_VDDCX_AO	1
+#define QCM2290_VDDCX_VFL	2
+#define QCM2290_VDDMX		3
+#define QCM2290_VDDMX_AO	4
+#define QCM2290_VDDMX_VFL	5
+#define QCM2290_VDD_LPI_CX	6
+#define QCM2290_VDD_LPI_MX	7
+
 /* QCS404 Power Domains */
 #define QCS404_VDDMX		0
 #define QCS404_VDDMX_AO		1
@@ -169,15 +167,17 @@
 #define SM6125_VDDMX_AO		4
 #define SM6125_VDDMX_VFL	5
 
-/* QCM2290 Power Domains */
-#define QCM2290_VDDCX		0
-#define QCM2290_VDDCX_AO	1
-#define QCM2290_VDDCX_VFL	2
-#define QCM2290_VDDMX		3
-#define QCM2290_VDDMX_AO	4
-#define QCM2290_VDDMX_VFL	5
-#define QCM2290_VDD_LPI_CX	6
-#define QCM2290_VDD_LPI_MX	7
+/* SM6375 Power Domain Indexes */
+#define SM6375_VDDCX		0
+#define SM6375_VDDCX_AO	1
+#define SM6375_VDDCX_VFL	2
+#define SM6375_VDDMX		3
+#define SM6375_VDDMX_AO	4
+#define SM6375_VDDMX_VFL	5
+#define SM6375_VDDGX		6
+#define SM6375_VDDGX_AO	7
+#define SM6375_VDD_LPI_CX	8
+#define SM6375_VDD_LPI_MX	9
 
 /* RPM SMD Power Domain performance levels */
 #define RPM_SMD_LEVEL_RETENTION       16

-- 
2.39.5


