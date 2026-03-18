Return-Path: <linux-arm-msm+bounces-98350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOPoHm5mumklWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:46:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D03932B8596
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4273163B61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD0C3859D2;
	Wed, 18 Mar 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vop+z1DR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUjAEIBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E28385534
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823204; cv=none; b=tQfMZaaI/6cNlEQZO0+U5HMpGfiMOJotoLEpPn9UI2a8XWZwYV4KjsY3adU1uPxWhD81pa0z7yQjY+bF9to0ypJb+ysqn5TQbpempPe3ma3P1Zowk4iUIG76gd5euybNHYe3tsLG2V58TR5rDUQ3rkE2jZm1bU1nr6/K1OId6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823204; c=relaxed/simple;
	bh=SSDcbH1UgUfCnnxHS2HQGm59E2FOFKqrJimtB/Gw3vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0S4kazsyh7wYeHcfeG3stGVSsQ3WQZBjZrrOSv4mW3DT72u1Vngz1D5T6VWxcYqYwNYOnVEsF/FOJFDUHdnACEh/CnhRiRK9TiNlZdvQxXtSpLmqNqovseiwQa3U5FiTIRnEtR9q1Gxk+s+3g/VVCbxrWE/AJNzmvj0izZf4pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vop+z1DR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUjAEIBw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3EZvw1632379
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZohIDV7+kbFpRZ6BPUUVwVHJjw7ce/77q7NE/f9nIY=; b=Vop+z1DR23+o7v4y
	QtX4zlGvRU8qxlYFr2sdARHxs5lrHh41ElB5TquO5Zl2AwXIpca19vUXb/y/Cd2L
	ySYc3WwBp64GkZ5XQ7BLYcJFmvxnUg9pE0Ji2u+RY8PEyByMW6hcpYAyVO1P2JN7
	eaklo4tqRe8Ng7m5ve6oNUyM4Jb2pSGJphnceXJnBYBO9Ezc/AWe4uXBtcI2j5NU
	++gGNQHNu5WN+HtS8jxLTlYgPFZOncYEpjPsix+JzVtOLYoEUkxzNsRpBwm5bp9+
	W6ZfyNOF5vq5JfRTUyhr7am9ZfC6uSqZ1rqzVA0GpOj0+FJyyCfQ5tHxSTmIpu98
	WcyPQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapukaj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a61300179so4519224b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823201; x=1774428001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZohIDV7+kbFpRZ6BPUUVwVHJjw7ce/77q7NE/f9nIY=;
        b=cUjAEIBw4+zHKH+aUDeFnqL2ZJCd+zuZP/5XyoQ/wtbKXU+0hVjN9swNRToD9pISq6
         0Fw56InzlOCK/hMkpSckm2rbUIYtxwSHfoqP7Br126NIM6qMryLdRk8WqPGUqpjsHgWB
         WGz9wfv5K+3nR98v4X6SjFAcmRB/I3LbvZ6ws6bVhm4jJ5YP1JDCWXIBaQEFP1wHybyQ
         fjvvHc9hIrA7R27YrpZvZzAgqCLrH+XxkYnqatnrorSbeKpNDLAXxgmkMutQp5PzOBlM
         QnTCP/QL0nwR2zMOeRLOX+DXUvjo60mdrqvjzBd2HH+fB1GM+QmIpTJYqPYA5QCBSB/V
         4eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823201; x=1774428001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ZohIDV7+kbFpRZ6BPUUVwVHJjw7ce/77q7NE/f9nIY=;
        b=Isfh1YzhouwGoPwFDtQ9Bi6kWUqssnvnMbUmHdJ56N6PKYM9mu3I4S3GD0DFjDkEpI
         tpc5tu53Tg+ceXworeTL+VEnzfcqGojAqZCO7GuTd994IbkEy1C2MKhKpPlOYbJ6aR9+
         8myer7LGO/mpsYJGTLf/ITk8/yV5EpwjlmuLzwLuUmlG7KeQ5nAv5Gxo/0Syo3GbbhL3
         SyMObgTnee6B3hqJl3KzOoTf+kjBxYPT/Zd8uXMmC14eZqyFXlEjwh8yqP/WT2CfWXYA
         YS+Q15n3cPTUIF38czA2C49YN/NlQ8EADZjzo8ly6CPUizWqeDmb40AxGJJw5okE1Kg9
         RCsw==
