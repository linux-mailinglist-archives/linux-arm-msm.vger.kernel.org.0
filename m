Return-Path: <linux-arm-msm+bounces-59623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A56AC5BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209C21BA6BA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABB3214204;
	Tue, 27 May 2025 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMjK2La9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1088211706
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379900; cv=none; b=TleevWha7zVt4x0oyJg26G219NkcGIuxqkUKfTweeijDwOIXUh9yFwfksbN0rT6qM6/s6wrjdjxNj3cgbyL+jAhLNZGgn3ZtzRmOak17Pw8i53GP55G11onaY8lFX/uSRorsRzkUm9/308gvsHiWX/Xw5Esx95g4LGcCGxRiEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379900; c=relaxed/simple;
	bh=Fz5Xv5kyUKBPX7FBV3s+Hc184GjMe84b+FHiXhLBQqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fe5fl9xvHLwCcpfwyWwChKr7UhjppvaePuzRpCjrb6yxzP0dx7Pi/L8FYbvoBpG6uRrYoTgCMe0OlopqOU56vP7APwADD/snrHOpyJ4AfXZTuo2x0NeI5/Q0lqkkuSjc79eg/DHnN6iIO/k8Ctz+CBNbYpi9i1EW85/fxKq2KCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMjK2La9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJpGeH026761
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=BMjK2La916AdOnI6
	lzQQ9SL18WKflK2peCZr8vrC450kRR5I8FDfuL5Pj+GkL8I7Rv9a4P9kDncVKXhM
	dWm826x6Vj4bcq8rJ2bV9duZRQgUoldLVYjQynNoMSbwgmNJJeH4q1yheR54s7b1
	gzHijNHQ1PRSzblnFIb4/kwrupmvXYlEM/+24dkqiwpP2qNr6ImaW/4ktiQy++Nx
	mf6wwLjaOEgMW91/Q00xJNjTfVf0pF67dS3gM5LD+d6DSLYPhgVwM5aGqTE/Iq9v
	7F+Sp+WNciE5LGqCLXJkGJLP2236iK7u0V5yI1+5qszTY8ckSDbZK2z7omAn4Kno
	w2EInQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvpx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:04:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742a091d290so2604416b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379896; x=1748984696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=VWPukNj7BCm4avJX7+LnN9wDkehWcMCmSlaMdVXFxeHEUB26y6aInzsTuvnivZzlYw
         z0LEki+95rrOjja4THmm3E4NY1oJTAD0wzvUGhUBrXCN4r06g4JzA74isy1n616IcvpM
         o8DXjEoV1ad5X49qt7ucrBzK6BfQ12w6k01W9GMy1oKdsPKyFkKsYZRo064D0G+J9KWX
         UyvXzrwYx3xjrh81evPC9wtTINThJ3HrzbzpouBlXiFUisGsq1Pt+IA3Whdjne28+cEw
         GHQCehcZ2ZrCjZb5h5fOUsnYxaiEXE8QMvZDBi/wA1aFNuXwb+WsnyEdx+mp/UISoYPp
         Ud4Q==
X-Gm-Message-State: AOJu0YxuaQLT1nCqPhiqPdLmCLzMKfdnE67Q+1rvH+V/6cXvmrA5GCAw
	tjl3Anoje3m5GmNM93hqHcmt5ICVy95FSFsdwX6ob9kcyWBFXn/CGNFUM67P4e6bxUvOQMb2HTS
	CtD88T53XfmU4RPxSy2UyMBN++CEekontgLK2+gth6cv2qtIgv5UAsBXSOmYVHm901wmc
X-Gm-Gg: ASbGncvIs8kmfLkCYmVJkYQE513lGl5AcTTy0sONgq4Jg0jea2loWhZ6VtkVOLvONqq
	Zu5ds3RZduwUz69JzlgIaoZSZgCSjK7tmPsanR6l2ewEEbTQ6LzzwvyhWx5bGF9xOd8fyWcRA8q
	OkAe2xgD4BPC+4ym9Yv83WDeztoYmZSsFmUFqh/PWHOln66IYyLCgMR+fnC+J6CypMxPSA3FQc5
	VCnSIt3OBx+sc/q+nYin/+upKyYQfrsH/7x6ZSvPJ0QNNL0ClwLydbh6v6eJNh5NBTFGazH+oob
	byhqWaJ+SCVZfcP6CT7sTv/1L/x9C9X6sxq5u2b8y8/t+NQ8B1tSzcEdine7spOop1Q=
X-Received: by 2002:a05:6a00:10d4:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-745fe079d33mr22845424b3a.21.1748379896590;
        Tue, 27 May 2025 14:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmO+062jTwbk+EfgkjkNmUp7R+SdrABrfM3fDJ/G+vfmwLBFmJuRS/yzv+9kvtX5aAipJvAw==
X-Received: by 2002:a05:6a00:10d4:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-745fe079d33mr22845375b3a.21.1748379896160;
        Tue, 27 May 2025 14:04:56 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:55 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:38 -0700
Subject: [PATCH v6 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-2-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=FY9GlYlq2N3inwoifO8SkqjWHfzym3tmZX9bN0v1+GLtkQYvAnQtIlcyN/BdOACenHmj7V2hZ
 v5nudmTRmjBB3osJUy0giMKvuZiEGeBQCXn1Nmhej2+rqFaHmkZ3juW
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: dONE3nteqe8emBzh5-1rokC8FKBywmaL
X-Proofpoint-GUID: dONE3nteqe8emBzh5-1rokC8FKBywmaL
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=683628f9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfX0OLdwLQ3A8TY
 eg9xpMPAPUUSFMy1KRggxtixk8Bc4npGuiphW9NYDLOwdJvg3LA3rtTXVRfs4HwFyPVbAaEMxpK
 fv4SDaiRMvV1gJIune3dCwA2sj/sDhFGZyQrAK69kxogvsLIBFClh3KSQqCxrUPEXgw4IhULlRs
 KTwNhGdtvVe9qD6UhnWnMQuPb4R46YwFT3OdTsOXts2C/hu2xE8By9EWpFZpoEPgracvRs8lojD
 q8Bf3K0XSM7Y67S5uEhP3rI+gyYTZWtCSmd0kfZthGlvWnt/QBFILm68fRfKxBfJ4+3Dz7nWqgU
 QHkdC68DYXaNm30fEI2hMfG7O8D8tzH2+PAUh9N7qeLieCGmi8jqj010Ik3679lEdtWRRnxJO4R
 dPYE8/A5ScWkyXUEshzIqz518ig67lF6mquqgcOlnT/tfAxJFpNni3fvEZCXW91Z3H1rXvs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270177

From: Wesley Cheng <quic_wcheng@quicinc.com>

On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
binding definition for the PHY driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c84c62d0e8cbd9fc1c0da6538f49149e5bc7e066
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,m31-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M31 eUSB2 phy
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  M31 based eUSB2 controller, which supports LS/FS/HS usb connectivity
+  on Qualcomm chipsets.  It is paired with a eUSB2 repeater.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8750-m31-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc_usb2_clkref_en>;
+        clock-names = "ref";
+
+        resets = <&gcc_qusb2phy_prim_bcr>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+    };

-- 
2.48.1


