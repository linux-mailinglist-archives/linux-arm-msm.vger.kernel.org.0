Return-Path: <linux-arm-msm+bounces-66380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7813BB0FCCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 896C51893302
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E977421C190;
	Wed, 23 Jul 2025 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0cYg7H2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD1274FEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309687; cv=none; b=XqOocJR3iByHSXgqpLD7axiAzGd2LdtrHok1zgk6F/aEgUewwilxWoycpmA/Sw2npe+LQltLQDZKeIIG2u2oSGqzp7zYwiWhXsAOSOxYaQwWlLktLjsJTClwAKmN6mMwKUXU6nRIZ00lzvEq5LJ6pwOh3hY/TkD9YshJ4/5xZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309687; c=relaxed/simple;
	bh=GZovDhI3KIvNWEQqtfPo90i9y/ccJUL2n910bxESqZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rd88qKAqo6JBhD1FpnegbFw/uxi3TqG1YNIrKfULQFhaWmEBZFVTYzHa4S2dGwEc4+OcBjMZA+V2Ripw2oEu28E2H2X6mXD5o4p1mEWn2QunwegXa/Non2PVUn7Myl+b/niYfj7OscVwVaUniuBsk34iU4ePTa2Y04iWrfkiYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0cYg7H2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDxWNC003519
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i963kRzz7mS
	JAvFLKAqickSsiw6bz65u5/y25yzIkek=; b=U0cYg7H2QMp0KpnBvQqKFSkSzs7
	gyZ8au/f07vgXd15OsL1qzNZImKTHSwkjU3HM92O0nprjuBYmT68g/IOJlwKSXaN
	XlMy5T+KCe1nzcKixeoUgjViplDb8GYm2EP0XKlPJPbzpFJMIbOU3CUq2f8lA32b
	RU4Aw7WNJBtpbkLvudiden74ENUC+71vSCIvKU/8TV9FTMdKwMtiJd89R8J5fVrg
	cFUshQ6tSHOE/amCJC8KIaxhmy/7KMVCW8G+y+9jRAvmlKqBgASQHlOY/Wg3aK11
	L1vSdZ1s049RbqHo563NGWw/InUvd5rEbajhV/ScC8k41+8Dgy0Vf7k9wxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313khb45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1fb57a7adso28297085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309684; x=1753914484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i963kRzz7mSJAvFLKAqickSsiw6bz65u5/y25yzIkek=;
        b=ooZ+L+c01rQ5LBnHzPO/amoCAp+VnvrPZCqMRAtg42YQ9ohfsK1eJ82V0zIXUzR6Q5
         WVVjd0wzHjakXhRALOXw3/lRAG6S7I8c7UBX/CCpqgYDDCPQyuBmVvn2SLo1GbnMzSnd
         EUJY7bP7FQ0ZBgPZq1s+dUzhV66Tcst2fcD4HTUdynknofNJzd+CIYyZzluWCBhs/Z1m
         HPe390FLIhKc7skWbo1Tf8+j/l1pfLdFFUiHvE2/ZxYlWM0m4hG/CFIc41KIgI8c4R1/
         7TPxdPeaxTw4wjx6y5t49mxkRN231CQzoePB/HPOr852Ipg5zvUM3iK7UXFgXbP/dwNa
         9Itw==
X-Forwarded-Encrypted: i=1; AJvYcCWqkA/+3qmiOAhk26ZhNC4uuNygNSrYK14oBR3by1RjL9S2SXr87V9hd38mE1YCC6TfJfXjD3A6FbksUsKa@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcyYpRiEWwt7jvKvKoHnk2HQTm/LMWaznUG+TAEsttb93JydJ
	B9fuqF3jT2bVcvYp7QQOoXNvHExJk6kn6pwpd46SA6rgW3gBhMtx6zC+fXF4J2j6sGI7HHdakTk
	5EQRhLN45QhbNTd3JB8k6zrvBktgjs3PQGayuKqtQj8HdoL1Le2RsOuCU0WZmbeheARnv
