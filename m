Return-Path: <linux-arm-msm+bounces-75259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03144BA2B6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B711D4C54C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6119C286426;
	Fri, 26 Sep 2025 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVd4pMNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE72877F0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871583; cv=none; b=pQ+3k+ozhIJ9wYRr/IwQZrlj8QbLH4Mu+8T0+832rSv5B32yXWoFzI4nw3+mI56LLaDubT4jW1M48CSg4PvKHmNvJ6Lb+2XGIDVyR+V2v0ucWMBEX80pObLp8aYdR/IasZSM3ZFUkl0d65EdfDOWNQIGGYeQMQyhawJJ+NNHx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871583; c=relaxed/simple;
	bh=upWyBh8lqfmu6LV7sTpbUr+WwNLCQ/FfInBDAu5O+9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qc5nclz461ONv77Xo/q9hP/ue9Mnn6Du6opdjSlDXCevvbTE9F34S+Ag9EpURRH0pZnvszVhbBENeg2Ufm4lgLhutVLlT9XYTdRFYenkX5jqwdVOvK15gqSr7YqErhjNGHCCc7DdHaDVvMLnwnNp7R+d9bcoz4QJn4ftr8B8QZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVd4pMNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q7F9KC024916
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e7Hy87wIaFmYTkT/SRJPCIfc6N0tMOhDASgzvKcFpk=; b=XVd4pMNvfugGo4ho
	rsQfGkE9d6MGZmPhUheVr4VWV6ar7uge2eUpr1UnNvtruQoLX4pQ/RcgCRTW+7a5
	OgaU7isGRulQf+1XolJPPBBikmIXPhPmpYHmqk5gd5gQBt6TZzm982CRo6k9sZAX
	X6FbeWzSI01RLoaJQ+KdIjJCvPCRk/WSBsoT2kdRxNdkQQITLGjgJrkD7PdvPbAw
	mDOtsE/pUPRJXRbS6BvKqyeRlqITZSXQK3XgQXAS6t7WjOrMHPo00PENgfVC93Mx
	5EybkFVLjdts/fprbM53MgoKXN1f6SW+hJ+ILirsRlVk9QqjFYTMlS58OTFoyC3i
	MwPH/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34hv3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:26:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26b3e727467so6320475ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871579; x=1759476379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e7Hy87wIaFmYTkT/SRJPCIfc6N0tMOhDASgzvKcFpk=;
        b=p23/f2JaWaR6zfQeRINRLFk3Rbh79Zo0oHNAEkzwIQ2f+rqyqYmncTJ7T7TXNAFDCh
         n7wy7Sd/tuFwv/un/M6dXMkXHLVRnN35K+U0SS9qyVp5mK2+b8dH+qovWtayyTfOIAJj
         xOjjMVgCVKH4Doi3ksK+93YXeqf9pwwlA71ycBkWlPpBXBQO5OOGj0lfmdpgGzZqFF8W
         l6i8c+8WwABXNO7brvjbSBeqAaK7mttrV0GjPF3E8U1TgU8cdlnjuI3Qrwe5JLe2fEe1
         tiqoH5765EHLfH3GS6VjdFR1crDp7/Hxv7LDhWUfUaipWinHE7w3gOZPHulvTHjpVjrn
         pp6A==
X-Gm-Message-State: AOJu0YzA2poCU63z8OI8SfumvppPsKoaZnwT1RWtBzgFUoOW0awsg88m
	z2Lv7wW1lyr2lEyPJjAzDqOMRRCTDtASuOVFh8a8U7nuQ/U+Id35AlDcxV6xH9lPD6NU4LlWOCG
	SIqblxJrFQnRi2teQvEmzE+7ptz66pQ6FWBSrVVT/l0U4pXTgeP9bcv+vdhc9t9bpDUnT
