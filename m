Return-Path: <linux-arm-msm+bounces-88388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E532D0F5A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0164C306EAC7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0826234C9AB;
	Sun, 11 Jan 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYYkOcFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hwt8H/2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D3834C989
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146571; cv=none; b=cas4d6kwjUePwuE832rWz0swSG1dS8gkKUNnCtL2eqPtWayYgMH9mmDyZUCItjduBlVrMz3dOUlYoPAAgHF+qG91iaeyTG83IPljurSsr1wVa4YMFp5ZY97DBZaXc3j1vwxbbkeqC8s2X3WJLZ69d4iO4tGfpuCHunzzc0QOmI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146571; c=relaxed/simple;
	bh=mHst1xBgwj9bMH/OqbKZWAP/xstAnsimC+MNikWEiXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtslTMgJKQ4yCxFUuxz1sen/6O+wkMRimjcd4w/BsQOxjyj565ieYZcIIaEI1eN5/vo7Hbq4dpOqbu0BTbH9R98uU+vxnhRdyi2rmnXqlgcAjfg7Fv2xW4FSr4rXEko0Jwk5Z0g3z7kc8rxRLMkqtjhI9ngBjqvStBnsq/8BDdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYYkOcFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hwt8H/2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B2UGvv1115991
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMBABCfjZZdy8kTHYUiqUA1B/gN5Te+ej1QV+yVBeC0=; b=OYYkOcFHY3QRASjF
	fzYeTdVUVpPvsNVsKUMQOGWZvzxauJx587aeYGvjFHUyVldVs4ABijXr0LYYYhvg
	BJKByPTaC1qPEKvp3yoLffbUo9PqMWyOktvMxw+6dfYdZTaiISYEhntEGVNCzpsa
	K5vLw001WfwvHESGRx4rusxON1/srJbHmshKX17punltHIUUbfqrfwrBAs/FK7OK
	s+4GDIYSOnL2Aa92wzmn0DgVOjXeBaBGSwvxWhQI1hKrDHg5vqz6nvdC4UFclDSD
	/pi8rhHCELIWU3z5Cnk7ICcmOgGfPfBHrtz7ZtgkT6y3FhQ93kA7N+6LUFBUTcnQ
	PsWRRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e2es8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so1450270785a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146562; x=1768751362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMBABCfjZZdy8kTHYUiqUA1B/gN5Te+ej1QV+yVBeC0=;
        b=Hwt8H/2SrlkfPPYN/NGvSTbUoGAswxVDzA2Awau282RKx4dn0EHijNl91cy8hUj/+H
         fhl581aLWnS8cuJkysEV+PwvMFu/jXT1IBkeRVUwKSQHTTKRSagf98Bf5sKX/vZf6+F8
         0Xb7re6aOFf5KpNaeCGv9lTwMwNuKRnYxrV8rD9EfJVF2wM+0VYkrSmgb48UcvfOHStY
         EufuxkedPmWXsT71RZv8dLpJrTIrhyUS5gGVtgnvTuy8wIwzwvPNrolw+QuryhP04BTF
         CFpuzgpGz4z5IYn0YH/hTbJYvTs+Hclh5ODUFTV5INbVvjFavo3ul6RiGDwLNTMt3CXq
         yWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146562; x=1768751362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMBABCfjZZdy8kTHYUiqUA1B/gN5Te+ej1QV+yVBeC0=;
        b=wjBd7/vtPZY9duTrn2ZCWZaVb4YVsKWXvI5yYM5afO8g52NIvUAvkCilev51BH14zr
         LROgeMWZ2kATwWEQcG4g0dEvqveSvcXuE+NxU/8evrD80cyyg4HjRb8jN/l+0rGeIcid
         eqvhg/VwEuyR02nMqM/xtU8T+YyXLU8FaT+6H2OyAagoQDz5l7oEMRle0ogGqj4pI2lE
         FYmOFHNMGsUoNB453GeX6s3zhObw51fuA7uFEAooYffTMQ4l1/d7T9d19mEnTJFPCaAR
         S2PCOqV04ymjWtlatEFywcvNG9YQVlkCs2qrCmAV8DPslDWFbXWtVj02Qso4gb1aAqxQ
         RIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUml63aiPoD9BMb4PpfPS6ndFtgS7tbgVyFwzT4JpwnKagzItAl8NQjlNwRnKEgqZDNIJOhLlWKyps7vR6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/26E6bn3gFnidWfLGrlX5Iz5J8rvKcW+NhS562l3L7mMjOnF
	sjv6yFtFX3GzJAroTnc/4j2o3ZbLD0hmsFB+kOad8rtP2Y3d+cbH/z/BqMz8Q6tWz4oMdnXhICa
	9AdkMQeiLglLTzDaynQkarw4QgbkBahmZynNl5cw7JPZPaj+REZqX35+yuytJuUHfQvrW
X-Gm-Gg: AY/fxX472U72d6nwwGvKPzZII7kdPkfUT1qLSbpJ+xp9L0qRgLV/3g49GTN7pTNVuDo
	tVzUlQTJI4ynOO8c1zCPPLic2d6QHY3UjYYUnqvNrV4DDcHqRhA4PP3QFTReWApGeU/Nw7FcMKE
	INOvX8Pt/FipCkbAI11kssA/i+foqZl/XNQJzVmj87zLn+qvkZVWBd62C1RVIEZOdb4KL8yi1QY
	g/VOPsZ0v18tX1Ib+nNU2lVAWzTGbgo/a1ueDHr94aC8q4VTqRV9PojK8D+fsU2myjWcEZVGfO7
	c5ASkRqzB0DtjVUfE65rzFFpW4gK7C+axQd1HdVSQwKvX9g4gsDOnSeUP2n5Gj0GFhX2gMuyP0T
	Lat78qfLxw444gAaMZ4NsUFDAdx29/frVhQ==