X-Gm-Gg: ASbGnctQMK0DupIQkQK9gEnss2ph6pVpEjnD/aLNowyEcUwNgTEtfN/aaIQHHOkPC1T
	BUqmdwxoCF1srQfZQgRQzKKl+3NqKOpUBR46qeo0uTogQefL6zbIPdtveu4otVQSuC+FrzXHKn3
	bmR1zSHTVPPGhrcH/Sy20wy8c12vD5RPIepA4UCSpHHpyPITdnkxyJ4AmECFE4YVtctKKaU9HJ/
	5ITMH3896SmLQZ2/wKK5sfPpjMqR4PiKSxIHa85CGSx5srWbTl+x9za2Va3WVBqbUg5zm2Kl8cl
	eKXh71kwD0mpx2pBsKs4aBcFW7oL7tLqkyIwAAS8xeRF4vFaN1l/Iw==
X-Received: by 2002:a05:620a:430c:b0:7e6:301e:d03e with SMTP id af79cd13be357-7e6301ed169mr207200785a.12.1753309684182;
        Wed, 23 Jul 2025 15:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx/aZlDfmJskiYExoJos0IgrbNdsw8hv+iwP1Zu+9SoGCMnhK5VUPuQGwsMnxXkiJ9tKnVRQ==
X-Received: by 2002:a05:620a:430c:b0:7e6:301e:d03e with SMTP id af79cd13be357-7e6301ed169mr207198485a.12.1753309683722;
        Wed, 23 Jul 2025 15:28:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:03 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 11/23] arm64: dts: qcom: sdm630: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:25 +0100
Message-ID: <20250723222737.35561-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX2IIeGTui2jNs
 a+KObV/HUvnPrblBfsrUYXPlS0RCeJ2/klvfvDVavM0hJGHOEIk+cfB6devqXAPLg3kfV03DAtZ
 kGppi5iFnLtIuzBQkwJKbbIp8nUJDUnPuStoKC/8CJwzu/TD0XiCGOVJyLyAoQ2HjzS71DU0z8e
 yQnTXQcIxSxtvE4Uq0Fn7aK7om044q0hSG3F3pe/5B1UGEf12k6qgI5lOJtt4k0rO1cfSzH905j
 VrP36YgiaUscO+PDnjSG9F5IVFaUzhz7GD6sGeBzN3GBoioagpL4IeFnstGDvLFQkXNYmkwG04/
 wq+W/5v5fCwoQkE+u6c5DmJgFmUpaucTXt8BJhdY/9j/pg0z71El265f03ut71oVpRmxlsJWhcJ
 4lZzs+pXAeOsV3TYOE8pifKFgSe/6/QJjtucvII5PPSwWY4mFaX8iiNnvaGIXd3uyC+3/I+t
X-Proofpoint-ORIG-GUID: hDpnJN6YuZnP0N9wvBDRrz7hQeouKI0C
X-Proofpoint-GUID: hDpnJN6YuZnP0N9wvBDRrz7hQeouKI0C
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688161f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NCDuKiUfWsd8YKX2kAAA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=550 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630-audio.dtsi    |  8 ++++
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |  1 +
 .../sdm630-sony-xperia-nile-discovery.dts     |  1 +
 .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  1 +
 .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 45 +------------------
 6 files changed, 14 insertions(+), 43 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm630-audio.dtsi b/arch/arm64/boot/dts/qcom/sdm630-audio.dtsi
new file mode 100644
index 000000000000..ca7af09a2380
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&lpass_smmu 1>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
index 9425b2d9536e..91663a502291 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sdm630.dtsi"
+#include "sdm630-audio.dtsi"
 #include "sdm630-sony-xperia-nile.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
index dd484a9bc7cd..cc0d16ea16f5 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sdm630.dtsi"
+#include "sdm630-audio.dtsi"
 #include "sdm630-sony-xperia-nile.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
index 2da83cd41187..9cc953b89816 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sdm630.dtsi"
+#include "sdm630-audio.dtsi"
 #include "sdm630-sony-xperia-nile.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
index a679d4acee29..f6d31ef8b49f 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sdm630.dtsi"
+#include "sdm630-audio.dtsi"
 #include "sdm630-sony-xperia-nile.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..300e69b86cfa 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -15,7 +15,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
-#include <dt-bindings/soc/qcom,apr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2293,50 +2292,10 @@ glink-edge {
 				mboxes = <&apcs_glb 9>;
 				qcom,remote-pid = <2>;
 
-				apr {
-					compatible = "qcom,apr-v2";
+				apr: apr {
 					qcom,glink-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					service@3 {
-						reg = <APR_SVC_ADSP_CORE>;
-						compatible = "qcom,q6core";
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
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
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-							iommus = <&lpass_smmu 1>;
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
+
 			};
 		};
 
-- 
2.50.0


