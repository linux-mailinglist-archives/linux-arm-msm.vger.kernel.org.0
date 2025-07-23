Return-Path: <linux-arm-msm+bounces-66383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C698CB0FCD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655F63ACB2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F43B277006;
	Wed, 23 Jul 2025 22:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwKYWZo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA864275AE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309691; cv=none; b=lncUDMpBRJmEH6CoUcgHWMEURYhC1Hsd+6uq8MSwveJ8mNY9vBT1EQVYeNHrfU1MHXAsUHO7LBgbXr7qqSaaGxp4G7eSF9pCUh9kOIig+QIQ6XO/3KiTkXUEct90N4zkb6HBecqNwm20U5y2g9O1x1CuPejI48qY+HpNq1pZc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309691; c=relaxed/simple;
	bh=pfs8ocV5oFyu+lsbLXH3Ei8VFhET21gpR3lNBPiEabI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldCsZb2wVCEh67z5Rb6Q+OO//mP9bnvYtmXXtnWdj0gWdlwImZuvsCuC9sTT+im18Up69a1n8ypJrL6xyq3h0Wl5+jpgLqBCDgqJVPxshFKRCLO0j+FxEHEU4tg0yCy7OD6QDgfPyTEL5dsLfPDMqw/F6bntNhThux5G7KKjKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwKYWZo7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNecl019543
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0uXS7Zq6oD
	QocEsaGxMO8iSgriP2+3nxyR1injnx+0=; b=jwKYWZo73o3zTlAWN16XzqV82Lb
	u6j0x8g8vawdJ5kWP6E2flBkPauwZzp3PMxXahb081dX08RtPgH7pmE+jHs2B/7O
	F+ry373p0sw4rWAH8tDxzGjCMhebJ3MXUwlQXaEyLsjy2UlRefhJnqrgJWXxSgAA
	b7SEYfokD8Okmih3WoQTpUDqy3vvrZbwfEfElevzRSDgl30VovCOMVSc4jCmro2f
	/E3lygXFAU0gwdh5xiLJ8TVp4gXD6HIadsXNzz3gSqBa0gItvjaBxofY2GMcVS0c
	IoQ9lPXcjWePSx/C58p5WwyoIMmMmDy8REK71V80eiegAWLDJfSjpSf8bCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379ru5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabd295d12so7287136d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309686; x=1753914486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0uXS7Zq6oDQocEsaGxMO8iSgriP2+3nxyR1injnx+0=;
        b=wTbQtL2rBGgjVaZkV91mXRf1V4VgjSzHN/UbzeCvcrccEv+SlB2TrK64do3ZCz4mwE
         RgVye0wNddPw26LklVr49YbvLH4Lm0e9vRqOxjVsuOdQ2QFFqY4wN1gzAye4vxURiT3/
         nLymZzPOmfC4CR5ruTxt/uBZ9Ty1pXYNtvrrEZHrDHq5SaN6QOS1M7KMBI6uxLJDyHby
         xAtk4/OEtgMJdRBpotBGUtW+0pIooNepRDgoi5WcmW85aqU4CX5ZcBdPC5mmC3ElKsMH
         75UriRdESRkTUEuyGr3OTgBvMGIRZ7DgM82QbbzOXSNpYMWqrNZJaoIMui4N7o8AR6db
         nrXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz9HHnisLwqR+Xf9WSRunXyalw5JvjB0jgNGSxjJpH9gaErW0id0e+kiQcmJfSx6P1alZ2b/BjKDgQg54e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9A7cknN6BMQj7CCZ8DfuNE1Z1kyORnh49X/P9oqlLaWBzWz3P
	T/IycUfnXonJ1XWWEkjSu/LLB2CYEJ5XDsPKj49l8HlloTaQUljDzmxzGisAIDH3+7DaNF525r1
	02LFEW+IurS4xV2omhcPzZJ3jXN1WWw0d0BqQu2+J3+9/fOafWtXxaJ3AhH9AZ6omR4Y7
X-Gm-Gg: ASbGncvtSvoym/vPAlNHtZqg44jHxnEX84d2/G0hFjzxTdnPvtaGjKlvTcBpyFqScUY
	dc0M+6aVswlUCDQHFVmVczveLfBGhQrNnTNTIHP9g08VwTsVdMeroQWCHuv/QdNWV2TCeAvfNTM
	At7ju5dAioTXst5E9RKYoUPhFfFlRuWyfcztNMeebKWFzxiI14VqUq5cTSudLDher0xywyJJdkB
	UiZkgMBTLtSO8ALtptMoq8HLSYjhjMTTUDHC4GbXzDYwYpydtZ2qR3q5iulC/0G01gkaPZiyLs3
	Hrk12THy6r9xqpJWH2Uaar5qdOjm6LPWgHzedPecXgiYIVuyb/WK4A==
