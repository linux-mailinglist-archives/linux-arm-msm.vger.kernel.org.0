Return-Path: <linux-arm-msm+bounces-44953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635AA10010
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CE416426E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05355235BF0;
	Tue, 14 Jan 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWVuCk/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865A3231A48
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831150; cv=none; b=A/kaRV/FU8dL9G6COj2kLoKy7oehgqtLjwVum20CQ1KQVJWk1Ev/VCTy92Lul4Gdp8Nxp2myb2CCiHjwbs+5mAkXZU9IZQqEa0D+/l8ULKbGTNeimzi1rz7aQD8a5xa1/hPaK4apTHdDw2+Ye3+6D/HvNteEH8zGdTTf0c9l/tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831150; c=relaxed/simple;
	bh=0VsZDRePzRoN0Q0mxLTGRZ4UObLYSHWuETSTbRWlDng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VA2LWMaMbl2FCysumwqrTxj/R9FdzB+1ZOtGZU/KDLmBZwnT7jzI3ho42NYF6t3U34gJuiz70QlcU7Ba+weCCelHFbOPNQmHAhytGeaSLjIXY5izdYp5lgPp9cHiZ0ZVbXbzb27K8WOYNH0HpA1ylJPR9B/s4P81z4lA8nXPJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWVuCk/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E27RHi027624
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBKXeGSZQxrf0jZiT5W1If6viY8DX4hhAQZtfABqOKY=; b=hWVuCk/MAcDYYOvk
	Ca0WV4aWaPIvdvdpxwf6unx3BiQHGCbZdniMoXV48EuLU4pk91XMDfbzijo2Xvhm
	E/RjMrRXyz3smxKyk7OezD/9apaQUbBZddHBl+9YvWNEvDd5xYtWenzczfO/cQcm
	y8Tz4W4adxlyNJ76ETx0Cp+jZ3KAGQyChOVVtdiZMq9V/QeKSfcfPwHTZUsNOc0I
	JCrDOtN7AorAW8mrCbMdamthEwutU+Rg0vzNTgJwIaZMSJYQhROT/5Ah4xruOQI+
	NHaWWezZ0u6IhlgYY2X/rQwq0+RevxFxobWK7t0TZwKz4dk3W/mZ+SsHk3zyMG1x
	vsJWhg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445ev78bca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-721b270290aso2715311a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831146; x=1737435946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBKXeGSZQxrf0jZiT5W1If6viY8DX4hhAQZtfABqOKY=;
        b=QTXuylGNFMg4/q009qLQ3DsqjwX0hiogCkw7tmbu8ipTLWbK6P+WXxpjv/WsTBOq8Z
         xaa0AKVkdPjQiJ0wMhBQwzNCY2ocDo9n4Bd9zGbJlbpVyXuBiHo2XU/hYkk8/CIBbPC+
         5381uEsB1en6MnoBa6dJjg/9azlklNF2e0m3dz32Pgkbfl95LLVupJojcYF0b47wAhgC
         p0LqGfdHphJztGfeqPLSMJJcJeCBjkXIO/Pl2+rP1xUXDkI/ZuvKXV95yqfCG8BJUASG
         MDECsNufhV8PKN3ffNq4ZuNMPG8cXW8wXFUWcAlV4K9c+22p5fdYomLFQxhqkd3KOcLN
         Z7ug==
X-Gm-Message-State: AOJu0YzjDgKcQJ9t205N/ckTZJP9BMiNV5RKl+dWhgo1IB5nWerrBx0G
	UxPswVSrBXh6jm7xI4R43zxIUaG7oOWaix8C33dKx4e+AA1zGgxmbbbUvuOUPLqUXzGP3uHWnhD
	d1rTvB8VeNtZ9NH9qcMrtrXLXCvkO+13442/o54aNtsrcpxHR0XgXxad3kM5uECW3
