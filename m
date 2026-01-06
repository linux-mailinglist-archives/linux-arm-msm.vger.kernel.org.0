Return-Path: <linux-arm-msm+bounces-87667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC2CF7EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 12:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D932E30D2D19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 10:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F4332721D;
	Tue,  6 Jan 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6HF5YrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTrjlpy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B25C32E72B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696872; cv=none; b=ACKCFJisxiE6xSuapufUW2nCaSttVbYi0y8mo38gH+pdrqqTTbFzp7qXsBhxzdoLNgUDASYekBcIuDdkoseNZCLAxv4poQPlcEz6tcsfhWscoQwA61/0a257LXmuFPG2O617DW7DguNjM6wHC2SXTlvWCfSnzy4d+YZLdFUyh34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696872; c=relaxed/simple;
	bh=ChSwLgMXBYfRLl5iNYXOyxGFwIfm6Ww5klpEKyxtFXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=trtlGsHr19/xPMABALwEJ8YUjYJ3CP13TyIALr4G4WZNfpBAsu33/DuvIgmOrMteD2TcYEuGTQd9nzIrctGfDmF+lG0nafFT8ui5fnwZijiz0nFUp5QXvsJXQ9RsaLrnu0YyeiQzB+gYE1ZASa4vF6mPk4AfzXlALW/fgEURE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6HF5YrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTrjlpy1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649YBA2255188
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 10:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=COr/MJqZagV
	MC+bxYO8mSr6+tsNCpFgwipMOHKn6q5Q=; b=I6HF5YrIHKk2maaaMPg0N49Fx3Z
	oRcEJeEBPxzS6YjqkGg9oJAK92IWgoPmvNwV81jzftVvjxuI5mmie6eL4z5O5FKh
	6oWTCgjMCrtriX+Un0dSFrhVhlqi25oUKTu1AtFWYz95xRB4hKhF690NY39jLpvm
	h+dJ0yzdgxw0SkYuH3Zg2vyt3R3z5U0mkwq26BbGL35BpXTleYZ9KXkU3noF2Gw2
	dZagPap0VRyq4kHYocDHg0yNUY8P8P3aCAaCiRGdmyTVWuZEf66D32qP+6eBmTpd
	jV7q1lmBY6HxtvymtNiLUYGRhRz9aV7+jvy5wCN1ID/l2DYqHxmV+KjTCHg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu42141n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:54:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d5564057d0so2554709b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696867; x=1768301667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COr/MJqZagVMC+bxYO8mSr6+tsNCpFgwipMOHKn6q5Q=;
        b=FTrjlpy1JKcEqcEwihvXDXaBbB4tNKaE9hdSgSvV2unBeNE0IoHw1p7DnCF9dfkcos
         tiZLUdMPvU23z+it+ujXUYueyM5X11cOCnQ2LldythuIFS3iIJcBQDJ1K7TVPfUt1UQl
         iga2skUF6L8w4oZILSoqdymOUA6EOEFZDVKonQpZn7QkJ36sqvqX/nJwM6BKS7h9fTcA
         4yL7IqN1m51Zqn3CrFiApRvICPg95kaI8MlXhtJ3WZCW5gU9exnJsCayB5yon/RhoVqu
         3eF5xLADmCMnO+HqX8Qs/Ho2ltpN1Rjqs1CC688MUaNaDUpxMvUvmGHGTd/Zjd70I0sU
         vIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696867; x=1768301667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COr/MJqZagVMC+bxYO8mSr6+tsNCpFgwipMOHKn6q5Q=;
        b=mi34vX8pgt8X2Ex+KX01xbn8p/OibgTyUHBZxk9G1SlFsHqk2IdLHV5o1V+7ES5+fQ
         cbfIznOvjB9JvHe9/TqEFQfynDDidQomNfn0pXWJZkbagxF80YqivBRcQfmoQOxJpF6F
         v3mt/9qYAwF52PqCR0AaDfnv3cSVIMGlW/wJkpoOJshvwpacoGP5/VvDgOdnJ4PqRIj7
         INEaTg0VbLtbpvKE9+bYx6gkauYdRPg2F4bj0H4nHm/i8qNZVmxQROHUnxXIs4gCKiw4
         rHkd/CnXx5b59hxNkGTqPYVFk8XkqtO75Sb62FqWHDa5p3rsNu+zcOJwylu0kERPdfUb
         NRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOtwnICsJd7lhcW/UhT9L+RsZ5m7JVl4pJji8LqkHdK/d/Qq72bHx5kfSKfjW85Gs1HUmxnSR3X8zRlc2/@vger.kernel.org
