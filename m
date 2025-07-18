Return-Path: <linux-arm-msm+bounces-65687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64DB0A855
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5D85A378D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2950D2E11D1;
	Fri, 18 Jul 2025 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odUf99go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903BF2BD00C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855656; cv=none; b=mFTnbWJX7owBrfvjkE7MjeJhhJ9H8uG7+AsZzpLLkBLk1AiDRka66+M/t8gX+Levo66zmLzgm8BjhpD4nAsZ4wZB7kf55mguD1EP5fBzEZ+TykD40pGI7gJ+esHcDAc4jZTqcyhqjtAWiQf8GdwaM+gSgmAp9CgEJ5a+nO9WFD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855656; c=relaxed/simple;
	bh=hKwIxLX6Tkq5ssXYijoQYUEhL4IdWqUldpJvuIWYf1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFjTlZpjddE87TxuAcYpQFuJGOelhff72HXNhkQp9WTWfvTyBYpjok7rSEn+6mlAvuTpGLonc12/VYIY8K2kh7Cu4inlCOUzrlaPYjQlQlDZnaANuJdZv5X0qSAyKfxrJF97LLbpkrP8Y0ytbLUmNBk/8laszZqMcPTwlwAefa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odUf99go; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8S2MF015727
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bC86cQsWTQOgqMpG7vO8FaEN+Csh7UDonwPSnCbi+A=; b=odUf99go/JP/kCuV
	dDKnf240HKqwNgfq9OmBBOjUqazvW75E5X4uYiwv6GaO8+PKa3pj8csWZwiXETWz
	i+0FDTokvPYFYvEhdgR4xpYGqbzBO+G5E2pSoSxKhBHiRfmoL5XWhdDEWw4JUgRQ
	/ud24bNu6pYMJ3QnS/2dOeTuOikNsffmUG+erWVNGA8oRd8dwNu9DuVVaP0R31tC
	nxMcTXxXdZjaHEz9AbFDYamjACIXLws9w9kLPRvEtv70shYf9FwK4jvjyGqSdThP
	uElXPEQjCQ0Xutc2rW4nabKI626LWVSN6aMC7/QJse2oo48I0xfQSVfnbdkQYzlx
	nbnXjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyy62r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:20:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab878dfc1aso40692601cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855652; x=1753460452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bC86cQsWTQOgqMpG7vO8FaEN+Csh7UDonwPSnCbi+A=;
        b=uwjLkgHZUoIDSe3R++g+7Wo0mRjjCs/ru0Enpbp0biU/Q/9X0SDoi1iIP0jH5oYPLZ
         kMI6qh/mj8UVZFhwtfFPP8FmvH0yddOHoWyRK4oNR7VFWklaei5MqOMR3/4JB5GTLwdn
         P8XDmQh+z4rxBvTe71ByNTJ3qI3nCzGv+1LGJNmilkdhJWC34AAlcdB1Ys6SPGUhMlhG
         UKjVxaAJlr/1R4DnK5xMT5UccfYRmKMUHwZyLFX1qRDRRKqLy3fJdHG/EDeGW/euUhuS
         I/QUDIyPdVLtMPQ4sm7qnEt/EPNC5DMdDZOArUVW2jtXXicvQv1oiPk9IrDeyQR0YCOU
         TzOQ==
X-Gm-Message-State: AOJu0YwGNo1DiWsqBAt0Y7kTzqdydy7pLlwrBlq425BONUFW4Kd8Gl8m
	iGUEg4noTmoOY3DTe2JFqhamMNsTyYdkA5DwtIQoVuAttRYCRnWRDp408Sh9ITQJhQ/du8Z0WNH
	0dYzjJY/OQ9zq0uIHVmhiyIARjMq7mR2nR9yvrGg+Tym9/rgcIbBOV/bTv89jSZivb6Jf/NBpvu
	Cy