X-Gm-Message-State: AOJu0YwoN4tDJmsXcznTF9zzFpn4pl9enbFWoOq5ZjoeFbcelbkhA+i+
	kWFFpJEvFWygVDviNBAlRqHAFNPansxDfz1lE6Cbz/sSCji6+XdLc8ngQFmeWRScgy6zians0rt
	1HRk/bs0RIcVbKtpJUOR86OitkIRoeaZhJUQuGA3EUHKa+yXfkjzhU8b8iFjI6FcqyEUQ
X-Gm-Gg: ATEYQzw0m4GbT+jlkl2/IjEDbx/d3HlBDnQkt72OZ81ulTwZP0QYbonyFPcpazkpl3/
	p3zDt6hfc0C3v4wmrnGfgOyuGOT8Vi+c103BmREQ7A/7RQzWNCIPwhG4v1/bMDADRQqSlo2ZhcF
	tXFRi1+sbJOTvVs4ZS5/F9ib/++GmLYk036p2us2RXNl4Z1wOM/Nx11LmIhACwZmhKDaStJMpAE
	bUj9wIQni0cGqJ1xho6oFdF+kvn4boJ458/JY4qQmBLzzQE25m9B0TLGB+g4b3TajNlewh2Uo0D
	t/oLxrTfgnMxtykoHh7tAhtHjZCmQyt0xxlmmVF9Jozn/qxV42+nsVV+2BpUFATeNcymXDs/HaI
	+2q12KvnqPVEKW5GeIhYNbVCuI0B9Ax7u0TuvswPuW+lkiTek6VU/va46EwXUFSuJUFQ99vD32t
	0vYESY81iD9lMAfzZWfzsU8Caa9bqp9kLJFEP+JUSila5MBRBpkDSSGj14
X-Received: by 2002:a05:6a00:4fd6:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-82a6aee26d1mr2276478b3a.42.1773823200305;
        Wed, 18 Mar 2026 01:40:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd6:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-82a6aee26d1mr2276438b3a.42.1773823199588;
        Wed, 18 Mar 2026 01:39:59 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:39:59 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:43 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: add Qualcomm IPQ5210 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-1-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=12518;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SSDcbH1UgUfCnnxHS2HQGm59E2FOFKqrJimtB/Gw3vs=;
 b=EP6xWDMRidgVey8quFqpbCCY4cTJhZhBmuOTyWJpil2ADB1mjn+++ucW8hkHBmD9nQG6wyQSy
 9x8Hdf3ci1WBT4StvFbk6k0fAN69ABQcj+XJRJ2+VvaYxBs0naJmjAv
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69ba64e1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=os79_l1IAaEW0h9aLhsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfXwLI6IUlHAdtC
 jNdR3ZgyU6MLt6gBbtI4jIucNZbra/6rZOzDY5WkDfBdEOv5/qHNSKPOoXw6ZV3dlL9BW8fKESq
 5pL4QIgEAUaOyvBZqflMsamhdE9hBd+7/w6WZ8OoflvaWaRZYyBAEDuqSthqWKxWbGQYHhg8e/y
 YFHJbBeqauA/b1xO0RB8a6jhYcUfkapBf+NXfAqE6jWbOcNA7AmXyz7zZCoAeoztTCEusC4n+Zq
 zcWuHQKsx9wduVwFR7unkQsHjd94TVn8fU97MGxwlDrSgkH01E2z+bIfRntvHltNkdt5IXcjUNI
 BCrcaYSQQucJGTaTUZbbVdhQqpIXUosV9gOH3l/AS8bQgnvoPer5+/cFlxcukH6x9hpm7fbKwp+
 AhJZ4VJEd8nRFvyB2ofab2D4nNIC7LNkBHYZoPqdiNd6O07FHx4nOFEHS/DRJcCfpbMmoihJagc
 mmHS7TCrj9wjNDvhdGA==
