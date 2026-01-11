Return-Path: <linux-arm-msm+bounces-88389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD8D0F5A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2B8E3073E18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A07534CFB9;
	Sun, 11 Jan 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8rVpUDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8tR2jPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3565C3081BA
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146572; cv=none; b=Kfojcy9eNa7AAXgP5bymy4646sDK2UVFtJrUNWEspCZTh8biiRK9+XsctwPdiywyP8S8zUPWYg3RRzLvcCB0/OXUHX4W6pcIqpLN+/0DfkDOsH/5D4qBdKz2lxhY/eI3Yyon745TJXKi8gD7n5oiMc/zfs+JaIVfx9Eifw/vhes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146572; c=relaxed/simple;
	bh=8Y5eeW2zn3FKkukeVggq85DPa7zs15vkyJ/66vVtlOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nq0b7vAubcKVjydTQb5/FYceYRvCKR1u5012wFhC7UvGwbT44Nv3CHG/ayfQNqm3FMGeGdWK4J8Wd9J27UT924bouJL42SkW7e9qA66unmOaQCZ8sQt/lLn+ilDpXcUp09CmHK2IuN8C6fTmlWuBqvfNzvrGIWwrrpMeounbJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8rVpUDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8tR2jPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BBKNFe2539697
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DIkkL9L1E2rTuvT0LXtiLimUzQXYRbkaRP0qfbLoCSQ=; b=o8rVpUDT23091taD
	CxSPbcM0PXQLmAScQNtScKLoBTkvU/M5A9yx6Ywxc9TtkkIAb+KddNkgtzfnSX86
	egRjNCj2ZGpv6q2Btihl24CmBUdocnDctkWc9ce4Xqj0zB/l+o3YNCXKPX2bQjXp
	+MpmqEmEJS13irmtQZHfzVcbPibdtwDlVAyI7a6182WM35fg3YxhM2FJr/NQm+M7
	LqKZUpr24neUX1lGaa9pOW/R5hDngS0ZkL6FEpPUhQDXZ0pKbvLT6LcAN5rLESJx
	ApBQESs1SQ7H8ENYB5NHBkCUF1Liu6KpugzVJHvppFp7Z7je9tHZyiwk1eEzjh25
	v32htQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqtgya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2194e266aso48834185a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146564; x=1768751364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIkkL9L1E2rTuvT0LXtiLimUzQXYRbkaRP0qfbLoCSQ=;
        b=P8tR2jPf2Ah+ANL4xeUAP8TtHw26xGhuxzjH7Z3xTXhaDAoVmzIyazPJS4Y+jEFUUg
         73rxCwmdnoIkR3AoYgJjjMEX50ivTKtTEeWMt/Ba2ceeqjS1BYO8b1lfUF5KWeRhj5/p
         RlU7tpT1qHBbWNPciA+afsEmroYoLHBut6z9RjOCsy8Njd2Kz+qu0Cvnjk7EUpqQAN3N
         hwzqn9E+F2KqQ9lifahyxQ8PH9xknSI5kXI91Y4kDNpNwpK1gfs/YedkhmxoP3o2xR8a
         jfrskfgtxcYbWa2gsiRPTX4KwTlhHEspQ5OAqUnla6uihfCYVi7dRIx5lx2qQFknN2hQ
         73eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146564; x=1768751364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DIkkL9L1E2rTuvT0LXtiLimUzQXYRbkaRP0qfbLoCSQ=;
        b=athmOJzndE/z0UKJpt/G2qOdKvCDR4bacxK8YkrICL40QL8jfRcMVnzK/MXaMNJm8d
         Cy93X7O8bobzceNoJP4pXnOZTN87Wpsdnub8CG2vSFRqd608k3h+gzpTUTZ4SBQlciaM
         N4ahE4781dU/3N1mNhNh8GyZVc+mCBzS+uL9m8ths8mdmN8StqvC5jScwSzoRYBIm6rU
         PdiwBU4CdhqXsYOnopAEFx15oyv/8CSdJx+wYSFXathWiDBNSHe5WQ+NWu1xKQTdQmBK
         grsgEZpsKJDRjbWA95fF9HLwm09S41jeCveWVWIWyF6ccQMsPz4v4Me4C0U0Bq5oAUuG
         j5pw==