X-Gm-Gg: ASbGncucIznY5ALF3oOxMSeRtFeo7Nr7zdAHc0k8PLquarZotnk7lhjdBoAeQVuAMPO
	yEgXeyaPspNiXWpTNz8g6HdZ4dXEqMjgldn9l7UpA0irIoTPN8+g8V5aZiZiI03BYx1XSWs6ZxL
	VwvJVwVV4/B4E457Ge/3PkGSMRcIeHCZcnCorUSgVCBFC6cFyS+bXEHcDfv9yd2U7u1XO93iLxy
	9CYaHBK704LvCi6vOE6yIIa7esxeyinCcQxhthzNlWV8VsKWpFlo+NlnmBUGiS3mu720e75LRmH
	V9dvBcr6WIqwtZLZ75z835cec984gWG8tt9R5WzjxEv594xJkYNuV2QEbgdbuJliCfPWz7wLRqp
	nnm3oEvKwwN3rpnU31kqzJJwrhUnBdY43UUftQyDDjEj5oYn0cEoR
X-Received: by 2002:ae9:e302:0:b0:7e3:2db6:1163 with SMTP id af79cd13be357-7e34d9d2706mr818146585a.43.1752855231806;
        Fri, 18 Jul 2025 09:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ/xfyE4EqYZs5SJKoG8l9Wmr7yLZMHsyXm0BSNJgn7dGYympaLxySGid05XcsqJ+9QPL8dQ==
X-Received: by 2002:ae9:e302:0:b0:7e3:2db6:1163 with SMTP id af79cd13be357-7e34d9d2706mr818138485a.43.1752855230952;
        Fri, 18 Jul 2025 09:13:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:13:41 +0300
Subject: [PATCH 3/8] dt-bindings: power: qcom-rpmpd: add generic bindings
 for RPM power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-3-eedca108e540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5883;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hKwIxLX6Tkq5ssXYijoQYUEhL4IdWqUldpJvuIWYf1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK3c1qXB/balMU/jlQcdeziArEdBNc7sKEd3
 ef4fwJs6OKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpytwAKCRCLPIo+Aiko
 1SkJB/0WeBKjARPPuXb1n5taQMhySYAUcfJX1gsRiO3aUC1ORivBGXl2bytDlYboU1K56NYeWO4
 /khQR9GtaaZJ2TqnHrpnqA6Dxegz+/T/hwUFiSbXthk5YD5Br2JNJFkDvEJ9sSlEIHpyOKtnm+I
 ehbjPIgKY17hLhIxW7/MbhYrl964elgrZn0ue1Fk5HLan1wthQJt2fXyKChkQs/vk0BSWPweCBz
 z1DC5N7U37sxpfozs3+tYb0jsOYRWaBG9/K+9LDelcJEgjD6+pf5w+U26qORa0ShOgYGuguAzVS
 Fw+fqhrBAPr30ShCCGpSRD35A8Pp1LSqNF1p3u6lpUCgrqpl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uNic6jG6f5zof5iguPq8ch-l9fwSbDzO
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a7465 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=AzVmNdOAsp2gS-V4oEsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOCBTYWx0ZWRfX2IlLjQvvGi5z
 8NhuVMDLXwr65YH8h5AKWg00VjA0eg/VSYSvAK1PBjNjd78EJy9mPSTH5SydZESzWKg+GimWHZy
 ROr0LWNx+2J1IZEiH7h5/TGI9coV9Lb0VJMn4T1p9ybEPGAxGAJBJxkEQPYUqvVNeOTQIxnKUaP
 PLWcQSLwYkx7CJ2eBN7er6m5cxs53c18VAIMfj4a+fKkprbYFfZwpgsfFhieiLQGH8+7ETsAF4G
 EelzVas4103CS1JkQH2ZFWcMZxH4aj731tm2mBJfB9GA8vQRM+zp/gFKb5Z6B3/niIkpsEwu4rR
 wY3zgr82poCote2fep+F/CDdFqDsZOA9s01llFudTWV8KlOY+gi/cC5SeZd05NYU3H0yVEUvhXY
 gWkMzkdR/28trsyU6G3B88YrG8hr3ZGHDcCvcWXmG70uw4uVmtqClZLCzSqWYd9MTlkw9Eda
X-Proofpoint-GUID: uNic6jG6f5zof5iguPq8ch-l9fwSbDzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=877
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180128

Some of the Qualcomm RPM PD controllers use a common set of indices for
power domains. Add generic indices for Qualcomm RPM power domain
controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 121 +++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 51 deletions(-)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 65f7d5ecc3521cfbc45d6158bd6143ea09f47302..4371ac941f29d9657b6573f4934658f100726224 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -6,18 +6,37 @@
 
 #include <dt-bindings/power/qcom,rpmhpd.h>
 
