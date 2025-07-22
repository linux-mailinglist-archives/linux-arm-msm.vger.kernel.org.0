Return-Path: <linux-arm-msm+bounces-66117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D0B0DF98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAE79172281
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFFA2ECD2F;
	Tue, 22 Jul 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPgLTy44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A582EAB82;
	Tue, 22 Jul 2025 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195799; cv=none; b=S2hFe36GJLa8bpVlP0WGxiS576oW76DaBMi6tZG+zpbxBQSuzoRNA2TW/2R+V/zYK6O2vuRIPtIqJMzmrdKrXtZ/vTWT2ZlSZP67GEJsSIHXPwvMHaM7RqAEkH+8sq5/ybljjze2G1gX3KFZ9oWDzP4Tx4cBLPNTgJV37ZuEBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195799; c=relaxed/simple;
	bh=uZC3qEMamesa/6beYGecV9q8stBSQeZVB4HdHqBScw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxbtloeiCxc0VWxHdsbC3lHW4js+1qPdmwQtUTvFfuSFIIMLbDe476Gp5Db1kHU3pj4mXKSTQl6mo51vhDU95VpXBqwmX9UKKc7tMZJjHYRtsKW2f80iT9luwSiKM3SRmcuEzPGboHNdqIo7j0Um15PIkgSJehl//Av5OzpgnFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPgLTy44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LbFi008802;
	Tue, 22 Jul 2025 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8+WohAoRAbe
	V8iN1BkvHx/y3UEryFxqA12kx3YEG+XM=; b=LPgLTy44NkRKLoHRx9+NITrd8Cp
	TsS1+8joVLFRr3p8rUJfUpDrexXyKxa6d5C67RxwcndADTaSAilVecVjLaKEmgRG
	CPdvdvzc0qlQOCK7jTBLsYzn0Ui+3p5RhY8Voin56WMMMUGcCtzR/BsWdUmZCmax
	0sgzAG2frvrrzObtm0UFjp5n4+pwUfbSK4cvbtua5kw7PmZrKMyt4MP535b/ufGl
	85qlqyxK6I20nCmSVpoM8QhCQLyE3bcRhierWELyYOI1/nehut4MEZQUzWSNv2Bj
	aqsHGhvRVvKFu0QUtpKQLHeMLOYHgejUkCW0wpZzyXiKbWBX1hCPT3TSSmQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w06vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnlUQ023764;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgevb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnl6b023733;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnkgG023727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id E240D5E7; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on daughter cards
Date: Tue, 22 Jul 2025 20:19:23 +0530
Message-ID: <20250722144926.995064-5-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fa510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UF5zYO1LgcZHhtOM9ZUA:9
X-Proofpoint-GUID: qcXANdp2F5UGkOTyRZI6sqVg3AJWyigP
X-Proofpoint-ORIG-GUID: qcXANdp2F5UGkOTyRZI6sqVg3AJWyigP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfX8KuTtk5YR498
 lB9CbB7LcNSHdSGHWKWCR8c/DytuIb5VfFcXJGfO6XREV5IEryXJcdIviXqiufD04T/wySvXYOp
 hprzrwddo9OpA9K1x+9hYzXO/wtY16cKgLGxiDdOtFwy3e1Q8QXAK/Xuo7B8VPO9ABSCgQbvpmk
 3vWUto4a5CQANr4XAa1TMiH6L+7oCWouOSsdbuh/GXL+wtyMpO0Bg67qING68YvA06UFMb/+b3g
 NfmWtRU1dUNO7bJTkuj2qYE6Xx5PfPzKVlKjaLuU08KZek7pNu88/PC5Ov9xPX8UO8vh/Xutm+r
 OHsqWOoSDYC3wYiMhlXrvQuXWhMcau3Xv1+wfw7wrIuPvlCfKuNh/rDPJBHQ37OiBZQEW/Zi5UZ
 9fYZHXZ0Uxx4iAzANxg1xFffHUtyXiQhc+tafXTQ+PtuHVfMX/2CVYTMOdyxXcQYNnE3pd/f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220123

Ride/Ride-r3 boards used with lemans and derivatives:
  - Are composed of multiple daughter cards (SoC-card, display, camera,
    ethernet, pcie, sensor, front & backplane, WLAN & BT).
  - Across lemans & its derivatives, SoM is changing.
  - Across Ride & Ride-r3 board, ethernet card is changing.

Excluding the differences all other cards i.e SoC-card, display,
camera, PCIe, sensor, front & backplane are same across Ride/Ride-r3
boards used with lemans and derivatives.

Describe all the common cards in lemans-ride-common so that it can be
reused for all the variants of ride & ride-r3 platforms in lemans and
derivatives.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 .../dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi}  | 5 -----
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts                 | 5 ++++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts                    | 5 ++++-
 3 files changed, 8 insertions(+), 7 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
similarity index 99%
rename from arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
rename to arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index f512363f6222..25e756c14160 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -3,14 +3,9 @@
  * Copyright (c) 2023, Linaro Limited
  */

-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

-#include "lemans-auto.dtsi"
-#include "sa8775p-pmics.dtsi"
-
 / {
 	aliases {
 		i2c11 = &i2c11;
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index a7f377dc4733..3e19ff5e061f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -5,7 +5,10 @@

 /dts-v1/;

-#include "sa8775p-ride.dtsi"
+#include "lemans-auto.dtsi"
+
+#include "sa8775p-pmics.dtsi"
+#include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-aqr115c.dtsi"

 / {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index b765794f7e54..68a99582b538 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,7 +5,10 @@

 /dts-v1/;

-#include "sa8775p-ride.dtsi"
+#include "lemans-auto.dtsi"
+
+#include "sa8775p-pmics.dtsi"
+#include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-88ea1512.dtsi"

 / {
--
2.49.0


