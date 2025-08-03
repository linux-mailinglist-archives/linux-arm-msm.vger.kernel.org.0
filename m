Return-Path: <linux-arm-msm+bounces-67580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4AB193A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B204F3B0C99
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183B5260568;
	Sun,  3 Aug 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHoWk7ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6196A1F8F04;
	Sun,  3 Aug 2025 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218896; cv=none; b=atryvulF1zUBRWjyYTM6LncGwv9AXvUZXYbo4rLWr6NynWsmFQ8pH/oCE0aeWZJ+bRALT4aLjBNmb/fFBh6HuGcd4MGmmHPyXkRL8qG3iaB1LKsgtzxODGpTt1/YRjfMukG+zWFYx4dzTdKqcfeCWH5i2TZ7wxzrz+Ou7D3FGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218896; c=relaxed/simple;
	bh=00OXGFeg8DC0Y39xmzVuxDSTi6YKxRgkne1ERk9Ayfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryJ0jt0WHnQdr+Tfooju5L4WATDmfCDAC6gqMP+IazFYj3UZNDWsfn9tCAgaRy6ABNUb+6dxx7BVHqmv+DYfoAe+NAQrZinbsEDgKbolK2dBE/MwbAk/xVzNIRsaukKbFO3+F/tMIa8PAZyBlnL40sBUplj5o2FWcvpwunKdYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHoWk7ph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5735RTmr013648;
	Sun, 3 Aug 2025 11:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kUmpEhT1D9z
	el8i5wDhRQC/fZtUCw0TvJkoJAj8thhU=; b=AHoWk7phCymGyON2nBTh4c0kPNn
	2oItwCxix57Qkl7cJslydEcjis3dVeCaLhE6E3wRvb1GZuazsS0VOCUHzDNv9z8Q
	ZUJMAf1V3L2JZoLlFrdXkj6zXqAxR15N+NXCUFQ/sNlBa9VhhmWQyLX0H12hmB6O
	8j3IfXrpStzjSd/1nfXMK7Rwr0zxtbREui1E0ReVKKaqLWJXX1fNjALaK1ei8rIE
	B6C/X53Hc7SEJHE7vvpLudxxA0rgK3TEuQEj49Ynl/LdHZYGqGWziCrd8JFUVDYh
	bdkkyAI+J1h0DDq7nIjfcZOVvscxEoYtR6hwfGxgTGRV6tvLXuBmEafJV9g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rjfd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1LeY015353;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke04f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1Jph015274;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1KMT015329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 824B6AAD; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v2 5/8] arm64: dts: qcom: lemans: Rename sa8775p-pmics.dtsi to lemans-pmics.dtsi
Date: Sun,  3 Aug 2025 16:31:09 +0530
Message-ID: <20250803110113.401927-6-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g44ZZibFpbGdY-M_bzN2yhXZQZ6ldiAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfX1bWhGKhiP4LY
 0Gquuu+tXjxipNgblbugdsb5ICtncL4C3SMJkGpIR7zGv2vFRBiJ3aGEzQGGjnbw/qEsaqa2UZX
 n2ewJ1RxpEVtSiJzniOE7xUHQZcMUAie7l8XixYfRGxLrfiyk0k0JJvaGwKD53aVFVZSDsrHaEF
 qRC9we5tnqCSex6hp+LHe8nOluiuBENH3c1koFBUtAboucdzVzJTb6mqCEdj6q4F84k9shWCAyx
 vrp+ly4jm6VXoZqCF58AynO1eYKuBMDw2hWuwrnnbGHSQZnSY27ugz5jCFbk1YZGz4rM7a4b8Sq
 EIwCCUy32Hm2UsP6lB8V+VW/Jcbo7ghdl+x1LdCypgqFYCo07GbT6jWWXhN+3zSPhik0dCq4+mX
 idSTuygU6KBRLYS/H+C3luko66y5uqlxR3SfSuhccMw4e1TfltECdXfSXp0H73f/efiXE6qN
X-Proofpoint-GUID: g44ZZibFpbGdY-M_bzN2yhXZQZ6ldiAC
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=688f4184 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=g5GVcyza0KFaUtkz0icA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=840 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030073

The existing PMIC DTSI file is named sa8775p-pmics.dtsi, which does not
align with the updated naming convention for Lemans platform components.
This inconsistency can lead to confusion and misalignment with other
platform-specific files.

Rename the file to lemans-pmics.dtsi to reflect the platform naming
convention and improve clarity.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 .../boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi}     | 0
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts                       | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
rename to arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index 3e19ff5e061f..b25f0b2c9410 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -7,7 +7,7 @@

 #include "lemans-auto.dtsi"

-#include "sa8775p-pmics.dtsi"
+#include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-aqr115c.dtsi"

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 68a99582b538..2d9028cd60be 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -7,7 +7,7 @@

 #include "lemans-auto.dtsi"

-#include "sa8775p-pmics.dtsi"
+#include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-88ea1512.dtsi"

--
2.50.1


