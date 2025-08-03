Return-Path: <linux-arm-msm+bounces-67577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD8DB1939B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0E301894534
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781B1259CBC;
	Sun,  3 Aug 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs1bcXgb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB9F1DD877;
	Sun,  3 Aug 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218896; cv=none; b=h3wMxsxbfqdEp00qioBykkYAAZylYjeo29tHBohHPU2fVQ8aW+nRm2lOSMKYz1/iIxPkVmMIQOZjlXJyr3tZm6arWvPoU+MrWEOeN39ily2fPwwnhVjuv/mNzbngu9vqMlgBgBaVUFMr7xAjGCQAGHv17obIxz8zUJFyFqdZhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218896; c=relaxed/simple;
	bh=/aZBEJzPl4DnDOUSAM9ClUwVnU4ZYOrUTOMcAbyjBgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDlseOAFhwu4LBhIgwMNHD2hIuU+TRp7bMJbz+7jqnurQKDvioaDoaUOI3VqeCmY2yeMk5FxlkaZD2O5TpFAmR9R9I4oJtbwizxw82rzL384qFf94iz7jZFcEZqf2Mx6+rgUe4OfQrEn/+1kuA6yuL5Ze7eUqoBLXuUNGvwMEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs1bcXgb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5738PHjX019372;
	Sun, 3 Aug 2025 11:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UwpWX7F5RAB
	matkG9TEFhcHFmBljkFTC/RJ3OvIBLuk=; b=Hs1bcXgbNUadLHfGFI8pZlcWEAb
	9QLVTv47t8t24tvwSEVGQ8bEgA1hgnano/Q/vx7U7m2XFPaMiy1++9IjXUHmzzfK
	IfjmeCOiFM9D/0nL3hOnheziqrEeYswVhDsRsfs92uZWJwfmDyF84pfVC23Oj1TZ
	sLDDdW1TRKZHBCcol5RavWVbPDuSYWjKSAapmlCYQWGY2ByUyKNAo8Cj6yXXvWzN
	efqmllL5BM82dpPM23QotNTD8XR/ts6Vd30w7rrvsEvpU4JD5/wVFY0OW6sKSQBc
	0HMkfwvZEhzKarD8Wn+d4iWypiqtN/x06wCtS+ndCpyXffWEPwubzKnuYWw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a24v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1Jv9015301;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke04e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1L7U015333;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1KVu015331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 858B2ABA; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v2 6/8] arm64: dts: qcom: lemans: Fix dts inclusion for IoT boards and update memory map
Date: Sun,  3 Aug 2025 16:31:10 +0530
Message-ID: <20250803110113.401927-7-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=688f4184 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QUm9M-LuaXONWf3G96EA:9
X-Proofpoint-ORIG-GUID: eZrhnnbQXpFFydxzSHShT_29tc0Jfd0n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfX34vG83NwmUtc
 E0ngOH3EPlTbFTtuh6nqin7K9k16EWRqM5NMiieaBVmroW5YzDsirq9c8pSULP5hoLmm5Ro4Lg8
 sjsX1nkq4e83sx2YP2PAjcM29Nhz8P9SilK0IoBbnJ/GAfqJ22+aEtRRcALVKhRrg4qjJBuy7+b
 zmu8mLwDZd2owvGva4JLfvvBatKmah6Ae6bFoBBps5gfhkfJJHf1dT4oBD7uV2Pw7zTHmuyC4bH
 8hOsXFfBkj7GhkPMJzHMTRgKHoSyl4JrjdqYa2snoQSlDmk6RLnmAopAPITDrGqRAd4jT4+x6zX
 kB4NXWyetlrVj52xS4K53OcGJDM4VaclTdw+vbWkE/6nR6tLDZc1+a1cQrb1ssKgaYsu210A4ZM
 QE/dYs9ZTWBiAkez15oTouilXjiYMNMLr1QgDa1ZhnN/7bx+yd3YR8sKncIQohnmcGIMm/XX
X-Proofpoint-GUID: eZrhnnbQXpFFydxzSHShT_29tc0Jfd0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030073

IoT boards currently inherit the automotive memory map, which is not
suitable for their configuration. This leads to incorrect memory layout
and inclusion of unnecessary carveouts.

Use lemans.dtsi as the base for IoT boards to apply the correct memory
map. Include additional DTSI files as needed to complete the board
configuration.

Update 'model' string to represent these boards as 'lemans'.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 9 +++++++--
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 759d1ec694b2..7fc2de0d3d5e 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,8 +4,13 @@
  */
 /dts-v1/;

-#include "sa8775p-ride-r3.dts"
+#include "lemans.dtsi"
+#include "lemans-pmics.dtsi"
+
+#include "lemans-ride-common.dtsi"
+#include "lemans-ride-ethernet-aqr115c.dtsi"
+
 / {
-	model = "Qualcomm QCS9100 Ride Rev3";
+	model = "Qualcomm Technologies, Inc. Lemans Ride Rev3";
 	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index 979462dfec30..b0c5fdde56ae 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,8 +4,13 @@
  */
 /dts-v1/;

-#include "sa8775p-ride.dts"
+#include "lemans.dtsi"
+#include "lemans-pmics.dtsi"
+
+#include "lemans-ride-common.dtsi"
+#include "lemans-ride-ethernet-88ea1512.dtsi"
+
 / {
-	model = "Qualcomm QCS9100 Ride";
+	model = "Qualcomm Technologies, Inc. Lemans Ride";
 	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
 };
--
2.50.1


