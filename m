Return-Path: <linux-arm-msm+bounces-62077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157AAE4196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 15:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD91B3B5D38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFD424888D;
	Mon, 23 Jun 2025 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvmEnRos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1B24DFF3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683881; cv=none; b=Br/vej/ztiEPtTjr+xEKbRGA/W1sn24GC03CRMc3tEOVzcL60PetxayN/+gu/yUween5++74xDiwU2UvzZmsdjjG3pgbGc7WKsjz4D+S3WGURogUIXQMZpoBOZCH5a5bst5DUJqTfwggycOZrtO6PjnbvGDB4qB7s4Cb8AwwJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683881; c=relaxed/simple;
	bh=/BlpWEmVkFfjpn/3mAzrX1kGPLkeZaYDQZ8QKhDor8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QnjbqI+mjIfO/45ZgWUwsVFapzqDQMwiQKISP5UclxqRC65aUoFyPJxnYhjn+VquTUF1zEaoNtsII4rLm2YoOlcMX86sNcuCozUgEOr2RWYvlUxEHPsPx/a6AAtzDmdDkbI8BsVdeBMeXiIji0FP6/ob9FEwEYPKEmYow2ugmlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvmEnRos; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9BRNn028297
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o0C9b2LLinN
	LSKrjPoebgxL6KXSiK4LWiWFvZX7PqrY=; b=RvmEnRoso38CFAx1tElkPJ/4V4/
	wqPVxn4+YCB3IyI8P3Ddl44UChJM8ZjwPc9W4VyH5ogGj6zRv+st1uQrr2WbnBpN
	Dq3RBBsvRMqFa88rU6CvE0pCB7LIxKR9y8OWT0OISzqJhETZDt2EJ1aqLm1EPQ6l
	aJh9bZMeD20REFmlwwT8kx5b5OzAb2eYoRVItd5RPXk7R9w733dbn2ORZhAakvsQ
	cgUoupcyvqVU5c164BPqXdLtvOLLsOmxrllzj6bw1YKp1kfjLJRRMv5BRong6kFb
	TBe6aWzG7jE9aOhihkhG6O7E1h9Ozjn+D91kOzaF7ymWZXBuWKvRbWRV41w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7tykm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f569321eso77370b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683876; x=1751288676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0C9b2LLinNLSKrjPoebgxL6KXSiK4LWiWFvZX7PqrY=;
        b=PskZ/jFrT+2uhDSIDxN0TiWE5l2aPpUp555VNfDm4LkGZCtIhmo4rxIVUgbYMSNDfo
         JO1Beqmk8krhJMi4b9OeUkJUIUx+k2VvOaCgSRjdTsB6nSA+5R0la1DNDZ2+65J+mH5P
         3DlgelDogJ5nE3VZ+eEX+eu+O9XVZVFIqBcgzjke1f/GVhLJD+qCsw1utO7MmobXsG+m
         VmYd15IVmy0sr912NUgAXxAudC/M0ncPuqpQKQ69wQlUza0/U2NQCLuNl1UiBoXUKFMw
         Nd2KS7j4nQeYj0pSg8HxImeN9Y/R0evl/Y2a4y5LXjQmKZMMOb1UNB21xpPIlxVGt9/H
         CIlQ==
X-Gm-Message-State: AOJu0Yy3KpCr9ZpKG3mEoTCc8nRnks0FkmAg6KP6GW67hCg7cQ7+wFIs
	KntnrCfWPT79jQjgcPPS4N7u8Wua+b3rHqlfJQpS3/IAVZt8FGg6nHC+SMG4BMUIbG/H8EDuwDo
	u6UU5zxVPMYI72TkLiQv/CLUwsnYko7AHjvfGf2MU+2lxpAgBCXveYPGrap2sGTItpWgj