X-Gm-Message-State: AOJu0YzryHdNaCLY4sWU6IomvHa6ZmyU4FaJBqL31abDN7xq92ay6I8S
	JHOyyxw5Ilu3oGAUuWShMHe3H2ZB+bn52TyWQppTIyHOSjoeIN1xKZQdOxOpVPN/inaXruOsU4B
	MVLh7O4Amuw4hF5gGw8N14JgQL5JiW9j60mDPd9Ocqf3NB+uTW/VhjDQgOkKzMwdtBlUS
X-Gm-Gg: AY/fxX7vNennpl2TwNrkwVSBgXdMhlrNDMQtb7Qe/XlyHBjKiNzcxG8nMxVCB3rT1vh
	orllNluOE8igsTPydF7DEmsgCQs+18dpVQGfh0N9HAFegH0Gcct0MDZYY7vZih+/RXkH95wro3V
	ejRf3IGOPr/k3Broso4OsyS7ZtCbdtfAG6nuGyOGDkv9eItEPiIL+Zl+fli+bLySSy86Z0nJ6u0
	gVvttJ3JJ89vK2wCHl6/fu5jFM+nOCiOrdLv51aqURkyl81Lox5Rl5YQnGPutJXzovCF7w8TkiV
	DATYzrF8jP1BHfPLfsRekewTpCA3qE0R/MlcYpWBQ0JIPB3+KI0mMGFL+bNUotWeAuglGkiwvO8
	5k324vpy7sMDvpJJpnMukPNdmYHG1vkhYb9ui0N6DB/bc7vOB4Xf7FdRkCJ5YkVTHoT2rOAYSXw
	itYsPLxtQGzwths1S7L9VlSyzEIBr/oxVIBSDrTm4=
X-Received: by 2002:a05:6a00:1c90:b0:7b7:c078:9f7b with SMTP id d2e1a72fcca58-81881735feemr2145580b3a.18.1767696867248;
        Tue, 06 Jan 2026 02:54:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZyQDIZJkq3l8819HSZ1iJrsKAC1ryaWLNSO/JatOlYphE+zj+w6/qVbNELkpdsmVGzAJPrg==
X-Received: by 2002:a05:6a00:1c90:b0:7b7:c078:9f7b with SMTP id d2e1a72fcca58-81881735feemr2145554b3a.18.1767696866755;
        Tue, 06 Jan 2026 02:54:26 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:26 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue,  6 Jan 2026 16:24:08 +0530
Message-Id: <20260106105412.3529898-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695ce9e4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=OjzMc1mEqFcyLvt0PQQA:9 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VxGVypiGR8MdnFpQtyKGnJuFKyf1fDyz
X-Proofpoint-ORIG-GUID: VxGVypiGR8MdnFpQtyKGnJuFKyf1fDyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MyBTYWx0ZWRfXx6OYwtXLZxIp
 aMY/H+2vU3LaI8MpV8EUhs+COxDgUNkjnUEg3xY1bugmkTJ0VuXRmC1Cg8QZ3n9PWle2SDhkVrN
 I1Elw+WZ3egO5evhuN7SiMvEzA5e8xOifBLBnw94bAi+t7us944ugkNBJmKn7dekpGk/ke4e7PL
 W8a11M1MFK0hmV2A9FSqOJWqYM5Y4jsEy6JUcPckfyGbU2EiYdYuN3s17RqhD3Lw/Uiaa2KHY6s
 drbceybgfP6qgFdNqw5IPHHtKS6JYL089O71o2j8H/Yqeb485kwmAkIDOMgfSdgAVAh2ihKznsM
 xYJ4Rg2ElIXAAraZcCyR0HY7ZRc6U0eI8cqK0WNWz5dP57pxADPvvQPfY57IiPllG1WdhnDmAhs
 mEPDMjlWau2LOpyU7kpcPuOznQZTV52fUmiQwhyBGBkw2Bj/lkPBmyxAUOr/yKkWVoIRDoV1SpE
 9VPfZ7sm2SaGJJij4KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060093

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Rename qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
    Fix 'clocks' and 'clock-names' definitions

v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
    Drop ipq5424 support
    Update example to ipq9574 instead of ipq5424
    Change 'mboxes' description
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..a73edb447d26
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sleep clock
+      - description: AHB interconnect clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sleep
+      - const: interconnect
+
+  mboxes:
+    items:
+      - description: TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.34.1


