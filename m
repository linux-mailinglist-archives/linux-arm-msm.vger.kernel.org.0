Return-Path: <linux-arm-msm+bounces-74821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B3FB9CD99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 995521BC5051
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A051EDA02;
	Thu, 25 Sep 2025 00:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POdwNKJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C61DDA1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759465; cv=none; b=O9ZPdQdJIOQs/m2D+yy9ApCPel7NdmeYkPIDwey1nVypw36hlaCrX5VOcfGuLn6nO0jM3VimAL+h9R/7ThFx2M5lCXMpkHTkFtV/H/fqfDpIuUcsnhgrdtFkvBTFMBSi93LpeREKRg6brh70z5SjqaBISfNc8H9BQxRu17i1Uoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759465; c=relaxed/simple;
	bh=dWVstGcjfUlYpArThLM1He0wAEvI/zOqzc5RgNZfA/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4HuDJjXZDstmTKNIEkRtZXoemkAKVTx5azRqmFyYOX1AUO4NJmAv9Q4XsKfE7DVYGLtFf9Vxgil+x/jo5+KvecvykprvtLiGhEWzSg2tMhW3vX+CdyzHR1wRTpzt7CYkY6PfK5q0hjFO1pdR6ocIFKAX+DL1aYPN92Dcfd+8UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POdwNKJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFGP6019923
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGTfHIwxwFijCtHSOZjsJO/1D5QjNvlu4mqTpOeWZ3w=; b=POdwNKJQB5/x2/g1
	mb8usZ4U0LIKPaX7V0+jjc/v3pjHhcbM/jXViHMExvr+oILP8Cf5raepchQN/JFC
	tnvqLZeXqeGkPOZJqpxcnIJcruTwtMtaujoM6lT2XyfDkE6dX4oZqBOwGNOGGKcV
	zdVGzM0jfjeD4oky83YmrNDKF41/qG69NFHLva3+L1NffvXYnpLDDuneEAc2zPlZ
	YVzF1pqqeM4Hk02TuGv+eA3PM7DmEK319Nh7acQWnRL18e/SCxgEZiR1wCL/yUFT
	ZWcaW4wX/xoME+hc3iuiUn4lyrK2KhvrlHdG+Ts6TM9HbCSzTV2Pid1obDmtLUbQ
	beB25g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyc1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b554fdd710bso216014a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759462; x=1759364262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGTfHIwxwFijCtHSOZjsJO/1D5QjNvlu4mqTpOeWZ3w=;
        b=k3JLW35qp48Hv88rk/a2AbrHv+Ks9uEXnY30J9Nx3eP131o/mcOGgwKVJ4TY1jEug6
         u+b2RfEIkwtaLCHmkxdndC9M6OHeSm38lTHG2FrZqCq2aP9h0cx9hWolC0KJ9gh3KCsJ
         sPUUEQ/cYh9jmfmu2tk7hd8HQ0g25yD+2vzsbQO3UsQDeQ/pxNqaJkh9DBtfD/zG8b66
         OVTIQIiBOWxbDWDy6Q0JJZhsnlaEBclZLc+Gol88HtVyKgwhEtFhUdUh5MjUWmcOXrSW
         LjDL0pkZ1oveZFgRdTJCI1teeFRVqQ+UG4bM4U9oPCYrndhzFyOIUg6g4q+81WZekQNX
         iXig==
X-Gm-Message-State: AOJu0Yxa+HjfhCfOm8Y9SDeHDBbctU8BKxT1VuCOSWEmisjRzR/wlXXx
	EPrvhJ7qWPgOet17UqBeBvNMwuCdXzpWYXEgjoAH9bSxXYbC/BQkwAFb71J7aqia1LxISCsdK95
	LHxgDxBhGV5lfwuBCoeL0WhS9duzxLF3qe9ju1LRFB9qW0KNOLnxHDhb1G0JlwW4hqT5y