X-Proofpoint-GUID: q7KiSBd2m5_3FO6T2jag6ESWoPLpZP1l
X-Proofpoint-ORIG-GUID: q7KiSBd2m5_3FO6T2jag6ESWoPLpZP1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98350-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.27.119.64:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D03932B8596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add binding for the Qualcomm IPQ5210 Global Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |  62 ++++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       | 126 ++++++++++++++++++++
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       | 127 +++++++++++++++++++++
 3 files changed, 315 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f1cc3fc190855708c28868224a8ac4a1454a7831
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq5210-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on IPQ5210
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on IPQ5210
+
+  See also:
+    include/dt-bindings/clock/qcom,ipq5210-gcc.h
+    include/dt-bindings/reset/qcom,ipq5210-gcc.h
+
+properties:
+  compatible:
+    const: qcom,ipq5210-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE30 PHY0 pipe clock source
+      - description: PCIE30 PHY1 pipe clock source
+      - description: USB3 PHY pipe clock source
+      - description: NSS common clock source
+
+  '#power-domain-cells': false
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,ipq5210-gcc";
+      reg = <0x01800000 0x40000>;
+      clocks = <&xo_board_clk>,
+               <&sleep_clk>,
+               <&pcie30_phy0_pipe_clk>,
+               <&pcie30_phy1_pipe_clk>,
+               <&usb3phy_0_cc_pipe_clk>,
+               <&nss_cmn_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq5210-gcc.h b/include/dt-bindings/clock/qcom,ipq5210-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..84116f34ee4d0433a092987e8d189c2aa95da204
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-gcc.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ5210_H
+#define _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ5210_H
+
+#define GCC_ADSS_PWM_CLK					0
+#define GCC_ADSS_PWM_CLK_SRC					1
+#define GCC_CMN_12GPLL_AHB_CLK					2
+#define GCC_CMN_12GPLL_SYS_CLK					3
+#define GCC_CNOC_LPASS_CFG_CLK					4
+#define GCC_CNOC_PCIE0_1LANE_S_CLK				5
+#define GCC_CNOC_PCIE1_2LANE_S_CLK				6
+#define GCC_CNOC_USB_CLK					7
+#define GCC_GEPHY_SYS_CLK					8
+#define GCC_LPASS_AXIM_CLK_SRC					9
+#define GCC_LPASS_CORE_AXIM_CLK					10
+#define GCC_LPASS_SWAY_CLK					11
+#define GCC_LPASS_SWAY_CLK_SRC					12
+#define GCC_MDIO_AHB_CLK					13
+#define GCC_MDIO_GEPHY_AHB_CLK					14
+#define GCC_NSS_TS_CLK						15
+#define GCC_NSS_TS_CLK_SRC					16
+#define GCC_NSSCC_CLK						17
+#define GCC_NSSCFG_CLK						18
+#define GCC_NSSNOC_ATB_CLK					19
+#define GCC_NSSNOC_MEMNOC_1_CLK					20
+#define GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC				21
+#define GCC_NSSNOC_MEMNOC_CLK					22
+#define GCC_NSSNOC_MEMNOC_DIV_CLK_SRC				23
+#define GCC_NSSNOC_NSSCC_CLK					24
+#define GCC_NSSNOC_PCNOC_1_CLK					25
+#define GCC_NSSNOC_QOSGEN_REF_CLK				26
+#define GCC_NSSNOC_SNOC_1_CLK					27
+#define GCC_NSSNOC_SNOC_CLK					28
+#define GCC_NSSNOC_TIMEOUT_REF_CLK				29
+#define GCC_NSSNOC_XO_DCD_CLK					30
+#define GCC_PCIE0_AHB_CLK					31
+#define GCC_PCIE0_AUX_CLK					32
+#define GCC_PCIE0_AXI_M_CLK					33
+#define GCC_PCIE0_AXI_M_CLK_SRC					34
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK				35
+#define GCC_PCIE0_AXI_S_CLK					36
+#define GCC_PCIE0_AXI_S_CLK_SRC					37
+#define GCC_PCIE0_PIPE_CLK					38
+#define GCC_PCIE0_PIPE_CLK_SRC					39
+#define GCC_PCIE0_RCHNG_CLK					40
+#define GCC_PCIE0_RCHNG_CLK_SRC					41
+#define GCC_PCIE1_AHB_CLK					42
+#define GCC_PCIE1_AUX_CLK					43
+#define GCC_PCIE1_AXI_M_CLK					44
+#define GCC_PCIE1_AXI_M_CLK_SRC					45
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK				46
+#define GCC_PCIE1_AXI_S_CLK					47
+#define GCC_PCIE1_AXI_S_CLK_SRC					48
+#define GCC_PCIE1_PIPE_CLK					49
+#define GCC_PCIE1_PIPE_CLK_SRC					50
+#define GCC_PCIE1_RCHNG_CLK					51
+#define GCC_PCIE1_RCHNG_CLK_SRC					52
+#define GCC_PCIE_AUX_CLK_SRC					53
+#define GCC_PCNOC_BFDCD_CLK_SRC					54
+#define GCC_PON_APB_CLK						55
+#define GCC_PON_TM_CLK						56
+#define GCC_PON_TM2X_CLK					57
+#define GCC_PON_TM2X_CLK_SRC					58
+#define GCC_QDSS_AT_CLK						59
+#define GCC_QDSS_AT_CLK_SRC					60
+#define GCC_QDSS_DAP_CLK					61
+#define GCC_QDSS_TSCTR_CLK_SRC					62
+#define GCC_QPIC_AHB_CLK					63
+#define GCC_QPIC_CLK						64
+#define GCC_QPIC_CLK_SRC					65
+#define GCC_QPIC_IO_MACRO_CLK					66
+#define GCC_QPIC_IO_MACRO_CLK_SRC				67
+#define GCC_QRNG_AHB_CLK					68
+#define GCC_QUPV3_AHB_MST_CLK					69
+#define GCC_QUPV3_AHB_SLV_CLK					70
+#define GCC_QUPV3_WRAP_SE0_CLK					71
+#define GCC_QUPV3_WRAP_SE0_CLK_SRC				72
+#define GCC_QUPV3_WRAP_SE1_CLK					73
+#define GCC_QUPV3_WRAP_SE1_CLK_SRC				74
+#define GCC_QUPV3_WRAP_SE2_CLK					75
+#define GCC_QUPV3_WRAP_SE2_CLK_SRC				76
+#define GCC_QUPV3_WRAP_SE3_CLK					77
+#define GCC_QUPV3_WRAP_SE3_CLK_SRC				78
+#define GCC_QUPV3_WRAP_SE4_CLK					79
+#define GCC_QUPV3_WRAP_SE4_CLK_SRC				80
+#define GCC_QUPV3_WRAP_SE5_CLK					81
+#define GCC_QUPV3_WRAP_SE5_CLK_SRC				82
+#define GCC_SDCC1_AHB_CLK					83
+#define GCC_SDCC1_APPS_CLK					84
+#define GCC_SDCC1_APPS_CLK_SRC					85
+#define GCC_SDCC1_ICE_CORE_CLK					86
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				87
+#define GCC_SLEEP_CLK_SRC					88
+#define GCC_SNOC_LPASS_CLK					89
+#define GCC_SNOC_PCIE0_AXI_M_CLK				90
+#define GCC_SNOC_PCIE1_AXI_M_CLK				91
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC				92
+#define GCC_UNIPHY0_AHB_CLK					93
+#define GCC_UNIPHY0_SYS_CLK					94
+#define GCC_UNIPHY1_AHB_CLK					95
+#define GCC_UNIPHY1_SYS_CLK					96
+#define GCC_UNIPHY2_AHB_CLK					97
+#define GCC_UNIPHY2_SYS_CLK					98
+#define GCC_UNIPHY_SYS_CLK_SRC					99
+#define GCC_USB0_AUX_CLK					100
+#define GCC_USB0_AUX_CLK_SRC					101
+#define GCC_USB0_MASTER_CLK					102
+#define GCC_USB0_MASTER_CLK_SRC					103
+#define GCC_USB0_MOCK_UTMI_CLK					104
+#define GCC_USB0_MOCK_UTMI_CLK_SRC				105
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC				106
+#define GCC_USB0_PHY_CFG_AHB_CLK				107
+#define GCC_USB0_PIPE_CLK					108
+#define GCC_USB0_PIPE_CLK_SRC					109
+#define GCC_USB0_SLEEP_CLK					110
+#define GCC_XO_CLK_SRC						111
+#define GPLL0_MAIN						112
+#define GPLL0							113
+#define GPLL2_MAIN						114
+#define GPLL2							115
+#define GPLL4_MAIN						116
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq5210-gcc.h b/include/dt-bindings/reset/qcom,ipq5210-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..09890a09087c39288683d105437fc68f3d68be4c
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq5210-gcc.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_GCC_IPQ5210_H
+#define _DT_BINDINGS_RESET_IPQ_GCC_IPQ5210_H
+
+#define GCC_ADSS_BCR						0
+#define GCC_ADSS_PWM_ARES					1
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR			2
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_ARES		3
+#define GCC_APSS_AHB_ARES					4
+#define GCC_APSS_ATB_ARES					5
+#define GCC_APSS_AXI_ARES					6
+#define GCC_APSS_TS_ARES					7
+#define GCC_BOOT_ROM_AHB_ARES					8
+#define GCC_BOOT_ROM_BCR					9
+#define GCC_GEPHY_BCR						10
+#define GCC_GEPHY_SYS_ARES					11
+#define GCC_GP1_ARES						12
+#define GCC_GP2_ARES						13
+#define GCC_GP3_ARES						14
+#define GCC_MDIO_AHB_ARES					15
+#define GCC_MDIO_BCR						16
+#define GCC_MDIO_GEPHY_AHB_ARES					17
+#define GCC_NSS_BCR						18
+#define GCC_NSS_TS_ARES						19
+#define GCC_NSSCC_ARES						20
+#define GCC_NSSCFG_ARES						21
+#define GCC_NSSNOC_ATB_ARES					22
+#define GCC_NSSNOC_MEMNOC_1_ARES				23
+#define GCC_NSSNOC_MEMNOC_ARES					24
+#define GCC_NSSNOC_NSSCC_ARES					25
+#define GCC_NSSNOC_PCNOC_1_ARES					26
+#define GCC_NSSNOC_QOSGEN_REF_ARES				27
+#define GCC_NSSNOC_SNOC_1_ARES					28
+#define GCC_NSSNOC_SNOC_ARES					29
+#define GCC_NSSNOC_TIMEOUT_REF_ARES				30
+#define GCC_NSSNOC_XO_DCD_ARES					31
+#define GCC_PCIE0_AHB_ARES					32
+#define GCC_PCIE0_AUX_ARES					33
+#define GCC_PCIE0_AXI_M_ARES					34
+#define GCC_PCIE0_AXI_S_BRIDGE_ARES				35
+#define GCC_PCIE0_AXI_S_ARES					36
+#define GCC_PCIE0_BCR						37
+#define GCC_PCIE0_LINK_DOWN_BCR					38
+#define GCC_PCIE0_PHY_BCR					39
+#define GCC_PCIE0_PIPE_ARES					40
+#define GCC_PCIE0PHY_PHY_BCR					41
+#define GCC_PCIE1_AHB_ARES					42
+#define GCC_PCIE1_AUX_ARES					43
+#define GCC_PCIE1_AXI_M_ARES					44
+#define GCC_PCIE1_AXI_S_BRIDGE_ARES				45
+#define GCC_PCIE1_AXI_S_ARES					46
+#define GCC_PCIE1_BCR						47
+#define GCC_PCIE1_LINK_DOWN_BCR					48
+#define GCC_PCIE1_PHY_BCR					49
+#define GCC_PCIE1_PIPE_ARES					50
+#define GCC_PCIE1PHY_PHY_BCR					51
+#define GCC_QRNG_AHB_ARES					52
+#define GCC_QRNG_BCR						53
+#define GCC_QUPV3_2X_CORE_ARES					54
+#define GCC_QUPV3_AHB_MST_ARES					55
+#define GCC_QUPV3_AHB_SLV_ARES					56
+#define GCC_QUPV3_BCR						57
+#define GCC_QUPV3_CORE_ARES					58
+#define GCC_QUPV3_WRAP_SE0_ARES					59
+#define GCC_QUPV3_WRAP_SE0_BCR					60
+#define GCC_QUPV3_WRAP_SE1_ARES					61
+#define GCC_QUPV3_WRAP_SE1_BCR					62
+#define GCC_QUPV3_WRAP_SE2_ARES					63
+#define GCC_QUPV3_WRAP_SE2_BCR					64
+#define GCC_QUPV3_WRAP_SE3_ARES					65
+#define GCC_QUPV3_WRAP_SE3_BCR					66
+#define GCC_QUPV3_WRAP_SE4_ARES					67
+#define GCC_QUPV3_WRAP_SE4_BCR					68
+#define GCC_QUPV3_WRAP_SE5_ARES					69
+#define GCC_QUPV3_WRAP_SE5_BCR					70
+#define GCC_QUSB2_0_PHY_BCR					71
+#define GCC_SDCC1_AHB_ARES					72
+#define GCC_SDCC1_APPS_ARES					73
+#define GCC_SDCC1_ICE_CORE_ARES					74
+#define GCC_SDCC_BCR						75
+#define GCC_TLMM_AHB_ARES					76
+#define GCC_TLMM_ARES						77
+#define GCC_TLMM_BCR						78
+#define GCC_UNIPHY0_AHB_ARES					79
+#define GCC_UNIPHY0_BCR						80
+#define GCC_UNIPHY0_SYS_ARES					81
+#define GCC_UNIPHY1_AHB_ARES					82
+#define GCC_UNIPHY1_BCR						83
+#define GCC_UNIPHY1_SYS_ARES					84
+#define GCC_UNIPHY2_AHB_ARES					85
+#define GCC_UNIPHY2_BCR						86
+#define GCC_UNIPHY2_SYS_ARES					87
+#define GCC_USB0_AUX_ARES					88
+#define GCC_USB0_MASTER_ARES					89
+#define GCC_USB0_MOCK_UTMI_ARES					90
+#define GCC_USB0_PHY_BCR					91
+#define GCC_USB0_PHY_CFG_AHB_ARES				92
+#define GCC_USB0_PIPE_ARES					93
+#define GCC_USB0_SLEEP_ARES					94
+#define GCC_USB3PHY_0_PHY_BCR					95
+#define GCC_USB_BCR						96
+#define GCC_PCIE0_PIPE_RESET					97
+#define GCC_PCIE0_CORE_STICKY_RESET				98
+#define GCC_PCIE0_AXI_S_STICKY_RESET				99
+#define GCC_PCIE0_AXI_S_RESET					100
+#define GCC_PCIE0_AXI_M_STICKY_RESET				101
+#define GCC_PCIE0_AXI_M_RESET					102
+#define GCC_PCIE0_AUX_RESET					103
+#define GCC_PCIE0_AHB_RESET					104
+#define GCC_PCIE1_PIPE_RESET					105
+#define GCC_PCIE1_CORE_STICKY_RESET				106
+#define GCC_PCIE1_AXI_S_STICKY_RESET				107
+#define GCC_PCIE1_AXI_S_RESET					108
+#define GCC_PCIE1_AXI_M_STICKY_RESET				109
+#define GCC_PCIE1_AXI_M_RESET					110
+#define GCC_PCIE1_AUX_RESET					111
+#define GCC_PCIE1_AHB_RESET					112
+#define GCC_UNIPHY0_XPCS_ARES					113
+#define GCC_UNIPHY1_XPCS_ARES					114
+#define GCC_UNIPHY2_XPCS_ARES					115
+#define GCC_QDSS_BCR						116
+
+#endif

-- 
2.34.1