X-Received: by 2002:ad4:5aad:0:b0:705:2db:b28f with SMTP id 6a1803df08f44-70700711d14mr64262226d6.47.1753309686375;
        Wed, 23 Jul 2025 15:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRYaGb7My2NTW7nvntpnILXMpKTLb1wZbqZngoqPvadM9aitX/bxEhJQckEoagg5bos3CBKg==
X-Received: by 2002:ad4:5aad:0:b0:705:2db:b28f with SMTP id 6a1803df08f44-70700711d14mr64261906d6.47.1753309685778;
        Wed, 23 Jul 2025 15:28:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:05 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 13/23] arm64: dts: qcom: sc7180: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:27 +0100
Message-ID: <20250723222737.35561-14-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZAoCm8PDhDe4m_NG7WSjJkmCDM_u41UM
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688161f7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jH0tB8uThlOIpdONzZoA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MiBTYWx0ZWRfX0ep2Q+JNniQW
 l/b9iN7iNT3rGVTGtSm0uDOWxMwdxBqQHIz87OXWwaX6lGoXBkMz5ScqRirtnAe6M9L1VVHi7mj
 SN2PGEJ8oksFjKDL/Cul8XAlkg0O+Ca8Irkph9y5IuFf3P1JThgpaafrw+5GVgufUDmasAZ0Ip+
 b7/MQb5aX9q9zI816/BmVwQ2Tne84gfuVP0EWNWpsn6HxUWpOpgqwZ7ditsZLl/3tP2wUYlS4sh
 LlybluT9rmZ9ktk7v7hmwsev2XU6OAQNnZ1z+uWSKTTug1tzYrLus5Tv5MCtldBzWKE3MfP3+9H
 x1I5aTNsBfyA3wWLtOuolMZBXdTDAVfwgz1KAOldR+3fDh1Kbr3PwiPFawT4We8uZIVX2ABVzOp
 /i/VEtFO4gPwQCCV03KSZAzrkEhNszHwPhDvS70XiUb+194da/zIeRgIvEc7ylK+vPLIB2lR
X-Proofpoint-ORIG-GUID: ZAoCm8PDhDe4m_NG7WSjJkmCDM_u41UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=869 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230192

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../boot/dts/qcom/sc7180-acer-aspire1.dts     |  1 +
 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi    |  8 +++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 56 +------------------
 arch/arm64/boot/dts/qcom/sm7125.dtsi          |  1 +
 6 files changed, 13 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 672ac4c3afa3..70b8633e5dd9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc7180.dtsi"
+#include "sc7180-audio.dtsi"
 
 #include "pm6150.dtsi"
 #include "pm6150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi b/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
new file mode 100644
index 000000000000..d6d41ba93195
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1001 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 0146fb0036d4..cbc3a3096cb2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sc7180.dtsi"
+#include "sc7180-audio.dtsi"
 #include "sc7180-firmware-tfa.dtsi"
 #include "pm6150.dtsi"
 #include "pm6150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 74ab321d3333..0e267b9fdefc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/sound/sc7180-lpass.h>
 
 #include "sc7180.dtsi"
+#include "sc7180-audio.dtsi"
 #include "sc7180-firmware-tfa.dtsi"
 /* PMICs depend on spmi_bus label and so must come after sc7180.dtsi */
 #include "pm6150.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8f827f1d8515..b56173838fdd 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -23,7 +23,6 @@
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
-#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -3876,61 +3875,8 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apss_shared 8>;
 
-				apr {
-					compatible = "qcom,apr-v2";
+				apr: apr {
 					qcom,glink-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					service@3 {
-						compatible = "qcom,q6core";
-						reg = <APR_SVC_ADSP_CORE>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6afedai: dais {
-							compatible = "qcom,q6afe-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-
-						q6afecc: clock-controller {
-							compatible = "qcom,q6afe-clocks";
-							#clock-cells = <2>;
-						};
-					};
-
-					q6asm: service@7 {
-						compatible = "qcom,q6asm";
-						reg = <APR_SVC_ASM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-							iommus = <&apps_smmu 0x1001 0x0>;
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 
 				fastrpc {
diff --git a/arch/arm64/boot/dts/qcom/sm7125.dtsi b/arch/arm64/boot/dts/qcom/sm7125.dtsi
index a53145a610a3..567c2cdde916 100644
--- a/arch/arm64/boot/dts/qcom/sm7125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "sc7180.dtsi"
+#include "sc7180-audio.dtsi"
 
 /* SM7125 uses Kryo 465 instead of Kryo 468 */
 &cpu0 { compatible = "qcom,kryo465"; };
-- 
2.50.0