X-Gm-Gg: ASbGncubqv85QW+1cRVxKWYJGUkkqPIFlBozrnGyxVnOYbJxwBlvdMWvAz27LEAIWS5
	8PdDG95ut+iZPfxMMxi9kCCFIDEyornaJvqaShla3W1G17LXb2+W6pzAfecJ21moJD/mtXBuHLL
	tDbO2xWX9Bcs8VSd7vucM5Hb7o1ZJhlhc/xeU34c1HKuEEEYtHO5/HIcN7YYkzXRW7ANmEMxrwl
	4PNTg/O/4y2HY7BBofBBOsgrBUsBp4xwlrhZuAFzfuuKHvfCWubLjUPGgNWA1+jBQJd/8BAzoHa
	/ahh/f/ihJtsaWtjrLSLPhZB4MQXmgTpMpSbsNppxfwKibFEas+DlQ==
X-Received: by 2002:a05:6a00:6708:b0:737:6589:81e5 with SMTP id d2e1a72fcca58-7490d4f9ad8mr5824636b3a.2.1750683875567;
        Mon, 23 Jun 2025 06:04:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYIj9dSQErqYoU6ZWGAMdNXXYCxJPw2Hvn3yIlOyufrRrJ0tUegl60KqZQDHnhMASeKtyHUw==
X-Received: by 2002:a05:6a00:6708:b0:737:6589:81e5 with SMTP id d2e1a72fcca58-7490d4f9ad8mr5824618b3a.2.1750683875067;
        Mon, 23 Jun 2025 06:04:35 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8b2sm8713437b3a.16.2025.06.23.06.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:04:34 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com, Rakesh Kota <quic_kotarake@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Swati Agarwal <quic_swatagar@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: Add support for QCS8275 IQ8 EVK
Date: Mon, 23 Jun 2025 18:34:20 +0530
Message-Id: <20250623130420.3981916-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rZCyaVe6HlhlFNlQ8ZBPOjexPUq1BZjl
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=685950e4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EXN5aKvdb1NWPgACJsIA:9
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3OCBTYWx0ZWRfX86CYa9BnlT4n
 n0oWN+Wr+ovptx4NdvvIdeuoysuZCkV4sLUf7pWsVp5hb0SCCLl68ctkwoj0CAW/omzUsE08btm
 Iitty/qVuOo83adPLsWG6vRNDxTHWG+VrYVYJ29bycbDMJ4H9ap6Y8qwATm+/VCPVHHhD1OxxBy
 WD9kMvr7s2RvshgBR2XMuQgxUdB2c/FpgtvgCf2WEUKDhszlA2AbY9Ui+pUZ9E6Bbmj9ixqaHKC
 leI9ZBSQCH9PDD9lhWJfL42HyzMJGCom1yDyLaEVNqZvnXm37NEPdkzT5odkcwVqQ+lnz0/bC4A
 AaAkMdQJetrzpMrWi8qBQXXuW9PfVvdBOrBymiwNVbwd+y7wzjUcBZFpwc2yGawGjKi9zk11ycA
 wGVKxCNH183xorVc0n0mLJFlx2o3pYGiPXmEqo53ZmkDsbWU3GbdVRnhOtDd1ITYXKPP+vp5
X-Proofpoint-GUID: rZCyaVe6HlhlFNlQ8ZBPOjexPUq1BZjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230078

Add initial device tree support for IQ-8275-EVK board,
based on Qualcomm's QCS8275 SOC.

Implement basic features like DSPs, UFS and 'booting to shell'
with uart console.

Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Co-developed-by: Swati Agarwal <quic_swatagar@quicinc.com>
Signed-off-by: Swati Agarwal <quic_swatagar@quicinc.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
 2 files changed, 242 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b27a1..417d8c9be4e2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -122,6 +122,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8275-iq-8275-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts b/arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
new file mode 100644
index 000000000000..b17ddb3ef721
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "qcs8300.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IQ 8275 EVK";
+	compatible = "qcom,qcs8275-iq-8275-evk", "qcom,qcs8275", "qcom,qcs8300";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s5c: smps5 {
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <500000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs8300/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs8300/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp {
+	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
-- 
2.25.1