X-Gm-Gg: ASbGnct3oVnx/oQ8NWgYi7DvkfmrSlIAVUaQnxFonOnSGo0+4iN351D5Vivhqdy/HhJ
	RSSoHCZA4GzSTjAvO6kBSuxBDcVwnFUaIpdS1hqfuNAycyrJ2g0AG0Av77wSugeVBIelYTtinB0
	6GZqKr+Zqrz/UzpV3l76RJTEBZin7nl48+BjecM3+M3WQx0cqqdaxr8vyyqxxL2kK89hl2HDzHm
	ntO8Lep522jySgz8auUqkgIaFEN8wd8SRNGNRqvUOLEI4gH4A6/sncvBNZlT+7iCTjZtC52VJbo
	aGDQPzxCl93ewrOWaPMCYTLW/Rv12R+3it2bfII4R9ubKhQAdlrLyIw4
X-Received: by 2002:a05:6830:6610:b0:71e:1c5:4f9a with SMTP id 46e09a7af769-721e2ec120amr15921028a34.25.1736831146528;
        Mon, 13 Jan 2025 21:05:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4+Nk9t07KonDc7HgBERD0FxZBuebkIVe6elAiIke+S8IGF9M4H7xgShCXU55t+t36vuhIZA==
X-Received: by 2002:a05:6830:6610:b0:71e:1c5:4f9a with SMTP id 46e09a7af769-721e2ec120amr15921011a34.25.1736831146121;
        Mon, 13 Jan 2025 21:05:46 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:45 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:35 -0800
Subject: [PATCH v3 02/12] dt-bindings: usb: Introduce qcom,snps-dwc3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-2-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19774;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=0VsZDRePzRoN0Q0mxLTGRZ4UObLYSHWuETSTbRWlDng=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIUqc16DJtsGZ7yZYIT6DuPKABUSEfB5+kP4
 e62FdnN4peJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW3cBAAnn6IzhnsYWOGb/DDEzSdRAEjyuz9OJd7RinV4ni
 jU6dKufDpuB5Dp5sG9JwsDW5yT+gI17OulVGjM34N3GAzAfK+Y8ZwbwM/clj3guY9qkg2aNC1ok
 Sl3b22QAF7yqz0rD2l4pnRFlcXmH4huEkNWMfC4fPIoSEFUx8j7EHdZi9peLc3cb6tLeeiYJAHX
 veRaFqM0FvsAZJxA9mm/4fhg8GCY3iyuq02fKOLZhUyNkQKedODjUvo26mmz3vsLFvlMfjsKrcy
 6CvNGIPtJFuO6XsIIdb3fTHXJyMW7whUjtTrA1mOATu0UykUxUw1jU1dxu6gC7vlhAfwrhpvGtB
 HQd16GjnYBEd6tVgrqGbBndNEasV3YjF0a/OXJUwQ90SN13Yn6RU0ga8bXrw2a1k3XRXMYOSOVE
 BMNvMbsr6FLhsSQYerWm1V1eel00OxUaLR3odXuTfaa4SlVi/YhTfzm723ZC+vTo7PlNHUDQtMC
 BvRg9sPypR8smnCkg6zH793x0bTpsf7HOmbRkvvvc9IcsIi+B1S+0diwn1PfsuHXUJKP5IAYBf4
 5JcwhoOjPZWGKLx+PaEHD+UxDKugK/uL5x+3UkivPdcoTQl/DjtmH1OuuMb0WPPp3mDIu6ixQPU
 UCZJqGC0hacrZpdmY28PId/ZUNqWilXIEh7OFbhY4jr8=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: IbrbjN2EqSpNLbD2iIXCBi8m3nBVWOdc
X-Proofpoint-GUID: IbrbjN2EqSpNLbD2iIXCBi8m3nBVWOdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140039

The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
several of the snps,dwc3 properties (such as clocks and reset) conflicts
in expectation with the Qualcomm integration.

Using the newly split out Synopsys DWC3 core properties, describe the
Qualcomm USB block in a single block. The new binding is a copy of
qcom,dwc3 with the needed modifications.