X-Gm-Gg: ASbGncs5azsd+OH9OvxKwFRVVV8vGEOIQQrIVfCHTg/gw/DWOTTB03nwLlbzR/bu6A+
	SyGCiP3QOscM92Uz0cGP4rl2TKveE73DRo3vTcWtPS4LYEkVB3ZJjMs+FUwKpro89gJWW0xyL/u
	Rf1xBSQbxnF0bPhl0dJs3DpRLysfAa/3FYtrE/vIhgmlJNsFMB0603nEL3qWCR3RLUq6WsbcpT8
	ZsUs0AXEKUE4yrPqFqbK5zWuQtIgA49ecEI25nfOCinXXsBpPLS4xVSNbD7rIxKQbE5diuJSTEi
	3O602B0ohaKJV5qIpnu2I4YhryA1+2G797r8Rq12z4E4qs43UBXjT3WpZtBUbusJoIjWXH4/+H+
	6kV4gY5tSuxTkEB0I0M7cxLXlgRlH08l/YH9uqEumCnfEu1dHs/Me5mj3
X-Received: by 2002:a17:902:8210:b0:27e:eabe:7604 with SMTP id d9443c01a7336-27eeabe7ad7mr12133615ad.9.1758871579483;
        Fri, 26 Sep 2025 00:26:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAa2bZIUvZ/fMfkpjyLvaZZws4+i1XtR3RZF24APnyUt8R5PXamasJ9KugA1kJ8xeGnyatmg==
X-Received: by 2002:a17:902:8210:b0:27e:eabe:7604 with SMTP id d9443c01a7336-27eeabe7ad7mr12133375ad.9.1758871578931;
        Fri, 26 Sep 2025 00:26:18 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:26:18 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:37 +0800
Subject: [PATCH v7 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871562; l=3580;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=upWyBh8lqfmu6LV7sTpbUr+WwNLCQ/FfInBDAu5O+9Q=;
 b=JfaeqU3+hlJ1OLbENBUNv32kEiS9ilat5jb4eIX6JV/6qs0s1jIEQdNeG7Q3eHdAOyUTNVxcY
 Ifpbu8NIITtBig+3IbyNrnLGoEmW0ri2aMMjpaGkCrpcwkZhzWWhzrO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX7ZK9jAit9S6Y
 i0ZEZBOO9ruo1PTsgoTS9//+/VyqfrjxG9JoH+sd41mVgW2YG8t2CmR8fhzdhZuDTvGilHcZl7p
 IWQQfq9AZnWtLQMECDVoJaq5y7ITL4i8SGd2d+r5cJGoWz8yKJl0YAFVZ+L/sFYYVzFUeqOjpwV
 K2hcpD9IaSxQoi9EMdwRzOzHF0S9klKg4lsWn1FS3ilr7DI5fPrPxRuPwDwj0YKNZAaU10ngY/z
 pw84oRwfNQWarx9ch9X0bu/HcloJaTrqUo8BKDKirLBHYcMTf0np+BugZO1f9o4w2gVlF4fo6IM
 P+aJcNMH9bnFdvJ87HFv8pdbS2pAg5MRsFPcsu6Yhoajem9RYoz9YwzMO4LLl+0Lo5HHVpsWvdV
 GPDSmvpLZASSHC5B3uhkuTAzLtTTIQ==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d6401c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 8fDYQsgRCmnlqGCflfPKsWxiBOfRhh1L
X-Proofpoint-GUID: 8fDYQsgRCmnlqGCflfPKsWxiBOfRhh1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
on QCS615 Platform. This PHY supports both USB3 and DP functionality
over USB-C, with PHY mode switching capability. It does not support
combo mode.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..efb465c71c1b5870bd7ad3b0ec215cf693a32f04
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both USB3
+  and DisplayPort over USB-C. While it enables mode switching between USB3 and
+  DisplayPort, but does not support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-usb3-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: ref
+      - const: cfg_ahb
+      - const: pipe
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy_phy
+      - const: dp_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  "#phy-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the VLS CLAMP register
+          - description: offset of the PHY mode register
+    description: Clamp and PHY mode register present in the TCSR
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+  - qcom,tcsr-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e8000 {
+      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
+      reg = <0x88e8000 0x2000>;
+
+      clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+               <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l5a>;
+      vdda-pll-supply = <&vreg_l12a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
+    };

-- 
2.34.1


