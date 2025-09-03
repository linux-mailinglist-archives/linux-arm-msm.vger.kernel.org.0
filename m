Return-Path: <linux-arm-msm+bounces-71897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC8B424B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801D75403BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF22320CB4;
	Wed,  3 Sep 2025 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yu/rHzUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A136320CB2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912447; cv=none; b=pS4YTSnpiu9L9UwrRffynMOLVzX2SLb+Qo9vRE19wlvNSP3evADJMytt9nachykljvlcuW1m5na/aL6vvGLM4DrFJOn5Jpx1z4oNhvEg++w+krUqYy6SMgHRZDNr1mzJjcizpcLA1DF7JtpPPy2lrs/F/gVabRCCKLl5iHFr1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912447; c=relaxed/simple;
	bh=apwKk+ikM3l/V1EQQjFWc2jNPkFZenZw1Re+pEBEENs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eOgumGgm2LWAvmrCJ24n2WMIw2+V9Fln8UbAoqCUGFeni4HRZmBtEi7qyF74et5XzJvqwiOsz6mIKANo3xbIJamIWL/egSNmT18uZob1qkRzN+R/SEodcJsn96R56710lz2QNy8nGiW5+5gJeiP3hxj1UzmP9gVjL/yFIOFF7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yu/rHzUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx1w1005455
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VZTZQqgdtSX
	dHRS6Xhizb7R5zVIthwUpM+I82rokNQQ=; b=Yu/rHzUMtnnrgXAPEP0W5+0cUEG
	zIqf3rivDfhLME/e/StUh907hMugCjr2YrrAlzdvSKf5IbT7UIaJ4EyO7tPC0uxe
	fLav7e0a3dpPIgN+MhsaFq+4B/gUwdZereF8+JKCR0I1m/Mj0PbE3VF8D3+v8+iw
	6Gnnxo7VczFMUB+GMYYPfZby8EPa2sSBJUTi3n6wTjnNRMzSw/hgau8ZfKHTSejp
	rPVy+iAkZGOrddNsUtjuQx1wIxXO4JaWBIA5UaJHBG1wyD6GpjAojoH1Ww1onToI
	flRnx7iyk+NnPzVbYH5ZNzncoXr3DfH4syrEM5y1zjPtbCi7O344ahGAI4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjm39a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:14:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77260707951so34084b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912443; x=1757517243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZTZQqgdtSXdHRS6Xhizb7R5zVIthwUpM+I82rokNQQ=;
        b=DKFBJz36Arn0Ekt4qg0mEhvEvxSv3MeO3wSPF/ZhoyeaMnS/sZ3xwC9hE8pedMWnRz
         RxhkTXQTlj3Yj3UQQw8sTmKdjR+1d84Xa1yu+X0TTAS+Brm2CSFWHrUS8ISjLX++n/0J
         zCXE+sAjEwR+FevzXDfJx+k+w+K6hUExbXw90wdoxqv3f39G2T/7w3TV9k6uXcfd/OXa
         /Y/fcoyhzKiwXa78w9ZNQNZy7uLcII25Ood8KRJEQm8eQYPdZGG2TqjSgrHD8pZtQnGW
         o6PTJYcHsqHd4RTzxpkqgFkEdhCBEazO2sW8ApfZzn0IeZjlY6Ar+OQEnDUp6HB7lYlD
         sGig==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+z5/qH4La22QsuV49DCInPU995p/qcFWXhd07dnChSKMvlxATlk0WxaefsKx7NDuIJKlIC1rlmbFBINY@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkX30Jh8K82v1Pf9YQsFCTIS0jGEopzWcujH0QeSxw17QBzJG
	T0oOwy9rcWdyMY6mUR8ETStSM/KcUey8EMSW2PiFMQGD5H4uDJD5b9xtnBdTjGT7DYHUWxNHVs1
	JkjvIa8pNS3pUGY6vt4kulcMDu5HkQAbAus447Pz4X0MBVpauE1OrfxTE89+npb7HhqmQ
X-Gm-Gg: ASbGncvcVh3zzaOkwoxgoIjm0pQiwrLUiukhcFQVAs60CrD5RmLiJcYj4BFi8JFUOzr
	3ujmBFBDtVi+p/00LBAFMBOQiA+wdRK5/Dc1wPGk1+UON8yC8QaCmF3GpEbVxz56gPtW5sQL8i5
	UAPuNvIIDuMQEOnnxdq6Q4FoVRuHwNRk1F7NifnBZxg02VsHGnVrLmsKRX08OYk5QdKx6KHAOai
	kEFjcfVPsntcmIDjqaUvKMVPELhpvQWx2zQKrrzKUE/L7457ImytOsKrsANqJ4iR6RDW0TZ8B3U
	qamZW+aKBC06AjG0mdYR6zlC2f+HnNou1IO5r2Ok9OGsR78vJ3fsm9/Xk8hAm/wxWfLscoAsWBX
	e