+/* Generic RPM Power Domain Indexes */
+#define RPMPD_VDDCX		0
+#define RPMPD_VDDCX_AO		1
+/* VFC and VFL are mutually exclusive and can not be present on the same platform */
+#define RPMPD_VDDCX_VFC		2
+#define RPMPD_VDDCX_VFL		2
+#define RPMPD_VDDMX		3
+#define RPMPD_VDDMX_AO		4
+#define RPMPD_VDDMX_VFL		5
+#define RPMPD_SSCCX		6
+#define RPMPD_SSCCX_VFL		7
+#define RPMPD_SSCMX		8
+#define RPMPD_SSCMX_VFL		9
+
+/*
+ * Platform-specific power domain bindings. Don't add new entries here, use
+ * RPMPD_* above.
+ */
+
 /* MDM9607 Power Domains */
-#define MDM9607_VDDCX		0
-#define MDM9607_VDDCX_AO	1
-#define MDM9607_VDDCX_VFL	2
-#define MDM9607_VDDMX		3
-#define MDM9607_VDDMX_AO	4
-#define MDM9607_VDDMX_VFL	5
+#define MDM9607_VDDCX		RPMPD_VDDCX
+#define MDM9607_VDDCX_AO	RPMPD_VDDCX_AO
+#define MDM9607_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define MDM9607_VDDMX		RPMPD_VDDMX
+#define MDM9607_VDDMX_AO	RPMPD_VDDMX_AO
+#define MDM9607_VDDMX_VFL	RPMPD_VDDMX_VFL
 
 /* MSM8226 Power Domain Indexes */
-#define MSM8226_VDDCX		0
-#define MSM8226_VDDCX_AO	1
-#define MSM8226_VDDCX_VFC	2
+#define MSM8226_VDDCX		RPMPD_VDDCX
+#define MSM8226_VDDCX_AO	RPMPD_VDDCX_AO
+#define MSM8226_VDDCX_VFC	RPMPD_VDDCX_VFC
 
 /* MSM8939 Power Domains */
 #define MSM8939_VDDMDCX		0
@@ -30,11 +49,11 @@
 #define MSM8939_VDDMX_AO	7
 
 /* MSM8916 Power Domain Indexes */
-#define MSM8916_VDDCX		0
-#define MSM8916_VDDCX_AO	1
-#define MSM8916_VDDCX_VFC	2
-#define MSM8916_VDDMX		3
-#define MSM8916_VDDMX_AO	4
+#define MSM8916_VDDCX		RPMPD_VDDCX
+#define MSM8916_VDDCX_AO	RPMPD_VDDCX_AO
+#define MSM8916_VDDCX_VFC	RPMPD_VDDCX_VFC
+#define MSM8916_VDDMX		RPMPD_VDDMX
+#define MSM8916_VDDMX_AO	RPMPD_VDDMX_AO
 
 /* MSM8909 Power Domain Indexes */
 #define MSM8909_VDDCX		MSM8916_VDDCX
@@ -44,11 +63,11 @@
 #define MSM8909_VDDMX_AO	MSM8916_VDDMX_AO
 
 /* MSM8917 Power Domain Indexes */
-#define MSM8917_VDDCX		0
-#define MSM8917_VDDCX_AO	1
-#define MSM8917_VDDCX_VFL	2
-#define MSM8917_VDDMX		3
-#define MSM8917_VDDMX_AO	4
+#define MSM8917_VDDCX		RPMPD_VDDCX
+#define MSM8917_VDDCX_AO	RPMPD_VDDCX_AO
+#define MSM8917_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define MSM8917_VDDMX		RPMPD_VDDMX
+#define MSM8917_VDDMX_AO	RPMPD_VDDMX_AO
 
 /* MSM8937 Power Domain Indexes */
 #define MSM8937_VDDCX		MSM8917_VDDCX
@@ -81,12 +100,12 @@
 #define MSM8974_VDDGFX_VFC	4
 
 /* MSM8976 Power Domain Indexes */