It would have been convenient to retain the two structures with the same
compatibles, but as there exist no way to select a binding based on the
absence of a subnode/patternProperty, a new generic compatible is
introduced to describe this binding.

To avoid redefining all the platform-specific compatibles, "select" is
used to tell the DeviceTree validator which binding to use solely on the
generic compatible. (Otherwise if the specific compatible matches during
validation, the generic one must match as well)

Mark qcom,dwc3 deprecated, to favor expressing future platforms using
the new combined binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 618 +++++++++++++++++++++
 2 files changed, 630 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 8fd02e8aaaa5..09907e492563 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -4,11 +4,22 @@
 $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SuperSpeed DWC3 USB SoC controller
+title: Legacy Qualcomm SuperSpeed DWC3 USB SoC controller
 
 maintainers:
   - Wesley Cheng <quic_wcheng@quicinc.com>
 
+# Use the combined qcom,snps-dwc3 instead
+deprecated: true
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,dwc3
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
new file mode 100644
index 000000000000..e0369964d495
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -0,0 +1,618 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  Describes the Qualcomm USB block, based on Synopsys DWC3.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,snps-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq4019-dwc3
+          - qcom,ipq5018-dwc3
+          - qcom,ipq5332-dwc3
+          - qcom,ipq6018-dwc3
+          - qcom,ipq8064-dwc3
+          - qcom,ipq8074-dwc3
+          - qcom,ipq9574-dwc3
+          - qcom,msm8953-dwc3
+          - qcom,msm8994-dwc3
+          - qcom,msm8996-dwc3
+          - qcom,msm8998-dwc3
+          - qcom,qcm2290-dwc3
+          - qcom,qcs404-dwc3
+          - qcom,qcs615-dwc3
+          - qcom,qcs8300-dwc3
+          - qcom,qdu1000-dwc3
+          - qcom,sa8775p-dwc3
+          - qcom,sar2130p-dwc3
+          - qcom,sc7180-dwc3
+          - qcom,sc7280-dwc3
+          - qcom,sc8180x-dwc3
+          - qcom,sc8180x-dwc3-mp
+          - qcom,sc8280xp-dwc3
+          - qcom,sc8280xp-dwc3-mp
+          - qcom,sdm660-dwc3
+          - qcom,sdm670-dwc3
+          - qcom,sdm845-dwc3
+          - qcom,sdx55-dwc3
+          - qcom,sdx65-dwc3
+          - qcom,sdx75-dwc3
+          - qcom,sm4250-dwc3
+          - qcom,sm6115-dwc3
+          - qcom,sm6125-dwc3
+          - qcom,sm6350-dwc3
+          - qcom,sm6375-dwc3
+          - qcom,sm8150-dwc3
+          - qcom,sm8250-dwc3
+          - qcom,sm8350-dwc3
+          - qcom,sm8450-dwc3
+          - qcom,sm8550-dwc3
+          - qcom,sm8650-dwc3
+          - qcom,x1e80100-dwc3
+      - const: qcom,snps-dwc3
+
+  reg:
+    description: Offset and length of register set for QSCRATCH wrapper
+    maxItems: 1
+
+  power-domains:
+    description: specifies a phandle to PM domain provider node
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - cfg_noc:: System Config NOC clock.
+       - core:: Master/Core clock, has to be >= 125 MHz for SS operation and >=
+                60MHz for HS operation.
+       - iface:: System bus AXI clock.
+       - sleep:: Sleep clock, used for wakeup when USB3 core goes into low
+                 power mode (U3).
+       - mock_utmi:: Mock utmi clock needed for ITP/SOF generation in host
+                     mode. Its frequency should be 19.2MHz.
+    minItems: 1
+    maxItems: 9
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: usb-ddr
+      - const: apps-usb
+
+  interrupts:
+    description: |
+      Different types of interrupts are used based on HS PHY used on target:
+        - dwc_usb3: Core DWC3 interrupt
+        - pwr_event: Used for wakeup based on other power events.
+        - hs_phy_irq: Apart from DP/DM/QUSB2 PHY interrupts, there is
+                       hs_phy_irq which is not triggered by default and its
+                       functionality is mutually exclusive to that of
+                       {dp/dm}_hs_phy_irq and qusb2_phy_irq.
+        - qusb2_phy: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
+                      expose only a single IRQ whose behavior can be modified
+                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
+                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
+                      of PHY address space.
+        - {dp/dm}_hs_phy_irq: These IRQ's directly reflect changes on the DP/
+                               DM pads of the SoC. These are used for wakeup
+                               only on SoCs with non-QUSB2 targets with
+                               exception of SDM670/SDM845/SM6350.
+        - ss_phy_irq: Used for remote wakeup in Super Speed mode of operation.
+    minItems: 3
+    maxItems: 19
+
+  interrupt-names:
+    minItems: 3
+    maxItems: 19
+
+  qcom,select-utmi-as-pipe-clk:
+    description:
+      If present, disable USB3 pipe_clk requirement.
+      Used when dwc3 operates without SSPHY and only
+      HS/FS/LS modes are supported.
+    type: boolean
+
+  wakeup-source: true
+
+# Required child node:
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8064-dwc3
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Master/Core clock, has to be >= 125 MHz
+                for SS operation and >= 60MHz for HS operation.
+        clock-names:
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8996-dwc3
+              - qcom,msm8998-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm6350-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq6018-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 4
+        clock-names:
+          oneOf:
+            - items:
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-dwc3
+              - qcom,qdu1000-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,qcs404-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-dwc3
+              - qcom,sc8280xp-dwc3-mp
+              - qcom,x1e80100-dwc3
+              - qcom,x1e80100-dwc3-mp
+    then:
+      properties:
+        clocks:
+          maxItems: 9
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+            - const: noc_sys
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm660-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 5
+        clock-names:
+          oneOf:
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: iface
+                - const: sleep
+                - const: mock_utmi
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,sar2130p-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8180x-dwc3-mp
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clock-names:
+          minItems: 5
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+              - qcom,ipq6018-dwc3
+              - qcom,ipq8074-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8998-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-dwc3
+              - qcom,qcs404-dwc3
+              - qcom,sdm660-dwc3
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+          maxItems: 5
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq8064-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,qdu1000-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8280xp-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm4250-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 6
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: hs_phy_irq
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8180x-dwc3-mp
+              - qcom,x1e80100-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 11
+          maxItems: 11
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: ss_phy_1
+            - const: ss_phy_2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 19
+          maxItems: 19
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: pwr_event_3
+            - const: pwr_event_4
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: hs_phy_3
+            - const: hs_phy_4
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: dp_hs_phy_3
+            - const: dm_hs_phy_3
+            - const: dp_hs_phy_4
+            - const: dm_hs_phy_4
+            - const: ss_phy_1
+            - const: ss_phy_2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@a600000 {
+            compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+            reg = <0 0x0a600000 0 0x100000>;
+
+            clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+                     <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+                     <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+            clock-names = "cfg_noc",
+                          "core",
+                          "iface",
+                          "sleep",
+                          "mock_utmi";
+
+            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+                          <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+            assigned-clock-rates = <19200000>, <150000000>;
+
+            interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
+                         <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
+                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "dwc_usb3", "pwr_event", "hs_phy_irq",
+                          "dp_hs_phy_irq", "dm_hs_phy_irq", "ss_phy_irq";
+
+            power-domains = <&gcc USB30_PRIM_GDSC>;
+
+            resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+            iommus = <&apps_smmu 0x740 0>;
+            snps,dis_u2_susphy_quirk;
+            snps,dis_enblslpm_quirk;
+            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+            phy-names = "usb2-phy", "usb3-phy";
+        };
+    };
+...

-- 
2.45.2