X-Received: by 2002:a17:903:3d0b:b0:24a:c62a:dede with SMTP id d9443c01a7336-24ac62aea77mr145251155ad.26.1756912442909;
        Wed, 03 Sep 2025 08:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVvxveVOhkQWe2XBaZgNd81gr3PM1rlr7IZRl+AQORLEL7olQsqnPY/Lmo+ZFAIsPUQi/Fdw==
X-Received: by 2002:a17:903:3d0b:b0:24a:c62a:dede with SMTP id d9443c01a7336-24ac62aea77mr145250685ad.26.1756912442311;
        Wed, 03 Sep 2025 08:14:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 2/8] arm64: dts: qcom: qcs6490-audioreach: Add AudioReach support for QCS6490
Date: Wed,  3 Sep 2025 20:43:31 +0530
Message-Id: <20250903151337.1037246-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b85b3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RwPLVlW_fRfmQ7ZdlRkA:9
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CsVHJono8QfBBBdzL2u9j-RF_5K8q_4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXzFdS9d3FoXQd
 +p06RvM0W2ZSCpGnedPwcmupCqazUGarm7jYI2RhNgO/xGJpbejjQMDwvwIpP3UHikfVKXLBNrc
 UB/eGVfyfMviN9LC8381hBrNdm3vlMSr+RDPhJ3iiIWTinYuE4L8yni72Q77nTbEhy3xW0T+4/x
 dDnqO0WMK8zyqlD/uzPddxynBx+AbjjHQmHyDATSEUF7TV7uClugDxkkC9vJ5gnupSN0Qifj6z6
 WE6MOrBDEZS7UePeCJLMUZoS1wnOGi5vhakBxs37cU+U6DUavDpL4Q6aM2YypzyB5e6Oze9cdl1
 Ucgcd1JKrtUqsX9I5b6slfF2iBnGUTxgavuL5NHtaoONn7u4rehNNwK/OkM0u6BWjskoWgHpsmO
 lqU2rYC9
X-Proofpoint-ORIG-GUID: CsVHJono8QfBBBdzL2u9j-RF_5K8q_4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Introduce qcs6490-audioreach.dtsi to support AudioReach architecture on
QCS6490 platforms. The existing ADSP Bypass DTSI files such as sc7280.dtsi,
which is tailored for ADSP Bypass architecture as they lack DSP-specific
nodes required for AudioReach. The new qcs6490-audioreach.dtsi file defines
nodes for AudioReach specific components such as APM (Audio Process
Manager), PRM (Proxy Resource Manager), and GPR (Generic Packet Router).
This change enable the audio from the legacy ADSP Bypass solution to
the AudioReach framework.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
new file mode 100644
index 000000000000..980499fb3c35
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Common definitions for SC7280-based boards with AudioReach.
+ */
+
+#include <dt-bindings/clock/qcom,lpass-sc7280.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&remoteproc_adsp_glink {
+	/delete-node/ apr;
+
+	gpr {
+		compatible = "qcom,gpr";
+		qcom,glink-channels = "adsp_apps";
+		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+		qcom,intents = <512 20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		q6apm: service@1 {
+			compatible = "qcom,q6apm";
+			reg = <GPR_APM_MODULE_IID>;
+			#sound-dai-cells = <0>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6apmdai: dais {
+				compatible = "qcom,q6apm-dais";
+				iommus = <&apps_smmu 0x1801 0x0>;
+			};
+
+			q6apmbedai: bedais {
+				compatible = "qcom,q6apm-lpass-dais";
+				#sound-dai-cells = <1>;
+			};
+		};
+
+		q6prm: service@2 {
+			compatible = "qcom,q6prm";
+			reg = <GPR_PRM_MODULE_IID>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6prmcc: clock-controller {
+				compatible = "qcom,q6prm-lpass-clocks";
+				#clock-cells = <2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8561fc217229..9fa294cc9a3e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3944,7 +3944,7 @@ remoteproc_adsp: remoteproc@3700000 {
 
 			status = "disabled";
 
-			glink-edge {
+			remoteproc_adsp_glink: glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1