X-Received: by 2002:a05:620a:2550:b0:8b2:e565:50b5 with SMTP id af79cd13be357-8c3894033ecmr1921803785a.60.1768146562291;
        Sun, 11 Jan 2026 07:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB0QTEGjUOoFQ3RUopmUys2jM8NWc1FQpoDTWIqEEuTv0offj8qGT/Axae+4hZ6kSsT9vl6g==
X-Received: by 2002:a05:620a:2550:b0:8b2:e565:50b5 with SMTP id af79cd13be357-8c3894033ecmr1921801385a.60.1768146561822;
        Sun, 11 Jan 2026 07:49:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1637163166b.57.2026.01.11.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:49:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:48:59 +0100
Subject: [PATCH RESEND v3 02/11] dt-bindings: bluetooth: qcom,qca9377-bt:
 Split to separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-dt-bindings-qcom-bluetooth-v3-2-95e286de1da1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3138;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mHst1xBgwj9bMH/OqbKZWAP/xstAnsimC+MNikWEiXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8Z07wWXCgZjK1hRpGpd8hmAyToJnRhp78WeU
 43p5ZdOBEmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPGdAAKCRDBN2bmhouD
 14ybD/9CF0XC7PfoV5i8CTLzUiO+ajCDQ8I4vVBsLLelZXdh2Jodyn/k5qZ28x2PzyEn5YlHVMS
 w0ylLyNGm22gvwag0K/+Zla2N6GkALrCM1d+2tHsq3VfWnjb1JDGJJz0ADoTJHQhLAMr7bq4/CZ
 xVsMdsi6FeCsQvU44IRKsSBmxuPgLbStth+JC05soJdGHvXA1KiFTBDTmx6a0FMOadu2RGadQLj
 hy5u32Kw/glfPxIc16/fQiJrbAYACQ2U90iUcJbbtzqiBoEYuc61fXyCF1B3ct8HP8c4aVjqELH
 a7vXnKg0TA/xPE7uyll/9Runuz/v6OfvQeBCQTmp6P3nG3ldp/4EfCWRt1SU2HiXEqEA5p9OKGh
 VdXdSrwU2B9U5F3FvH03W8EPlJP9ao2wA2gF9mdUxlfruGG6ZrRt17B8aiFzlaJKmW42j9PIyHA
 /4gh+/h8/SAa1Py0MBXiQwC2245R3EzMYFaezj5rfhjELWeeZl79uSfk1XDgiIeNHDw5mOpVbHe
 wBYzxr64huch9BYcesbsEEWUekdKbNgdKWDYmLLKQ6XYaL2P/RsJPbN6foHjHa48qFWD9d3xxdu
 xwLdWkbqNrnYxauj/R7XTf/2tZIr3Iu+txiA43VVtj0R4tFhvX59JGLNoFGO6AhVuUWf4OdzVpJ
 5I5NjHZQ7emDv8w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: qupcOPzqpYofx9Pi9RZW0L_5RPrh4cWt
X-Proofpoint-ORIG-GUID: qupcOPzqpYofx9Pi9RZW0L_5RPrh4cWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfXwXDrYaC5hizf
 BdhbqrgKBID+cemglYElR2rhIXbTaqS7v9nxJFSflOGj7hiaV6KQmrYI3AFuiJBcnHlsqN9lX1z
 XbT6sNreJE42y9t9px+nY6tspTjwNEfUzWR7wZ/r4Ct1Q0wD7BUcBa5BXT/5aQyJqXD8V9hhO6D
 R5P4q13sdV4jkGlUd2bZfVMGwmsazzZaCciRol3rfBsqVqX42XDjLKNmaKlgCduhkCz+D0EmtHW
 oKhqPkxDs23IGZ/Ycm/OBnGy9PmObAXiX1hVSpaU1wh0vxnN7d4kPBvdSk5IOscYkOM625R3qDn
 dyrFD5zAc6lXxbpR/OAjZXbieZBlNAOt6WiK5dp6RFMTI0omoMZBldhjkITkGGjVAJBc1Hf9OOn
 Ky4F/BOozqTNnkQK6dGGIf0AZVYjeXLqgSeZy8wf+jLhkzUpVsj/jcQ9T+OCHzgInBEpccAWEqm
 DfeW16+K1z96JOTP3GA==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6963c682 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NmeI-4ZN_4R3alAclVcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110146

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,qca9377-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Existing binding has incomplete and incorrect list of supplies (e.g.
there is no VDD_XO) and Linux driver does not ask for any, thus keep
this state unchanged.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    | 58 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  1 -
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml
new file mode 100644
index 000000000000..3fe9476c1d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qca9377-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA9377 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca9377-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  enable-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
+
+required:
+  - compatible
+  - clocks
+  - enable-gpios
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,qca9377-bt";
+            clocks = <&rk809 1>;
+            enable-gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+            max-speed = <2000000>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&bt_enable>;
+            vddio-supply = <&vcc_1v8>;
+            vddxo-supply = <&vcc3v3_sys>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 85d10d94700f..dba867ef3d06 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,7 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,qca9377-bt
       - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt

-- 
2.51.0