-#define MSM8976_VDDCX		0
-#define MSM8976_VDDCX_AO	1
-#define MSM8976_VDDCX_VFL	2
-#define MSM8976_VDDMX		3
-#define MSM8976_VDDMX_AO	4
-#define MSM8976_VDDMX_VFL	5
+#define MSM8976_VDDCX		RPMPD_VDDCX
+#define MSM8976_VDDCX_AO	RPMPD_VDDCX_AO
+#define MSM8976_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define MSM8976_VDDMX		RPMPD_VDDMX
+#define MSM8976_VDDMX_AO	RPMPD_VDDMX_AO
+#define MSM8976_VDDMX_VFL	RPMPD_VDDMX_VFL
 
 /* MSM8994 Power Domain Indexes */
 #define MSM8994_VDDCX		0
@@ -107,16 +126,16 @@
 #define MSM8996_VDDSSCX_VFC	6
 
 /* MSM8998 Power Domain Indexes */
-#define MSM8998_VDDCX		0
-#define MSM8998_VDDCX_AO	1
-#define MSM8998_VDDCX_VFL	2
-#define MSM8998_VDDMX		3
-#define MSM8998_VDDMX_AO	4
-#define MSM8998_VDDMX_VFL	5
-#define MSM8998_SSCCX		6
-#define MSM8998_SSCCX_VFL	7
-#define MSM8998_SSCMX		8
-#define MSM8998_SSCMX_VFL	9
+#define MSM8998_VDDCX		RPMPD_VDDCX
+#define MSM8998_VDDCX_AO	RPMPD_VDDCX_AO
+#define MSM8998_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define MSM8998_VDDMX		RPMPD_VDDMX
+#define MSM8998_VDDMX_AO	RPMPD_VDDMX_AO
+#define MSM8998_VDDMX_VFL	RPMPD_VDDMX_VFL
+#define MSM8998_SSCCX		RPMPD_SSCCX
+#define MSM8998_SSCCX_VFL	RPMPD_SSCCX_VFL
+#define MSM8998_SSCMX		RPMPD_SSCMX
+#define MSM8998_SSCMX_VFL	RPMPD_SSCMX_VFL
 
 /* QCM2290 Power Domains */
 #define QCM2290_VDDCX		0
@@ -138,16 +157,16 @@
 #define QCS404_LPIMX_VFL	6
 
 /* SDM660 Power Domains */
-#define SDM660_VDDCX		0
-#define SDM660_VDDCX_AO		1
-#define SDM660_VDDCX_VFL	2
-#define SDM660_VDDMX		3
-#define SDM660_VDDMX_AO		4
-#define SDM660_VDDMX_VFL	5
-#define SDM660_SSCCX		6
-#define SDM660_SSCCX_VFL	7
-#define SDM660_SSCMX		8
-#define SDM660_SSCMX_VFL	9
+#define SDM660_VDDCX		RPMPD_VDDCX
+#define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
+#define SDM660_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define SDM660_VDDMX		RPMPD_VDDMX
+#define SDM660_VDDMX_AO		RPMPD_VDDMX_AO
+#define SDM660_VDDMX_VFL	RPMPD_VDDMX_VFL
+#define SDM660_SSCCX		RPMPD_SSCCX
+#define SDM660_SSCCX_VFL	RPMPD_SSCCX_VFL
+#define SDM660_SSCMX		RPMPD_SSCMX
+#define SDM660_SSCMX_VFL	RPMPD_SSCMX_VFL
 
 /* SM6115 Power Domains */
 #define SM6115_VDDCX		0
@@ -160,12 +179,12 @@
 #define SM6115_VDD_LPI_MX	7
 
 /* SM6125 Power Domains */
-#define SM6125_VDDCX		0
-#define SM6125_VDDCX_AO		1
-#define SM6125_VDDCX_VFL	2
-#define SM6125_VDDMX		3
-#define SM6125_VDDMX_AO		4
-#define SM6125_VDDMX_VFL	5
+#define SM6125_VDDCX		RPMPD_VDDCX
+#define SM6125_VDDCX_AO		RPMPD_VDDCX_AO
+#define SM6125_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define SM6125_VDDMX		RPMPD_VDDMX
+#define SM6125_VDDMX_AO		RPMPD_VDDMX_AO
+#define SM6125_VDDMX_VFL	RPMPD_VDDMX_VFL
 
 /* SM6375 Power Domain Indexes */
 #define SM6375_VDDCX		0

-- 
2.39.5