X-Forwarded-Encrypted: i=1; AJvYcCWKUyZvu1OB5DBNvV8ROPtU01O33EaSe6jji7ds8tCy4HQfpo89D+0/0hm5cRIBB/Yb65yan9nKmqT7vxHc@vger.kernel.org
X-Gm-Message-State: AOJu0YwneGPNfB52jwQsKDOZTVzJ8DDAnz+hDfjqzbXfzfRpCh831tw3
	vaDvl2q4E0HLMqrLczjVHiqOlSUYOE51G1rCFNmtK7010ch8LvVa+J5uNg+7VVogej4hbvnsiiG
	brMKios9PPzJG4BS5UDsZ7tw5602dh1LNazMm8KWzBVYaq0Z748lZbPHgnFsD7m1TFOeD
X-Gm-Gg: AY/fxX6vxCyAxnqTiw8B5fQkXb+W06x4eizzyh0UsVkitWUQYhikNLhC3p9tXG755GZ
	LA5iMaA06xgAnDRvD/emCCpHGGgw6XtLRZg7OXl6Q2NQER9eucMOPDWAzZGahDAyg/Tc3PZAhI1
	4rhz0NAib1NgwOQV6hk63ibHv952rkDTai7Ij46ebmmhzbuTKJClLZncndO34jo2UJU8WJR4gjz
	JOwWnxCQvW1soqxx29bNNi1pPcFIUVQNBCB7X3rAwo1N0MibuhgOe+snbeKNiqkNgWMAbJIxrfO
	y0lM91eYwNP/VG8hT7IJz3wZmieCSdxVXp6rmGOTeL2+f9rT7luY6hlrr1q9gsMYn7BLUHQ8+sA
	Jb/Dllaqwo2EEaypZc/MfCQ1pSuIQqrY2IA==
X-Received: by 2002:a05:620a:4109:b0:8c3:7e55:cdd9 with SMTP id af79cd13be357-8c38941da4dmr2027591185a.76.1768146563881;
        Sun, 11 Jan 2026 07:49:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFNBgY7u2Bn1+pG1AAmi0xpAxfXOFt0zx05EVQh5yuC5ZITtS2ciFKzMrl7XJZAxW/oGrEzA==
X-Received: by 2002:a05:620a:4109:b0:8c3:7e55:cdd9 with SMTP id af79cd13be357-8c38941da4dmr2027588585a.76.1768146563334;
        Sun, 11 Jan 2026 07:49:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1637163166b.57.2026.01.11.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:49:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:49:00 +0100
Subject: [PATCH RESEND v3 03/11] dt-bindings: bluetooth: qcom,qca6390-bt:
 Split to separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-dt-bindings-qcom-bluetooth-v3-3-95e286de1da1@oss.qualcomm.com>