X-Gm-Gg: ASbGncvYL+asA1dZ5avQAHQlHDSk1e2+qVhJIipKSOs91Rt71x6xaF6lhQ9Y/nh5F45
	nX9tu9UU1IT8+OBO9j1gXKIu3HaMuUiytHzWhVg39/GL0FQebCLFgFJL5A3ePCyZwHMQkeEEqOI
	521HlTKCWHpU+u+WfuKgDbZaT/546+DQvQEQtu4K+2Xs4HeGvDWMFUa8llRe09S+yLsgpOlZlsV
	oeIO02czU0OpeCG7PvcULzKc9R63Zrst3ouPGAZPIjae0hzcruAt6utY+NHADL9mdGwDSm6saGV
	3iqPJKCppolIJyjFhtxpzJg47YCf6bePJrFIQo412qIxN+6jrkl2USMz+irTJYGe6K5FXToY+jP
	l/X7X7OcDswyYCOg=
X-Received: by 2002:a05:6a21:32aa:b0:243:78a:828c with SMTP id adf61e73a8af0-2e7d437a418mr1555365637.51.1758759462269;
        Wed, 24 Sep 2025 17:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4FTAf4ziOoN9i+efwRtUuMhLN175bzoyKymDK3F8icT94qBW4kq+j21aAEQ6kYsLm+0dJbw==
X-Received: by 2002:a05:6a21:32aa:b0:243:78a:828c with SMTP id adf61e73a8af0-2e7d437a418mr1555338637.51.1758759461817;
        Wed, 24 Sep 2025 17:17:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:26 -0700
Subject: [PATCH 09/20] arm64: dts: qcom: Add PMH0101 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-9-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=1787;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=m16FfxsV01/mF7qhabiQIMCbcbwweTi0bmJ24HSfjas=;
 b=XaUXqKxq3Kimacuk/ZSkSmYGCREKRiNqbbG7XtKBng8YDWFud4XluXwW+5hXkj+Jf/uaUBSH3
 pLsyx6XvLHnC5CKWUXcXY2UK61EF/lTsYpFuf5WNJNXlB+l9lr3pSMP
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: dT4q1Cw58cNCseOQUlPJIyjPzCwnWKC6
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d48a27 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gbZkXL6S0Imj7wUG7vEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dT4q1Cw58cNCseOQUlPJIyjPzCwnWKC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX/ch3pm9wUHz7
 wrwnhQyo658HRoQxcz1Y5a3i6D4dYB/p/FSeFpAztyH5HAfytedxwyCs+fycizOvkgBSyUGs5bG
 Q0HtbSuCLU5MpUrZnuTVfBx+3lJfFXrVwCxB1vaVHQRONrM8ubXSr4mijXqEX1A76Rf7bEFXh6h
 VRLxbvI/nFuK7oyWQYApe+UoGJopGNwWbS+CmXK1InhDKt6zOnk5oG6uwgIJ1ELH+qjCmsBmSHR
 f4LtOW5CLx6gFd4+YG3P2AWUcodLXspJaj3FviJfMpxc6TsIJaocgjQ49Bzcx9vRYxB1sPkl7HU
 A+k5QJbkImcfPT7f6nKPOYZDSkTvVrvCChq5B1abah6adRmqxzBIiU6FR2iH9xTH1g84TrajEnS
 0Z0BrtSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add base DTS file for PMH0101 including temp-alarm, GPIO,
PWM and flash nodes.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
new file mode 100644
index 000000000000..831c79305f7a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus0 {
+	pmic@1 {
+		compatible = "qcom,pmh0101", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0101_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0101_gpios: gpio@8800 {
+			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0101_gpios 0 0 18>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmh0101_flash: led-controller@ee00 {
+			compatible = "qcom,pmh0101-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+
+		pmh0101_pwm: pwm {
+			compatible = "qcom,pmh0101-pwm", "qcom,pm8350c-pwm";
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.25.1