References: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
In-Reply-To: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Y5eeW2zn3FKkukeVggq85DPa7zs15vkyJ/66vVtlOs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8Z1GV0RRtgQYX6R5YJMSG8AOl7nUdOWL5HtQ
 jbsOWdmPHOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPGdQAKCRDBN2bmhouD
 1+KrEACPRrXhg9TbopY27dj4j7o1qjrCo2VZqJBz/oxTIVaxAJdf8dT7qMpfcRer/nzdqGdkP1b
 XtYG8fdgK7zLprl/JYkTdyeVc+E57A1sAJS2Qw6zdyhxyNRFQv16A72UM8q8DAB/3GA+avAPcAD
 NvVroWr8zdBEEW5t5oyCBIHrwNV762dA79ROR58pxrEQUDaOwBSRjiqv50cLGYqIqH9smreui4s
 TH63vZQlXn89XIUiGpM1F7VJTxayW4Y+qP/wxeTpg9PPhJiqFl21uX0V6E3+HeSU/ntXGzNaPNU
 lb3KrgnbJcRBOAjcbEoXlu6n7rlpWM4IzFhyM3f7Euo87s2Ipec4jfIOqdsijcopi/ksXMQO0T1
 fXbVMooz9iEAA1EEQJUwjaJdqOSAyabs3HjDSq8uokyepVHr++ZR32yDBo8PmaM9T5gbnXeJWKQ
 djJnNKpWW5UOWr++P8zX78zsxF0j/xjnIfPDT+zOMsviKDIK5Uj2cg1mmCn/F2dbHrx1nxLs+lu
 o87BPZIHY05nG0BxuTvN6Se/1UXOHkIuvwEDwzC2DqgLHgWFpZAr2yrvNAbyzDJJjNgX1pepsvj
 CMVdaF2cLA2P/eAtpibMRftEy4meT2iX8SrGTneM7/SY5nXDQZFAtGPKn9JZyBsq+N2XIs3i+aQ
 e5hqA453+b0HuwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: aJ9_oalyX2Nu1swPylVUVD2q0ga5EiLb
X-Proofpoint-GUID: aJ9_oalyX2Nu1swPylVUVD2q0ga5EiLb
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=6963c684 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NmeI-4ZN_4R3alAclVcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX3qfTto6/GGUT
 Te84NSo9kXOXgprIRpdpr3gQefL2OrJOX/8iGrl81JPgPLxXcdFKuqCrIZqefs1ZM9kU3bjq6wt
 dyboHZ3yBNRpJlU7dWWg/0LfPD3GR7Wd50DqrPgaUrE4gVnLHy+4MYlyBspVNJma+Q/7mf/9jlP
 j/14a3HGQCIhWHiXTBWOFh/DM2kbRmOTTx6TsAy2YABBK5hTG1LPyOKALvu+fMfVfTKEYXkzdAD
 oUH2inZXgj3RvDgm5XDf5qNlYIz4+rF3UsGLOiEI7bazpjtsxUkj73hwtJfmYfxfYqN7fjurv7T
 1NUXi0hgxeVdvcp6ZfQFFmxKWaW9PIjHQM4sGsHkggpieaO5ugS+pFtr9946RTvBXuzgrTpG2LQ
 t8vmPCzaQ6aBnrvKz1ADxPIH9tVF88mZiJSMzSEMTv2ZxO6XtL25mY98KFL6nDdWSew33ktjyn+
 ylZyzBpY3kHZRK/fP5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,qca6390-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,qca6390-bt.yaml    | 64 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 15 -----
 2 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qca6390-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca6390-bt.yaml
new file mode 100644
index 000000000000..cffbc9e61cd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca6390-bt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qca6390-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA6390 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca6390-bt
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddbtcmx-supply:
+    description: VDD_BT_CMX supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p7-supply:
+    description: VDD_RFA_1P7 supply regulator handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+required:
+  - compatible
+  - vddaon-supply
+  - vddbtcmx-supply
+  - vddrfa0p8-supply
+  - vddrfa1p2-supply
+  - vddrfa1p7-supply
+  - vddrfacmn-supply
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        bluetooth {
+            compatible = "qcom,qca6390-bt";
+            vddaon-supply = <&vreg_pmu_aon_0p59>;
+            vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+            vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+            vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+            vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index dba867ef3d06..ac58d6598091 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -21,7 +21,6 @@ properties:
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
-      - qcom,qca6390-bt
       - qcom,wcn6750-bt
       - qcom,wcn6855-bt
       - qcom,wcn7850-bt
@@ -181,20 +180,6 @@ allOf:
         - vddrfa0p8-supply
         - vddrfa1p2-supply
         - vddrfa1p8-supply
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qca6390-bt
-    then:
-      required:
-        - vddrfacmn-supply
-        - vddaon-supply
-        - vddbtcmx-supply
-        - vddrfa0p8-supply
-        - vddrfa1p2-supply
-        - vddrfa1p7-supply
 
 examples:
   - |

-- 
2.51.0


